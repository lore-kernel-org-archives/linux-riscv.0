Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E6C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUhwcpSBfqlyqJKSbOeJy7b0TCXNqr1R1p5aVqkzYYE=; b=20oJl4DdwfrsTW
	wD9d3IPjU3UFAbzrDJ7C0kU2ZsXSDH+yha6sKCx/UQfvTq0PrWRn3R9zj7brAk9US7+R7XC/seimR
	iIFnopakR+gqoOGhQWhfOUudJOylVWPF0W+UZXYmk4EotTbJzgvH7t9i6ywn7VkAZr452RzIotT8b
	MqT29Wn64c5Mu+Qiy2pknyHGa5SG0PXbF4LQ3mLHXwuLBfRXfO+r3kUEM3f2nhF6GW1nwPvMIwEK4
	GaERGG8YzFAGshnmPfFhagMKRYRevwjjniSnlF9uspuo6leEG4sMgDxmGp3vXqyhzeVvtz52yYagM
	2lebNRxPZHL32kfrHsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SJs-000000076ED-2xuY;
	Mon, 28 Apr 2025 17:31:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pt4-00000006h9I-3y7M
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 14:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C5F25C2762
	for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 14:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49A4C4CEF3
	for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745852111;
	bh=9Jq7uWikQpL0uRpCQ1qFYLXIjMg8lm3oJ+erYCU9968=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jAap7skyAlGFiLpb57TXN+/kIeoRpTftjYS3enOzBlGUOyAt1bmzrv7dFty08GEuz
	 98CPuc5dQJbNLjwOU89n73GBxAaWj8v3aBG5+0uRaFKtgDe/be3+CxCdRmBGc/IIgR
	 ZjnZKAYzh2f3AfLzo5jW+VZ2+ShjKHeIcDfUx17J8RGvXoQIA+9TbHjTfrPrB33m3r
	 eeUPfduU9Ge+HPKmoqwuTd/g29AK48pr0KkTGZ16h+fO8UV6XGD/CQogPBrhElgNcm
	 hPIKbZqDzvuz5MQnhZMhClVxOrtQ3T66P/aOuU2zZAoJbM1Rpq6ZpQ7dk2nGN3ud8q
	 0Vo6s+n04Fqig==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso5992852e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 07:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcTmwtnnso/6xc8e5OMeAdkHTzKvHYJNMUhU8MZEpJ+T+yQ8IOiG6cdNL/+sSIN5N/dEfu8OvqjHI2hA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/9mg7p0GvtnnEVbcEDnzL/z1N8Q+LWKWLdgW7tELaBqrl7AJ
	p3bWn0ydcMGPRMKLWjAedHZknMKbA4XSCN8H0F34WqZD7E/yai98X+OVhgx60ZjusN5TzrJqNLE
	6xNKZHVTaXoe1n6TB2UufcbqKiT0=
X-Google-Smtp-Source: AGHT+IE7E128Zkj3xoJnEZVs+V1aV5QAmc6QTNjYjWzAyc+K0lgjhcOYXIXGCrzLG1sgZUsRpuGu3jJ/McaAmNF+/3U=
X-Received: by 2002:a05:6512:130c:b0:549:8cc8:efed with SMTP id
 2adb3069b0e04-54e900113cemr2442912e87.48.1745852110119; Mon, 28 Apr 2025
 07:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250424080950.289864-1-vkuznets@redhat.com> <20250424080950.289864-2-vkuznets@redhat.com>
 <CAMj1kXHqmOiNX_DH+8uSsTROzR+hgvZ5DyE=3wVE7-dQ+2BW=Q@mail.gmail.com> <87o6wga74s.fsf@redhat.com>
In-Reply-To: <87o6wga74s.fsf@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 28 Apr 2025 16:54:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEFXCjHXrAS2Xe_3xVvkkV6QYsuxcOmLEk-A2KNHUJ7ZA@mail.gmail.com>
X-Gm-Features: ATxdqUFymFSwi64yQhO8AHjWP8hjRlF2jJwWQ1HlRXbUcVyIkRCEXSZB9saruI0
Message-ID: <CAMj1kXEFXCjHXrAS2Xe_3xVvkkV6QYsuxcOmLEk-A2KNHUJ7ZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi/libstub: zboot specific mechanism for embedding
 SBAT section
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
X-CRM114-CacheID: sfid-20250428_075515_066791_1CB9A56D 
X-CRM114-Status: GOOD (  40.17  )
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

