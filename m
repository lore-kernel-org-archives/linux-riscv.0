Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A116CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgPVC3kk2mWXuZAiXrsXVy+PtJYMIKbnyde1y4fTx5o=; b=rCDPH6IYZWbqsn
	yUZpwGxBEdt1vOeAHDy5TGYKg33hM4/dkgAuKQGrqNctrqVDmBnd+suM9lMl6V9rUiI2oQXqdvQ7f
	CdIp6JEBz3nENJxl0LGdjoyKIs+iq0QGMheiKLTB5lCBMU4fbfnBPyglicRc1BuJcHG6Up1twUxAW
	EJxpfBPRVwUW9IGYPkj1NU0nmpFCqHWwVtXMKuH0yrh835pP+BZMu8rTeOIshTapo4O3tinYH2Fvw
	BIsX8TqCACafTozoYt/19ocYQjui6If9PWDnCAhLNqfCw4rK17lCxbzoRXfNdJ14NGBBwL/FfzrvJ
	T7eoi9z5pXkbGbvJaStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMHi-0000000ClUd-2fH6;
	Tue, 02 Jun 2026 10:23:46 +0000
Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMHg-0000000ClSY-190a
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 10:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vvILlsXaVQShutp1p5WceQi2Eaf3pB4ovG/S15HHsU4=; b=PT1nwI4K/LueK0DDSNL+s4C13J
	wCISW9cQ6Rku1p5e71v6LNcH9E8BpNOErgTq20OxsIi/JohdQWrgMebuwQrMKgen7pJXROs+AsRqv
	q/PDtUrCrIsMZAHrVRiLpwUsOkpysGxuDIlQz4e1uDX5u9eweqgYZDbb9a8545EZNJqI=;
Received: from in01.mta.xmission.com ([166.70.13.51]:57296)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wUMHI-00EQUk-Sf; Tue, 02 Jun 2026 04:23:20 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:37600 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1wUMHF-002RRp-JI; Tue, 02 Jun 2026 04:23:20 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta <debug@rivosinc.com>,  Deepak Gupta via B4 Relay
 <devnull+debug.rivosinc.com@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov
 <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>,
  x86@kernel.org,  "H. Peter Anvin" <hpa@zytor.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  Vlastimil Babka <vbabka@suse.cz>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Conor Dooley <conor@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  Christian Brauner <brauner@kernel.org>,  Peter Zijlstra
 <peterz@infradead.org>,  Oleg Nesterov <oleg@redhat.com>,  Kees Cook
 <kees@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Jann Horn <jannh@google.com>,  Conor Dooley
 <conor+dt@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas
 Hindborg <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,
  Trevor Gross <tmgross@umich.edu>,  Benno Lossin <lossin@kernel.org>,
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
In-Reply-To: <87wlwif04z.fsf@igel.home> (Andreas Schwab's message of "Mon, 01
	Jun 2026 22:58:52 +0200")
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
	<20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
	<87jyslndo4.fsf@igel.home>
	<CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
	<875x44o9hj.fsf@igel.home>
	<CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
	<871peqgp9v.fsf@igel.home>
	<CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
	<87wlwif04z.fsf@igel.home>
Date: Tue, 02 Jun 2026 05:23:10 -0500
Message-ID: <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-XM-SPF: eid=1wUMHF-002RRp-JI;;;mid=<87tsrli6lt.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19J6tpF2AGRJ9xglxGPNzSSZeVg13KZsgY=
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: too long (recipient list exceeded maximum allowed size of 512 bytes)
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_032344_423606_D3D466B7 
X-CRM114-Status: GOOD (  15.31  )
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

Andreas Schwab <schwab@linux-m68k.org> writes:

> On Jun 01 2026, Deepak Gupta wrote:
>
>> riscv uses `VM_SHADOW_STACK`. It's just very simple to use `protection_map`
>> with just `VM_WRITE`. On RISC-V, `-W-` is a shadow stack mapping. It's not same
>> on x86 or arm64. So `protection_map[VM_WRITE]` simply picks shadow stack
>> encoding. We just ensure that PROT_WRITE is converted to
>> "VM_READ | VM_WRITE" at vma level.
>
> That does not explain _why_ you need to make that user visible change,
> when others can get away without it.

Especially since as I recall the decision was made was that the user
visible protection bits would match the mmap call.  If there is some
combination an architecture does not support that would simply not be
reflected in hardware until some future version of the hardware gets
around to supporting it.

This is what happened with executable page permissions on x86 for
example.  It used to be that it was not possible to deny execute
permission on a readable page.  Later that proved sufficiently valuable
that support for denying execute permission was added to the hardware.

That all happened quite transparently to userspace, that wasn't trying
to assuming PROT_READ implied PROT_EXEC.

So I am at a complete loss why someone would choose to break userspace
by confusing hardware limitations with what userspace asks for in mmap.

Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
