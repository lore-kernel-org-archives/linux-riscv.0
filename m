Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68EEC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Z8nmgafr/+0GLw3tD//T26K2VuSheY2Arc35dOIPXM=; b=gjitbOWES+VrOc
	wjA15k3kmTxJg8Js0zEHphRfd/yO1S7QFRwiCJi7vFoC5lcYXxx9kNxn0jxYFMg0VyhYPOH+iw7Fz
	H5E/sd6SbH6pr88BKUxdQaoP/fva9ZeyWdm66CQtD7pEIt+uVxJIBFz3jl+aCkReAJf2X7ioUfiD/
	Yvlfpov5gOkH5WEjnyjHYn8JKgxkeGJdvNr+QUn5kkazYDpCzB6HwHzB9fpjkkTIMn+J8GqRLHznF
	u5Ol5ETcyLb2kqRg68xrTyecnUyhB7LRjpkh5Xm6zaEReuyYouxMd2f0GGdcDJmO8ke1r8m356ybY
	mf1BgwD30w8Gr0FFAlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMflP-0061B5-VR; Tue, 31 Jan 2023 01:48:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMflM-0061Af-Gp
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 01:48:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 096036123A
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F12FC433A4
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675129723;
	bh=K/yjW5Nk+aszNLr45x2MctvZq4mHC7XfhLAHpxR9Iyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JEqiA6CKjGCWt72BlyrT7IuQAgV1yG8HkFcs+fchVfhK/HrvjOv8k0+A73mffzJXf
	 aETCY+VnRSjmlJEjB6rckHGQh9H+nGnU5lMvDHyQMzQCpasi0kWDFZ1JkVzWP254gg
	 9nwiuW/vA5gV5pyKeQbZZoFBr83pO4n55V2bgNnhC5zRZ9hiAY7o5NOmEV+d1LV8Ij
	 aAc7sKvSlTQm6T1j4xvdF95G4zfgBg6CwpQP1pIypm7u/DG20o6U0rsM8XoSUzva5L
	 83EVu1kKs8MnvShzd6qq18c38fHEjL0H29ZF1IDiwgxSxmtbPaW/8mmBeIWTgqPsSZ
	 dy7uHOunhnzTQ==
Received: by mail-ed1-f42.google.com with SMTP id be12so1711324edb.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 17:48:43 -0800 (PST)
X-Gm-Message-State: AO0yUKWMk3od6JWgCM4TKW1klg+UI0rZvvxsbJQ904rSes5FNlYGMljq
	hqCSVUDodi33MD4DfQvWMQMJQMneug6asrQJSBw=
X-Google-Smtp-Source: AK7set86ZLrbSDX6C8yFFLgbGhZwssXS3Isjcf+A2euqyYBysQ7/UnXRcMOITEhGoE6uyALpI2oj7zA3pHnkV3M5qPY=
X-Received: by 2002:a05:6402:291:b0:4a2:1776:631b with SMTP id
 l17-20020a056402029100b004a21776631bmr3407030edv.30.1675129721469; Mon, 30
 Jan 2023 17:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
