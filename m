Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1241BD35144
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gsBndyiLsIjyKm1pFto8lj3nSx9/qc0bnLuKtPSbIs=; b=APSre6MNU0VLVd
	B2LT4SogrCBMe+v1iKm3zCM+ErpUjypaDOEiH/DsOGoG1CFO/YVRELM0FnInJTkKbUnKxBK8BWRc1
	3HDikBdjnwkpmyz3aLEAHaN0n1nwRo7yS2l/mTY7rx3YkoqTMvoECj/qh/YFfwvaa2Bl5JNtaclYJ
	tb/GZtUu4grsVUVirGcIJlStnTwmB4o2IEQnsCcGK5R4CmU6mx+fZyg4jEGm/d2PtfGXt0bg81DCN
	jX5qsgFWzRKqpb8ZzoD3OMKSFlJBKTPHNqBp0Mf3s2yicYd5TO8SAcF4Wvqdcay685M5Ch1ukW2rZ
	rYTnOZ5DpOXx8dPIruDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pJL-0000000E82s-1l5D;
	Wed, 01 Apr 2026 06:44:19 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pJI-0000000E7zn-1keF
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 06:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775025753;
	bh=5eLuO6Dg0v1DgrfHcmNBLPbXv7rnkJttNKIeZuJk6uI=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=jrRD1U3H0g61Hx8llloEoNmfP4qYExeCfrJpMdcToEShYAwM9C0iowE37F0KU7RG8
	 NXr3M035ly9SShMsyAnBD2D6pIgOnL+3Tu6mgH/oJbwtFfCiFUi13/LennsXPHg5H/
	 3T31uWOtnRrldmLmfnxr53BN6nm7Ar1S+I3ZceF8=
