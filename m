Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF229EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoPig7K82ExYYBOqknPDJmG4dny07W47bDbYq8yW3x0=; b=2TXOPQKeQQPy7p
	vPJ/ErXguOJxJpEtj9lWJpSRODEPBmTzNbzNoJkx+Vpo/qafja3JmaZGVaXtE9kdEqDy4Xmta7E/7
	U3/JFviokq3qSGVMisPBPmrUjDMKdWg6MZ5Fcipz5RTMfhN/6HN+qnHpEWri8U9TF+JyZKvEuQR6x
	fwGZQVF66ptrWVSyNTYfKwMAOUxIAJP+1cw0K3wAN6t/0eRlAxmdKwDI0UsfplX9WNZh4kqcYTRto
	XMyxrLM6F6UWcJMcub2TSS+pBqDgIhOAe9R26DlcSMmmZuI7LnS0u8KD5TJq/hTJVP0avqPTFuqj3
	mgtFP8pQmk6BB03X8pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBf69-00BvW0-1D;
	Tue, 20 Jun 2023 17:24:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBf67-00BvUe-13
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 17:24:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22F736131C;
	Tue, 20 Jun 2023 17:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB89C433C0;
	Tue, 20 Jun 2023 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687281893;
	bh=Rd2KQT7Sg/jj2vpD/+cypNQq21vO707uBhL4Wt60ONQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=S0nBKMBymT7QgN7x8a89rfrJmeCB9n8O7Yfrne22w/1XbfEHmFl1Rqalu8V/ctdwS
	 YreKhbQDy/vrV6XZmrrg4bizue1smNoWLhFBgswQZanSO4Ro92yaaAarg99MPxLbzh
	 yKpDLNdRGTmfjIOljRoFNpPZHwH7wQAxmm3pHmr/BMx7AD4TENI+Rdqs8cBj0HzkcA
	 AtzbtBIHLvIwmOtc7p98zex7yFJwdycS0VkoDAf/l+jTz0QeCFN00hEKQ7OjiUPAvB
	 1clLx9hEwjZPVs40/3CKaXd3OODSbCepYMVDnv8Im1RrAg3NVZTc3mdnFGl41caa5W
	 PQziUw7BgRvUg==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id C920427C005A;
	Tue, 20 Jun 2023 13:24:51 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Tue, 20 Jun 2023 13:24:51 -0400
X-ME-Sender: <xms:4uCRZGPuv7m8KaXFojrVeCbfWrMZ7IJoui-4aoDexdm_V34ZG0-I6g>
    <xme:4uCRZE-OH2xt14uLz-FF7dbdv-gHG5w14JwsdNtUTTBditVKBbvq_q8tXxJx8iDzO
    WaowhDX_m63-nZ50aI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhguhicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduveffvdegvdefhfegjeejlefgtdffueekudfgkeduvdetvddu
    ieeluefgjeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedu
    keehieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinh
    hugidrlhhuthhordhush
X-ME-Proxy: <xmx:4uCRZNTpfg2cGu-JZbGK0lauKT6LTXTvSpjwrRQTqsoePCHX_VolEg>
    <xmx:4uCRZGtzcXFiHy54TUV3vETkj3W0NygxpQUty3hSE43wjAfN8bvT-A>
    <xmx:4uCRZOcK6KfTYx9uY7noUEoncUDShNm2IP8FjLgB4nFv3QpkDL6MpA>
    <xmx:4-CRZOAOrENLDeV3AOynkkTJ3wDHPyrZf0jxchqFsnzGmPnTrQoXvQ>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85C9831A0063; Tue, 20 Jun 2023 13:24:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <6145cabf-d016-4dba-b5d2-0fb793352058@app.fastmail.com>
In-Reply-To: <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
Date: Tue, 20 Jun 2023 10:24:29 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Nadav Amit" <nadav.amit@gmail.com>, "Song Liu" <song@kernel.org>
Cc: "Mike Rapoport" <rppt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Helge Deller" <deller@gmx.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Puranjay Mohan" <puranjay12@gmail.com>,
 "Rick P Edgecombe" <rick.p.edgecombe@intel.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Will Deacon" <will@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390 <linux-s390@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org,
 "the arch/x86 maintainers" <x86@kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_102455_463389_30D362D7 
X-CRM114-Status: GOOD (  17.93  )
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

