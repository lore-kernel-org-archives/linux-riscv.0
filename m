Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E35C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWFwUXxTAWRYsM1vaIQV8QSLo6Uvwl4nTg6fYfQtyok=; b=1XKUaRcKk+ppnr
	RwKuXwWx+Oz7YRFzYnVNzfL/DDup8uk/xE9jIBgdB42PiAGoFkKeuF/oUhCyNc2K5iSR8SezC09h8
	k3ty1x8sC/wH0aFVaU5ouWGOrFbjMZFmQA4pB2T6g695JIyZ/YUEi6NDcaP+IclWK2N2BYKl1/eLp
	Fu1/M2l2NnTLT6HeWEOpeOIL/+70vCt+ljlzI/qgDVNHvLPhMIexs6Td2DUMYG/SHODMC7rRtv8GU
	ZsyEs8sCi9wW0PpftR2JjaCaEINyst4Og0UWIzQcBYU27YTX3DwEgGx6dy1CF2+2l4virwRhXArm/
	P9KR8TPVuQ0u/1IxPdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApEI-00000001rRP-1orw;
	Fri, 02 May 2025 12:10:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApDV-00000001rNI-0jUO
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 12:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746187806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E+x86lQ3eEa6wGjIIl/uJ+Xr71OZD/OsawvdSadvihw=;
	b=dObFyXR01mdWmhMKX9QdhBcfAWy3dDZNpxLs8kgoTVcRDDlQgbzTJuHIqogkr06AiCqFUv
	XkIXFbke4TjezhzuVWcVSFXhlZ9GGCO5HOXsz2ZC9fZdOYdtD21a0t9K5+FG/VJiw+EV/D
	pJYvhNhobhZKZrvXKF/FmOoZkh5w+c4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-537p1hUkNJG4OIjK-MDnDA-1; Fri, 02 May 2025 08:10:03 -0400
X-MC-Unique: 537p1hUkNJG4OIjK-MDnDA-1
X-Mimecast-MFC-AGG-ID: 537p1hUkNJG4OIjK-MDnDA_1746187802
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so9750795e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 05:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187802; x=1746792602;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+x86lQ3eEa6wGjIIl/uJ+Xr71OZD/OsawvdSadvihw=;
        b=xB86UkwpLqb9B7Qak1+ty76g76TBmJ3UValu6AM3mcWFtzYkmmJ9VVd6IqnBYQ/HAE
         PQHq1TdUJGOZ3uv8MozTWvfjdEOHbHkvRDLd68JtSuqBiw2Hu46fPW3aT8KdVqHZBEbO
         a9+RHitJkcO6LXwuqP1BT1rBrPGLhp3CtHRZFW4EqVhbfNC82qWb7wqV00wQanqqRV+M
         iWwlKKDKQmNk5c8+k4wA2DDtDoUmwa4X+qNt7VzeA03ugc19x7tNV0vpNtnlVsif1Xa/
         65De6Ve8M91D/TX9Mt6kjpVhDdwA53/wZAia6ciUV/4170QmKvLpBkgD+8JTFNhnT/6/
         X8bg==
X-Forwarded-Encrypted: i=1; AJvYcCUJbm9cFgUvgBwXpa0dVjCSpRVLpaFvODWvCd94dw9Wdg0GT/+iJJMvEgQUfNlf0HfmXHmeNxkLwgpWMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCD6Cq8ZU+ImiPS0m6nLNPRFanvGLIEjTvyWxfhuOVHttPNp7v
	KlCG+0v1p6LI4Z0nHFovsn5GgpdwdQmrKx3WC8I4KZ81aVHVxoP22E/YdpEPHp6tc08q1x2AMyZ
	q3LoZ+cI7I7JcsEaBeUwWfCE/m0XJJK+9FoToFVjpU39IGiChax/OBIzAGBdqZ7XyCQ==
