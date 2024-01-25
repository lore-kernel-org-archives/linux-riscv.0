Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64409C48285
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qb5fQ5JCU3TzRgxsmEXpeg/PurO5C//8nUBXGqYDbbo=; b=GuXuQ95OezGIHM
	lBKpKwenK0rNQuvWETdHCoyeHFjlE83SV8tpfu0Lut5JUNUp8NAPkmzAQ5heHklajKybTlA1hWlhA
	NJGvtwV9zLM2PmrFT20ixEO0mBVJBsuRN74T7pmj7cX/XQsspIvTIkxU4mHCGqRORKBEkg1NrsuPi
	iPddCxdd/uEYuS6IByF4WxCFIghL9NVf+rFlBan/zehvWFS/AtlxuGs9+n3H5UtCfIV0xLypTsoaw
	KWt8+KYmjF9OmbOxgmrtucT866O4Ct92UvqEyfZrB+ILH7POS5G8WWSpji3rRoH++QDH8qblaLxOq
	Y0AGalqXrMu7zmVCy61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0cx-00000000Lxy-1SxS;
	Thu, 25 Jan 2024 14:22:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0cv-00000000Lx4-27X5
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=6CScWZENNpS1IQUjki3DtrZNUHrq1q+9GD63yP0LeS4=; b=Haoyl4NOiJNKME0d/qaYQDzsrE
	Wb/YyLNPmC9uPH0MuLzOzHWt7hz73MnHPMFe+dnUSbkCOQxoSjEMXAq2AMgwHczYQRLeXDOP4wYD1
	DfzqSUci/Y4osBPbZSKn9eLaZB/lW2nOixOmCQIQtMiw6TkZURL+ae4vegSMwWfzRrauBTpEo2xUp
	oJ7OWxqQcvdEP8gzeYv6nZmweu3xgxwxaurnJN0JIjyk8Wqv25m69vElsRsoBHLJpbGm7IOGZksmI
	qy/aQUhU5s8qRsgNdJo29g2MMvIZL69ie2G/9GHS6qxJL9Hj3ky9hoM+1FY9QZcosh4//HFdOxLQu
	A+snkccA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSzUw-00000005O9N-3CzN
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 13:10:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSzUn-0003Ro-Vu; Thu, 25 Jan 2024 14:10:18 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSzUl-002I4s-H7; Thu, 25 Jan 2024 14:10:15 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSzUl-0009Xo-1S;
	Thu, 25 Jan 2024 14:10:15 +0100
Message-ID: <8eb843fc0a3a40f1090283b3081e4c12846e82c3.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] reset: sophgo: add SG2042 reset generator driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>, 
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com,  robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com,  xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org,  inochiama@outlook.com
Date: Thu, 25 Jan 2024 14:10:15 +0100
In-Reply-To: <MA0P287MB28226D07A5DC0200132358C4FE7A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <cover.1706161530.git.unicorn_wang@outlook.com>
	 <34650036ea5f1c500da54c67c3a67b91c4419399.1706161530.git.unicorn_wang@outlook.com>
	 <bf30a97b4c39e5c606583783058ea12520c1146b.camel@pengutronix.de>
	 <MA0P287MB28226D07A5DC0200132358C4FE7A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_131026_919277_91D1B1A9 
X-CRM114-Status: GOOD (  21.60  )
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

