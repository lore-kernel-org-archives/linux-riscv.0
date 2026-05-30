Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D41CD6E49
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+pXSz3IpeOhAE1beh8F6gWohn3U0YBcMvbr1IeW3Tk=; b=cideeAut7KeTXz
	ki0oG+isPk3tq32q1AMBw8OCX211FyCOJ0U7eLounA53wMa4YZkY7TRBDUJoQPelH1ADVUWswiPXL
	Jvi1uzjV+oV0ZDAMa7wY1SG5VeFymVxoCJM3LL2xErM3qXRyYDoOmS3IkPsZM5Fo1+UG3xuglWAdY
	aPDOVhxXrcw0kdzGlGIlMNMUD11NYQcU2VS7ZY/KRtN7GS7Igf8hcETxjCRK0it4h+fDJ+YAoCw04
	OKtShhW9qpTjpcKKK2d4sxQqhyhoOnO6iHTmkBrIUxhSfn1hojEWkZtPexkEBSqeBOvrKQGF67Q2F
	wbk9Zn0SdnTCBSeGhslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLDM-00000008s39-0ywN;
	Sat, 30 May 2026 15:03:04 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLDI-00000008s2T-0D7S
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 15:03:02 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gSNkg6Q2tz1sGWy;
	Sat, 30 May 2026 17:02:51 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gSNkR4FCwz1sGWg;
	Sat, 30 May 2026 17:02:39 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gSNkQ6bMnz1qqlT;
	Sat, 30 May 2026 17:02:38 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id WSakR5QS3h7V; Sat, 30 May 2026 17:02:35 +0200 (CEST)
X-Auth-Info: seVX8pClgJ+A7Up8GdLsTTricyC7V41/AnuhQ+0oY9yeyNcy+IKvt/IaX2Iz3oot
Received: from igel.home (aftr-82-135-83-65.dynamic.mnet-online.de [82.135.83.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 30 May 2026 17:02:35 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 8848F2C16CE; Sat, 30 May 2026 17:02:35 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
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
  Benno Lossin <lossin@kernel.org>,  debug@rivosinc.com,
  linux-kernel@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
  linux-mm@kvack.org,  linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  alistair.francis@wdc.com,  richard.henderson@linaro.org,
  jim.shu@sifive.com,  andybnac@gmail.com,  kito.cheng@sifive.com,
  charlie@rivosinc.com,  atishp@rivosinc.com,  evan@rivosinc.com,
  cleger@rivosinc.com,  alexghiti@rivosinc.com,  samitolvanen@google.com,
  broonie@kernel.org,  rick.p.edgecombe@intel.com,
  rust-for-linux@vger.kernel.org,  Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
In-Reply-To: <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
	(Deepak Gupta via's message of "Wed, 12 Nov 2025 16:43:04 -0800")
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
	<20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
Date: Sat, 30 May 2026 17:02:35 +0200
Message-ID: <87jyslndo4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_080300_385775_FE72D2F8 
X-CRM114-Status: GOOD (  13.05  )
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

On Nov 12 2025, Deepak Gupta via B4 Relay wrote:

> From: Deepak Gupta <debug@rivosinc.com>
>
> `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> This is to make sure that any existing apps using PROT_WRITE still work.
>
> Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
> Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> encodings for shadow stack. Above changes ensure that existing apps
> continue to work because underneath kernel will be picking
> `protection_map[VM_WRITE|VM_READ]` PTE encodings.

This breaks LTP mmap04:

$ ./mmap04
tst_test.c:2042: TINFO: LTP version: 20260529.5ccf816f
tst_test.c:2045: TINFO: Tested kernel: 7.0.10-5-default #1 SMP PREEMPT_DYNAMIC Sat May 23 12:09:09 UTC 2026 (bb95589) riscv64
tst_kconfig.c:90: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:753: TINFO: CONFIG_FAULT_INJECTION kernel option detected which might slow the execution
tst_test.c:1870: TINFO: Overall timeout per run is 0h 04m 00s
mmap04.c:66: TPASS: mapping permissions in /proc matched: ---p
mmap04.c:66: TPASS: mapping permissions in /proc matched: ---s
mmap04.c:66: TPASS: mapping permissions in /proc matched: r--p
mmap04.c:66: TPASS: mapping permissions in /proc matched: r--s
mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w-p, found: rw-p
mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w-s, found: rw-s
mmap04.c:66: TPASS: mapping permissions in /proc matched: rw-p
mmap04.c:66: TPASS: mapping permissions in /proc matched: rw-s
mmap04.c:66: TPASS: mapping permissions in /proc matched: r-xp
mmap04.c:66: TPASS: mapping permissions in /proc matched: r-xs
mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -wxp, found: rwxp
mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -wxs, found: rwxs
mmap04.c:66: TPASS: mapping permissions in /proc matched: rwxp
mmap04.c:66: TPASS: mapping permissions in /proc matched: rwxs

Summary:
passed   10
failed   4
broken   0
skipped  0
warnings 0

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
