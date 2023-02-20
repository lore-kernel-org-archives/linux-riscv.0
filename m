Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE580C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0/GvJAzNsVYMX568pPdCCE3QCCzmf6FNAKILtn3Cfk=; b=tEpgFB1n4q3H/q
	8rmXMimQ7Ip6gF8XezGucTdeE+KeFw1/DlOkJzbDOEcOlDm9MZzcOvmLcpc1tQEKJ0HgW7Ouk2hW5
	M94g0cAxogzZnxNMPLUGqLXJoNrhn9z3ysiM0dBCJuwC8tgkb4g0pZ5sB5kK+awlApILRK+8cGhB0
	TrS8i9R//umNMDoushv0WmQbotzXfhN0cXJPIFfvifrad7r7rs7LTdy1ZOzf19pQ4cK6IBWx9e6rU
	eIWsQLk0EtvQEJQPn4pZ+ayzgysKaywCuxSlGgbsF/OavS1Q4c9bwSr17+KB5QuCNLuv+g8Sb39uT
	p/dV3/rJTBu3OeU9Ig4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2G7-003Tdc-5l; Mon, 20 Feb 2023 09:14:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2FT-003TWf-5I
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 09:14:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBFB6B80A49;
	Mon, 20 Feb 2023 09:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B570C433EF;
	Mon, 20 Feb 2023 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676884451;
	bh=mG/NJn6UIKMCtB1jUJxsXAFCx30P4P2liMAXbdz/2Xo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mAcRmoA6Qn3UZ1chqK60R1a2hOSyf3/oQFr9/z4MVnvrvZpMm1yEwoqqWTqJ0IMbh
	 L7W844Whmf+R+CoIxa/+5A3ShRVClbZ91nvx+OLA3SadOpiq7O719RAXw69X71/BFU
	 DtFAIuLebpfytY40BPrUr7OG2trd4+iPLaHButziGI9MBP/STpDpPG5uxN5UKtSV8L
	 XYiDzlzvSsIrgoy5ZcCrtXTfbe3nwCMDN/Ar2nzLAxsIQ+wsFrrTsbzB//rb7Y82N7
	 KtKQJEvcSyK7lCJv3F7dJaUIbglBk2CjsdArBrH867pR97sXB1f+v1CjyC8P9rDpg5
	 fc8kEM4T9n7lg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v8 0/3] Introduce 64b relocatable kernel
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
Date: Mon, 20 Feb 2023 10:14:09 +0100
Message-ID: <87y1osog0u.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_011421_895623_FAB06BF1 
X-CRM114-Status: GOOD (  22.72  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEFmdGVy
IG11bHRpcGxlIGF0dGVtcHRzLCB0aGlzIHBhdGNoc2V0IGlzIG5vdyBiYXNlZCBvbiB0aGUgZmFj
dCB0aGF0IHRoZQo+IDY0YiBrZXJuZWwgbWFwcGluZyB3YXMgbW92ZWQgb3V0c2lkZSB0aGUgbGlu
ZWFyIG1hcHBpbmcuCj4KPiBUaGUgZmlyc3QgcGF0Y2ggYWxsb3dzIHRvIGJ1aWxkIHJlbG9jYXRh
YmxlIGtlcm5lbHMgYnV0IGlzIG5vdCBzZWxlY3RlZAo+IGJ5IGRlZmF1bHQuIFRoYXQgcGF0Y2gg
aXMgYSByZXF1aXJlbWVudCBmb3IgS0FTTFIuCj4gVGhlIHNlY29uZCBhbmQgdGhpcmQgcGF0Y2hl
cyB0YWtlIGFkdmFudGFnZSBvZiBhbiBhbHJlYWR5IGV4aXN0aW5nIHBvd2VycGMKPiBzY3JpcHQg
dGhhdCBjaGVja3MgcmVsb2NhdGlvbnMgYXQgY29tcGlsZS10aW1lLCBhbmQgdXNlcyBpdCBmb3Ig
cmlzY3YuCj4KPiBUaGlzIHBhdGNoc2V0IGlzIHJlYmFzZWQgb24gdG9wIG9mOgo+Cj4gUklTQy1W
IGthc2FuIHJld29yayAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZNlRUdmt1JTJGeXVT
am00MmpAc3B1ZC9ULykKPiByaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGlu
ZWFyIG1hcHBpbmcgKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAxMjUxMTQyMjku
aHJoc3l3NGFlZ3JubW9hdUBvcmVsL1QvKQo+IHJpc2N2OiBBbGxvdyB0byBkb3duZ3JhZGUgcGFn
aW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lIChodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sL0NBSFZYdWJqZVNNdmZUUG52cm5ZUnVwT0d4Nit2VXZVR2ZSUzNwaVRlbz1USDJjSEtOZ0Bt
YWlsLmdtYWlsLmNvbS8pCj4gYmFzZS1jb21taXQtdGFnOiB2Ni4yLXJjNwo+Cj4gQ2hhbmdlcyBp
biB2ODoKPiAgICogRml4IFVFRkkgYm9vdCBieSBtb3ZpbmcgcmVsYS5keW4gc2VjdGlvbiBpbnRv
IHRoZSBkYXRhIHNvIHRoYXQgUEUvQ09GRgo+ICAgICBsb2FkZXIgYWN0dWFsbHkgY29waWVzIHRo
ZSByZWxvY2F0aW9ucyB0b28KPiAgICogRml4IGNoZWNrIHRoYXQgdXNlZCBQR0RJUiBpbnN0ZWFk
IG9mIFBVRCB3aGljaCB3YXMgbm90IGNvcnJlY3QKPiAgICAgZm9yIHN2NDggYW5kIHN2NTcKPiAg
ICogRml4IFBFL0NPRkYgaGVhZGVyIGRhdGEgc2l6ZSBkZWZpbml0aW9uIGFzIGl0IGxlZCB0byBz
aXplIG9mIDAKPgo+IENoYW5nZXMgaW4gdjc6Cj4gICAqIFJlYmFzZSBvbiB0b3Agb2YgdjUuMTUK
PiAgICogRml4IExERkxBR1Nfdm1saW51eCB3aGljaCB3YXMgb3ZlcnJpZGVuIHdoZW4gQ09ORklH
X0RZTkFNSUNfRlRSQUNFIHdhcwo+ICAgICBzZXQKPiAgICogTWFrZSByZWxvY2F0ZV9rZXJuZWwg
c3RhdGljCj4gICAqIEFkZCBBY2sgZnJvbSBNaWNoYWVsCj4KPiBDaGFuZ2VzIGluIHY2Ogo+ICAg
KiBSZW1vdmUgdGhlIGtlcm5lbCBtb3ZlIHRvIHZtYWxsb2Mgem9uZQo+ICAgKiBSZWJhc2VkIG9u
IHRvcCBvZiBmb3ItbmV4dAo+ICAgKiBSZW1vdmUgcmVsb2NhdGFibGUgcHJvcGVydHkgZnJvbSAz
MmIga2VybmVsIGFzIHRoZSBrZXJuZWwgaXMgbWFwcGVkIGluCj4gICAgIHRoZSBsaW5lYXIgbWFw
cGluZyBhbmQgd291bGQgdGhlbiBuZWVkIHRvIGJlIGNvcGllZCBwaHlzaWNhbGx5IHRvbwo+ICAg
KiBDT05GSUdfUkVMT0NBVEFCTEUgZGVwZW5kcyBvbiAhWElQX0tFUk5FTAo+ICAgKiBSZW1vdmUg
UmV2aWV3ZWQtYnkgZnJvbSBmaXJzdCBwYXRjaCBhcyBpdCBjaGFuZ2VkIGEgYml0Cj4KPiBDaGFu
Z2VzIGluIHY1Ogo+ICAgKiBBZGQgInN0YXRpYyBfX2luaXQiIHRvIGNyZWF0ZV9rZXJuZWxfcGFn
ZV90YWJsZSBmdW5jdGlvbiBhcyByZXBvcnRlZCBieQo+ICAgICBLYnVpbGQgdGVzdCByb2JvdAo+
ICAgKiBBZGQgcmV2aWV3ZWQtYnkgZnJvbSBab25nCj4gICAqIFJlYmFzZSBvbnRvIHY1LjcKPgo+
IENoYW5nZXMgaW4gdjQ6Cj4gICAqIEZpeCBCUEYgcmVnaW9uIHRoYXQgb3ZlcmxhcHBlZCB3aXRo
IGtlcm5lbCdzIGFzIHN1Z2dlc3RlZCBieSBab25nCj4gICAqIEZpeCBlbmQgb2YgbW9kdWxlIHJl
Z2lvbiB0aGF0IGNvdWxkIGJlIGxhcmdlciB0aGFuIDJHQiBhcyBzdWdnZXN0ZWQgYnkgWm9uZwo+
ICAgKiBGaXggdGhlIHNpemUgb2YgdGhlIHZtIGFyZWEgcmVzZXJ2ZWQgZm9yIHRoZSBrZXJuZWwg
YXMgd2UgY291bGQgbG9zZQo+ICAgICBQTURfU0laRSBpZiB0aGUgc2l6ZSB3YXMgYWxyZWFkeSBh
bGlnbmVkIG9uIFBNRF9TSVpFCj4gICAqIFNwbGl0IGNvbXBpbGUgdGltZSByZWxvY2F0aW9ucyBj
aGVjayBwYXRjaCBpbnRvIDIgcGF0Y2hlcyBhcyBzdWdnZXN0ZWQgYnkgQW51cAo+ICAgKiBBcHBs
aWVkIFJldmlld2VkLWJ5IGZyb20gWm9uZyBhbmQgQW51cAo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAg
ICogTW92ZSBrZXJuZWwgbWFwcGluZyB0byB2bWFsbG9jCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAg
KiBNYWtlIFJFTE9DQVRBQkxFIGRlcGVuZCBvbiBNTVUgYXMgc3VnZ2VzdGVkIGJ5IEFudXAKPiAg
ICogUmVuYW1lIGtlcm5lbF9sb2FkX2FkZHIgaW50byBrZXJuZWxfdmlydF9hZGRyIGFzIHN1Z2dl
c3RlZCBieSBBbnVwCj4gICAqIFVzZSBfX3BhX3N5bWJvbCBpbnN0ZWFkIG9mIF9fcGEsIGFzIHN1
Z2dlc3RlZCBieSBab25nCj4gICAqIFJlYmFzZWQgb24gdG9wIG9mIHY1LjYtcmMzCj4gICAqIFRl
c3RlZCB3aXRoIHN2NDggcGF0Y2hzZXQKPiAgICogQWRkIFJldmlld2VkL1Rlc3RlZC1ieSBmcm9t
IFpvbmcgYW5kIEFudXAKPgo+IEFsZXhhbmRyZSBHaGl0aSAoMyk6Cj4gICByaXNjdjogSW50cm9k
dWNlIENPTkZJR19SRUxPQ0FUQUJMRQo+ICAgcG93ZXJwYzogTW92ZSBzY3JpcHQgdG8gY2hlY2sg
cmVsb2NhdGlvbnMgYXQgY29tcGlsZSB0aW1lIGluIHNjcmlwdHMvCj4gICByaXNjdjogQ2hlY2sg
cmVsb2NhdGlvbnMgYXQgY29tcGlsZSB0aW1lCgpJJ20gZ2V0dGluZyBpc3N1ZXMgYm9vdGluZyB2
aWEgVUVGSS9lZmktc3R1YiB3aXRoIHRoaXMsIGJlY2F1c2UgdGhlIFBFCmhlYWRlciBpcyBtZXNz
ZWQgdXAuCgpmcm9tIGFyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUzoKCiB8IC4uLgogfCBl
eHRyYV9oZWFkZXJfZmllbGRzOgogfCAgICAgICAgIC5xdWFkICAgMCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8vIEltYWdlQmFzZQogfCAgICAgICAgIC5sb25nICAgUEVD
T0ZGX1NFQ1RJT05fQUxJR05NRU5UICAgICAgICAgICAgICAgIC8vIFNlY3Rpb25BbGlnbm1lbnQK
IHwgICAgICAgICAubG9uZyAgIFBFQ09GRl9GSUxFX0FMSUdOTUVOVCAgICAgICAgICAgICAgICAg
ICAvLyBGaWxlQWxpZ25tZW50CiB8IC4uLgoKUEVDT0ZGKiBpcyB0YWtlbiBmcm9tIHRoZSBsaW5r
ZXItc2NyaXB0LCBhbmQgZW5kcyB1cCBpbiByZWxvY2F0aW9uCnNlY3Rpb24uIFdoZW4gdS1ib290
IHRyaWVkIHRvIGxvYWQgdGhlIGltYWdlLCBhbGlnbm1lbnQgaXMgemVybyBhbmQgdGhlCmxvYWRl
ciBicmVha3MuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
