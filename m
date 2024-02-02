Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB5FC48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOOqc92xxFsXR9h4XbDjNJET58Q/DYFM5TvgddxxV08=; b=Vz/9gQnloPVIRv
	VbZjZ3VmRyZl5NhyXHjM5l4MEMVNO+Sdz4pOPI/02FYyagff1A+QrkdnEUVWawxWj4lH0/Hm0KWUb
	1X56R6xyjDVY7FsxULHmkTEXbbJdyAoT5g/z1RjX2yJbQG7M5kHPADC4xJCUA20eM6nGGodZeAm1R
	U+YeaEOnV/cdz5AG6WeFebHUlGhjBpQWM/auC384MWEMCrdowSwRjAQIOkk3J+/rB7HQlJBYO52CR
	uxY1UWqIrCltdP6h9jUqkvn4qC0TaWNzWTkBkiKuWC7nmzun0Ly90EcvWlWhzlPOCO0iVRLOtK0BB
	kIDqfBhdYCrjamHcOeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwfb-0000000COeV-0wSW;
	Fri, 02 Feb 2024 16:45:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwfY-0000000COdd-3e1X
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81AEB626E1
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 16:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A77C43399
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706892334;
	bh=1NpeW/jx9i/TLtkjQru7LCt3fwDMOgyS6dS+4BVnKEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UHuUiP/iWk5Fb53S92nVygIFatSs9skq2hMoXmumjli8E4rpyHXmCRTuhNPx/CUyS
	 WInbGMMiFUC5zSs9pHr8PxwCyqpB5wuc7JKCuxeUpN0kRgXoZGxqvfQa7V4g1vy5rx
	 ZH65cC0egk0Ci+3m6DC56kCOdrLuHafHqcTZryqxissLpfpqvBfJV2ic3TC07vc162
	 RfROEBIkvPkuXXvgAKSwnD/mFfgGAvEt56tgRD5v+f4HO83hOB4WBd+PYhwq8qpcDy
	 i72DKP36jvL0uRRmzITZ3Mi5v9M9T+T4Ofb3IqJI/SG7uD3ukIYC5fBX5+UwK2D10t
	 CdTwZpt9Q6Sag==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d07b400bb8so21160921fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 08:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV+j66BpTRzw3UaGdhvn9HDaAWiCu1hHmpqK92r3hXkYn4SmR18KLeMk1xGnKY/FVvy/jwD4IGXlMTEM8WRfjpzR7WhYZvqhM4Jo2c3YQuH
X-Gm-Message-State: AOJu0Yx9SWkGrfH3sDvPO+BHX5+zIaUhONH4fR8vILn+dcmkzJfumjol
	xNPaQ1BIri/K9cqBhvNPqUhP45ZxrLYLWzun4AFVKVu/5B+h9OGDUAZS5SMaLQzftHk5TDeAMXI
	Ms8DHKud1uij1952hD2hlxuolMQE=
X-Google-Smtp-Source: AGHT+IEVsLTITAJ2OrzaTZdhtTYlPVrCreRMlehrq0ps5B01+fszECj/LB2WI4jZuRlSw3VuVUVh8K42fS/pgildxQw=
X-Received: by 2002:a05:651c:1249:b0:2d0:87ea:a132 with SMTP id
 h9-20020a05651c124900b002d087eaa132mr1347084ljh.27.1706892332395; Fri, 02 Feb
 2024 08:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20240202163433.786581-1-abrestic@rivosinc.com> <20240202163433.786581-3-abrestic@rivosinc.com>
In-Reply-To: <20240202163433.786581-3-abrestic@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Feb 2024 17:45:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH7=9-Ww_z6a4Z5K8MrbH8x17Y3EzYk9Qf-3PL-JgMcww@mail.gmail.com>
Message-ID: <CAMj1kXH7=9-Ww_z6a4Z5K8MrbH8x17Y3EzYk9Qf-3PL-JgMcww@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: Don't add memblocks for unusable memory
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_084537_019999_29003182 
X-CRM114-Status: GOOD (  22.23  )
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

On Fri, 2 Feb 2024 at 17:34, Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Adding memblocks (even if nomap) for such regions unnecessarily consumes
> resources by creating struct pages for memory that may never be used or,
> in the case of soft-reserved regions, prevents the memory from later
> being hotplugged in by dax_kmem. This is also consistent with how x86
> handles unusable memory found in the EFI memory map.
>

x86 doesn't care as much about memory vs device semantics as ARM does.

This affects the output of memblock_is_[region_]memory(), so we'd have
to double check that none of those uses get broken by this.

If the soft reserved regions need to be omitted from memblock, we can
deal with that separately perhaps, but changing it at this level seems
inappropriate to me.


> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
>  drivers/firmware/efi/efi-init.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
> index d4987d013080..f05bacac89b7 100644
> --- a/drivers/firmware/efi/efi-init.c
> +++ b/drivers/firmware/efi/efi-init.c
> @@ -24,13 +24,6 @@
>
>  unsigned long __initdata screen_info_table = EFI_INVALID_TABLE_ADDR;
>
> -static int __init is_memory(efi_memory_desc_t *md)
> -{
> -       if (md->attribute & (EFI_MEMORY_WB|EFI_MEMORY_WT|EFI_MEMORY_WC))
> -               return 1;
> -       return 0;
> -}
> -
>  /*
>   * Translate a EFI virtual address into a physical address: this is necessary,
>   * as some data members of the EFI system table are virtually remapped after
> @@ -195,12 +188,9 @@ static __init void reserve_regions(void)
>                 memrange_efi_to_native(&paddr, &npages);
>                 size = npages << PAGE_SHIFT;
>
> -               if (is_memory(md)) {
> +               if (is_usable_memory(md)) {
>                         early_init_dt_add_memory_arch(paddr, size);
>
> -                       if (!is_usable_memory(md))
> -                               memblock_mark_nomap(paddr, size);
> -
>                         /* keep ACPI reclaim memory intact for kexec etc. */
>                         if (md->type == EFI_ACPI_RECLAIM_MEMORY)
>                                 memblock_reserve(paddr, size);
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
