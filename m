Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF945C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDkR8EFxQAXAWTdqea8t0NuQWLFLXIFAIuo4Mgn3408=; b=A0wZptj14ewueFIa1+t5r5qOtL
	a1Yw4l8wL+xgyilSNn5lQfSWUplJdIG7Z/khMfetDFcQjAaswVGuXYVdJxAFK5jrTJzXG2PGBfux9
	uH4foansXewxKcvdImvcXVlrYqaKBs1F7UTHP57vSnTJP/bdf/i9Dx0Bg3sQfOAiJ4X21//uN/HMn
	eeqRmSKNeKlPnTSmksznJqy4b2NJpaz7tRb3LD6isDoXu41bR8ipWCvr5sk7chwbUsAngbQR6H57H
	mhMi0sAx6wz6PU/gGk0yDEz5X21LvICuzmNAkKQb3KBsD/FhTNeaGQodpdbe0qKG1LGFxt15x0/mB
	LrKXnCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5tc9-004mpz-T4; Fri, 07 Jan 2022 18:05:21 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5tbC-004mR7-O2
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 18:04:27 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 207I4Aom063114
 for <linux-riscv@lists.infradead.org>; Fri, 7 Jan 2022 20:04:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1641578645; x=1644170645;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s5cE7HP13OGL6tOvFCkENHSYqRvjKRhAnn9y2DfklEY=;
 b=Mp+IGz0UgN4HJYPOjgg+7qeQlNA4QDeHhRQoBpfVqFazG5PR9WJnNCeaRcTiWr3a
 1t1JnTZ9zO4/i4CN1oa3KP2GBUeBGnNKjLpwDKoNzR80fp+ab12YXXaGEN+x5Naj
 Jzp4ltQUFw7F4jw67r4Rc3rcJ9dhUQGk+fjYgfDy/ophM1p2+zx1fiOHyZ1wXRBL
 LTZPjtM61sN9rSGmi120RKImF+IvzXAhehY3WUhuV/84/JthaQlbmSxybXvGSUYL
 51jtxJUp8tm+oybQCq+GwKpwJWNXFT4D288s13sYZxJd9jqluXBE3kui7iCQ23tP
 TDxotv07U3eKDgnLpV0htQ==;
X-AuditID: 8b5b014d-9a2477000000460a-c1-61d880957c58
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 8F.71.17930.59088D16; Fri,  7 Jan 2022 20:04:05 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 07 Jan 2022 20:03:59 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre
 Ghiti <alex@ghiti.fr>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: Don't use va_pa_offset on kdump
Organization: FORTH
In-Reply-To: <20211126180411.187597-1-mick@ics.forth.gr>
References: <20211126180411.187597-1-mick@ics.forth.gr>
Message-ID: <70fe8aa8bfe3923308e6248377577f58@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsXSHT1dWXdqw41Eg2NTuC2e3fnKarH19yx2
 i8u75rBZbPvcwmbR/O4cu8XLyz3MFm2z+C0WbHzE6MDh8eblSxaPwx1f2D3unZjG6vFw0yUm
 j81L6j0uNV9n9/i8SS6APYrLJiU1J7MstUjfLoEr49ehPWwF87grrjedY29gbOHsYuTkkBAw
 kbg/Zx5bFyMXh5DAUUaJAw+3MEEkTCVm7+1kBLF5BQQlTs58wgJiMwtYSEy9sp8RwpaXaN46
 mxnEZhFQlZh9oxGsl01AU2L+pYNg9SIC6hKdz98wgixgFrjMKPFu4WqwBmEBe4nO9/vBbH4B
 YYlPdy+ydjFycHACLdjxOxIkLCRgLvF+00pWiBtcJJ7e7WGFuE1F4sPvB+wg5aJA9ua5ShMY
 BWchuXQWkktnIbl0ASPzKkaBxDJjvczkYr20/KKSDL30ok2M4Fhg9N3BeHvzW71DjEwcjIcY
 JTiYlUR4p+69lijEm5JYWZValB9fVJqTWnyIUZqDRUmcl1dvQryQQHpiSWp2ampBahFMlomD
 U6qBae99g7p1KWatCf+sQjh2H7+i/eYBl92ODdOOnG74Lr/487rZFamqpy7ubOCadPOIwqIf
 U5OTg4yfirT+YXq9+jFvpqFF/cRv1+32T2Dfm3JAmbHuyn6Bu9wmNsqHBWe2h7O1XBWJWVGx
 76QJ87KNihfyj0w0zTwZx79jl2m2vbex4M+ZFmw8sx7+rfQ6sOJz+mffb9O8PHP53XefDp9o
 tmx5kVKPRMO/KoYL0yp+Rd0/9b4zx3vPbI7v/w5mLnyXZxOySONs6Mrym7u2adqE8X+8y2r2
 LZQl8tzjS+XrtptKLBc1mCh0++e3FXO+xgctyZB/nXTKYb33HpdJLG1Rt2Yy+B9qY+Qsdnl/
 ZLoIU4gSS3FGoqEWc1FxIgDELZZR9AIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_100423_200115_96250723 
