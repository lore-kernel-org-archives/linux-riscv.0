Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4745DCFC526
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7xnS4DuHD5X2XG2U2w6rNgktE1K6YKpdgimagyvXDE=; b=4zuNERH87AY+yx
	fZhTzqDRXj2PNmo5CGpePbSQ9F45s/ELpRUDAORorPu2XMklju4PuHNTZgtHs3HvaBqyknC7TbMu7
	taL9lO5SAhTACWvOPA2CYDGKVv2x1Y7cwbuOAHnwi6o3fqBFrx/kr/b21ZD4qqVFSb/Qitw4pulF7
	0JrV7AoDyxJXnC80M6+PSVJGI11Zu2Iue8lUEXNGNqVyhsifxkU1/i+klKeMKTSxByJ1nZ5g7mkis
	7EpVc1ey4WXYtJHjiwHGIK5fbSqlO7YPf8CFXBNIk4/vQFwaSLDhvxTYaJXuU6pQYteuBA2PRnOnC
	j4sDZM2spWq8aF9LeDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlmz-00000009V2K-3ij3;
	Sat, 22 Nov 2025 11:28:25 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMlmw-00000009V1I-050u;
	Sat, 22 Nov 2025 11:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
	:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sTIigErOKl7e8JhN8I1UwZxYBcS4CkN23s/oTFvf/Dg=; b=mDhTUOtYYD2PoSPm7+k+UOXoPV
	lnjPFdJ7GPLaTgHd8oAnqdH61tFnFJMo+j0p8AqaYPNEXbKYIO1unFo8zP+6acOwKlUllA18AC2Gf
	A3LNGIxH9m8Z+WUNDrZ3DS6+SYiCWrsgVk1z9kV5eM3iGuat8DQW8BMsuaLsm7kq3ON6SmhBakq6e
	u6Ao6E7/shC+Jc/XKZDjYYbNwiSjQTtFo2mV3LsOIZTi7N9X62HQag+UoeORzEpcXhgJ9MJBNELOu
	wbZoMRNuqZw/P2W7G/FO8V+Ys7F8+LgqjnwhflrMZheLZyW2OvPvLLCQU0sMMfMRpCQrxHRxr2v7a
	+u5r/pXA==;
Received: from d100-78.icpnet.pl ([77.65.100.78] helo=[192.168.0.120])
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vMlml-00000007s2Y-1bfI;
	Sat, 22 Nov 2025 12:28:11 +0100
Message-ID: <72fba214-010d-498e-957f-f1d042f18edc@szczodrzynski.pl>
Date: Sat, 22 Nov 2025 12:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: Parthiban <parthiban@linumiz.com>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paulk@sys-base.io
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
 <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_032822_293069_D2D94C83 
X-CRM114-Status: GOOD (  22.16  )
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

