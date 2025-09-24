Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC1CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltTk0oGrMQrLWYd+tL5NYj/3v1lergSpNpbyCz7T5iU=; b=pb+cxxwRUUiycU
	xfhZPRdr6Ous/Ga//rRPNY5feG//c/WT0bH7OHrkKRGEuvF2lG5FZajMFqCLpe+zHt9Yao21DNMV/
	uZxi1QgTu5eVCXw9MFanFjssrjKyWGgjgzr/mUJflUsrihAlxo16KWB3i6fmw1Urxr1Q17cehWSm3
	gVw7x8fuAfyRWms6nnTgVP92ZeY7Pqn2UN405RNegpCRB0IwiczMGIGJvuUK/DyG8HlXGqQcGp3nV
	fQ9fxMzpAAt22qKijvQifp68sMtMZtDjGkudUaI5831KO5+lOl3desgRDYcusPTUych+ZmoLiq0o0
	iYKQPyXZ2Xgam5Lj3aYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qbc-00000000iwd-2TY2;
	Wed, 24 Sep 2025 14:36:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QbZ-00000000itZ-3DSo
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 14:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B60D54188D;
	Wed, 24 Sep 2025 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F373C4CEE7;
	Wed, 24 Sep 2025 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758724584;
	bh=dtMyGOLRj3HY14tPCzeUn90iQCDhGJqxqhE3t2ov7aU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sU4qbKHfWJn/GVEqOSKG90PR7kq8un4mmh2XnGkYWYj96nm0vP3t0kpMc9qgQDF/r
	 Njj8+x9+98clpezx9Qbexhjiiqb9LgGf2zO7zaasjP6Aw3ZwagcAIEE8M1xw+MaWmu
	 YUaMY0p/KqRd8zFg6n7QJyC9wlkAy1COyRWfXsjDCyXLlLAmMW+OOVMT0stiJlFThR
	 pSjukkkFK4og3+n0QfVwwodCBFQYwRR1q0tdqFB+L5GUbegS/N6BCgBwxdv/nKP85r
	 1KUsbDv30oxCq+omuKsOLciS1wr91DsaxnZLhDWTt7/0uf59+4ZuwoESQ7BQmcDgr0
	 wKP3Ex22F2I6w==
Date: Wed, 24 Sep 2025 08:36:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
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
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
    richard.henderson@linaro.org, jim.shu@sifive.com, 
    Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, 
    charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
    cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
    broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
    David Hildenbrand <david@redhat.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
Message-ID: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_073625_845562_E7B4CBFE 
X-CRM114-Status: GOOD (  15.93  )
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

Hi,

On Thu, 31 Jul 2025, Deepak Gupta wrote:

[ ... ]

> vDSO related Opens (in the flux)
> =================================
> 
> I am listing these opens for laying out plan and what to expect in future
> patch sets. And of course for the sake of discussion.
> 

[ ... ]

> How many vDSOs
> ---------------
> Shadow stack instructions are carved out of zimop (may be operations) and if CPU
> doesn't implement zimop, they're illegal instructions. Kernel could be running on
> a CPU which may or may not implement zimop. And thus kernel will have to carry 2
> different vDSOs and expose the appropriate one depending on whether CPU implements
> zimop or not.

If we merge this series without this, then when CFI is enabled in the 
Kconfig, we'll wind up with a non-portable kernel that won't run on older 
hardware.  We go to great lengths to enable kernel binary portability 
across the presence or absence of other RISC-V extensions, and I think 
these CFI extensions should be no different.

So before considering this for merging, I'd like to see at least an 
attempt to implement the dual-vDSO approach (or something equivalent) 
where the same kernel binary with CFI enabled can run on both pre-Zimop 
and post-Zimop hardware, with the existing userspaces that are common 
today.

thanks Deepak,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
