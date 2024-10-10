Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624E8D24459
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/BP3+bNZYkQWW9zSiWwpzDFp+4tb/JHarErwkCagfc=; b=ji7oKUay9HCv6u
	+qwis3BC/+wpmTYBRT6LIxGmNYgaykoAYbCjFpD8pEf+u9Y49/KNxO+dbmtYwlKCCfyJwCeNfDWSH
	+GSMjnrjClIpAmkpB2ozBN7aUhpOptZeOrCHKeS2COUq9LXe1fFb1LEn9LT0YLXlGstAge2ATSmnn
	/xV6gY9u/XKNg3pVvLoj9iYbTuLQunHTYYf5GIAPcKcDvhWmOwbyqA5dq6Yzw5Ih7bmDhY7DUMNFa
	Onv57JkWZk28xAZ01YLbIy6FipA8w1+tiOxnLAsimoDVdTnP9ONqSPMHYgFgC0e3nrhMnaajaZosP
	vIRZo3mw4f1pnH3bZlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2A3-0000000EcCP-21tv;
	Thu, 10 Oct 2024 23:01:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyzo-0000000E8Xk-35HD;
	Thu, 10 Oct 2024 19:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+VV1OcAs7SYBgxgmtH80ZSp/jRy+TfN7Ux/bIggdl54=; b=gw4mdzgjiOPCCbuLlQC7URTEFg
	+O5GXWcLiNdws3PH0ix/Fd2OWaVEts2Cq/1yax66ZuF8gP8/HQwRPg6rPuUM68ZNygZj7EEZr7VN/
	IDRbyFCUn2sBrSONavrYgR+t9opoUWl+taBd8sH6Fq7PEI7uEtwFvnyVsmFuI20cKT9g344KHcCFA
	JDkZgrGPq0Z+Gc8hx98ELz7i5YW/cBt0aAZmX0ElIhhZ1dLSofVVf6rl7i5AnegYUc56SuDQT7roX
	B+2ca16Ioh4Wx+kSY6/ZRfR3/aey80r/Uj2shN5/+p3M5sPtN7L3qUPYLonJv/WMVMUm01FEFLzID
	QxnzDAsw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyzk-00000005ZRK-3tdR;
	Thu, 10 Oct 2024 19:38:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4FBEA40202;
	Thu, 10 Oct 2024 19:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789EBC4CEC5;
	Thu, 10 Oct 2024 19:38:37 +0000 (UTC)
Date: Thu, 10 Oct 2024 15:38:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard
 Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
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
 loongarch@lists.linux.dev
Subject: Re: [PATCH v9 4/5] jump_label: adjust inline asm to be consistent
Message-ID: <20241010153845.5a4f3ec5@gandalf.local.home>
In-Reply-To: <20241001101404.29388dd0@gandalf.local.home>
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
	<20241001-tracepoint-v9-4-1ad3b7d78acb@google.com>
	<20241001101404.29388dd0@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_203845_341912_18754D16 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, 1 Oct 2024 10:14:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Can I get some more acks from the arch maintainers? So far there's only one
> ack from Peter Zijlstra for x86. But this touches arm, arm64, loongarch and
> riscv too.

I have an ack from arm64, but since I'm just hearing crickets from the
rest, I'm going to just take this through my tree.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
