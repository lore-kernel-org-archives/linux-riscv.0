Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2E5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO6eJ5Nu4ZLq5kAsKORdqDS+reMgZy81+ryaRD4q720=; b=paWztiGFrUYyK6
	LajR8ILUyeo3lsartzFspm8hXsImx0uYgI6mB3XJCAQi+tzyfhaa79nyb/HyQskzULI3epedNwCtb
	0NcAfPqui1/8/wD3yO6QdHv889JT5qSk8rDmgR0keG8FdIZFlKvZt31auO+iYvtMN1eP7UmcKHcfm
	SQK1IgOuuG4h7J15Dj/WcpJGNz1LVniIJu+wi4gFfVoQDQylx+cRrwGVBGZbsCnGT1jr4Nd0WLKPB
	RTmS5b3CXI+vHHA4h0KED6T/6jL39Ue7iqMrzAfA0UsjUynjW4SQsjBC40USlBmFkyAsZ2YZbzYJH
	Wwb7Dn25OoJVzVYDlGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDEFc-00DL0h-1K;
	Wed, 13 Dec 2023 01:41:28 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDEFW-00DKyH-1M
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 01:41:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 01BF07FF9;
	Wed, 13 Dec 2023 09:40:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 09:40:31 +0800
Received: from [192.168.60.110] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 09:40:31 +0800
Message-ID: <10e2ab3c-950f-4a1c-8806-74e5bba2c24a@starfivetech.com>
Date: Wed, 13 Dec 2023 09:40:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
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
References: <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
 <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
 <e1c362dc-8aac-4d13-9356-8b7ccae4727f@starfivetech.com>
 <5a79a4b9.1bd7.18c4773c1ea.Coremail.andyshrk@163.com>
 <xevxqusbizjfs4qt5rufhntd3vd656o2smocvivvulzceh3aeu@uuihphhat5wi>
 <2dc5ea49-9a5f-484a-98dc-1b35b79d0945@starfivetech.com>
 <6f7acc9d.5648.18c58cba9be.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <6f7acc9d.5648.18c58cba9be.Coremail.andyshrk@163.com>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_174122_748690_7DD7707E 
X-CRM114-Status: GOOD (  20.13  )
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

