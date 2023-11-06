Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93E6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wajDTopR/VlFBW3nRMpirPBr1717dZ9IUrFMk967Kls=; b=0/JrzVAp81uipZfUmB2wDSh1Cd
	+UoJZvZa2eTJxlvjZhRJ49IVqCOwDSC2bm+T8Opqc/5KW5FOiZaS25JKLZTUjHTglrgJFiEmzmH2S
	HFoW3+fD0Uu0glNYtisawsm1RIXgMif9cSkEKgqEq5jEe08CdyTujUyHTcYjeWWOctXj+DtBqeIGI
	Sy7nbGPmiiReoOTTMrmD3glII146+OjsLDMmApZsKsHZUkNJZaDbYg/ckr7P2K+8rkLWZ1gPb/YRD
	46yzELRFaIK6A2JsAt3d2x0fv+Z3u1lyVq1QyM1nj5RLqPHRZbHV7Qwhi87OszVBEktx5Oradm/k7
	94IsokWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r07cd-0001PU-0q;
	Mon, 06 Nov 2023 21:59:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r07cZ-0001OW-38
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 21:59:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6bd73395bceso4026648b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 13:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699307937; x=1699912737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBg0Lkvc3ITtHaKPYKkLVkZ8x1yGuJbEQ60epjmnxsE=;
        b=e/9A4k4B/B7zv36xpHeorUqOi1gHzZw2XpRlRrURmilzajQCqkoxXSn7Fu7zZ0OkBw
         wItXh2ZEM15ye/cvXg8iCpS7aN4ZeazaWurYvOW6s40Cl+UYs+dHr0kSKVejhuhBy+lI
         2v0hzgG80nqbhvAfzyToVrfB0dWBuo0+d3RuwM2AV5c2xQod3EbEHxTL+6Y3SpfY1jf0
         zkv4rVb2Pgr/Tm/BE83Xb1le078ozy3/TXpzG9KhFagmZV3o9C5BI/5G4/Qd9WvnF9vI
         5G0aJ4kE/2vgs7y8FRVT6aO6qUmd25nrlVzaFa8MSvpcVRnTwNOHmwWoMMpmzzPmrajc
         zrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307937; x=1699912737;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBg0Lkvc3ITtHaKPYKkLVkZ8x1yGuJbEQ60epjmnxsE=;
        b=RG1d2E0bImUe7sgMb+RLK+6w8vZZUe375wVAseMs92UdHrGIngAXWfGPWVD2dcoKAS
         U06T6wmAPVFTN0GEiBltbj9Az59HwGAhkzZZmJOV4UwF7Wf6nOStjPgV3gNBpEQckzFe
         NB2LRTVSxbx/RhqjRUIY/WAW1r8x5l1EwiN89IlXuJIsQRE4wLvgPFzZ1izsV9fiVLRs
         GXYiKuVj12/3s+Z0+O8f6lPBBu2OvwR36dqBX9J63rPE/zrjsEPImy0v/fRHwwkfKTuQ
         +tRmT1Y4/0jHq/IKHRBfnLTVxTcWzYZNHdIeCbo1Jt/qKSIZXuSZSmYm3E98a2aE2AMB
         fRxA==
X-Gm-Message-State: AOJu0Yy3F1Fkp2Sru1wkhBft7CWELabKdEHFqS3iRDpWqJAndVTV29v3
	a+26wiDtVrLqJCFv3G1E7A0cfDaEbm7gW7a5KDM=
X-Google-Smtp-Source: AGHT+IG9REg3fYQF+EF4knUe4wjpr3kBUng81WAks8bDMo2cHkuJLiLicsVZOWPXxqcMeQzZjXN9XA==
X-Received: by 2002:a05:6a00:99e:b0:6c3:415a:5c05 with SMTP id u30-20020a056a00099e00b006c3415a5c05mr876270pfg.14.1699307936948;
        Mon, 06 Nov 2023 13:58:56 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ka19-20020a056a00939300b006905f6bfc37sm6038808pfb.31.2023.11.06.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 13:58:56 -0800 (PST)
Date: Mon, 06 Nov 2023 13:58:56 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 13:58:53 PST (-0800)
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
In-Reply-To: <20231031143521.441-1-jszhang@kernel.org>
CC: bigeasy@linutronix.de, tglx@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-fee5ae9b-0e8c-45f0-a1c7-84459fa718ab@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_135900_254642_84AD948B 
X-CRM114-Status: GOOD (  18.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 31 Oct 2023 07:35:19 PDT (-0700), jszhang@kernel.org wrote:
> This series is to add PREEMPT_RT support to riscv. Compared with last
> year's try[1], there are two major changes:
>
> 1. riscv has been converted to Generic Entry. And RT maintainers has
> introduced PREEMPT_AUTO, so its support for riscv as well.
>
> 2. three preparation patches(patch1/2/3 in [1]) has been merged in
> mainline.
>
> Link: https://lore.kernel.org/linux-riscv/20220831175920.2806-1-jszhang@kernel.org/ [1]
>
> Hi @Conor,
>
> IIRC, you reported warnings with LOCKDEP(and DEBUG_ATOMIC_SLEEP?) with
> previous version RT patch, but I tried on c906, c910 platforms and
> can't reproduce the warnings. And Schaffner also tried them and
> didn't reproduce warnings either. So could you please help try
> v6.6-RT + this series again?
>
> Thanks
>
> Since v1:
>  - rebase on v6.6-rt
>  - support the new PREEMPT_AUTO instead of Lazy preempt
>
> Jisheng Zhang (2):
>   riscv: add PREEMPT_AUTO support
>   riscv: allow to enable RT
>
>  arch/riscv/Kconfig                   | 2 ++
>  arch/riscv/include/asm/thread_info.h | 2 ++
>  2 files changed, 4 insertions(+)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

In case you guys wanted to take this.  I'm also happy doing a shared tag 
or something, no rush on my end.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
