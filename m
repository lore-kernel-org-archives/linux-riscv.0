Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A36C3ABA9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eBR171TP7qARsYGdVPLSXmOF6n2/2x3LZoGzHWtqYk=; b=ofOvs1Cxc//Di/
	eAB5tL63YXlR/tYFuftPTx2jOV6Ofvj4QQplWzzHkdTCGPmLBGjM6c2uqFwD+hQRCHMHR2CIpct05
	Ef2wfku23QXVC6ykdkRd3ub/04zJ6ONjWfYyAUc1G1bpS8rupG/IUT10giwyjkc+GOnLyJO9HQTdq
	IZpoFdjzVpxu9Y05KgR8+USANxhewGhvgOJX6QAZxhvHZpSViKOjlDl9RaQQCBf2k34AbxCistBnR
	cyhK/VRYKMHuXDguqSiReuEZS+gT3KAiwWqbDImseqFJ0U6QDL+IRqTFy4ahpmeZ8H1gsk9uVjyFr
	8H9GGsyf17JvU7H8CgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i9J-00000009Ioj-3lqd;
	Tue, 29 Apr 2025 10:25:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i8b-00000009Iee-3tyV
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 10:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745922268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJDenMq4UnA+J9tvrAddv1d5fx82EYV9asQIQ+z0GZg=;
	b=DotFVh0Gtb3O5xoiU+GtjQHmiqkA9OwDc+Y0nFZEinFlkifbcCVyFoZS9jl3TWCg0HxHab
	kRSUU/7tE1zqTNGTLgB6M4Gz1xMKV9nu4v8joLbQ1AAiLx+DYVei3zEtZMyY4/i/dwlFMv
	/nXJeM58fG/FK1v30atsti+wtO+BMRw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-H2RkD4euMDeeWkxr5OpaeQ-1; Tue, 29 Apr 2025 06:24:27 -0400
X-MC-Unique: H2RkD4euMDeeWkxr5OpaeQ-1
X-Mimecast-MFC-AGG-ID: H2RkD4euMDeeWkxr5OpaeQ_1745922266
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so35624925e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 03:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922266; x=1746527066;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJDenMq4UnA+J9tvrAddv1d5fx82EYV9asQIQ+z0GZg=;
        b=esPEvPzEBvmsGRKnVGfQkjGvPgFw5DBRKmnvJPTD6M7peSw5oK2S0BgSBqjLPIcIBF
         zkDssKZP9FuHPYx1/yprDtQQWmoLHQJREZy3xR7Q2MuCvFFQeBP6PeKJ8xfuNPg+cGmx
         r1c4Ty4sIwQCsSdrByq2iHQiJSwg8mANRp/d5IMczHHStN7KHO7nhEatV+5LPCppIirP
         8Vw2DBxHgXXRjZBpr2cTmWNcfT6Bd53ur/kj6bqwU2whXdgO1HGVvduOictE00cFxpUE
         fj8N9zj1vPYGivpioQnZpZWh+c1szmHeMJb8GGux+P7MimX6ZVgU6hy/fvyVB2SYrcwg
         0qcw==
X-Forwarded-Encrypted: i=1; AJvYcCWnctfM09T0oOuiD7soanxsGaLNxss0bSSM6HQ2B8eszMfc5WJuq7ckPqJvzMmtyVQjxfdgwYWHdOsm0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7TmEp3DeDTM4Zvf5E8QOhcEawrIiimcVBvlMUaw6fQAulNxj9
	Pr5ECKodh+syoPXCIlFtaVAizLD0t2E7bYHOGLmp76MKhrfHe76wvxYbiysoX7UqLTs8yAW6SP3
	Qmgs/GUGrUdxjBLHc7a8b0QxuqPMKeQmrY7PF6B4mB84oBGe/X6HF0RkEbqg1jD2RRg==
X-Gm-Gg: ASbGncuCeHy1hu/QuYNY5gyLd35cMWLPE87FftTkPPIib1c8HQnGTs/NcAnQtNscI4T
	5ONzgB99EqBtNLkfgz4XJfSbqDhuFcLF3/wSd0cDbaxQCxmWn9L9DpPyGRoJd/BDiYj6sC3v3zj
	+4GOeWSoeMLyl3xJ+n1DCnc5UZOv6HZq8D9wdnE6TxgOJXrXCZi/zQqr+iDctaH4k3kfmYtZm9/
	c+qusRDPR6B+4VJsfYW6hdS4ZxkQPz4w/S1SAeLQye4Nt0/oCjQMZgNU7/xe9YqIPGGHk3CH4Fs
	3tV3tdQ=
