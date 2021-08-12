Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34429C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 05:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0CB6101E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 05:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC0CB6101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E3joEkwChdQoadqyWx+/XC1RW4LR/bnzeCCPYQy3wAA=; b=m8KgSInnmJtHRBU9w+zHgzKw16
	RvAl3j9u/eAnnxPcA/OX8jMMoPSa7KzdxXsiH+1hp6M4LoRdyyOSx4IW2WEkxWHa47RK+gbOT4jyY
	cB+0yLKqkyN2LY6rIGS/5mteeW86f1LwFEVPtFvKFyqFQvJQt/rKdJ1JXyveYJfskcrb17dAPhakH
	dLNYnvqnz6K1so4gUQJm8EZkf1+3JwlOgAdld9i8Pd4mHO7l7mYErmWDzvuAw/4ahTHBpnEHRPMHx
	3Omohxyio5nn6RDeYDNp52m0kctgU5aoFXLvnZNV/hrzP+iKTMeaLCc71/F5IdTzq17s7xft0OGDo
	OTxBIKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE3Bg-008geq-3r; Thu, 12 Aug 2021 05:23:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE3Bd-008gdq-Eb
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 05:23:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d1so5801361pll.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 22:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qatbrqDegqmZ0+XHzQ+4gx0yhVxDkAp+fv5tGls4q3I=;
 b=aimghCwh9vSL4Px6zMdUVf3mo1lXg/6Gd8Vw/3AKWsade5m36h3rThJDbDzsTIQbrV
 NXjzGIJB/YohR2b4TjkNOlnPcvm+wPdfaV5G09FPfhDJ/Os7Tc9co90VBQRNulvXA/va
 DmqKWzOPNY5uhMd/+8EuhISnJKpdPv433h8wzN95n06mxtO+R9QNPJeqMUe+e0aJpTnf
 sK+FSkBwpB5aLmot0IA8RbDWBdEAau2/S0PPUneUn2O2HO2hvAPamZlGWvy6JLy4eS5K
 iq4ARlrI7+5rfK3UJFIv5F3rFiPsoc4o4qUYO3/Y79opEdtoan+6yCb+WHURdelH0hp/
 G15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qatbrqDegqmZ0+XHzQ+4gx0yhVxDkAp+fv5tGls4q3I=;
 b=WTEl6doJimPQSHTHji4jO8YXPz9CAryVNBjMUKnuopk4jIctKeGNTvdWilqyNVRlsr
 o6lxRmvrhjI32Fg6CIHjlrL/9rAWVCqB4ck6X0Fqp9govGf5Ol7usZo4ugrOcCfbtg7E
 T5L+ACyZ7MPImNHI8uKrdOE3gbhcgW8O5aCIBdg4nvsa8lIdYf1Fz/oqOFNNlwJwn7SR
 ZGKr7ZKiDe2Lgd7qp0G9uyEaxklWub+sQEhoaAC54+Kn79aDKxXIp7xkl/YenZXEffWB
 jnRlH8Tai+ETBpbUoRkesjXDXU0MexPFS8xwf1P/lGsucKgYQz5xaWhk7sjEBkKIpXuG
 ZbxQ==
X-Gm-Message-State: AOAM531B5DHBlK79yUXxs1Wf96CIh4vJyhZcQE4tGsGtYnq/4Bncw35a
 sXj4VImjfHCoKdoLzYUI1k5J2g==
X-Google-Smtp-Source: ABdhPJzzE9kdJxFxrdvD8weA+y1+kdPfk94xSZIF/eB3RohGlvu/88yy+uZu2owJ2D9IOE8Rx1ByeA==
X-Received: by 2002:aa7:800e:0:b029:3a9:e527:c13 with SMTP id
 j14-20020aa7800e0000b02903a9e5270c13mr2417512pfi.42.1628745803836; 
 Wed, 11 Aug 2021 22:23:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y9sm1631753pgr.10.2021.08.11.22.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 22:23:23 -0700 (PDT)
Date: Wed, 11 Aug 2021 22:23:23 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Aug 2021 18:42:22 PDT (-0700)
Subject: Re: [PATCH] riscv: kexec: do not add '-mno-relax' flag if compiler
 doesn't support it
In-Reply-To: <20210722021715.127066-1-changbin.du@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 changbin.du@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: changbin.du@gmail.com
Message-ID: <mhng-d9c7d4ea-1842-41c9-90f0-a7324b883689@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_222325_580594_58DB0A28 
X-CRM114-Status: GOOD (  17.53  )
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

On Wed, 21 Jul 2021 19:17:15 PDT (-0700), changbin.du@gmail.com wrote:
> The RISC-V special option '-mno-relax' which to disable linker relaxations
> is supported by GCC8+. For GCC7 and lower versions do not support this
> option.

I would not trust GCC 7 on RISC-V, that was a long time ago and there's 
been a lot fixed since then.

>
> Fixes: fba8a8674f ("RISC-V: Add kexec support")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index d3081e4d9600..3397ddac1a30 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -11,7 +11,7 @@ endif
>  CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
>
>  ifdef CONFIG_KEXEC
> -AFLAGS_kexec_relocate.o := -mcmodel=medany -mno-relax
> +AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
>  endif
>
>  extra-y += head.o

This is on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
