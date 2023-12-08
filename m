Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01367C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzlsrowDv+nvLYr73mykEWnc3DAK5dMTc7dGFTslcgE=; b=Vkzly+5rzW5kg3
	yjM/H7GQze89OMr8UoVWgL8EcGOAAtizVTXgB6vdCI0GtoGubdVF1spcy5Q2zhdYkiB3A3nhHx5Ht
	wVbgi+91btIr15oD8aSkoeSvZnAWI/FUKGGcW3ooI7bgDcoJSv60zjqa5lyE5zdRsfjME8sg6dyMU
	ShvYCIkYTuk107js2t9mDWozV678hKIdPro/PU17OzKdp5EUDOTevpnkINDXQhWeetklB7iMtQsK3
	N36vOS5CdC+AnMFlr2LRjbUVVjBTwGLaN+gmllJqos82sNCAzcNqvp7lcn+LHA2YYaJrHQzPBDXW3
	H577kXhiUGsWzBypDrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBR7B-00EaPQ-0E;
	Fri, 08 Dec 2023 03:01:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBR76-00EaLg-1f
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 03:01:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8FB4581DC;
	Fri,  8 Dec 2023 11:00:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Dec
 2023 11:00:32 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Dec
 2023 11:00:31 +0800
Message-ID: <e1c362dc-8aac-4d13-9356-8b7ccae4727f@starfivetech.com>
Date: Fri, 8 Dec 2023 11:00:31 +0800
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
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
 <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_190116_848268_9BDE4DB7 
X-CRM114-Status: GOOD (  14.98  )
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

