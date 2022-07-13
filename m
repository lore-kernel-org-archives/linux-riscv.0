Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNvwKLfAf5nW55ys2a1Ud73PtKBgZXVprVDQvLFS6uc=; b=DjwcUUYAlEMcfL
	ampeg0+lsfgkEMPCrRfLlWhv0RKWYn1yGu1fPSd2AOWcnS3VqL7n3YE0GF+jyeHc+P+xLJcWlvtoK
	Iju4oNnxl4v3B+i7Q7Mv31AL2So4vzD/BGrsyqEFXrzQCwgmPkydPPHRXUY7kVrciM47b2tbb+fww
	IWJcFsR9TT2j587esuatZhbxfn8mTjkc5H7d9U0DHDLVPQlJ71dOhZgf1ARTLIvThBC+8KWSbl0sv
	i0l0KO2e4/6L5tqzokG/8xB7O8jEJi6AooF8mGnKzcRr7ePcFWmLxCKJj7cNvyUXhJjF0ecNVOxVl
	JR3DwPj7SUK4MZ5XjfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkWB-008QuR-Nt; Wed, 13 Jul 2022 22:07:39 +0000
Received: from relay4.mymailcheap.com ([137.74.80.155])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBe9x-0050En-E6
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 15:20:19 +0000
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 582762002B;
	Wed, 13 Jul 2022 15:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id A7FD62A37A;
	Wed, 13 Jul 2022 15:20:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mjtnp9Yh_b5A; Wed, 13 Jul 2022 15:20:11 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Wed, 13 Jul 2022 15:20:11 +0000 (UTC)
Received: from edelgard.icenowy.me (unknown [59.41.163.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0FC58401DE;
	Wed, 13 Jul 2022 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1657725611; bh=+yBjiaaM+sNFe9mQaPmsE4kvOTzDSDgxYxxc0Iq+MY8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LCrc1mO5Ay1rRkF9QUGl4hQizZ5rOnedJWUoAOdi3X+2wmQ49ho4zjByDepWWvL/M
	 m9R+2QlpsED2A+6C+02bn6FrwdibSyylTreJ3D/F8rSQBjEfds807pLbIz4fSLr33P
	 /HCg4HifkboydGfuh0ZYDWtag6yqzgYqTUy306ns=
Message-ID: <c4b4ecdff302879fa73feab6038a8fe863f4e51b.camel@aosc.io>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: add the missing monitor
 core
From: Icenowy Zheng <icenowy@aosc.io>
To: Conor.Dooley@microchip.com, kernel@esmil.dk, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com,  aou@eecs.berkeley.edu, anup@brainfault.org
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 13 Jul 2022 23:20:03 +0800
In-Reply-To: <224a7ec2-62ca-a8a5-ff36-37de4186e05e@microchip.com>
References: <20220711184325.1367393-1-mail@conchuod.ie>
	 <20220711184325.1367393-3-mail@conchuod.ie>
	 <2303fc91e5110f22fc9ea6008fa4bbc77c1bdb13.camel@aosc.io>
	 <224a7ec2-62ca-a8a5-ff36-37de4186e05e@microchip.com>
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_082017_783864_5B18EEBB 
X-CRM114-Status: GOOD (  20.63  )
X-Mailman-Approved-At: Wed, 13 Jul 2022 15:07:37 -0700
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

5ZyoIDIwMjItMDctMTPmmJ/mnJ/kuInnmoQgMTU6MTYgKzAwMDDvvIxDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbeWGmemBk++8mgo+IE9uIDEzLzA3LzIwMjIgMTY6MTUsIEljZW5vd3kgWmhlbmcg
d3JvdGU6Cj4gPiDlnKggMjAyMi0wNy0xMeaYn+acn+S4gOeahCAxOTo0MyArMDEwMO+8jENvbm9y
IERvb2xleeWGmemBk++8mgo+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+ID4gPiAKPiA+ID4gVGhlIEpINzEwMCBoYXMgYSAzMiBiaXQgbW9uaXRv
ciBjb3JlIHRoYXQgaXMgbWlzc2luZyBmcm9tIHRoZQo+ID4gPiBkZXZpY2UKPiA+ID4gdHJlZS4g
QWRkIGl0IChhbmQgaXRzIGNwdS1tYXAgZW50cnkpIHRvIG1vcmUgYWNjdXJhdGVseSByZWZsZWN0
Cj4gPiA+IHRoZQo+ID4gPiBhY3R1YWwgdG9wb2xvZ3kgb2YgdGhlIFNvQy4KPiA+ID4gCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
Cj4gPiA+IC0tLQo+ID4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0
c2kgfCAyMQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysKPiA+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0c2kKPiA+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzEwMC5kdHNpCj4gPiA+IGluZGV4IGM2MTdhNjFlMjZlMi4uOTJmY2U1YjY2
ZDNkIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEw
MC5kdHNpCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0
c2kKPiA+ID4gQEAgLTY3LDYgKzY3LDIzIEBAIGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xs
ZXIgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiA+IMKgCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBFMjQ6IGNwdUAyIHsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0g
InNpZml2ZSxlMjQiLCAicmlzY3YiOwo+ID4gCj4gPiBPaCwgYnkgdGhlIHdheSAic2lmaXZlLGUy
NCIgaXMgbm90IGEgZG9jdW1lbnRlZCBjb21wYXRpYmxlIGluIHRoZQo+ID4gRFQKPiA+IGJpbmRp
bmcuCj4gPiAKPiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBhZGQgaXQgaGVyZSwgeW91IG5lZWQg
dG8gYWRkIHRoZSBjb21wYXRpYmxlCj4gPiBzdHJpbmcgdG8gdGhlIERUIGJpbmRpbmcgZmlyc3Qu
Cj4gCj4gQ2hlY2sgcGF0Y2ggMS8yLgoKT2ggc29ycnkgSSBmb3Jnb3QgdGhpcy4KCk5ldmVybWlu
ZC4KCj4gCj4gPiAKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZWcgPSA8Mj47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpLWNhY2hlLWJsb2NrLXNpemUgPSA8MzI+
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkt
Y2FjaGUtc2V0cyA9IDwyNTY+Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGktY2FjaGUtc2l6ZSA9IDwxNjM4ND47Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmlzY3YsaXNhID0gInJ2MzJpbWFm
YyI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3RhdHVzID0gImRpc2FibGVkIjsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNwdTJfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIg
ewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInJpc2N2LGNwdS1pbnRjIjsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiA+ICsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjcHUtbWFwIHsKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2x1c3RlcjAgewo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY29yZTAgewo+ID4gPiBAQCAtNzYsNiArOTMsMTAgQEAgY29yZTAgewo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Y29yZTEgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNwdSA9IDwmVTc0XzE+Owo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb3JlMiB7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjcHUgPSA8JkUyND47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiAKPiA+
IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
