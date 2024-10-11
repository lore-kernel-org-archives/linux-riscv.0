Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1814D0D7BC
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ur20n3s6MP+yfWknnWroYH0GOn28DwGDTh61c7LzE1c=; b=ZbTwUGObM5g8Ln
	ZKN7GJiEbVFAvjyzEUWHl6E5TVz1XYpBsCyjGk3VM3jH7+wDT4jPjkJErCA2SSJuRC7odhENzu+oH
	Ud4X3SmQ8P90yU+qvnMG7+5k6Jyeaz7k3cTxD8bEdpEws5k1Hz9obyQJPPKJQi9960N2DZi/ahnNb
	cwrP859PoNtriX9eCv6SwjAqs2cg8umbAZIjOAiYhkN292QqJg9FsCwrzjLJjFak/O0yOZZsUzmtd
	sf6beGHUUYvltODQ1gfCqgZTJzRbqWV+9yy/PkG0uWCmKHZaQBQky58wHLsHfRM8VcLe+Te050Jgy
	GAvJ5yF1sTF+r1F+AtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHZP-0000000GnF6-3SIe;
	Fri, 11 Oct 2024 15:28:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szHUy-0000000Glyf-2WOY;
	Fri, 11 Oct 2024 15:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A618A44A43;
	Fri, 11 Oct 2024 15:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39333C4CEC3;
	Fri, 11 Oct 2024 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728660250;
	bh=A3N9Mkq30GPl1hwp0+TVudApr5l241CnTDu+mkjDc68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJy54j3rdRFfLY2A7N5cYYGCebcq3yQ7Nn3YpXPetQdckOI3xObxbldIKT/3sa4pY
	 P0pMjlETYXgk5U9otowTN0tcgGSiHOnEA+T7brocFPuL7mxw8+lWpBc3d1IZg7QrTi
	 yxcm1ahYN+C3XxkjCb7gQhnOAJW0mQ24ywsBTW+bD59i1djn7RcWzLwmMWi7FhGtRa
	 f/Wlzo2/2dx4/+fXDKYXgOsTbpGfv868g7eBHtYCnd3ZTbC8zDts+Bjo0zvfstARrm
	 Wu1+LOPZIdHy3rx7zi4/v+iynpsH50cr29F6HhEPLYf51ySyV+L1zOfHn1gFLPgizY
	 WdZnrav+mlECA==
Date: Fri, 11 Oct 2024 08:23:12 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
Message-ID: <20241011152312.r5sy7k7hsunmmbfo@treble>
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_082412_787696_60ADA486 
X-CRM114-Status: GOOD (  11.62  )
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

On Fri, Oct 11, 2024 at 10:13:38AM +0000, Alice Ryhl wrote:
> +#[cfg(CONFIG_JUMP_LABEL)]
> +#[cfg(not(CONFIG_HAVE_JUMP_LABEL_HACK))]
> +macro_rules! arch_static_branch {
> +    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
> +        $crate::asm!(
> +            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            l_yes = label {
> +                break 'my_label true;
> +            },
> +            symb = sym $key,
> +            off = const ::core::mem::offset_of!($keytyp, $field),
> +            branch = const $crate::jump_label::bool_to_int($branch),
> +        );
> +
> +        break 'my_label false;
> +    }};
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(CONFIG_JUMP_LABEL)]
> +#[cfg(CONFIG_HAVE_JUMP_LABEL_HACK)]
> +macro_rules! arch_static_branch {
> +    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
> +        $crate::asm!(
> +            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            l_yes = label {
> +                break 'my_label true;
> +            },
> +            symb = sym $key,
> +            off = const ::core::mem::offset_of!($keytyp, $field),
> +            branch = const 2 | $crate::jump_label::bool_to_int($branch),
> +        );
> +
> +        break 'my_label false;
> +    }};

Ouch... could we get rid of all this duplication by containing the hack
bit to ARCH_STATIC_BRANCH_ASM() like so?

diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index ffd0d1a1a4af..3f1c1d6c0da1 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -24,7 +24,7 @@
 #ifdef CONFIG_HAVE_JUMP_LABEL_HACK
 #define ARCH_STATIC_BRANCH_ASM(key, label)		\
 	"1: jmp " label " # objtool NOPs this \n\t"	\
-	JUMP_TABLE_ENTRY(key, label)
+	JUMP_TABLE_ENTRY(key " + 2", label)
 #else /* !CONFIG_HAVE_JUMP_LABEL_HACK */
 #define ARCH_STATIC_BRANCH_ASM(key, label)		\
 	"1: .byte " __stringify(BYTES_NOP5) "\n\t"	\
@@ -33,10 +33,8 @@
 
 static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
 {
-	int hack_bit = IS_ENABLED(CONFIG_HAVE_JUMP_LABEL_HACK) ? 2 : 0;
-
 	asm goto(ARCH_STATIC_BRANCH_ASM("%c0 + %c1", "%l[l_yes]")
-		: :  "i" (key), "i" (hack_bit | branch) : : l_yes);
+		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;
 l_yes:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
