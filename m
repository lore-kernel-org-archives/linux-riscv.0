Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FFAC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knitTtI4vpEQJT72TC9aymkLaXn28iY6xP/Iu0hfiLQ=; b=NCdQRNsBTFw7QT
	b4/EKKCu+Sl52iaOuemk6vurWWYWzNhsUsV7zqRWjWuVijX+83JohUCrMGvLFXC8OkT/yzbL5xyFs
	JBcJU0ivvDUFiVzznVD+A75aMpT6u+BiChZMN5hhC2gXiPMNfEWALOL7blchjp0ofPsBCFsudoK4s
	zZ/TEyzCv5hjNDQ55Ndebq5EJi8XY9cfMOMDrOh6YGmDAtgib+JDZZuVWOK3jI1pQnAqH/PNLWQEO
	6DMmvrh7+TQmS3yRD0aqyhhcwT7NR0rR6rVUc7xcuTpNOlo+SQAhee6cVYsS0bHolZhDyWN30ltys
	yTY3Fjixse5rNT4/R+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiHbB-00FvNG-0U;
	Mon, 18 Sep 2023 16:59:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiHb7-00FvMH-1E
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 16:59:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94CF520004;
	Mon, 18 Sep 2023 16:59:38 +0000 (UTC)
Message-ID: <419c17bb-9d5e-dedf-01bf-8db9db405a39@ghiti.fr>
Date: Mon, 18 Sep 2023 18:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: more RELOCATABLE + errata code model issues
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org
References: <mhng-ffed6e42-d66a-47c8-b652-cd5d9fced9ab@palmer-ri-x1c9>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-ffed6e42-d66a-47c8-b652-cd5d9fced9ab@palmer-ri-x1c9>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_095945_574687_939C580B 
X-CRM114-Status: GOOD (  23.48  )
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

