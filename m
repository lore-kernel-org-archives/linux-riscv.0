Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52051C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RReDorRhIWI9jMa9JICpfKdtRY6s9OiRsIT3ml6QBg=; b=KL35YQa6KO114x
	Bf/oFaGkZbgRehqcZLYLpmjktsZsQSK4sdT1S/HqPBv92hzhla4eCQTnwG5xFgMkUqFZQ1B4Kbsfv
	xxm3RakXhvA6XNo1iXPf+aKsMkNMgfHotUwm+2uCS/AdvEp3SrXPwzugYymcc0ilo+0s3XbKd4x6y
	ey+PoPnLz+6DeeNvwkKw5FqbJBsdihddgwH6olCoWNdKnmUenWfF74Tov6OlOVL7oFQhqGbTIo/5Q
	b6N2vZlB+NLbCIiLuP+rLzR0HI0z4U51j1AcO5Rvf8BQdKfPFFd3SXvk6nd7iwysyx0OqX5rQ38oU
	99oUU+qMMgPztS0tsvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3URC-00000006EHQ-0EZY;
	Mon, 07 Sep 2026 08:10:46 +0000
Received: from mail-m1602365242.xmail.ntesmail.com ([160.236.52.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UR3-00000006EER-1clJ;
	Mon, 07 Sep 2026 08:10:40 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ccabc703;
	Mon, 7 Sep 2026 16:10:29 +0800 (GMT+08:00)
Message-ID: <745c232e-d2ff-4d32-b997-55d4d37a39fa@rock-chips.com>
Date: Mon, 7 Sep 2026 16:10:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Icenowy Zheng <uwu@icenowy.me>, Maud Spierings
 <maud_spierings@murena.io>, Dominique Belhachemi <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org,
 sboyd@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
 <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
 <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
 <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
 <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
 <72f82ae67eca7b5a594d86852c8b0dafb7d02c4c.camel@icenowy.me>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <72f82ae67eca7b5a594d86852c8b0dafb7d02c4c.camel@icenowy.me>
X-HM-Tid: 0aa07aeb328603a7kunma6aa1bc239fa0d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkIdVk9ITEtLGh4eHU5PHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=R9o5yi+G+F8zZyawx3whCVV/olFPrerxkAmSHzyaoP+qbbbFH+YbmhSzuasWco4g2ROixc1HaVg3Nk57qQfVWoyw147x+rkDDlxVI/S0hnMtjX9juxpUqfyv6S//I3qqIuaSa56RUA+YvW7x4fEuPAtkPm8AgKLXPFAQYdGtlmY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PAs6cpRutX6Xy3xUaS1PXdj4b2ODwk4xwVldcIzzW7w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_011038_052982_7395D5A1 
X-CRM114-Status: GOOD (  19.59  )
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

SGVsbG8gSWNlbm93eSwgTWF1ZCwgRG9taW5pcXVlLAoKT24gOS83LzIwMjYgMjo1NSBQTSwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNi0wOS0wN+S4gOeahCAwODowMiArMDIwMO+8jE1h
dWQgU3BpZXJpbmdz5YaZ6YGT77yaCj4+IEhpIERvbWluaXF1ZSBhbmQgSWNlbm93eSwKPj4KPj4g
T24gOS83LzI2IDA2OjAxLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4g5ZyoIDIwMjYtMDktMDbm
l6XnmoQgMTc6MTYgLTA0MDDvvIxEb21pbmlxdWUgQmVsaGFjaGVtaeWGmemBk++8mgo+Pj4+IE9u
IFN1biwgU2VwIDYsIDIwMjYgYXQgMTE6MTnigK9BTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPj4+PiB3cm90ZToKPj4+Pj4KPj4+Pj4g5ZyoIDIwMjYtMDktMDbml6XnmoQgMTY6NTkg
KzAyMDDvvIxNYXVkIFNwaWVyaW5nc+WGmemBk++8mgo+Pj4+Pj4gT24gOS82LzI2IDA3OjM5LCBE
b21pbmlxdWUgQmVsaGFjaGVtaSB3cm90ZToKPj4+Pj4+PiBPbiBTdW4sIEF1ZyAzMCwgMjAyNiBh
dCAxMDoxN+KAr0FNIE1hdWQgU3BpZXJpbmdzCj4+Pj4+Pj4gPAo+Pj4+Pj4+IG1hdWRfc3BpZXJp
bmdzQG11cmVuYS5pb8KgPG1haWx0bzptYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+Pgo+Pj4+Pj4+
IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gwqDCoMKgwqAgSSB3YXMgc3RpbGwgaGF2aW5nIHNvbWUg
Z2xpdGNoaW5nIGhhcHBlbmluZyBvbiB0aGUKPj4+Pj4+PiBkaXNwbGF5LAo+Pj4+Pj4+IGJ1dAo+
Pj4+Pj4+IEkndmUKPj4+Pj4+PiDCoMKgwqDCoCBmb3VuZCB0aGUgd2F5IHRvIGZpeCB0aGF0LCB0
aGUgcXVlc3Rpb24gaXMgd2hhdCBpcwo+Pj4+Pj4+IGFjdHVhbGx5Cj4+Pj4+Pj4gwqDCoMKgwqAg
aGFwcGVuaW5nIGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIDB4Mjk1OTAw
MjAgPC0gMHgwMDAwMDAwNQo+Pj4+Pj4+IMKgwqDCoMKgIFRoaXMgb25lIEkgaGF2ZSBubyBpZGVh
LCBpdCBpcyAweDAwMDAwMDA5IHdpdGggdGhpcwo+Pj4+Pj4+IHBhdGNoCj4+Pj4+Pj4gc2VyaWVz
IGJ1dAo+Pj4+Pj4+IMKgwqDCoMKgIHdpdGggdGhlIHZlbmRvciBrZXJuZWwgSSBnZXQgdGhlIHZh
bHVlIGFib3ZlLiBXaGVuIEkKPj4+Pj4+PiBob29rCj4+Pj4+Pj4gdXAgbXkKPj4+Pj4+PiDCoMKg
wqDCoCBleHRlcm5hbAo+Pj4+Pj4+IMKgwqDCoMKgIGRpc3BsYXkgKHJlZ3VsYXIgMTQ0MHApIHRo
aXMgYmVjb21lcyAweDAwMDAwMDBEIG9uIHRoZQo+Pj4+Pj4+IHZlbmRvcgo+Pj4+Pj4+IGtlcm5l
bC4KPj4+Pj4+Pgo+Pj4+Pj4+IMKgwqDCoMKgIEJ1dCBJIGNhbid0IGZpbmQgdGhpcyByZWdpc3Rl
ciBiZWluZyB3cml0dGVuIHRvCj4+Pj4+Pj4gYW55d2hlcmUKPj4+Pj4+PiB0aGVyZT8KPj4+Pj4+
Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gTWF5YmUgdGhpcyBuZWVkcyB0byBiZSBzd2FwcGVkPwo+Pj4+Pj4+
Cj4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+Pj4+Pj4+IMKgwqDC
oCAtI2RlZmluZSB2X0hTWU5DX1BPTEFSSVRZKG4pwqDCoMKgwqDCoMKgwqDCoMKgICgobikgPDwg
MykKPj4+Pj4+PiDCoMKgwqAgLSNkZWZpbmUgdl9WU1lOQ19QT0xBUklUWShuKcKgwqDCoMKgwqDC
oMKgwqDCoCAoKG4pIDw8IDIpCj4+Pj4+Pj4gwqDCoMKgICsjZGVmaW5lIHZfSFNZTkNfUE9MQVJJ
VFkobinCoMKgwqDCoMKgwqDCoMKgwqAgKChuKSA8PCAyKQo+Pj4+Pj4+IMKgwqDCoCArI2RlZmlu
ZSB2X1ZTWU5DX1BPTEFSSVRZKG4pwqDCoMKgwqDCoMKgwqDCoMKgICgobikgPDwgMykKPj4+Pj4K
Pj4+Pj4gVmVyeSB3ZWlyZGx5LCB0aGUgb3JpZ2luYWwgZGVmaW5pdGlvbiBoZXJlIG1hdGNoZXMg
Y3VycmVudAo+Pj4+PiBtYWlubGluZQo+Pj4+PiBpbm5vLWhkbWkuYywgYnV0IHRoZSBjaGFuZ2Vk
IGRlZmluaXRpb24gbWF0Y2hlcyBKSDcxMTAgdmVuZG9yCj4+Pj4+IGlubm9faGRtaS5oIFsxXS4K
Pj4+Pj4KPj4+Pgo+Pj4+IFRoZSB2ZW5kb3IgY29kZSBpcyBjb3JyZWN0IGFuZCBtYXRjaGVzIHRo
ZSBSSzMxMjggVFJNLgo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIHRpcHMgb24gZG9jdW1lbnRhdGlv
biwgYW5kIEkgdmVyaWZpZWQgdGhpcy4KPj4+Cj4+PiBJdCBzZWVtcyB0aGF0IFJvY2tjaGlwIHBl
b3BsZSBtYWRlIHRoaXMgYWx3YXlzIHdyb25nLCBldmVuIHdpdGgKPj4+IHRoZWlyCj4+PiBwcmUt
RFJNIGRpc3BsYXkgZHJpdmVyLi4uIFsxXQo+Pj4KPj4+IEJUVyBJIGNoZWNrZWQgdGhlIElubm9z
aWxpY29uIGRHUFUgZHJpdmVyIGNvZGUsIGFuZCBpdHMKPj4+IGczX25lX2hkbWkuaAo+Pj4gc291
cmNlIGZpbGUgYWxzbyBjb250YWlucyB0aGUgZGVmaW5pdGlvbiBvZiBCSVQoMykgYXMgVlNZTkMu
IChJdCdzCj4+PiBxdWl0ZSB3ZWlyZCB0aGF0IG1vc3QgbG9naWMgb2YgdGhhdCBkcml2ZXIgaXMg
aW4gc29tZSAub19zaGlwcGVkCj4+PiBibG9iLAo+Pj4gYnV0IGZvcnR1bmF0ZWx5IHRoZSBnMyBs
b2dpYyBtaWdodCBiZSB0b28gbmV3IHRvIGJlIGNsb3NlZCBkb3duKQo+Pj4KPj4+IFRoYW5rcywK
Pj4+IEljZW5vd3kKPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1s
aW51eC9rZXJuZWwvYmxvYi9yZWxlYXNlLTQuNC9kcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL2hkbWkv
cm9ja2NoaXAtaGRtaXYxL3JvY2tjaGlwX2hkbWl2MV9ody5oI0wxNjEKPj4+Cj4+Pj4KPj4+PiBI
RE1JX3JlZzA4Cj4+Pj4gwqDCoMKgwqAgQml0wqAgQXR0csKgIFJlc2V0wqAgRGVzY3JpcHRpb24K
Pj4+PiDCoMKgwqDCoCAzwqDCoMKgIFJXwqDCoMKgIDB4MMKgwqDCoCB2c19wb2xhcml0ecKgwqAg
VlNZTkMgcG9sYXJpdHnCoMKgIDEnYjA6Cj4+Pj4gTmVnYXRpdmUKPj4+PiAxJ2IxOiBQb3NpdGl2
ZQo+Pj4+IMKgwqDCoMKgIDLCoMKgwqAgUlfCoMKgwqAgMHgwwqDCoMKgIGhzX3BvbGFyaXR5wqDC
oCBIU1lOQyBwb2xhcml0ecKgwqAgMSdiMDoKPj4+PiBOZWdhdGl2ZQo+Pj4+IDEnYjE6IFBvc2l0
aXZlCj4+Pj4KPj4+PiBOb2JvZHkgbm90aWNlZCB0aGlzIHNvIGZhciBiZWNhdXNlIGluIDcyMHAv
MTA4MHAgYm90aCBwb2xhcml0aWVzCj4+Pj4gYXJlCj4+Pj4gcG9zaXRpdmUsIGJ1dCBNYXVkJ3Mg
MzoyIHBhbmVsIGhhcyBkaWZmZXJpbmcgSC9WIHBvbGFyaXR5Lgo+Pj4+Cj4+Pj4gQmVzdAo+Pj4+
IC1Eb21pbmlxdWUKPj4KPj4gVGhpcyBhbHNvIHNvbHZlcyB0aGUgZGV2bWVtIGJlaGF2aW91ciBJ
IHNhdywgb3Igd2VsbCwgZG9lc24ndCByZWFseSAKPj4gZXhwbGFpbiBpdCBidXQgZG9lcyBzaG93
IHdoYXQgaXMgYWN0dWFsbHkgaGFwcGVuaW5nLiBBcyBJY2Vub3d5IG5vdGVkCj4+IChtYXliZSB0
aGF0IHdhcyBvbiB0ZWxlZ3JhbSBvbmx5PykgdGhlIGlubm8taGRtaSByZWdzIGFyZSA4Yml0Cj4+
IGluc3RlYWQgCj4+IG9mIDMyIGJpdC4KPj4KPj4gV2hhdCBpcyBhY3R1YWxseSBoYXBwZW5pbmcg
aXM6Cj4+Cj4+IGRldm1lbSAweDI5NTkwMDAwIGIgcmVhZHMgMHgyOTU5MDAwMCBhcyBleHBlY3Rl
ZAo+PiBidXQKPj4gZGV2bWVtIDB4Mjk1OTAwMDQgYiByZWFkcyAweDI5NTkwMDAxCj4+IGRldm1l
bSAweDI5NTkwMDA4IGIgcmVhZHMgMHgyOTU5MDAwMgo+PiAuLi4uCj4+IGRldm1lbSAweDI5NTkw
MDIwIGIgcmVhZHMgMHgyOTU5MDAwOAo+Pgo+PiBGb3Igc29tZSByZWFzb24gdGhlIGFkZHJlc3Np
bmcgaXMgd2VpcmQ/Cj4+Cj4+IFdpdGggdGhpcyBjaGFuZ2UsIHRoZSBhc3NpZ25lZCBjbG9jayBj
aGFuZ2UgYW5kIHJlbW92aW5nIHRoZSAKPj4gdl9SRUdfQ0xLX0lOViB8IHZfUkVHX0NMS19TT1VS
Q0VfU1lTIHdyaXRlIHRvIEhETUlfU1lTX0NUUkwsIHRoZQo+PiBkaXNwbGF5IAo+PiBjb21lcyB1
cCBmcm9tIHRoZSBzdGFydCBhcyBpdCBzaG91bGQhCj4gCj4gV2VsbCBJIGNoZWNrZWQgdGhlIFJL
MzEyOCBUUk0gZm9yIHRoZXNlIHR3byBiaXRzLCBhbmQgdGhlaXIgZmllbGQKPiBkZXNjcmlwdGlv
bnMgYXJlIC0tICJyZXNlcnZlZCIuCj4gCj4gV2hhdCBjYW4gSSByZWFjdC4uLgo+IAoKWW91IGNh
biB0YWtlIGEgbG9vayBhdCB0aGUgVFJNIG9mIHRoZSBSSzYxWFswXS4gCkkgdGhpbmsgaXQgY29u
dGFpbnMgdGhlIHJlZ2lzdGVyIGRlc2NyaXB0aW9ucyB5b3UncmUgbG9va2luZyBmb3IgOikKClsw
XTogaHR0cHM6Ly9kbC5yYWR4YS5jb20vcm9jay9kb2NzL2h3L2RzL1JvY2tjaGlwJTIwUks2MVgl
MjBUUk0lMjBWMS4zLjEucGRmCgotLSAKQmVzdCwgCkNoYW95aQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
