Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA64C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArLNVbuQ3ni43nlM0uBhfZLViUIGpqI7C40Yhj+qpKk=; b=H+CWjMU5aI6T6u
	G5PBcZRaVIF2kotQOGWPeW9X4zgz3moR5S+svznMtk+E/EH2NyeW7SC+kubdJI2YHj196pPJyB4vi
	x96GpEJ5XPeMtXpEjDpqUwe0zhSkp7UAAhgThdqcFPlaKtuUp1k2VS7Fc0LwQQ2EXoypUa2rqeBJ/
	maVZeA8IyeNYWHjCDR+1soq4miyvpVFz+zBhPCNghikHo3E9h/HaeilM1bQ9mf5VHe1LBjN2jDqhq
	BK1WLfaYAU8Yzd/wuX7Zx+MZTdh0py4VpPbjuKiL/dcFvhJjuzhIhor8Vs5Jj1zK5GF+F/Aaz6+iE
	8szlU23Rq/NgSKWwrL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O2q-0000000Cihh-1hDS;
	Wed, 09 Sep 2026 19:33:20 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O2m-0000000Cigf-3Eqb;
	Wed, 09 Sep 2026 19:33:18 +0000
Received: from ehlo.thunderbird.net ([172.59.163.39])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 689JW0Ri241996
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2026 12:32:01 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 689JW0Ri241996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788982324;
	bh=+dGDqKIiorLm4PMRWZf+lcjSymk+duftPVKL8h3BRa8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gofX7hrQMbsXkfAGKbIB5EEVBWalAWuw926LqzLEOVYYNLyZUfbWEzWPGDLj9bbmQ
	 WFie+ve7lUQ9pYuRVmVYjV+EqzzAArpgHRWshxY1qKfnMcxxPUBe/xs1MmeSmnGIOJ
	 dPgyxNew5qsHsjhQOA41SlBB/MQHD0m+r1YFZE3wLCs3umtpLH2oSsE4iYDyt3+j/i
	 rnjM7tEna8nBlg7YqDxC5Ptjf5+Rcrbt1/0XzPeibvb/+oRmhKO1xpHus1ynWSXLJ8
	 MI9bdFysgi5uqG5wVEpJJTL/7pSn2oMlC1a/K6We8WFSaRVoteYLUt+37PBgC/p1jC
	 eVbxDJsilqYjA==
Date: Wed, 09 Sep 2026 12:31:53 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?ISO-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Christophe Leroy <chleroy@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org,
        linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Jan Stancek <jstancek@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
User-Agent: K-9 Mail for Android
In-Reply-To: <20260908071911.GU4120091@noisy.programming.kicks-ass.net>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de> <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de> <20260908071911.GU4120091@noisy.programming.kicks-ass.net>
Message-ID: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_123316_815142_83EA1383 
X-CRM114-Status: GOOD (  16.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2VwdGVtYmVyIDgsIDIwMjYgMTI6MTk6MTEgQU0gUERULCBQZXRlciBaaWpsc3RyYSA8cGV0
ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+T24gVHVlLCBTZXAgMDgsIDIwMjYgYXQgMDg6MzM6
NDZBTSArMDIwMCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+IEFsbCB2RFNPIGNvZGUgbmVl
ZHMgdG8gYmUgY29tcGxldGVseSBwb3NpdGlvbiBpbmRlcGVuZGVudC4gU3ltYm9sCj4+IHJlZmVy
ZW5jZXMgYXJlIG1hcmtlZCBhcyBoaWRkZW4gc28gdGhlIGNvbXBpbGVyIGVtaXRzIFBDLXJlbGF0
aXZlCj4+IHJlbG9jYXRpb25zLiBIb3dldmVyIHRoZXJlIGFyZSBjYXNlcyB3aGVyZSB0aGUgY29t
cGlsZXIgbWF5IHN0aWxsCj4+IGVtaXQgYWJzb2x1dGUgcmVsb2NhdGlvbnMsIGFzIHRoZXkgYXJl
IHZhbGlkIGluIHJlZ3VsYXIgUElDIERTTyBjb2RlLgo+PiBUaGVzZSB3b3VsZCBiZSByZXNvbHZl
ZCBieSB0aGUgbGlua2VyIGFuZCB3aWxsIGJyZWFrIGF0IHJ1bnRpbWUuCj4+IFRoaXMgaGFzIGJl
ZW4gb2JzZXJ2ZWQgb24gYXJtNjQsIHNlZSBjb21taXQgMGMzMTRjZGE5MzI1ICgiYXJtNjQ6IHZk
c286Cj4+IFdvcmsgYXJvdW5kIGludmFsaWQgYWJzb2x1dGUgcmVsb2NhdGlvbnMgZnJvbSBHQ0Mi
KQo+PiAKPj4gSW50cm9kdWNlIGEgdG9vbCB0byBjaGVjayBmb3IgYWJzb2x1dGUgcmVsb2NhdGlv
bnMgZHVyaW5nIHRoZSBidWlsZCwKPj4gYXMgdGhlIGN1cnJlbnQgaW5saW5lLXNoZWxsIGxvZ2lj
IGlzIG5vdCBleHByZXNzaXZlIGVub3VnaC4KPj4gVGhlIGNoZWNrIGlzIGRvbmUgb24gdGhlIG9i
amVjdCBmaWxlcyBhcyB0aGUgcmVsb2NhdGlvbnMgd2lsbCBub3QgZXhpc3QKPj4gYW55bW9yZSBp
biB0aGUgZmluYWwgRFNPLiBBcyB0aGVyZSBpcyBubyBleHRlbnNpb24gcG9pbnQgZm9yIHRoZQo+
PiBjb21waWxhdGlvbiBvZiBlYWNoIG9iamVjdCBmaWxlLCBwZXJmb3JtIHRoZSB2YWxpZGF0aW9u
IGluIHZkc29fY2hlY2suCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KPj4gLS0tCj4+ICBNYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgfCAgMTkgKysKPj4gIGxpYi92ZHNvL0tjb25maWcgICAgICAgICAgICB8
ICAgNSArCj4+ICBsaWIvdmRzby9NYWtlZmlsZSAgICAgICAgICAgfCAgIDIgKwo+PiAgbGliL3Zk
c28vTWFrZWZpbGUuaW5jbHVkZSAgIHwgIDE0ICsrCj4+ICBsaWIvdmRzby9jaGVjay8uZ2l0aWdu
b3JlICAgfCAgIDMgKwo+PiAgbGliL3Zkc28vY2hlY2svTWFrZWZpbGUgICAgIHwgIDM0ICsrKwo+
PiAgbGliL3Zkc28vY2hlY2svZWxmLnJzICAgICAgIHwgNDk4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMg
fCAxNTQgKysrKysrKysrKysrKysKPj4gIDggZmlsZXMgY2hhbmdlZCwgNzI5IGluc2VydGlvbnMo
KykKPgo+VXJnaCwgZG9lcyB0aGlzIG1lYW4gSSBoYXZlIHRvIGhhdmUgcnVzdCBpbnN0YWxsZWQg
anVzdCB0byBidWlsZCBhCj5rZXJuZWwgbm93PwoKSXQgd2FzIGdvaW5nIHRvIGhhcHBlbiwgYW5k
IG5vdyB3ZSdsbCBoYXZlIHRvIHN1ZmZlciB0aGUgaW5zdGFiaWxpdHkgb2YgcnVzdC4uLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
