Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B4D5CC91
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAaNt2vVXp4rQ8tlKf66LeybwyqbUl/quVwqDGoHJhY=; b=4td1UllQnGSSEO
	ASuFY5t1Lh9tHXFgghnBmOFGd30vZ5RN0UcnoW3tL3iQCnxdElea4YH1Msi5bvAfbvjTgSLyLFP2x
	ZZpLI3cP13NI+zc3y5sP7N7+iA8iDsgXwAxliHazcmQpPxmdmABHLorIRV1NN/pPeXBCFmJ7EZFAg
	oTHErdrToGYcy05DIMo64sjgePUYohphCLb7R2+/OSdCInG3snQSL/txYwZ2M6U7fMPxXIrq+Jxrq
	MD4M7DZi3KXjYd2JNXOhwvENpk+LOgLC7qN8yFEfuPBIxt00D3cwSAa+FJuL2Y3RzGeBimJn1IV/i
	uxmE6VfrYVM4pHmL82hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IpO-000000027t7-2yYY;
	Thu, 31 Oct 2024 00:14:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IpM-000000027rt-0Txs;
	Thu, 31 Oct 2024 00:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D257A40A83;
	Thu, 31 Oct 2024 00:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4CFC4CECE;
	Thu, 31 Oct 2024 00:14:10 +0000 (UTC)
Date: Wed, 30 Oct 2024 20:14:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alice Ryhl <aliceryhl@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard Biesheuvel
 <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak
 <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Conor
 Dooley <conor.dooley@microchip.com>, Samuel Holland
 <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao
 <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton
 <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v12 4/5] jump_label: adjust inline asm to be consistent
Message-ID: <20241030201408.732cebd5@rorschach.local.home>
In-Reply-To: <ZyLLCmq9-9BX7GBd@shell.armlinux.org.uk>
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
	<20241030-tracepoint-v12-4-eec7f0f8ad22@google.com>
	<20241030191316.2a27ff1b@rorschach.local.home>
	<ZyLLCmq9-9BX7GBd@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_171416_254181_0FC89052 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, 31 Oct 2024 00:10:50 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> > Still missing an ack from the ARM maintainer (32 bit, just added) and loongarch.
> > 
> > I'll wait till Monday, if I don't hear anything against these patches
> > I'll pull them in.  
> 
> As of what has recently happened, I am not participating in technical
> activities until such time that I'm told what is now acceptable. So
> far, that has not been forthcoming, and thus I believe it is unwise to
> engage in technical discussion.

Oh, OK. Thanks for letting me know.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