Ck9uIDE4LzA5LzIwMjMgMTc6MTUsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIE1vbiwgMTgg
U2VwIDIwMjMgMDM6MzY6MDMgUERUICgtMDcwMCksIENvbm9yIERvb2xleSB3cm90ZToKPj4KPj4g
SGV5IEFsZXgsCj4+Cj4+IExLUCByZXBvcnRlZCBbMV0gc29tZSBpc3N1ZXMgd2l0aCByZWxvY2F0
YWJsZSBrZXJuZWxzICYgY29kZSBtb2RlbHMuCj4+IFlvdSBkaWRuJ3QgdG91Y2ggdGhlIGNvbW1p
dCB0aGF0IGNhdXNlZCB0aGUgaXNzdWVzLCBzbyB5b3UgZGlkbid0IHNlZQo+PiB0aGUgZmFpbHVy
ZSByZXBvcnQgSSBndWVzcywgYnV0IFByYWJoYWthciBpcyBsb29raW5nIGZvciBzb21lIGd1aWRh
bmNlCj4+IG9uIHdoYXQgaGUgc2hvdWxkIGRvIHRvIHJlc29sdmUgdGhlIHByb2JsZW1zLiBDb3B5
LXBhc3RpbmcgZnJvbSBoaXMKPj4gbWFpbDoKPj4+ID4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJl
Zml4ZWQgYnkgPj4pOgo+Pj4gPiA+ID4+IGxkLmxsZDogZXJyb3I6IHJlbG9jYXRpb24gUl9SSVND
Vl9MTzEyX0kgY2Fubm90IGJlIHVzZWQgYWdhaW5zdAo+Pj4gPiA+PiBzeW1ib2wgJ3Jpc2N2X2Ni
b21fYmxvY2tfc2l6ZSc7IHJlY29tcGlsZSB3aXRoIC1mUElDCj4+PiA+wqDCoMKgID4+PiBkZWZp
bmVkIGluIHZtbGludXguYShhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2gubykKPj4+ID7CoMKgwqAg
Pj4+IHJlZmVyZW5jZWQgYnkgZXJyYXRhLmMKPj4+ID7CoMKgwqAgPj4+IGFyY2gvcmlzY3YvZXJy
YXRhL2FuZGVzL2VycmF0YS5vOihhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYykgCj4+PiBpbiBhcmNo
aXZlIHZtbGludXguYQo+Pj4gPiBJIGRpZCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBsb2NhbGx5LiBU
aGUgYW5kZXMgZXJyYXRhIGlzIG5vdCAKPj4+IGNvbXBpbGVkIGFzIG1lZGFueS4gVGhlIGNvbmZp
ZyBpcyBSRUxPQ0FUQUJMRSArIE1FRExPVy4gSSBjYW4gc2VlIAo+Pj4gdGhlIGNhY2hlZmx1c2gu
byBpcyBjb21waWxlZCB3aXRoIG1lZGFueSBmbGFnLgo+Pj4gSSBjYW4gZml4IHRoZSBidWlsZCBi
eSBhZGRpbmcgYSBtZWRhbnkgZmxhZyBhcyBiZWxvdzoKPj4+ICsjaWZkZWYgQ09ORklHX1JJU0NW
X0FMVEVSTkFUSVZFX0VBUkxZCj4+PiArQ0ZMQUdTX2VycmF0YS5vIDo9IC1tY21vZGVsPW1lZGFu
eQo+Pj4gI2VuZGlmCj4+Pgo+Pj4gQnV0IEkgYW0gbm90IHN1cmUgaWYgdGhpcyBpcyBjb3JyZWN0
IGFwcHJvYWNoLiBBbnkgcG9pbnRlcnMgb24gdGhpcz8KPj4KPj4gVGhlIFQtSGVhZCBlcnJhdGEg
aGF2ZSBzb21ldGhpbmcgc2ltaWxhciwgc28gc2VlbXMgbGlrZSBmYWlyIGdhbWUgdG8gbWUuCj4+
IEFueSB0aG91Z2h0cz8KPgo+IFdlJ3JlIHVzaW5nIG1lZGFueSBhcyBhIGNoZWFwIHdheSB0byBn
ZXQgUElDLCBzbyBhbnl0aGluZyB0aGF0J3MgCj4gcHJlLXJlbG9jYXRpb24gd2lsbCBuZWVkIG1l
ZGFueS7CoCBXZSBkb24ndCByZWFsbHkgaGF2ZSBhIGdvb2Qgd2F5IHRvIAo+IGNoZWNrIHRoYXQs
IG1lZGFueSBpc24ndCBzdXBwb3NlZCB0byBiZSBBQkkgKHdlJ3JlIHJlYWxseSBqdXN0IGFidXNp
bmcgCj4gaXQgaGVyZSBmb3IgUElDKS7CoCBUaHVzIG5vbmUgb2YgdGhpcyBnZXRzIGNoZWNrZWQg
YXQgYnVpbGQgdGltZSwgYW5kIEkgCj4gd29uJ3QgY2F0Y2ggYW55IGVycmF0YSBwcmUtbWVyZ2Ug
YmVjYXVzZSBJJ20gaW4gUUVNVS4gU28gdGhpcyBpcyBhbGwgCj4ga2luZCBvZiBmcmFnaWxlLgo+
Cj4gU28gbWF5YmUgdGhlcmUncyBhIGJldHRlciB3YXkgdG8gZG8gYWxsIHRoYXQsIGJ1dCBmb3Ig
bm93IGp1c3QgYWRkaW5nIAo+IG1lZGFueSBzZWVtcyBsaWtlIHRoZSB3YXkgdG8gZ28uCgoKVGhl
cmUgaXMgdGhlIHByZS1tbXUgZG9jdW1lbnRhdGlvbiBub3cgdGhhdCBnaXZlcyBoaW50IGFib3V0
IHdoYXQgdG8gZG8gCmZvciB0aGUgdmVyeSBlYXJseSBjb2RlOiAKaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNi1yYzIvc291cmNlL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5y
c3QjTDE1MSAKYnV0IGFkbWl0dGVkbHksIGl0IGRvZXMgbm90IHN0YXRlIHRoYXQgaXQgd291bGQg
cmVzdWx0IGluIGNvbXBpbGF0aW9uIAplcnJvcnMsIG1heWJlIHRoYXQgY2FuIGJlIGFkZGVkLgoK
Cj4KPj4gVGhhbmtzLAo+PiBDb25vci4KPj4KPj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwOTExMTMxMS44dGNxM0tWYy1sa3BAaW50ZWwuY29tLwo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
