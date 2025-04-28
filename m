Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764E1C369DC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLeAX229qAgDo4zgGKb47TgS5/Tst1R+i9LbRn0mKbA=; b=oPudrGJPtkFlJY
	JF7iI/I4uSGRp4m4zAaGMBROH9yUqK+ToUJVCh/wiaFum3bMw4DM34wned7I6UgVLgScBnEdSfe9Z
	oLyjuienPNQwvQ5R5qDPSy1WS5twZmF0ct1rakUBUlwzs34ax/Cnr6MYubsAYGiFnTHIPX+3MogpB
	Ca2DKF+I79X0qkLfvxs+RyEcwvtMhUXCz/9hgTGZgiNEAOVXPAb6ukimi+/2Q+3FeVf/UfJ6UCa7S
	i/7/rYaJA1akQdUmuFaDicogUUf5psSIPTsx8UdO6p+1vbGLUPQIAqd1dRg0NtF1qBBys5wLhQlmq
	/4HBeSifnqvvhehtGRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MDz-00000005s95-3v3p;
	Mon, 28 Apr 2025 11:00:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M8P-00000005rHb-2Ix2
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Apr 2025 10:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=; b=oXdafcsrhF3DU9CPCPR2SxIJ46
	pUVvufoxvQoWC5An7N4yLzkPWFhidiJAwpCAq8LbtQbUHo5wb9N58T2HedN4zOlWyYXcfJdWtLUco
	wQdFUf86Bl2zv1ZdxLDCp+9kfiZExfxss0lgJ3oGFpk538fCnEHGSlDhN4prOI4Vx0fqwdPUZfV0d
	741fizeEZgdg7DunVwe/3WfrXe4OFxjXW7jALELkGGujc8dS3szS7S5M7AnbH9fH2zK/Vt4FU7MxO
	tTIZ1lUBW6tpadAxZvNIOQg41YTc7cZigEdRopojfFR/hBtL+nB8WIHcQPoZQpqhg9aYGWZi7gDAC
	0bkEW0jg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9M8K-0000000CgHY-3T36
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 10:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745837673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=;
	b=TrT2KyjCE5QnuMAJhiAKjkeYXFynUM9iMfdiqJQDiQ4FmT/3TCmkPmB3o4o+SOG55ea2y+
	PyHGbQkCk659YRxYLtRp1nCSIWFKFrDB2UoPTMTuQUKcKRvyz+1o4mJ0JLECysjGltsRYz
	LvDLSBxWxc/j2SqK0oLQKPMKiHD9ktE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745837680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=;
	b=BLClhXnCi2z9ax5kyI8VtYQ0YZswi5XK9q9pNnvzfrUwc6Vhn6MUBtM0jieqowj3dqmvO7
	XtbetG5XPmnsRWtk2C2tOjHt4knmFQWWKNdqHCNmAGY2GZ5LV7Mf7MkaPfe54O4rbnJ7Ny
	E635ptvdpEITwzfgcE5k4BEWMfTQfvk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-0VvScXf3PvCcliW0vY1o5w-1; Mon, 28 Apr 2025 06:54:31 -0400
X-MC-Unique: 0VvScXf3PvCcliW0vY1o5w-1
X-Mimecast-MFC-AGG-ID: 0VvScXf3PvCcliW0vY1o5w_1745837670
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so23959155e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837670; x=1746442470;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=;
        b=KuAlNoX/94gLc1RdJdD8UjUj5TCl8MPIkryPyFX7z44b0cnY3VEUgrja1C+z3zZmVB
         BYL7PZqqShee1oGbAeP1rIgWisEOpb1v/NbHokK3x5aVGIpATf+Wg24vNuCv4Fv7ae/A
         Ul/2t1/oWocjPNwybYDeBuINLakcSokHNdf2+BN/igZsMWSituUj0Z9IRd8ZWJW2otUk
         rhzsZyCAwzrR+m0Vrqv0GVQSUQMcd7HhuPJDZZtvoyMbUw11wgRP17M9EYkFk4yuM9ji
         58fXh4GRhQcsgQTPMYaFb1i5xb9SC8NPyfvUSgdrocf8YZKc2ymg1K6ERP823c5hJpQN
         x87A==
