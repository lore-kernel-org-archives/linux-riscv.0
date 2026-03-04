Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE5CEFCE4B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 21:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lywSxowq78TqwjHDcw5Ee+eYKcEgcrzoE1a6c229LR0=; b=ISVgpRvXpj6FVU
	6jkuEeGaaFqHdLMwd6yW6m6qgsU2Z48UJ/qVr+bQCw2qHpCJclYtGPvRoUSrrw8x/23u2sjXI0qok
	twteZoq5Y8qajJ2alx61DyD/PBmoGBbXANfOz/rBtrWXEeASCIunHc3D3BTYSatdHvvPxavBwfA4E
	EGfd30vKvPloRNVZa4gXPxb1UtOycOq6I5hWtTeG/7Zs6cgbK/UBGQhpaJ1U5ByESL7LhisdIoYtZ
	jH6eIRRpVHVLTd9OqlX0wHiBf9aHbe5fNBO6gHoSdJ6IaDJJ06zHx7d/y1SmtQwXiLidDHrtXdKcn
	SpxVoA509JrlhoWyCaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxu8s-00000000Xy6-2xY8;
	Wed, 04 Mar 2026 21:52:30 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxu8p-00000000Xw3-1MIJ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 21:52:29 +0000
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id xt5yvrhjQCxrGxu8cvdipJ; Wed, 04 Mar 2026 21:52:14 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id xu8XvGdpv2l0kxu8XvRdgs; Wed, 04 Mar 2026 21:52:10 +0000
X-Authority-Analysis: v=2.4 cv=UfRRSLSN c=1 sm=1 tr=0 ts=69a8a98d
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7vwVE5O1G3EA:10 a=qNABUOcEAAAA:8
 a=VwQbUJbxAAAA:8 a=890x73CVXr3K7iC5YPUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Ytm653ucTKQjCvbzLygB:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AlPN44MPH2LF1tFFZ08jvAcXbS/jHkMFXGLwv6GykQk=; b=jH6mBeqfuHAtMEi4J8gM2Yx4rV
	hkNIzTGPP7TSiJByVtQhT+tCeAB7nDZ0UKrnhXXLxT/d429D0hlKiWdvUcqwBmiXYo3QBRO6TMODj
	XwuynUU3vWmlfQYVsYRTlpUurSi1EATGoIqyszTFO0ElolZqS3IMf9y5UNBUPRAUDbO0m0XEc5F+V
	sFqu2CX6HFYiG8HHZ8Kk0HbRPko0JxNcn6Ro3mGXhllt6BKQXLM0go7082qOI1gkBgoQUK3lwoqqb
	ogH/XCFRMxh8OcVhwgRbQ5wDEfx5er76Hnh8P3I95wVL15nJ+18XxYzYZKR19Eapeclp/WqCOZoo9
	XNywlfuA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:49388 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <re@w6rz.net>)
	id 1vxu8X-00000001U4z-1Nyl;
	Wed, 04 Mar 2026 14:52:09 -0700
Message-ID: <96e93ca0-ea10-4071-99ca-98f7219833d7@w6rz.net>
Date: Wed, 4 Mar 2026 13:52:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
To: Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 wsa+renesas@sang-engineering.com
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
 <aaL2WVO_7bl6vNp5@sirena.co.uk> <20260228-ragweed-theater-b02967937353@spud>
 <20260228-defuse-extenuate-cf2a90ae66ea@spud> <87tsuvh6iw.fsf@bootlin.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <87tsuvh6iw.fsf@bootlin.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1vxu8X-00000001U4z-1Nyl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:49388
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDubnR6p2ZQ/ZVLOouT+FEoSL4v1BBMKSNB3epkb2aRvSumNTMVStksMIfYW5Oug3TY5uD7KrmFeq1SFy4lpXmKDsc99dyOs9B18/DsSSA9pozgbiIAw
 UYEmobZ0Lu+vNOT5P1llrEymxva2HA19VPTsNV9JOUUeLjD5VzT88cxmKw0/YFMm4efOLYJTvFPWuiN9vgPazCUdfW/BtDAgOPk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_135227_495036_5DD6EB20 
