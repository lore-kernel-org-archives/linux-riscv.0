Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698DC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLtbYbdlPFux66b1Gg34yv21vM6NpTsDIEUZO1qURTg=; b=v8/edd1kDwtlt5
	5qKZZODWNMewJJE0ERYWv8HwH4ZMjayltrnZGXcnspb/xEgqDuT4NllyCL4rewHArdIHNq57Hkvg8
	7pofBtwnXXDV/Xywqz+FhCCW8sW0KqkY73LMEQq5cE+1JPoqLCpSq2/SMg2BRMLUboDP3J5PZyQiX
	T8I7aXtY8Vjb27VCWqPaAgzYkWbHXLl6xWH8rfhKMZZjISBtvS5NpVLE7vnKx04tp/0RITrZohtzu
	0iGavqfSo94jRA26jt/XzQnL7RhplS1vjq39/r7fWL1A8eZjdeC2o6ZaufP2JYJtfm5/r4tu6ANzn
	BBO6q1ev5A3edrAKG25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndFU-00000000R8f-2okg;
	Sat, 25 Jul 2026 14:21:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndFQ-00000000R8W-3Gh1
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 14:21:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D20B60A6E
	for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 14:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978261F00ADF
	for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784989261;
	bh=XY8MC71SnzeX56HU4E9bqCj1+66dX2IXIeiHX0g85Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m1R2zUlafNmL9NPWkTzThL/jw5aEs6NCB113IDMdgD9JvxrTXU52vCPZXwSWr///p
	 RfiS3PjJJrBVGztkjbl5u5NE/kfka7OMJuJ9EDWSy383ptHei8oW4u1Ghd22/7WWYi
	 OOZ8kc9ek7UMAVN8Cp+/yuptA/gScAMEtECaQJSOfUG7PCmn5qZMhbjcT25VdwYS1U
	 uzbHExfBkFGbEqNcbmf9+LwOOYooPLny8rvvbvczBIfA/gYeZ4FqTungS24LZHFw+v
	 sapW0UBszCgr//jz4rx6t+jJNL4Zwkh9qJRgJIP0LAsWGMAgikEhVs7AADWJGkUGZO
	 ojAM3GWxWaTtw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so11127261fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 07:21:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZPq8/iO+0CaV+oUjrM2FeAoS3JKXH6EmwZf3Og6WOjEVjrh9cbwpRiZmK3fpDOJNlVZEzZU/q+uDoNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo6DUVynaRcppZDFNK46xNR957ZUgHlf3VYWHmPtZAqWwDD9NZ
	pALFemZpgkMmp6G17oyym25X0GjjcVIF0wp0SRx5f0xdepD5nI+jxcoguAaT37cymlfpJDcG8DX
	KPbA7nJDXjV0PJtmJjezcqtxqmO51MgI=
X-Received: by 2002:a05:6512:1390:b0:5b1:5ee0:6662 with SMTP id
 2adb3069b0e04-5b2c1b6973fmr389925e87.51.1784989260287; Sat, 25 Jul 2026
 07:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com> <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:20:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
X-Gm-Features: AUfX_mx8pVfrmx8WsONlAC7SoRWaJsjzkzgK-nLnNjT-L4xyZdV9VUod-aCvGBI
Message-ID: <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

