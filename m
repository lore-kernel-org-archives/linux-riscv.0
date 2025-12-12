Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD60D44148
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUJ4uKZjIWtWzz3HaLwXPoAh9UmaSPp3ZtF9pN9ZjlM=; b=MNgTxqS3TiUgXz
	j6KzKWg0Pm/jyensgPjjkbmqkk3TYUGnBkhT7FFlPyCHeHj0yu+qn2avZXVIch5H0SC0hdiW9vBfP
	RyBvuIXxPvsh6hnBz23Lb+dAlxWAlNra7B4+mixcXESQpECI4JLWC5c2CNT6SGIgaich7a/2xU2Zk
	GIRwbsUq0dHnr4ME5+H4wyVzpjrtY3X2iNVo5Vl3LQu6Ho0jIXPmUo7k1qk0ZT49gr8xpId5oij9R
	7Atyp1VLZLw/T5ZFviD5/TM1zdTAVIH3EG3X8JuyYMWLlqAjVayTcSXtZvacWOPAWQeEnEV7ksSjw
	5t90JzrW4ffEj0miFJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyY4-00000000Gpd-3Cu5;
	Fri, 12 Dec 2025 08:30:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyY3-00000000GpX-1uXd
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 08:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47839600C3;
	Fri, 12 Dec 2025 08:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FF1C4CEF1;
	Fri, 12 Dec 2025 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765528245;
	bh=DRPzZm8wRyj4mY54tq0jM/zwgD0vFMbcEQzT/w8zFyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dcBuqNIldXTL6nxc9vHRFmJK1q+pCEpPXDnMynSxTcTE0f5CMeYb1YC/QYimK7HvL
	 yW9ZIAMunbbNR/XddaD+W2WBzK9ITEOc9Jpd/WF/oFxZGqgMxWJaYnhPdWS/2ZndYV
	 QvTcZ2zk/8XusiG2mEKWiyswaxnlL8kucMpgGRGKUFvBmh6HToRFzmjdMzC8iFklZ7
	 C/w/rAiweFwaGnDV+0vs7+eq/kMNQh7nLuDIAH4TZjY2J30aoCpasEx9IT9zYH+9Ck
	 kNK9eY7wcDmJuvc2ytWrBRu1KTkw/s4QBwSvxfmd6ToD+GB5v6srhdPSZeTpE9iyRE
	 95/u2RrgtAxkA==
Date: Fri, 12 Dec 2025 01:30:29 -0700 (MST)
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
    David Hildenbrand <david@redhat.com>, 
    Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
    Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
    Charles Mirabile <cmirabil@redhat.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
In-Reply-To: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
Message-ID: <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
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

On Thu, 11 Dec 2025, Deepak Gupta via B4 Relay wrote:

> v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shadow stack
> on MMU). Used b4 to pick tags, apparantly it messed up some tag picks. Fixing it

Deepak: I'm now (at least) the third person to tell you to stop resending 
this entire series over and over again.

First, a modified version of the CFI v23 series was ALREADY SITTING IN 
LINUX-NEXT.  So there's no reason you should be resending the entire 
series, UNLESS your intention for me is to drop the entire existing series 
and wait for another merge window.

Second: when someone asks you questions about an individual patch, and you 
want to answer those questions, it's NOT GOOD for you to resend the entire 
28 series as the response!  You are DDOSing a bunch of lists and E-mail 
inboxes.  Just answer the question in a single E-mail.  If you want to 
update a single patch, just send that one patch.

If you don't start paying attention to these rules then people are going 
to start ignoring you -- at best! -- and it's going to give the entire 
community a bad reputation.

Please acknowledge that you understand this,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
