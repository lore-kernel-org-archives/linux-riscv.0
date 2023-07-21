Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2504EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iSSwve6ii30xpyGOGOvZki4+5p4wJCbmyEN1lA33/M=; b=i2yJ63Lbg26sCc
	dSbjEOsqTIxrBnuSNemZegST8OcmLOKcZj48RAcTZ3TzPgqTA2kXMz65GSjtZPufAZvKp0bAMObxD
	uHtK1xiz3y7660BWh1dbf8l0TgMoq+mNI6AAP+uFsbfI+nidiD3rOsywsOcv+tS9Rx7bczzkLFvqA
	L+Q2xHgoMo3vVA8lF1vhTkS4ocSPu1JCP7+gpngxLtmprAZlQD4+mTqcAPTLOUd0wKvHSptvAPr9p
	PeOd5D71HhM7g/eYgWa5Ji1MJoKM599kJjOSI7JFXju5uiipxLLeGiIUXoChj5Kp6gFI4XGpXaoUQ
	Y6GgWHngoi1oVOnz8krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrKs-00EJx5-2W;
	Fri, 21 Jul 2023 14:42:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrKp-00EJvA-2I;
	Fri, 21 Jul 2023 14:42:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 017F861B41;
	Fri, 21 Jul 2023 14:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF37DC43395;
	Fri, 21 Jul 2023 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689950541;
	bh=vnKpGnxn8zUuKVtm2tFTj9MMIfa7Z34OzWEeyPxSowA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aqZrGQG4Xfno3udd5lvA7e9qj/WsOKad6KDELNXlUmoTSNUitZWMPNe5yENbKej7a
	 /zO2jJCGbFFLtGCqLpuSiHJ09Xf/52xhyrEu/jy65+9+VsPmFZ5MAiCE3wC0+RzaHE
	 OTwF/qqsrcTXjzF5229HVjh1d3/RtfKnp/mUJXGW5s/YrHavgCClKLuQLpWlNtHVqZ
	 iACOXE8zEKevzLUJ/EDcZt9u7MikFaWDAsbYRmYBlEqAFipRO64VquByrXOz0w4TtM
	 KFoblSMUeS6EiuKYUZC07IKIeoHP4hIyOCp183w8SIXJZmOc56OE1NzZh6GJp4LwIT
	 bOLRuYTu2Plrw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so3284223e87.2;
        Fri, 21 Jul 2023 07:42:21 -0700 (PDT)
X-Gm-Message-State: ABy/qLad88vL4o4PrXK4jrHFlvUJ+j6AnVbysVUsCqpeMvS71+hlTS1b
	SkUBkykFNpddbNXHXR9KTw6JvMRoT34nzNGkq3o=
X-Google-Smtp-Source: APBJJlFHpbtWUUSy2IGbyF1VU7MiOIsifP1VVHGSRYzs5vsiWHm+ULfddPC0zE3Oc2YFecvdrkMowBP8X6H96jYS/AE=
X-Received: by 2002:a05:6512:2036:b0:4f6:d7b:2f19 with SMTP id
 s22-20020a056512203600b004f60d7b2f19mr1436368lfs.24.1689950539887; Fri, 21
 Jul 2023 07:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230721074850.310644-1-alexghiti@rivosinc.com> <20230721074850.310644-5-alexghiti@rivosinc.com>
In-Reply-To: <20230721074850.310644-5-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Jul 2023 16:42:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF30WyFccj7uNTrf4YzndyaB8uL5PTQwJp8ADY-MTLTsQ@mail.gmail.com>
Message-ID: <CAMj1kXF30WyFccj7uNTrf4YzndyaB8uL5PTQwJp8ADY-MTLTsQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] libstub: Fix compilation warning for rv32
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_074223_859284_14962F6E 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, 21 Jul 2023 at 09:52, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Fix the following warning which appears when compiled for rv32 by using
> unsigned long type instead of u64.
>
> ../drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_kaslr_relocate_kernel':
> ../drivers/firmware/efi/libstub/efi-stub-helper.c:846:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   846 |                            (u64)_end < EFI_ALLOC_LIMIT) {
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

For all I care, you can just squash this into the previous patch as well.

> ---
>  drivers/firmware/efi/libstub/kaslr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
> index be0c8ab0982a..afb857329799 100644
> --- a/drivers/firmware/efi/libstub/kaslr.c
> +++ b/drivers/firmware/efi/libstub/kaslr.c
> @@ -130,7 +130,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
>                 if (!check_image_region(*image_addr, kernel_memsize)) {
>                         efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
>                 } else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
> -                          (u64)_end < EFI_ALLOC_LIMIT) {
> +                          (unsigned long)_end < EFI_ALLOC_LIMIT) {
>                         /*
>                          * Just execute from wherever we were loaded by the
>                          * UEFI PE/COFF loader if the placement is suitable.
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