X-CRM114-Status: GOOD (  11.87  )
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

T24gMy80LzI2IDA5OjAyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDI4LzAyLzIwMjYgYXQg
MTU6Mzk6MDEgR01ULCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4+
IE9uIFNhdCwgRmViIDI4LCAyMDI2IGF0IDAyOjIzOjAwUE0gKzAwMDAsIENvbm9yIERvb2xleSB3
cm90ZToKPj4+IE9uIFNhdCwgRmViIDI4LCAyMDI2IGF0IDAyOjA2OjE3UE0gKzAwMDAsIE1hcmsg
QnJvd24gd3JvdGU6Cj4+Pj4gT24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMDU6NTQ6MDZBTSAtMDgw
MCwgUm9uIEVjb25vbW9zIHdyb3RlOgo+Pj4+Cj4+Pj4+IEknbSBnZXR0aW5nIGFuIFNQSSBmYWls
dXJlIHdpdGggTGludXggdjcuMC1yYzEgb24gdGhlIFZpc2lvbkZpdmUgMiBSSVNDLVYgYm9hcmQu
Cj4+Pj4+IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEz
MDEwMDAwLnNwaTogUVNQSSBpcyBzdGlsbCBidXN5IGFmdGVyIDUwMG1zIHRpbWVvdXQuCj4+Pj4+
IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEzMDEwMDAw
LnNwaTogZGV0ZWN0ZWQgRklGTyBkZXB0aCAoMSkgZGlmZmVyZW50IGZyb20gY29uZmlnICgyNTYp
Cj4+Pj4+IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEz
MDEwMDAwLnNwaTogUVNQSSBpcyBzdGlsbCBidXN5IGFmdGVyIDUwMG1zIHRpbWVvdXQuCj4+Pj4+
IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEzMDEwMDAw
LnNwaTogUVNQSSBpcyBzdGlsbCBidXN5IGFmdGVyIDUwMG1zIHRpbWVvdXQuCj4+Pj4+IEZlYiAy
OCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogc3BpLW5vciBzcGkxLjA6IG9wZXJhdGlvbiBm
YWlsZWQgd2l0aCAtMTEwCj4+Pj4+IEZlYiAyOCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDog
c3BpLW5vciBzcGkxLjA6IHByb2JlIHdpdGggZHJpdmVyIHNwaS1ub3IgZmFpbGVkIHdpdGggZXJy
b3IgLTExMAo+Pj4+IEZXSVcgY29uZmlybWVkIG9uIG15IHN5c3RlbToKPj4+Pgo+Pj4+ICAgICBo
dHRwczovL2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVsZXIvam9iLzI1MDQwMjYjTDcxNQo+Pj4+
Cj4+Pj4gKHdoaWNoIEkgZGlkbid0IG5vdGljZSBhcyB0aGF0IHdhcyBqdXN0IGJ1aWxkcm9vdCBh
bmQgbm90IHJ1bm5pbmcKPj4+PiBrc2VsZnRlc3QtZHQuLi4pLgo+Pj4gVGhpcyBwcm9iYWJseSBj
b25zdGl0dXRlcyByYW5kb20gc3BlY3VsYXRpb24sIGJ1dCBJIGFtIGN1cmlvdXMgaWYKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+Pj4gaW5kZXggNmU1NmU5ZDIw
YmIwNi4uMzkwZmE4N2VkYmFmOCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLmR0c2kKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZp
dmUvamg3MTEwLmR0c2kKPj4+IEBAIC04NzMsOSArODczLDkgQEAgcXNwaTogc3BpQDEzMDEwMDAw
IHsKPj4+ICAgCQkJICAgICAgPDB4MCAweDIxMDAwMDAwIDB4MCAweDQwMDAwMD47Cj4+PiAgIAkJ
CWludGVycnVwdHMgPSA8MjU+Owo+Pj4gICAJCQljbG9ja3MgPSA8JnN5c2NyZyBKSDcxMTBfU1lT
Q0xLX1FTUElfUkVGPiwKPj4+IC0JCQkJIDwmc3lzY3JnIEpINzExMF9TWVNDTEtfUVNQSV9BSEI+
LAo+Pj4gLQkJCQkgPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19RU1BJX0FQQj47Cj4+PiAtCQkJY2xv
Y2stbmFtZXMgPSAicmVmIiwgImFoYiIsICJhcGIiOwo+Pj4gKwkJCQkgPCZzeXNjcmcgSkg3MTEw
X1NZU0NMS19RU1BJX0FQQj4sCj4+PiArCQkJCSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX1FTUElf
QUhCPjsKPj4+ICsJCQljbG9jay1uYW1lcyA9ICJyZWYiLCAiYXBiIiwgImFoYiI7Cj4+PiAgIAkJ
CXJlc2V0cyA9IDwmc3lzY3JnIEpINzExMF9TWVNSU1RfUVNQSV9BUEI+LAo+Pj4gICAJCQkJIDwm
c3lzY3JnIEpINzExMF9TWVNSU1RfUVNQSV9BSEI+LAo+Pj4gICAJCQkJIDwmc3lzY3JnIEpINzEx
MF9TWVNSU1RfUVNQSV9SRUY+Owo+Pj4gaGFzIGFueSBpbXBhY3QuIEdvaW5nIGZyb20gamg3MTEw
IHNwZWNpZmljIGNvZGUgdG8gYnVsayBhcGlzIGlzIGFuCj4+PiBvcmRlcmluZyBjaGFuZ2UsIHJp
Z2h0Pwo+PiBBY2NvcmRpbmcgdG8gUm9uLCBpdCBoYWQgbm8gaW1wYWN0Lgo+IFRoZSBvdGhlciBj
aGFuZ2UgdGhhdCBjb3VsZCBiZSAiaXQiIGlzIHRoZSBjaGFuZ2Ugb2Ygb3JkZXIgYmV0d2VlbiBy
ZXNldAo+IGhhbmRsaW5nIGFuZCBjbG9jay4gVGhhdCB3b3VsZCBiZSBxdWl0ZSBtZXNzeSBpZiB0
aGF0IHdhcyB0aGUgZXJyb3IgYnV0Cj4gSSBjYW5ub3QgZmluZCBhbm90aGVyIGV4cGxhbmF0aW9u
LiBSb24sIGNhbiB5b3UgcGxlYXNlIHRyeSB0byByZXZlcnQKPiB0aGlzIHBhdGNoIGxvY2FsbHkg
YW5kIHRoZW4gbW92ZSB0aGUgY2xrX3ByZXBhcmVfZW5hYmxlKCkgb2YgdGhlIEFQQiBhbmQKPiBB
SEIgY2xvY2tzIGVhcmxpZXIsIHJpZ2h0IGFmdGVyIHRoZSByZWYgY2xvY2sgaXMgYWxzbyBlbmFi
bGVkPyBJZiB0aGUKPiBwbGF0Zm9ybSBmYWlscyB0byBib290LCB0aGVyZSBpcyBtYXliZSBhIHdl
aXJkIGludGVybmFsIHJlbGF0aW9uc2hpcAo+IHdpdGggdGhlIHJlc2V0cy4KPgo+IE90aGVyd2lz
ZSBjYW4geW91IGNvbXBhcmUgdGhlIGNsa19nZXRfcmF0ZSgpIG9uIGFsbCB0aHJlZSBjbG9ja3Mg
aW4gYm90aAo+IGNhc2VzPwo+Cj4gVGhhbmsgeW91LAo+IE1pcXXDqGwKCkknbSBoYXBweSB0byBo
ZWxwIHlvdSBkZWJ1ZyB0aGlzLCBidXQgeW91IGhhdmUgdG8gc2VuZCBtZSBhIHBhdGNoIHRvIHRo
ZSByZXZlcnRlZCBmaWxlLiBJIGhhdmUgbm8gaWRlYSB3aGVyZSB0aGUgcmVmIGNsb2NrIGlzIGVu
YWJsZWQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
