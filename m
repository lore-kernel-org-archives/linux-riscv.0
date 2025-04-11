Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F47C369A8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJnWsIY6y1NsOC73M2tSi78VogxOe/c09gW3iLCNsFs=; b=zqusgoIC5Gg4Uu
	P4qrKkb+qmXeRsVHL9/klNG/DpgathPCc7EyV5fhoJDj0BPSygC0PpVR35gIidUyTGkCibZQdOl/S
	EzHcEPk44+sCswIKT1CmeOPI1xzx4zX8GtfwxO9aUHTaISE7lRECs27H8szlJqCBDw2wBdyWvn7M2
	EzBzvFHGeT4ktT7YAE8ETTBF87eko4f0YeXlKSDXt9xxkOrnN26ENg1b5/ioZJaV21S17o10edgBH
	vz6yOr2fUl8yAN4hIE64F6vysw5FG7eP4CHNKuiERCxYZvAEeL+sP23qOMojHITVAm379Exd/0rBA
	sUwJx+M/hIVr7vH0t41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39Np-0000000Cy7E-0G3f;
	Fri, 11 Apr 2025 08:05:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39Nm-0000000Cy63-2Z7m
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 08:05:04 +0000
Date: Fri, 11 Apr 2025 10:04:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744358699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acahTmX/Ax/Xqa2f81n9R3vfnkbghOQZSuqUtDgmDeM=;
	b=vn4ssqD5JVEiAj/kpeH5e0vHVyEUEGiE7CU9zpBifLFAgaz8fIAq/Rcrtkko0HIVY48woe
	nArX6fn3jfNP/ZaIq+wlktW0KmJcCmYESJNZryoJtZ4lOS8Z0Ec06fsu5RbG5lxypBWr9i
	ZP9cgKaQYJT8aDbtZHshjRpIirBMSINoviM602kahPTR+nF9uNOeautxlIg4PJBnT3yqtk
	MOYaZdfuXocNfACPJEySkRVYZYZaNz6YY4/RvgikVGqFFKaBEyg8R9swpUZXGawT7CKp2d
	1Quk8T1XWpuP57fTryJGK0GL3QpyfyR5OT51Xq6H282YFbmpzN2+IYRi6Hcrqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744358699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acahTmX/Ax/Xqa2f81n9R3vfnkbghOQZSuqUtDgmDeM=;
	b=ugY7xUUZqt2Uu5n/DsIYlO/QK28i7E0Wv0P6u+AYKwbrXKRVEEmoB5JIw3qdikao3pKbo9
	DVSp/qUHQ84BA3BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
Message-ID: <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
References: <20250411024600.16045-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411024600.16045-1-xry111@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_010502_932454_37AB514B 
X-CRM114-Status: GOOD (  19.75  )
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

On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
> Hook up the generic vDSO implementation to the generic vDSO getrandom
> implementation by providing the required __arch_chacha20_blocks_nostack
> and getrandom_syscall implementations. Also wire up the selftests.
> 
> The benchmark result:
> 
> 	vdso: 25000000 times in 2.466341333 seconds
> 	libc: 25000000 times in 41.447720005 seconds
> 	syscall: 25000000 times in 41.043926672 seconds
> 
> 	vdso: 25000000 x 256 times in 162.286219353 seconds
> 	libc: 25000000 x 256 times in 2953.855018685 seconds
> 	syscall: 25000000 x 256 times in 2796.268546000 seconds
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> 
> [v1]->v2:
> - Fix the commit message.
> - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
>   unbreak RV32 build.
> - Likewise, only enable the selftest if __riscv_xlen == 64.
> 
> [v1]: https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.site/
> 
>  arch/riscv/Kconfig                            |   1 +
>  arch/riscv/include/asm/vdso/getrandom.h       |  30 +++
>  arch/riscv/kernel/vdso/Makefile               |  12 +
>  arch/riscv/kernel/vdso/getrandom.c            |  10 +
>  arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
>  arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244 ++++++++++++++++++
>  .../selftests/vDSO/vgetrandom-chacha.S        |   2 +
>  7 files changed, 300 insertions(+)
>  create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
>  create mode 100644 arch/riscv/kernel/vdso/getrandom.c
>  create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S

