Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C10E95A8B
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KksYPa+hCsQD4aNF3JRxnPVQz1J0cY7Ly35mir4teOg=; b=bzDMA3Q1FGFz6G
	k8tmZSbcC/eBaDM1zWZkoSAmXEQZQVdXC4eeC5ThQiQGySfoL01CL/rxEm0g+MD0/yGHfjl37jLG2
	l2QgPjdGvMtoy7vM5hbfT/GkCL2Snsn411PhOh0fJCMMy4Gqs2ILyYW1I2f2qhgV6sKOBZ9Fr2Y0y
	T7Mhb0tVSCLz1bXDuXdjUiYmvYdIUvGJMn31PliGxx/7Q8uh28DiSBdT1uwNzMQGw8o/agL3LiN1y
	hfJy6o2MnQcNmALv8xsFtupZN2vRLubAr2bfGrq1gRHn5F8Hn2YKGkH0bP4S1RoAQ6SQ2evU+GV8D
	/wTzCCjWVFtJNvJ/QhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaV4-00000004vHf-36ZH;
	Tue, 30 Dec 2025 14:15:02 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaV1-00000004vGD-1ueU
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 14:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767104065;
	bh=1pQBCqn047ZruREzSayv9H++iam7PU96IzaK6pwXNeA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cbOUUfDXrpiGqcH1IX4PkqJZeiqZAePxqvgGhDoy9Lsj7mv09Nm+jcwKBVNi4IWPN
	 v1YbGDkDc6TyJ340eyApLTxeyM4tNoe1xIcw/T1Zx/FpjNQ129MHl1l4DARytvCtIi
	 86pIiZY6hieD5H6D1EVPHoE5GRzfv/W95+Bkb2iA=
X-QQ-mid: zesmtpip4t1767104063t07d72edb
X-QQ-Originating-IP: TH1lW9wnYGtTWgVF3zf4Kc6QxAMURlVUrjY62XcUYSE=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Dec 2025 22:14:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18075355756355605530
EX-QQ-RecipientCnt: 19
Date: Tue, 30 Dec 2025 22:14:21 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <guodong@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <97163966BA7F4D3A+aVPePaJvByddfCe3@troy-wujie14pro-arch>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
 <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
 <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
 <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
 <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEuRTizDJZiQfRQxIN226YVfFJd9jYsNJnrgvfyvCzoKtNKaiSdOxWP2
	Dmw6gbWM1ekdFHWihQv62NKKSLgpFGo3vU8JsXpsel/tFk4FAmvJU8rR0Iq+ONr9NTIrbNY
	PExVQM9eY2NW8QRtlQJVB/lLlrsQu6iHQ4Av4m8zg4QbUv3SU7EUy3BB/dUOT0LyBziI2VV
	0GkeqYhR5JLIJhTjTsCpxW5HZeVdOIcnDseHz5165s8upUMT/xOIuBfAC2+94F+CCbKqJIZ
	4CjaOHAJZzAI6f+Q0Mms3rWL4hQ3ino+BVPEpk3TL6Tq0VOlNfFzVpHXw8vh40eUD9bHlZc
	cbSaVALCOF2jEteVSodadQBHoGBqZZ8nui0iw+EeWewRLjbImA+dMUmSMJt+nXvnwyWFSCo
	82sq7B/WEDMHwHQ7TptrzZfl8V5YAtwHfJJD+s9+AxrdV9/6XMDUkFZqHJFmUZSc3cdV38v
	XWpi2YlK3gRyBDr2z6Q1ov81peeDo7dfc6j1dzwViDW05XzQyYAZbfTE7tXQDT3803FoDsk
	AMB6FHdxcUlGhj2+aQU2IE/b5fPzm+q0LEnr+psFWw0bkmdOFHrV+Cf7i3kezglS9gIm/on
	M6YDZz5m9vR4SLVOo5xEctJWpjkdGrHq7DwN6wYSm0UwjAyS7lSPaSRTxHCE/+tMK9crNaQ
	Y+QkconvuZAP6O/8hQfG7UPJ0yYbb6PoGUEwzTq8GBkZBKXb3hxnsJBlLN+wm8pLZdsZ7gP
	YE6itWiC8aS1DUvm9Fr9lHNagHbjWLs9EZkV74zOKVfbc/V+Hh+QB1hPdmz6mkJHNaI0pzj
	oouUNRJOgeXqlKVwGN/H7wooePKSAfBPZ3QbhJL3p5zOz0DHS0nCuyQWrVOx/1qvjPv/v+N
	2mF3PPSuhcXg7/lPfrrHTdHViv9wRZAUKMONc5TJTg0jUQEJAqqvNtaso9h/gjevZqJrG97
	JUvsOmBSM5gcJzbcdWR4s3lL2nXYSxi0xxyY+GdzX8mD4uk6SstuNDM13ynYare3dya4t0F
	al6GcgWz3pqJMpkwjkPg/74PU9aHJ5Rk7uUjIon9pD1Jaeq7ANJSvwrmnNBzgD6PI2NvH16
	tGe85MKHekK4BPIl7rri8B34N5cg8bCo2Ol69QWLihz2j2XK5PHBjI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_061459_995758_B187001E 
X-CRM114-Status: GOOD (  28.62  )
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

