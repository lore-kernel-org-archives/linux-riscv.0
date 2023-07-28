Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8AFC001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYPLCI5+ggcXrtOIixO3SktKGIqtiGZx5Si/RHs1DUM=; b=NoymZe6gei+xeH
	bORhyE++o99p+oBb+h6VE0fg4IOknBU74bRYxWNCEsv50Lr9cgrJ6BOiUDhX4JgOQdfVnhuvHUG2p
	jISjt43K7bakxpQMGDGBVKelf1zDln7iTwLFl+RIHlkDKJ9bwwd5Az/bscx98aFdUr3P6FuWVX525
	0RObyb3VegEcSCIrVRT3jzUma/R7YF1q4m0Ec2JemMbm4enpL66BTELeex9PafICqayBl9fscCFGw
	2keQrw1QqofDLDR9BNgCco88drVJShN70XbLKzEbksU3WE26hvv/hqKhyQnX1mgCJOQiwzjXWFhP2
	NYChFc3URm4PBpA9Db+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN3Y-003TDs-0c;
	Fri, 28 Jul 2023 12:58:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN3W-003TCy-0U
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 12:58:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so4357220a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690549132; x=1691153932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqTFgoGmST1AJKGLh5DBCmCaz66xwOB/BVZ5Tjzguj0=;
        b=H36iKz861flkEQ1P3kKezzIhgeKJ6aRNgNSEl8u2pDIxhM/FCMYwHU3Ln2TPUPV5EF
         USA6zCNSP0NpFFrx72jAWekAJCBl+k5NbfqI0PCEkSbyhZPmYEnMdwAJezdwBXZ/Fh2c
         VCnGnaBEsTUJN0DzPnm3xkGLxyOB+xnhXtq1834PEFUjuyHOv+d5GZSqXL36LmW/dmbI
         eo+ZXlAcgH1wF4r2AQciR8UicKkt4AO0UgPZjIgbrJbN1GsQzaQiKF5Fbnbhxa4xOi+R
         KBIR64gcHRkLwwqryb8ITtXS/nT7/lNCQDlYf+8y5qJt0UbR/ImCByerB5vdbNjHw+ft
         4qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549132; x=1691153932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqTFgoGmST1AJKGLh5DBCmCaz66xwOB/BVZ5Tjzguj0=;
        b=adBGoISYCXBrO9VQWK4GSndyzLx5oyZ0bVxo85q9y+P3YQ4iLMgmaG34OeaIOCjpWe
         zAElzp3c1TGEFiQ/0XxQZsCpposuHmeHqn3chTaRRNo4lqh10n3/asHYnSgiZWH3OUpq
         OfVV67/KnpOOj4lJYETp67u+TlDNp0xRl7MiK/7Rp/MNDx6yoz52vpLgesq6QU1au9fm
         0ZCcU8qDn4MeVyZLy1Py2xG9OzM5l9OIyz8DMLCObPoIWb2m8baQCblDIVflHsFGMwdr
         G7rtt0MzZEqdhWj0v9yQkM4z5tA8NwiNlACji50SJe+EydZWTlD+Oj7Snzm1V7Yagao7
         2LVg==
X-Gm-Message-State: ABy/qLYKNCtnHhL9szyK9pC/3IpgMIqZ0rmTUEtiCxTMr7Bk6zOBN7S6
	4G//wHhAyfzBkQL70pEJvfiWzQ==
X-Google-Smtp-Source: APBJJlHsWxL7O1ZC2Lv9RpUJNZzL98uTHxGO8G2yqeXTiimbQT4LHF6Rwp7C+oPZ8pTLJkOe6Fci6w==
X-Received: by 2002:a05:6402:5188:b0:522:28b9:e84c with SMTP id q8-20020a056402518800b0052228b9e84cmr5038088edd.21.1690549132533;
        Fri, 28 Jul 2023 05:58:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051d9ee1c9d3sm1787535edt.84.2023.07.28.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 05:58:52 -0700 (PDT)
Date: Fri, 28 Jul 2023 14:58:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: vdso.lds.S: remove hardcoded 0x800 .text
 start addr
Message-ID: <20230728-628baf3727ffccddae0b0663@orel>
References: <20230726173024.3684-1-jszhang@kernel.org>
 <20230726173024.3684-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726173024.3684-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_055854_189258_672F6F5C 
X-CRM114-Status: GOOD (  22.15  )
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

On Thu, Jul 27, 2023 at 01:30:24AM +0800, Jisheng Zhang wrote:
> I believe the hardcoded 0x800 and related comments come from the long
> history VDSO_TEXT_OFFSET in x86 vdso code, but commit 5b9304933730
> ("x86 vDSO: generate vdso-syms.lds") and commit f6b46ebf904f ("x86
> vDSO: new layout") removes the comment and hard coding for x86.
> 
> Similar as x86 and other arch, riscv doesn't need the rigid layout
> using VDSO_TEXT_OFFSET since it "no longer matters to the kernel".
> so we could remove the hard coding now, and removing it brings a
> small vdso.so and aligns with other architectures.
> 
> Also, having enough separation between data and text is important for
> I-cache, so similar as x86, move .note, .eh_frame_hdr, and .eh_frame
> between .rodata and .text.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 671aa21769bc..cbe2a179331d 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -23,12 +23,8 @@ SECTIONS
>  	.gnu.version_d	: { *(.gnu.version_d) }
>  	.gnu.version_r	: { *(.gnu.version_r) }
>  
> -	.note		: { *(.note.*) }		:text	:note
>  	.dynamic	: { *(.dynamic) }		:text	:dynamic
>  
> -	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
> -	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
> -
>  	.rodata		: {
>  		*(.rodata .rodata.* .gnu.linkonce.r.*)
>  		*(.got.plt) *(.got)
> @@ -37,13 +33,16 @@ SECTIONS
>  		*(.bss .bss.* .gnu.linkonce.b.*)
>  	}
>  
> +	.note		: { *(.note.*) }		:text	:note
> +
> +	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
> +	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
> +
>  	/*
> -	 * This linker script is used both with -r and with -shared.
> -	 * For the layouts to match, we need to skip more than enough
> -	 * space for the dynamic symbol table, etc. If this amount is
> -	 * insufficient, ld -shared will error; simply increase it here.
> +	 * Text is well-separated from actual data: there's plenty of
> +	 * stuff that isn't used at runtime in between.
>  	 */
> -	. = 0x800;
> +	. = ALIGN(16);
>  	.text		: { *(.text .text.*) }		:text
>  
>  	. = ALIGN(4);
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
