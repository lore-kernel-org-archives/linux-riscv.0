Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B53C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1sbVvLHO6rL7Tf+vJYyJcQ8bvpHklnuf47GPuupswwI=; b=n10fQquD+XFnhKEc/GTh5Ni9EX
	waAkRMpS7gx9VeXRyDQKjOKfjwZlagZQsApMSoF73cjUDSFKWqDOH6adcEWTK50WaosJ/tveHniaT
	3JRkucvL/M/quMJ982IPYioaQq0x3ABoXl5OtXdOwytLdvDcTO9vrkp0BbPwLl1g3DFA0E8g50HU6
	WCQWTOrkf4HwSb6x1rautaT5ErXz6A4KaNSgmgM1ZKNrXj6rbjD5GFvISwPbl04EOm2y1h1ZPTg4l
	OpUC6Ph5NARtp6k+nitYkpw7azrfnY7HqmAL1LNwdi4iekejSY2m9WaznQgl2RjqHXocLp1UFAtKw
	tefXyK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGJm-00000007GG9-1g1B;
	Mon, 15 Apr 2024 06:59:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGJh-00000007GDR-1QiR
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:59:51 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F305A411DF
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713164377;
	bh=lKHaDBe06MqDE1Bp/z+A9rd/eujvLw5qYHlN415hVeo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ShuwUXl4uZF81sQMPq5rO8vf87HGUkxMFhn1ED9KcpvJMZjdDoBiBiOEp6tVp7THf
	 yw2Co/wYFWkO1rzlbn6QYIr3Q1NaPS/ZHxwujUg1L1CV5332rukZiFXEjJitkGskTZ
	 7FULOtq93zelyEOO8iZ+YYxx1f3hlI/TeR9jnQbq+8wRVGVsb9dXNh5Ij4GNhHi4tR
	 oGvjDtztJrKxnSO9EQK9ge2lNXRiHG9giGByA6jpRBWUX4Pb545Dhh4QcNZtrmHYsk
	 cNy/sjHILptYYzVjUQVSQalew21qRAg48v+vzC36NMdtmHTcj7NkNgJ60PMsYnuf22
	 4ugT9+asg8RbA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4369017f176so47811201cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713164376; x=1713769176;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKHaDBe06MqDE1Bp/z+A9rd/eujvLw5qYHlN415hVeo=;
        b=K+iYFw0Tc8VS8gS+I89SCKcWwdU0ghIjjBbkFMvMglqzBlS3SVyAmhBUhmJRax9rz/
         P1WGrvymuEpyPUttvlimnw6gFkjiNF59Lhkeh/tOH8aiHNuPKBC9i8CSBTxCxM+mehuM
         XJMvuuN/RRzPPl6UXj0lAyf+UoQBF46S9jPWJ6RurLx1EsmN/ztIu5/2LrFlVJdIjoLS
         i0qUiDFVHj8HTKA+9EHTqFWfI7rSc1Hnmv6QEcSIDwJ2B8rAXi4nL+rjRiYp548Hp3Ii
         tHcUdmtkqfTdhL18AP0qNWDCbY/sdTKd93UZU3UqSitD3xwKVr5FD4cs6zrvdaLeIJWb
         qMOA==
X-Forwarded-Encrypted: i=1; AJvYcCVh4D12sq0CZkh8lkVF+KnpijixxAQs50uNgRbPW3/4FcV3IZXqTaDpWjjDc/vStNPRQ/pfIjon7wWdiJxBBKTSbBX66MtOhf9wvTmLVdYd
X-Gm-Message-State: AOJu0YzEr12/+k4lnu9vbdSyai+xratNkL6+uLce/2cDEdBqwIbCTRgo
	DWhCwYLj0372WTU+GwV4Sl6phify36N79NUTGtTWG2dBTv17d1iZjK5d5yYGzwzTawhq4VkqNgb
	OCCdIDDhUf9Wez4abLvAfbJPf396KIxTVrhvChIJ7fKqwBv/zIDjeL4z3X1GWUert3lPZClt1Kn
	IvI7NH70zBdz3SF3PmcozakC7A84K5MkNg78g4sPKgbsC7q0U65eBMP27S