T24gVHVlLCBEZWMgMzAsIDIwMjUgYXQgMTA6MTE6MTZQTSArMDgwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBPbiBTdW4sIERlYyAyOCwgMjAyNSBhdCAwODo0Mjo0N0FNICswODAwLCBHdW9kb25n
IFh1IHdyb3RlOgo+ID4gSGksIEFuZGkKPiA+IAo+ID4gT24gU3VuLCBEZWMgMjgsIDIwMjUgYXQg
MzoyNuKAr0FNIEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IEhpIEd1b2RvbmcsCj4gPiA+Cj4gPiA+IE9uIEZyaSwgRGVjIDI2LCAyMDI1IGF0IDA3
OjM4OjIyQU0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBEZWMgMjYs
IDIwMjUgYXQgNTowMeKAr0FNIEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4gPiA+ICsgICAgIHJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9u
YWxfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoZGV2LCBOVUxMKTsKPiA+ID4gPiA+ID4gKyAgICAgaWYg
KElTX0VSUihyc3QpKQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgUFRSX0VSUihyc3QpLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJmYWlsZWQgdG8gYWNxdWlyZSBkZWFzc2VydGVkIHJlc2V0XG4iKTsKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBJZiB0aGlzIGlzIG9wdGlvbmFsLCB3aHkgYXJlIHdlIHJldHVybmlu
ZyB3aXRoIGVycm9yPwo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEFjY29yZGluZyB0byBpbmNs
dWRlL2xpbnV4L3Jlc2V0LmgsIGlmIHRoZSByZXF1ZXN0ZWQgcmVzZXQgaXMgbm90Cj4gPiA+ID4g
c3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJlZSwgdGhpcyBmdW5jdGlvbiByZXR1cm5zIE5VTEwg
aW5zdGVhZCBvZgo+ID4gPiA+IGFuIGVycm9yLiBUaGVyZWZvcmUsIElTX0VSUihyc3QpIHdpbGwg
b25seSBiZSB0cnVlIGZvciBhY3R1YWwKPiA+ID4gPiBlcnJvcnMgKGUuZyBwcm9iZSBkZWZlcnJh
bCkuCj4gPiA+Cj4gPiA+IEFuZCB0aGlzIGlzIHF1aXRlIG9idmlvdXMsIGJ1dCB5b3UgaGF2ZW4n
dCBhbnN3ZXJlZCBteSBxZXN0aW9uLgo+ID4gPgo+ID4gPiBXaHkgZG8gd2UgY2FyZSBvZiBpbnRl
cm5hbCBmYWlsdXJlcyBpbiByZXNldD8gSWYgcmVzZXQgZmFpbHMgb24KPiA+ID4gYW4gb3B0aW9u
YWwgcmVzZXQgY29udHJvbCBmdW5jdGlvbiB3aHkgc2hvdWxkIHdlIGtpbGwgb3VyIGRyaXZlcj8K
PiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSBzZWUgeW91ciBwb2ludCBu
b3cuCj4gPiAKPiA+IE15IHJlYXNvbmluZyBpcyB0aGF0IGlmIHRoZSByZXNldHMgcHJvcGVydHkg
aXMgZXhwbGljaXRseSBsaXN0ZWQgaW4gdGhlCj4gPiBEZXZpY2UgVHJlZSwgdGhlIGRyaXZlciBt
dXN0IHJlc3BlY3QgaXQuClNvcnJ5LCBJIG1pc3JlYWQgeW91ciBjb21tZW50LiBJIHRob3VnaHQg
eW91IHdlcmUgcmVmZXJyaW5nIHRvIHRoZQpiaW5kaW5ncy4gSW4gdGhhdCBjYXNlLCB3ZSBhcmUg
b24gdGhlIHNhbWUgcGFnZS4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
VHJveQo+IEl0J3Mgbm90IHJlcXVpcmVkLgo+IAo+ID4KPiA+IElmIHRoZSBwcm9wZXJ0eSBpcyBw
cmVzZW50IGJ1dAo+ID4gd2UgZW5jb3VudGVyIGFuIGVycm9yIChsaWtlIC1FUFJPQkVfREVGRVIp
LCBpZ25vcmluZyB0aGF0IGZhaWx1cmUgY291bGQKPiA+IHB1dCB0aGUgaGFyZHdhcmUgaW4gYW4g
dW5kZWZpbmVkIG9yIGRpcnR5IHN0YXRlLgo+IFRoZW4gd2h5IGl0J3Mgb3B0aW9uYWw/Cj4gCj4g
VGhlIHJlYWwgcmVhc29uOgo+ICJPcHRpb25hbCIgaGVyZSBtZWFucyB0aGUgcmVzZXQgbGluZSBp
cyBhbGxvd2VkIHRvIGJlIGFic2VudCBmcm9tIHRoZQo+IERldmljZSBUcmVlLiBJdCBkb2VzIG5v
dCBtZWFuIHdlIGNhbiBpZ25vcmUgdGhlIGZhaWx1cmUgd2hlbiBpdCBpcwo+IGRlZmluZWQgaW4g
dGhlIERUIGJ1dCBmYWlscyB0byBiZSBhY3F1aXJlZC4KPiAKPiBJZiBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X29wdGlvbmFsXyogcmV0dXJucyBhbiBlcnJvciAoZS5nLiwKPiAtRVBST0JFX0RFRkVS
KSwgaXQgaW5kaWNhdGVzIHRoZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiBleHBlY3RzIGEgcmVzZXQK
PiBjb250cm9sLCBidXQgdGhlIHN5c3RlbSBpcyBub3QgeWV0IHJlYWR5IHRvIHByb3ZpZGUgaXQu
IElnbm9yaW5nIHRoaXMKPiBlcnJvciB3b3VsZCBicmVhayB0aGUgcHJvYmUgZGVmZXJyYWwgbWVj
aGFuaXNtIGFuZCBwb3RlbnRpYWxseSBjYXVzZSB0aGUKPiBkcml2ZXIgdG8gYWNjZXNzIGhhcmR3
YXJlIGluIGFuIGludmFsaWQgc3RhdGUuCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAt
IFRyb3kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