In-Reply-To: <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 09:48:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
Message-ID: <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: Mark Rutland <mark.rutland@arm.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_174844_664413_2546A377 
X-CRM114-Status: GOOD (  37.29  )
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

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMTE6NDkgUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSBCam9ybiwKPgo+IE9uIE1vbiwgSmFuIDMwLCAyMDIz
IGF0IDA0OjI4OjE1UE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gPiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+ID4KPiA+ID4+IEluIHRoZSBzZXJpZSBvZiBSSVND
ViBPUFRQUk9CRVMgWzFdLCBpdCBwYXRjaGVzIGEgbG9uZy1qdW1wIGluc3RydWN0aW9ucyBwYWly
Cj4gPiA+PiBBVUlQQy9KQUxSIGluIGtlcm5lbCB0ZXh0LCBzbyBpbiBvcmRlciB0byBlbnN1cmUg
b3RoZXIgQ1BVcyBkb2VzIG5vdCBleGVjdXRlCj4gPiA+PiBpbiB0aGUgaW5zdHJ1Y3Rpb25zIHRo
YXQgd2lsbCBiZSBtb2RpZmllZCwgaXQgaXMgc3RpbGwgbmVlZCB0byBzdG9wIG90aGVyIENQVXMK
PiA+ID4+IHZpYSBwYXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlv
biB0byBhY2hpZXZlIHRoZSBwdXJwb3NlPwo+ID4gPiAgLSBUaGUgc3RvcF9tYWNoaW5lIGlzIGFu
IGV4cGVuc2l2ZSB3YXkgYWxsIGFyY2hpdGVjdHVyZXMgc2hvdWxkCj4gPiA+IGF2b2lkLCBhbmQg
eW91IGNvdWxkIGtlZXAgdGhhdCBpbiB5b3VyIE9QVFBST0JFUyBpbXBsZW1lbnRhdGlvbiBmaWxl
cwo+ID4gPiB3aXRoIHN0YXRpYyBmdW5jdGlvbnMuCj4gPiA+ICAtIFRoZSBzdG9wX21hY2hpbmUg
Y291bGRuJ3Qgd29yayB3aXRoIFBSRUVNUFRJT04sIHNvIHlvdXIKPiA+ID4gaW1wbGVtZW50YXRp
b24gbmVlZHMgdG8gd29yayB3aXRoICFQUkVFTVBUSU9OLgo+ID4KPiA+IC4uLmFuZCBzdG9wX21h
Y2hpbmUoKSB3aXRoICFQUkVFTVBUSU9OIGlzIGJyb2tlbiBhcyB3ZWxsLCB3aGVuIHlvdSdyZQo+
ID4gcmVwbGFjaW5nIG11bHRpcGxlIGluc3RydWN0aW9ucyAoc2VlIE1hcmsncyBwb3N0IGF0IFsx
XSkuIFRoZQo+ID4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdyZSBy
ZXBsYWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4gPiBub3QgbXVsdGlwbGUgYXMgaW4gdGhlIFJJ
U0MtViBjYXNlLiBJJ2xsIGV4cGFuZCBvbiB0aGlzIGluIGEgY29tbWVudCBpbgo+ID4gdGhlIE9Q
VFBST0JFUyB2NiBzZXJpZXMuCj4KPiBKdXN0IHRvIGNsYXJpZnksIG15IGNvbW1lbnRzIGluIFsx
XSB3ZXJlIGFzc3VtaW5nIHRoYXQgc3RvcF9tYWNoaW5lKCkgd2FzIG5vdAo+IHVzZWQsIGluIHdo
aWNoIGNhc2UgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggb3Igd2l0aG91dCBQUkVFTVBUSU9OLgo+
Cj4gSSBiZWxpZXZlIHRoYXQgd2hlbiB1c2luZyBzdG9wX21hY2hpbmUoKSwgdGhlICFQUkVFTVBU
SU9OIGNhc2UgaXMgZmluZSwgc2luY2UKPiBzdG9wX21hY2hpbmUoKSBzY2hlZHVsZXMgd29yayBy
YXRoZXIgdGhhbiBydW5uaW5nIHdvcmsgaW4gSVJRIGNvbnRleHQgb24gdGhlCj4gYmFjayBvZiBh
biBJUEksIHNvIG5vIENQVXMgc2hvdWxkIGJlIG1pZC1zZXF1bmNlIGR1cmluZyB0aGUgcGF0Y2hp
bmcsIGFuZCBpdCdzCj4gbm90IHBvc3NpYmxlIGZvciB0aGVyZSB0byBiZSB0aHJlYWRzIHdoaWNo
IGFyZSBwcmVlbXB0ZWQgbWlkLXNlcXVlbmNlLgo+Cj4gVGhhdCBhbGwgc2FpZCwgSUlVQyBvcHRw
cm9iZXMgaXMgZ29pbmcgdG8gZGlzYXBwZWFyIG9uY2UgZnByb2JlIGlzIHJlYWR5Cj4gZXZlcnl3
aGVyZSwgc28gdGhhdCBtaWdodCBiZSBtb290LgpUaGUgb3B0cHJvYmVzIGNvdWxkIGJlIGluIHRo
ZSBtaWRkbGUgb2YgYSBmdW5jdGlvbiwgYnV0IGZwcm9iZSBtdXN0IGJlCnRoZSBlbnRyeSBvZiBh
IGZ1bmN0aW9uLCByaWdodD8KCkRvZXMgeW91ciBmcHJvYmUgaGVyZSBtZWFuOiA/CgpUaGUgTGlu
dXgga2VybmVsIGNvbmZpZ3VyYXRpb24gaXRlbSBDT05GSUdfRlBST0JFOgoKcHJvbXB0OiBLZXJu
ZWwgRnVuY3Rpb24gUHJvYmUgKGZwcm9iZSkKdHlwZTogYm9vbApkZXBlbmRzIG9uOiAoIENPTkZJ
R19GVU5DVElPTl9UUkFDRVIgKSAmJiAoCkNPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1Mg
KSAmJiAoIENPTkZJR19IQVZFX1JFVEhPT0sgKQpkZWZpbmVkIGluIGtlcm5lbC90cmFjZS9LY29u
ZmlnCgoKPgo+IFRoYW5rcywKPiBNYXJrLgo+Cj4gPiA+PiA+ICBzdGF0aWMgdm9pZCBfX2twcm9i
ZXMgYXJjaF9wcmVwYXJlX3NpbXVsYXRlKHN0cnVjdCBrcHJvYmUgKnApCj4gPiA+PiA+IEBAIC0x
MTQsMTYgKzEyMCwyMyBAQCB2b2lkICphbGxvY19pbnNuX3BhZ2Uodm9pZCkKPiA+ID4+ID4gIC8q
IGluc3RhbGwgYnJlYWtwb2ludCBpbiB0ZXh0ICovCj4gPiA+PiA+ICB2b2lkIF9fa3Byb2JlcyBh
cmNoX2FybV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ID4+ID4gIHsKPiA+ID4+ID4gLSAg
ICAgaWYgKChwLT5vcGNvZGUgJiBfX0lOU05fTEVOR1RIX01BU0spID09IF9fSU5TTl9MRU5HVEhf
MzIpCj4gPiA+PiA+IC0gICAgICAgICAgICAgcGF0Y2hfdGV4dChwLT5hZGRyLCBfX0JVR19JTlNO
XzMyKTsKPiA+ID4+ID4gLSAgICAgZWxzZQo+ID4gPj4gPiAtICAgICAgICAgICAgIHBhdGNoX3Rl
eHQocC0+YWRkciwgX19CVUdfSU5TTl8xNik7Cj4gPiA+PiA+ICsjaWZkZWYgQ09ORklHX1JJU0NW
X0lTQV9DCj4gPiA+PiA+ICsgICAgIHUzMiBvcGNvZGUgPSBfX0JVR19JTlNOXzE2Owo+ID4gPj4g
PiArI2Vsc2UKPiA+ID4+ID4gKyAgICAgdTMyIG9wY29kZSA9IF9fQlVHX0lOU05fMzI7Cj4gPiA+
PiA+ICsjZW5kaWYKPiA+ID4+ID4gKyAgICAgcGF0Y2hfdGV4dF9ub3N5bmMocC0+YWRkciwgJm9w
Y29kZSwgR0VUX0lOU05fTEVOR1RIKG9wY29kZSkpOwo+ID4gPj4KPiA+ID4+IFNvdW5kcyBnb29k
LCBidXQgaXQgd2lsbCBsZWF2ZSBzb21lIFJWSSBpbnN0cnVjdGlvbiB0cnVuY2F0ZWQgaW4ga2Vy
bmVsIHRleHQsCj4gPiA+PiBpIGRvdWJ0IGtlcm5lbCBiZWhhdmlvciBkZXBlbmRzIG9uIHRoZSBy
ZXN0IG9mIHRoZSB0cnVuY2F0ZWQgaW5zdHJ1Y3Rpb24sIHdlbGwsCj4gPiA+PiBpdCBuZWVkcyBt
b3JlIHN0cmljdCB0ZXN0aW5nIHRvIHByb3ZlIG15IGNvbmNlcm4gOikKPiA+ID4gSSBkbyB0aGlz
IG9uIHB1cnBvc2UsIGFuZCBpdCBkb2Vzbid0IGNhdXNlIGFueSBwcm9ibGVtcy4gRG9uJ3Qgd29y
cnk7Cj4gPiA+IElGVSBodyBtdXN0IGVuZm9yY2UgdGhlIGZldGNoIHNlcXVlbmNlLCBhbmQgdGhl
cmUgaXMgbm8gd2F5IHRvIGV4ZWN1dGUKPiA+ID4gYnJva2VuIGluc3RydWN0aW9ucyBldmVuIGlu
IHRoZSBzcGVjdWxhdGl2ZSBleGVjdXRpb24gcGF0aC4KPiA+Cj4gPiBUaGlzIGlzIHN0cmV0Y2hp
bmcgcmVhbGl0eSBhIGJpdCBtdWNoLiBBUk12OCwgZS5nLiwgaGFzIGEgY2hhcHRlciBpbiB0aGUK
PiA+IEFybSBBUk0gWzJdIEFwcGVuZGl4IEIgIkNvbmN1cnJlbnQgbW9kaWZpY2F0aW9uIGFuZCBl
eGVjdXRpb24gb2YKPiA+IGluc3RydWN0aW9ucyIgKENNT0RYKS4gKlNvbWUqIGluc3RydWN0aW9u
cyBjYW4gYmUgcmVwbGFjZWQgY29uY3VycmVudGx5LAo+ID4gYW5kIG90aGVycyBjYW5ub3Qgd2l0
aG91dCBjYXV0aW9uLiBBc3N1bWluZyB0aGF0IHRoYXQgYWxsIFJJU0MtVgo+ID4gaW1wbGVtZW50
YXRpb25zIGNhbiwgaXMgYSBzdHJldGNoLiBSSVNDLVYgaGFzbid0IGV2ZW4gc3BlY2lmaWVkIHRo
ZQo+ID4gYmVoYXZpb3Igb2YgQ01PRFggKHdoaWNoIGlzIHByb2JsZW1hdGljKS4KPiA+Cj4gPiBJ
ZiBhbnl0aGluZyBpdCB3b3VsZCBiZSBtb3JlIGxpa2VseSB0aGF0IHRoZSBleGlzdGluZwo+ID4g
InN0b3BfbWFjaGluZSgpLXRvLXJlcGxhY2Utd2l0aC1lYnJlYWsiIHdvcmtzIChhZ2FpbiwgcmVw
bGFjaW5nIG9uZQo+ID4gaW5zdHJ1Y3Rpb24gZG9lcyBub3QgaGF2ZSB0aGUgIVBSRUVNUFRJT04g
aXNzdWVzKS4gVGhlbiBhZ2Fpbiwgbm8gc3BlYywKPiA+IHNvIG1vc3RseSBndWVzc2luZyBmcm9t
IG15IHNpZGUuIDotKAo+ID4KPiA+IE9oLCBidXQgdGhlIGV4aXN0aW5nICJlYnJlYWsgcmVwbGFj
ZSIgbWlnaHQgYmUgYnJva2VuIGxpa2UgWzNdLgo+ID4KPiA+Cj4gPiBCasO2cm4KPiA+Cj4gPgo+
ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L1k3JTJGNkF0WDVYMCs1
cUY2WUBGVkZGNzdTMFEwNU4vCj4gPiBbMl0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1
bWVudGF0aW9uL2RkaTA0ODcvbGF0ZXN0Cj4gPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyMzAxMjYxNzA2MDcuMTQ4OTE0MS0yLWd1b3JlbkBrZXJuZWwub3JnLwoK
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
