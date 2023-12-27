Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0894FC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 03:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnBne8zZYCiUjl4XttvY5VTCNFiy/OJ9mxZkoJRrdN8=; b=uhqoCxpFvB5jMh
	Ku8DJJ9eLfZ0YRKa3P3iSYXraiLAsiq4tcCDDxrxt0EedOTg6mNVX+vU69GejGg6/9oTasyAAYg+5
	rH5SYZK7cU/s3t9WvIL8iPKmsylQznNhrr7hxdGQ8PlWIZjs4Bc6rlQBViu8WjSVXP++yABTpVSWq
	bn9kfdxlTbRwU6WcZ1hO1UORUX8zgAd9OanDJfPhC3WsH2fNytmGqKwleBhc4UNprhUgJstJkDvDQ
	WrqDgC688P2NQEfhq6AAwaLGWIu8BAhHgGJBWqiNNDqi2oJIjB8x0R5pj93t36ClRGBWGDptbpSAp
	HZuAHSNLXUI3Hq7DhEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIL3C-00DvUi-1O;
	Wed, 27 Dec 2023 03:57:46 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIL39-00DvTN-07
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 03:57:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1703649446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ci+N34DZ/1jEYg/YaTh1Eju9R2R0ILw6v8amLrTBwPkYhKO1dT0NHYL/tn7Ah4jRNW17627qYYYTRcUzIFM/jVDBbLwwgjbv8ivgaLERkeWgZKyiEafZ6aUzirheDdEYESRagsVgigsMKoZJGphbwyJsr2cBl1DJt+4Qqq2bYRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1703649446; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PDs/5RyQrkv8/uvBnzQ1A3NQ3kJYbwWBLDAWvp3dC/g=; 
	b=LrkgA3sU1xiV7M3lI1Up+vd42ynvNWHNhE4s4yVw84ICVq3+issXa1nYZmJPhmzlIj7WdoEc+Ma6VS4s0Q9I3MoZyJusIgny4AKGvjxXV94f8tq8NbjB63shOjJlpTuJsbGNWKjxWHLx6zujZCMApKbeMJ7bBqe014ZdU7f9D1Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1703649446;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PDs/5RyQrkv8/uvBnzQ1A3NQ3kJYbwWBLDAWvp3dC/g=;
	b=TIEzljUCMSZFCXIRUzbbLkkGvEQThEuyOy5WvEjPHPZ9AIslNARA6SDTyNz+2B4u
	gMdeLyfsZ23226ihMGECXJ0KArV0G85ZeDPWGHHzXsetMCxo/RrkFVPa0NhAh/VoIoy
	2flbuVZQQQxqUslAKC8jxJskifGKJHpBgskwvYaFoppODCw8vfSLQsXmugDm7DZe9TS
	wy6WsmdaIfO8APQ9qV4oKH845/0WmYoK2pCQWJgPxDHC5adABo7/yDvxiaYXb9ZxBkU
	b+zbHU3PO5bXf3iPFi6x0jdzgPu5vC8VNkLmPXAQznA34Qj5pp1QfBocznBR+SAx++y
	eDzVxShNgg==
Received: from edelgard.fodlan.icenowy.me (120.85.97.19 [120.85.97.19]) by mx.zohomail.com
	with SMTPS id 1703649444779355.6452133422597; Tue, 26 Dec 2023 19:57:24 -0800 (PST)
Message-ID: <94bdac9b7347893cfa787b3f8c95215d4b7b4c12.camel@icenowy.me>
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
From: Icenowy Zheng <uwu@icenowy.me>
To: Keith Zhao <keith.zhao@starfivetech.com>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	 <linux-riscv@lists.infradead.org>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>,  "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "mripard@kernel.org" <mripard@kernel.org>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 William Qiu <william.qiu@starfivetech.com>,  Shengyang Chen
 <shengyang.chen@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Date: Wed, 27 Dec 2023 11:57:17 +0800
In-Reply-To: <580e13ab-a73e-4ce7-999a-8a8685faf2dd@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
	 <20231204123315.28456-5-keith.zhao@starfivetech.com>
	 <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
	 <580e13ab-a73e-4ce7-999a-8a8685faf2dd@starfivetech.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_195743_111695_7450F0A2 
X-CRM114-Status: GOOD (  25.10  )
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

