Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1722CCD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 21:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fca2JNBXj04mvE2kdxx4EN062Njcg1b4+BVs2vz4VTU=; b=4N9cZ4d3VxPLv2
	pPf0uryndHf5YmtgM+tVbe+3leG2fFMl4LZRAdn5Cg4D2vsrpAAC2Cwutw5wB/7zw/x9u5IQphHdv
	9DPK2W+Yln+CNjg+xBxZ6UfFZ8gt9RdVOK1mC4mC7IrzAOHQrL8C14sIRxBMWozKOb+YkUFVd6dgP
	np9yYzFGaj4kZoWRuBrjrZYYjEoZn+9ApVT7g7/Dttpp9XJ3cNh8iMeB503bo9/Bw08A7MAaMORD8
	b/aJIvQ/MDZUpDjP3u1E+vM6bqPsmuIlYzxx3dMpzJCFCan42atNhoULLup7Ge5pM+53LBpXzIDof
	DyLFB8WyDoUWo0UXzpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRX4-000000094zV-1KiF;
	Sat, 30 May 2026 21:47:50 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRX0-000000094z6-2aBP
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 21:47:48 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gSYjq1B98z1r5Sd;
	Sat, 30 May 2026 23:47:43 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gSYjk4hQGz1r5ST;
	Sat, 30 May 2026 23:47:38 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gSYjk0Sg2z1qqlT;
	Sat, 30 May 2026 23:47:38 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id S_RzmYjTOuSj; Sat, 30 May 2026 23:47:36 +0200 (CEST)
X-Auth-Info: VhoZGXqafEl8xd2Vn3898hxCrPZhtM4EMxNmVIF69poad4TwEdSE9C4PLgF6bHrY
Received: from igel.home (aftr-82-135-83-65.dynamic.mnet-online.de [82.135.83.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 30 May 2026 23:47:36 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 42A002C16CE; Sat, 30 May 2026 23:47:36 +0200 (CEST)
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
In-Reply-To: <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
	(Deepak Gupta's message of "Sat, 30 May 2026 12:40:33 -0700")
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
	<20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
	<87jyslndo4.fsf@igel.home>
	<CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
Date: Sat, 30 May 2026 23:47:36 +0200
Message-ID: <875x44o9hj.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_144746_952414_DBC28E73 
X-CRM114-Status: GOOD (  12.03  )
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

On Mai 30 2026, Deepak Gupta wrote:

> I see two ways forward:
>
> - It can be done in generic way where incoming PROT_WRITE means
>   PROT_READ | PROT_WRITE irrespective of RISC-V. Although others
>   (x86, arm, etc) would have to weigh in.
>
> OR
>
> - mmap04 LTP test can be updated to expect either of "rw-p" or "-w-p"
>   whenever only PROT_WRITE was specified.

OR

- Add a new PROT_ flag.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
