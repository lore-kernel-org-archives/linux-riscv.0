Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40BCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EMy0eVBP2o4BEi+LOAyLPGhfbF9cZvNdbR76BYt27o=; b=tN9+u3sLBRTfD/
	VE4DRztwQSX4Oi+SROeOGl61cit3FgQ05gar1uWGrh+NxXXqn7vJXI0Ockko/KJHniYiQw7An+hH5
	KurHX2rjA04y3Oljh2SatN1J0fcNOs3Wxexz94Je80lk1vkokao3Hlim29mnTFcvIrLKuV5QVUFDJ
	Xzmlwl5EkgL8eTpXUsJH6FHLN86d9GrlKCVcRjQ5gtrZs2lt5L5WcK8p/XBmFMYQX7FtwOuYIfQyA
	LXKEDU4Eat9cPY10qRUfxHMFZnd53LT+cISGSqsXve4HIgpZa1Pyg8xmM/JtEgfENbs7TLwdSPEsR
	Lw1ubbDG8vyG8N4qwkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhtI-0000000FqQy-3NyQ;
	Tue, 28 Oct 2025 11:29:28 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhtG-0000000FqQM-1Aeq
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 11:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761650958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OPE5nDWfuugw1kKa6IcPSetaU8VLCXsoaM0Nn5DkvqFPMPAtCpyRR74CKCvp8fgDrbw03ZqetOY2b58Bha7NWrdpabp+hq08LOC1lmHwhRSWOS6wlcrFbnJds11Xf4yLCMa7oe+aRw2gC1FZtUsCVunrhmyG6A3MWg321jayJrk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761650958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=htCIUeie1Fllw0gMKXGW6GDJsuGaHCRZYsDOba4fJdw=; 
	b=leSEemltU/maU1r+O9yiGVP2P+FEnVzaaExpVFmnPiimQwOvEUCH4NyS4TKf04DShFVxd3dXUgZLI7YlDzBBSUwJs0eAFMYZZR5znF/caGAnK3TWtzJVzi/FYnFDsgw6XXpTnTPcNwqryZqsg/7AnUp9w8Xd25liHtm9HHUeEPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761650958;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=htCIUeie1Fllw0gMKXGW6GDJsuGaHCRZYsDOba4fJdw=;
	b=njF1zKZ/WbjS+4NeXpMU3JLnnb5YjV33OKRR0aHXNhR7Jcwqy0kdZzM/JEXoeWlU
	ZXYj5TwdKFdb/ALbBzm3sGGOLbFJDdp6qQsqwvO3yuoa7Mbt1j6PoZgPYh1hF31oXew
	mEHjaI416JMXgTPtRsi4dT4ijkPqBbzoflyteJ64=
Received: by mx.zohomail.com with SMTPS id 1761650955763658.116487530986;
	Tue, 28 Oct 2025 04:29:15 -0700 (PDT)
Message-ID: <e66945e7-9be0-4208-8b60-ec534db4fde5@pigmoral.tech>
Date: Tue, 28 Oct 2025 19:29:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
 <20251026-dr1v90-cru-v2-4-43b67acd6ddd@pigmoral.tech>
 <36d28431c41ec9ed86487135d81e50b136ee0fae.camel@pengutronix.de>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <36d28431c41ec9ed86487135d81e50b136ee0fae.camel@pengutronix.de>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_042926_710707_B6221EB2 
X-CRM114-Status: GOOD (  16.33  )
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

SGnCoFBoaWxpcHAsClRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiAxMC8yOC8yNSA0OjE3IFBN
LCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IE9uIFNvLCAyMDI1LTEwLTI2IGF0IDIyOjAwICswODAw
LCBKdW5odWkgTGl1IHdyb3RlOgo+PiBBZGQgcmVzZXQgY29udHJvbGxlciBzdXBwb3J0IGZvciB0
aGUgQW5sb2dpYyBEUjFWOTAgU29DLCB3aGljaCBpcyBhbgo+PiBhdXhpbGlhcnkgZGV2aWNlIGFz
c29jaWF0ZWQgd2l0aCB0aGUgQ2xvY2sgYW5kIFJlc2V0IFVuaXQgKENSVSkuIEFsbAo+PiByZXNl
dHMgYXJlIGFjdGl2ZS1sb3cuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bmh1aSBMaXUgPGp1bmh1
aS5saXVAcGlnbW9yYWwudGVjaD4KPj4gLS0tCj4+ICAgZHJpdmVycy9yZXNldC9LY29uZmlnICAg
ICAgICB8ICAgOSArKysKPj4gICBkcml2ZXJzL3Jlc2V0L01ha2VmaWxlICAgICAgIHwgICAxICsK
Pj4gICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LWRyMXY5MC5jIHwgMTM1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNl
cnRpb25zKCspCj4+Cj4gWy4uLl0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQt
ZHIxdjkwLmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LWRyMXY5MC5jCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LmViOTA2NGUzYWI0NTRmYjM5YWRjMWFkNDI2ZjQ1OGUzOWJiNjE2OWUKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LWRyMXY5MC5jCj4+IEBAIC0wLDAgKzEsMTM1
IEBACj4gWy4uLl0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHIxdjkwX3Jlc2V0X21hcCBkcjF2
OTBfcmVzZXRzW10gPSB7Cj4+ICsJW1JFU0VUX09DTV0JCT0geyAweDc0LCBCSVQoNCl9LAo+IFsu
Li5dCj4+ICsJW1JFU0VUX05JQ19IUDBdCQk9IHsgMHg3OCwgQklUKDApfSwKPiBbLi4uXQo+PiAr
CVtSRVNFVF9VU0IwXQkJPSB7IDB4N0MsIEJJVCgwKX0sCj4gVGhlIHJlZ2lzdGVycyAweDc0LCAw
eDc4LCBhbmQgMHg3QyBhcmUgZXhjbHVzaXZlbHkgdXNlZCBmb3IgcmVzZXRzPwoKWWVzLCB0aGVz
ZSB0aHJlZSByZWdpc3RlcnMgb25seSBjb250YWluIGJpdHMgZm9yIHJlc2V0cyBhY2NvcmRpbmcg
dG8gdGhlCnJlZ2lzdGVyIGxpc3QgZG9jLgoKPgo+IFsuLi5dCj4+ICt9Owo+PiArCj4+ICtzdGF0
aWMgaW50IGRyMXY5MF9yZXNldF9jb250cm9sX3VwZGF0ZShzdHJ1Y3QgcmVzZXRfY29udHJvbGxl
cl9kZXYgKnJjZGV2LAo+PiArCQkJCSAgICAgICB1bnNpZ25lZCBsb25nIGlkLCBib29sIGFzc2Vy
dCkKPj4gK3sKPj4gKwlzdHJ1Y3QgZHIxdjkwX3Jlc2V0X2NvbnRyb2xsZXIgKnJzdGMgPSB0b19k
cjF2OTBfcmVzZXRfY29udHJvbGxlcihyY2Rldik7Cj4+ICsJdTMyIG9mZnNldCA9IGRyMXY5MF9y
ZXNldHNbaWRdLm9mZnNldDsKPj4gKwl1MzIgYml0ID0gZHIxdjkwX3Jlc2V0c1tpZF0uYml0Owo+
PiArCXUzMiByZWc7Cj4+ICsKPj4gKwlyZWcgPSByZWFkbChyc3RjLT5iYXNlICsgb2Zmc2V0KTsK
Pj4gKwlpZiAoYXNzZXJ0KQo+PiArCQlyZWcgJj0gfmJpdDsKPj4gKwllbHNlCj4+ICsJCXJlZyB8
PSBiaXQ7Cj4+ICsJd3JpdGVsKHJlZywgcnN0Yy0+YmFzZSArIG9mZnNldCk7Cj4gVGhlcmUgc2hv
dWxkIGJlIGEgbG9jayBhcm91bmQgdGhpcyByZWFkLW1vZGlmeS13cml0ZSBhY2Nlc3MuCgpPa2F5
LCBJIHdpbGwgYWRkIGEgbG9jayBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+IHJlZ2FyZHMKPiBQ
aGlsaXBwCgotLSAKQmVzdCByZWdhcmRzLApKdW5odWkgTGl1CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
