Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBFFC369D3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gq1PmwzG2raXiark0/bFtYN1qeztYDQGaZti7UJcm98=; b=rjb46AZhtX4kJh
	k4iUkE2EOGdQsVcZLl9TVAhfnZu/IKh2qJOyApKKFAQLC6U24VOUzi4EMynEihgRXq+GXRO5dwvsx
	D+qeh4OG42+NtSihYDtwsCBv7XOiSPWhWUbYkXcfim6ucUaPDBkfrOxoL8m7iBesRtF3q5DIRBF2K
	tb8Gt1JKfgh0CGi/0AIrdCMmyHXX9Yqh3/QgxOHdWlpbGTrdHJZvp93abaGDQuEZB0wNcarz3GCAX
	352HQ3uaBxchE+LJPxc4JxrFjP7tItJy7P04vN/pyl8HNGlwekYQI0Gk8qAWGO6MS2x0R25748sYi
	VKpZIMpxxzTKzXXWLkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MHr-00000005sgD-2ENl;
	Mon, 28 Apr 2025 11:04:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MDB-00000005rzP-025D
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 10:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745837982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1S1GQtMqLXYO4RQQUYg3g09QNCmMVEz/isjWKDgecM=;
	b=cwbR9m2Lu8Bg/38NlWOh7Wu7OiGORJdyBS5MC3BtyQEPaOsoeWS34obmNZNlhXoobqwGhg
	DQQ8px+UYZAQht7efuKV0vQkw2m0qZSQluEBCEPDra5r6TL5l4lUye2XuvVowGy1tgV47e
	FrrFanEUba7RK2yB8wBTImtTnEH1kVU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-sgsqBTVgOLmgyURwQ5c9vA-1; Mon, 28 Apr 2025 06:59:40 -0400
X-MC-Unique: sgsqBTVgOLmgyURwQ5c9vA-1
X-Mimecast-MFC-AGG-ID: sgsqBTVgOLmgyURwQ5c9vA_1745837980
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso32955465e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 03:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837979; x=1746442779;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1S1GQtMqLXYO4RQQUYg3g09QNCmMVEz/isjWKDgecM=;
        b=kPCoxTO2MV+nE9HKh8zKh2cNC9bSn7C1cWTyYmPKWpnkeRSdi2OjihWGq3oGuWT8ig
         d5tgKx5O3vYMfG2uFuvat4nvEnPzl5/WIoWpa/cS3I/bSPBUAf92kXnJZHwEqaA9Ke8i
         NONtf6pGFrWxcU+E8fj9QEpmxt3NdREkkPjNEIJxIa76yx26Rz8+UPrO6SGQWqST8LTO
         AaZRuhuaLhdjOMFQ9ETzuWCqvhBpe0wnpYWjJDuHBOEA6bc4F70zBFtF/9fEpS94ZOXS
         MMQ5Nq0L9Yj0pHLht8nKwPQv6hf04tRLLpu9A1fFuka7pwcBr0TViuQXE3nCVqWbMTR2
         i58A==
X-Forwarded-Encrypted: i=1; AJvYcCUhRawWT7cbCqei6tm/CJMq/aPXSv37bBZVY08p5XXQudRmWfxs4/5MJUV7tgUWLdzV2/DYmy1SgsQjEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2OXOx0A1yvbJNhWR3lBPbSZtEBXJGh+WcZnEuHKsKJL4mqIOC
	rfVuOJ5XHTcJ8vzwRSM2W6oDXEl29HvrE54hDvoKP5A4WuC7H8tqyiLJak2Alt5aEJBH1qS4r1s
	OwjQP2uG1XhgsIJdWm8ERbMFp6HvJ8+tvbh+1IlT7pyVW1c0SpsknGyd9Fb6EXxGqmg==
X-Gm-Gg: ASbGnctg0Gi9gVbk809HHapLalKQ9y2PDMuOb8QbVO6xzNI/3y7n97BBF6B78RBO4hJ
	FENuixY0F9/+i9KVXWhTGc+etYOxvUNGUF2mv5bQC7aSd/vzd6JQdza1c4UjXT+c2445GDub6TX
	ms4XDdFIYcf9Tqb+/Wh5LW2uJFSWrsebv8vIFo8+OlnlX5kxQAzkStbfktOb2A3OmkGaucLTFNR
	H+KmtnVsN19tp0xftrM8N30So2KJnsQZlFD7yoWMmZhmqoZ9J6v3tCRfxajw9blkGHwTbHT3YDG
	jK+zUkU=
X-Received: by 2002:a05:600c:138c:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-440ab76a962mr68871425e9.5.1745837979455;
        Mon, 28 Apr 2025 03:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3yhCzFV9b07iIXPnMiZwoDz9SPGqteJaLn0qdABKCE9uf+MOeasr/lE8Q+wKF9OZr7Up4LQ==
X-Received: by 2002:a05:600c:138c:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-440ab76a962mr68871015e9.5.1745837978978;
        Mon, 28 Apr 2025 03:59:38 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm102888495e9.2.2025.04.28.03.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:59:38 -0700 (PDT)
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
In-Reply-To: <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
Date: Mon, 28 Apr 2025 12:59:37 +0200
Message-ID: <87ldrka6w6.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q07Lgn-HMeZVMv5AQbYqxMfDPRoPTfE29yUifZJ3QK0_1745837980
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_035945_128963_32DBB8F5 
X-CRM114-Status: GOOD (  26.64  )
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