X-Forwarded-Encrypted: i=1; AJvYcCVbeyZnT+ZPg+doxtTGpZ49LjkXGz1lWHz3pgsd6T4jjdrcR0JZ7A31Z36h6OpUn81gwEH2dsNkRmKlIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW9PCYYq2kKdPbEvXPMUJiNFhEoT3yjD2qoLfIBF3XdUKsUQbi
	uhXad3pLwxNmTh+yBSYmHV/r88PdpaCbX9YC8bj80byshKO1aCnx94n2C9V4LTdodSZknDa+gcx
	AD9361L2c3Q8VjZbhcCAyOllkBvTepE8VW18+GMkGcbf3yhQruS6mRTR4ftuDpfytxw==
X-Gm-Gg: ASbGncvS1TDjg9J4EYWaS5RU3dTykKJpS6lME+yKrFv5qu51wR2J/TQHA1pUky61wBm
	YZxbFpDvhJSU1f6Bz3Ce89zdasVp12ifE4zvkUMgxwtYEoWEUqpCE1hM9bUnjNb9vIrqMSN745X
	dGKtwSNuW+RdET8EZrWXe4N9tF/ptTtudz5zahHKSnaC1OyNTxtMlELgBA3KbVp0bmUrZoIESxd
	FkUUDyqKY7kcvagrnoy7212OWb7rCuTZLrnQh244RqGgDh0IbbRULQtwvkFJdxPpcYWsQekeOPA
	1Vx+RxI=
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr90565375e9.10.1745837670331;
        Mon, 28 Apr 2025 03:54:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWN38u2JhWDwqPy6JXuY84JTovfHFRGLcF3m5SfbosWG675z9E1F2DXDYB5118UF5AWfcjaA==
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr90565035e9.10.1745837669916;
        Mon, 28 Apr 2025 03:54:29 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46454sm10839008f8f.78.2025.04.28.03.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:54:29 -0700 (PDT)
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
Subject: Re: [PATCH 1/2] efi/libstub: zboot specific mechanism for embedding
 SBAT section
In-Reply-To: <CAMj1kXHqmOiNX_DH+8uSsTROzR+hgvZ5DyE=3wVE7-dQ+2BW=Q@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-2-vkuznets@redhat.com>
 <CAMj1kXHqmOiNX_DH+8uSsTROzR+hgvZ5DyE=3wVE7-dQ+2BW=Q@mail.gmail.com>
Date: Mon, 28 Apr 2025 12:54:27 +0200
Message-ID: <87o6wga74s.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: op33msO9B4LXEUOxQtWMQhtNEJG263ROqJpVhMnMIwc_1745837670
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_115445_225601_0CB0103D 
X-CRM114-Status: GOOD (  38.63  )
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

> Hi Vitaly,
>

Ard, thanks for the review!