X-Received: by 2002:a05:600c:35d5:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-441ad3b964cmr18549705e9.13.1745922265746;
        Tue, 29 Apr 2025 03:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCuK0SnkDnf6F2mCzzqm8B+HP2+9+Mxx8hNK6OkeTe6Yi/IGcxXyhQ2mE6S12P8pv8w1eJVQ==
X-Received: by 2002:a05:600c:35d5:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-441ad3b964cmr18549445e9.13.1745922265315;
        Tue, 29 Apr 2025 03:24:25 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cdasm154962675e9.31.2025.04.29.03.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:24:24 -0700 (PDT)
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
In-Reply-To: <CAMj1kXHTtGP-UcJLut7OVUuULzg59npyoQhb+kuCZO5x-2NYWA@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
 <87ikmn9tri.fsf@redhat.com>
 <CAMj1kXHTtGP-UcJLut7OVUuULzg59npyoQhb+kuCZO5x-2NYWA@mail.gmail.com>
Date: Tue, 29 Apr 2025 12:24:23 +0200
Message-ID: <87cycv9sfc.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FbFCfV97gjTiieJTvFGRP-t0-9BtG2QrOWhmdPSUpSA_1745922266
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_032430_091027_5C0FAFD9 
X-CRM114-Status: GOOD (  18.93  )
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

> On Tue, 29 Apr 2025 at 11:55, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Ard Biesheuvel <ardb@kernel.org> writes:
>>
>> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> ...
>>
>> >> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
>> >> index fdbce022db55..b9b80eccdc02 100644
>> >> --- a/arch/x86/boot/compressed/Makefile
>> >> +++ b/arch/x86/boot/compressed/Makefile
>> >> @@ -107,6 +107,8 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
>> >>  vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
>> >>  vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>> >>
>> >> +vmlinux-objs-$(CONFIG_EFI_SBAT) += $(objtree)/drivers/firmware/efi/libstub/sbat.o
>> >> +
>> >
>> > Please drop this, and put the .incbin directly into header.S
>> >
>>
>> I'm sorry I'm probably missing something important but my understanding
>> is that that header.S is compiled into setup.elf:
>>
>>  ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments  -m elf_i386 -z
>>  noexecstack -T arch/x86/boot/setup.ld  ... arch/x86/boot/header.o ...  -o arch/x86/boot/setup.elf
>>
>> and then the result gets concatenated with vmlinux.bin to get bzImage:
>>
>>  objcopy  -O binary arch/x86/boot/setup.elf arch/x86/boot/setup.bin
>>  cp arch/x86/boot/setup.bin arch/x86/boot/bzImage; truncate -s %4K arch/x86/boot/bzImage; cat arch/x86/boot/vmlinux.bin >>arch/x86/boot/bzImage
>>
>> so if we want to have SBAT at the very end of bzImage without dirty
>> tricks it must be at the very end of vmlinux.bin, not setup.bin. I can,
>> of course, use some existing compilation unit but to be honest I can't
>> find anything suitable.
>>
>
> Yeah, you're right. I keep forgetting the insane way the bzImage is
> put together.
>
> So you'll need to incorporate $(CONFIG_EFI_SBAT_FILE) into
> arch/x86/boot/vmlinux. But that does not mean it needs to be
> constructed under drivers/firmware/efi/libstub, and it also doesn't
> mean you need filechk and a separate .o file, right?

Right, it just needs to be somewhere and this somewhere needs to depend
on the SBAT data to track its possible updates. E.g. looking at asm
files in arch/x86/boot/compressed/ (which go to vmlinux) I see:

arch/x86/boot/compressed/head_32.S
arch/x86/boot/compressed/head_64.S
arch/x86/boot/compressed/idt_handlers_64.S
arch/x86/boot/compressed/kernel_info.S
arch/x86/boot/compressed/la57toggle.S
arch/x86/boot/compressed/mem_encrypt.S
arch/x86/boot/compressed/piggy.S
arch/x86/boot/compressed/tdcall.S

and honestly I don't know which one to pick :-( An alternative would be
to create separate 3-line sbat.S files for x86 and zboot and then make
sbat.o dependent on CONFIG_EFI_SBAT_FILE but that would not satisfy all
the requirements as sbat.o stays)

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
