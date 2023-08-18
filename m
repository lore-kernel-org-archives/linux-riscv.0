Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B8BC678DC
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dvRNuWbre6meTDQ2xWG3qArb0vqRcWG5wENV4tN2OKY=; b=XnJAWc/gxs1JUe
	TBHmQyVfW4xr9xI59QSFVwrWx5WrD9tcqxskRwm0Wa2Dhr7ZF6FRyCPjFgQ3WvYRK3SI4z5auoPRs
	rf2VK4ZXmNuotplJCY1UESS5ZEgodjmwNQ4cdlajOIXpTfliwpSxO0SVrg3a2mDlMLn2/E/Xtwbzo
	dCHz1TnX5b7DILRJkvkCI3clelxnbpj78o94sIvR1DLKgeYe7S4ZGxoa/LcsRBIVFXr/umxWThpOD
	g5brOLtHMfiJcG3NeFab5eYAbn4LpXlpJx1L2mAW2Fq3joEKaIndGrvShbsOZUcSaUsvHdi6zZHjq
	OSXsPrrnvTjAagJ22Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWucj-007y4l-0f;
	Fri, 18 Aug 2023 08:14:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWucg-007y3G-0C
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 08:14:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1d03e124so70965566b.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692346457; x=1692951257;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bGmlfoBsv84hlbfqJxlX7Gz/ol1KDJpGEn228luPPI=;
        b=e/pSsqt/AiPKDRQuExczBM/KFwSX/zoUMyFgznPH+qnJweX6CO7LTAtC0rnz5O1vUt
         E1368b9qwSeIFAMuHJukxt3D5AyHJmQ3ut7G6vBnNZjRKgRhCpzHkMiiKjyxhcGLep3q
         rqTwbD2yXf+Sz6UcqI2TSe6rZVj8dZc8ScKdd1d+8htCroPFFFkiidMrrH0B0ChhIr6E
         /OOQPqm041gYqqKNu3wA0On3bm3nVbrOjbT4Fp3H+iklMrRCfayZ9Z4PhXW2mOOKMFUv
         OEVJGPp/aFaQ15GzP/AlXuxyVLDrFuYjn/9ft2WZqTld31TSdRyxnbYfr4c8S0ZZXdUA
         vHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692346457; x=1692951257;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bGmlfoBsv84hlbfqJxlX7Gz/ol1KDJpGEn228luPPI=;
        b=byPV1ZJ3lCmd41Hec3qHM3bZQMebiEM3OqF+u7k77SYUSvw4hhc8QMcT6ZoZbEfvR2
         z55fwpWrZ+C+acEMgwekF7d62oDG66yjyRkFrRM/qP+o5XKckTxrgk2pwGeYkIZ0qC5G
         oXPSwDBe2IfdEdrLmuSbg+WpTRyFuNo3Sv81IUeTUvrYKGfuYcR1TbBOa46jpsGTV3yt
         nduQp2O2JGdJkLo7uPq7iJ3nTOa8lagGFNCKuyGmEq7KlnJ3dioNc53OE8grCOU6F3UQ
         9/Zo5vj3Lk3HMtOBAmbdiH367Yy45sTl6M4PTf/oDy7qZ9BjgRL+x8cXERPPj/U7bSKj
         kXiQ==
X-Gm-Message-State: AOJu0YyZTK3bF+zpDwrDNiqjJ3A3v6xbk2bYk036ZXdxiTm7J3wdA8al
	1/q55qifmhlncigpmjjkg0hkZoLMqBYZbQ==
X-Google-Smtp-Source: AGHT+IH4zzKKONXlBideDmvuEMsklrC9xaCKbjJgQbsDxMNkz+aNsg83+bR3bLJ+wFrqGL/aC1G76Q==
X-Received: by 2002:a17:907:2bf5:b0:992:1233:9c45 with SMTP id gv53-20020a1709072bf500b0099212339c45mr1396686ejc.69.1692346456838;
        Fri, 18 Aug 2023 01:14:16 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id qq12-20020a17090720cc00b0099d0c0bb92bsm870993ejb.80.2023.08.18.01.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 01:14:16 -0700 (PDT)
Date: Fri, 18 Aug 2023 10:14:15 +0200
From: Nam Cao <namcaov@gmail.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: where is TASK_TI_KERNEL_SP defined?
Message-ID: <ZN8oV98hs1Kt0KzS@nam-dell>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011422_158938_AE382867 
X-CRM114-Status: UNSURE (   4.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

I'm not sure why but I cannot find the definition of TASK_TI_KERNEL_SP. Can
someone tell me?

Thanks!
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
