Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA4C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jf3sumB3yQNzU1LY9qYfSyHZnx3n+hvoLWO9G9xrwIM=; b=KOKgru2MuMYzLp
	TbWZlBNGO9IUDYHs6Li6EUwVmSm7SwTJDQt4QWsaOpgRAa2jRAOaXgANH4DRZuDvF3UP0VG768ngQ
	LnM/0cirHWN8w2SXrmHxyDnkWJH3bqm91Ur8CYOOv+k3zbRRnAH6nurJHmNDPUg3GHXOjcyZuNmZq
	nxJM/xgb7h2bW3BOVDxoH0N4+L8g7SMwoSazGttuae2hrGSE3tx/BaZoKRdWuCMZYLlJ2RBJCb8pr
	M1Kmbpm9hC6Z0yIrXG176BC+v5dCvoQIpqaA/t3r/7fTuOulZntgAj2yQQCBA7JPfP0dLPyuijT8X
	eFtll/CPOlWgd3tySj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqxa-000000027y4-2HBH;
	Fri, 02 May 2025 14:01:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqvj-000000027jV-2pF4
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 13:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9297D6116E
	for <linux-riscv@lists.infradead.org>; Fri,  2 May 2025 13:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2701C4CEEE
	for <linux-riscv@lists.infradead.org>; Fri,  2 May 2025 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746194393;
	bh=88NFVXZUaDaRJYWPhXI1WcMj18KEdbphqFNzYdApJss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g2meJ797vPXz5DL0YjoDovm0rF8u3bMwNOrqGl24fQTuPQ36nFzthRTpmlV4grdfZ
	 nAmnVr7rOyXCP2uI51RPVxX/xRMtpp75kIYmyD9G7vW6flk/PFhWhCXmaYaV8EZFLj
	 rmYhHfYPGaNJUhUBNibfEGjLrX39KVDtut2bfBCuk9WQ2x6yo0LDWtaph3woet6KEr
	 mj/Iz7rzZEcHnFuvaeCdIHCAIwi/G1hkNhExZCfLue5UjQCo0DFC+lsknydlNsWh1Y
	 XtJL7BP0mlGXilMLRDxqShIuTP+ukp6nzAngA2EF7y5XBWmtgARwY7n1k24Q54jXqS
	 WEsQ+cH/HqQUQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so2012806e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 06:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo6a0yiPdxk3V+tzlwUpNIHQ1i3CcliNcnEqDEL4yCT9lNr1c0zuDBDWL+RNqGcjViTJmsKsmGh6EM3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTI6TJto5jXGYChVMnI1nT5f8RSZoaLNTaVIEu8cvGHBw/TMiB
	5T8n8z5ov31bJYg0PGWezAbQUcive9XH1JTHF+no6g/VijtPA+aeFnSTsWwcdY8+HSyUm7AVWiE
	gYVgnbzQbnuoomr1p5InOyT8H7ak=
X-Google-Smtp-Source: AGHT+IGr5b1a1gQxlQm0D4LZ5TZhA73SmaQyU2KyUmenM1TrcRCJnJx7hdIKg/Xc3Nyl46yYwNTsjCSg6z9AKg81Lv0=
X-Received: by 2002:a05:6512:3d94:b0:545:6fa:bf60 with SMTP id
 2adb3069b0e04-54eac20b3cbmr882115e87.19.1746194392276; Fri, 02 May 2025
 06:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250424080950.289864-1-vkuznets@redhat.com> <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
 <87ldrka6w6.fsf@redhat.com> <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
 <87a57v9pt4.fsf@redhat.com> <CAMj1kXFkFCOqU2jvG_o97DzrhpXKyUd=WxPhHFA-_0ddPSvs0g@mail.gmail.com>
 <877c2z9lbw.fsf@redhat.com>
In-Reply-To: <877c2z9lbw.fsf@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 May 2025 15:59:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH00miQoZcPygSz+C5dWN0U2AhjTn+HfRki2smfMwjWEQ@mail.gmail.com>
X-Gm-Features: ATxdqUGExM_e4qzwbqX3tr9hmm5GsxfyeFI24AH5nF7tC6nIL9PhK0VQ65QSApg
Message-ID: <CAMj1kXH00miQoZcPygSz+C5dWN0U2AhjTn+HfRki2smfMwjWEQ@mail.gmail.com>
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