T24gRG8sIDIwMjQtMDEtMjUgYXQgMjA6MDcgKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPiBPbiAy
MDI0LzEvMjUgMTg6NDMsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gPiBPbiBEbywgMjAyNC0wMS0y
NSBhdCAxNDoxMSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+ID4gPiBGcm9tOiBDaGVuIFdhbmcg
PHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiA+ID4gCj4gPiA+IFJldXNlIHJlc2V0LXNpbXBs
ZSBkcml2ZXIgZm9yIHRoZSBTb3BoZ28gU0cyMDQyIHJlc2V0IGdlbmVyYXRvci4KPiA+IFN1Ympl
Y3QgcHJlZml4IHNob3VsZCBiZSAicmVzZXQ6IHNpbXBsZTogIgo+IE9rLgo+ID4gCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+ID4gPiAt
LS0KPiA+ID4gICBkcml2ZXJzL3Jlc2V0L0tjb25maWcgICAgICAgIHwgIDEgKwo+ID4gPiAgIGRy
aXZlcnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMgfCAgMiArKwo+ID4gPiAgIGRyaXZlcnMvcmVzZXQv
c29waGdvL0tjb25maWcgfCAxMCArKysrKysrKysrCj4gPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCj4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVzZXQv
c29waGdvL0tjb25maWcKPiA+ID4gCj4gPiBbLi4uXQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZXNldC9zb3BoZ28vS2NvbmZpZyBiL2RyaXZlcnMvcmVzZXQvc29waGdvL0tjb25maWcKPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45YWQ5NmU0
OWUxZGQKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3NvcGhn
by9LY29uZmlnCj4gPiA+IEBAIC0wLDAgKzEsMTAgQEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gPiArCj4gPiA+ICtjb25maWcgUkVTRVRfU09QSEdP
X1NHMjA0Mgo+ID4gPiArCWJvb2wgIlNvcGhnbyBTRzIwNDIgUmVzZXQgRHJpdmVyIgo+ID4gPiAr
CWRlcGVuZHMgb24gQVJDSF9TT1BIR08gfHwgQ09NUElMRV9URVNUCj4gPiA+ICsJc2VsZWN0IFJF
U0VUX1NJTVBMRQo+ID4gPiArCWRlZmF1bHQgQVJDSF9TT1BIR08KPiA+ID4gKwloZWxwCj4gPiA+
ICsJICBUaGlzIGVuYWJsZXMgdGhlIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0aGUgU29w
aGdvIFNHMjA0MiBTb0MuCj4gPiA+ICsKPiA+IERyb3AgdGhlIEtjb25maWcsIGp1c3QgYWRkIGEg
ZGVmYXVsdCB5IGlmIEFSQ0hfU09QSEdPIHRvIFJFU0VUX1NJTVBMRS4KPiAKPiBoae+8jFBoaWxp
cHAsCj4gCj4gVGhlIHB1cnBvc2Ugb2YgbXkgYWRkaW5nIEtjb25maWcgaXMgdG8gY29uc2lkZXIg
dGhhdCBvdGhlciBzb2NzIHVuZGVyIAo+IHNvcGhnbyBtYXkgbm90IHVzZSBSRVNFVF9TSU1QTEUu
IEknbSB3b3JyaWVkIHRoYXQgdGhlIGNvdmVyYWdlIGlzIHRvbyAKPiBsYXJnZSB3aGVuIGRlZmF1
bHQgeSBpZiBBUkNIX1NPUEhHTz8gV2hhdCBkbyB5b3UgdGhpbms/CgpJZiBBUkNIX1NPUEhHTyBj
b3ZlcmFnZSBpcyBjb25zaWRlcmVkIHRvbyB3aWRlLCBpdCdzIG5vdCBjb3JyZWN0IHRvCm1ha2Ug
UkVTRVRfU09QSEdPX1NHMjAyNCAiZGVmYXVsdCBBUkNIX1NPUEhHTyIgZWl0aGVyLCBzbyB0aGVy
ZSdzIG5vCnNpZ25pZmljYW50IGRpZmZlcmVuY2UuCgpUaGUgcXVlc3Rpb24gaXMgd2hldGhlciB5
b3UgbmVlZCBpdCBhdCBhbGwuIENhbiBTRzIwNDIgYm9vdCwgcG9zc2libHkKd2l0aCByZWR1Y2Vk
IGZ1bmN0aW9uYWxpdHksIGludG8gYSB1c2VmdWwgc3lzdGVtIHdpdGhvdXQgdGhlIHJlc2V0CmNv
bnRyb2xsZXI/IElmIHNvLCBtYXliZSBpdCBpcyBlbm91Z2ggdG8gcmVseSBvbiBhIGRlZmNvbmZp
ZyB0byBlbmFibGUKUkVTRVRfU0lNUExFPyBPdGhlcndpc2UsIHJlc2V0LXNpbXBsZSBjb3VsZCBi
ZSBjb25zaWRlcmVkIHNtYWxsIGVub3VnaAp0byBhY2NlcHQgY2FycnlpbmcgaXQgYXJvdW5kIGZv
ciBub24tU0cyMDQyIFNvQ3MgYnkgZGVmYXVsdCwgaXQgY2FuIGJlCmRpc2FibGVkIG1hbnVhbGx5
LCBhZnRlciBhbGwuCgpyZWdhcmRzClBoaWxpcHAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
