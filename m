Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA3CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpnrOmGCcagM7lQdX7RZuGx3GpMcqLU3afpxL9oKgCU=; b=cVSgMfTd0dSHKN
	oaEK7B2amdX2xrgRV66n1nBIJ49TqA96nV5zS3lpjhQ08ebICBKg/CzPUqG6E6nItPDud5wFVSiKx
	hDkwXr69R3YZpCFzLG4+zKcxhcB26zS1/7Ji8HS5y7kz9jIOfxaIgSaykoawP+XyYWEoyJQ8WH5N1
	8qQboC4I+9s90jw4vfPqtoIlHE16YLR/NArZkSSc6VHmSzOZ+J8xFu+FCw+MM88mP0T5AKp5tN9PI
	KCXu5gTxyM+VF3r7bd5eig3wb5C7TNovnuulmJHOl21j4X+3E9Hs1PRzWGF7RrKVFo3CH7SOeYFFG
	2M7n9rpSdLxI2azov85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svlLy-00000004D6B-1Ss4;
	Tue, 01 Oct 2024 22:28:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlLv-00000004D5I-2jx7;
	Tue, 01 Oct 2024 22:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BCECA431AC;
	Tue,  1 Oct 2024 22:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFEBC4CEC6;
	Tue,  1 Oct 2024 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727821697;
	bh=vfQYcN9QNqCf3FQOMas6JN5EPo8jB5OVUjI8WKebzyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpHxOA0cKLF3JUl9Jo0H0vq1L10cA3BcmwR917sd341feGUA9Dr7bpWQt8aYwKngd
	 RXW17oNPU6hXU26ivd/0TeakuSXCjO0Zo23e7lMyz3IZ26NzHKcyE4j7TWqN5G9mjN
	 hEWyvThnVqPHX1vpue+mcMtfTlnyKEpWn5v03/8lD0ZeLqysSqFUoJ/d2iNBzqy+s3
	 eOseZkl8sIdYViK80DpZwhIsnWeGxweAru0n8tvahV6/Tx46feq0fwAcVWRegkFcww
	 3i9Qyz4vpJLFrgtE/mjQZSx88+QDpAgQGrxxZV5q2gGNlEAYf1AVTt+HUVPzkgiRLG
	 5jBq4Z1n+ldVA==
Date: Tue, 1 Oct 2024 15:28:14 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
Message-ID: <20241001222814.4n7wrazj6okgcovd@treble>
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
 <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com>
 <20241001211543.qdjl4pyfhehxqfk7@treble>
 <20241001174606.6f396dfd@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001174606.6f396dfd@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_152819_848007_6519D060 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Oct 01, 2024 at 05:46:06PM -0400, Steven Rostedt wrote:
> On Tue, 1 Oct 2024 14:15:43 -0700
> Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> 
> > On Tue, Oct 01, 2024 at 01:29:58PM +0000, Alice Ryhl wrote:
> > > Add just enough support for static key so that we can use it from
> > > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > > deprecated, so we add the same functionality to Rust.  
> > 
> > Instead of extending the old deprecated static key interface into Rust,
> > can we just change tracepoints to use the new one?
> 
> Sure, care to send the patch properly, and I can add it to my queue.

Done:

https://lore.kernel.org/03da49e81c50eb2a9f47918409e4c590c0f28060.1727817249.git.jpoimboe@kernel.org

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
