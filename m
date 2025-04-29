Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E1C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSkOKQ23zvDMRdgLHICDTsKoRg1KbSLMBrVIGEasBaQ=; b=fDW9lFle4ng6fE
	i5oXLbpVCmOIJDCfrk1H2+B7ltKUO/8OtQ3uHhpoBAPg3YTy7sDgBteZI5kavHjtVnBGuOaKnwgCn
	dXJYIhN9g9HPrP/j80O3F/2R9pkJFdOAxl3NMpIYhzJfa71nDxaUxxOMnYbWGva2RA+RMfDY7DGg0
	pqcJOwtCNj4ZPUNkAeyfqvIIOnPzYGyeAFdPGdxIiHLUR/q283ZeZP/bneZaciPuBmPxtZJzw7cis
	tFEKFBe9IVsTWDqGcnJABsVSp+A13rLLKktPApF0RcPphvNRZuxyburEeHxfXLnpYFdN7iMu9RYCi
	3Ui4PdaIxaR6wf4PBt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i0o-00000009Gt5-294F;
	Tue, 29 Apr 2025 10:16:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9htX-00000009FUQ-33dy
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 10:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2479A4A66D
	for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 10:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC03C4AF0D
	for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745921335;
	bh=8eQHhZvKJeBbQJb/Z+PDZwKqqPQyu1KFMmO63/+jE7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SX9WkP0xBHc3Lh4mU6DPFxkoGUnGiJkIhW+D/wah/5Xfj3GF+L2RsOBTXCVS8CbN7
	 LOknTKtZ2i5Iu6iLw/Codgn3z88xBwUQ2BEdHc3KeQok563KnvxwOaG3VEI06B3izP
	 XuHn6IkHJVXf7qWaReuHSRIOQGyTH+svrlynxzkYIMY90Fb+zjIqaYpsWwk+3nzC8v
	 PpLL27EZYfuKCihGtB/iLsQwPg2fa5Q7xCdMQP6QVf6EYJreLpiy9w6RFw1IprsNuR
	 ICKONWCzPqjFvMxEBGAEqKgSmV18yQnZ/gssUEYHTx7Q+dlPLgBox+o071s3gRk0Zs
	 ZU/hR12KdV1fw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7057929e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 03:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMvenD0rkIDS+F2fAqy+tIzGRicPf3l395inJFUzvle9ZfC69EbNgePrPhsujAcWrfZZ+z5Y/HwL5g8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbIbgleO0j1nxaqpzwPgy6LHFngE0Rge9xwsgKJKSNeOhbE0a9
	VncOeo9AcfmvWkyL3bsDOVh9ojiLStlnMj8GUSLYwS/YZJ6/92+BEt6HGdoJiFtSD2GfP2IwM1a
	7OnjcQMReypj0uC/DFzrhzt3oCyA=
X-Google-Smtp-Source: AGHT+IFHOjwc+z3+q19o9cvStKVDDWxFOIkGItGTtAfcqINGWAbgiIfiJ5ivvwYeafOBzOcAJAI6k78w03WoGwkqazs=
X-Received: by 2002:a05:6512:15a5:b0:54a:f6e9:2c04 with SMTP id
 2adb3069b0e04-54e9e543a79mr502083e87.26.1745921333244; Tue, 29 Apr 2025
 03:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250424080950.289864-1-vkuznets@redhat.com> <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com> <87ikmn9tri.fsf@redhat.com>
In-Reply-To: <87ikmn9tri.fsf@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Apr 2025 12:08:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHTtGP-UcJLut7OVUuULzg59npyoQhb+kuCZO5x-2NYWA@mail.gmail.com>
X-Gm-Features: ATxdqUFuqvkbKjuCCg2UD1PYDObWWJcxc5jqND0lrnoRL8XTShRPlINKCfO5fDU
Message-ID: <CAMj1kXHTtGP-UcJLut7OVUuULzg59npyoQhb+kuCZO5x-2NYWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/efi: Implement support for embedding SBAT data
 for x86
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: x86@kernel.org, linux-efi@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Jones <pjones@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
	Emanuele Giuseppe Esposito <eesposit@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Luca Boccassi <bluca@debian.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_030855_806058_603402FC 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, 29 Apr 2025 at 11:55, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> ...
>
> >> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> >> index fdbce022db55..b9b80eccdc02 100644
> >> --- a/arch/x86/boot/compressed/Makefile
> >> +++ b/arch/x86/boot/compressed/Makefile
> >> @@ -107,6 +107,8 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
> >>  vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
> >>  vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> >>
> >> +vmlinux-objs-$(CONFIG_EFI_SBAT) += $(objtree)/drivers/firmware/efi/libstub/sbat.o
> >> +
> >
> > Please drop this, and put the .incbin directly into header.S
> >
>
> I'm sorry I'm probably missing something important but my understanding
> is that that header.S is compiled into setup.elf:
>
>  ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments  -m elf_i386 -z
>  noexecstack -T arch/x86/boot/setup.ld  ... arch/x86/boot/header.o ...  -o arch/x86/boot/setup.elf
>
> and then the result gets concatenated with vmlinux.bin to get bzImage:
>
>  objcopy  -O binary arch/x86/boot/setup.elf arch/x86/boot/setup.bin
>  cp arch/x86/boot/setup.bin arch/x86/boot/bzImage; truncate -s %4K arch/x86/boot/bzImage; cat arch/x86/boot/vmlinux.bin >>arch/x86/boot/bzImage
>
> so if we want to have SBAT at the very end of bzImage without dirty
> tricks it must be at the very end of vmlinux.bin, not setup.bin. I can,
> of course, use some existing compilation unit but to be honest I can't
> find anything suitable.
>

Yeah, you're right. I keep forgetting the insane way the bzImage is
put together.

So you'll need to incorporate $(CONFIG_EFI_SBAT_FILE) into
arch/x86/boot/vmlinux. But that does not mean it needs to be
constructed under drivers/firmware/efi/libstub, and it also doesn't
mean you need filechk and a separate .o file, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