X-QQ-mid: esmtpsz16t1775025750t7591359d
X-QQ-Originating-IP: fUdCuzUb7Z94GHZIGs6Mh0OqBX5fgjt7XPKfo0NAQzU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Apr 2026 14:42:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10449797941589692616
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Wed, 01 Apr 2026 14:42:28 +0800
Message-Id: <DHHM43F6TE9I.1F5A3O0VOS6ND@linux.spacemit.com>
To: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>,
 "Yixun Lan" <dlan@kernel.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
 <20260331085925-GKB976850@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODrxu5ekznG9UUr9yapycvLi7uthWM3Kkzjb07EZKSOMm3IKab2x/HLP
	lIqlggDWRMkckfJVq8odIsdc41yW3vfpXN+7WJhsGQmTNulD98ONAWGyE/xZjFaPIWYq4C8
	TCN7/wiqpYRRacROjlJQK0+Wpb6zdx1ynDCoQ2mjvmZH0wsqdovT+NHQw1fO5V6nvL6Sl4e
	+xGGE0b1YWJYivS1PeOnYIgvCYdDKAj9y85EDzhmtbraGnGF/JgmPvF6530wseAwYgv4qDA
	n/Xn9yImTMoJnHOFkxXAL6ladO46olWfnuWG+pRR61zAi0Wgjfe21YPjzeDdrSSZ0iwO7dC
	gBvZJyRcnh9fEjp9xQReogs3Aga+9pmnKH9E9O84Cfp6SIHTqes5nkKGNu4v8lug2RrkT2w
	BbsJ5+Q6uwvT1Mrr2J6Qff41wfRHhbm06V6z1CCc6UsIWDgZUv943OjJ4t7rQyJ1of3ShAc
	C+t7YVyX0xU+ezAW0s7NgjbvS+YuXcEY9ZzJzehaTiqFvg/gzEO88rY5j7Gp1YwR/TMiFY3
	lKN5VF6/XbHavSih+jKfqaTQeL3OaqE/hmvEcTUCNSwYW2m9LBS2mJxQxMf6EqYIwnsaQZq
	yTfewt58/DadYnPK1B+X7ayZkkHjyjOrC6yOv45QrmR5q0WsmlUYOtJEG/WaEYATdS8uWkE
	+q3UIgdhyqDGKcppcvLeb9K//2faNfMV+2EYvZF+YuiSgF+N0x9/26N72nlz6QBg8Qkh2DV
	b3vlLzoSlYdtda/GdHSafPPO3tlwIWrmWqNnp6F3VAXKF3lexTjC5PKDh1M3VHekQVl8+eX
	/DrZeY140m6Ibhh1MG9ESkZcGsfn3WsUnWB3X4cKO/iZ2jfzNfJNXzkXHtYL53Svcie/6/3
	fIN4EFzc/EfdOC+A/WLnODbOP7ibGZSVxy1mOE8ilM6UcF2Mn/+7XqhRa2gsmPGuKFj2Gsc
	NH1cQKM+dUPR3XiPr0SVkIdA1I3JNWTxu/u6jwLWN+Fss2tIQGAJX/Lw2dC7lxuS2zYQD6u
	6qs1ylVuy6TCxLcyICORQAu8ZVkhoywYT1wfBlu02mPNsAXYAu7q8BKBuR5r5gQcz5CMERu
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_234417_417403_09618B82 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkIEFwciAxLCAyMDI2IGF0IDI6MTAgUE0gQ1NULCDmm7nnj4rnj4ogd3JvdGU6Cj4gSGkg
TGFuLAo+Cj4+IEZyb206ICJZaXh1biBMYW4iPGRsYW5Aa2VybmVsLm9yZz4KPj4gSGkgU2FuZGll
LMKgCj4+wqAKPj4gT24gMTE6NDYgVHVlIDMxIE1hciDCoCDCoCAsIFNhbmRpZSBDYW8gd3JvdGU6
Cj4+ID4gRnJvbTogc2FuZGllY2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4+ID7C
oAo+PiA+IFRoZSBGTUwxM1YwNSBib2FyZCBmcm9tIERlZXBDb21wdXRpbmcgaW5jb3Jwb3JhdGVz
IGEgU3BhY2VtaVQgSzMgUklTQy1WCj4+ID4gU29DLkl0IGlzIGEgbWFpbmJvYXJkIGRlc2lnbmVk
IGZvciB0aGUgRnJhbWV3b3JrIExhcHRvcCAxMyBDaGFzc2lzLAo+PiA+IHdoaWNoIGhhcyAoRnJh
bWV3b3JrKSBTS1UgRlJBTkhRMDAwMS4KPj4gPsKgCj4+ID4gVGhlIEZNTDEzVjA1IGJvYXJkIGZl
YXR1cmVzOgo+PiA+IC0gU3BhY2VtaVQgSzMgUklTQy1WIFNvQwo+PiA+IC0gTFBERFI1IDE2R0Ig
b3IgMzJHQgo+PiA+IC0gZU1NQyAzMkdCIH4xMjhHQiAoT3B0aW9uYWwpCj4+ID4gLSBVRlMgMy4x
IDI1NkcgKE9wdGlvbmFsKQo+PiA+IC0gUVNQSSBGbGFzaAo+PiA+IC0gTWljcm9TRCBTbG90Cj4+
ID4gLSBQQ0llLWJhc2VkIFdpLUZpCj4+ID4gLSA0IFVTQi1DIFBvcnRzCj4+ID4gwqAtIFBvcnQg
MTogUEQgMy4wICg2NVcgTWF4KSwgVVNCIDMuMiBHZW4gMQo+PiA+IMKgLSBQb3J0IDI6IFBEIDMu
MCAoNjVXIE1heCksIFVTQiAzLjIgR2VuIDEsIERQIDEuNCAoNEtANjBIeikKPj4gPiDCoC0gUG9y
dCAzICYgNDogVVNCIDMuMiBHZW4gMQo+PiA+wqAKPj4gPiBUaGlzIG1pbmltYWwgZGV2aWNlIHRy
ZWUgZW5hYmxlcyBib290aW5nIGludG8gYSBzZXJpYWwgY29uc29sZSB3aXRoIFVBUlQKPj4gPiBv
dXRwdXQuCj4+ID7CoAo+PiA+IFNpZ25lZC1vZmYtYnk6IHNhbmRpZWNhbyA8c2FuZGllLmNhb0Bk
ZWVwY29tcHV0aW5nLmlvPgo+PiA+IFJldmlld2VkLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDxo
ZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+Cj4+ID4gKyZ1YXJ0MCB7Cj4+IENhbiB5
b3UgYWxzbyBhZGQgcGluY3RybCBkYXRhIGV4cGxpY2l0bHk/Cj4KPiBUbyBhdm9pZCBjb25mbGlj
dCzCoCB0aGUgY29tbW9uIHBpbmN0cmwgdGFibGUgImszLXBpbmN0cmwuZHRzaSIgc2hvdWxkIGJl
IHVwbG9hZGVkIGJ5IHNwYWNlbWl0LsKgCj4gVGhlbiB3ZSB3aWxsIGFkZCB0aGUgcGluY3RybCBk
YXRhIGFmdGVyIGszLXBpY28taXR4LmR0cy4gVGhhdCBzaG91bGQgYmUgYW5vdGhlciBwYXRjaC7C
oAo+IFNhbmRpZQpJIHRoaW5rIHlvdSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgWWl4dW4gc2FpZC4K
WW91IHNob3VsZCBhZGQgcGluY3RybCBwcm9wZXJ0aWVzIGhlcmUgbGlrZToKcGluY3RybC0wID0g
eHh4OwpwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoKV2hpbGUgdGhlIGJvb3Rsb2FkZXIgaXMg
ZXhwZWN0ZWQgdG8gaW5pdGlhbGl6ZSB0aGUgVUFSVCBwaW5zLCBleHBsaWNpdGx5IGFkZGluZyB0
aGUgcGluY3RybCBwcm9wZXJ0aWVzCmVuc3VyZXMgaGFyZHdhcmUgc3RhdGUgY29uc2lzdGVuY3ku
CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
