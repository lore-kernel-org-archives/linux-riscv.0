Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89831CCFA00
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 23:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDqHqPvFlitE3+DHLMFrdklhfIG1xrPrHhH7CPweCOc=; b=ZBHJbV4JKcJSoB
	OmAUafBdPZ1cvj7e+/Xfr75poO/gAJfkfrAL37ujjpf4j9Xul2hQv6esptGswe3DE89VLs6S+5PC/
	RuNosur8uhWxSRcwpR8kOxm4jL5Po9cND0gbwVRHTdMcWo8TAYrOAwel4R3BgkkWPz1C7TdX3mbdg
	32DRhwbQFo7wqto0V+UoO0KAOG+gl5IGhxZ3MspcjTx3OKakU/vVoPp46bEdEqrOfdwbBpgg0uBB9
	5YPMPrw4LnVWBM0SqzgJLDhj9lkGZpFZkfIoAl2gbtsVZ2dN0Xv0yH894gaPtaKG9C9z5097ceezY
	TP4UI+kpKiVtd5qbZ/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhr1-00000008wgc-0kEk;
	Sun, 02 Nov 2025 23:51:23 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhqy-00000008wfx-2DoI
	for linux-riscv@lists.infradead.org;
	Sun, 02 Nov 2025 23:51:22 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DDB6592009D; Mon,  3 Nov 2025 00:51:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CF26F92009B;
	Sun,  2 Nov 2025 23:51:12 +0000 (GMT)
Date: Sun, 2 Nov 2025 23:51:12 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Walmsley <pjw@kernel.org>
cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
    Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
    Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
    richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
    kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
    evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
    samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v22 10/28] riscv/mm: Implement map_shadow_stack()
 syscall
In-Reply-To: <020e2f6e-9c1b-648e-3017-31eb8a89c493@kernel.org>
Message-ID: <alpine.DEB.2.21.2511022341110.1185@angie.orcam.me.uk>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-10-1935270f7636@rivosinc.com> <020e2f6e-9c1b-648e-3017-31eb8a89c493@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_155120_754570_2A71D3BF 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, 31 Oct 2025, Paul Walmsley wrote:

> This patch introduces a 'checkpatch.pl --strict' message:
> 
> CHECK: Lines should not end with a '('
> #78: FILE: arch/riscv/kernel/usercfi.c:36:
> +	asm goto(
> 
> I'll fix it up here in the event that v22 goes in, but please do the same 
> on your side in case a new version is needed.

 I think this warning is silly for `asm' statements.  It's been common for 
decades to do this to format multi-line `asm' statements, just because it 
makes them so much more readable.  We have roughly two thousand instances 
in our tree already and I would use this style for new code in the parts I 
maintain as well.

 Now having trailing `);' on a separate line is another matter.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
