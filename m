Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E5DD6B6B4
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHneQSFX8+emx9PCJtBYMBluojLUv7yskKN9pZVIE8U=; b=c5eYLOMa/Nr255
	khVYuAFWWfkmxSPSHpQATRIe6L8usIupQSAy7eVvFQbb9QlVWs3yYMxoriEvGDuqhsoDhVKEf4ziR
	reihr2FbOim+paUhRfMhb7DEbOvac980nDZ7vO78DZhAxi7aVOefqJePY/qc4E9MF/6PynWMF23rw
	6xnhvpiGIr6reMYGT0J2R+nrFeXCUviaZxxSPelXtp/2WXcp+fQ6DXttPD+OOQu5wfOXmkyUZ/FvB
	LQyGZBujJg9YUd38XwZCbfAg0Zmpqhb9/GqHgUByV1+LrEuzRQYBsI3K3+dUw3BKyVW3LrkmYsO/P
	TOLwFhhgxY8KHQWlI64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6InS-000000027eE-1Ofx;
	Thu, 31 Oct 2024 00:12:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6InP-000000027cv-1Tb8;
	Thu, 31 Oct 2024 00:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ADnOlDvSfcc2o2XTsLbJuVcsj8qk7QSX8jkP5KkZ5Mw=; b=tZusAJI37JDe16l2CZBpAGOoEF
	bwhxtvPkUCgV07xUfbic6dfNujjddnRpFUT28MncKLe8Cf9RmQNEQ2CluZau/8U5ySVsGog8VqShd
	EFBOOAGnSgY3OCnoxcZfxON8e5KQ8V09Hh3+bH6dtqWaa2OqpYH3DbGXF1WaZX9l4oNY7VJdjWvz0
	JulQkHoTGHzdnWrphAeFjrxUXwPucq8lnQH/pm3sH0UdPtqKBgsjh0uQgnAxpdSyzr/dvps0alFUp
	2XKigXu9odZbDzMnWUvymb2OR8E4jOpAAD3qyv2n9sn0Wx4BlrHq0O5BRCP3jFtjBx92Vj2eWcf9S
	Ynf3jZjA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t6ImG-0000qB-0h;
	Thu, 31 Oct 2024 00:11:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t6Im2-0002OR-10;
	Thu, 31 Oct 2024 00:10:50 +0000
Date: Thu, 31 Oct 2024 00:10:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v12 4/5] jump_label: adjust inline asm to be consistent
Message-ID: <ZyLLCmq9-9BX7GBd@shell.armlinux.org.uk>
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
 <20241030-tracepoint-v12-4-eec7f0f8ad22@google.com>
 <20241030191316.2a27ff1b@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241030191316.2a27ff1b@rorschach.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_171215_401519_C90B3964 
X-CRM114-Status: GOOD (  17.12  )
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

On Wed, Oct 30, 2024 at 07:13:16PM -0400, Steven Rostedt wrote:
> On Wed, 30 Oct 2024 16:04:27 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > To avoid duplication of inline asm between C and Rust, we need to
> > import the inline asm from the relevant `jump_label.h` header into Rust.
> > To make that easier, this patch updates the header files to expose the
> > inline asm via a new ARCH_STATIC_BRANCH_ASM macro.
> > 
> > The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
> > takes the same arguments in a consistent order so that Rust can use the
> > same logic for every architecture.
> > 
> > Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
> 
> Still missing an ack from the ARM maintainer (32 bit, just added) and loongarch.
> 
> I'll wait till Monday, if I don't hear anything against these patches
> I'll pull them in.

As of what has recently happened, I am not participating in technical
activities until such time that I'm told what is now acceptable. So
far, that has not been forthcoming, and thus I believe it is unwise to
engage in technical discussion.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