> On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
>> by introducing a generation-based technique. Compromised or vulnerable UEFI
>> binaries can be prevented from booting by bumping the minimal required
>> generation for the specific component in the bootloader. More information
>> on the SBAT can be obtained here:
>>
>> https://github.com/rhboot/shim/blob/main/SBAT.md
>>
>> Upstream Linux kernel does not currently participate in any way in SBAT as
>> there's no existing policy in how SBAT generation number should be
>> defined. Keep the status quo and provide a mechanism for distro vendors and
>> anyone else who signs their kernel for SecureBoot to include their own SBAT
>> data. This leaves the decision on the policy to the vendor. Basically, each
>> distro implementing SecureBoot today, will have an option to inject their
>> own SBAT data during kernel build and before it gets signed by their
>> SecureBoot CA. Different distro do not need to agree on the common SBAT
>> component names or generation numbers as each distro ships its own 'shim'
>> with their own 'vendor_cert'/'vendor_db'
>>
>> Implement support for embedding SBAT data for architectures using
>> zboot (arm64, loongarch, riscv). Build '.sbat' section along with libstub
>> so it can be reused by x86 implementation later.
>>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  drivers/firmware/efi/Kconfig                | 25 +++++++++++++++++++++
>>  drivers/firmware/efi/libstub/Makefile       |  7 ++++++
>>  drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
>>  drivers/firmware/efi/libstub/sbat.S         |  7 ++++++
>>  drivers/firmware/efi/libstub/zboot-header.S | 14 ++++++++++++
>>  drivers/firmware/efi/libstub/zboot.lds      | 17 ++++++++++++++
>>  6 files changed, 72 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/firmware/efi/libstub/sbat.S
>>
>> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
>> index 5fe61b9ab5f9..2edb0167ba49 100644
>> --- a/drivers/firmware/efi/Kconfig
>> +++ b/drivers/firmware/efi/Kconfig
>> @@ -281,6 +281,31 @@ config EFI_EMBEDDED_FIRMWARE
>>         bool
>>         select CRYPTO_LIB_SHA256
>>
>> +config EFI_SBAT
>> +       bool "Embed SBAT section in the kernel"
>> +       depends on EFI_ZBOOT
>> +       help
>> +         SBAT section provides a way to improve SecureBoot revocations of UEFI
>> +         binaries by introducing a generation-based mechanism. With SBAT, older
>> +         UEFI binaries can be prevented from booting by bumping the minimal
>> +         required generation for the specific component in the bootloader.
>> +
>> +         Note: SBAT information is distribution specific, i.e. the owner of the
>> +         signing SecureBoot certificate must define the SBAT policy. Linux
>> +         kernel upstream does not define SBAT components and their generations.
>> +
>> +         See https://github.com/rhboot/shim/blob/main/SBAT.md for the additional
>> +         details.
>> +
>> +         If unsure, say N.
>> +
>> +config EFI_SBAT_FILE
>> +       string "Embedded SBAT section file path"
>> +       depends on EFI_SBAT
>> +       help
>> +         Specify a file with SBAT data which is going to be embedded as '.sbat'
>> +         section into the kernel.
>> +
>
> Can we simplify this? CONFIG_EFI_SBAT makes no sense if
> CONFIG_EFI_SBAT_FILE is left empty. If you really need both symbols,
> set EFI_SBAT automatically based on whether EFI_SBAT_FILE is
> non-empty.

Sure, but FWIW, I modelled this after MODULE_SIG/MODULE_SIG_KEY and
BOOT_CONFIG_EMBED/BOOT_CONFIG_EMBED_FILE where the selection is also
2-step -- do you think EFI_SBAT/EFI_SBAT_FILE case is different?

>
>>  endmenu
>>
>>  config UEFI_CPER
>> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
>> index d23a1b9fed75..5113cbdadf9a 100644
>> --- a/drivers/firmware/efi/libstub/Makefile
>> +++ b/drivers/firmware/efi/libstub/Makefile
>> @@ -105,6 +105,13 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
>>  extra-y                                := $(lib-y)
>>  lib-y                          := $(patsubst %.o,%.stub.o,$(lib-y))
>>
>> +extra-$(CONFIG_EFI_SBAT)       += sbat.o
>> +$(obj)/sbat.o: $(obj)/sbat.bin
>> +targets += sbat.bin
>> +filechk_sbat.bin = cat $(or $(real-prereqs), /dev/null)
>> +$(obj)/sbat.bin: $(CONFIG_EFI_SBAT_FILE) FORCE
>> +       $(call filechk,sbat.bin)
>> +
>
> Please get rid of all of this, and move the .incbin into
> zboot-header.S

The main prupose of this logic is to track possible sbat data
changes. E.g. if the file with SBAT data has changed, then we need to
rebuild the kernel binary. If we just use a raw 'incbin' somewhere and
don't add a specific Makefile dependency, then the logic will be lost.

I think I can drop the dedicated 'sbat.S' and use zboot-header.S but I'd
like to keep at least the 'filechk' part: we compare what's in
EFI_SBAT_FILE with 'sbat.bin' copy and, if things have changed, rebuild.

