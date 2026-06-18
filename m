Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3CECD98DE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 03:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5JICAwO5Xi2hwp9eNLis9iv0k2Wn/NEp2a7/jrJAg4=; b=mqLhj7mlvol4yG
	Pw2D7iwb+QyEY6GLzAodyrPz57bbOOFs2t1NgrVXVRQ0jX2CHTNoZHvMCXWZPQKMUj+CK8Ox9hElG
	LDB7BoONzvhO9x+xEDa/8uw4G/PfRc/BrfAEkovRcBH/28LWcGJKABAE2V0W7ZHbPZRPZga7X6uw7
	ryM1dwP2RMI2jCA5y4Us2PWhbZIadjVTFY7OHRpJqMMGmS65ruRkUxZt1+V8v8ndZ0rfzesHJIfXS
	nZt+j//rlP2S5RhGyM9KgrQ2JPtXiJqYgGvXj8mOlHtoMeQr8kZJzB7Dtu7v83R84X/IodvvMyjj3
	5oYeWdN/mGjXO7pism9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Yf-00000000Zcw-0Vm6;
	Thu, 18 Jun 2026 03:36:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Ye-00000000Zcn-0d0o
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 03:36:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 212E24450A
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 03:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B701F00A3E
	for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781753807;
	bh=cVPtGl+4x1G2BzK1t22g1Zkxuy6feBMfhbG2c8gY4Pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VMkt5vikDcoBFpWSVzO8XUIgCDm4BWZzH1GXjZY/zMKg2s59KOah6U335ifJK/sT4
	 ISjqbvnUSNRFEJL3RcDN+aVPjKQQV6Jdjr8rGdV3nDvKsqASKT/bFdMTpp2hhuzKVK
	 J3vHgqgLvKswcS01OSJ7DHG9A9sIqrz+I7l18H6YwZLlRzXD1h6Xz7ppK6XP+KR0nG
	 YAFBERZ2BQkH1hxFchDTVD8Wdm/XWSYeXqnxYGAdwkgWBz4WgbKCOyQRtAXzO81n06
	 Rat9pxycgscV8HJ9pbEhxd0zpU0X8CuJlEim/yutmRnnj350U/l+a2ehyHJaRdhnYn
	 wrEZKcyZgVvlw==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-460166910e6so267744f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 20:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8RXFl2u15fQbxE0FCYGuUQAOJpkApbKEcNgQEerFENMxPfhOOqY/phe+Rc1T/CY21ze4IThJkjEGiTjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ04jU+JD4WFtY6cYhQ4+b+9Zy1dvVe9/TWXS0VY3eeaAdjMEO
	CxD+PBeq5vAh3Xx00O8q31hkIL1ynxcRJvZsiM83qRlKn8bfCS9DWu6zoEfH8x85HZ9tz8HzvYw
	1QhHKgwtSKlw1KdTixaZfDkjxjqA2XAg=
X-Received: by 2002:a05:6000:1866:b0:43f:e990:2f5d with SMTP id
 ffacd0b85a97d-463ad6c8e67mr3103096f8f.35.1781753805618; Wed, 17 Jun 2026
 20:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <20260616113651.1048a19a@pumpkin>
 <CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
 <20260616205147.6aa7df98@pumpkin> <CAJF2gTTCLKCnTcY=K9hsepRgKwDRXqg5eqJBPxBPqTp98zqFKw@mail.gmail.com>
 <20260617225416.0c5a79b0@pumpkin>
