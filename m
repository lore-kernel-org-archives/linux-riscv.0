Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C841E98FAC
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAe4xEjqCoGS4lzMBPToltcJnCQKShmbURZ52BaeUdI=; b=vbsB7gyprQA8/R
	dq5Kfigz4JTaJmdS3w5M1onSEcx/RBxLRrOPylWeJDrKE0u+y2D1TWFi/ESZPO8eBub0w+LQ+NUK2
	8J9oPKXGJSxABRj55FbvN4cEZRPG1jAezXwYAKUgh9/uKeFXcCrYWlhA3p419frvgZLRYptSabMcf
	FWFLVfc40fv4a7dAW/DMtMxo55cKxtkDbLVt6wEQuqVwsl/Zsrbq6dqjljtIuCoz7lnkRKfKDIYzX
	+uWTPxp8fpoB1u2U1n/evtugzIm53E8LYRN8pxZ+a9ZxVMtx+RltwmmPonYEeXdEF0manVchyPV6t
	2tJX0O9KlZhhpsxSfV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhVF-00000009hcb-3Uel;
	Thu, 09 Apr 2026 05:00:29 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhVD-00000009hcG-2fGL
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 05:00:28 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2ce22328930so506980eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Apr 2026 22:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775710826; x=1776315626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGFN7oy2QcLt5YxBSj5rTqJ2uRShRfylAwJbgAKWkKc=;
        b=cWpErz9+3s4y5BfQb8mfjjLWE7KyNmo1pOTbHNDRClC7XYpsiTsHgJqJiJS2M7mIF6
         bBczFIcJppf289gACGWKL2aQz/BYFHrZaOpJZGIKWEzB+Ka13RY1xCSTWwlJU4YWwKr+
         /1KrnVoKwwty2eHlUXHPgThMAVi/MiUfm08/DLJUuQlaKZUEtpZOzPu9wtXQz3zPsE9i
         Nwt2k1yO8O5Rwm2IrP45E0fRMlJCn9k4rUJEii5xYv+QF8L6D5G8hLX3/kbJHHoOxQEI
         mXfTj6gJUTzog5iT9SYop8Ij95VEsvHJoTluBBDef4/D4gMHDf+izXs8uTxtI91/a6NH
         RHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775710826; x=1776315626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGFN7oy2QcLt5YxBSj5rTqJ2uRShRfylAwJbgAKWkKc=;
        b=V+enR1y/EVesHDyD6RiDNVe+AkeYkcCKVLE/+hGnLrbCVv5LMtF7r0EeAQlhoRpVkN
         fbGRWlCgE3W9YaDGtb4D9cMT4ca4bNHMGQ6+rDpLkaEJ8l3illf0mY/lDp5gdb2B+fvq
         Jn9nStZBacAbyMffNLVH95L2i3qPkG5VMiH5SqgGubKgndSK6TdrcC4XNjI7o24ZpNG5
         1JPdqmgyM+Z36vZZ1fdhNAdaV21HGVo/eWrECkqK911W18MJwHVIqzst8CBidQQtO6Wj
         7Xn17ztq/kfbGCEn1BcTrcvFg6FbSqnku5imPuGYfcqjn0lvV96tL1M9+7wfYtcwR9+3
         KJgA==
X-Forwarded-Encrypted: i=1; AJvYcCXPMj7XirG5XHhsxwMG3Cmoa6CO+FcU2pJelrXidDKEIRyqk2p73/VeGaoV1H2SIpqnhS5FWMD6W4h5cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5F9G1FSDS/9MqXh/FxklVOIVcM46g0+YGE+A3aY1N+whBgquM
	OsXYDB1DSzfryw2zn4UTbw4zFpkdXergwg7oCt4YaEw2TwR+cA5785ph
X-Gm-Gg: AeBDietPxCNiZ1L/nkJoQUGj6I8cFlDjPtyDlpiR9Fv1qtNDqXgonAwsUxynA8L0Kom
	6LVo+waDE99PJfNP61/hC6ldIPdSRDlpeswECLdC35WdFj3kW1prHOOSFOhNv0BceAUUu5M8av6
	qBxElODsBqN5iVLyOsY6NZ5D0f7QdT9D74+tEXDeK3lWgqJfiHcCPrlsHiKPEmIevOcr/O/zPOZ
	R0inB57MMSB+Tl0/z71+gh7C4Qc6RXgfhOdNWG22O1mokky/Ubs4wT9jWXhQDMqqKR6+3Hk7zf7
	LOcBIAPwTKxMnqConStdYa/Ygg3fOwsx6BQxaDOctnRUH8+98xqL8SCaAXB3tKIvovW95+HO5xN
	a9dScsiGo1wYRe/lROTIOhnLlrm5Xz2GLvmIa+oplOyKKGGwM74TKYY+jcxDCfgNcpW7ESJdXuJ
	bZSTEaJCJe710PUz+gXLDgfAj+JlZ/4ZYKIJs3n3v/lg==
X-Received: by 2002:a05:7301:3c9b:b0:2d3:d3f:2429 with SMTP id 5a478bee46e88-2d30d3f2ce0mr3019000eec.0.1775710822267;
        Wed, 08 Apr 2026 22:00:22 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0:8ccf:d575:662c:a402])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm27867050eec.26.2026.04.08.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 22:00:21 -0700 (PDT)
Date: Wed, 8 Apr 2026 22:00:18 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 6/6] riscv: export symbols needed for riscv32 EFI stub
Message-ID: <20260409050018.GA371560@inky.localdomain>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
 <20260403103338.1122415-7-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403103338.1122415-7-dmantipov@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_220027_701177_BAEF63F1 
X-CRM114-Status: GOOD (  22.62  )
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

On Fri, Apr 03, 2026 at 01:33:38PM +0300, Dmitry Antipov wrote:
> Fix the following link error observed when building EFI-enabled
> kernel with CONFIG_EFI_STUB=y and CONFIG_EFI_GENERIC_STUB=y:
> 
> riscv32-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> __efistub_cmdline.c:(.init.text+0x1f2): undefined reference to `__efistub___ashldi3'
> riscv32-linux-gnu-ld: __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> 
> Note: compile (gcc 15.2.1 and clang 21.1.8) tested only.

I attempted to boot this on riscv32 in qemu with u-boot. I used
CONFIG_EFI_ZBOOT to generate vmlinux.efi. With this option enabled,
there is the same undefined reference errors with this patch applied.
I have not found a good way to resolve this issue, so I resorted to
copying the __lshrdi3() implementation over into
drivers/firmware/efi/libstub/riscv.c and that successfully booted with
EFI.

- Charlie

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v9: initial version to join the series
> ---
>  arch/riscv/kernel/image-vars.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 3bd9d06a8b8f..888bb1ddf945 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -32,6 +32,15 @@ __efistub___init_text_end	= __init_text_end;
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
>  
> +#ifdef CONFIG_CC_IS_GCC
> +/*
> + * Double-word integer shifts are used by the library code and so EFI stub as
> + * well. Not needed for clang and please let me know if anyone understands why.
> + */
> +PROVIDE(__efistub___lshrdi3    = __lshrdi3);
> +PROVIDE(__efistub___ashldi3    = __ashldi3);
> +#endif /* CONFIG_CC_IS_GCC */
> +
>  #endif
>  
>  #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