X-Received: by 2002:a05:622a:130b:b0:435:882c:e9be with SMTP id v11-20020a05622a130b00b00435882ce9bemr15844224qtk.14.1713164376051;
        Sun, 14 Apr 2024 23:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxW3rB/DranE5JdZ+lECe8KDvPGVPq2P08kjcc3eTf6ysUCyRRXXrL6oRK96huBjLRAVu1p7Vjx7lBTN3MIXQ=
X-Received: by 2002:a05:622a:130b:b0:435:882c:e9be with SMTP id
 v11-20020a05622a130b00b00435882ce9bemr15844209qtk.14.1713164375747; Sun, 14
 Apr 2024 23:59:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 14 Apr 2024 23:59:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240414174139.3001175-1-masahiroy@kernel.org>
References: <20240414174139.3001175-1-masahiroy@kernel.org>
Mime-Version: 1.0
Date: Sun, 14 Apr 2024 23:59:35 -0700
Message-ID: <CAJM55Z9x9AYVSqdKZTDXQ4EkJ=dDaA0vnDR4mBQ3+m-MwzdtXQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: buildtar: add comments about inconsistent package generation
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_235949_754621_F5B740B3 
X-CRM114-Status: GOOD (  27.19  )
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

Masahiro Yamada wrote:
> scripts/package/buildtar checks some kernel packages, and copies the
> first image found. This may potentially produce an inconsistent (and
> possibly wrong) package.
>
> For instance, the for-loop for arm64 checks Image.{bz2,gz,lz4,lzma,lzo},
> and vmlinuz.efi, then copies the first image found, which might be a
> stale image.
>
> When CONFIG_EFI_ZBOOT is enabled in the pristine source tree,
> 'make ARCH=arm64 tar-pkg' will build and copy vmlinuz.efi. This is the
> expected behavior.
>
> If you build the kernel with CONFIG_EFI_ZBOOT, Image.gz will be created,
> which will remain in the build directory unless you clean it. Even if
> CONFIG_EFI_ZBOOT is turned on later, 'make ARCH=arm64 tar-pkg' will copy
> stale Image.gz instead of the latest vmlinuz.efi, as Image.gz takes
> precedence over vmlinuz.efi.
>
> In summary, the code "[ -f ... ] && cp" does not consistently produce
> the desired outcome.
>
> The other package scripts are deterministic; scripts/package/mkdebian,
> for example, chooses a copied kernel image based on CONFIG options.
>
> I removed [ -f ... ] checks from x86, alpha, parisc, and the default
> because they have a single kernel image to copy. If it is missing, it
> should be an error.
>
> I did not modify the code for mips, arm64, riscv. Instead, I left some
> comments. Eventually, someone may fix the code, or at the very least,
> it may discourage the copy-pasting of incorrect code.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

Thanks for the patch. I wonder why arm64 and riscv is not just using
KBUILD_IMAGE as the source path of the image to copy like some other
architectures do. In any case:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>
>  scripts/package/buildtar | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 72c91a1b832f..ed8d9b496305 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -53,18 +53,24 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>  #
>  # Install arch-specific kernel image(s)
>  #
> +# Note:
> +#   mips, arm64, and riscv copy the first image found. This may not produce
> +#   the desired outcome because it may pick up a stale file remaining in the
> +#   build tree.
> +#
>  case "${ARCH}" in
>  	x86|i386|x86_64)
> -		[ -f "${objtree}/arch/x86/boot/bzImage" ] && cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> +		cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  		;;
>  	alpha)
> -		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> +		cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  		;;
>  	parisc*)
> -		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> +		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>  		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
>  		;;
>  	mips)
> +		# Please note the following code may copy a stale file.
>  		if [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.bin" ]; then
>  			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  		elif [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.ecoff" ]; then
> @@ -86,6 +92,7 @@ case "${ARCH}" in
>  		fi
>  		;;
>  	arm64)
> +		# Please note the following code may copy a stale file.
>  		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo vmlinuz.efi ; do
>  			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
>  				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> @@ -94,6 +101,7 @@ case "${ARCH}" in
>  		done
>  		;;
>  	riscv)
> +		# Please note the following code may copy a stale file.
>  		for i in Image.bz2 Image.gz Image; do
>  			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
>  				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> @@ -102,7 +110,7 @@ case "${ARCH}" in
>  		done
>  		;;
>  	*)
> -		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
> +		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
>  		echo "" >&2
>  		echo '** ** **  WARNING  ** ** **' >&2
>  		echo "" >&2
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