T24gU2F0LCBKdWwgMjUsIDIwMjYgYXQgMTI6MjXigK9QTSBDaGFuZ2h1YW5nIExpYW5nCjxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMywg
MjAyNiBhdCA3OjU04oCvQU0gQ2hhbmdodWFuZyBMaWFuZwo+ID4gPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+ID4gPiArc3RhdGljIHVuc2lnbmVkIGludCBqaGIx
MDBfZ3Bpb190b19waW4oc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkCj4gPiA+ICtpbnQg
Z3Bpbykgewo+ID4gPiArICAgICAgIHN0cnVjdCBqaGIxMDBfZ3Bpb19iYW5rICpiYW5rID0gamhi
MTAwX2djX3RvX2JhbmsoZ2MpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0dXJuIGJhbmstPmlk
ICogSkhCMTAwX05SX0dQSU9TX1BFUl9CQU5LICsgZ3BpbzsgfQo+ID4KPiA+IFRoaXMgdXN1YWxs
eSB0ZWxscyBtZSB0aGF0IEdQSU9fR0VORVJJQyBjYW4gYmUgdXNlZCBidXQgbWF5YmUgdGhpcyBo
YXMgYmVlbgo+ID4gZGlzY3Vzc2VkIGJlZm9yZS4uLgo+Cj4gSGVyZSwgdGhlIG1haW4gcHVycG9z
ZSBpcyB0byBjb252ZXJ0IEdQSU9zIGludG8gcGlucyBmb3IgY29uZmlndXJpbmcgY2VydGFpbiBw
aW5jdHJsCj4gc2V0dGluZ3MuIEkgaGF2ZW4ndCBmb3VuZCB0aGUgcGFydCB3aGVyZSBHUElPX0dF
TkVSSUMgY2FuIGFzc2lzdCB3aXRoIHRoaXMuCj4gQ2FuIHlvdSBwb2ludCBpdCBvdXQgZm9yIG1l
PyBUaGFuayB5b3UgdmVyeSBtdWNoLgoKTm9ybWFsbHkgR1BJTyBjaGlwcyB1c2UgdGhlIC5jb25m
aWcoKSBjYWxsYmFjayB3aGVuIHlvdSB3YW50IHRvCnNldCBwaW4gY29uZmlnIGZvciBhIGNlcnRh
aW4gcGluIGluIGEgcGluY3RybCBiYWNrZW5kLgoKU2VlIERvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS9ncGlvL2RyaXZlci5yc3Q6CgoiVGhlIC5zZXRfY29uZmlnKCkgY2FsbGJhY2sgdXNlcyB0aGUg
c2FtZSBlbnVtZXJhdG9ycyBhbmQgY29uZmlndXJhdGlvbgpzZW1hbnRpY3MgYXMgdGhlIGdlbmVy
aWMgcGluIGNvbnRyb2wgZHJpdmVycy4gVGhpcyBpcyBub3QgYSBjb2luY2lkZW5jZTogaXQgaXMK
cG9zc2libGUgdG8gYXNzaWduIHRoZSAuc2V0X2NvbmZpZygpIHRvIHRoZSBmdW5jdGlvbiBncGlv
Y2hpcF9nZW5lcmljX2NvbmZpZygpCndoaWNoIHdpbGwgcmVzdWx0IGluIHBpbmN0cmxfZ3Bpb19z
ZXRfY29uZmlnKCkgYmVpbmcgY2FsbGVkIGFuZCBldmVudHVhbGx5CmVuZGluZyB1cCBpbiB0aGUg
cGluIGNvbnRyb2wgYmFjay1lbmQgImJlaGluZCIgdGhlIEdQSU8gY29udHJvbGxlciwgdXN1YWxs
eQpjbG9zZXIgdG8gdGhlIGFjdHVhbCBwaW5zLiBUaGlzIHdheSB0aGUgcGluIGNvbnRyb2xsZXIg
Y2FuIG1hbmFnZSB0aGUgYmVsb3cKbGlzdGVkIEdQSU8gY29uZmlndXJhdGlvbnMuCgpJZiBhIHBp
biBjb250cm9sbGVyIGJhY2stZW5kIGlzIHVzZWQsIHRoZSBHUElPIGNvbnRyb2xsZXIgb3IgaGFy
ZHdhcmUKZGVzY3JpcHRpb24gbmVlZHMgdG8gcHJvdmlkZSAiR1BJTyByYW5nZXMiIG1hcHBpbmcg
dGhlIEdQSU8gbGluZSBvZmZzZXRzIHRvIHBpbgpudW1iZXJzIG9uIHRoZSBwaW4gY29udHJvbGxl
ciBzbyB0aGV5IGNhbiBwcm9wZXJseSBjcm9zcy1yZWZlcmVuY2UgZWFjaCBvdGhlci4iCgpNYXli
ZSB0aGlzIGlzIHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yPwoKSWYgeW91IGRlZmluZSBncGlvLXJh
bmdlcyBpbiB5b3VyIGRldmljZSB0cmVlLCB0aGUgR1BJTyBhbmQgcGluIGNvbnRyb2wKY29yZSBk
ZWFscyB3aXRoIHRoZSBjcm9zcy1yZWZlcmVuY2luZyBmb3IgeW91LgoKPiA+ID4gKyAgICAgICBz
ZnAtPm51bV9iYW5rcyA9IERJVl9ST1VORF9VUChzZnAtPm5ncGlvcywKPiA+ID4gKyBKSEIxMDBf
TlJfR1BJT1NfUEVSX0JBTkspOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZm9yICh1bnNpZ25lZCBp
bnQgaSA9IDA7IGkgPCBzZnAtPm51bV9iYW5rczsgaSsrKSB7Cj4gPiA+ICsgICAgICAgICAgICAg
ICBpZiAoc2ZwLT5uZ3Bpb3MgPiAoaSArIDEpICoKPiA+IEpIQjEwMF9OUl9HUElPU19QRVJfQkFO
SykKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2ZwLT5iYW5rc1tpXS5nYy5uZ3BpbyA9
IChpICsgMSkgKgo+ID4gSkhCMTAwX05SX0dQSU9TX1BFUl9CQU5LOwo+ID4gPiArICAgICAgICAg
ICAgICAgZWxzZQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzZnAtPmJhbmtzW2ldLmdj
Lm5ncGlvID0gc2ZwLT5uZ3Bpb3MgLSBpICoKPiA+ID4gKyBKSEIxMDBfTlJfR1BJT1NfUEVSX0JB
Tks7Cj4gPgo+ID4gVGhpcyBsb29rcyBjb21wbGV0ZWx5IGJhbmFuYXMsIHNob3VsZG4ndCB0aGlz
IGJlIHNpbXBseToKPiA+Cj4gPiBzZnAtPmJhbmtzW2ldLmdjLm5ncGlvID0gSkhCMTAwX05SX0dQ
SU9TX1BFUl9CQU5LOwo+Cj4gVGhlIEpIQjEwMCBHUElPIGRvbWFpbiBpcyBub3QgZnVsbHkgYWxp
Z25lZCB0byAzMi4gRm9yIGV4YW1wbGUsIGluIHRoZSBwZXIwIGRvbWFpbiwKPiB0aGVyZSBhcmUg
NjAgR1BJT3MsIHNvIEkgc3BsaXQgaXQgaW50bzoKPiBiYW5rMDogMzIgR1BJT3MKPiBiYW5rMTog
MjggR1BJT3MuCgpBdCBsZWFzdCBhZGQgdGhhdCwgd2hhdCB5b3UganVzdCB3cm90ZSwgYXMgYSBj
b21tZW50IHJpZ2h0IGFib3ZlIHRoaXMgbG9vcC4KClRoZXJlIGlzIHNvbWV0aGluZyB3aXRoIHRo
aXMgbWF0aCBJIHRoaW5rIGNhbiBiZSBtYWRlIHNpbXBsZXIKd2l0aCBiaXR3aXNlIGFydGl0aG1l
dGljLiBUaGluayBhYm91dCBpdC4KCj4gPiA+ICsgICAgICAgICAgICAgICBzZnAtPmJhbmtzW2ld
LmdjLnJlcXVlc3QgPSBwaW5jdHJsX2dwaW9fcmVxdWVzdDsKPiA+Cj4gPiBVc2UKPiA+IGdwaW9j
aGlwX2dlbmVyaWNfcmVxdWVzdAo+ID4KPiA+ID4gKyAgICAgICAgICAgICAgIHNmcC0+YmFua3Nb
aV0uZ2MuZnJlZSA9IHBpbmN0cmxfZ3Bpb19mcmVlOwo+ID4KPiA+IFVzZQo+ID4gZ3Bpb2NoaXBf
Z2VuZXJpY19mcmVlCj4gPgo+ID4gVGhlc2UgY2FsbHMgd2lsbCBkbyB3aGF0IHlvdSB3YW50LCBh
bmQgYWxzbyBjaGVjayB0aGF0IHRoZSByaWdodCBncGlvIHJhbmdlcwo+ID4gYXJlIGF2YWlsYWJs
ZS4KPiA+Cj4gPiBNYWtlIHN1cmUgeW91IGFkZCBHUElPIHJhbmdlcyAodGhlIG1hcHBpbmcgYmV0
d2VlbiBwaW4gY29udHJvbCBwaW5zIGFuZAo+ID4gY29ycmVzcG9uZGluZyBHUElPIG9mZnNldHMp
IGZvciB0aGlzIHRvIHdvcmsgcHJvcGVybHkuCj4gPgo+ID4gSSdtIHByZXR0eSBzdXJlIHlvdSBj
YW4gaGF2ZSBhIGdlbmVyaWMgcGluIGNvbmZpZyBiYWNrZW5kIGFzIHdlbGwuCj4gPgo+ID4gc2Zw
LT5iYW5rc1tpXS5nYy5zZXRfY29uZmlnID0gZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWc7CgpUaGlz
IGlzIHBlcnRhaW5pbmcgdG8gd2hhdCBJIHNhaWQgYWJvdmUgYWJvdXQgdXNpbmcgdGhlIGdwaW8K
cmFuZ2VzIGFuZCAuY29uZmlnIGV0Yy4KCj4gPiBUaGlzIHdpbGwgbWFrZSBjb25maWcgY2FsbHMg
dG8gdGhlIGdwaW9jaGlwIGNhbGwgaW50byB0aGUgcGluY3RybCBiYWNrZW5kID0gd2hhdAo+ID4g
eW91IHdhbnQuCgpJIHN0aWxsIHRoaW5rIHRoaXMgaXMgd2hhdCB5b3Ugd2FudC4KCllvdXJzLApM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
