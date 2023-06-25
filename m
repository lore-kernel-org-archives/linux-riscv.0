Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AD9EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJoaLQ9okGx0jrxFMeERUA5Ts+u2QN5Kf63nwKjUVf8=; b=AbHrYDjPF1CW1X
	psiVDx4j/tOsQFaC9aI5DTCe8Yoo7PSfV/5CvSqGaUfFr11NHCi7FDTUS/5t2JX+RTuGjMwfhCa8r
	BKygEpeWEn/zIpr1S3lF8uo7gTccdPky4yudee4WZq68uWYViCH2rDf6U7luLuJzTeTbtSrIhpatQ
	rJf/1rcsCzlCqyR7RbCFH89GSiFwp2wbSIolLvUE/opa52XjBR96VQAMF4Z+52EiVM5UhNnrT5cJs
	C3sCLaMlhbZjPuhSgnRR8i6AOOsZ+5MTyyyGhHncnln05MvR6X0v0dZmkT8Vc9MHRXcDDn54HplOC
	XoJfPsc0fvogM2LfANOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDT5p-008LZH-2Q;
	Sun, 25 Jun 2023 17:00:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDT5m-008LWn-08
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 17:00:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91D2F60C09;
	Sun, 25 Jun 2023 16:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36275C433C0;
	Sun, 25 Jun 2023 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687712399;
	bh=aLCuUdfO6pxcjuIFQrLZGXDWAtq12vZAS1hIVljCMnc=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=AC1vSumc4ct8MI9XxHlrliU6Yp7yyCu6ZeDJwp61tjhyiCrVBxC/8hRighzf4/Jir
	 ZguzImuF8hT2SAssFaFU0acYGQVlIJcGrZG2RaX1m101BfLoCDs9+SyfNMS0QJ61Vy
	 oOlYzov2VLP1LMbVyHyz6r/HHCAA8IhUKDIHMsmIEJ+gMTbFQfL7zldEVIKsgVQUJm
	 nQPeaqoRJ4wfx+ZmOWAaYqPQH6otkw65kBLJkhTSOGfx3O/N07C1AnDoqq0K1+1BMv
	 qU4mrAT86aH8YZOnjv7kjoI/AfEnKThc+yzA5UOCkqjcUrugKAODPnMWNQ83uKsq/3
	 xopdgo9nlmJ9Q==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0BE8127C0054;
	Sun, 25 Jun 2023 12:59:56 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Sun, 25 Jun 2023 12:59:56 -0400
X-ME-Sender: <xms:inKYZEjtReBigAD1i_dhXvqwXUgMMI0KIrTJOMMv2rfcayN8IN02Ew>
    <xme:inKYZNDTSsc5W3Ng387BPNeiFzXJjJETX3V_DL8KVAzyO2XpVGfgccTtaq7REhe5K
    C8j22pDYyY4r1GVsgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehtddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehnugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhepudevffdvgedvfefhgeejjeelgfdtffeukedugfekuddvtedv
    udeileeugfejgefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudei
    udekheeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlih
    hnuhigrdhluhhtohdruhhs
X-ME-Proxy: <xmx:inKYZMFnSbDjFesDzdzfCdN7QnRtPXWDI_AlO5M-J2Nv4gORRwApTw>
    <xmx:inKYZFT_R0sRWLiO6AFlxtv669gauGwxqpTMNTHlTngUIDgTAwAZJQ>
    <xmx:inKYZBzzwDJo8YSwxaouPhZKbXIOrC5zPPjMK543eaCis3iZK4jxBA>
    <xmx:i3KYZPnm6gHODaNtvmx5CxhJNHebwbbF95ev6Mro-blkwAzlzHLN4w>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8085731A0063; Sun, 25 Jun 2023 12:59:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <90161ac9-3ca0-4c72-b1c4-ab1293e55445@app.fastmail.com>
In-Reply-To: <20230625161417.GK52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <20230625161417.GK52412@kernel.org>
Date: Sun, 25 Jun 2023 09:59:34 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Mark Rutland" <mark.rutland@arm.com>,
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
 "Nadav Amit" <nadav.amit@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Puranjay Mohan" <puranjay12@gmail.com>,
 "Rick P Edgecombe" <rick.p.edgecombe@intel.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Song Liu" <song@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Will Deacon" <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, "the arch/x86 maintainers" <x86@kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_100002_387191_DCD38DA8 
X-CRM114-Status: GOOD (  44.26  )
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

