Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F6C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IODVSJ5x9I4DjzmwLBS5Iji7UMVIktofjiLn8wOM74=; b=I6bcupN8iHFo8T
	YQStcfryDRAs85/pxTpyWUXiF5ZLMGyo5UsEbUHtP8oNLb4tw7drJWmZL4nGqsyP97w553UyAJZVo
	OUxkBczPa19+hoqlibLUMLFk92KzKbkxBvjoGN+lYmNd81wlOV/73u+6yGtboVEiW9SwMNbowrEIu
	mrBv3Rid1hbfXszuFDpyul/Z4ZayF7Sut8lR/IDvXYIdImlzvPUnWPd1R3R6TRBhOOW8TH1jmh2dn
	FQPSrahHyBnBOBS53AEG0TB8Rs0q70WYyaLMs9XjfWDvY/K65IzcGexZL1c8s4mW3J/PUUpNIeJbY
	fxxkxcCxQnhVCGdofQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QDc-00000006jaI-0GI2;
	Mon, 28 Apr 2025 15:16:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QDa-00000006ja7-2HyV
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 15:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB9906135E
	for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 15:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533BBC4CEF0
	for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745853384;
	bh=fkZcg4Wkqkc+9VzWMv4uHceYiUz18/bJxftEEFimOr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mo5Tc46wW/za8v/Lv55sM1x/J+/NtKXmaq6CSnXSw/gbmkhHkAbRv7d65lzfyePoT
	 qeDfm0u2+4HYtI2czU8a2apJ+YgNNzi1newfndnBCFWxbfN+2rWR02NHzaHj/KTv76
	 CUhXpc2utnIQTwfzXiBRtKoQ0hnVld86tWj0E1sF2YkZwfOe/PprTugE9anYNfp8vN
	 KW+vEQ0Iwdjz4NqaANWDzqp7rQwMI8aLYrvHU1atbWd5O+xLqjutFWqFHpMqGLAKyA
	 je/rBJGGndb21+diVTAL5i3tW5KeNjatFpQ1ggz+5QO0N7zd6loKpjhvonJJq9KbaM
	 my5S+kg/yIxtg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5223083e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 08:16:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYwdtiXTgXTYn1LECPCD4yk5lDKaxy8SFdBUhSJi3T1KoLdr5/b82DYC4ORXpv8ljNfftEKEXpU7Q21A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHsAS+fjNuBaqjcJ0QopVQP9dIAl+I0M3qSX++WsiCBhh4/K5x
	7AYzwd0Juder8pAh8MXcL6XNUPu0fYMooZ6zkyHxn+kt8LhbODZR5HcSTHX4MvkBE/IWThymxPN
	2A44fJfphU/bJ5WAO1gBNOlXBdrA=
X-Google-Smtp-Source: AGHT+IEWDLFwiagcp4lT9DXCrJ61WxVz9C+o7TVDD2U3wDJfCR07I5LYa26NoSnDHD2AN0k0/AQc+0u6RvpqQ41CUAM=
X-Received: by 2002:a19:3841:0:b0:54e:9c8d:bdc3 with SMTP id
 2adb3069b0e04-54e9c8dc020mr299017e87.49.1745853382644; Mon, 28 Apr 2025
 08:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250424080950.289864-1-vkuznets@redhat.com> <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com> <87ldrka6w6.fsf@redhat.com>
In-Reply-To: <87ldrka6w6.fsf@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 28 Apr 2025 17:16:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
X-Gm-Features: ATxdqUGE3Ny_H_HoWht4i8zmh5BM3VhhWJ0XtYTcEme2sEbRbvRZLlgvoP_p6pY
Message-ID: <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
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