CgpPbiAyMDIzLzEyLzggODozNywgQW5keSBZYW4gd3JvdGU6Cj4gSGkgS2V0aO+8mgo+IAo+IAo+
IAo+IAo+IAo+IAo+IOWcqCAyMDIzLTEyLTA3IDE4OjQ4OjEz77yMIktlaXRoIFpoYW8iIDxrZWl0
aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IOWGmemBk++8mgo+Pgo+Pgo+Pk9uIDIwMjMvMTIvNyAx
NzowMiwgQW5keSBZYW4gd3JvdGU6Cj4+PiAKPj4+IAo+Pj4gCj4+PiAKPj4+IEhpIEtlaXRo77ya
Cj4+PiAKPj4+IAo+Pj4gCj4+PiAKPj4+IAo+Pj4gCj4+PiAKPj4+IAo+Pj4gCj4+PiAKPj4+IAo+
Pj4gQXQgMjAyMy0xMi0wNiAyMjoxMTozMywgIktlaXRoIFpoYW8iIDxrZWl0aC56aGFvQHN0YXJm
aXZldGVjaC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+Pk9uIDIwMjMvMTIvNiAyMDo1NiwgTWF4
aW1lIFJpcGFyZCB3cm90ZToKPj4+Pj4gT24gV2VkLCBEZWMgMDYsIDIwMjMgYXQgMDg6MDI6NTVQ
TSArMDgwMCwgS2VpdGggWmhhbyB3cm90ZToKPj4+Pj4+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBzdGFyZml2ZV9oZG1pX2R0X2lkc1tdID0gewo+Pj4+Pj4gPj4gKwl7IC5j
b21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1pbm5vLWhkbWkiLH0sCj4+Pj4+PiA+IAo+Pj4+
Pj4gPiBTbyBpdCdzIGlubm8gaGRtaSwganVzdCBsaWtlIFJvY2tjaGlwIHRoZW4/Cj4+Pj4+PiA+
IAo+Pj4+Pj4gPiBUaGlzIHNob3VsZCBiZSBhIGNvbW1vbiBkcml2ZXIuCj4+Pj4+Pgo+Pj4+Pj4g
Um9ja2NoaXAgaGFzIGEgaW5ubyBoZG1pIElQLiBhbmQgU3RhcmZpdmUgaGFzIGEgaW5ubyBoZG1p
IElQLgo+Pj4+Pj4gYnV0IHRoZSBoYXJld2F3cmUgZGlmZmVyZW5jZSBvZiB0aGVtIGlzIGJpZyAs
IGl0IGlzIG5vdCBlYXN5IHRvIHVzZSB0aGUgY29tbW9uIGRyaXZlcgo+Pj4+Pj4gbWF5YmUgaSBu
ZWVkIHRoZSBpbm5vIGhkbWkgdmVyc2lvbiBoZXJlIHRvIG1ha2UgYSBkaXN0aW5jdGlvbgo+Pj4+
PiAKPj4+Pj4gSSBqdXN0IGhhZCBhIGxvb2sgYXQgdGhlIHJvY2tjaGlwIGhlYWRlciBmaWxlOiBh
bGwgdGhlIHJlZ2lzdGVycyBidXQgdGhlCj4+Pj4+IFNUQVJGSVZFXyogb25lcyBhcmUgaWRlbnRp
Y2FsLgo+Pj4+PiAKPj4+Pj4gVGhlcmUncyBubyBuZWVkIHRvIGhhdmUgdHdvIGlkZW50aWNhbCBk
cml2ZXJzIHRoZW4sIHBsZWFzZSB1c2UgdGhlCj4+Pj4+IHJvY2tjaGlwIGRyaXZlciBpbnN0ZWFk
Lgo+Pj4+PiAKPj4+Pj4gTWF4aW1lCj4+Pj4KPj4+Pm9rLCBoYXZlIGEgc2ltcGxlIHRlc3QgLCBl
ZGlkIGNhbiBnZXQgLiBpIHdpbGwgY29udGludWUgCj4+PiAKPj4+IE1heWJlIHlvdSBjYW4gdGFr
ZSBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkgYXMgYSByZWZlcmVuY2Xv
vIwgdGhpcwo+Pj4gaXMgYWxzbyBhIGhkbWkgaXAgdXNlZCBieSByb2NrY2hpcC9tZXNvbi9zdW54
aS9qei9pbXjjgIIKPj4+IFdlIGZpbmFsbHkgbWFrZSBpdCBzaGFyZSBvbmUgZHJpdmVy44CCCj4+
Pj4KPj5oaSBBbmR5Ogo+Pgo+PmR3X2hkbWkgc2VlbXMgYSBnb29kIGNob2ljZSAsIGl0IGNhbiBo
YW5kbGUgaW5ubyBoZG1pIGhhcmR3YXJlIGJ5IGRlZmluZSBpdHMgZHdfaGRtaV9wbGF0X2RhdGEu
Cj4+ZG9lcyBpdCBtZWFucyBpIGNhbiB3cml0ZSBvd24gZHJpdmVyIGZpbGVzIHN1Y2ggYXMoZHdf
aGRtaS1zdGFyZml2ZS5jKSBiYXNlZCBvbiBkd19oZG1pIGluc3RlYWQgb2YgYWRkIHBsYXRfZGF0
YSBpbiBpbm5vX2hkbWkuYwo+Pgo+IAo+IEkgdGhpbmsgdGhlIHByb2Nlc3MgbWF5YmUgbGlrZSB0
aGlz77yaCj4gCj4gMS4gc3BsaXQgdGhlIGlubm9faGRtaS5jIHVuZGVyIHJvY2tjaGlwIHRvICBp
bm5vX2hkbWkuYyh0aGUgY29tbW9uIHBhcnQpLCBpbm5vX2hkbWktcm9ja2NoaXAuYyh0aGUgc29j
IHNwZWNpZmljIHBhcnQpCj4gMi4gbW92ZSB0aGUgY29tbW9uIHBhcnQgaW5ub19oZG1pLmMgdG8g
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi8KPiAzLiBhZGQgc3RhcnRmaXZlIHNw
ZWNpZmljIHBhcnQsIGlubm9faGRtaS1zdGFydGZpdmUuYwo+IAo+IGJlbGxvdyBnaXQgbG9nIGZy
b20ga2VybmVsIHRocmVlIHNob3cgaG93IHdlIGNvbnZlcnQgIGR3X2hkbWkgdG8gYSBjb21tb24g
ZHJpdmVyOiAKPiAKPiAKPiAKPiAxMmI5ZjIwNGU4MDQgZHJtOiBicmlkZ2UvZHdfaGRtaTogYWRk
IHJvY2tjaGlwIHJrMzI4OCBzdXBwb3J0Cj4gNzRhZjllNGQwM2I4IGR0LWJpbmRpbmdzOiBBZGQg
ZG9jdW1lbnRhdGlvbiBmb3Igcm9ja2NoaXAgZHcgaGRtaQo+IGQzNDZjMTRlZWVhOSBkcm06IGJy
aWRnZS9kd19oZG1pOiBhZGQgZnVuY3Rpb24gZHdfaGRtaV9waHlfZW5hYmxlX3NwYXJlCj4gYTRk
M2I4YjA1MGQ1IGRybTogYnJpZGdlL2R3X2hkbWk6IGNsZWFyIGkyY21waHlfc3RhdDAgcmVnIGlu
IGhkbWlfcGh5X3dhaXRfaTJjX2RvbmUKPiA2MzJkMDM1YmFjZTIgZHJtOiBicmlkZ2UvZHdfaGRt
aTogYWRkIG1vZGVfdmFsaWQgc3VwcG9ydAo+IDBjZDlkMTQyODMyMiBkcm06IGJyaWRnZS9kd19o
ZG1pOiBhZGQgc3VwcG9ydCBmb3IgbXVsdGktYnl0ZSByZWdpc3RlciB3aWR0aCBhY2Nlc3MKPiBj
ZDE1MjM5Mzk2N2UgZHQtYmluZGluZ3M6IGFkZCBkb2N1bWVudCBmb3IgZHdfaGRtaQo+IGIyMWY0
YjY1OGRmOCBkcm06IGlteDogaW14LWhkbWk6IG1vdmUgaW14LWhkbWkgdG8gYnJpZGdlL2R3X2hk
bWkKPiBhYWE3NTdhMDkyYzIgZHJtOiBpbXg6IGlteC1oZG1pOiBzcGxpdCBwaHkgY29uZmlndXJh
dGlvbiB0byBwbGF0Zm9ybSBkcml2ZXIKPiAzZDFiMzVhM2Q5ZjMgZHJtOiBpbXg6IGlteC1oZG1p
OiBjb252ZXJ0IGlteC1oZG1pIHRvIGRybV9icmlkZ2UgbW9kZQo+IGMyYzM4NDg4NTFhNyBkcm06
IGlteDogaW14LWhkbWk6IHJldHVybiBkZWZlciBpZiBjYW4ndCBnZXQgZGRjIGkyYyBhZGFwdGVy
Cj4gYjU4NzgzMzkzM2RlIGRybTogaW14OiBpbXgtaGRtaTogbWFrZSBjaGVja3BhdGNoIGhhcHB5
Cj4gCmhpIEFuZHk6CkkgZ290IHlvdSBtZWFucywgCmFzIEkgZG9uJ3QgaGF2ZSBhIHJvY2tjaGlw
IGJvYXJkIG9uIGhhbmQgLCB0byBzcGxpdCB0aGUgaW5ub19oZG1pLmMgY2FuIG5vdCBiZSB0ZXN0
ZWQuCgpob3cgYWRvdXQgdGhpcyBpZGVhOgox44CBc3BsaXQgdGhlIHN0YXJmaXZlX2hkbWkuYyB1
bmRlciB2ZXJpc2lsaWNpb24gdG8gIGlubm9faGRtaS5jKHRoZSBjb21tb24gcGFydCksIGlubm9f
aGRtaS1zdGFyZml2ZS5jKHRoZSBzb2Mgc3BlY2lmaWMgcGFydCkKMi4gbW92ZSB0aGUgY29tbW9u
IHBhcnQgaW5ub19oZG1pLmMgdG8gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi8K
My4gSW4gdGhlIGZ1dHVyZSwgaW5ubyBoZG1pLmMgdW5kZXIgcm9ja2NoaXAgd2lsbCByZXVzZSB0
aGUgcHVibGljIGRyaXZlci4KCj4gCj4+VGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCEhIQo+
Pgo+Pj4+Cj4+Pj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj5saW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4+Pj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cj4+Cj4+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj5saW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj5saW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
