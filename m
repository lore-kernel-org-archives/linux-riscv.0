Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505BC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvZOp6UOXSQJ69PFq+yGXY8KuZzjGeLwwgSi8UhMADk=; b=GoI1Gm/tGYKit9
	bC+iDiCES8lytz2XYErcs7qjzSgfGH/sumsWE4UnXdmn7bhVt4kSMxAB+kNGRC5yzepuNtuCFSQ2t
	OE+DPldFek2xCe1aM/GKV7xLN+1js54PQfF+aK/rildnjVSei/z4tQ6wAbg/kcyEKIh1qFXc2v3It
	2goDliHiYgVSoM4wuRZOah5pdiQ+AKFc582/LLpCembzQDOtYP21qIp4dhczpflYyveIV5WVTIq9s
	M4J+DpWrcz4i48GO3aY3Ib/rPX913M42zJcjmqy8XEI8ZQDhMzrzFkWm5M0+ZCAyW3Aw3BEMwI4i/
	5UbH6bnVCKqrfLTXW2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nyv-0000000CiI3-1Tpu;
	Wed, 09 Sep 2026 19:29:17 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nys-0000000CiHN-2T7G;
	Wed, 09 Sep 2026 19:29:15 +0000
Received: from ehlo.thunderbird.net ([172.59.162.201])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 689JRcBm234939
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2026 12:27:39 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 689JRcBm234939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788982063;
	bh=dm9wpz4h++ofzecnaqGunBw1Zr0gciiuIEIuRKgM8Ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KGmenuJ4WDEIJmD1OjtLBCTBIwmOPf5WXdqCO5NhxzNk/PRMxxRdYtCQ/e9LiQrbV
	 5nqhJq3gZmxqektEkouPM43IJ+O+eLEDDnkzku4OU8RnhJdWNoOzbcM86CqUSS8cda
	 TGHj1Sj2JK1rzrE8/0GlItXDBmcjxoplXEs2uNG488VNDWTtxr1RHdwo+/ZC/5FRv+
	 Wy6lT+Qfy6Lh4xU4ePky/daoK1IUOfrPNaz0BFP5rM0ouPsB86TVM+rt/GpXFp601e
	 VoZGbeqZhFA9YU7x21eyffmZrBwUa7PfRZVyvemk05/BdqUB6bb3V5JxF/PsdotOYc
	 tTrjTgSh5/hig==
Date: Wed, 09 Sep 2026 12:27:30 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_02/24=5D_x86/elf=2C_um/x86/?=
 =?US-ASCII?Q?elf=3A_Move_relocation_constants_to_UAPI?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260909144930.GAaqFx-mjH3-u6jLjw@fat_crate.local>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de> <20260908-vdso-absolute-reloc-v5-2-3a93791af1cf@linutronix.de> <20260908135513.GAaqATwXHcQD7plnH-@fat_crate.local> <20260908161740-0d79e592-87a6-43c5-9174-84ce1904e639@linutronix.de> <20260908151238.GBaqAl5iKb64meuPJl@fat_crate.local> <20260909075156-06ff671c-ab7b-47d8-aaa3-588b570888bc@linutronix.de> <20260909144930.GAaqFx-mjH3-u6jLjw@fat_crate.local>
Message-ID: <F9786718-8378-443D-A21E-77E057B62BB2@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_122914_633078_9D5E4931 
X-CRM114-Status: GOOD (  17.92  )
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