On Mon, 28 Apr 2025 at 12:54, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > Hi Vitaly,
> >
>
> Ard, thanks for the review!
>
> > On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >>
> >> SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
> >> by introducing a generation-based technique. Compromised or vulnerable UEFI
> >> binaries can be prevented from booting by bumping the minimal required
> >> generation for the specific component in the bootloader. More information
> >> on the SBAT can be obtained here:
> >>
> >> https://github.com/rhboot/shim/blob/main/SBAT.md
> >>
> >> Upstream Linux kernel does not currently participate in any way in SBAT as
> >> there's no existing policy in how SBAT generation number should be
> >> defined. Keep the status quo and provide a mechanism for distro vendors and
> >> anyone else who signs their kernel for SecureBoot to include their own SBAT
> >> data. This leaves the decision on the policy to the vendor. Basically, each
> >> distro implementing SecureBoot today, will have an option to inject their
> >> own SBAT data during kernel build and before it gets signed by their
> >> SecureBoot CA. Different distro do not need to agree on the common SBAT
> >> component names or generation numbers as each distro ships its own 'shim'
> >> with their own 'vendor_cert'/'vendor_db'
> >>
> >> Implement support for embedding SBAT data for architectures using
> >> zboot (arm64, loongarch, riscv). Build '.sbat' section along with libstub
> >> so it can be reused by x86 implementation later.
> >>
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  drivers/firmware/efi/Kconfig                | 25 +++++++++++++++++++++
> >>  drivers/firmware/efi/libstub/Makefile       |  7 ++++++
> >>  drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
> >>  drivers/firmware/efi/libstub/sbat.S         |  7 ++++++
> >>  drivers/firmware/efi/libstub/zboot-header.S | 14 ++++++++++++
> >>  drivers/firmware/efi/libstub/zboot.lds      | 17 ++++++++++++++
> >>  6 files changed, 72 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/firmware/efi/libstub/sbat.S
> >>
> >> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> >> index 5fe61b9ab5f9..2edb0167ba49 100644
> >> --- a/drivers/firmware/efi/Kconfig
> >> +++ b/drivers/firmware/efi/Kconfig
> >> @@ -281,6 +281,31 @@ config EFI_EMBEDDED_FIRMWARE
> >>         bool
> >>         select CRYPTO_LIB_SHA256
> >>
> >> +config EFI_SBAT
> >> +       bool "Embed SBAT section in the kernel"
> >> +       depends on EFI_ZBOOT
> >> +       help
> >> +         SBAT section provides a way to improve SecureBoot revocations of UEFI
> >> +         binaries by introducing a generation-based mechanism. With SBAT, older
> >> +         UEFI binaries can be prevented from booting by bumping the minimal
> >> +         required generation for the specific component in the bootloader.
> >> +
> >> +         Note: SBAT information is distribution specific, i.e. the owner of the
> >> +         signing SecureBoot certificate must define the SBAT policy. Linux
> >> +         kernel upstream does not define SBAT components and their generations.
> >> +
> >> +         See https://github.com/rhboot/shim/blob/main/SBAT.md for the additional
> >> +         details.
> >> +
> >> +         If unsure, say N.
> >> +
> >> +config EFI_SBAT_FILE
> >> +       string "Embedded SBAT section file path"
> >> +       depends on EFI_SBAT
> >> +       help
> >> +         Specify a file with SBAT data which is going to be embedded as '.sbat'
> >> +         section into the kernel.
> >> +
> >
> > Can we simplify this? CONFIG_EFI_SBAT makes no sense if
> > CONFIG_EFI_SBAT_FILE is left empty. If you really need both symbols,
> > set EFI_SBAT automatically based on whether EFI_SBAT_FILE is
> > non-empty.
>
> Sure, but FWIW, I modelled this after MODULE_SIG/MODULE_SIG_KEY and
> BOOT_CONFIG_EMBED/BOOT_CONFIG_EMBED_FILE where the selection is also
> 2-step -- do you think EFI_SBAT/EFI_SBAT_FILE case is different?
>

Regardless of the other cases,it at the very least should be a
config-time error for EFI_SBAT to be y when EFI_SBAT_FILE is empty. We
shouldn't have to deal with CONFIG_ options being in an inconsistent
state, that's Kconfig's job.

> >
> >>  endmenu
> >>
> >>  config UEFI_CPER
> >> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> >> index d23a1b9fed75..5113cbdadf9a 100644
> >> --- a/drivers/firmware/efi/libstub/Makefile
> >> +++ b/drivers/firmware/efi/libstub/Makefile
> >> @@ -105,6 +105,13 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
> >>  extra-y                                := $(lib-y)
> >>  lib-y                          := $(patsubst %.o,%.stub.o,$(lib-y))
> >>
> >> +extra-$(CONFIG_EFI_SBAT)       += sbat.o
> >> +$(obj)/sbat.o: $(obj)/sbat.bin
> >> +targets += sbat.bin
> >> +filechk_sbat.bin = cat $(or $(real-prereqs), /dev/null)
> >> +$(obj)/sbat.bin: $(CONFIG_EFI_SBAT_FILE) FORCE
> >> +       $(call filechk,sbat.bin)
> >> +
> >
> > Please get rid of all of this, and move the .incbin into
> > zboot-header.S
>
> The main prupose of this logic is to track possible sbat data
> changes. E.g. if the file with SBAT data has changed, then we need to
> rebuild the kernel binary. If we just use a raw 'incbin' somewhere and
> don't add a specific Makefile dependency, then the logic will be lost.
>

So why isn't it sufficient to make zboot-header.o depend on
$(CONFIG_EFI_SBAT_FILE)?

> I think I can drop the dedicated 'sbat.S' and use zboot-header.S but I'd
> like to keep at least the 'filechk' part: we compare what's in
> EFI_SBAT_FILE with 'sbat.bin' copy and, if things have changed, rebuild.
>

The filechk is just a copy, and the /dev/null hack should be removed
too. So please find another way to track the dependency, and drop all
of this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