X-Gm-Gg: ASbGncsOPupNAcSV4EdjkLqTDB3Uwwbt777JCswpRVp0P3li7ahKs1a4kr0u8Yo88Io
	LF3THj0sXT19Pt+yRbOhZHo9tjNrrMJ1kCOxOFUfC4dgVvWL4K9aKcbwolRtrqMa935pKUpQL4O
	GaBbreJYb0ismAG+k+9g7ei0pt61HB8CyvTOoAEN/aEKrruMV7u6ARJNGwwt3/3pUVq/TuyFz0Q
	TYIg1TPaOtOzYXAsVoAe/mvMLLSbS46B9NjP4wtoEDCWGi3X5FQ5NpVqyj+gKC6sJF7xS45fIoz
	0TGFrW4=
X-Received: by 2002:a05:600c:6612:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-441bbe25490mr23119545e9.0.1746187801759;
        Fri, 02 May 2025 05:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb9Keejkp+a+4rvlg26rBiOVIXrfRiZtb/w3Nvum12Eyzo9hqF3GutGJC1S6pljMkzwZdEAA==
X-Received: by 2002:a05:600c:6612:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-441bbe25490mr23119155e9.0.1746187801359;
        Fri, 02 May 2025 05:10:01 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc89sm88150895e9.9.2025.05.02.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:10:00 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: x86@kernel.org, linux-efi@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Jones <pjones@redhat.com>, Daniel Berrange <berrange@redhat.com>, Emanuele
 Giuseppe Esposito <eesposit@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Luca Boccassi
 <bluca@debian.org>, Peter Zijlstra <peterz@infradead.org>, Matthew Garrett
 <mjg59@srcf.ucam.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] x86/efi: Implement support for embedding SBAT data
 for x86
In-Reply-To: <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
 <87ldrka6w6.fsf@redhat.com>
 <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
Date: Fri, 02 May 2025 14:09:59 +0200
Message-ID: <87a57v9pt4.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lbuo2M9zjp41TT9yJB17IZyCTpbV2LsdomhGTieVDDs_1746187802
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_051009_286497_D1B91474 
X-CRM114-Status: GOOD (  25.56  )
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

Ard Biesheuvel <ardb@kernel.org> writes:

> On Mon, 28 Apr 2025 at 12:59, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Ard Biesheuvel <ardb@kernel.org> writes:
>>
>> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

...

