Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2988C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAChbDQZZFm6/r0Z2aN7S0mo0wqjmq9vMza61Q5YS0Y=; b=BJPbB04MgvFIit
	q3WAbm8BkAkXZkzEO8rjZKANitGbL6vX3VIs3ZYjmd1P/TE3AGkqGl6iUrTykvyDXXlc/7VzV0Zk1
	VvGXLhrjYEJcArs/MyvK/jeZkI4Xh5at0f96uk/22oPamNSC4Z0TbXtMCnTM3eOEL3Q/3oyVdi7Rq
	xOHQ8nYzQEohkzBMoshkVwkfEDkyd65txjV7vpBepUhvLw0chJ6oHmUhT1P0sEYvUBW4GKUefHPge
	ipvW2cG31cguOEIe/eSrxBM35UmW4GblUK1ecOuuQSXaCuams3gYf1WZgodtrIVnsIaNQzR30dnVv
	nvq0k6KSX8uEet70+K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNIY-00000005Bow-0Onx;
	Wed, 26 Feb 2025 19:42:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNGM-00000005BWl-2chq;
	Wed, 26 Feb 2025 19:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 166F061134;
	Wed, 26 Feb 2025 19:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDDDC4CEE7;
	Wed, 26 Feb 2025 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740598809;
	bh=iqsdq2p5uze2ya4zhfPOi6HCsOmbEwMOmKjx129lr6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LXp5HnXIU93C2GpA3Ioh6xBPLKGb8n8eIb+n3KK6ZSi1RAFO4i4taQT9DLrlTqon+
	 WiV6Z1KTeHYfDqm3YFqRhVwZdM39aV1c8V2vWUwOZmWw/UQ+4hX7LAAJjhIZrjBDAv
	 WvpJjLhC/ghljgU+UxQHaGGXqcRSgSD3PrDhH9Q0XU2yBMPyBoqd1MkxjstC8XAKyi
	 yOvauVBlwqVQn3ww+Kp0pNKv87DrfUVn9T64QJB7VRRE7GhW2Wmo1KN5VWOAkIT5DU
	 7sKHC4gsUm+W3gBQMw5f+tktMBaapO5D9ALsazdXLDfeLGnK+g7WnYCQUAzsLu2FPi
	 CVds/UXAMdeQw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <x86@kernel.org>,  <linux-riscv@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <loongarch@lists.linux.dev>,
  <tglx@linutronix.de>,  <mingo@redhat.com>,  <bp@alien8.de>,
  <dave.hansen@linux.intel.com>,  <peterz@infradead.org>,  <hpa@zytor.com>,
  <paul.walmsley@sifive.com>,  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,  <catalin.marinas@arm.com>,  <will@kernel.org>,
  <chenhuacai@kernel.org>,  <kernel@xen0n.name>,
  <tangyouling@loongson.cn>,  <hejinyang@loongson.cn>,
  <yangtiezhu@loongson.cn>,  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,
  <boqun.feng@gmail.com>,  <gary@garyguo.net>,  <bjorn3_gh@protonmail.com>,
  <benno.lossin@proton.me>,  <aliceryhl@google.com>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: Add bug/warn abstractions
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Thu, 13 Feb 2025 22:57:54 +0900")
References: <yy_ESUuchCjlaGIJHzCPAcP_d9ucSD0CGXaoZNNkY7BmN5Ch1J8avsA9QpKO5LkTjlGpu99jl8NrFl5NFSQXuw==@protonmail.internalid>
	<20250213135759.190006-1-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 26 Feb 2025 20:39:45 +0100
Message-ID: <8734g0v6ke.fsf@kernel.org>
MIME-Version: 1.0
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


Hi Fujita,

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> This patchset adds warn_on and warn_on_once macros with the bug/warn
> abstraction.
>
> Wrapping C's BUG/WARN macros does not work well for x86, RISC-V,
> ARM64, and LoongArch. Rust code needs to directly execute the same
> assembly code used on the C side. To avoid duplicating the assembly
> code, this approach mirrors what the static branch code does: it
> generates the assembly code for Rust using the C preprocessor at
> compile time.
>
> The 1st to 4th patches export the BUG/WARN assembly code for Rust on
> each architecture, with no functional changes on the C side. The
> changes for x86 and RISC-V are straightforward. However, the ARM64 and
> LoongArch assembly code are designed differently; they are used by
> both C inline assembly and assembly code. As a result, sharing this
> code with Rust is complicated.
>
> The last patch adds the bug abstraction with warn_on and warn_on_once
> implementations.
>
> This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
> compile test performed for LoongArch.
>
> The assembly code can be used for both BUG and WARN, but currently
> only supports warn_on and warn_on_once. I will work on the remaining
> functionality after this abstraction is merged.
>

How does this series compare/overlap with [1] ?


Best regards,
Andreas Hindborg



[1] https://lore.kernel.org/all/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