VyBkbml1IDIwMjUtMTEtMjAgb8KgMDc6MjQ6NTMsIFBhcnRoaWJhbiBwaXN6ZToKCj4gRGVhciBL
dWJhLAo+Cj4gVGhhbmtzIGZvciB5b3VyIGVmZm9ydHMuCj4KPiBPbiAxMS8xNi8yNSAyOjQ3IFBN
LCBLdWJhIFN6Y3pvZHJ6ecWEc2tpIHdyb3RlOgo+PiBTb21lIEFsbHdpbm5lciBjaGlwcyAobm90
YWJseSB0aGUgRDFzL1QxMTMgYW5kIHRoZSBBMTAwKSBoYXZlIGEgImNvbWJvCj4+IE1JUEkgRFNJ
IEQtUEhZIiB3aGljaCBpcyByZXF1aXJlZCB3aGVuIHVzaW5nIHNpbmdsZS1saW5rIExWRFMwLgo+
Pgo+PiBJbiB0aGlzIG1vZGUsIHRoZSBEU0kgcGVyaXBoZXJhbCBpcyBub3QgdXNlZCBhbmQgdGhl
IFBIWSBpcyBub3QKPj4gY29uZmlndXJlZCBmb3IgRFNJLiBJbnN0ZWFkLCB0aGUgQ09NQk9fUEhZ
X1JFR3ggcmVnaXN0ZXJzIGFyZSBzZXQgdG8KPj4gZW5hYmxlIExWRFMgb3BlcmF0aW9uLgo+Pgo+
PiBFbmFibGUgdGhlIFBIWSBkcml2ZXIgdG8gd29yayBpbiBMVkRTIG1vZGUgb24gY2hpcHMgd2l0
aCBhIGNvbWJvIEQtUEhZLgo+Pgo+PiBBbHNvIGNoYW5nZSB0aGUgU1VONTBJX0NPTUJPX1BIWV9S
RUcxIG1hY3JvIG5hbWVzIHRvIHJlZmxlY3QgdGhlIGNvcnJlY3QKPj4gcmVnaXN0ZXIgbmFtZS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogS3ViYSBTemN6b2RyennFhHNraSA8a3ViYUBzemN6b2Ryenlu
c2tpLnBsPgo+PiAtLS0KPj4gICBkcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGkt
ZHBoeS5jIHwgNzAgKysrKysrKysrKysrKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDY4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gSSB0cmllZCBpbnRlZ3JhdGluZyB5b3Vy
IGNoYW5nZXMgaW4gQTEzMyBkaXNwbGF5IHBpcGVsaW5lIGFuZCBJIGNvdWxkbid0IGdldCB0aGUg
TFZEUyB3b3JraW5nLgo+IEFtIHN0aWxsIG5hcnJvd2luZyBkb3duIHdoYXQgaXMgbWlzc2luZyBp
biB5b3VyIHBhdGNoLiBEcml2ZXIgcmVnaXN0cmF0aW9uIGlzIHN1Y2Nlc3MgYW5kIEkKPiBjYW4g
c2VlIC9kZXYvZmIwIGFzIHdlbGwuIEJ1dCBub3RoaW5nIG9uIHRoZSBkaXNwbGF5IGl0c2VsZi4K
Pgo+IEJ1dCB3aXRoIGJlbG93IGNoYW5nZXMgZnJvbSBteSBwYXRjaCwKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGktZHBoeS5jIGIvZHJpdmVycy9w
aHkvYWxsd2lubmVyL3BoeS1zdW42aS1taXBpLWRwaHkuYwo+IGluZGV4IDM2ZWFiOTUyNzFiMi4u
ZDE2NGIyZWE1ZGZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGh5L2FsbHdpbm5lci9waHktc3Vu
NmktbWlwaS1kcGh5LmMKPiArKysgYi9kcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1p
cGktZHBoeS5jCj4gQEAgLTMxNCwxMyArMzE0LDExIEBAIHN0YXRpYyB2b2lkIHN1bjUwaV9hMTAw
X21pcGlfZHBoeV90eF9wb3dlcl9vbihzdHJ1Y3Qgc3VuNmlfZHBoeSAqZHBoeSkKPiAgICAgICAg
ICAvKiBEaXNhYmxlIHNpZ21hLWRlbHRhIG1vZHVsYXRpb24uICovCj4gICAgICAgICAgcmVnbWFw
X3dyaXRlKGRwaHktPnJlZ3MsIFNVTjUwSV9EUEhZX1BMTF9SRUcyLCAwKTsKPiAgIAo+IC0gICAg
ICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGRwaHktPnJlZ3MsIFNVTjZJX0RQSFlfQU5BNF9SRUcsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgU1VONklfRFBIWV9BTkE0X1JFR19FTl9NSVBJLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjZJX0RQSFlfQU5BNF9SRUdfRU5fTUlQSSk7
Cj4gLQo+ICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhkcGh5LT5yZWdzLCBTVU41MElfQ09N
Qk9fUEhZX1JFRzAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgU1VONTBJX0NPTUJPX1BI
WV9SRUcwX0VOX0xWRFMgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVU41MElfQ09N
Qk9fUEhZX1JFRzBfRU5fTUlQSSB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNVTjUw
SV9DT01CT19QSFlfUkVHMF9FTl9DT01CT0xETywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBTVU41MElfQ09NQk9fUEhZX1JFRzBfRU5fTFZEUyB8Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFNVTjUwSV9DT01CT19QSFlfUkVHMF9FTl9NSVBJIHwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU1VONTBJX0NPTUJPX1BIWV9SRUcwX0VOX0NPTUJPTERPKTsKPiAgIAo+IEBA
IC01MjgsNiArNTI2LDIyIEBAIHN0YXRpYyBpbnQgc3VuNmlfZHBoeV9leGl0KHN0cnVjdCBwaHkg
KnBoeSkKPiAgICAgICAgICByZXR1cm4gMDsKPiAgIH0KPgo+IExWRFMgd29ya3MgZmluZS4KPgo+
IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgdGhlIGRpZmYgb2YgeW91ciBkdHMgLyBkdHNpPwoKSGks
CkhlcmUncyB0aGUgRFRTIG92ZXJsYXkgSSB1c2VkIHRvIGVuYWJsZSBhbiBMVkRTIHBhbmVsIG9u
IFQxMTMuIFlvdSdsbCBuZWVkIHRvIGFkYXB0IHRoZSBwYW5lbCBzcGVjaWZpY2F0aW9uIHRvIHlv
dXIgcGFydGljdWxhciBkaXNwbGF5LgpJIGRpZCBub3QgbmVlZCB0byBjaGFuZ2UgdGhlIHBoeSBk
cml2ZXIsIHNvIHRoaXMgZXh0cmEgcmVxdWlyZW1lbnQgbWlnaHQgYmUgc3BlY2lmaWMgdG8gQTEz
My4KCi9kdHMtdjEvOwovcGx1Z2luLzsKCiZ7L30gewoJcGFuZWwgewoJCWNvbXBhdGlibGUgPSAi
cGFuZWwtbHZkcyI7CgkJZGF0YS1tYXBwaW5nID0gImplaWRhLTE4IjsKCQlkZGMtaTJjLWJ1cyA9
IDwmaTJjMj47CgoJCXBvcnQgewoJCQlwYW5lbF9pbnB1dDogZW5kcG9pbnQgewoJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZ0Y29uX2xjZDBfb3V0X2x2ZHM+OwoJCQl9OwoJCX07Cgl9Owp9OwoKJnRj
b25fbGNkMCB7CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJcGluY3RybC0wID0gPCZsY2Rf
bHZkczBfcGlucz47Cn07CgomdGNvbl9sY2QwX291dCB7CglyZWcgPSA8MT47CgkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDA+OwoKCXRjb25fbGNkMF9vdXRfbHZkczogZW5k
cG9pbnRAMCB7CgkJcmVnID0gPDA+OwoJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW5wdXQ+
OwoJfTsKfTsKClJlZ2FyZHMKS3ViYQoKPgo+IFRoYW5rcywKPiBQYXJ0aGliYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
