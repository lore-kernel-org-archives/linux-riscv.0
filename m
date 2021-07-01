Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2476DC11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF2C261410
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF2C261410
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Gpsc2ncvldrFhBm17mzJ8KyGtzSWBncRZAFwuf3CI=; b=a3rhcPBRfNvOzrteKqhLXp40qg
	d1R3XWR7Wogeo+bZ34hFBKsz9as+A6DpNqYUGiquJjSBoJxCH0wuzU8Ml5yi0NWfVIt4eB3OMctVW
	+tb+saVQSrYva0JZonIlvrC0TLt2bNfaMlvcyw+TdiEQ+cL067l1onvSyZd0ZIc4vlBdvkn5lFlpl
	5G0iwNRmza66IC/s2y6YuxwgtlXyyk+fogo9zFJKOJIm5aTwiazXJKPX16fa4sqJVjvcm6o81fU2U
	ptiLo/hCgO94IYFuqtc71xz0SZHOohZPfmSaScx0aW9r1mj6r2/3ZaPqUVV8GB8gCOGf/ncG/JW6W
	IIKPC3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz1wX-000pSQ-Px; Thu, 01 Jul 2021 19:01:45 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz1w5-000pQg-UH
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 19:01:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B2072200005;
 Thu,  1 Jul 2021 19:01:10 +0000 (UTC)
Subject: Re: [PATCH 1/3] riscv: Fix memory_limit for 64-bit kernel
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210629091349.3802690-1-alex@ghiti.fr>
 <6a38fb9a-d658-836b-4ff4-7c47cadb7db0@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8e1bef59-8a65-dfdf-d09d-f578323348be@ghiti.fr>
Date: Thu, 1 Jul 2021 21:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6a38fb9a-d658-836b-4ff4-7c47cadb7db0@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_120118_159808_5FB34DA7 
X-CRM114-Status: GOOD (  20.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMS8wNy8yMDIxIMOgIDEyOjQ0LCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+IAo+IE9uIDIw
MjEvNi8yOSAxNzoxMywgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBBcyBkZXNjcmliZWQgaW4g
RG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0LCB0aGUgZW5kIG9mIHRoZQo+PiB2aXJ0
dWFsIGFkZHJlc3Mgc3BhY2UgZm9yIDY0LWJpdCBrZXJuZWwgaXMgb2NjdXBpZWQgYnkgdGhlIG1v
ZHVsZXMvQlBGLwo+PiBrZXJuZWwgbWFwcGluZ3Mgc28gdGhpcyBhY3R1YWxseSByZWR1Y2VzIHRo
ZSBhbW91bnQgb2YgbWVtb3J5IHdlIGFyZSBhYmxlCj4+IHRvIG1hcCBhbmQgdGhlbiB1c2UgaW4g
dGhlIGxpbmVhciBtYXBwaW5nLiBTbyBtYWtlIHN1cmUgdGhpcyBsaW1pdCBpcwo+PiBjb3JyZWN0
bHkgc2V0Lgo+Pgo+PiBGaXhlczogYzk4MTFlMzc5YjIxICgicmlzY3Y6IEFkZCBtZW0ga2VybmVs
IHBhcmFtZXRlciBzdXBwb3J0IikKPiAKPiAKPiBTaG91bGQgdGhlIEZpeGVzIHRhZyBiZSBkZTA0
M2RhMGI5ZTcg77yI4oCcUklTQy1WOiBGaXggdXNhZ2Ugb2YgCj4gbWVtYmxvY2tfZW5mb3JjZV9t
ZW1vcnlfbGltaXTigJzvvIksCj4gCj4gVGhlIC1QQUdFX09GRlNFVCBpcyBzZXQgdG8gdGhlIG1h
eGltYWwgcGh5c2ljYWwgbWVtb3J5IGZyb20gdGhpcyBwb2ludCA6KQoKT29wcywgdGhhbmsgeW91
IQoKQWxleAoKPiAKPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRp
LmZyPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAxMSArKysrKysrKystLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQu
Ywo+PiBpbmRleCAxMmY5NTZiM2E2NzQuLjA0YTVkYjNhOTc4OCAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gQEAgLTEy
NCwxMCArMTI0LDE3IEBAIHZvaWQgX19pbml0IG1lbV9pbml0KHZvaWQpCj4+IMKgIH0KPj4gwqAg
LyoKPj4gLSAqIFRoZSBkZWZhdWx0IG1heGltYWwgcGh5c2ljYWwgbWVtb3J5IHNpemUgaXMgLVBB
R0VfT0ZGU0VULAo+PiAtICogbGltaXQgdGhlIG1lbW9yeSBzaXplIHZpYSBtZW0uCj4+ICsgKiBU
aGUgZGVmYXVsdCBtYXhpbWFsIHBoeXNpY2FsIG1lbW9yeSBzaXplIGlzIC1QQUdFX09GRlNFVCBm
b3IgCj4+IDMyLWJpdCBrZXJuZWwsCj4+ICsgKiB3aGVyZWFzIGZvciA2NC1iaXQga2VybmVsLCB0
aGUgZW5kIG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgaXMgCj4+IG9jY3VwaWVkCj4+ICsg
KiBieSB0aGUgbW9kdWxlcy9CUEYva2VybmVsIG1hcHBpbmdzIHdoaWNoIHJlZHVjZXMgdGhlIGF2
YWlsYWJsZSAKPj4gc2l6ZSBvZiB0aGUKPj4gKyAqIGxpbmVhciBtYXBwaW5nLgo+PiArICogTGlt
aXQgdGhlIG1lbW9yeSBzaXplIHZpYSBtZW0uCj4+IMKgwqAgKi8KPj4gKyNpZmRlZiBDT05GSUdf
NjRCSVQKPj4gK3N0YXRpYyBwaHlzX2FkZHJfdCBtZW1vcnlfbGltaXQgPSAtUEFHRV9PRkZTRVQg
LSBTWl80RzsKPj4gKyNlbHNlCj4+IMKgIHN0YXRpYyBwaHlzX2FkZHJfdCBtZW1vcnlfbGltaXQg
PSAtUEFHRV9PRkZTRVQ7Cj4+ICsjZW5kaWYKPj4gwqAgc3RhdGljIGludCBfX2luaXQgZWFybHlf
bWVtKGNoYXIgKnApCj4+IMKgIHsKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
