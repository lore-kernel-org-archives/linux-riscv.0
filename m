Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABC1C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IMgaw21n+tVidf/4D2r8SA0mzM3KWxsFDBCGKBcNgw=; b=Iz8FQDedhmxBVV
	C4MwZagfouuX2f/QQ1H4b03SmkoQ3geqfP48M5UecQSnBRWA9jUBxEK0V0oTNZAyXQg15+FDM8OZT
	WbtBZVX9F8OvyOlbtMCNaWqMNwtFm+lby5qhKRYt1C9UgYNK9C3ikKM0+E5sR1pDR0fxe4FyY7W59
	74xDnISdK5jOd+GFPGpBnG70j8BNaBXygtDC5Me8F41YU7vw5eXxKm1O+WuG8SxUY6oXeGqeRJ6JN
	I7FHU512ll7J2iW/1q643tX7/deaxCOrshYWZWXq+6ChHSjeVZ30ROvwt3Ugh/gJMlK1sV7jVv/Q/
	f7YUr55wWSX35erGyoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdKg-004U8h-Ra; Wed, 13 Jul 2022 14:27:18 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdKa-004Tty-Bp
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 14:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1657722405; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kfIUHjNNLNr9b6T26+2lWcHoWkCElMipxn5vWoQ27EmZ+QWc4G3CJ54a6/B44J8nO2BSIPjGuz8rnNCKEyFspFjxYozPIM3aiveCtOlNBmZgFtL+WW0tmDPpq4c4lJOuq+IcNX4REw0L07KZWETnJGjzzKIRtiLWRRUciSIFCNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657722405; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6EfsuV0oyUK6JOK/M9DBD2m9qiNT/2Qog8cyd8NWFl0=; 
	b=cqvUv4wV4tgODBVtwlAZtbBr8citdYVdzJpIMyfRmpfuRKKsbtBjl5xccO99rD8xYEkCtnTu+tI3+lwOi3zRlbzsDFS+fwrRhEU01N95u+avCkL/5Z6f0DStxoYYGD0ZoaQUxRneWL/pan83oZiqU81QBFD6ciF4FI64Lpbk5RA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657722405;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6EfsuV0oyUK6JOK/M9DBD2m9qiNT/2Qog8cyd8NWFl0=;
	b=O4xKEISCWQv47NEPeRvf/A6PQ59Bi8SvTo7k9nxIcmZZSgKYNSRBSHbBeCc2AcGj
	EIMDAWTekp3lGtaaITNm7noP7pFxDsTUgkB6PJdVY/kKl+TOmb0OMqMDBiDnbuohP1L
	Fhm4w+1dseN3N2JyYB82Mqfw3rgn34otsdXvwS7Y=
Received: from edelgard.icenowy.me (59.41.163.162 [59.41.163.162]) by mx.zohomail.com
	with SMTPS id 1657722402060688.0417263615216; Wed, 13 Jul 2022 07:26:42 -0700 (PDT)
Message-ID: <e8543838cd221ab6699da16c985eed7514daa786.camel@icenowy.me>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: add the missing monitor
 core
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 13 Jul 2022 22:26:04 +0800
In-Reply-To: <20220711184325.1367393-3-mail@conchuod.ie>
References: <20220711184325.1367393-1-mail@conchuod.ie>
	 <20220711184325.1367393-3-mail@conchuod.ie>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_072712_820075_61A95403 
X-CRM114-Status: GOOD (  17.16  )
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

5ZyoIDIwMjItMDctMTHmmJ/mnJ/kuIDnmoQgMTk6NDMgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IAo+IFRoZSBKSDcxMDAgaGFzIGEgMzIgYml0IG1vbml0b3IgY29yZSB0aGF0IGlzIG1pc3Npbmcg
ZnJvbSB0aGUgZGV2aWNlCj4gdHJlZS4gQWRkIGl0IChhbmQgaXRzIGNwdS1tYXAgZW50cnkpIHRv
IG1vcmUgYWNjdXJhdGVseSByZWZsZWN0IHRoZQo+IGFjdHVhbCB0b3BvbG9neSBvZiB0aGUgU29D
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNp
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2po
NzEwMC5kdHNpCj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpCj4g
aW5kZXggYzYxN2E2MWUyNmUyLi45MmZjZTViNjZkM2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTAwLmR0c2kKPiBAQCAtNjcsNiArNjcsMjMgQEAgY3B1MV9pbnRjOiBp
bnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4g
wqAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRTI0OiBjcHVAMiB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInNp
Zml2ZSxlMjQiLCAicmlzY3YiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmVnID0gPDI+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGktY2FjaGUtYmxvY2stc2l6ZSA9IDwzMj47Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpLWNhY2hlLXNl
dHMgPSA8MjU2PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGktY2FjaGUtc2l6ZSA9IDwxNjM4ND47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByaXNjdixpc2EgPSAicnYzMmltYWZjIjsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3B1
Ml9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJyaXNj
dixjcHUtaW50YyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2ludGVy
cnVwdC1jZWxscyA9IDwxPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3B1LW1hcCB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2x1c3RlcjAgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb3Jl
MCB7Cj4gQEAgLTc2LDYgKzkzLDEwIEBAIGNvcmUwIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29yZTEgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY3B1ID0gPCZVNzRfMT47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGNvcmUyIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3B1ID0gPCZFMjQ+Owo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07
CgpTb3JyeSBidXQgSSB0aGluayB0aGlzIGNoYW5nZSBtYWtlcyB0aGUgdG9wb2xvZ3kgbW9yZSBp
bmFjY3VyYXRlLgoKVGhlIEUyNCBjb3JlIGlzIHZlcnkgaW5kZXBlbmRlbnQsIGp1c3QgYW5vdGhl
ciBDUFUgY29yZSBjb25uZWN0ZWQgdGhlCnNhbWUgYnVzIC0tIGV2ZW4gbm8gY29oZXJlbmN5IChF
MjQgdGFrZXMgQUhCLCB3aGljaCBpcyBub3QgY29oZXJlbmN5LQpzZW5zaWJsZSkuIEV2ZW4gdGhl
IFRBUCBvZiBpdCBpcyBpbmRlcGVuZGVudCB3aXRoIHRoZSBVNzQgVEFQLgoKQW5kIGJ5IGRlZmF1
bHQgaXQgZG9lcyBub3QgYm9vdCBhbnkgcHJvcGVyIGNvZGUgKGlmIGEgZGVidWdnZXIgaXMKYXR0
YWNoZWQsIGl0IHdpbGwgZGlzY292ZXIgdGhhdCB0aGUgRTI0IGlzIGluIGNvbnNpc3RlbnRseSBm
YXVsdCBhdCAweDAKKG10dmVjIGlzIDB4MCBhbmQgd2hlbiBmYXVsdCBpdCBqdW1wcyB0byAweDAg
YW5kIGZhdWx0IGFnYWluKSwgdW50aWwKaXRzIGNsb2NrIGlzIGp1c3Qgc2h1dGRvd24gYnkgTGlu
dXggY2xlYW5pbmcgdXAgdW51c2VkIGNsb2Nrcy4pCgpQZXJzb25hbGx5IEkgdGhpbmsgaXQgc2hv
dWxkIGJlIGltcGxlbWVudGVkIGFzIGEgcmVtb3RlcHJvYyBpbnN0ZWFkLgoKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgfTsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