>
>
>>  # Even when -mbranch-protection=none is set, Clang will generate a
>>  # .note.gnu.property for code-less object files (like lib/ctype.c),
>>  # so work around this by explicitly removing the unwanted section.
>> diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
>> index 48842b5c106b..3d2d0b326f7c 100644
>> --- a/drivers/firmware/efi/libstub/Makefile.zboot
>> +++ b/drivers/firmware/efi/libstub/Makefile.zboot
>> @@ -44,7 +44,8 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
>>  $(obj)/zboot-header.o: $(srctree)/drivers/firmware/efi/libstub/zboot-header.S FORCE
>>         $(call if_changed_rule,as_o_S)
>>
>> -ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
>> +ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a \
>> +          $(if $(CONFIG_EFI_SBAT),$(objtree)/drivers/firmware/efi/libstub/sbat.o)
>>
>
> Drop this too
>
>>  LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
>>  $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
>> diff --git a/drivers/firmware/efi/libstub/sbat.S b/drivers/firmware/efi/libstub/sbat.S
>> new file mode 100644
>> index 000000000000..4e99a1bac794
>> --- /dev/null
>> +++ b/drivers/firmware/efi/libstub/sbat.S
>> @@ -0,0 +1,7 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Embed SBAT data in the kernel.
>> + */
>> +       .pushsection ".sbat","a",@progbits
>> +       .incbin "drivers/firmware/efi/libstub/sbat.bin"
>> +       .popsection
>> diff --git a/drivers/firmware/efi/libstub/zboot-header.S b/drivers/firmware/efi/libstub/zboot-header.S
>> index fb676ded47fa..f2df24504fc5 100644
>> --- a/drivers/firmware/efi/libstub/zboot-header.S
>> +++ b/drivers/firmware/efi/libstub/zboot-header.S
>> @@ -135,6 +135,20 @@ __efistub_efi_zboot_header:
>>                         IMAGE_SCN_MEM_READ | \
>>                         IMAGE_SCN_MEM_WRITE
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +       .ascii          ".sbat\0\0\0"
>> +       .long           __sbat_size
>> +       .long           _edata - .Ldoshdr
>> +       .long           __sbat_size
>> +       .long           _edata - .Ldoshdr
>> +
>> +       .long           0, 0
>> +       .short          0, 0
>> +       .long           IMAGE_SCN_CNT_INITIALIZED_DATA | \
>> +                       IMAGE_SCN_MEM_READ | \
>> +                       IMAGE_SCN_MEM_DISCARDABLE
>
> You can put the pushsection/popsection right here.
>

Ok (but see my comment about Makefile magic above.


>> +#endif
>> +
>>         .set            .Lsection_count, (. - .Lsection_table) / 40
>>
>>  #ifdef PE_DLL_CHAR_EX
>> diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
>> index 9ecc57ff5b45..2cd5015c70ce 100644
>> --- a/drivers/firmware/efi/libstub/zboot.lds
>> +++ b/drivers/firmware/efi/libstub/zboot.lds
>> @@ -31,10 +31,24 @@ SECTIONS
>>
>>         .data : ALIGN(4096) {
>>                 *(.data* .init.data*)
>> +#ifndef CONFIG_EFI_SBAT
>>                 _edata = ALIGN(512);
>> +#else
>> +               /* Avoid gap between '.data' and '.sbat' */
>> +               _edata = ALIGN(4096);
>> +#endif
>
> Just use 4096 in all cases.
>

Ok.

>>                 . = _edata;
>>         }
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +        .sbat : ALIGN(4096) {
>> +               _sbat = . ;
>> +               *(.sbat)
>> +               _esbat = ALIGN(512);
>> +               . = _esbat;
>> +       }
>> +#endif
>> +
>>         .bss : {
>>                 *(.bss* .init.bss*)
>>                 _end = ALIGN(512);
>> @@ -52,3 +66,6 @@ PROVIDE(__efistub__gzdata_size =
>>
>>  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
>>  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
>> +#ifdef CONFIG_EFI_SBAT
>> +PROVIDE(__sbat_size = ABSOLUTE(_esbat - _sbat));
>> +#endif
>
> This can be unconditional - it is only evaluated when a reference to it exists.
>

Yes, it compiles well, I put #ifdef here mostly for documentational
purposes. Will drop.

>> --
>> 2.49.0
>>
>

-- 
Vitaly


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
