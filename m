Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7BC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 02:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbvfEATVHZ0kYiSklzO6cWIf0l6p1q4HZyRNsDVYb40=; b=RoB9TGNmW0fcgj
	CSPyYQFvmEnMXUnPvRy1MRzPFcxWfgOgk2KVLIHYeRT2PMI6kWW1DFyJmHTdJEValV4NgNKM4zr2s
	FcgO62N5hU2YBqKAve1k6WDubnfot9KW7hTdzFKk57Z2k2i1F8AuJACk8ZONzsCqKv9A+SNqlICRM
	8eOTmAwsgVC3yBiYDTkOK6x3Us77QtP95yPoKZC/nTgX2p1Ys7PZznB1d7mVeNbGV9633D4BoN5ea
	EXThqd0Dp+Ur5HHwyG8k2akeJdbKUeauV7tq4/m4WgQK6fxDfdyhp6OHw7waP2zjH+P2opDEGpyfO
	h7VOVlJ90+B/JmjKX4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoXL-00000005d8p-2jPq;
	Tue, 10 Jun 2025 02:16:27 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoXJ-00000005d8N-13Fr
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 02:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749521749; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WpRvctyo/jxngsmAbGBiA/2PjYgAWxyNHxkVwCWv1qhOZs9fkcbDUm0esdFfkc0meGbYCBp3qB8Jn1LxroqLdB1f/QjZaa1WpCho+AzVDo5xz3d/0RpuYDYPB4Pn2CmGAJyoFjmHhLgFdSjY5q5VeyZupTsifAh7bs4OfodaroI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749521749; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCvZr2SedUqbvvr8ZQreuN0CLWKZ7YrA855PyQRbJ90=; 
	b=naGRAdfGU/xoBIpTneLtuu6RPIoxEzjsJygCaT2USZ50AUOtRBUsFk5SsIapWc3j4hvRJflTtt0kw7uUTbDge34406yIC8OESo41etNme/C9zadZLO6AJpEJspTViD2YekXTf6kKE+LK5Kyyp3HVwDn7YbnFt50tvbkW/UgBQvw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749521749;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XCvZr2SedUqbvvr8ZQreuN0CLWKZ7YrA855PyQRbJ90=;
	b=oJ/xji1b0T66baoLpGV7JQrxF77sU/EA6qqgm4q5fEd1MiBGo9e1KFxPafhgEgJg
	FbcUvYqgxA74Kob7uuZ3gohounHwejtNzTeOZ+N+Ktq2wCIPn+F6jc8xWno9d87IvSY
	B/y8zCVTehiMgYS+6h+Pv3uPGdRwVIHMc03UCwOA=
Received: by mx.zohomail.com with SMTPS id 1749521745831216.42443583394527;
	Mon, 9 Jun 2025 19:15:45 -0700 (PDT)
Message-ID: <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>
Date: Tue, 10 Jun 2025 10:15:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Longbin Li <looong.bin@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <20250608232214.771855-4-inochiama@gmail.com>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <20250608232214.771855-4-inochiama@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_191625_656212_15D86F6B 
X-CRM114-Status: GOOD (  14.89  )
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