CgpPbiBTdW4sIEp1biAyNSwgMjAyMywgYXQgOToxNCBBTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToK
PiBPbiBNb24sIEp1biAxOSwgMjAyMyBhdCAxMDowOTowMkFNIC0wNzAwLCBBbmR5IEx1dG9taXJz
a2kgd3JvdGU6Cj4+IAo+PiBPbiBTdW4sIEp1biAxOCwgMjAyMywgYXQgMTowMCBBTSwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPj4gPiBPbiBTYXQsIEp1biAxNywgMjAyMyBhdCAwMTozODoyOVBNIC0w
NzAwLCBBbmR5IEx1dG9taXJza2kgd3JvdGU6Cj4+ID4+IE9uIEZyaSwgSnVuIDE2LCAyMDIzLCBh
dCAxOjUwIEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+PiA+PiA+IEZyb206ICJNaWtlIFJhcG9w
b3J0IChJQk0pIiA8cnBwdEBrZXJuZWwub3JnPgo+PiA+PiA+Cj4+ID4+ID4gbW9kdWxlX2FsbG9j
KCkgaXMgdXNlZCBldmVyeXdoZXJlIGFzIGEgbWVhbiB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGNv
ZGUuCj4+ID4+ID4KPj4gPj4gPiBCZXNpZGUgYmVpbmcgc2VtYW50aWNhbGx5IHdyb25nLCB0aGlz
IHVubmVjZXNzYXJpbHkgdGllcyBhbGwgc3Vic3lzdGVtcwo+PiA+PiA+IHRoYXQgbmVlZCB0byBh
bGxvY2F0ZSBjb2RlLCBzdWNoIGFzIGZ0cmFjZSwga3Byb2JlcyBhbmQgQlBGIHRvIG1vZHVsZXMK
Pj4gPj4gPiBhbmQgcHV0cyB0aGUgYnVyZGVuIG9mIGNvZGUgYWxsb2NhdGlvbiB0byB0aGUgbW9k
dWxlcyBjb2RlLgo+PiA+PiA+Cj4+ID4+ID4gU2V2ZXJhbCBhcmNoaXRlY3R1cmVzIG92ZXJyaWRl
IG1vZHVsZV9hbGxvYygpIGJlY2F1c2Ugb2YgdmFyaW91cwo+PiA+PiA+IGNvbnN0cmFpbnRzIHdo
ZXJlIHRoZSBleGVjdXRhYmxlIG1lbW9yeSBjYW4gYmUgbG9jYXRlZCBhbmQgdGhpcyBjYXVzZXMK
Pj4gPj4gPiBhZGRpdGlvbmFsIG9ic3RhY2xlcyBmb3IgaW1wcm92ZW1lbnRzIG9mIGNvZGUgYWxs
b2NhdGlvbi4KPj4gPj4gPgo+PiA+PiA+IFN0YXJ0IHNwbGl0dGluZyBjb2RlIGFsbG9jYXRpb24g
ZnJvbSBtb2R1bGVzIGJ5IGludHJvZHVjaW5nCj4+ID4+ID4gZXhlY21lbV90ZXh0X2FsbG9jKCks
IGV4ZWNtZW1fZnJlZSgpLCBqaXRfdGV4dF9hbGxvYygpLCBqaXRfZnJlZSgpIEFQSXMuCj4+ID4+
ID4KPj4gPj4gPiBJbml0aWFsbHksIGV4ZWNtZW1fdGV4dF9hbGxvYygpIGFuZCBqaXRfdGV4dF9h
bGxvYygpIGFyZSB3cmFwcGVycyBmb3IKPj4gPj4gPiBtb2R1bGVfYWxsb2MoKSBhbmQgZXhlY21l
bV9mcmVlKCkgYW5kIGppdF9mcmVlKCkgYXJlIHJlcGxhY2VtZW50cyBvZgo+PiA+PiA+IG1vZHVs
ZV9tZW1mcmVlKCkgdG8gYWxsb3cgdXBkYXRpbmcgYWxsIGNhbGwgc2l0ZXMgdG8gdXNlIHRoZSBu
ZXcgQVBJcy4KPj4gPj4gPgo+PiA+PiA+IFRoZSBpbnRlbnRpb24gc2VtYW50aWNzIGZvciBuZXcg
YWxsb2NhdGlvbiBBUElzOgo+PiA+PiA+Cj4+ID4+ID4gKiBleGVjbWVtX3RleHRfYWxsb2MoKSBz
aG91bGQgYmUgdXNlZCB0byBhbGxvY2F0ZSBtZW1vcnkgdGhhdCBtdXN0IHJlc2lkZQo+PiA+PiA+
ICAgY2xvc2UgdG8gdGhlIGtlcm5lbCBpbWFnZSwgbGlrZSBsb2FkYWJsZSBrZXJuZWwgbW9kdWxl
cyBhbmQgZ2VuZXJhdGVkCj4+ID4+ID4gICBjb2RlIHRoYXQgaXMgcmVzdHJpY3RlZCBieSByZWxh
dGl2ZSBhZGRyZXNzaW5nLgo+PiA+PiA+Cj4+ID4+ID4gKiBqaXRfdGV4dF9hbGxvYygpIHNob3Vs
ZCBiZSB1c2VkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgZ2VuZXJhdGVkIGNvZGUKPj4gPj4gPiAg
IHdoZW4gdGhlcmUgYXJlIG5vIHJlc3RyaWN0aW9ucyBmb3IgdGhlIGNvZGUgcGxhY2VtZW50LiBG
b3IKPj4gPj4gPiAgIGFyY2hpdGVjdHVyZXMgdGhhdCByZXF1aXJlIHRoYXQgYW55IGNvZGUgaXMg
d2l0aGluIGNlcnRhaW4gZGlzdGFuY2UKPj4gPj4gPiAgIGZyb20gdGhlIGtlcm5lbCBpbWFnZSwg
aml0X3RleHRfYWxsb2MoKSB3aWxsIGJlIGVzc2VudGlhbGx5IGFsaWFzZWQgdG8KPj4gPj4gPiAg
IGV4ZWNtZW1fdGV4dF9hbGxvYygpLgo+PiA+PiA+Cj4+ID4+IAo+PiA+PiBJcyB0aGVyZSBhbnl0
aGluZyBpbiB0aGlzIHNlcmllcyB0byBoZWxwIHVzZXJzIGRvIHRoZSBhcHByb3ByaWF0ZQo+PiA+
PiBzeW5jaHJvbml6YXRpb24gd2hlbiB0aGUgYWN0dWFsbHkgcG9wdWxhdGUgdGhlIGFsbG9jYXRl
ZCBtZW1vcnkgd2l0aAo+PiA+PiBjb2RlPyAgU2VlIGhlcmUsIGZvciBleGFtcGxlOgo+PiA+Cj4+
ID4gVGhpcyBzZXJpZXMgb25seSBmYWN0b3JzIG91dCB0aGUgZXhlY3V0YWJsZSBhbGxvY2F0aW9u
cyBmcm9tIG1vZHVsZXMgYW5kCj4+ID4gcHV0cyB0aGVtIGluIGEgY2VudHJhbCBwbGFjZS4KPj4g
PiBBbnl0aGluZyBlbHNlIHdvdWxkIGdvIG9uIHRvcCBhZnRlciB0aGlzIGxhbmRzLgo+PiAKPj4g
SG1tLgo+PiAKPj4gT24gdGhlIG9uZSBoYW5kLCB0aGVyZSdzIG5vdGhpbmcgd3Jvbmcgd2l0aCBm
YWN0b3Jpbmcgb3V0IGNvbW1vbiBjb2RlLiBPbgo+PiB0aGUgb3RoZXIgaGFuZCwgdGhpcyBpcyBw
cm9iYWJseSB0aGUgcmlnaHQgdGltZSB0byBhdCBsZWFzdCBzdGFydAo+PiB0aGlua2luZyBhYm91
dCBzeW5jaHJvbml6YXRpb24sIGF0IGxlYXN0IHRvIHRoZSBleHRlbnQgdGhhdCBpdCBtaWdodCBt
YWtlCj4+IHVzIHdhbnQgdG8gY2hhbmdlIHRoaXMgQVBJLiAgKEknbSBub3QgYXQgYWxsIHNheWlu
ZyB0aGF0IHRoaXMgc2VyaWVzCj4+IHNob3VsZCByZXF1aXJlIGNoYW5nZXMgLS0gSSdtIGp1c3Qg
c2F5aW5nIHRoYXQgdGhpcyBpcyBhIGdvb2QgdGltZSB0bwo+PiB0aGluayBhYm91dCBob3cgdGhp
cyBzaG91bGQgd29yay4pCj4+IAo+PiBUaGUgY3VycmVudCBBUElzLCAqYW5kKiB0aGUgcHJvcG9z
ZWQgaml0X3RleHRfYWxsb2MoKSBBUEksIGRvbid0IGFjdHVhbGx5Cj4+IGxvb2sgbGlrZSB0aGUg
b25lIHRoaW5rIGluIHRoZSBMaW51eCBlY29zeXN0ZW0gdGhhdCBhY3R1YWxseQo+PiBpbnRlbGxp
Z2VudGx5IGFuZCBlZmZpY2llbnRseSBtYXBzIG5ldyB0ZXh0IGludG8gYW4gYWRkcmVzcyBzcGFj
ZToKPj4gbW1hcCgpLgo+PiAKPj4gT24geDg2LCB5b3UgY2FuIG1tYXAoKSBhbiBleGlzdGluZyBm
aWxlIGZ1bGwgb2YgZXhlY3V0YWJsZSBjb2RlIFBST1RfRVhFQwo+PiBhbmQganVtcCB0byBpdCB3
aXRoIG1pbmltYWwgc3luY2hyb25pemF0aW9uIChqdXN0IHRoZSBzdGFuZGFyZCBpbXBsaWNpdAo+
PiBvcmRlcmluZyBpbiB0aGUga2VybmVsIHRoYXQgcG9wdWxhdGVzIHRoZSBwYWdlcyBiZWZvcmUg
c2V0dGluZyB1cCB0aGUKPj4gUFRFcyBhbmQgd2hhdGV2ZXIgdXNlciBzeW5jaHJvbml6YXRpb24g
aXMgbmVlZGVkIHRvIGF2b2lkIGp1bXBpbmcgaW50bwo+PiB0aGUgbWFwcGluZyBiZWZvcmUgbW1h
cCgpIGZpbmlzaGVzKS4gIEl0IHdvcmtzIGFjcm9zcyBDUFVzLCBhbmQgdGhlIG9ubHkKPj4gcG9z
c2libGUgd2F5IHVzZXJzcGFjZSBjYW4gc2NyZXcgaXQgdXAgKGZvciBhIHJlYWQtb25seSBtYXBw
aW5nIG9mCj4+IHJlYWQtb25seSB0ZXh0LCBhbnl3YXkpIGlzIHRvIGp1bXAgdG8gdGhlIG1hcHBp
bmcgdG9vIGVhcmx5LCBpbiB3aGljaAo+PiBjYXNlIHVzZXJzcGFjZSBnZXRzIGEgcGFnZSBmYXVs
dC4gIEluY29oZXJlbmNlIGlzIGltcG9zc2libGUsIGFuZCBubyBvbmUKPj4gbmVlZHMgdG8gInNl
cmlhbGl6ZSIgKGluIHRoZSBTRE0gc2Vuc2UpLgo+PiAKPj4gSSB0aGluayB0aGUgc2FtZSBzZXF1
ZW5jZSAoZnJvbSB1c2Vyc3BhY2UncyBwZXJzcGVjdGl2ZSkgd29ya3Mgb24gb3RoZXIKPj4gYXJj
aGl0ZWN0dXJlcywgdG9vLCBhbHRob3VnaCBJIHRoaW5rIG1vcmUgY2FjaGUgbWFuYWdlbWVudCBp
cyBuZWVkZWQgb24KPj4gdGhlIGtlcm5lbCdzIGVuZC4gIEFzIGZhciBhcyBJIGtub3csIG5vIExp
bnV4IFNNUCBhcmNoaXRlY3R1cmUgbmVlZHMgYW4KPj4gSVBJIHRvIG1hcCBleGVjdXRhYmxlIHRl
eHQgaW50byB1c2VybW9kZSwgYnV0IEkgY291bGQgZWFzaWx5IGJlIHdyb25nLgo+PiAoSUlSQyBS
SVNDLVYgaGFzIHZlcnkgZGV2ZWxvcGVyLXVuZnJpZW5kbHkgaWNhY2hlIG1hbmFnZW1lbnQsIGJ1
dCBJIGRvbid0Cj4+IHJlbWVtYmVyIHRoZSBkZXRhaWxzLikKPj4gCj4+IE9mIGNvdXJzZSwgdXNp
bmcgcHRyYWNlIG9yIGFueSBvdGhlciBGT0xMX0ZPUkNFIHRvIG1vZGlmeSB0ZXh0IG9uIHg4NiBp
cwo+PiByYXRoZXIgZnJhdWdodCwgYW5kIEkgYmV0IG1hbnkgdGhpbmdzIGRvIGl0IHdyb25nIHdo
ZW4gdXNlcnNwYWNlIGlzCj4+IG11bHRpdGhyZWFkZWQuICBCdXQgbm90IGluIHByb2R1Y3Rpb24g
YmVjYXVzZSBpdCdzIG1vc3RseSBub3QgdXNlZCBpbgo+PiBwcm9kdWN0aW9uLikKPj4gCj4+IEJ1
dCBqaXRfdGV4dF9hbGxvYygpIGNhbid0IGRvIHRoaXMsIGJlY2F1c2UgdGhlIG9yZGVyIG9mIG9w
ZXJhdGlvbnMKPj4gZG9lc24ndCBtYXRjaC4gIFdpdGggaml0X3RleHRfYWxsb2MoKSwgdGhlIGV4
ZWN1dGFibGUgbWFwcGluZyBzaG93cyB1cAo+PiBiZWZvcmUgdGhlIHRleHQgaXMgcG9wdWxhdGVk
LCBzbyB0aGVyZSBpcyBubyBhdG9taWMgY2hhbmdlIGZyb20gbm90LXRoZXJlCj4+IHRvIHBvcHVs
YXRlZC1hbmQtZXhlY3V0YWJsZS4gIFdoaWNoIG1lYW5zIHRoYXQgdGhlcmUgaXMgYW4gb3Bwb3J0
dW5pdHkKPj4gZm9yIENQVXMsIHNwZWN1bGF0aXZlbHkgb3Igb3RoZXJ3aXNlLCB0byBzdGFydCBm
aWxsaW5nIHZhcmlvdXMgY2FjaGVzCj4+IHdpdGggaW50ZXJtZWRpYXRlIHN0YXRlcyBvZiB0aGUg
dGV4dCwgd2hpY2ggbWVhbnMgdGhhdCB2YXJpb3VzCj4+IGFyY2hpdGVjdHVyZXMgKGV2ZW4geDg2
ISkgbWF5IG5lZWQgc2VyaWFsaXphdGlvbi4KPj4gCj4+IEZvciBlQlBGLSBhbmQgbW9kdWxlLSBs
aWtlIHVzZSBjYXNlcywgd2hlcmUgSklUdGluZy9jb2RlIGdlbiBpcyBxdWl0ZQo+PiBjb2Fyc2Ut
Z3JhaW5lZCwgcGVyaGFwcyBzb21ldGhpbmcgdmFndWVseSBsaWtlOgo+PiAKPj4gaml0X3RleHRf
YWxsb2MoKSAtPiByZXR1cm5zIGEgaGFuZGxlIGFuZCBhbiBleGVjdXRhYmxlIHZpcnR1YWwgYWRk
cmVzcywKPj4gYnV0IGRvZXMgKm5vdCogbWFwIGl0IHRoZXJlCj4+IGppdF90ZXh0X3dyaXRlKCkg
LT4gd3JpdGUgdG8gdGhhdCBoYW5kbGUKPj4gaml0X3RleHRfbWFwKCkgLT4gbWFwIGl0IGFuZCBz
eW5jaHJvbml6ZSBpZiBuZWVkZWQgKG5vIHN5bmMgbmVlZGVkIG9uCj4+IHg4NiwgSSB0aGluaykK
Pj4gCj4+IGNvdWxkIGJlIG1vcmUgZWZmaWNpZW50IGFuZC9vciBzYWZlci4KPj4gCj4+IChNb2R1
bGVzIGNvdWxkIHVzZSB0aGlzIHRvby4gIEdldHRpbmcgYWx0ZXJuYXRpdmVzIHJpZ2h0IG1pZ2h0
IHRha2Ugc29tZQo+PiBmaWRkbGluZywgYmVjYXVzZSBvZmYgdGhlIHRvcCBvZiBteSBoZWFkLCB0
aGlzIGRvZXNuJ3QgbWF0Y2ggaG93IGl0IHdvcmtzCj4+IG5vdy4pCj4+IAo+PiBUbyBtYWtlIGFs
dGVybmF0aXZlcyBlYXNpZXIsIHRoaXMgY291bGQgd29yaywgbWF5YmUgKGhhdmVuJ3QgZnVsbHkK
Pj4gdGhvdWdodCBpdCB0aHJvdWdoKToKPj4gCj4+IGppdF90ZXh0X2FsbG9jKCkKPj4gaml0X3Rl
eHRfbWFwX3J3X2lucGxhY2UoKSAtPiBtYXAgYXQgdGhlIHRhcmdldCBhZGRyZXNzLCBidXQgUlcs
ICFYCj4+IAo+PiB3cml0ZSB0aGUgdGV4dCBhbmQgYXBwbHkgYWx0ZXJuYXRpdmVzCj4+IAo+PiBq
aXRfdGV4dF9maW5hbGl6ZSgpIC0+IGNoYW5nZSBmcm9tIFJXIHRvIFJYICphbmQgc3luY2hyb25p
emUqCj4+IAo+PiBqaXRfdGV4dF9maW5hbGl6ZSgpIHdvdWxkIGVpdGhlciBuZWVkIHRvIHdhaXQg
Zm9yIFJDVSAocG9zc2libHkgZXh0cmEKPj4gaGVhdnkgd2VpZ2h0IFJDVSB0byBnZXQgInNlcmlh
bGl6YXRpb24iKSBvciBzZW5kIGFuIElQSS4KPgo+IFRoaXMgZXNzZW50aWFsbHkgaG93IG1vZHVs
ZXMgd29yayBub3cuIFRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkIFJXLCB3cml0dGVuCj4gYW5kIHVw
ZGF0ZWQgd2l0aCBhbHRlcm5hdGl2ZXMgYW5kIHRoZW4gbWFkZSBST1ggaW4gdGhlIGVuZCB3aXRo
IHNldF9tZW1vcnkKPiBBUElzLgo+Cj4gVGhlIGlzc3VlIHdpdGggbm90IGhhdmluZyB0aGUgbWVt
b3J5IG1hcHBlZCBYIHdoZW4gaXQncyB3cml0dGVuIGlzIHRoYXQgd2UKPiBjYW5ub3QgdXNlIGxh
cmdlIHBhZ2VzIHRvIG1hcCBpdC4gT25lIG9mIHRoZSBnb2FscyBpcyB0byBoYXZlIGV4ZWN1dGFi
bGUKPiBtZW1vcnkgbWFwcGVkIHdpdGggbGFyZ2UgcGFnZXMgYW5kIG1ha2UgY29kZSBhbGxvY2F0
b3IgYWJsZSB0byBkaXZpZGUgdGhhdAo+IHBhZ2UgYW1vbmcgc2V2ZXJhbCBjYWxsZXJzLgo+Cj4g
U28gdGhlIGlkZWEgd2FzIHRoYXQgaml0X3RleHRfYWxsb2MoKSB3aWxsIGhhdmUgYSBjYWNoZSBv
ZiBsYXJnZSBwYWdlcwo+IG1hcHBlZCBST1gsIHdpbGwgYWxsb2NhdGUgbWVtb3J5IGZyb20gdGhv
c2UgY2FjaGVzIGFuZCB0aGVyZSB3aWxsIGJlCj4gaml0X3VwZGF0ZSgpIHRoYXQgdXNlcyB0ZXh0
IHBva2luZyBmb3Igd3JpdGluZyB0byB0aGF0IG1lbW9yeS4KPgo+IFVwb24gYWxsb2NhdGlvbiBv
ZiBhIGxhcmdlIHBhZ2UgdG8gaW5jcmVhc2UgdGhlIGNhY2hlLCB0aGF0IGxhcmdlIHBhZ2Ugd2ls
bAo+IGJlICJpbnZhbGlkYXRlZCIgYnkgZmlsbGluZyBpdCB3aXRoIGJyZWFrcG9pbnQgaW5zdHJ1
Y3Rpb25zIChlLmcgaW50MyBvbgo+IHg4NikKCklzIHRoaXMgYWN0dWFsbHkgdmFsaWQ/ICBJbiBi
ZXR3ZWVuIGludDMgYW5kIHJlYWwgY29kZSwgdGhlcmXigJlzIGEgcG90ZW50aWFsIHRvcm4gcmVh
ZCBvZiByZWFsIGNvZGUgbWl4ZWQgdXAgd2l0aCAweGNjLgoKPgo+IFRvIGltcHJvdmUgdGhlIHBl
cmZvcm1hbmNlIG9mIHRoaXMgcHJvY2Vzcywgd2UgY2FuIHdyaXRlIHRvICFYIGNvcHkgYW5kCj4g
dGhlbiB0ZXh0X3Bva2UgaXQgdG8gdGhlIGFjdHVhbCBhZGRyZXNzIGluIG9uZSBnby4gVGhpcyB3
aWxsIHJlcXVpcmUgc29tZQo+IGNoYW5nZXMgdG8gZ2V0IHRoZSBhbHRlcm5hdGl2ZXMgcmlnaHQu
Cj4KPiAtLSAKPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlrZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
