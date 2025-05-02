Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A701C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTvw0k+SEd0PotZjshi9QoanWvyOpQWbBt7+YAE8Amw=; b=xnefPbagPaMMS3
	NzUotUw96ApJZMPtItg3zCFIEgzAz8dUnwh5UNxXDRFbSnB+xHQje0pA/N1ksHmec3jFURFJpp/PH
	+NOmm96avMykAOQETiIgthEUcntLkDY58qaREkztdSg71qYAg3775o1tBgPD1gq3YZlzSD5j90rgf
	ZHeIrXprC/mp6yNN1aiLgXKPJfKyWHgb8iq2HImPqmn53Jtpm6m6omt4ifka1B7R6ZEnbAQQWF3Hj
	XwvMHaFPL58kNtnirCTK+L6bjG3ZMwWOKspC6DDsBMngcM4kFUmImZpafAZy+sn/pO4rikK8OpE9t
	OYUoVZKVl0dsvychtDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqkk-000000026SK-3DqM;
	Fri, 02 May 2025 13:48:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqj2-0000000269M-2SX4
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 13:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746193607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t26WFBHi08pW7euHNG026rO+y6++jNdV0Wnu59PtcDI=;
	b=PvKoG7zH5mWdvt1kglKm0mzgIA4E/kLKRr72PZlbMjDRJGRKUloqlp8He9Jm6dDzK5vtED
	4ohZU4taPtYpFqsqR/xSAh9hPHKdrpvU1SHOzNy3xXEGlPpJHhSZ6IqXIJPQVyG3vzi/kk
	X9rZ3Q6EPJ6TTbCsiaG49zsD16McBJU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-B_BImlHvOgqZucyfJfS2bA-1; Fri, 02 May 2025 09:46:46 -0400
X-MC-Unique: B_BImlHvOgqZucyfJfS2bA-1
X-Mimecast-MFC-AGG-ID: B_BImlHvOgqZucyfJfS2bA_1746193605
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39130f02631so567275f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 06:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746193605; x=1746798405;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t26WFBHi08pW7euHNG026rO+y6++jNdV0Wnu59PtcDI=;
        b=QrYwPg+jfnNMi4O4KHBUdxRwcDMs0tUm72HT/jESGnBG177X21yaXqAkZOTR0Kn7Oj
         vT0p1qSFCVunxDCnk1lvDCGaDezev5ArSCWvIYI4j1LsTi5DhEks4zYDH3s2fyiPqk/F
         Wy4UXeDqc/58KKlmjME24vr9ESwQ8cqswOwIVDMteOJKkNMtcaGRP/MAvGgnviFsbJqW
         CKPSmx09Mn1AEcs31CXLjWxTYubdJRml7bydiLnIEewya9P08lRAgr2EOpwQmYw2mQez
         sdlVQgktxLcIE31UeDrjdJqJEhy+wJSsgaLAzO6z2cZ5Ho1n3URnJidBJ+dHbgfnMPgV
         GIuA==
X-Forwarded-Encrypted: i=1; AJvYcCWOueiX5/maYaMlv25YCEaXYms8lEkFlH0k8W92/wBm/Uo5unaNAT0NDBhhXMHwU6DDi6Z88y87zZfuVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2RJmZjPrw7s2728YuOG23tM9E/L+gZB0edWtCKqhBUCLYwRE4
	GjfIdbpkTM5uCdKw2e/ShQvJ4UY9GOrP1uwDt1yjbSCqgm6Ej7ymlmWynyC9uHrBDRAj6U6Jude
	/ScAlAxka6gDHnW9lD79kRq48u+DypLchYrOpGFU9DaOqOI+UtQZgqLt2Fl/XV0GFEQ==
X-Gm-Gg: ASbGncuBgrCU0loAVEdB6/ccSE3FNRiuLzxPWdZxySW/ye+C97mb1TeYq8KTOcOR+4j
	Bez+cgqopWSy5cEfG9Ydj10jzJEA7OYSey0taUeIk3jwBLerfLn8x2fExL9FIn59BXJzGj2AR+n
	pPryM7PuLsT+Dr5xV9UbYRbNq49fY2xcA93ABo5WD1CwuNhtjfjLXTrdgqG/lSpNNp26JzE+b8b
	5jIkp1BkqSzlWrLK3RYofn7Y/d/1KFi+pi2fAR3L4Y2q1IxAEuusYgTUcp9bUFuDicEtA3sxMYh
	OFzTosY=
X-Received: by 2002:a5d:588b:0:b0:3a0:8442:2c48 with SMTP id ffacd0b85a97d-3a099ae9222mr2602341f8f.44.1746193605159;
        Fri, 02 May 2025 06:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGs1GZuij98mNUcVZcrNsFGm1V35jGUDgdtybLeV9BC/KcmWiOtMwk4H8uBWA4raSVAiEO2w==
X-Received: by 2002:a5d:588b:0:b0:3a0:8442:2c48 with SMTP id ffacd0b85a97d-3a099ae9222mr2602322f8f.44.1746193604732;
        Fri, 02 May 2025 06:46:44 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm91680295e9.28.2025.05.02.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:46:44 -0700 (PDT)
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
In-Reply-To: <CAMj1kXFkFCOqU2jvG_o97DzrhpXKyUd=WxPhHFA-_0ddPSvs0g@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
 <87ldrka6w6.fsf@redhat.com>
 <CAMj1kXE0WcenLEB+60=+oc+aKfbqZkwYZf-TrOyDY=ShXQ2pYw@mail.gmail.com>
 <87a57v9pt4.fsf@redhat.com>
 <CAMj1kXFkFCOqU2jvG_o97DzrhpXKyUd=WxPhHFA-_0ddPSvs0g@mail.gmail.com>