SGkgSW5vY2hpLAoKT24gMjAyNS82LzkgMDc6MjIsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gQWRk
IHJlc2V0IGdlbmVyYXRvciBub2RlIGZvciBhbGwgQ1YxOFhYIHNlcmllcyBTb0MuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+ICAg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kgICAgfCAgNyArKwo+ICAgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LXJlc2V0LmggfCA5OCArKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1yZXNldC5o
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+IGluZGV4IGVkMDZjMzYw
OWZiMi4uNGMzZDE2NzY0MTMxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgweC5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4
LmR0c2kKPiBAQCAtNyw2ICs3LDcgQEAKPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9z
b3BoZ28sY3YxODAwLmg+Cj4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+Cj4g
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gKyNp
bmNsdWRlICJjdjE4eHgtcmVzZXQuaCIKPiAgIAo+ICAgLyB7Cj4gICAJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gQEAgLTI0LDYgKzI1LDEyIEBAIHNvYyB7Cj4gICAJCSNzaXplLWNlbGxzID0gPDE+
Owo+ICAgCQlyYW5nZXM7Cj4gICAKPiArCQlyc3Q6IHJlc2V0LWNvbnRyb2xsZXJAMzAwMzAwMCB7
Cj4gKwkJCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItcmVzZXQiOwo+ICsJCQlyZWcgPSA8
MHgzMDAzMDAwIDB4MTAwMD47Cj4gKwkJCSNyZXNldC1jZWxscyA9IDwxPjsKPiArCQl9Owo+ICsK
PiAgIAkJZ3BpbzA6IGdwaW9AMzAyMDAwMCB7Cj4gICAJCQljb21wYXRpYmxlID0gInNucHMsZHct
YXBiLWdwaW8iOwo+ICAgCQkJcmVnID0gPDB4MzAyMDAwMCAweDEwMDA+Owo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcmVzZXQuaCBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL2N2MTh4eC1yZXNldC5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmI5YjZkZDU2YTllMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcmVzZXQuaAo+IEBAIC0wLDAgKzEsOTgg
QEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkgKi8KPiAr
LyoKPiArICogQ29weXJpZ2h0IChDKSAyMDI1IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRs
b29rLmNvbT4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9TT1BIR09fQ1YxOFhYX1JFU0VUCj4gKyNk
ZWZpbmUgX1NPUEhHT19DVjE4WFhfUkVTRVQKPiArCj4gKyNkZWZpbmUgUlNUX0REUgkJCQkyCj4g
KyNkZWZpbmUgUlNUX0gyNjRDCQkJMwo+ICsjZGVmaW5lIFJTVF9KUEVHCQkJNAo+ICsjZGVmaW5l
IFJTVF9IMjY1QwkJCTUKPiArI2RlZmluZSBSU1RfVklQU1lTCQkJNgo+ICsjZGVmaW5lIFJTVF9U
RE1BCQkJNwo+ICsjZGVmaW5lIFJTVF9UUFUJCQkJOAo+ICsjZGVmaW5lIFJTVF9UUFVTWVMJCQk5
Cj4gKyNkZWZpbmUgUlNUX1VTQgkJCQkxMQo+ICsjZGVmaW5lIFJTVF9FVEgwCQkJMTIKPiArI2Rl
ZmluZSBSU1RfRVRIMQkJCTEzCj4gKyNkZWZpbmUgUlNUX05BTkQJCQkxNAo+ICsjZGVmaW5lIFJT
VF9FTU1DCQkJMTUKPiArI2RlZmluZSBSU1RfU0QwCQkJCTE2Cj4gKyNkZWZpbmUgUlNUX1NETUEJ
CQkxOAo+ICsjZGVmaW5lIFJTVF9JMlMwCQkJMTkKPiArI2RlZmluZSBSU1RfSTJTMQkJCTIwCj4g
KyNkZWZpbmUgUlNUX0kyUzIJCQkyMQo+ICsjZGVmaW5lIFJTVF9JMlMzCQkJMjIKPiArI2RlZmlu
ZSBSU1RfVUFSVDAJCQkyMwo+ICsjZGVmaW5lIFJTVF9VQVJUMQkJCTI0Cj4gKyNkZWZpbmUgUlNU
X1VBUlQyCQkJMjUKPiArI2RlZmluZSBSU1RfVUFSVDMJCQkyNgo+ICsjZGVmaW5lIFJTVF9JMkMw
CQkJMjcKPiArI2RlZmluZSBSU1RfSTJDMQkJCTI4Cj4gKyNkZWZpbmUgUlNUX0kyQzIJCQkyOQo+
ICsjZGVmaW5lIFJTVF9JMkMzCQkJMzAKPiArI2RlZmluZSBSU1RfSTJDNAkJCTMxCj4gKyNkZWZp
bmUgUlNUX1BXTTAJCQkzMgo+ICsjZGVmaW5lIFJTVF9QV00xCQkJMzMKPiArI2RlZmluZSBSU1Rf
UFdNMgkJCTM0Cj4gKyNkZWZpbmUgUlNUX1BXTTMJCQkzNQo+ICsjZGVmaW5lIFJTVF9TUEkwCQkJ
NDAKPiArI2RlZmluZSBSU1RfU1BJMQkJCTQxCj4gKyNkZWZpbmUgUlNUX1NQSTIJCQk0Mgo+ICsj
ZGVmaW5lIFJTVF9TUEkzCQkJNDMKPiArI2RlZmluZSBSU1RfR1BJTzAJCQk0NAo+ICsjZGVmaW5l
IFJTVF9HUElPMQkJCTQ1Cj4gKyNkZWZpbmUgUlNUX0dQSU8yCQkJNDYKPiArI2RlZmluZSBSU1Rf
RUZVU0UJCQk0Nwo+ICsjZGVmaW5lIFJTVF9XRFQJCQkJNDgKPiArI2RlZmluZSBSU1RfQUhCX1JP
TQkJCTQ5Cj4gKyNkZWZpbmUgUlNUX1NQSUMJCQk1MAo+ICsjZGVmaW5lIFJTVF9URU1QU0VOCQkJ
NTEKPiArI2RlZmluZSBSU1RfU0FSQURDCQkJNTIKPiArI2RlZmluZSBSU1RfQ09NQk9fUEhZMAkJ
CTU4Cj4gKyNkZWZpbmUgUlNUX1NQSV9OQU5ECQkJNjEKPiArI2RlZmluZSBSU1RfU0UJCQkJNjIK
PiArI2RlZmluZSBSU1RfVUFSVDQJCQk3NAo+ICsjZGVmaW5lIFJTVF9HUElPMwkJCTc1Cj4gKyNk
ZWZpbmUgUlNUX1NZU1RFTQkJCTc2Cj4gKyNkZWZpbmUgUlNUX1RJTUVSCQkJNzcKPiArI2RlZmlu
ZSBSU1RfVElNRVIwCQkJNzgKPiArI2RlZmluZSBSU1RfVElNRVIxCQkJNzkKPiArI2RlZmluZSBS
U1RfVElNRVIyCQkJODAKPiArI2RlZmluZSBSU1RfVElNRVIzCQkJODEKPiArI2RlZmluZSBSU1Rf
VElNRVI0CQkJODIKPiArI2RlZmluZSBSU1RfVElNRVI1CQkJODMKPiArI2RlZmluZSBSU1RfVElN
RVI2CQkJODQKPiArI2RlZmluZSBSU1RfVElNRVI3CQkJODUKPiArI2RlZmluZSBSU1RfV0dOMAkJ
CTg2Cj4gKyNkZWZpbmUgUlNUX1dHTjEJCQk4Nwo+ICsjZGVmaW5lIFJTVF9XR04yCQkJODgKPiAr
I2RlZmluZSBSU1RfS0VZU0NBTgkJCTg5Cj4gKyNkZWZpbmUgUlNUX0FVRERBQwkJCTkxCj4gKyNk
ZWZpbmUgUlNUX0FVRERBQ19BUEIJCQk5Mgo+ICsjZGVmaW5lIFJTVF9BVURBREMJCQk5Mwo+ICsj
ZGVmaW5lIFJTVF9WQ1NZUwkJCTk1Cj4gKyNkZWZpbmUgUlNUX0VUSFBIWQkJCTk2Cj4gKyNkZWZp
bmUgUlNUX0VUSFBIWV9BUEIJCQk5Nwo+ICsjZGVmaW5lIFJTVF9BVURTUkMJCQk5OAo+ICsjZGVm
aW5lIFJTVF9WSVBfQ0FNMAkJCTk5Cj4gKyNkZWZpbmUgUlNUX1dEVDEJCQkxMDAKPiArI2RlZmlu
ZSBSU1RfV0RUMgkJCTEwMQo+ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJfQ1BVQ09SRTAJCTI1Ngo+
ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJfQ1BVQ09SRTEJCTI1Nwo+ICsjZGVmaW5lIFJTVF9BVVRP
Q0xFQVJfQ1BVQ09SRTIJCTI1OAo+ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJfQ1BVQ09SRTMJCTI1
OQo+ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJfQ1BVU1lTMAkJMjYwCj4gKyNkZWZpbmUgUlNUX0FV
VE9DTEVBUl9DUFVTWVMxCQkyNjEKPiArI2RlZmluZSBSU1RfQVVUT0NMRUFSX0NQVVNZUzIJCTI2
Mgo+ICsjZGVmaW5lIFJTVF9DUFVDT1JFMAkJCTI2OAoKCkxvb2tzIGxpa2UgdGhpcyBhbmQgdGhl
IGZvbGxvd2luZyBzdGlsbCBkb2Vzbid0IHJpZ2h0LiBTaW5jZSBpdOKAmXMgYml0IDAKYXQgb2Zm
c2V0IDB4MDI0LCBpdCBzaG91bGQgYmUgMHgyNCAqIDggPSAweDEyMCA9IDI4OCwgbm90IDI2OC4K
Cj4gKyNkZWZpbmUgUlNUX0NQVUNPUkUxCQkJMjY5Cj4gKyNkZWZpbmUgUlNUX0NQVUNPUkUyCQkJ
MjcwCj4gKyNkZWZpbmUgUlNUX0NQVUNPUkUzCQkJMjcxCj4gKyNkZWZpbmUgUlNUX0NQVVNZUzAJ
CQkyNzIKPiArI2RlZmluZSBSU1RfQ1BVU1lTMQkJCTI3Mwo+ICsjZGVmaW5lIFJTVF9DUFVTWVMy
CQkJMjc0Cj4gKwo+ICsjZW5kaWYgLyogX1NPUEhHT19DVjE4WFhfUkVTRVQgKi8KCi0tIApCZXN0
IHJlZ2FyZHMsCkp1bmh1aSBMaXUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