On Mon, 28 Apr 2025 at 12:59, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >>
> >> Similar to zboot architectures, implement support for embedding SBAT data
> >> for x86. Put '.sbat' section to the very end of the binary.
> >>
> >> Note, the obsolete CRC-32 checksum (see commit 9c54baab4401 ("x86/boot:
> >> Drop CRC-32 checksum and the build tool that generates it")) is gone and
> >> while it would've been possible to reserve the last 4 bytes in '.sbat'
> >> section too (like it's done today in '.data'), it seems to be a pointless
> >> exercise: SBAT makes zero sense without a signature on the EFI binary so
> >> '.sbat' won't be at the very end of the file anyway. Any tool which uses
> >> the last 4 bytes of the file as a checksum is broken with signed EFI
> >> binaries already.
> >>
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  arch/x86/boot/Makefile                 |  2 +-
> >>  arch/x86/boot/compressed/Makefile      |  2 ++
> >>  arch/x86/boot/compressed/vmlinux.lds.S | 13 +++++++++++++
> >>  arch/x86/boot/header.S                 | 13 +++++++++++++
> >>  drivers/firmware/efi/Kconfig           |  2 +-
> >>  5 files changed, 30 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> >> index 81f55da81967..5f7b52f0e7f5 100644
> >> --- a/arch/x86/boot/Makefile
> >> +++ b/arch/x86/boot/Makefile
> >> @@ -71,7 +71,7 @@ $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
> >>
> >>  SETUP_OBJS = $(addprefix $(obj)/,$(setup-y))
> >>
> >> -sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|z_.*\)$$/\#define ZO_\2 0x\1/p'
> >> +sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|_e\?sbat\|z_.*\)$$/\#define ZO_\2 0x\1/p'
> >>
> >>  quiet_cmd_zoffset = ZOFFSET $@
> >>        cmd_zoffset = $(NM) $< | sed -n $(sed-zoffset) > $@
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
> Sure, but as I also commented on zboot patch, we need a logic to track
> possible sbat data changes and rebuild when needed. 'sbat.o' was
> convenient because we can have this tracking logic in one place (zboot)
> and make will do the rest. If we are to drop 'sbat.o', we will need the
> tracking logic both in zboot and x86.
>

Same question: why isn't if sufficient to add

ifneq ($(CONFIG_EFI_SBAT_FILE),)
$(obj)/header.o: $(CONFIG_EFI_SBAT_FILE)
endif

to arch/x86/boot/Makefile?


> >>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
> >>         $(call if_changed,ld)
> >>
> >> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
> >> index 3b2bc61c9408..d0a27905de90 100644
> >> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> >> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> >> @@ -49,9 +49,22 @@ SECTIONS
> >>                 *(.data.*)
> >>
> >>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
> >> +#ifndef CONFIG_EFI_SBAT
> >>                 . = ALIGN(. + 4, 0x200);
> >> +#else
> >> +               /* Avoid gap between '.data' and '.sbat' */
> >> +               . = ALIGN(. + 4, 0x1000);
> >> +#endif
> >>                 _edata = . ;
> >>         }
> >> +#ifdef CONFIG_EFI_SBAT
> >> +       .sbat : ALIGN(0x1000) {
> >> +               _sbat = . ;
> >> +               *(.sbat)
> >> +               _esbat = ALIGN(0x200);
> >> +               . = _esbat;
> >> +       }
> >> +#endif
> >>         . = ALIGN(L1_CACHE_BYTES);
> >>         .bss : {
> >>                 _bss = . ;
> >
> > This looks a bit odd - see below
> >
> >> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> >> index b5c79f43359b..ab851490ef74 100644
> >> --- a/arch/x86/boot/header.S
> >> +++ b/arch/x86/boot/header.S
> >> @@ -207,6 +207,19 @@ pecompat_fstart:
> >>                 IMAGE_SCN_MEM_READ              | \
> >>                 IMAGE_SCN_MEM_WRITE             # Characteristics
> >>
> >> +#ifdef CONFIG_EFI_SBAT
> >> +       .ascii ".sbat\0\0\0"
> >> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
> >> +       .long   setup_size + ZO__sbat           # VirtualAddress
> >> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
> >> +       .long   setup_size + ZO__sbat           # PointerToRawData
> >> +
> >> +       .long   0, 0, 0
> >> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
> >> +               IMAGE_SCN_MEM_READ              | \
> >> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
> >> +#endif
> >> +
> >
> > This puts the .sbat section at the very end of the file. However, the
> > virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
> > ZO__data', and so the .sbat section will overlap with .bss in the
> > memory view of the image.
>
> Missed that, will fix, thanks! A stupid question though: does this
> matter in practice for SBAT? I don't think anyone needs SBAT data after
> kernel starts booting so we can consider it 'discarded'. BSS data can
> then do whatever it wants.
>

It violates the PE/COFF spec, and some PE loaders and signing tools
are very pedantic about the layout.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
