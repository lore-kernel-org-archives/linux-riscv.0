Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E27C5519F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 00:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF3720B80
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 00:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/qO3YAb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CCoUOKAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF3720B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4/yFRgGqMmMVYlS3MfvvPybxGXckMZ/fe0sKexBtSJY=; b=R/qO3YAb16ite9BgFpIHg5M8T
	OOvs6KPPObDdQdY1slWO6ZXal5qFAdnpIfbam5ZaXw3nO90CF05yI4iIZQG/gKDBcxgLh5T351cDP
	53AE1EMv3bsXLrg9ubzZ/TWXeagmnKCl+1rVUcOFqS0IzrDP4nSBf8PXrN1w7wgHusbrz+tX8L6zt
	F1NwKLqw5QWOUDRPgEkYffV2mfQV5vHF9Mpio9FEzfPsm3mCKw316MTk8mAbiILIheR1Ma6b4t3eR
	mwnBg/QfhQBq4n1JhGMt99/mznWZM1ptt3H6aqut2d0iVCnD8OazG4cf5RwoSYX5W4ZKjAAfrPLI2
	QsDS0L6xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdNLG-0004vU-Cm; Fri, 13 Nov 2020 00:53:30 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdNLD-0004uw-Uy
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 00:53:28 +0000
Received: by mail-pg1-x542.google.com with SMTP id w4so5669055pgg.13
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 16:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpvnKSrVoabXQhGOD0rhoXlbZEbSnpbz56+dy5+JM3c=;
 b=CCoUOKAEuP3dgQeDYy5FUfj2zEbtK8AtB9vlZlMHZ3QyqTAvhQOLQ6DTjHAbwciNKm
 b8KAhm0DIozDlTZ1ph4G9pklcyTMZOIDQBlz+cUogtjeetIlz5UoNRJiTEHqrmS+uDVh
 Cv5PjEmZmR4PjA/vyFg4r2zYvt9lJqDBD2GhuunxqgIGS/ZyzQkEYlZUZAZ6ihH2zVS8
 1BBn0/VKet6kSgLWrPYwfaRTa1hlr5LsDiI5es005tOYGmPE7jrBhrY4Ge5R/5FFzV8F
 4SNy6Xlv7Qdhg6qtQCDvdR7zhcSe12BiW4X+7sPYF/LqEem4bCoEROdRYJyP5Y1BAHc7
 tRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpvnKSrVoabXQhGOD0rhoXlbZEbSnpbz56+dy5+JM3c=;
 b=OG9Kt6WP0PbkqvSskW/ZmYde1bIdj3odLpTnKojQeqZPJ7NeFlTj4Mb4ZTYv/OCOfB
 SMvza5p8bMK80EiGMQTwbOUkltcMLbt3iW6RFAUW5N3VU/XXG6om6KfKJODkDEflIKUa
 8Gda5w9urWfgR3t6Pz2c6FY757PJGA2BTOGTAo4nANHhkVLKeW+26lCp1Pb9Xjuqicxd
 6kN3gaOQ5UMuqTGW5jZVthw1a5u4/WP1dBhSmw5QJnWFV1NWk0edHiIkGayEnMTXQdDL
 cJggA8ovfK2lBvhtDV7rVqMsZVL63qb7SzNrFMOUf9AkfulidargRVxhWTHtp6feNbZ6
 yf5A==
X-Gm-Message-State: AOAM530KUT2+QUTRkLhbwDQQ5sCXqp/+Cq1Sht/BuD0T/EFw71aS43wW
 RMJDlH8CztKZJwZ0vq5V/4HfKujtjgGjNAEfS73YxX/9t2JpEg==
X-Google-Smtp-Source: ABdhPJxTBlrZxQlw0dn4qABCTcVsaWoJtRrne8IIUHKppzrewlebxbyEvHPJcP8m5PzSvUKZ8s8PbXlR3tasMKpvzvQ=
X-Received: by 2002:a17:90b:110b:: with SMTP id
 gi11mr491437pjb.25.1605228805456; 
 Thu, 12 Nov 2020 16:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20201108203737.94270-1-natechancellor@gmail.com>
In-Reply-To: <20201108203737.94270-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Nov 2020 16:53:14 -0800
Message-ID: <CAKwvOd=P2yFxkAXh9TUpJ=D5=jNnxnx7O5Nr3iTDeqV40UA19A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Explicitly specify the build id style in vDSO
 Makefile again
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_195328_008165_9874D11A 
X-CRM114-Status: GOOD (  20.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Bill Wendling <morbo@google.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 8, 2020 at 12:37 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Commit a96843372331 ("kbuild: explicitly specify the build id style")
> explicitly set the build ID style to SHA1. Commit c2c81bb2f691 ("RISC-V:
> Fix the VDSO symbol generaton for binutils-2.35+") undid this change,
> likely unintentionally.
>
> Restore it so that the build ID style stays consistent across the tree
> regardless of linker.
>
> Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the fixup!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

(I'm curious what --build-id linker flag does, and what kind of spooky
bugs that led to a96843372331?)

> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index cb8f9e4cfcbf..0cfd6da784f8 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -44,7 +44,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>         $(call if_changed,vdsold)
>  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> -       -Wl,--build-id -Wl,--hash-style=both
> +       -Wl,--build-id=sha1 -Wl,--hash-style=both
>
>  # We also create a special relocatable object that should mirror the symbol
>  # table and layout of the linked DSO. With ld --just-symbols we can then
>
> base-commit: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c
> --
> 2.29.2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201108203737.94270-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
