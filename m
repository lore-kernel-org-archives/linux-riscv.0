Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B75C54ED0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP7xoJ3QHp7ZIhSGAlJTHKDUJgImniG4ZUSOl97gjjA=; b=dBEKgEXi+Rn8wG
	d3YLlSlKYn+snnSFQDYE5sjOL7cKo8NLkPkVHc4gtIsDbLgeqSeIRM9PavALeR7J6fipovGensKPH
	mvPqyGoCDinqHii0vp/vCAaDS5dfUKhiQ1MEkTaJ4KCzFGvujIVnYf2Bt2rQXLFiv30IGnFmyujLf
	ac8pOwPC8YYud/dsPHdDudEmSOgb99IBUswQ/pVeqOYMQlXmJMN1MCVXRfsP0TOT8oYB4GcCXwa96
	SvmthMgH6i2XBfhDg+M+8TbohRkL1CwSkKrxs9uSYi6ZmgKRLfaignnlM8KQ1sOekTXQ253H2/VZ7
	nMi3qL2vTd4/QOt+5QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkCp-0000000G4Mc-3kZN;
	Wed, 21 May 2025 14:14:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjdh-0000000Fxd7-17UV
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 13:37:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F284849B0A
	for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 13:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2D3C4CEED
	for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747834664;
	bh=Q3vxupo3Dpy/q0eLFgkdBNBH9G50vEGn7yWruuYgOC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SVVgx5wrku55voQSdFauIP8usiUXUr5MELLxr0pcNBqBflh9V01F7vVT0jOMwgx6u
	 Y8L8CXrJDKrT28wbvbhRisK28d5iTKU/MT/vDNQzVqqluzjNrJd9aGndHI0Jcaocug
	 4FidPWcv2jsms/G4tatxEovQy6vdmz8wRiWXYdfdkp+dDUndF3v7wZSsszxyVjgsIu
	 4uRwLQVm0q0IAbifEdbp2cFm5pVFj2OkiGm5u/0bS3bhX4DvVZm+kQs3+bwTv5QBiX
	 GIQZNXp205YCjLh427WaaJQCfS2zu2pSk9+39CUfmW6Evb6QRjY0s7iSOLLzMeQ1l5
	 qrEdhsAGsKpcw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7897541e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 06:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9LDaaW4mIUI+aov/ZbLOkrbd77tFwcY8+M17lYf6D6Yk/h2vvkrHLFLO8v7UDHCyhE5cv5J3HPPU2XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZeUuNiQlQbUggv26WYSkmiqOKD5SpsgpY0K4+ReaSU+XBgB7B
	OKZ5pfO5bryxZ7JNen0OLyNos0fVf9DzFVdQQpCHEV+4h48P/a3ywqMl5vxaVBJtYzQBma9yVw7
	ojQEHNQtsWbMzI3Ak8QYrMNjRwu3tFv4=
X-Google-Smtp-Source: AGHT+IFko07FZvPd74P0BaT3/07hpt0YPXFdNbTcXRR7nkC4AEknVdNNihDaVx9qsxC6R3pVF5cdVeKlVFZ1xKYjWM0=
X-Received: by 2002:ac2:4c4a:0:b0:545:243e:e2dc with SMTP id
 2adb3069b0e04-550e7232305mr6204447e87.39.1747834662956; Wed, 21 May 2025
 06:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250513125808.75510-1-vkuznets@redhat.com>
In-Reply-To: <20250513125808.75510-1-vkuznets@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 21 May 2025 15:37:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGBgkjEseNTaFewCwM=0h_zOVfnqshOouHPTTkmeiZN1w@mail.gmail.com>
X-Gm-Features: AX0GCFuY7joIXpf1EEnLZX1Mth4aBM4HKeH5hTeI3S0S81xmI8PHJi0gLhbIlL0
Message-ID: <CAMj1kXGBgkjEseNTaFewCwM=0h_zOVfnqshOouHPTTkmeiZN1w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] efi: Add a mechanism for embedding SBAT section
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
X-CRM114-CacheID: sfid-20250521_063745_362466_0A3FDEF2 
X-CRM114-Status: GOOD (  29.86  )
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

On Tue, 13 May 2025 at 14:58, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Changes since v2 (Ard):
> (https://lore.kernel.org/linux-efi/20250505154523.231233-1-vkuznets@redhat.com/)
> - Use 'textsize' intermediary in arch/x86/boot/header.S to avoid additional
>  '#ifdef CONFIG_EFI_SBAT'.
> - Fix indentation.
> - Added R-b tags.
>
> Original description:
>
> SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
> by introducing a generation-based technique. Compromised or vulnerable UEFI
> binaries can be prevented from booting by bumping the minimal required
> generation for the specific component in the bootloader. More information
> on the SBAT can be obtained here:
>
> https://github.com/rhboot/shim/blob/main/SBAT.md
>
> Currently, shim checks .sbat data for itself in self-test and for second
> stage bootloaders (grub, sd-boot, UKIs with sd-stub, ...) but kernel
> revocations require cycling signing keys or adding kernel hashes to shim's
> internal dbx. Adding .sbat to kernel and enforcing it on kernel loading
> will allow to do the same tracking and revocation distros are already
> doing with a simplified mechanism, and without having to keep lists of
> kernels outside of the git repos.
>
> Previously, an attempt was made to add ".sbat" section to the linux kernel:
>
> https://lwn.net/Articles/938422/
>
> The approach was rejected mainly because currently there's no policy on how
> to update SBAT generation number when a new vulnerability is discovered. In
> particular, it is unclear what to do with stable kernels which may or may
> not backport certain patches making it impossible to describe the current
> state with a simple number.
>
> This series suggests a different approach: instead of defining SBAT
> information, provide a mechanism for downstream kernel builders (distros)
> to include their own SBAT data. This leaves the decision on the policy to
> the distro vendors. Basically, each distro implementing SecureBoot today,
> will have an option to inject their own SBAT data during kernel build and
> before it gets signed by their SecureBoot CA. Different distro do not need
> to agree on the common SBAT component names or generation numbers as each
> distro ships its own 'shim' with their own 'vendor_cert'/'vendor_db'. Linux
> upstream will never, ever need to care about the data unless they choose in
> the future to participate in that way.
>
> Vitaly Kuznetsov (2):
>   efi: zboot specific mechanism for embedding SBAT section

I've picked up the first patch for the next cycle. The second one can
then go via the -tip tree for v6.17

Or if team-tip is happy to pick it up now, I've created a separate
efi-sbat branch with only the first patch, so it can be merged into
-tip and the second patch applied on top.

git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git efi-sbat


>   x86/efi: Implement support for embedding SBAT data for x86
>
>  arch/x86/boot/Makefile                      |  2 +-
>  arch/x86/boot/compressed/Makefile           |  5 ++++
>  arch/x86/boot/compressed/sbat.S             |  7 +++++
>  arch/x86/boot/compressed/vmlinux.lds.S      |  8 ++++++
>  arch/x86/boot/header.S                      | 31 +++++++++++++++------
>  drivers/firmware/efi/Kconfig                | 24 ++++++++++++++++
>  drivers/firmware/efi/libstub/Makefile.zboot |  4 +++
>  drivers/firmware/efi/libstub/zboot-header.S | 22 +++++++++++++--
>  drivers/firmware/efi/libstub/zboot.lds      | 11 ++++++++
>  9 files changed, 102 insertions(+), 12 deletions(-)
>  create mode 100644 arch/x86/boot/compressed/sbat.S
>
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
