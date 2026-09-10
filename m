Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F68BC79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8pusbwoIGigkg8y7ou4F2opUvPXEYq0LAqvz/2ogqc=; b=lX3Qa+ICfAKgUd
	0J2nTYIhDK/PsX9Q9FZveKwKR5Z+ARWlhi/fkCVNl8dcpmOap1obR/DnU/bRINK+5Y/AUQdI/IDIE
	U6YKbOYfVjJYmhQ6PBdHTGWDfEXnKhPeH4OQot81JMapMIys9rndbpgGc6FrD24Wc8Q5Rl+Z4Nrba
	gbBBlHkfMA2ELRaA07lENS6RM7GdFEhX+iezNwhuoXNqSVACOSPFpaxyGLl/K37yYq959/s9Mw+4t
	kS9Gfda1c3Ifh6UWDF+30hXTAAtIBtkhXTzMeTFQV+UihjqWmJ35f1U5aszRaQOll8kL5x5c7+pV2
	QpBAzNEKSdpQ8poTHEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YK9-0000000DWHH-1dGw;
	Thu, 10 Sep 2026 06:31:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YK6-0000000DWGQ-2oMU
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:31:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7240957a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021910; x=1789626710; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=OsWgRTYJ43HQA7ibdund2efDhndrmOFVmj242c/zth+F6X1lJgtCYdQRPFBucotGUz
         CX8KAOU5Y7SY1Z4C2ZGE0Kku6h6VPs5IV3W7mDICOhi/tp9B7idFzf2IL70BgtdVpYBW
         mGzSZqBuPiaIXN6tv+qgcG67Xg8KdrjAclo9hEvPfkB9UujZhefTGSt++CLjN58kM2RR
         /VXcRD5C/A94x3bXuwLEI3WGGK4ukMud9iw1bpggFCcuSy65nLqV2zq227GaRt/T3Y3l
         riHflYHL+doLhF92eG0W++2JA3Oi9zpcG25DUSjTRYdxxo1/UkOIaqpC4dkwBcCk10Xl
         jIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021910; x=1789626710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=JIsjctHzYcfsePABshw1xnC8hQ0Y1BV9N1OmcIGvxKO0ApgsBTfe4lMlwp5Sc7fZNv
         DPBB50NPP8hmf96ThWFTxXxdAOsb8yF1WX29SP8RWj9/sAWNlFxzydSeVQtcIgpa224A
         0qsLnJj8zKhq42kZrYT51w/8ReFth/AW48SpzxlJy63AMtHfIStsW3a1eCXeJ8qBGusU
         zP5cC0ixcnwqv4gpDgxKBDcU0nTcwvhdAHEJnzJrnMP/qgdkoirjv6BQoBy3pkTiYm3b
         ZZvCrBUVzQwr3zVf/KcsXC25e2BrcxK6AcWk6cTsl5ZaDjGCzGSx2asMOuIAUfJIiCBR
         3P3w==
X-Forwarded-Encrypted: i=1; AKwUvBymCCOvKB9+5z0CSDcppBlx9k+bRZRyeDAtPmzXgfSJ9+CGxNKhnOEm5nyTgq1T/zwlrR8LL4ZWNFkxjA==@lists.infradead.org
X-Gm-Message-State: AFuF++m9IeBm5V9FkyMtcJk2mRSHXJwS8CEinrc65Y6m3cfWe6lsyBuM
	YxLb230Ujka61DbLJ9KFHP94wwVwh5+VrnQC1y1SwmhDNhWPXsAZCgmr
X-Gm-Gg: AYBFou2Zidqx6uWFjz2FdHFo+0cBfsFUbagRCMnksYnEDgR5sEzqY8CWgnym4mCCwby
	ZiXSAdYOgGiveDA+5Qrc0dyGggDl5ZdX6zvBBxDJotvs+l1jguCqf+CnUc7uDwutSAM/xObPtbc
	dR983aHBu+f+UPDN3u8HRcaDsuhAL7R2N7nx0sd+SqOZ+MD+vAZwsw0Z1m8/xS26jVVhf7HgA8Y
	LH/SMWVL8nd+SDi7o5cxAidsOImNBKt1DU4CA6rU+dOaSsRyw+/biKXXOTg5U1VGHxjRB4Qo1Q2
	cb/cPiGwiO5IpyJfOW1GWrdcBAMbtmI8BvM7ZRjm8xETqm9Ixzoi7KnRzFxfgSM8A/WJj4Zl+Sh
	3+dm4WVqbVMAFYWWADbY3B6Pwgtdf+L8YoFdmYSOTTLosoXif5H3uQXfpIvOUJWhupkW02ssFMG
	zLAkVS2xikJl0RwinxnikbX4Fm/BiFAbEOkanDb0gzAskymb7c6CB84IeAmLNBmpo53rwj5FoFH
	1Gc0CoOifWG+OXqU4ZpO+UE2vCrXDRb+nL5iRxwjCc=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr64061526a91.11.1789021909725;
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e834319sm2507639a91.10.2026.09.09.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:01:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
Message-ID: <aqJOscgnnevybiKO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233150_715627_091D77D8 
X-CRM114-Status: GOOD (  22.48  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2026 at 08:33:35AM +0200, Thomas Wei=DFschuh wrote:
> While the numeric constants for relocations are architecture specific,
> it is still useful to get access to them from other architectures.
> Also the definitions are useful for userspace in general.
> For example tools processing elf files during a kernel cross-compilation
> can make use of them.
> =

> Introduce a dedicated header for them, similar to the elf-em.h header.
> For now the header is empty but it will be filled step by step in
> upcomming commits.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  include/uapi/linux/elf-r.h | 5 +++++
>  include/uapi/linux/elf.h   | 1 +
>  2 files changed, 6 insertions(+)
> =

> diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
> new file mode 100644
> index 000000000000..2c382c8a4807
> --- /dev/null
> +++ b/include/uapi/linux/elf-r.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_ELF_R_H
> +#define _UAPI_LINUX_ELF_R_H
> +
> +#endif /* _UAPI_LINUX_ELF_R_H */
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..b3e312255552 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -4,6 +4,7 @@
>  =

>  #include <linux/types.h>
>  #include <linux/elf-em.h>
> +#include <linux/elf-r.h>
>  =

>  /* 32-bit ELF base types. */
>  typedef __u32	Elf32_Addr;
> =

> -- =

> 2.55.0
> =

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