On Fri, 2 May 2025 at 15:46, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > On Fri, 2 May 2025 at 14:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >>
> >> Ard Biesheuvel <ardb@kernel.org> writes:
> >>
> >> > On Mon, 28 Apr 2025 at 12:59, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >> >>
> >> >> Ard Biesheuvel <ardb@kernel.org> writes:
> >> >>
> >> >> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >>
> >> ...
> >>
> >> >> >>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
> >> >> >>         $(call if_changed,ld)
> >> >> >>
> >> >> >> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> >> index 3b2bc61c9408..d0a27905de90 100644
> >> >> >> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> >> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> >> @@ -49,9 +49,22 @@ SECTIONS
> >> >> >>                 *(.data.*)
> >> >> >>
> >> >> >>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
> >> >> >> +#ifndef CONFIG_EFI_SBAT
> >> >> >>                 . = ALIGN(. + 4, 0x200);
> >> >> >> +#else
> >> >> >> +               /* Avoid gap between '.data' and '.sbat' */
> >> >> >> +               . = ALIGN(. + 4, 0x1000);
> >> >> >> +#endif
> >> >> >>                 _edata = . ;
> >> >> >>         }
> >> >> >> +#ifdef CONFIG_EFI_SBAT
> >> >> >> +       .sbat : ALIGN(0x1000) {
> >> >> >> +               _sbat = . ;
> >> >> >> +               *(.sbat)
> >> >> >> +               _esbat = ALIGN(0x200);
> >> >> >> +               . = _esbat;
> >> >> >> +       }
> >> >> >> +#endif
> >> >> >>         . = ALIGN(L1_CACHE_BYTES);
> >> >> >>         .bss : {
> >> >> >>                 _bss = . ;
> >> >> >
> >> >> > This looks a bit odd - see below
> >> >> >
> >> >> >> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> >> >> >> index b5c79f43359b..ab851490ef74 100644
> >> >> >> --- a/arch/x86/boot/header.S
> >> >> >> +++ b/arch/x86/boot/header.S
> >> >> >> @@ -207,6 +207,19 @@ pecompat_fstart:
> >> >> >>                 IMAGE_SCN_MEM_READ              | \
> >> >> >>                 IMAGE_SCN_MEM_WRITE             # Characteristics
> >> >> >>
> >> >> >> +#ifdef CONFIG_EFI_SBAT
> >> >> >> +       .ascii ".sbat\0\0\0"
> >> >> >> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
> >> >> >> +       .long   setup_size + ZO__sbat           # VirtualAddress
> >> >> >> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
> >> >> >> +       .long   setup_size + ZO__sbat           # PointerToRawData
> >> >> >> +
> >> >> >> +       .long   0, 0, 0
> >> >> >> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
> >> >> >> +               IMAGE_SCN_MEM_READ              | \
> >> >> >> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
> >> >> >> +#endif
> >> >> >> +
> >> >> >
> >> >> > This puts the .sbat section at the very end of the file. However, the
> >> >> > virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
> >> >> > ZO__data', and so the .sbat section will overlap with .bss in the
> >> >> > memory view of the image.
> >> >>
> >> >> Missed that, will fix, thanks! A stupid question though: does this
> >> >> matter in practice for SBAT? I don't think anyone needs SBAT data after
> >> >> kernel starts booting so we can consider it 'discarded'. BSS data can
> >> >> then do whatever it wants.
> >> >>
> >> >
> >> > It violates the PE/COFF spec, and some PE loaders and signing tools
> >> > are very pedantic about the layout.
> >>
> >> Turns out it the problem is slightly harder to address then I initially
> >> thought.
> >
> > Yeah I was afraid this was going to be tricky.
> >
> > ...
> >
> >> The problem is similar for zboot.
> >
> > How so?
> >
>
> zboot-header.S has:
>
>     .ascii          ".data\0\0\0"
>     .long           __data_size
>     .long           _etext - .Ldoshdr
>     .long           __data_rawsize
>     .long           _etext - .Ldoshdr
>
> where the difference between '__data_rawsize' and '__data_size' is:
>
>  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
>  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
>
> and "_end" is the end of BSS. So if we put '.sbat' right after '.data'
> then '.data' will cover it too (so we will get an overlap). If we put
> if after '.bss' then we're going to get a hole (size of '.bss') upon
> (aarch64 example):
>
>  objcopy  -O binary arch/arm64/boot/vmlinuz.efi.elf arch/arm64/boot/vmlinuz.efi
>
> as AFAIU it won't be able to squeeze the binary, it only truncates the
> tail throwing away secions without content (in particular, '.sbat').
>

Ah I misread your patch - I thought .sbat was between .text and .data,
which arguably makes more sense.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