CgpPbiAyMDIzLzEyLzExIDIwOjEzLCBBbmR5IFlhbiB3cm90ZToKPiBIaSBLZWl0aO+8mgo+IAo+
IOWcqCAyMDIzLTEyLTExIDE4OjI0OjM177yMIktlaXRoIFpoYW8iIDxrZWl0aC56aGFvQHN0YXJm
aXZldGVjaC5jb20+IOWGmemBk++8mgo+PmhpIE1heGltZToKPj5oaSBBbmR5Ogo+Pgo+Pk9uIDIw
MjMvMTIvOCAxNzoxNCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+IEhpLAo+Pj4gCj4+PiBPbiBG
cmksIERlYyAwOCwgMjAyMyBhdCAxMToyMzozN0FNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4+
PiDlnKggMjAyMy0xMi0wOCAxMTowMDozMe+8jCJLZWl0aCBaaGFvIiA8a2VpdGguemhhb0BzdGFy
Zml2ZXRlY2guY29tPiDlhpnpgZPvvJoKPj4+PiA+Cj4+Pj4gPgo+Pj4+ID5PbiAyMDIzLzEyLzgg
ODozNywgQW5keSBZYW4gd3JvdGU6Cj4+Pj4gPj4gSGkgS2V0aO+8mgo+Pj4+ID4+IAo+Pj4+ID4+
IAo+Pj4+ID4+IAo+Pj4+ID4+IAo+Pj4+ID4+IAo+Pj4+ID4+IAo+Pj4+ID4+IOWcqCAyMDIzLTEy
LTA3IDE4OjQ4OjEz77yMIktlaXRoIFpoYW8iIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+
IOWGmemBk++8mgo+Pj4+ID4+Pgo+Pj4+ID4+Pgo+Pj4+ID4+Pk9uIDIwMjMvMTIvNyAxNzowMiwg
QW5keSBZYW4gd3JvdGU6Cj4+Pj4gPj4+PiAKPj4+PiA+Pj4+IAo+Pj4+ID4+Pj4gCj4+Pj4gPj4+
PiAKPj4+PiA+Pj4+IEhpIEtlaXRo77yaCj4+Pj4gPj4+PiAKPj4+PiA+Pj4+IAo+Pj4+ID4+Pj4g
Cj4+Pj4gPj4+PiAKPj4+PiA+Pj4+IAo+Pj4+ID4+Pj4gCj4+Pj4gPj4+PiAKPj4+PiA+Pj4+IAo+
Pj4+ID4+Pj4gCj4+Pj4gPj4+PiAKPj4+PiA+Pj4+IAo+Pj4+ID4+Pj4gQXQgMjAyMy0xMi0wNiAy
MjoxMTozMywgIktlaXRoIFpoYW8iIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IHdyb3Rl
Ogo+Pj4+ID4+Pj4+Cj4+Pj4gPj4+Pj4KPj4+PiA+Pj4+Pk9uIDIwMjMvMTIvNiAyMDo1NiwgTWF4
aW1lIFJpcGFyZCB3cm90ZToKPj4+PiA+Pj4+Pj4gT24gV2VkLCBEZWMgMDYsIDIwMjMgYXQgMDg6
MDI6NTVQTSArMDgwMCwgS2VpdGggWmhhbyB3cm90ZToKPj4+PiA+Pj4+Pj4+ID4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFyZml2ZV9oZG1pX2R0X2lkc1tdID0gewo+Pj4+
ID4+Pj4+Pj4gPj4gKwl7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1pbm5vLWhkbWki
LH0sCj4+Pj4gPj4+Pj4+PiA+IAo+Pj4+ID4+Pj4+Pj4gPiBTbyBpdCdzIGlubm8gaGRtaSwganVz
dCBsaWtlIFJvY2tjaGlwIHRoZW4/Cj4+Pj4gPj4+Pj4+PiA+IAo+Pj4+ID4+Pj4+Pj4gPiBUaGlz
IHNob3VsZCBiZSBhIGNvbW1vbiBkcml2ZXIuCj4+Pj4gPj4+Pj4+Pgo+Pj4+ID4+Pj4+Pj4gUm9j
a2NoaXAgaGFzIGEgaW5ubyBoZG1pIElQLiBhbmQgU3RhcmZpdmUgaGFzIGEgaW5ubyBoZG1pIElQ
Lgo+Pj4+ID4+Pj4+Pj4gYnV0IHRoZSBoYXJld2F3cmUgZGlmZmVyZW5jZSBvZiB0aGVtIGlzIGJp
ZyAsIGl0IGlzIG5vdCBlYXN5IHRvIHVzZSB0aGUgY29tbW9uIGRyaXZlcgo+Pj4+ID4+Pj4+Pj4g
bWF5YmUgaSBuZWVkIHRoZSBpbm5vIGhkbWkgdmVyc2lvbiBoZXJlIHRvIG1ha2UgYSBkaXN0aW5j
dGlvbgo+Pj4+ID4+Pj4+PiAKPj4+PiA+Pj4+Pj4gSSBqdXN0IGhhZCBhIGxvb2sgYXQgdGhlIHJv
Y2tjaGlwIGhlYWRlciBmaWxlOiBhbGwgdGhlIHJlZ2lzdGVycyBidXQgdGhlCj4+Pj4gPj4+Pj4+
IFNUQVJGSVZFXyogb25lcyBhcmUgaWRlbnRpY2FsLgo+Pj4+ID4+Pj4+PiAKPj4+PiA+Pj4+Pj4g
VGhlcmUncyBubyBuZWVkIHRvIGhhdmUgdHdvIGlkZW50aWNhbCBkcml2ZXJzIHRoZW4sIHBsZWFz
ZSB1c2UgdGhlCj4+Pj4gPj4+Pj4+IHJvY2tjaGlwIGRyaXZlciBpbnN0ZWFkLgo+Pj4+ID4+Pj4+
PiAKPj4+PiA+Pj4+Pj4gTWF4aW1lCj4+Pj4gPj4+Pj4KPj4+PiA+Pj4+Pm9rLCBoYXZlIGEgc2lt
cGxlIHRlc3QgLCBlZGlkIGNhbiBnZXQgLiBpIHdpbGwgY29udGludWUgCj4+Pj4gPj4+PiAKPj4+
PiA+Pj4+IE1heWJlIHlvdSBjYW4gdGFrZSBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkgYXMgYSByZWZlcmVuY2XvvIwgdGhpcwo+Pj4+ID4+Pj4gaXMgYWxzbyBhIGhkbWkg
aXAgdXNlZCBieSByb2NrY2hpcC9tZXNvbi9zdW54aS9qei9pbXjjgIIKPj4+PiA+Pj4+IFdlIGZp
bmFsbHkgbWFrZSBpdCBzaGFyZSBvbmUgZHJpdmVy44CCCj4+Pj4gPj4+Pj4KPj4+PiA+Pj5oaSBB
bmR5Ogo+Pj4+ID4+Pgo+Pj4+ID4+PmR3X2hkbWkgc2VlbXMgYSBnb29kIGNob2ljZSAsIGl0IGNh
biBoYW5kbGUgaW5ubyBoZG1pIGhhcmR3YXJlIGJ5IGRlZmluZSBpdHMgZHdfaGRtaV9wbGF0X2Rh
dGEuCj4+Pj4gPj4+ZG9lcyBpdCBtZWFucyBpIGNhbiB3cml0ZSBvd24gZHJpdmVyIGZpbGVzIHN1
Y2ggYXMoZHdfaGRtaS1zdGFyZml2ZS5jKSBiYXNlZCBvbiBkd19oZG1pIGluc3RlYWQgb2YgYWRk
IHBsYXRfZGF0YSBpbiBpbm5vX2hkbWkuYwo+Pj4+ID4+Pgo+Pj4+ID4+IAo+Pj4+ID4+IEkgdGhp
bmsgdGhlIHByb2Nlc3MgbWF5YmUgbGlrZSB0aGlz77yaCj4+Pj4gPj4gCj4+Pj4gPj4gMS4gc3Bs
aXQgdGhlIGlubm9faGRtaS5jIHVuZGVyIHJvY2tjaGlwIHRvICBpbm5vX2hkbWkuYyh0aGUgY29t
bW9uIHBhcnQpLCBpbm5vX2hkbWktcm9ja2NoaXAuYyh0aGUgc29jIHNwZWNpZmljIHBhcnQpCj4+
Pj4gPj4gMi4gbW92ZSB0aGUgY29tbW9uIHBhcnQgaW5ub19oZG1pLmMgdG8gZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi8KPj4+PiA+PiAzLiBhZGQgc3RhcnRmaXZlIHNwZWNpZmlj
IHBhcnQsIGlubm9faGRtaS1zdGFydGZpdmUuYwo+Pj4+ID4+IAo+Pj4+ID4+IGJlbGxvdyBnaXQg
bG9nIGZyb20ga2VybmVsIHRocmVlIHNob3cgaG93IHdlIGNvbnZlcnQgIGR3X2hkbWkgdG8gYSBj
b21tb24gZHJpdmVyOiAKPj4+PiA+PiAKPj4+PiA+PiAKPj4+PiA+PiAKPj4+PiA+PiAxMmI5ZjIw
NGU4MDQgZHJtOiBicmlkZ2UvZHdfaGRtaTogYWRkIHJvY2tjaGlwIHJrMzI4OCBzdXBwb3J0Cj4+
Pj4gPj4gNzRhZjllNGQwM2I4IGR0LWJpbmRpbmdzOiBBZGQgZG9jdW1lbnRhdGlvbiBmb3Igcm9j
a2NoaXAgZHcgaGRtaQo+Pj4+ID4+IGQzNDZjMTRlZWVhOSBkcm06IGJyaWRnZS9kd19oZG1pOiBh
ZGQgZnVuY3Rpb24gZHdfaGRtaV9waHlfZW5hYmxlX3NwYXJlCj4+Pj4gPj4gYTRkM2I4YjA1MGQ1
IGRybTogYnJpZGdlL2R3X2hkbWk6IGNsZWFyIGkyY21waHlfc3RhdDAgcmVnIGluIGhkbWlfcGh5
X3dhaXRfaTJjX2RvbmUKPj4+PiA+PiA2MzJkMDM1YmFjZTIgZHJtOiBicmlkZ2UvZHdfaGRtaTog
YWRkIG1vZGVfdmFsaWQgc3VwcG9ydAo+Pj4+ID4+IDBjZDlkMTQyODMyMiBkcm06IGJyaWRnZS9k
d19oZG1pOiBhZGQgc3VwcG9ydCBmb3IgbXVsdGktYnl0ZSByZWdpc3RlciB3aWR0aCBhY2Nlc3MK
Pj4+PiA+PiBjZDE1MjM5Mzk2N2UgZHQtYmluZGluZ3M6IGFkZCBkb2N1bWVudCBmb3IgZHdfaGRt
aQo+Pj4+ID4+IGIyMWY0YjY1OGRmOCBkcm06IGlteDogaW14LWhkbWk6IG1vdmUgaW14LWhkbWkg
dG8gYnJpZGdlL2R3X2hkbWkKPj4+PiA+PiBhYWE3NTdhMDkyYzIgZHJtOiBpbXg6IGlteC1oZG1p
OiBzcGxpdCBwaHkgY29uZmlndXJhdGlvbiB0byBwbGF0Zm9ybSBkcml2ZXIKPj4+PiA+PiAzZDFi
MzVhM2Q5ZjMgZHJtOiBpbXg6IGlteC1oZG1pOiBjb252ZXJ0IGlteC1oZG1pIHRvIGRybV9icmlk
Z2UgbW9kZQo+Pj4+ID4+IGMyYzM4NDg4NTFhNyBkcm06IGlteDogaW14LWhkbWk6IHJldHVybiBk
ZWZlciBpZiBjYW4ndCBnZXQgZGRjIGkyYyBhZGFwdGVyCj4+Pj4gPj4gYjU4NzgzMzkzM2RlIGRy
bTogaW14OiBpbXgtaGRtaTogbWFrZSBjaGVja3BhdGNoIGhhcHB5Cj4+Pj4gPj4gCj4+Pj4gPmhp
IEFuZHk6Cj4+Pj4gPkkgZ290IHlvdSBtZWFucywgCj4+Pj4gPmFzIEkgZG9uJ3QgaGF2ZSBhIHJv
Y2tjaGlwIGJvYXJkIG9uIGhhbmQgLCB0byBzcGxpdCB0aGUgaW5ub19oZG1pLmMgY2FuIG5vdCBi
ZSB0ZXN0ZWQuCj4+Pj4gPgo+Pj4+ID5ob3cgYWRvdXQgdGhpcyBpZGVhOgo+Pj4+ID4x44CBc3Bs
aXQgdGhlIHN0YXJmaXZlX2hkbWkuYyB1bmRlciB2ZXJpc2lsaWNpb24gdG8gIGlubm9faGRtaS5j
KHRoZSBjb21tb24gcGFydCksIGlubm9faGRtaS1zdGFyZml2ZS5jKHRoZSBzb2Mgc3BlY2lmaWMg
cGFydCkKPj4+PiA+Mi4gbW92ZSB0aGUgY29tbW9uIHBhcnQgaW5ub19oZG1pLmMgdG8gZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi8KPj4+PiA+My4gSW4gdGhlIGZ1dHVyZSwgaW5u
byBoZG1pLmMgdW5kZXIgcm9ja2NoaXAgd2lsbCByZXVzZSB0aGUgcHVibGljIGRyaXZlci4KPj4+
PiAKPj4+PiBJIGFtIG5vdCBzdXJlIGlmIGRybSBtYWludGFpbmVycyBhcmUgaGFwcHkgd2l0aCB0
aGlz44CCCj4+PiAKPj4+IE5vdCByZWFsbHksIG5vLgo+Pj4gCj4+PiBCZWNhdXNlIHdlIHdvdWxk
IHN0aWxsIGhhdmUgdHdvIGRyaXZlcnMgZm9yIHRoZSBzYW1lIGNvbnRyb2xsZXIsIGFuZCBhCj4+
PiBjb21tb24gb25lIHRoYXQgaGF2ZW4ndCByZWFsbHkgYmVlbiB0ZXN0ZWQgb24gYW55dGhpbmcg
YnV0IGEgc2luZ2xlCj4+PiBwbGF0Zm9ybS4gU28gYXJndWFibHkgYSB3b3JzZSBzaXR1YXRpb24g
dGhhbiB3aGF0IHlvdSB3ZXJlIHN1Z2dlc3RpbmcgaW4KPj4+IHRoZSBmaXJzdCBwbGFjZS4KPj4+
IAo+Pj4gVGhlIGJlc3Qgc29sdXRpb24gd291bGQgYmUgdG8gZmluZCBzb21lb25lIHdpdGggYSBS
b2NrY2hpcCBib2FyZCB0byB0ZXN0Cj4+PiB5b3VyIGNoYW5nZXMsIG9yIHRvIGdldCBvbmUgaWYg
aXQncyBkb2FibGUgc28geW91IGNhbiB0ZXN0IHlvdXJzZWxmLgo+Pgo+Pm9rIEkgd2lsbCBhbHNv
IHRyeSB0byBidXkgYSBSb2NrY2hpcCAzMDM2IGJvYXJkIGZvciBzZWxmLXRlc3QuCj4+QWNjb3Jk
aW5nIHRvIHRoZSBjb21taXQgbG9nIGlkZWEgcHJvdmlkZWQgYnkgQW5keSBiZWZvcmUsIG1ha2Ug
dGhlIGlubm9faGRtaSBkcml2ZXIgY29tbW9uIG1vZHVsZS4KPiAKPiBJIGZpbmFsbHkgIG1ha2Ug
bXkgcmszMDM2IGJhc2VkIGt5bGluIGJvYXJkIGJvb3R1cCDvvIh1c2UgYSBsaW51eCA0LjQgZG93
bnN0cmVhbSBic3DvvIxJIHdpbGwgZmluZCB0aW1lIHRvIHRyeSBib290Cj4gaXQgd2l0aCBtYWlu
bGluZe+8ieOAgiBTbyBJIGNhbiBoZWxwIGRvIHRoZSB0ZXN0IGZvciByb2NrY2hpcCBzaWRl44CC
Cj4gCj4gSXQgc2VlbXMgbm90IHRoYXQgZWFzeSB0byBidXkgYSByazMwMzYgYmFzZWQgYm9hcmQg
ZnJvbSBtYXJrZXQgbm9344CCCmVuLCBUaGUgb25saW5lIHN0b3JlIHNlZW1zIHRvIGhhdmUgc3Rv
cHBlZCBzZWxsaW5nIHJrMzAzNiAKcmVhbGx5IG5vdCBlYXN5IHRvIGJ1eSBvbmUgLCBJIHdyaXRl
IHRoZSBjb2RlIGZpcnN0ICwgbmVlZCBoZWxwIHRlc3RpbmcgcmszMDM2IGluIHRoZSBmdXR1cmUu
Cgp0aGFua3MKPiAKPj4KPj53b3VsZCB0aGUgc3RlcHMgYmUgb2s/IChpZiBJIHRlc3RlZCByb2Nr
Y2hpcCBhbmQgc3RhcmlmdmUgcGFzcykKPj4xLiBzcGxpdCB0aGUgaW5ub19oZG1pLmMgdW5kZXIg
cm9ja2NoaXAgdG8gIGlubm9faGRtaS5jKHRoZSBjb21tb24gcGFydCksIGlubm9faGRtaS1yb2Nr
Y2hpcC5jKHRoZSBzb2Mgc3BlY2lmaWMgcGFydCkKPj4yLiBtb3ZlIHRoZSBjb21tb24gcGFydCBp
bm5vX2hkbWkuYyB0byBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm9zaWxpY29uLwo+PjMuIGFk
ZCBzdGFydGZpdmUgc3BlY2lmaWMgcGFydCwgaW5ub19oZG1pLXN0YXJ0Zml2ZS5jCj4+Cj4+VGhh
bmtzCj4+PiAKPj4+IE1heGltZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