X-CRM114-Status: GOOD (  14.65  )
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

SGVsbG8gUGFsbWVyLAoKQW55IHVwZGF0ZXMgb24gdGhvc2UgMyBwYXRjaGVzID8KClJlZ2FyZHMs
Ck5pY2sKCs6jz4TOuc+CIDIwMjEtMTEtMjYgMjA6MDQsIE5pY2sgS29zc2lmaWRpcyDOrc6zz4HO
sc+IzrU6Cj4gT24ga2R1bXAgaW5zdGVhZCBvZiB1c2luZyBhbiBpbnRlcm1lZGlhdGUgc3RlcCB0
byByZWxvY2F0ZSB0aGUga2VybmVsLAo+IHRoYXQgbGl2ZXMgaW4gYSAiY29udHJvbCBidWZmZXIi
IG91dHNpZGUgdGhlIGN1cnJlbnQga2VybmVsJ3MgbWFwcGluZywKPiB3ZSBqdW1wIHRvIHRoZSBj
cmFzaCBrZXJuZWwgZGlyZWN0bHkgYnkgY2FsbGluZyAKPiByaXNjdl9rZXhlY19ub3JlbG9jYXRl
KCkuCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdXNlcyB2YV9wYV9vZmZzZXQgd2hpbGUg
c3dpdGNoaW5nIHRvIAo+IHBoeXNpY2FsCj4gYWRkcmVzc2luZywgaG93ZXZlciBzaW5jZSB3ZSBt
b3ZlZCB0aGUga2VybmVsIG91dHNpZGUgdGhlIGxpbmVhciAKPiBtYXBwaW5nCj4gdGhpcyB3b24n
dCB3b3JrIGFueW1vcmUgc2luY2UgcmlzY3Zfa2V4ZWNfbm9yZWxvY2F0ZSgpIGlzIHBhcnQgb2Yg
dGhlCj4ga2VybmVsIG1hcHBpbmcgYW5kIHdlIHNob3VsZCB1c2Uga2VybmVsX21hcC52YV9rZXJu
ZWxfcGFfb2Zmc2V0LCBhbmQgCj4gYWxzbwo+IHRha2UgWElQIGtlcm5lbCBpbnRvIGFjY291bnQu
Cj4gCj4gV2UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8gdXNlIHZhX3BhX29mZnNldCBvbiByaXNjdl9r
ZXhlY19ub3JlbG9jYXRlLCB3ZQo+IGNhbiBqdXN0IHNldCBTVFZFQyB0byB0aGUgcGh5c2ljYWwg
YWRkcmVzcyBvZiB0aGUgbmV3IGtlcm5lbCBpbnN0ZWFkIAo+IGFuZAo+IGxldCB0aGUgaGFydCBq
dW1wIHRvIHRoZSBuZXcga2VybmVsIG9uIHRoZSBuZXh0IGluc3RydWN0aW9uIGFmdGVyIAo+IHNl
dHRpbmcKPiBTQVRQIHRvIHplcm8uIFRoaXMgZml4ZXMga2R1bXAgYW5kIGlzIGFsc28gc2ltcGxl
ci9jbGVhbmVyLgo+IAo+IEkgdGVzdGVkIHRoaXMgb24gdGhlIGxhdGVzdCBxZW11IGFuZCBIaUZp
dmUgVW5tYXRjaGVkIGFuZCB3b3JrcyBhcwo+IGV4cGVjdGVkLgo+IAo+IHYyOiBJIHJlbW92ZWQg
dGhlIGRpcmVjdCBqdW1wIGFmdGVyIHNldHRpbmcgc2F0cCBhcyBzdWdnZXN0ZWQuCj4gCj4gRml4
ZXM6IDJiZmM2Y2Q4MWJkMSAoInJpc2N2OiBNb3ZlIGtlcm5lbCBtYXBwaW5nIG91dHNpZGUgb2Yg
bGluZWFyIAo+IG1hcHBpbmciKQo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgS29zc2lmaWRpcyA8
bWlja0BpY3MuZm9ydGguZ3I+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS4xMwo+IENjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjE0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