CgpPbiBNb24sIEp1biAxOSwgMjAyMywgYXQgMToxOCBQTSwgTmFkYXYgQW1pdCB3cm90ZToKPj4g
T24gSnVuIDE5LCAyMDIzLCBhdCAxMDowOSBBTSwgQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5l
bC5vcmc+IHdyb3RlOgo+PiAKPj4gQnV0IGppdF90ZXh0X2FsbG9jKCkgY2FuJ3QgZG8gdGhpcywg
YmVjYXVzZSB0aGUgb3JkZXIgb2Ygb3BlcmF0aW9ucyBkb2Vzbid0IG1hdGNoLiAgV2l0aCBqaXRf
dGV4dF9hbGxvYygpLCB0aGUgZXhlY3V0YWJsZSBtYXBwaW5nIHNob3dzIHVwIGJlZm9yZSB0aGUg
dGV4dCBpcyBwb3B1bGF0ZWQsIHNvIHRoZXJlIGlzIG5vIGF0b21pYyBjaGFuZ2UgZnJvbSBub3Qt
dGhlcmUgdG8gcG9wdWxhdGVkLWFuZC1leGVjdXRhYmxlLiAgV2hpY2ggbWVhbnMgdGhhdCB0aGVy
ZSBpcyBhbiBvcHBvcnR1bml0eSBmb3IgQ1BVcywgc3BlY3VsYXRpdmVseSBvciBvdGhlcndpc2Us
IHRvIHN0YXJ0IGZpbGxpbmcgdmFyaW91cyBjYWNoZXMgd2l0aCBpbnRlcm1lZGlhdGUgc3RhdGVz
IG9mIHRoZSB0ZXh0LCB3aGljaCBtZWFucyB0aGF0IHZhcmlvdXMgYXJjaGl0ZWN0dXJlcyAoZXZl
biB4ODYhKSBtYXkgbmVlZCBzZXJpYWxpemF0aW9uLgo+PiAKPj4gRm9yIGVCUEYtIGFuZCBtb2R1
bGUtIGxpa2UgdXNlIGNhc2VzLCB3aGVyZSBKSVR0aW5nL2NvZGUgZ2VuIGlzIHF1aXRlIGNvYXJz
ZS1ncmFpbmVkLCBwZXJoYXBzIHNvbWV0aGluZyB2YWd1ZWx5IGxpa2U6Cj4+IAo+PiBqaXRfdGV4
dF9hbGxvYygpIC0+IHJldHVybnMgYSBoYW5kbGUgYW5kIGFuIGV4ZWN1dGFibGUgdmlydHVhbCBh
ZGRyZXNzLCBidXQgZG9lcyAqbm90KiBtYXAgaXQgdGhlcmUKPj4gaml0X3RleHRfd3JpdGUoKSAt
PiB3cml0ZSB0byB0aGF0IGhhbmRsZQo+PiBqaXRfdGV4dF9tYXAoKSAtPiBtYXAgaXQgYW5kIHN5
bmNocm9uaXplIGlmIG5lZWRlZCAobm8gc3luYyBuZWVkZWQgb24geDg2LCBJIHRoaW5rKQo+Cj4g
QW5keSwgd291bGQgeW91IG1pbmQgZXhwbGFpbmluZyB3aHkgeW91IHRoaW5rIGEgc3luYyBpcyBu
b3QgbmVlZGVkPyBJIAo+IG1lYW4gSSBoYXZlIGEg4oCcZmVlbGluZ+KAnSB0aGF0IHBlcmhhcHMg
VFNPIGNhbiBndWFyYW50ZWUgc29tZXRoaW5nIGJhc2VkIAo+IG9uIHRoZSBvcmRlciBvZiB3cml0
ZSBhbmQgcGFnZS10YWJsZSB1cGRhdGUuIElzIHRoYXQgdGhlIGFyZ3VtZW50PwoKU29ycnksIHdo
ZW4gSSBzYXkgIm5vIHN5bmMiIEkgbWVhbiBubyBjcm9zcy1DUFUgc3luY2hyb25pemF0aW9uLiAg
SSdtIGFzc3VtaW5nIHRoZSB1bmRlcmx5aW5nIHNlcXVlbmNlIG9mIGV2ZW50cyBpczoKCmFsbG9j
YXRlIHBoeXNpY2FsIHBhZ2VzIChqaXRfdGV4dF9hbGxvYykKCndyaXRlIHRvIHRoZW0gKHdpdGgg
TU9WLCBtZW1jcHksIHdoYXRldmVyKSwgdmlhIHRoZSBkaXJlY3QgbWFwIG9yIHZpYSBhIHRlbXBv
cmFyeSBtbQoKZG8gYW4gYXBwcm9wcmlhdGUgKmxvY2FsKiBiYXJyaWVyICh3aGljaCwgb24geDg2
LCBpcyBwcm9iYWJseSBpbXBsaWVkIGJ5IFRTTywgYXMgdGhlIHN1YnNlcXVlbnQgcGFnZXRhYmxl
IGNoYW5nZSBpcyBhdCBsZWFzdCBhIHJlbGVhc2U7IGFsc28sIGFueSBhbnkgcHJldmlvdXMgdGVt
cG9yYXJ5IG1tIHN0dWZmIHdvdWxkIGhhdmUgZG9uZSBNT1YgQ1IzIGFmdGVyd2FyZHMsIHdoaWNo
IGlzIGEgZnVsbCAic2VyaWFsaXppbmciIGJhcnJpZXIpCgpvcHRpb25hbGx5IHphcCB0aGUgZGly
ZWN0IG1hcCB2aWEgSVBJLCBhc3N1bWluZyB0aGUgcGFnZXMgYXJlIGRpcmVjdCBtYXBwZWQgKGJ1
dCB0aGlzIGNvdWxkIGJlIGF2b2lkZWQgd2l0aCBhIHNtYXJ0IGVub3VnaCBhbGxvY2F0b3IgYW5k
IHRlbXBvcmFyeV9tbSBhYm92ZSkKCmluc3RhbGwgdGhlIGZpbmFsIFJYIFBURSAoaml0X3RleHRf
bWFwKSwgd2hpY2ggZG9lcyBhIE1PViBvciBtYXliZSBhIExPQ0sgQ01QWENIRzE2Qi4gIE5vdGUg
dGhhdCB0aGUgdmlydHVhbCBhZGRyZXNzIGluIHF1ZXN0aW9uIHdhcyBub3QgcmVhZGFibGUgb3Ig
ZXhlY3V0YWJsZSBiZWZvcmUgdGhpcywgYW5kIGFsbCBDUFVzIGhhdmUgc2VyaWFsaXplZCBzaW5j
ZSB0aGUgbGFzdCB0aW1lIGl0IHdhcyBleGVjdXRhYmxlLgoKZWl0aGVyIGp1bXAgdG8gdGhlIG5l
dyB0ZXh0IGxvY2FsbHksIG9yOgoKMS4gRG8gYSBzdG9yZS1yZWxlYXNlIHRvIHRlbGwgb3RoZXIg
Q1BVcyB0aGF0IHRoZSB0ZXh0IGlzIG1hcHBlZAoyLiBPdGhlciBDUFUgZG9lcyBhIGxvYWQtYWNx
dWlyZSB0byBkZXRlY3QgdGhhdCB0aGUgdGV4dCBpcyBtYXBwZWQgYW5kIGp1bXBzIHRvIHRoZSB0
ZXh0CgpUaGlzIGlzIGFsbCBhcHByb3hpbWF0ZWx5IHRoZSBzYW1lIHRoaW5nIHRoYXQgcGxhaW4g
b2xkIG1tYXAoLi4uLCBQUk9UX0VYRUMsIC4uLikgZG9lcy4KCj4KPiBPbiB0aGlzIHJlZ2FyZCwg
b25lIHRoaW5nIHRoYXQgSSBjbGVhcmx5IGRvIG5vdCB1bmRlcnN0YW5kIGlzIHdoeSAKPiAqdG9k
YXkqIGl0IGlzIG9rIGZvciB1c2VycyBvZiBicGZfYXJjaF90ZXh0X2NvcHkoKSBub3QgdG8gY2Fs
bCAKPiB0ZXh0X3Bva2Vfc3luYygpLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKSSBjYW5ub3Qg
ZXhwbGFpbiB0aGlzLCBiZWNhdXNlIEkgc3VzcGVjdCB0aGUgY3VycmVudCBjb2RlIGlzIHdyb25n
LiAgQnV0IGl0J3Mgb25seSB3cm9uZyBhY3Jvc3MgQ1BVcywgYmVjYXVzZSBicGZfYXJjaF90ZXh0
X2NvcHkgZ29lcyB0aHJvdWdoIHRleHRfcG9rZV9jb3B5LCB3aGljaCBjYWxscyB1bnVzZV90ZW1w
b3JhcnlfbW0oKSwgd2hpY2ggaXMgc2VyaWFsaXppbmcuICBBbmQgaXQncyBwbGF1c2libGUgdGhh
dCBtb3N0IGVCUEYgdXNlIGNhc2VzIGRvbid0IGFjdHVhbGx5IGNhdXNlIHRoZSBsb2FkZWQgcHJv
Z3JhbSB0byBnZXQgdXNlZCBvbiBhIGRpZmZlcmVudCBDUFUgd2l0aG91dCBmaXJzdCBzZXJpYWxp
emluZyBvbiB0aGUgQ1BVIHRoYXQgZW5kcyB1cCB1c2luZyBpdC4gIChDb250ZXh0IHN3aXRjaGVz
IGFuZCBpbnRlcnJ1cHRzIGFyZSBzZXJpYWxpemluZy4pCgpGUkVEIGNvdWxkIG1ha2UgaW50ZXJy
dXB0cyBub24tc2VyaWFsaXppbmcuIEkgc2luY2VyZWx5IGhvcGUgdGhhdCBGUkVEIGRvZXNuJ3Qg
Y2F1c2UgdGhpcyBhbGwgdG8gZmFsbCBhcGFydC4KCi0tQW5keQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
