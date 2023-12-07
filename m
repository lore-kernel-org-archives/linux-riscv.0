Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ABFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmCpxWyJkblciA/ZZmqJGPtpVZNSWPl0itwLVmz+tuM=; b=0PZLYKizI0M33q
	rg74xTbDvw1Tsg54Lqq8UZ3MkwCAyyx4w2okhAlVxFXSs+SZqS2DyEKwAQRg+vo5jdgDu3MSD1WP6
	TVi52Ke2J1UViMjSEz5/sudhkA8NlLvVnnI8Eh0AcCE4vg/bNxzaoj1Xbz+3Kz9Pz3u6IP/ROCM2i
	pFlKxxnTCk9JOOOvO9Pfk4Di/A3JH0CjDy2txEMt5BrlTVuk8OjP6+ZtrldxAsqFmDl7hNMkHHKOl
	aXg2hysTc0OMqjNdLKm+hJx1oxnkby9c0Ji3oXY5wQ07XAi+gyNv8l6W/qDpHQvI/Jf347lMPU842
	UaJLC/ti8yuaUYERdPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBBwH-00CVhB-27;
	Thu, 07 Dec 2023 10:49:05 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBBwD-00CVf3-0K
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 10:49:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 335198062;
	Thu,  7 Dec 2023 18:48:18 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 18:48:15 +0800
Received: from [192.168.60.132] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 18:48:16 +0800
Message-ID: <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
Date: Thu, 7 Dec 2023 18:48:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Content-Language: en-US
To: Andy Yan <andyshrk@163.com>
CC: Maxime Ripard <mripard@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Shengyang Chen <shengyang.chen@starfivetech.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "suijingfeng@loongson.cn"
	<suijingfeng@loongson.cn>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_024901_424175_F3D91EE5 
X-CRM114-Status: GOOD (  12.64  )
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

CgpPbiAyMDIzLzEyLzcgMTc6MDIsIEFuZHkgWWFuIHdyb3RlOgo+IAo+IAo+IAo+IAo+IEhpIEtl
aXRo77yaCj4gCj4gCj4gCj4gCj4gCj4gCj4gCj4gCj4gCj4gCj4gCj4gQXQgMjAyMy0xMi0wNiAy
MjoxMTozMywgIktlaXRoIFpoYW8iIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IHdyb3Rl
Ogo+Pgo+Pgo+Pk9uIDIwMjMvMTIvNiAyMDo1NiwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+IE9u
IFdlZCwgRGVjIDA2LCAyMDIzIGF0IDA4OjAyOjU1UE0gKzA4MDAsIEtlaXRoIFpoYW8gd3JvdGU6
Cj4+Pj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0YXJmaXZlX2hkbWlf
ZHRfaWRzW10gPSB7Cj4+Pj4gPj4gKwl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1p
bm5vLWhkbWkiLH0sCj4+Pj4gPiAKPj4+PiA+IFNvIGl0J3MgaW5ubyBoZG1pLCBqdXN0IGxpa2Ug
Um9ja2NoaXAgdGhlbj8KPj4+PiA+IAo+Pj4+ID4gVGhpcyBzaG91bGQgYmUgYSBjb21tb24gZHJp
dmVyLgo+Pj4+Cj4+Pj4gUm9ja2NoaXAgaGFzIGEgaW5ubyBoZG1pIElQLiBhbmQgU3RhcmZpdmUg
aGFzIGEgaW5ubyBoZG1pIElQLgo+Pj4+IGJ1dCB0aGUgaGFyZXdhd3JlIGRpZmZlcmVuY2Ugb2Yg
dGhlbSBpcyBiaWcgLCBpdCBpcyBub3QgZWFzeSB0byB1c2UgdGhlIGNvbW1vbiBkcml2ZXIKPj4+
PiBtYXliZSBpIG5lZWQgdGhlIGlubm8gaGRtaSB2ZXJzaW9uIGhlcmUgdG8gbWFrZSBhIGRpc3Rp
bmN0aW9uCj4+PiAKPj4+IEkganVzdCBoYWQgYSBsb29rIGF0IHRoZSByb2NrY2hpcCBoZWFkZXIg
ZmlsZTogYWxsIHRoZSByZWdpc3RlcnMgYnV0IHRoZQo+Pj4gU1RBUkZJVkVfKiBvbmVzIGFyZSBp
ZGVudGljYWwuCj4+PiAKPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBoYXZlIHR3byBpZGVudGljYWwg
ZHJpdmVycyB0aGVuLCBwbGVhc2UgdXNlIHRoZQo+Pj4gcm9ja2NoaXAgZHJpdmVyIGluc3RlYWQu
Cj4+PiAKPj4+IE1heGltZQo+Pgo+Pm9rLCBoYXZlIGEgc2ltcGxlIHRlc3QgLCBlZGlkIGNhbiBn
ZXQgLiBpIHdpbGwgY29udGludWUgCj4gCj4gTWF5YmUgeW91IGNhbiB0YWtlIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaSBhcyBhIHJlZmVyZW5jZe+8jCB0aGlzCj4gaXMg
YWxzbyBhIGhkbWkgaXAgdXNlZCBieSByb2NrY2hpcC9tZXNvbi9zdW54aS9qei9pbXjjgIIKPiBX
ZSBmaW5hbGx5IG1ha2UgaXQgc2hhcmUgb25lIGRyaXZlcuOAggo+PgpoaSBBbmR5OgoKZHdfaGRt
aSBzZWVtcyBhIGdvb2QgY2hvaWNlICwgaXQgY2FuIGhhbmRsZSBpbm5vIGhkbWkgaGFyZHdhcmUg
YnkgZGVmaW5lIGl0cyBkd19oZG1pX3BsYXRfZGF0YS4KZG9lcyBpdCBtZWFucyBpIGNhbiB3cml0
ZSBvd24gZHJpdmVyIGZpbGVzIHN1Y2ggYXMoZHdfaGRtaS1zdGFyZml2ZS5jKSBiYXNlZCBvbiBk
d19oZG1pIGluc3RlYWQgb2YgYWRkIHBsYXRfZGF0YSBpbiBpbm5vX2hkbWkuYwoKVGhhbmtzIGZv
ciBwb2ludGluZyB0aGlzIG91dCEhIQoKPj4KPj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