Date: Fri, 02 May 2025 15:46:43 +0200
Message-ID: <877c2z9lbw.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aj3gCTCu03tAeV5wTjjLUl1Kxeckmr3SftZTrNfa7Sc_1746193605
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_064648_698573_02F28E2E 
X-CRM114-Status: GOOD (  28.83  )
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

> On Fri, 2 May 2025 at 14:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Ard Biesheuvel <ardb@kernel.org> writes:
>>
>> > On Mon, 28 Apr 2025 at 12:59, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >>
>> >> Ard Biesheuvel <ardb@kernel.org> writes:
>> >>
>> >> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> ...
>>
>> >> >>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
>> >> >>         $(call if_changed,ld)
>> >> >>
>> >> >> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
>> >> >> index 3b2bc61c9408..d0a27905de90 100644
>> >> >> --- a/arch/x86/boot/compressed/vmlinux.lds.S
>> >> >> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
>> >> >> @@ -49,9 +49,22 @@ SECTIONS
>> >> >>                 *(.data.*)
>> >> >>
>> >> >>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
>> >> >> +#ifndef CONFIG_EFI_SBAT
>> >> >>                 . = ALIGN(. + 4, 0x200);
>> >> >> +#else
>> >> >> +               /* Avoid gap between '.data' and '.sbat' */
>> >> >> +               . = ALIGN(. + 4, 0x1000);
>> >> >> +#endif
>> >> >>                 _edata = . ;
>> >> >>         }
>> >> >> +#ifdef CONFIG_EFI_SBAT
>> >> >> +       .sbat : ALIGN(0x1000) {
>> >> >> +               _sbat = . ;
>> >> >> +               *(.sbat)
>> >> >> +               _esbat = ALIGN(0x200);
>> >> >> +               . = _esbat;
>> >> >> +       }
>> >> >> +#endif
>> >> >>         . = ALIGN(L1_CACHE_BYTES);
>> >> >>         .bss : {
>> >> >>                 _bss = . ;
>> >> >
>> >> > This looks a bit odd - see below
>> >> >
>> >> >> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
>> >> >> index b5c79f43359b..ab851490ef74 100644
>> >> >> --- a/arch/x86/boot/header.S
>> >> >> +++ b/arch/x86/boot/header.S
>> >> >> @@ -207,6 +207,19 @@ pecompat_fstart:
>> >> >>                 IMAGE_SCN_MEM_READ              | \
>> >> >>                 IMAGE_SCN_MEM_WRITE             # Characteristics
>> >> >>
>> >> >> +#ifdef CONFIG_EFI_SBAT
>> >> >> +       .ascii ".sbat\0\0\0"
>> >> >> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
>> >> >> +       .long   setup_size + ZO__sbat           # VirtualAddress
>> >> >> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
>> >> >> +       .long   setup_size + ZO__sbat           # PointerToRawData
>> >> >> +
>> >> >> +       .long   0, 0, 0
>> >> >> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
>> >> >> +               IMAGE_SCN_MEM_READ              | \
>> >> >> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
>> >> >> +#endif
>> >> >> +
>> >> >
>> >> > This puts the .sbat section at the very end of the file. However, the
>> >> > virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
>> >> > ZO__data', and so the .sbat section will overlap with .bss in the
>> >> > memory view of the image.
>> >>
>> >> Missed that, will fix, thanks! A stupid question though: does this
>> >> matter in practice for SBAT? I don't think anyone needs SBAT data after
>> >> kernel starts booting so we can consider it 'discarded'. BSS data can
>> >> then do whatever it wants.
>> >>
>> >
>> > It violates the PE/COFF spec, and some PE loaders and signing tools
>> > are very pedantic about the layout.
>>
>> Turns out it the problem is slightly harder to address then I initially
>> thought.
>
> Yeah I was afraid this was going to be tricky.
>
> ...
>
>> The problem is similar for zboot.
>
> How so?
>

zboot-header.S has:

    .ascii          ".data\0\0\0"
    .long           __data_size
    .long           _etext - .Ldoshdr
    .long           __data_rawsize
    .long           _etext - .Ldoshdr

where the difference between '__data_rawsize' and '__data_size' is:

 PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
 PROVIDE(__data_size = ABSOLUTE(_end - _etext));

and "_end" is the end of BSS. So if we put '.sbat' right after '.data'
then '.data' will cover it too (so we will get an overlap). If we put
if after '.bss' then we're going to get a hole (size of '.bss') upon
(aarch64 example):

 objcopy  -O binary arch/arm64/boot/vmlinuz.efi.elf arch/arm64/boot/vmlinuz.efi

as AFAIU it won't be able to squeeze the binary, it only truncates the
tail throwing away secions without content (in particular, '.sbat').

>> I have two ideas:
>> 1) Get back to the idea of putting '.sbat' between '.text' and '.data'
>> (was in my RFC).
>>
>
> This is what zboot does, no?
>

In v1 I put '.sbat' right after '.data' and before '.bss' but I didn't
think about the memory overlap problem.

>> 2) Introduce a separate '.bss' section to the PE binary, basically:
>>
>
> I'd like .sbat to be as unintrusive as we can make it, so this is my
> least preferred option.
>

This is very reasonable -- unless for some reason we belive that
separating '.bss' into its own PE section is a good idea on its own.

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