<snip>

> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 8e86965a8aae..abc69cda0445 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -80,6 +80,7 @@ VERSION
>  #ifndef COMPAT_VDSO
>  		__vdso_riscv_hwprobe;
>  #endif
> +		__vdso_getrandom;

For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.

>  	local: *;
>  	};
>  }
> diff --git a/arch/riscv/kernel/vdso/vgetrandom-chacha.S b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
> new file mode 100644
> index 000000000000..d793cadc78a6
> --- /dev/null
> +++ b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
> @@ -0,0 +1,244 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
> + *
> + * Based on arch/loongarch/vdso/vgetrandom-chacha.S.
> + */
> +
> +#include <asm/asm.h>
> +#include <linux/linkage.h>
> +
> +.text
> +
> +.macro	ROTRI	rd rs imm
> +	slliw	t0, \rs, 32 - \imm
> +	srliw	\rd, \rs, \imm
> +	or	\rd, \rd, t0
> +.endm
> +
> +.macro	OP_4REG	op d0 d1 d2 d3 s0 s1 s2 s3
> +	\op	\d0, \d0, \s0
> +	\op	\d1, \d1, \s1
> +	\op	\d2, \d2, \s2
> +	\op	\d3, \d3, \s3
> +.endm
> +
> +/*
> + *	a0: output bytes
> + * 	a1: 32-byte key input
> + *	a2: 8-byte counter input/output
> + *	a3: number of 64-byte blocks to write to output
> + */
> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> +
> +#define output		a0
> +#define key		a1
> +#define counter		a2
> +#define nblocks		a3
> +#define i		a4
> +#define state0		s0
> +#define state1		s1
> +#define state2		s2
> +#define state3		s3
> +#define state4		s4
> +#define state5		s5
> +#define state6		s6
> +#define state7		s7
> +#define state8		s8
> +#define state9		s9
> +#define state10		s10
> +#define state11		s11
> +#define state12		a5
> +#define state13		a6
> +#define state14		a7
> +#define state15		t1
> +#define cnt		t2
> +#define copy0		t3
> +#define copy1		t4
> +#define copy2		t5
> +#define copy3		t6
> +
> +/* Packs to be used with OP_4REG */
> +#define line0		state0, state1, state2, state3
> +#define line1		state4, state5, state6, state7
> +#define line2		state8, state9, state10, state11
> +#define line3		state12, state13, state14, state15
> +
> +#define line1_perm	state5, state6, state7, state4
> +#define line2_perm	state10, state11, state8, state9
> +#define line3_perm	state15, state12, state13, state14
> +
> +#define copy		copy0, copy1, copy2, copy3
> +
> +#define _16		16, 16, 16, 16
> +#define _20		20, 20, 20, 20
> +#define _24		24, 24, 24, 24
> +#define _25		25, 25, 25, 25
> +
> +	addi		sp, sp, -12*SZREG
> +	REG_S		s0,         (sp)
> +	REG_S		s1,    SZREG(sp)
> +	REG_S		s2,  2*SZREG(sp)
> +	REG_S		s3,  3*SZREG(sp)
> +	REG_S		s4,  4*SZREG(sp)
> +	REG_S		s5,  5*SZREG(sp)
> +	REG_S		s6,  6*SZREG(sp)
> +	REG_S		s7,  7*SZREG(sp)
> +	REG_S		s8,  8*SZREG(sp)
> +	REG_S		s9,  9*SZREG(sp)
> +	REG_S		s10, 10*SZREG(sp)
> +	REG_S		s11, 11*SZREG(sp)

This should have the same comment as the loongarch implementation that it is
fine to store to the stack here. Contrary to the general claim of the
documentation for __arch_chacha20_blocks_nostack() in include/linux/getrandom.h.

<snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
