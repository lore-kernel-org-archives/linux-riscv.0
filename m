Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E55CD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAaXVPjy0korAI/yTPPow8vUsNaua/iwIMe3KRhTkJc=; b=ToDi+iBvVpEz4m
	pHxn38YEFvNAbK2G3WSJMU0Gug1fxGT9mcUBEQbw1B5/w6P5OKG6j4qC/X6wn1z9OdXaqhrefSISB
	soTtgWsP2EQ52b8myEIvBT7Y6Tqt/4zZIwYdQVsRc7Wu+HNXmFKCPNFdOZOMTtq/LqxOMMq8aK10X
	KvBzKlCDh9FlbIzSvQm7eS+RY2wx+GceIMuOxTiykMQr/z5nW0ftE357Y8RI29+ti5dwMfEfn73oT
	Ycj1N3CumLmUYZSHIAoWXAhAnqJFILhMmWhM+7xNkwQBSd9+zN3Xdu5ZWxiHxX9waSkxSnAdMpdTV
	gkfwFRndh8b3CwtEbyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6AB-0000000BYe1-12ua;
	Mon, 01 Jun 2026 17:10:55 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6A8-0000000BYdM-09Vs
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 17:10:54 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gTgTK1XXDz1r5ht;
	Mon,  1 Jun 2026 19:10:45 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gTgTC7201z1r5hh;
	Mon,  1 Jun 2026 19:10:39 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gTgTC1bfWz1qqlT;
	Mon,  1 Jun 2026 19:10:39 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id Vz4wsk_EBIwO; Mon,  1 Jun 2026 19:10:37 +0200 (CEST)
X-Auth-Info: 5KwVlaw+khWHn6gx4eE0zoJA0qIH7ypG7QdiocwwDCnNkXIZNIRcKtK9irFsGuR+
Received: from igel.home (aftr-82-135-83-133.dynamic.mnet-online.de [82.135.83.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  1 Jun 2026 19:10:37 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id C844A2C16DB; Mon,  1 Jun 2026 19:10:36 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>,
  Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Andrew Morton <akpm@linux-foundation.org>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Conor Dooley <conor@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Christian Brauner <brauner@kernel.org>,  Peter
 Zijlstra <peterz@infradead.org>,  Oleg Nesterov <oleg@redhat.com>,  Eric
 Biederman <ebiederm@xmission.com>,  Kees Cook <kees@kernel.org>,  Jonathan
 Corbet <corbet@lwn.net>,  Shuah Khan <shuah@kernel.org>,  Jann Horn
 <jannh@google.com>,  Conor Dooley <conor+dt@kernel.org>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Benno Lossin <lossin@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-fsdevel@vger.kernel.org,  linux-mm@kvack.org,
  linux-riscv@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arch@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  alistair.francis@wdc.com,
  richard.henderson@linaro.org,  jim.shu@sifive.com,  andybnac@gmail.com,
  kito.cheng@sifive.com,  charlie@rivosinc.com,  atishp@rivosinc.com,
  evan@rivosinc.com,  cleger@rivosinc.com,  alexghiti@rivosinc.com,
  samitolvanen@google.com,  broonie@kernel.org,
  rick.p.edgecombe@intel.com,  rust-for-linux@vger.kernel.org,  Zong Li
 <zong.li@sifive.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
In-Reply-To: <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
	(Deepak Gupta's message of "Mon, 1 Jun 2026 09:22:17 -0700")
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
	<20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
	<87jyslndo4.fsf@igel.home>
	<CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
	<875x44o9hj.fsf@igel.home>
	<CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
Date: Mon, 01 Jun 2026 19:10:36 +0200
Message-ID: <871peqgp9v.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_101052_366874_531C141E 
X-CRM114-Status: GOOD (  11.71  )
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

On Jun 01 2026, Deepak Gupta wrote:

> This was settled when x86 introduced shadow stack. Instead of having
> new `PROT_`, it was agreed to create a new syscall for mapping shadow
> stack memory (syscall: `map_shadow_stack`). Scenarios like `clone3` or
> co-routines required manufacturing a shadow stack, thus necessitating a
> new mechanism to create shadow stack style memory in demand. Instead
> of having a new PROT_ flag,  a new syscall was created.

So what prevents riscv from making use of VM_SHADOW_STACK similar as
x86, without the user visible effects?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
