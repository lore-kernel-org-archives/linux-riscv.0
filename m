Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64639D216BC
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z8/oEADojPZCeNUXi7uKIL4QyFCH1nh5POpwGux09w=; b=NrYFhrf52i8ZJ0
	56lfejuTwLkQaeaqE857BFNl2f55uNqbEClacgmZZ8ef8I80rGrdZAQdH25UB4PyIsFvVkYUB/Ms1
	03cRvstC5MsG8vHAKRgHvhC439k3AmOINcNbtdc9wZz+wAZ696QeoL1vGsxSccihbTY1IjK6my2/U
	CyFmyNNlddx7mk3h69R5OQY2cl7XtzblWps80CrjxbOgnLvazc6WuNBByDzfPhYtMG4Grelz0vORJ
	bwkOfzeJHNdyhEvhXeNnt/ZqKTpt16e+k4e8PLc8iDfnKixTNPtjf/JXAwhM2ltG5migBHYV21zA2
	IfOivWP8fWuu4x3TGgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCd3-00000008KFs-0k6y;
	Thu, 04 Dec 2025 16:56:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCcz-00000008KEz-2Pdu
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 16:56:28 +0000
Date: Thu, 4 Dec 2025 17:56:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764867381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9+6XlmLlKbjUhjn7O7UGpoRgL/0BI1e50erzPzpDlQ=;
	b=2rWkL1XyAhcgyqrW14MMF3qaUQSr8YYDNiCKry0x0QBsV4l5x3+Ycw5+Jmi0h0i54S8RRK
	E+E1i9Sf249ovLQIsdHJYJbyeELFizphpxVyW0iv3gMQVsNLZQNI3+0uo8gMM5+J8gdwAU
	TQlFxaGVQAKpquAo5xJmu7Sg3eUNUg0oqHbXewl81F1jiHSx62cUQYCc3/lDBDD9nZaXUb
	D0kNhjyLt3Lx6Iynot+ksQqb9CYSPxpgVVg03P7IjPAK3p6UMbKbdvfL0mIG0Mr+TozaUc
	Idwaz543w+GDt5FHrMnfh8wFNTyTtt6ss8MbiHwTTQI9/sWdQYGNRLif/kaz1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764867381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9+6XlmLlKbjUhjn7O7UGpoRgL/0BI1e50erzPzpDlQ=;
	b=fx0jXRJ2uwCZoiAF6TP+4b8/8ynViDEX2+cIYHls3j9u/NOxevNN3FgjINA/To4UgHgvMH
	l2OPXdUE9HBBQkCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v23 24/28] arch/riscv: dual vdso creation logic and
 select vdso based on hw
Message-ID: <20251204175055-fefb76ff-2ff2-48b8-b92c-3d3ce33ec9f5@linutronix.de>
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-24-b55691eacf4f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251112-v5_user_cfi_series-v23-24-b55691eacf4f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_085625_753992_DA52A2F2 
X-CRM114-Status: GOOD (  13.46  )
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

On Wed, Nov 12, 2025 at 04:43:22PM -0800, Deepak Gupta via B4 Relay wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> Shadow stack instructions are taken from zimop (mandated on RVA23).
> Any hardware prior to RVA23 profile will fault on shadow stack instruction.
> Any userspace with shadow stack instruction in it will fault on such
> hardware. Thus such userspace can't be brought onto such a hardware.
> 
> It's not known how userspace will respond to such binary fragmentation.
> However in order to keep kernel portable across such different hardware,
> `arch/riscv/kernel/vdso_cfi` is created which has logic (Makefile) to
> compile `arch/riscv/kernel/vdso` sources with cfi flags and then changes
> in `arch/riscv/kernel/vdso.c` for selecting appropriate vdso depending
> on whether underlying hardware(cpu) implements zimop extension. Offset
> of vdso symbols will change due to having two different vdso binaries,
> there is added logic to include new generated vdso offset header and
> dynamically select offset (like for rt_sigreturn).

If the used vDSO variant only depends on the hardware and nothing else,
why not use alternative patching and avoid the complexity?
I see that RISCV_ALTERNATIVE depends on !XIP_KERNEL but the vDSO code is
moved to dynamically allocated memory in any case, so it is patchable.

> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Acked-by: Charles Mirabile <cmirabil@redhat.com>

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
