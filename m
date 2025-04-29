Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B82C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRFZpC1FGIHwZyipwfTX/nA8brUbOHd2sGmH160fks8=; b=XT4bsL1hzeJvhq
	uPEWwCkrF/OeC8IXCC3BIwyKJs1oHdtdQ3kkv9/f35FYo+ekmlo2dSoQ8VRoS4Nvy6UIQbaegCBk9
	+TJ6gCjwf6ajkcQiq4fZFmWCGOBDA+jy1+5VFv8XCh1SuLSI2WTKqdDIWcWaPziI7psq/YsHm0enB
	kVFIpMvYunF3rz0hyg4F/w1C5U6z4/tZPXrU0c7g63sJ2xJc0vA7cfA4OZq3n0hriEYrp0VfgxdY+
	0jwzmcKkNF4myCJuGGUERKTnmT3hMfe3QoSdYYJYX0ME0VVo+KFU8oJ4m/i1Fiv+wG/0WMTOnzdrR
	Z+KpjMR36J/z9OSR5fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hgh-00000009DQz-1ALh;
	Tue, 29 Apr 2025 09:55:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hge-00000009DPj-3mye
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 09:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745920535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xntjKgnfwZOTv8Lz3QOtpBAGgzG+hyrtl5zomojulJw=;
	b=JKcVKfH5DPOdx1Dn63HCw0g6tyYgOJ9XZjIgjq8jcUtTzmwzUyjlW5ncVhScoNu33oSzWp
	V94pRGpgrdsDfJeinjBhLG7h5ycxW/kCpBTmPeXIIq8cva1xFHb4pcevBwKy4V6YznxlLA
	Ev4c5t0daOq1iKmbZRGoO/Rkn9kbY9Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-t0dadHA_Oh2VIae0Lwimhg-1; Tue, 29 Apr 2025 05:55:33 -0400
X-MC-Unique: t0dadHA_Oh2VIae0Lwimhg-1
X-Mimecast-MFC-AGG-ID: t0dadHA_Oh2VIae0Lwimhg_1745920532
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912e4e2033so1859512f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 02:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920532; x=1746525332;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xntjKgnfwZOTv8Lz3QOtpBAGgzG+hyrtl5zomojulJw=;
        b=fuBuQEvVQuCHRUGKvQ5MJCQM/pbRWQVU+4XfpSyeoPXoqBa3nrhLD/FvKtO24sq4Sn
         +CctihXbKguuK5Rpj+QNtRMSoCWoas+AMkv3o2KoEcZAPomfVRdjzDqwgKmXgVaSIEp2
         8viGHcQ2xCvpE1YugmIAnnCvutwbEi1j0gUylVgBPbZq2iSjNWynGqeNx5DT+y2VXs7d
         Ns6b13sRqltQOBi28NO4xgd1A8pwbc6kO1pSbAhF2u8Pdu7oewpMuWmgoNfrGpJNyvWw
         tUMBH/ca0MXQuK8ZMy7W+zxBdla/gwCCnjS4mQWBGN5fhVmoYW7LSQkH2x5+omm26CpR
         tAYg==
X-Forwarded-Encrypted: i=1; AJvYcCXq8viM1Qt3U2lwLI+G+3O1abHl9SQZeZAma11vgTR6on/oljSbYf87LnnKlurM0FJwyD0qX3t3CC/Vwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTKeba30Mzoj1Utrw+SL9gPzTJyyZGoVpZcoGTSHr+I1O4xQ9M
	2MNCp66ELDXSKb1H9eQDTkzdFumvE7PH2I15zzEzINW2yVt1mLTzaWVlNBcThIQc35KaoSXIMNJ
	aCbm6l47FZlBcE7vZy1ImnUYrqHhtAgbPLIUphmWAA4T/5bO6gxxZhTfe2QjWRaB4+A==
X-Gm-Gg: ASbGncv1mJbUfAiLv1Ai48zGEIxv5E99yknmtRg/XAMHj/F7nlDq63094kSbIwEbAWY
	ka1XgrLchL8u8/cAdS4/SwKu5h/vlx0U4mvN8XSuG7rQf09WE3mForLZtmQI6A4zgkw6Pnof7z7
	oQpGYPY77BkCOaTtWQWPhsrQ2BZ2jkVuduWvVRWqSF4SEyJTNkVmk8fVMQYDol8DNBjaUDSALFE
	XqgOPBXFbY9sknkXQ/aj3qI4wk+Yve92GYoVCgq3Zw7Ngrlg8NBvZNWQde6PeaPsVe6wukzkjF6
	qwJIcmI=
X-Received: by 2002:a05:6000:310f:b0:3a0:8ac0:e496 with SMTP id ffacd0b85a97d-3a08ac0e542mr1848852f8f.7.1745920532196;
        Tue, 29 Apr 2025 02:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfIWeyLjpuG6s2coM0Lu8kDibF6g1giWUUP9D7vYfEQD+QdfZivGSCk1W0/tffaKL2WnLAcw==
X-Received: by 2002:a05:6000:310f:b0:3a0:8ac0:e496 with SMTP id ffacd0b85a97d-3a08ac0e542mr1848828f8f.7.1745920531827;
        Tue, 29 Apr 2025 02:55:31 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c7d1sm13359287f8f.83.2025.04.29.02.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:55:31 -0700 (PDT)
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
Date: Tue, 29 Apr 2025 11:55:29 +0200
Message-ID: <87ikmn9tri.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9BThhbFTSWHqtyatOvlVkQKy9c6l0l3uP1WExN-EKB0_1745920532
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_025537_020633_9B32926A 
X-CRM114-Status: GOOD (  11.29  )
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

...

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

I'm sorry I'm probably missing something important but my understanding
is that that header.S is compiled into setup.elf:

 ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments  -m elf_i386 -z
 noexecstack -T arch/x86/boot/setup.ld  ... arch/x86/boot/header.o ...  -o arch/x86/boot/setup.elf

and then the result gets concatenated with vmlinux.bin to get bzImage:

 objcopy  -O binary arch/x86/boot/setup.elf arch/x86/boot/setup.bin
 cp arch/x86/boot/setup.bin arch/x86/boot/bzImage; truncate -s %4K arch/x86/boot/bzImage; cat arch/x86/boot/vmlinux.bin >>arch/x86/boot/bzImage

so if we want to have SBAT at the very end of bzImage without dirty
tricks it must be at the very end of vmlinux.bin, not setup.bin. I can,
of course, use some existing compilation unit but to be honest I can't
find anything suitable.

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
