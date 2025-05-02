Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78928C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OrJVcabTCEjc0PBmtwWR7/Kzzwf1TJcx4zJR1Y8Lak=; b=neHIEFQJvm51PM
	ARuoeQ4sVbt3PS/Sgs+7Cjpkx0hc3ztz0bW/Y3lEyMHKc/+5j9cBh5SLIkOK+EDGYQJt35Rhs1jjB
	1M1GFlUrJ6uINYJytYnLfGqGPnXtnfEYaJxQi/B6ESg0azuOWqZLEvWAXFH5m9PeWjz5QXihExUuH
	83r3KX6LFpHI1WJTVoCg9kOjzJZxXvpU7VEoZvTDo/Q/sC2zZJmfylfPbCOrrRhprAaA9AHguBv2o
	ssVXqdqiHnW5ylabPxR/CZyEL7mwKpWkxeYZL+Kp7zcdqvgMPx2Rgt3xji/YfxTTEOj6gnVHAkmLQ
	yGJZjD/R/rIjet8Znkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAq1S-00000001z2X-37RQ;
	Fri, 02 May 2025 13:01:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAq1Q-00000001z0N-0PZp
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 13:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EB1549CAD
	for <linux-riscv@lists.infradead.org>; Fri,  2 May 2025 13:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE50C4CEF2
	for <linux-riscv@lists.infradead.org>; Fri,  2 May 2025 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746190899;
	bh=dMQRuuNDPo6UB5iEmIqTKZGQgECmuzmTPgEY/2ndJx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g/8cW97ifPJ5oIRMGfXy5zxvylC1XHkhb/p1gWvPVy2iXR7mJNCGMKQyjsWG/FMfC
	 bG04ILg6eNnBgb4Zqe9lKHHV4DDios+SlJtWffQymUyjckv6NPhWj6aiN9ReSyTbQ2
	 zGm69Y2HC3wR6nA5umAHD05gTjZk3B7ZwWbOE0e19ToC8NC5kOaNgxoxkbPNhb2Iif
	 HA0HsBqkhi8pA+pn6buNpDHvjdr6lSok2jEFyQzdpvKLfarEUikDwxjt6GCszZyM9t
	 sQkawU1Il76QBZcmL/N3D3gC6ViqliiAn57cHWbU/G6D9ZcNpUDcIFOjWfrFoxfOMx
	 SXUrBkqrj5O1w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a071so19924561fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 06:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPwcWh6kXEBCry+0cXO7GBccJTaIYuGyGIusFZUMKeBbkHin7TPOltXncGNriVo7LQc6W+yU4wS0bAtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPAYfp34PyjU7NdbwGCzsJ9F7C9jAmdCLaW8/DTILpUS1zPG9
	qpK7bpXQ4KI1UUV6viE08I8EMCC7ccPAOxlsxsRiVPmcdPM8uvL13rSyp/50fmcB5hFDdG1gPNM
	rYHiyfAJ1AfAhFXvPBbcgNJ757+Y=
X-Google-Smtp-Source: AGHT+IFP2K1rVw27ZyLOosH08KKIQzCBLDHk9BWOU30jtDuPDDbzP6LOh48YChtZ0T4xHjqDNJTeyg60xD8QdUr+fuA=
X-Received: by 2002:a05:651c:50a:b0:30c:50ff:1a4e with SMTP id
 38308e7fff4ca-320c44e5ef9mr6919641fa.18.1746190897850; Fri, 02 May 2025
 06:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250424080950.289864-1-vkuznets@redhat.com> <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
 <87ldrka6w6.fsf@redhat.com> <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
 <87a57v9pt4.fsf@redhat.com>
