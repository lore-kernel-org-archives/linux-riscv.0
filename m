Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96B2C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5aOgGflwyxyokj63ni+AxWQ3RBY565BAgEMspdyQLE=; b=UT2kpyuAA9MqF4
	2w0pF+gVDVVOfMAF1HCb0v8r9IxfCkfALn4TC0wXFL2CAkr5UYteKStpHJPGufhIfPFodPshTJIpK
	j1xUvzFLaMLlmt7ilm7vYIkCTWy7ktUQ4rK4x0cIAY+cUTaSc492YT1qnYmGTpx35isuVy2+2JeI+
	PoNKuEvWA2H1t2T3THmu0cUKqVqDzLTtmVG+5U/S3GVTG3U9M0Go+vv2pQIv5V5BRdQvx7lyr29bK
	kbTbTpzbsJwJFFLdOlj5AmQtS6oUe3DIJBA2LmAtndz979F3sGOEI/2+rq46IsDmJ+cPSsOJB09+t
	mOp5d9e+egAEN4Pzvz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMiA-0071ua-G4; Thu, 08 Sep 2022 18:57:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMi8-0071mt-L4
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:57:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id c198so8984603pfc.13
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Pm28BmGQbrW5Gi0MeI52+kjIwgWThKQThYJFme0LBgA=;
        b=fBSZPfGc/DVDWJvkB24mLjrwq2DPhyoU3WiqW9rmLQu8Cm9UMsp5TxezenEhz1eClA
         0Xe2hCH07b9SOO89K4rSo/x91qCANkwordHm3BWHzPjnNKDVEn6fCSPsHQXLKKc/v+J+
         1peBSLTKnwgAM4Z8Ucy0A8+mmcTo8dTvvXrI3rgkZG8kvkPnXeOdASCRR7Css1igEuq7
         t3RVbfRwH83XwGpHxj7Ylt4qT/ZOiBOJbc4nTPgg+s/JAiESHaHnry42KPXoRVKme8wR
         msgZJnqTDRbBVQklV+Ch2CgbVPDX8zi8fAc8/f2PWPPE5me2juDMWUPP2prjfefMiqBS
         C4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Pm28BmGQbrW5Gi0MeI52+kjIwgWThKQThYJFme0LBgA=;
        b=fKWciKV86SuuORT5djz6u95M9cuaumuQqP6qip3tBOasCPGcgOxR37TnEPpRexr63D
         lkmn/TXAwbLWFGb+Kta44SsBPHVNuoYK0hNVknescSopiyzz/BoRAag2tP3aUwOwdFlt
         k4NZq94yy9m8BzxEuKe2ppDT6mNK1SUzamYfmmenO+Fbbcm20YhnfOiuvoXWj6Us5uZb
         rZbTUYcNy8QCeJ2DV8d2OOSldcyAYeqToA/OLxNfb2mar3abLKtKxG3/sN+VTb2HFndG
         GUuGbmkwQ6tx80cjx2v2CR2Twr2yhvvw7OjedVi4rln7JWojQvsG0DoEwhaSV8ebhREu
         zUcg==
X-Gm-Message-State: ACgBeo1d5AhpeQQq84S2J+Qbe8Iah59EFQ7agt0H3PZN1dqNFtQ3QuLn
	dP+8xaY+JfJm7MGfbI1yaB5dB7oOO+bbeAa/zQM=
X-Google-Smtp-Source: AA6agR4pgBZYnKG3vwyCLaggnelUQXBntY88YO+ElYymgdXYZ4p55XxyCTzF0I0V4JOhd50PbXV7j0iDDcsQC+A0g1c=
X-Received: by 2002:a63:5d4e:0:b0:41d:2966:74e7 with SMTP id
 o14-20020a635d4e000000b0041d296674e7mr8860484pgm.526.1662663427960; Thu, 08
 Sep 2022 11:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com> <20220908185006.1212126-1-abrestic@rivosinc.com>
In-Reply-To: <20220908185006.1212126-1-abrestic@rivosinc.com>
From: SS JieJi <c141028@gmail.com>
Date: Fri, 9 Sep 2022 02:56:57 +0800
Message-ID: <CANaf2sf=W=X0aEpj5haN3ns3XVqZt2si+Q=xFdhaK6GwNR7Tnw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Celeste Liu <coelacanthus@outlook.com>, 
	dram <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_115712_727381_41D8DB0E 
X-CRM114-Status: UNSURE (   6.57  )
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

The v2 patch looks great,
> -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> -               return -EINVAL;
> -
This also removes the check for --x pages, which used to be present in
previous versions (before the submission of the to-be-reverted patch).
Is this intended? Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