In-Reply-To: <20260617225416.0c5a79b0@pumpkin>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 18 Jun 2026 11:36:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTwjtAs997XC1A9FEH68pGMqiwoOd9wcBMs5j_E0gSvQQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfxgwh3LbRZ4Q0RGPr7kIJ24k88PyG19lGYoK5JM7Kn2nepfc8_5HQoi6M
Message-ID: <CAJF2gTTwjtAs997XC1A9FEH68pGMqiwoOd9wcBMs5j_E0gSvQQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgNTo1NOKAr0FNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE4IEp1biAyMDI2IDAwOjI0
OjEyICswODAwCj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBPbiBX
ZWQsIEp1biAxNywgMjAyNiBhdCAzOjUx4oCvQU0gRGF2aWQgTGFpZ2h0Cj4gPiA8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgMTYgSnVuIDIw
MjYgMjM6NDc6MDUgKzA4MDAKPiA+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgSnVuIDE2LCAyMDI2IGF0IDY6MzbigK9QTSBEYXZpZCBM
YWlnaHQKPiA+ID4gPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gT24gTW9uLCAxNSBKdW4gMjAyNiAxMjozODoxNyArMDAwMAo+ID4gPiA+
ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gSGkgWmhhbnBlbmcgWmhhbmcsCj4gPiA+ID4gPiAuLgo+ID4gPiA+ID4gPiAzLiBPbmx5IHBl
cmZvcm1hbmNlLW1vbml0b3JpbmcgY291bnRlcnMgcmVxdWlyZSA2NC1iaXQgSU8gYWNjZXNzIG9y
IHRoZQo+ID4gPiA+ID4gPiBoaWdoLWxvdy1oaWdoIGRvLXdoaWxlIHJldHJ5IHN0cmF0ZWd5LiBG
b3Igb3JkaW5hcnkgc3RhdHVzIGFuZCBjb250cm9sCj4gPiA+ID4gPiA+IE1NSU8gcmVnaXN0ZXJz
LCBhIHNpbmdsZSByZWFkIGlzIHN1ZmZpY2llbnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWN0dWFs
bHkgdGhpcyBzZXF1ZW5jZSBzaG91bGQgYmUgZW5vdWdoIGZvciBhIGNvdW50ZXI6Cj4gPiA+ID4g
PiAgICAgICAgIGhpID0gcmVhZF9oaSgpOwo+ID4gPiA+ID4gICAgICAgICBsbyA9IHJlYWRfbG8o
KTsKPiA+ID4gPiA+ICAgICAgICAgaWYgKGhpICE9IHJlYWRfaGkoKSkgewo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgIC8vIFBpY2sgYSB2YWx1ZSB0aGF0IGhhcHBlbmVkIHdoaWxlIGRvaW5nIHRo
ZSByZWFkcy4KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBoaSsrOwo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIGxvID0gMDsKPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+IFRoaXMgaXMgbm90
IGEgZnJlZSBvcHRpbWl6YXRpb24g4oCUIGl0IGRvZXMgbm90IHByZXNlcnZlIHRoZSBzYW1lCj4g
PiA+ID4gc2VtYW50aWNzIGFzIGFuIGF0b21pYyA2NC1iaXQgcmVhZC4gVGhlcmUgYXJlIGF0IGxl
YXN0IHR3byBjb3JyZWN0bmVzcwo+ID4gPiA+IGlzc3VlczoKPiA+ID4gPgo+ID4gPiA+IDEuIExv
c3Mgb2YgcHJlY2lzaW9uOiBJZiBoaSBjaGFuZ2VkIGR1cmluZyB0aGUgcmVhZCwgc2V0dGluZyBs
byA9IDAKPiA+ID4gPiBkaXNjYXJkcyB0aGUgYWN0dWFsIGxvIHZhbHVlLiBUaGUgY29ycmVjdCBh
cHByb2FjaCBpcyB0byByZS1yZWFkIGxvCj4gPiA+ID4gYWZ0ZXIgZGV0ZWN0aW5nIHRoZSBjaGFu
Z2UsIG5vdCBmYWJyaWNhdGUgYSB2YWx1ZS4KPiA+ID4gPgo+ID4gPiA+IDIuIE11bHRpcGxlIG92
ZXJmbG93czogVGhpcyBhc3N1bWVzIGF0IG1vc3Qgb25lIG92ZXJmbG93IG9jY3Vycwo+ID4gPiA+
IGJldHdlZW4gcmVhZHMuIElmIHR3byBvdmVyZmxvd3MgaGFwcGVuIChlLmcuLCBkdWUgdG8gaW50
ZXJydXB0Cj4gPiA+ID4gaW5qZWN0aW9uKSwgaGkrKyB3aWxsIHByb2R1Y2UgYW4gaW5jb3JyZWN0
IHJlc3VsdCwgc2lsZW50bHkgY29ycnVwdGluZwo+ID4gPiA+IHRoZSBjb3VudGVyIHZhbHVlLgo+
ID4gPiA+Cj4gPiA+ID4gTmVnbGlnaWJsZSBiZW5lZml0OiBoaSBjaGFuZ2luZyBiZXR3ZWVuIHJl
YWRzIGlzIGFuIGV4dHJlbWVseSByYXJlCj4gPiA+ID4gZXZlbnQuIE9wdGltaXppbmcgYXdheSB0
aGUgcmV0cnkgbG9vcCBmb3Igc3VjaCBhIHJhcmUgY2FzZSBwcm92aWRlcyBubwo+ID4gPiA+IG1l
YW5pbmdmdWwgcGVyZm9ybWFuY2UgZ2Fpbi4gQW5kIGlmIGhpIG5ldmVyIHN0YWJpbGl6ZXMsIHRo
YXQKPiA+ID4gPiBpbmRpY2F0ZXMgYSBoYXJkd2FyZSBmYWlsdXJlIOKAlCBpbiB3aGljaCBjYXNl
IGhhbmdpbmcgaW4gdGhlIHJldHJ5IGxvb3AKPiA+ID4gPiBpcyBhY3R1YWxseSB0aGUgbW9yZSBh
cHByb3ByaWF0ZSBiZWhhdmlvciwgYXMgaXQgbWFrZXMgdGhlIGZhaWx1cmUKPiA+ID4gPiB2aXNp
YmxlIHJhdGhlciB0aGFuIHNpbGVudGx5IHByb2R1Y2luZyBnYXJiYWdlIHZhbHVlcy4KPiA+ID4g
Pgo+ID4gPiA+IFRoZSBoaWdoLWxvdy1oaWdoIGRvLXdoaWxlIHJldHJ5IHN0cmF0ZWd5IGV4aXN0
cyBwcmVjaXNlbHkgdG8gaGFuZGxlCj4gPiA+ID4gdGhlc2UgY2FzZXMgY29ycmVjdGx5LiBJIGRv
bid0IHRoaW5rIHRoaXMgcHJvcG9zZWQgc2VxdWVuY2UgaXMgYSB2YWxpZAo+ID4gPiA+IHJlcGxh
Y2VtZW50Lgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoZSBwb2ludCBpcyB0aGF0IGlmIHRoZSB2YWx1
ZSBpcyBhbiBpbmNyZW1lbnRpbmcgY291bnRlciAob2Ygc29tZSBmb3JtKQo+ID4gPiB0aGVuIHRo
ZSB2YWx1ZSBpcyBzdGFsZSBieSB0aGUgdGltZSB0aGUgcmVhZGluZyBzZXF1ZW5jZSBjb21wbGV0
ZXMuCj4gPiA+IFNvIGFsbCB0aGUgY29kZSBjYW4gYmUgYXNzdW1lZCB0byBkbyBpcyByZXR1cm4g
YSB2YWx1ZSB0aGUgY291bnRlciBoYWQKPiA+ID4gc29tZXRpbWUgYmV0d2VlbiB3aGVuIHRoZSBj
b2RlIHN0YXJ0ZWQgYW5kIHdoZW4gaXQgZmluaXNoZWQuCj4gPiA+IElmIGhpIGNoYW5nZXMgdGhl
biBoaSsxOjAgbXVzdCBoYXZlIGhhcHBlbmVkIHdoaWxlIHRoZSBjb2RlIHdhcyBydW5uaW5nCj4g
PiA+IHNvIGl0IGlzIGEgc2FmZSByZXR1cm4gdmFsdWUuCj4gPiBZb3UncmUgcmlnaHQg4oCUICho
aSArIDEpOjAgaXMgZW5vdWdoIGZvciBoaS1sby1oaS4gVGhhbmsgeW91IGZvcgo+ID4gc3RpY2tp
bmcgdG8geW91ciBwb2ludDsgaXQgaGVscGVkIG1lIHRoaW5rIG1vcmUgY2FyZWZ1bGx5IGFuZAo+
ID4gdW5kZXJzdGFuZCB0aGUgc3VidGxldHkuCj4KPiBEb24ndCB3b3JyeSwgSSdsbCBoYXZlIHdy
aXR0ZW4gdGhlIGxvb3AgaW4gdGhlIHBhc3QuCj4gUHJvYmFibHkgYmVzdCBpcyByZWFkIG9sZF9o
aS1sby1oaSB0aGVuIGlmIChoaSAhPSBvbGRfaGkpIGxvID0gMApUaGlzIGlzIG1vcmUgY29uc2Vy
dmF0aXZlIHRoYW4gKGhpICsgMSk6MC4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