5ZyoIDIwMjMtMTItMDfmmJ/mnJ/lm5vnmoQgMTk6MzEgKzA4MDDvvIxLZWl0aCBaaGFv5YaZ6YGT
77yaCj4gCj4gCj4gT24gMjAyMy8xMi83IDE2OjQxLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4g
5ZyoIDIwMjMtMTItMDTmmJ/mnJ/kuIDnmoQgMjA6MzMgKzA4MDDvvIxLZWl0aCBaaGFv5YaZ6YGT
77yaCj4gPiAqc25pcCoKPiA+IAo+ID4gPiArc3RhdGljIHZvaWQgdXBkYXRlX2N1cnNvcl9wbGFu
ZShzdHJ1Y3QgdnNfZGMgKmRjLCBzdHJ1Y3QKPiA+ID4gdnNfcGxhbmUKPiA+ID4gKnBsYW5lLAo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3BsYW5lICpkcm1fcGxhbmUsCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlCj4gPiA+ICpkcm1fc3RhdGUpCj4gPiA+ICt7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlID0KPiA+ID4gZHJtX2F0b21p
Y19nZXRfbmV3X3BsYW5lX3N0YXRlKGRybV9zdGF0ZSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
PiA+IMKgwqDCoMKgCj4gPiA+IMKgIGRybV9wbGFuZSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCB2c19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPQo+ID4gPiB0b192c19wbGFuZV9zdGF0
ZShzdGF0ZSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmRy
bV9mYiA9IHN0YXRlLT5mYjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRjX2h3X2N1cnNv
ciBjdXJzb3I7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY3Vyc29yLmFkZHJlc3MgPSBw
bGFuZV9zdGF0ZS0+ZG1hX2FkZHJbMF07Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGN1cnNvci54ID0g
c3RhdGUtPmNydGNfeDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY3Vyc29yLnkgPSBzdGF0ZS0+Y3J0
Y195Owo+ID4gCj4gPiBGcm9tIG15IGV4cGVyaW1lbnRzIG9uIHBva2luZyB3aXRoIHJlZ2lzdGVy
cyBvbiBULUhlYWQgVEgxNTIwIChhbHNvCj4gPiB1c2VzIERDODIwMCBkaXNwbGF5IGNvbnRyb2xs
ZXIgYW5kIGEgc2ltaWxhciBkcml2ZXIpLCB0aGUgREM4MjAwCj4gPiBoYXJkd2FyZSBoYXZlIGEg
ZGlmZmVyZW50IGRlZmluaXRpb24gb2YgY3Vyc29yIHBvc2l0aW9uIFggYW5kIFkKPiA+IHdpdGgK
PiA+IHRoZSBDUlRDIHBsYW5lIHN0YXRlLgo+ID4gCj4gPiBGb3IgQ1JUQyBwbGFuZSBzdGF0ZSwg
aG90X3ggYW5kIGhvdF95IGFyZSBvbmx5IHByb3ZpZGVkIGFzCj4gPiByZWZlcmVuY2UsCj4gPiBh
bmQgdGhlIGN1cnNvciBzaG91bGQgYmUgZGlzcGxheWVkIHdpdGggaXRzICgwLDApIGRyYXduIHRv
IChjcnRjX3gsCj4gPiBjcnRjX3kpIChbWFldX2NydGMgYXJlIHZhbHVlcyBzcGVjaWZpZWQgaW4g
Q1JUQyBzdGF0ZSwgdGhlIHJpZ2h0Cj4gPiBwYXJ0Cj4gPiBvZiB0aGUgYXNzaWdubWVudHMgaGVy
ZSksIHdoZW4gdGhlIGN1cnNvciBpcyBtb3ZlZCB0byAoMCwwKSBidXQgdGhlCj4gPiBob3QKPiA+
IHBvaW50IGlzIG5vdCAoMCwwKSwgaXQgY291bGQgYmUgbmVnYXRpdmUuCj4gPiAKPiA+IEhvd2V2
ZXIsIGZvciBEQzgyMDAgcmVnaXN0ZXJzIGRlZmluaXRpb24sIGN1cnNvciBYWSBwb3NpdGlvbiBj
b3VsZAo+ID4gbm90Cj4gPiBiZSBuZWdhdGl2ZSAtLSB0aGUgY3Vyc29yIHdpbGwgZGlzYXBwZWFy
IHRoZW47IGJlY2F1c2UgaW4gaXRzCj4gPiBkZWZpbml0aW9uLCB0aGUgY3Vyc29yIFhZIHBvc2l0
aW9uIHNob3VsZCBiZSB3aGVyZSB0aGUgY3Vyc29yIGlzCj4gPiBwb2ludGluZyB0bywgaW5zdGVh
ZCBvZiBpdHMgKDAsMCkuIERDODIwMCB3aWxsIGRyYXcgKDAsMCkgb2YgdGhlCj4gPiBjdXJzb3IK
PiA+IHRvICh4IC0gaG90X3gsIHkgLSBob3RfeSkuIFNvIHRvIG1ldCB0aGUgZXhwZWN0YXRpb24g
b2YgdGhlIEtNUwo+ID4gcGxhbmUKPiA+IHNldHRpbmdzLCB0aGUgREM4MjAwIHBvc2l0aW9uIHNo
b3VsZCBiZSBzZXQgdG8gKGNydGNfeCArIGhvdF94LAo+ID4gY3J0Y195Cj4gPiArIGhvdF95KSBp
bnN0ZWFkLiBUaHVzIHRoZXNlIHR3byBsaW5lcyBvZiBjb2RlIHNob3VsZCBiZToKPiA+IAo+ID4g
YGBgCj4gPiDCoMKgwqDCoMKgwqDCoCBjdXJzb3IueCA9IHN0YXRlLT5jcnRjX3ggKyBkcm1fZmIt
PmhvdF94Owo+ID4gwqDCoMKgwqDCoMKgwqAgY3Vyc29yLnkgPSBzdGF0ZS0+Y3J0Y195ICsgZHJt
X2ZiLT5ob3RfeTsKPiA+IGBgYAoKV2VsbCBJIHJlYWxpemVkIHRoYXQgdGhpcyBjaGFuZ2UgaXMg
bm90IGNvcnJlY3QgdG9vOiB3aGVuIG1vdmluZyB0aGUKbW91c2UgY3Vyc29yIHdpdGggdGhlIHNj
cmVlbiByb3RhdGVkLCB0aGUgbW91c2UgY3Vyc29yIHdpbGwgZGlzYXBwZWFyCmF0IHNvbWUgc2Ny
ZWVuIGJvcmRlci4KCk15IGN1cnJlbnQgaWRlYSBpczoKCkFzIHRoZSBDUlRDIGhvdCBwb2ludCBp
cyBqdXN0IGEgcmVmZXJlbmNlLCB3ZSBjYW4ganVzdCBpZ25vcmUgaXQsIGFuZAp1c2UgdGhlIEhX
IGhvdCBwb2ludCB0byBpbXBsZW1lbnQgbmVnYXRpdmUgY3Vyc29yIHBvc2l0aW9uLgoKVGhlIHBh
dGNoIGlzIGxpa2UgdGhlIGZvbGxvdzoKCi0gICAgY3Vyc29yLnggPSBzdGF0ZS0+Y3J0Y194Owot
ICAgIGN1cnNvci55ID0gc3RhdGUtPmNydGNfeTsKLSAgICBjdXJzb3IuaG90X3ggPSBkcm1fZmIt
PmhvdF94OwotICAgIGN1cnNvci5ob3RfeSA9IGRybV9mYi0+aG90X3k7CisgICAgaWYgKHN0YXRl
LT5jcnRjX3ggPiAwKSB7CisgICAgICAgIGN1cnNvci54ID0gc3RhdGUtPmNydGNfeDsKKyAgICAg
ICAgY3Vyc29yLmhvdF94ID0gMDsKKyAgICB9IGVsc2UgeworICAgICAgICBjdXJzb3IuaG90X3gg
PSAtc3RhdGUtPmNydGNfeDsKKyAgICAgICAgY3Vyc29yLnggPSAwOworICAgIH0KKyAgICBpZiAo
c3RhdGUtPmNydGNfeSA+IDApIHsKKyAgICAgICAgY3Vyc29yLnkgPSBzdGF0ZS0+Y3J0Y195Owor
ICAgICAgICBjdXJzb3IuaG90X3kgPSAwOworICAgIH0gZWxzZSB7CisgICAgICAgIGN1cnNvci5o
b3RfeSA9IC1zdGF0ZS0+Y3J0Y195OworICAgICAgICBjdXJzb3IueSA9IDA7CisgICAgfQoKZHJt
X2ZiIGNvdWxkIGp1c3QgYmUgcmVtb3ZlZCBpbiB0aGlzIGZ1bmN0aW9uIHRoZW4gYmVjYXVzZSBp
dCdzIG5vCmxvbmdlciBuZWVkZWQgKGl0J3MgdXNlZCB0byBnZXQgdGhlIGN1cnNvcidzIGhvdCBw
b2ludCwgd2hpY2ggd2UKaWdub3JlZCBub3cpLgoKPiA+IAo+ID4gCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGN1cnNvci5ob3RfeCA9IGRybV9mYi0+aG90X3g7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGN1
cnNvci5ob3RfeSA9IGRybV9mYi0+aG90X3k7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGN1cnNvci5k
aXNwbGF5X2lkID0gdG9fdnNfZGlzcGxheV9pZChkYywgc3RhdGUtPmNydGMpOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqB1cGRhdGVfY3Vyc29yX3NpemUoc3RhdGUsICZjdXJzb3IpOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqBjdXJzb3IuZW5hYmxlID0gdHJ1ZTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDC
oMKgwqBkY19od191cGRhdGVfY3Vyc29yKCZkYy0+aHcsIGN1cnNvci5kaXNwbGF5X2lkLCAmY3Vy
c29yKTsKPiA+ID4gK30KPiA+ICpzbmlwCj4gaGVsbG8gSWNlbm93eToKPiB5b3UgYXJlIGRlZXAg
dW5kZXJzdGFuZGluZyBvbiBkYzgyMDAuCj4gYnkgdGhlIHdheSBvZiBwcmFjdGljZQo+IEkgdGVz
dGVkIHRoaXMgY2hhbmdlIG9uIHRoZSBkZWJpYW4gZGVza3RvcCwgaXMgdGhlcmUgYSB3YXkgdG8g
Y29tcGFyZQo+IHRoZSBjdXJzb3IgYmVoYXZpb3IgY2hhbmdlPwo+IFRoYW5rcwo+IAo+IAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