>> >>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
>> >>         $(call if_changed,ld)
>> >>
>> >> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
>> >> index 3b2bc61c9408..d0a27905de90 100644
>> >> --- a/arch/x86/boot/compressed/vmlinux.lds.S
>> >> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
>> >> @@ -49,9 +49,22 @@ SECTIONS
>> >>                 *(.data.*)
>> >>
>> >>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
>> >> +#ifndef CONFIG_EFI_SBAT
>> >>                 . = ALIGN(. + 4, 0x200);
>> >> +#else
>> >> +               /* Avoid gap between '.data' and '.sbat' */
>> >> +               . = ALIGN(. + 4, 0x1000);
>> >> +#endif
>> >>                 _edata = . ;
>> >>         }
>> >> +#ifdef CONFIG_EFI_SBAT
>> >> +       .sbat : ALIGN(0x1000) {
>> >> +               _sbat = . ;
>> >> +               *(.sbat)
>> >> +               _esbat = ALIGN(0x200);
>> >> +               . = _esbat;
>> >> +       }
>> >> +#endif
>> >>         . = ALIGN(L1_CACHE_BYTES);
>> >>         .bss : {
>> >>                 _bss = . ;
>> >
>> > This looks a bit odd - see below
>> >
>> >> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
>> >> index b5c79f43359b..ab851490ef74 100644
>> >> --- a/arch/x86/boot/header.S
>> >> +++ b/arch/x86/boot/header.S
>> >> @@ -207,6 +207,19 @@ pecompat_fstart:
>> >>                 IMAGE_SCN_MEM_READ              | \
>> >>                 IMAGE_SCN_MEM_WRITE             # Characteristics
>> >>
>> >> +#ifdef CONFIG_EFI_SBAT
>> >> +       .ascii ".sbat\0\0\0"
>> >> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
>> >> +       .long   setup_size + ZO__sbat           # VirtualAddress
>> >> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
>> >> +       .long   setup_size + ZO__sbat           # PointerToRawData
>> >> +
>> >> +       .long   0, 0, 0
>> >> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
>> >> +               IMAGE_SCN_MEM_READ              | \
>> >> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
>> >> +#endif
>> >> +
>> >
>> > This puts the .sbat section at the very end of the file. However, the
>> > virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
>> > ZO__data', and so the .sbat section will overlap with .bss in the
>> > memory view of the image.
>>
>> Missed that, will fix, thanks! A stupid question though: does this
>> matter in practice for SBAT? I don't think anyone needs SBAT data after
>> kernel starts booting so we can consider it 'discarded'. BSS data can
>> then do whatever it wants.
>>
>
> It violates the PE/COFF spec, and some PE loaders and signing tools
> are very pedantic about the layout.

Turns out it the problem is slightly harder to address then I initially
thought. On x86, arch/x86/boot/bzImage is composed of setup.bin and
vmlinux.bin and the later is produced from vmlinux with

 objcopy -O binary -R .note -R .comment -S arch/x86/boot/compressed/vmlinux arch/x86/boot/vmlinux.bin

"objcopy -O binary" basically dumps memory representation of vmlinux. In
case we put '.sbat' before '.bss' we get:

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
...
  4 .data         00002000  0000000000aef000  0000000000aef000  00af0000  2**12
                  CONTENTS, ALLOC, LOAD, DATA
  5 .sbat         00001000  0000000000af1000  0000000000af1000  00af2000  2**12
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  6 .bss          00023078  0000000000af2000  0000000000af2000  00af3000  2**12
                  ALLOC
  7 .pgtable      00021000  0000000000b16000  0000000000b16000  00af3000  2**12
                  ALLOC
...

so we can't have a single '.data' section in PE covering both '.data'
and '.bss'/'.pgtable' as '.sbat' is in the middle and we want it to be a
separate section. If we try putting '.sbat' after '.bss' we are going to
get a hole size of '.bss' + '.pgtable' in arch/x86/boot/vmlinux.bin
because 'objcopy -O binary' is not going to squeeze anything (and it has
no idea what '.sbat' is and if it can be moved).

The problem is similar for zboot. I have two ideas:
1) Get back to the idea of putting '.sbat' between '.text' and '.data'
(was in my RFC). 

2) Introduce a separate '.bss' section to the PE binary, basically:

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359b..dae8202705c4 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -197,7 +197,7 @@ pecompat_fstart:
                IMAGE_SCN_MEM_EXECUTE           # Characteristics
 
        .ascii  ".data\0\0\0"
-       .long   ZO__end - ZO__data              # VirtualSize
+       .long   ZO__edata - ZO__data            # VirtualSize
        .long   setup_size + ZO__data           # VirtualAddress
        .long   ZO__edata - ZO__data            # SizeOfRawData
        .long   setup_size + ZO__data           # PointerToRawData
@@ -207,6 +207,17 @@ pecompat_fstart:
                IMAGE_SCN_MEM_READ              | \
                IMAGE_SCN_MEM_WRITE             # Characteristics
 
+       .ascii  ".bss\0\0\0\0"
+       .long   ZO__end - ZO__edata             # VirtualSize
+       .long   setup_size + ZO__edata          # VirtualAddress
+       .long   0                               # SizeOfRawData
+       .long   0                               # PointerToRawData
+
+       .long   0, 0, 0
+       .long   IMAGE_SCN_CNT_UNINITIALIZED_DATA| \
+               IMAGE_SCN_MEM_READ              | \
+               IMAGE_SCN_MEM_WRITE             # Characteristics
+
        .set    section_count, (. - section_table) / 40
 #endif /* CONFIG_EFI_STUB */

This way '.data' doesn't need to be the last meaninful section in
'vmlinux' and we can then pub '.sbat' right after it. I'm going to give
it a try but also I'm wondering why do we have '.data' covering '.bss'
and '.pgtable' in the first place.

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
