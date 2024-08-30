Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0912CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzuKh77idsdYIXHdbGSgF0m8WDB1wRj4tTi0ts6oXjo=; b=mj9Tx0c1hNwEM1
	oIpNEzZIFSw+18nQjLFT2FgcMRSNaUpLKpXWtsEVA4ErU3EQ9G3V/SDKGKkeSj7BSoofRhnFjXJOa
	Xr63dsUG+o9tGb34NLYDOcMCPicDaB4olGKWgKldt2D9WLD4Xf1lsdKodrx01/14yPqk9wQpKNxe/
	X7RKPHuTOAfdGw0ALYLcVp2acrFO0w3RQWUmmbyV5cN1Mec8r5aN83MIVCr7ZoIKFanB0oipgXvxs
	HrlAtgRhLmZEb2KjAfxI5S6LjNs9ry6317T2u+CoNYPQIvPXgbmCYNG6vl4932nuz5rdlPMCNofsf
	PT/jklqYMsopCs0yXwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwgI-00000005FtZ-2UyM;
	Fri, 30 Aug 2024 08:08:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwel-00000005FLU-2ObY
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 08:06:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22928E0006;
	Fri, 30 Aug 2024 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725005211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxF8rfNjn5nCmRFRz11/s9asoMEsUtfey24NfljSmKo=;
	b=iAy8HvsncgpQxw1p4svMZrNYvxeghJA99J6Pf0OyfrFy30QQIN+G0cjItrfmC6ooFquIR/
	dvtkTvMMl2my2XhPIMh0K3PavJfsfyEFRLBNxDbOnIEmG0vUKE1qoks3ghF0yeTCOFodHg
	BpR5tIkr5JOYoD0OSC1u6SJ9HBli+ovrP4iVn+9t2d/Dxy7I/7I4jERnvTQX6Tje2rCEDa
	TKB54r1GQyvZ3dWSzXrFtYXGUas4bgdNDzGuejlFcl8Vd2jvMt75jMK+SImChI5r/X87oQ
	8CA1dax2jqUiCNn0KlMO68kkma5sYVbir3Iro/eRl8m6q4PvC7Myae+Z+waOzQ==
Message-ID: <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
Date: Fri, 30 Aug 2024 10:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
To: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
 <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
 <IA1PR20MB4953612773890B94FFD0C9EABB962@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822AC58BC43FDE03802E773FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <MA0P287MB2822AC58BC43FDE03802E773FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_010657_014881_E5538A53 
X-CRM114-Status: GOOD (  11.56  )
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

Pj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+Pj4gKy8q
Cj4+PiArICogQ29weXJpZ2h0IChDKSAyMDI0IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9u
bmVmaWxsZUBib290bGluLmNvbT4KPj4+ICsgKi8KPj4+ICsKPj4+ICsvZHRzLXYxLzsKPj4+ICsK
Pj4+ICsjaW5jbHVkZSAic2cyMDAyLmR0c2kiCj4+PiArCj4+PiArLyB7Cj4+PiArwqDCoMKgIG1v
ZGVsID0gIkxpY2hlZVJWIE5hbm8gQiI7Cj4+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAic2lwZWVk
LGxpY2hlZXJ2LW5hbm8tYiIsICJzaXBlZWQsbGljaGVlcnYtbmFubyIsIAo+Pj4gInNvcGhnbyxz
ZzIwMDIiOwo+Pj4gKwo+Pj4gK8KgwqDCoCBhbGlhc2VzIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBn
cGlvMCA9ICZncGlvMDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBncGlvMSA9ICZncGlvMTsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBncGlvMiA9ICZncGlvMjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBncGlvMyA9
ICZncGlvMzsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWwwID0gJnVhcnQwOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHNlcmlhbDEgPSAmdWFydDE7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc2VyaWFsMiA9
ICZ1YXJ0MjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWwzID0gJnVhcnQzOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHNlcmlhbDQgPSAmdWFydDQ7Cj4+PiArwqDCoMKgIH07Cj4+PiArCj4+PiArwqDC
oMKgIGNob3NlbiB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMDox
MTUyMDBuOCI7Cj4+PiArwqDCoMKgIH07Cj4+PiArfTsKPj4+ICsKPj4+ICsmb3NjIHsKPj4+ICvC
oMKgwqAgY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPj4+ICt9Owo+Pj4gKwo+Pj4gKyZz
ZGhjaTAgewo+Pj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+PiArwqDCoMKgIGJ1cy13aWR0
aCA9IDw0PjsKPj4+ICvCoMKgwqAgbm8tMS04LXY7Cj4+PiArwqDCoMKgIG5vLW1tYzsKPj4+ICvC
oMKgwqAgbm8tc2RpbzsKPj4+ICvCoMKgwqAgZGlzYWJsZS13cDsKPj4+ICt9Owo+Pj4gKwo+Pj4g
KyZ1YXJ0MCB7Cj4+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+ICt9Owo+Pj4gKwo+Pj4g
KyZ1YXJ0MSB7Cj4+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+ICt9Owo+Pj4gKwo+Pj4g
KyZpMmMwIHsKPj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK307Cj4+Pgo+Pj4gLS0g
Cj4+PiAyLjQ1LjIKPj4+Cj4+IEhhdmUgeW91IHRlc3QgeW91IHBhdGNoIHdpdGggYSByZWFsIGJv
YXJkPyBFc3BlY2lhbGx5Cj4+IGZvciBkZXZpY2UgInVhcnQxIiBhbmQgImkyYzAiLCBJIHN1c3Bl
Y3QgeW91cgo+PiBjb25maWd1YXJ0aW9uIGRvZXMgbm90IHdvcmsgYnkgZGVmYXVsdC4KPiAKPiBI
aSwgVGhvbWFzIEJvbm5lZmlsbGUsCj4gCj4gQ2FuIHlvdSBwbGVhc2UgZG91YmxlIGNoZWNrIGFu
ZCBmZWVkYmFjaywgSSB3YW50IHRvIGNvbmZpcm0gdGhpcyBiZWZvcmUgCj4gYWNraW5nIHRoaXMg
Y2hhbmdlLgo+IAo+IEFzIHlvdSBrbm93LCByYzYgd2lsbCBjb21lIG5leHQgd2VlayBhbmQgSSdt
IHBsYW5uaW5nIGEgcHIgbmV4dCB3ZWVrLgo+IAo+IFJlZ2FyZHMsCj4gCj4gQ2hlbgo+IApIZWxs
byBDaGVuIGFuZCBJbm9jaGksCgpJJ20gcmVhbGx5IHNvcnJ5LCBpbmRlZWQsIHRob3NlIG5vZGVz
IGNlcnRhaW5seSBkb24ndCB3b3JrLCBpdCB3YXMgYSAKbWlzdGFrZSBvbiBteSBzaWRlIGludHJv
ZHVjZWQgYmV0d2VlbiB2MSBhbmQgdjIuCkhvd2V2ZXIsIEkgY2FuIGVuc3VyZSB0aGF0ICJ1YXJ0
MCIgYW5kICJzZGhjaTAiIGFyZSB3b3JraW5nIGZpbmUuCk1heSBJIHN1Z2dlc3QgdG8gcmVtb3Zl
IHRob3NlIHR3byBub2Rlcz8gSSBjYW4gc2VuZCBhIG5ldyBpdGVyYXRpb24gaWYgCml0J3MgZWFz
aWVyIGZvciB5b3UgdG8gaGFuZGxlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