T24gU2VwdGVtYmVyIDksIDIwMjYgNzo0OTozMCBBTSBQRFQsIEJvcmlzbGF2IFBldGtvdiA8YnBA
YWxpZW44LmRlPiB3cm90ZToKPk9uIFdlZCwgU2VwIDA5LCAyMDI2IGF0IDA3OjU5OjUxQU0gKzAy
MDAsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+PiBUaGVzZSBuYW1lcyBhbmQgbnVtYmVycyBh
cmUgZGVmaW5lZCBieSB0aGUgYXJjaGl0ZWN0dXJlcycgRUxGIHNwZWNpZmljYXRpb25zLgo+PiBU
aGV5IGFyZSBhbHJlYWR5IGNhc3QgaW4gc3RvbmUuIEZvciBleGFtcGxlIHNlZSBUYWJsZSA0Ljkg
b2YgWzBdLgo+PiBDaGFuZ2luZyB0aGVtIHdvdWxkIGJyZWFrIGNvbXBpbGVycywgbGlua2Vycywg
bG9hZGVycyBhbmQgbW9yZSBvciBsZXNzIGV2ZXJ5Cj4+IGV4aXN0aW5nIEVMRiBiaW5hcnkuCj4K
PlNvPwo+Cj5Zb3VyIGdvYWwgaXMgdG8gcHJvdmlkZSB0aGVtIHRvIHRvb2xzLy4gWW91IHdhbnQg
dG8gcHJvdmlkZSB0aGVtIHRvCj4qZXZlcnl0aGluZyouIFNlZSB0aGUgZGlzY3JlcGFuY2UgaGVy
ZT8KPgo+PiBUaGF0IGlzIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgdG9vbHMgVUFQSSBoZWFk
ZXJzLgo+Cj5EaWQgeW91IGV2ZW4gcmVhZCB0aGF0IGZpbGU/Cj4KPiJXaHkgd2Ugd2FudCBhIGNv
cHkgb2Yga2VybmVsIGhlYWRlcnMgaW4gdG9vbHM/Cj49PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4KPlRoZXJlIHVzZWQgdG8gYmUgbm8gY29waWVzLCB3aXRo
IHRvb2xzLyBjb2RlIHVzaW5nIGtlcm5lbCBoZWFkZXJzCj5kaXJlY3RseS4gRnJvbSB0aW1lIHRv
IHRpbWUgdG9vbHMvcGVyZi8gYnJva2UgZHVlIHRvIGxlZ2l0aW1hdGUga2VybmVsCj5oYWNraW5n
LiBBdCBzb21lIHBvaW50IExpbnVzIGNvbXBsYWluZWQgYWJvdXQgc3VjaCBkaXJlY3QgdXNhZ2Uu
IFRoZW4gd2UKPmFkb3B0ZWQgdGhlIGN1cnJlbnQgbW9kZWwuCj4KPlRoZSB3YXkgdGhlc2UgaGVh
ZGVycyBhcmUgdXNlZCBpbiBwZXJmIGFyZSBub3QgcmVzdHJpY3RlZCB0byBqdXN0Cj5pbmNsdWRp
bmcgdGhlbSB0byBjb21waWxlIHNvbWV0aGluZy4KPi4uLiIKPgo+SnVzdCByZWFkIHRoZSBkYW1u
IHRoaW5nIGJlZm9yZSB5b3UgcmVwbHkuCj4KPj4gQWxzbyB3ZSBhbHJlYWR5IGhhdmUgb3RoZXIs
IGNsb3NlbHkgcmVsYXRlZCwgRUxGIGNvbnN0YW50cyBpbiB0aGUgVUFQSSwKPj4gc2VlIHssdG9v
bHMvfWluY2x1ZGUvdWFwaS9saW51eC9lbGZ7LC1lbX0uaC4KPgo+U3JzbHk/IT8KPgo+WW91IG1v
dmVkIHRoZW0gdGhlcmU6Cj4KPmNvbW1pdCA2MjZmZDM1Mjc4Mjk1ZmJiMjFmMmRhMzMxY2Q4MDI4
ZTk3MzhkOTY1Cj5BdXRob3I6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBs
aW51dHJvbml4LmRlPgo+RGF0ZTogICBXZWQgRmViIDI2IDEyOjQ0OjQ2IDIwMjUgKzAxMDAKPgo+
ICAgIHRvb2xzL2luY2x1ZGU6IEFkZCB1YXBpL2xpbnV4L2VsZi5oCj4gICAgCj4gICAgSXQgd2ls
bCBiZSB1c2VkIGJ5IHRoZSB2RFNPIHNlbGZ0ZXN0cy4KPgo+Cj5Mb29raW5nIGF0IHRoZSByZXN0
LCBpdCBsb29rcyBsaWtlIHNvbWUgZWxmIGJpdHMgZ290IGV4cG9ydGVkLCB5b3UgYWRkZWQgc29t
ZQo+bW9yZSBhbmQgdGhhdCBzaGlwIGhhcyBzYWlsZWQuIEkgc3RpbGwgdGhpbmsgdXMgcHJvdmlk
aW5nIGhlYWRlcnMgaXMKPmNvbXBsZXRlbHkgdW5uZWNlc3NhcnkgYW5kIGl0IHdpbGwgY29tZSB0
byBjYXVzZSBjb25mbGljdHMgZXZlbnR1YWxseSBidXQgaGV5LAo+bm90IG15IHByb2JsZW0uCj4K
CkkgZG8gYmVsaWV2ZSB0aGVyZSBhcmUgKnNvbWUqIGhlYWRlcnMgdGhhdCB3b3VsZCBiZSByZWFz
b25hYmx5IHRvIGV4cG9ydCB0byB0b29scy8gYmV5b25kIHdoYXQgaXQgaXMgaW4gdWFwaTsgYSBt
YWpvciByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCB0aGUgdG9vbHMgYXJlIHN1ZmZlcmluZyBmcm9t
IGEgY3JhenkgbGV2ZWwgb2YgaW50ZXJuYWwgaW5jb25zaXN0ZW5jeSByaWdodCBub3cuIAoKQmFz
aWNhbGx5IHVhcGkg4oqCIHRyZWV3aWRlIOKKgiBrZXJuZWwsIGJ1dCBhbHNvIHRyZWV3aWRlIOKK
giB0b29scyBjb21tb24g4oqCIHRvb2wtc3BlY2lmaWMuLi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