In-Reply-To: <87a57v9pt4.fsf@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 May 2025 15:01:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFkFCOqU2jvG_o97DzrhpXKyUd=WxPhHFA-_0ddPSvs0g@mail.gmail.com>
X-Gm-Features: ATxdqUGjrWPLVf8RNWg3y0yNbuxamdltX9gNRtUdxjVBvn7ezePbPeljUcggMvc
Message-ID: <CAMj1kXFkFCOqU2jvG_o97DzrhpXKyUd=WxPhHFA-_0ddPSvs0g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250502_060144_180695_61552026 
X-CRM114-Status: GOOD (  28.23  )
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

On Fri, 2 May 2025 at 14:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > On Mon, 28 Apr 2025 at 12:59, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >>
> >> Ard Biesheuvel <ardb@kernel.org> writes:
> >>
> >> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> ...
>
> >> >>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
> >> >>         $(call if_changed,ld)
> >> >>
> >> >> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> index 3b2bc61c9408..d0a27905de90 100644
> >> >> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> >> >> @@ -49,9 +49,22 @@ SECTIONS
> >> >>                 *(.data.*)
> >> >>
> >> >>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
> >> >> +#ifndef CONFIG_EFI_SBAT
> >> >>                 . = ALIGN(. + 4, 0x200);
> >> >> +#else
> >> >> +               /* Avoid gap between '.data' and '.sbat' */
> >> >> +               . = ALIGN(. + 4, 0x1000);
> >> >> +#endif
> >> >>                 _edata = . ;
> >> >>         }
> >> >> +#ifdef CONFIG_EFI_SBAT
> >> >> +       .sbat : ALIGN(0x1000) {
> >> >> +               _sbat = . ;
> >> >> +               *(.sbat)
> >> >> +               _esbat = ALIGN(0x200);
> >> >> +               . = _esbat;
> >> >> +       }
> >> >> +#endif
> >> >>         . = ALIGN(L1_CACHE_BYTES);
> >> >>         .bss : {
> >> >>                 _bss = . ;
> >> >
> >> > This looks a bit odd - see below
> >> >
> >> >> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> >> >> index b5c79f43359b..ab851490ef74 100644
> >> >> --- a/arch/x86/boot/header.S
> >> >> +++ b/arch/x86/boot/header.S
> >> >> @@ -207,6 +207,19 @@ pecompat_fstart:
> >> >>                 IMAGE_SCN_MEM_READ              | \
> >> >>                 IMAGE_SCN_MEM_WRITE             # Characteristics
> >> >>
> >> >> +#ifdef CONFIG_EFI_SBAT
> >> >> +       .ascii ".sbat\0\0\0"
> >> >> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
> >> >> +       .long   setup_size + ZO__sbat           # VirtualAddress
> >> >> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
> >> >> +       .long   setup_size + ZO__sbat           # PointerToRawData
> >> >> +
> >> >> +       .long   0, 0, 0
> >> >> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
> >> >> +               IMAGE_SCN_MEM_READ              | \
> >> >> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
> >> >> +#endif
> >> >> +
> >> >
> >> > This puts the .sbat section at the very end of the file. However, the
> >> > virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
> >> > ZO__data', and so the .sbat section will overlap with .bss in the
> >> > memory view of the image.
> >>
> >> Missed that, will fix, thanks! A stupid question though: does this
> >> matter in practice for SBAT? I don't think anyone needs SBAT data after
> >> kernel starts booting so we can consider it 'discarded'. BSS data can
> >> then do whatever it wants.
> >>
> >
> > It violates the PE/COFF spec, and some PE loaders and signing tools
> > are very pedantic about the layout.
>
> Turns out it the problem is slightly harder to address then I initially
> thought.

Yeah I was afraid this was going to be tricky.

...

> The problem is similar for zboot.

How so?

> I have two ideas:
> 1) Get back to the idea of putting '.sbat' between '.text' and '.data'
> (was in my RFC).
>

This is what zboot does, no?

> 2) Introduce a separate '.bss' section to the PE binary, basically:
>

I'd like .sbat to be as unintrusive as we can make it, so this is my
least preferred option.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