> On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Similar to zboot architectures, implement support for embedding SBAT data
>> for x86. Put '.sbat' section to the very end of the binary.
>>
>> Note, the obsolete CRC-32 checksum (see commit 9c54baab4401 ("x86/boot:
>> Drop CRC-32 checksum and the build tool that generates it")) is gone and
>> while it would've been possible to reserve the last 4 bytes in '.sbat'
>> section too (like it's done today in '.data'), it seems to be a pointless
>> exercise: SBAT makes zero sense without a signature on the EFI binary so
>> '.sbat' won't be at the very end of the file anyway. Any tool which uses
>> the last 4 bytes of the file as a checksum is broken with signed EFI
>> binaries already.
>>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  arch/x86/boot/Makefile                 |  2 +-
>>  arch/x86/boot/compressed/Makefile      |  2 ++
>>  arch/x86/boot/compressed/vmlinux.lds.S | 13 +++++++++++++
>>  arch/x86/boot/header.S                 | 13 +++++++++++++
>>  drivers/firmware/efi/Kconfig           |  2 +-
>>  5 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
>> index 81f55da81967..5f7b52f0e7f5 100644
>> --- a/arch/x86/boot/Makefile
>> +++ b/arch/x86/boot/Makefile
>> @@ -71,7 +71,7 @@ $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
>>
>>  SETUP_OBJS = $(addprefix $(obj)/,$(setup-y))
>>
>> -sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|z_.*\)$$/\#define ZO_\2 0x\1/p'
>> +sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|_e\?sbat\|z_.*\)$$/\#define ZO_\2 0x\1/p'
>>
>>  quiet_cmd_zoffset = ZOFFSET $@
>>        cmd_zoffset = $(NM) $< | sed -n $(sed-zoffset) > $@
>> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
>> index fdbce022db55..b9b80eccdc02 100644
>> --- a/arch/x86/boot/compressed/Makefile
>> +++ b/arch/x86/boot/compressed/Makefile
>> @@ -107,6 +107,8 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
>>  vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
>>  vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>>
>> +vmlinux-objs-$(CONFIG_EFI_SBAT) += $(objtree)/drivers/firmware/efi/libstub/sbat.o
>> +
>
> Please drop this, and put the .incbin directly into header.S
>

Sure, but as I also commented on zboot patch, we need a logic to track
possible sbat data changes and rebuild when needed. 'sbat.o' was
convenient because we can have this tracking logic in one place (zboot)
and make will do the rest. If we are to drop 'sbat.o', we will need the
tracking logic both in zboot and x86.

>>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
>>         $(call if_changed,ld)
>>
>> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
>> index 3b2bc61c9408..d0a27905de90 100644
>> --- a/arch/x86/boot/compressed/vmlinux.lds.S
>> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
>> @@ -49,9 +49,22 @@ SECTIONS
>>                 *(.data.*)
>>
>>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
>> +#ifndef CONFIG_EFI_SBAT
>>                 . = ALIGN(. + 4, 0x200);
>> +#else
>> +               /* Avoid gap between '.data' and '.sbat' */
>> +               . = ALIGN(. + 4, 0x1000);
>> +#endif
>>                 _edata = . ;
>>         }
>> +#ifdef CONFIG_EFI_SBAT
>> +       .sbat : ALIGN(0x1000) {
>> +               _sbat = . ;
>> +               *(.sbat)
>> +               _esbat = ALIGN(0x200);
>> +               . = _esbat;
>> +       }
>> +#endif
>>         . = ALIGN(L1_CACHE_BYTES);
>>         .bss : {
>>                 _bss = . ;
>
> This looks a bit odd - see below
>
>> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
>> index b5c79f43359b..ab851490ef74 100644
>> --- a/arch/x86/boot/header.S
>> +++ b/arch/x86/boot/header.S
>> @@ -207,6 +207,19 @@ pecompat_fstart:
>>                 IMAGE_SCN_MEM_READ              | \
>>                 IMAGE_SCN_MEM_WRITE             # Characteristics
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +       .ascii ".sbat\0\0\0"
>> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
>> +       .long   setup_size + ZO__sbat           # VirtualAddress
>> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
>> +       .long   setup_size + ZO__sbat           # PointerToRawData
>> +
>> +       .long   0, 0, 0
>> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
>> +               IMAGE_SCN_MEM_READ              | \
>> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
>> +#endif
>> +
>
> This puts the .sbat section at the very end of the file. However, the
> virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
> ZO__data', and so the .sbat section will overlap with .bss in the
> memory view of the image.

Missed that, will fix, thanks! A stupid question though: does this
matter in practice for SBAT? I don't think anyone needs SBAT data after
kernel starts booting so we can consider it 'discarded'. BSS data can
then do whatever it wants.

>
>
>>         .set    section_count, (. - section_table) / 40
>>  #endif /* CONFIG_EFI_STUB */
>>
>> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
>> index 2edb0167ba49..5022a378fec1 100644
>> --- a/drivers/firmware/efi/Kconfig
>> +++ b/drivers/firmware/efi/Kconfig
>> @@ -283,7 +283,7 @@ config EFI_EMBEDDED_FIRMWARE
>>
>>  config EFI_SBAT
>>         bool "Embed SBAT section in the kernel"
>> -       depends on EFI_ZBOOT
>> +       depends on EFI_ZBOOT || (EFI_STUB && X86)
>>         help
>>           SBAT section provides a way to improve SecureBoot revocations of UEFI
>>           binaries by introducing a generation-based mechanism. With SBAT, older
>> --
>> 2.49.0
>>
>>
>

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
