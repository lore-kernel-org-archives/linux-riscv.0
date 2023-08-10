Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272ADC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp8/KuIh9N0f6nkFKwYUxBfVOmG7GrRvIuk6T7hXIOg=; b=Dq3PVyaxx5EF0y
	P9vcyTVu5t87zDeLlcLe318Drw0d74+2YMP0Ddl/PaV4R/Zivut4l1tXwcWLzJ463IZoBGhHTpSA7
	zcvU08yUStr4V090Hg7u3WsYETAwf0p0m+Aleslh3gwp9AHklTe9EkG24+QojFP+env4pKb2OafWG
	3me+yO9IcndSByhkEBnvo8mBktIO3YVi7AHNVNubq9IeVN2HOvo4acyziQfBUCqwp/7pmaSuYrGFq
	/j2S4/DbmrOH2bmnIp9atGG7NlD1Ih1WVaj9oLFvLrJmS1IiXcnW2DRLJKDyJDxHjAocaaFx4dTno
	39N9QlhpnVgkmMYS95TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa3-008ZxM-0l;
	Thu, 10 Aug 2023 19:44:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa0-008ZwB-1O
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 19:44:22 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686b9964ae2so1013811b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691696658; x=1692301458;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+FbpAtHPUABM4eAiy3YPzIyaKzeCCm/09lBqGQ4yV8=;
        b=Yk4TJt50lDbjVId45AC5YtKAuY6cRDJE+BO8A/AFC9hXEQXQTN2Qs3C7KDj5/flxXf
         gJfO+XZ89726FWVAYt86Wy2r3TKOFSitBHyyEaadHYDzfYi6m3QMO09GX7/MPsSalRGH
         MFZTu+LF81IYl6IgyBrk1ywpkpvIYIw1GZXO6sPvoBBL2Urb4xondmWLWryVbtTVzQxb
         1XL5p2rzl4QlNKgec32nV3YRJfn2Goi9eHMYEc1q0pO+ZlV6dIuNBNPy8JbFnHWMW5Ha
         7sG1c1aGvfrJZ8wDn4h3btd2qWaLAYevZbkmrSXmXDU1waqh2ASWbGf/ZvQmPHf8ubVl
         IA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691696658; x=1692301458;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+FbpAtHPUABM4eAiy3YPzIyaKzeCCm/09lBqGQ4yV8=;
        b=Hn+sU6sMQLLWpB3thYJdDusBmJPMceOcY+o7ruPMJghCPR3rCNu8mqanTPqavrZcXS
         3jfGL16eYPnOrbNicEgrAN+nB8L0UvNkOKeG8ebuXEb12Ns3YRVbWRRF4rBlNQhDnY54
         IcVjVDClYXjJwT1+hOm8ZCHToEw5fQWqG7rq3VKPOc9UVhPu7RWRwlFB5+P/g/4P5chS
         kAWV36dGBCCkrmIbpP4KN29mNFfM/yPeBnXnidVaOQjVK2ew6S1ggUrak8+WHMg2tLO6
         9xmFocTaSkXlKAawi9tZyi5Kol5BpZDJRrtUeVU5KRdk4YY8lzkGdBxm7XAkhOuCHbsc
         cikA==
X-Gm-Message-State: AOJu0Yw/eKlb3ssIlwsxnmE8guwrJNzbEAFFjEDJK40wANavFuYSLGsu
	vZRKjz3k322+XLSr9pFkNTjjPLBbpYTbykHUuR8=
X-Google-Smtp-Source: AGHT+IHwQJyy3tTIOLcii0QzFTx0UFblIsQi/LSCVJjWL9ha9IVmDEK7kqFVshdhgyQVfYwH3WLrGQ==
X-Received: by 2002:a05:6a00:22d4:b0:687:2be1:e335 with SMTP id f20-20020a056a0022d400b006872be1e335mr3854943pfj.2.1691696658225;
        Thu, 10 Aug 2023 12:44:18 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n25-20020aa79059000000b00682a908949bsm1725479pfo.92.2023.08.10.12.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:44:17 -0700 (PDT)
In-Reply-To: <20230803042738.5937-1-parri.andrea@gmail.com>
References: <20230803042738.5937-1-parri.andrea@gmail.com>
Subject: Re: [PATCH v2] riscv,mmio: Fix readX()-to-delay() ordering
Message-Id: <169169664358.3729.13203537465035049812.b4-ty@rivosinc.com>
Date: Thu, 10 Aug 2023 12:44:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Andrea Parri <parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_124420_656720_D25CDA5D 
X-CRM114-Status: UNSURE (   8.08  )
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


On Thu, 03 Aug 2023 06:27:38 +0200, Andrea Parri wrote:
> Section 2.1 of the Platform Specification [1] states:
> 
>   Unless otherwise specified by a given I/O device, I/O devices are on
>   ordering channel 0 (i.e., they are point-to-point strongly ordered).
> 
> which is not sufficient to guarantee that a readX() by a hart completes
> before a subsequent delay() on the same hart (cf. memory-barriers.txt,
> "Kernel I/O barrier effects").
> 
> [...]

Applied, thanks!

[1/1] riscv,mmio: Fix readX()-to-delay() ordering
      https://git.kernel.org/palmer/c/4eb2eb1b4c0e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
