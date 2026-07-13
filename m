Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0BC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 23:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6UqJUcix8O/5aTI1AJ8M0La1EqfRVRHNs5YfJrukzc=; b=LU/TJgDE+H84Qn
	9STAYNz93TOvAQ1YzBsIr30MNEzH1+3btr+FlyrCudZcQxYTvO9Mv8BbSoDmihvfm9SnLVaO/S2id
	BT8TC0SFZeWeQ96WeU8JRKgyuS5/vGG+gVrKFbnEpfcIuDutP/OL9Ez3WPBwmrLztZNw2BAQ/hIQK
	f9KzZT4YQEt68Nt96R5UkUVYFDJlbahwj3DD4qMYuVHFY1sxFVnFR8dp+Um8SzZ9rqFcEKYKixScp
	xPLHyLzwF7O6V2di9ksG6a2gFf9q6Xu+YM5dVhY50PEQhH1s1ReVYFkuhd2HFty/5DE0Kr1JfiCRz
	sHeRrziirQrRCN8zA2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQWx-0000000AZds-04uZ;
	Mon, 13 Jul 2026 23:57:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQWv-0000000AZdm-3MCZ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 23:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 961074175D;
	Mon, 13 Jul 2026 23:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FE21F000E9;
	Mon, 13 Jul 2026 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783987064;
	bh=xIhyR3zgIocehUTam0YtcBB6EqA+r73EXcnFWOui1a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fq7zOW9xN/onRd4/dFSQRSTXLCOxG14Xv/GM3rN4tHxAaVmnlvkQkaMZvRc5tkni/
	 OmgLQuza8B/thbJq8udck8bYCe2DrMcooTzy28LTcKkDE6c43PVO8w52FDiqolhibu
	 wTPypcN3vs9GoQRP32YsTmjSVfcJkS78xZc8HjTn/uwtr0TGKMirpvK7d63tASXw90
	 GCXbPFkqqySHnXWKNDb7GNCHj0111QOz+PBD/2cx7YOGADFadkD92F0lEmAkoPoz9O
	 pnbIGwJYdNUSdP7qBrxzem0u5tGaLwtXuqBh40GVMuLLzL+d4LfEI7cY/6TZmNMGCy
	 Vq2LNGgiUdlcA==
Date: Mon, 13 Jul 2026 23:57:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <20260713235742-GKE106000@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
 <20260713123759-GKD106000@kernel.org>
 <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEev2e-g3bZcohFf_7b5CaVyi0BeWi5uwLGj6MuhQXp16jiyEQ@mail.gmail.com>
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

SGkgQW5pcnVkaCwKCk9uIDA5OjU2IE1vbiAxMyBKdWwgICAgICwgQW5pcnVkaCBTcmluaXZhc2Fu
IHdyb3RlOgo+IEhpIFlpeHVuLAo+IAo+IE9uIE1vbiwgSnVsIDEzLCAyMDI2IGF0IDc6MzjigK9B
TSBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgQW5pcnVkaCwK
PiA+Cj4gPiBPbiAyMjo0MCBTdW4gMTIgSnVsICAgICAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90
ZToKPiA+ID4gSGkgWWl4dW4sCj4gPiA+Cj4gPiA+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDAy
OjMxOjM0QU0gKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPiA+ID4gPiBUaGlzIHNlcmllcyB0cnkg
dG8gYWRkIFVGUyBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMyBTb0MsIHRoZSBjb250cm9sbGVyCj4g
PiA+ID4gY29tcG9uZW50cyBjb25zaXN0cyBvZiBTeXN0ZW0gQnVzIEludGVyZmFjZSBVbml0LCBV
RlMgSG9zdCBDb250cm9sbGVyCj4gPiA+ID4gSW50ZXJmYWNlLCBVRlMgVHJhbnNwb3J0IFByb3Rv
Y29sIExheWVyLCBVRlMgSG9zdCBSZWdpc3RlcnMsIERldmljZQo+ID4gPiA+IE1hbmFnZW1lbnQg
RW50aXR5IChETUUpLCBUcmFuc3BvcnQgTGF5ZXIsIE5ldHdvcmsgTGF5ZXIsIERhdGEgTGluawo+
ID4gPiA+IExheWVyLCBQSFkgQWRhcHRlciBMYXllciwgYW5kIE0tUEhZIEludGVyZmFjZS4gQSBt
b3JlIGRldGFpbCBmdW5jdGlvbmFsCj4gPiA+ID4gYmxvY2sgZGlhZ3JhbSBjYW4gYmUgZm91bmQg
aW4gU3BhY2VtaVQgd2Vic2l0ZSwgY2hhcHRlciA5LjcuMyBbMV0KPiA+ID4gPgo+ID4gPiA+IFBs
ZWFzZSBub3RlLCBpbiBvcmRlciB0byB0ZXN0IHRoaXMgZHJpdmVyLCB0aGUgVUZTIGNsb2NrIGRy
aXZlclsyXSBoZXJlCj4gPiA+ID4gc2hvdWxkIGJlIGFwcGxpZWQgZmlyc3QgYXMgYSBwcmVyZXF1
aXNpdGUgcGF0Y2guCj4gPiA+ID4KPiA+ID4gPiBPbmUga25vd24gaXNzdWUgaXMgdGhhdCB0aGUg
ZGV2aWNlIHdpbGwgb2NjYXNpb25hbGx5IHJhaXNlIEJLT1BTIGludGVycnVwdAo+ID4gPiA+IHdo
ZW4gZG9pbmcgc29tZSBoaWdoIGxvYWQgdGVzdCwgbG9nIGZyb20gZG1lc2cgc2hvd3MKPiA+ID4g
Pgo+ID4gPiA+IFsgIDgwNi43MTA3NjNdIHVmc2hjZC1zcGFjZW1pdCBjMGUwMDAwMC51ZnNoYzog
dWZzaGNkX2Jrb3BzX2V4Y2VwdGlvbl9ldmVudF9oYW5kbGVyOiBkZXZpY2UgcmFpc2VkIHVyZ2Vu
dCBCS09QUyBleGNlcHRpb24gZm9yIGJrb3BzIHN0YXR1cyAxCj4gPiA+ID4KPiA+ID4gPiBMaW5r
OiBodHRwczovL3NwYWNlbWl0LmNvbS9jb21tdW5pdHkvZG9jdW1lbnQvaW5mbz9ub2RlcGF0aD1o
YXJkd2FyZS9rZXlfc3RvbmUvazMvazNfZG9jcy9rM191c2VybWFudWFsLzA5X21lbW9yeV9zdG9y
YWdlLm1kJmxhbmc9ZW4gWzFdCj4gPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwNjMwLTA2LWNsay11ZnMtc3VwcG9ydC12MS0wLWNmNzUyMWQxZDBmZUBrZXJuZWwu
b3JnLyBbMl0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9y
Zz4KPiA+ID4KPiA+ID4gSSBzZWUgdGhpcyBkdXJpbmcgcHJvYmUgb24gYSBrMy1waWNvLWl0eC4g
RG9lcyB0aGUgVUZTIGNoaXAgb24gYm9hcmQKPiA+ID4gaGF2ZSBhbiBSUE1CIGJsb2NrIG9uIGl0
PyBJcyB0aGlzIGVycm9yIG9mIGFueSBjb25jZXJuLgo+ID4gPgo+ID4gSXQncyBwcm9iYWJseSB0
cnVlIG9mIGhhdmluZyBhIFJQTUIgYmxvY2ssIGJ1dCBub3QgdXNlZCBpbiBLMyBwbGF0Zm9ybSwg
c28gY2FuIGlnbm9yZQo+ID4KPiA+ID4gWyAgICA1Ljk1Nzg2NF0gdWZzaGNkLXNwYWNlbWl0IGMw
ZTAwMDAwLnVmc2hjOiB1ZnNoY2Rfc2NzaV9hZGRfd2x1czogQk9PVCBXTFVOIG5vdCBmb3VuZAou
Lgo+ID4gPiBbICAgIDUuOTYzMzE5XSBidXNfYWRkX2RldmljZTogY2Fubm90IGFkZCBkZXZpY2Ug
J3Vmc19ycG1iMCcgdG8gdW5yZWdpc3RlcmVkIGJ1cyAndWZzX3JwbWInCgpKdXN0IGNoZWNrZWQg
Y29kZSB1bmRlciBkcml2ZXJzL3Vmcy8sIGFuZCBjb3VsZG4ndCBmaW5kIHdoZXJlIHVmc19ycG1i
IGJ1cyBpcyByZWdpc3RlcmVkLApzbyB0aGlzIGtpbmQgb2Ygd2FybmluZy9lcnJvciBtZXNzYWdl
IGlzIGV4cGVjdGVkLCBvciBjb3VsZCBVRlMgbWFpbnRhaW5lciBjb25maXJtIHRoaXM/Cgo+ID4g
PiBbICAgIDUuOTcxMTU1XSB1ZnNoY2Qtc3BhY2VtaXQgYzBlMDAwMDAudWZzaGM6IEZhaWxlZCB0
byByZWdpc3RlciBVRlMgUlBNQiBkZXZpY2UgMAo+ID4gPgo+ID4gTWF5YmUgZGlzYWJsZSBDT05G
SUdfUlBNQiB0byBzaWxlbnQgdGhpcz8gSSd2ZSBub3QgdGVzdGVkIHRoaXMgb3B0aW9uIGxvY2Fs
bHkKPiAKPiBJJ20gdGVzdGluZyBvbiBhIGRpc3RybyBkZWZjb25maWcsIHNvIGl0IGhhcyB0aGlz
IG9wdGlvbiBlbmFibGVkLgo+IAo+IElzIHRoZXJlIGFueXRoaW5nIHdlIGNhbiBkbyBpbiB0aGUg
ZHJpdmVyIHRvIGhhdmUgaXQgaWdub3JlIHRoZSBSUE1CPwoKTm8sIGJ1dCB3aHkgbm90IGRpc2Fi
bGUgQ09ORklHX1JQTUIgaW4gdGhlIGZpcnN0IHBsYWNlCgo+IElmIHRoZSBlcnJvciBpcyBhIHJl
ZC1oZXJyaW5nLCB3ZSBzaG91bGRuJ3QgYmUgZGlzcGxheWluZyBpdCBhdCBhbGwgaW4KPiB0aGUg
Zmlyc3QgcGxhY2UuCj4gCgpFaXRoZXIgZml4IHRoZSBjb2RlIG9yIGp1c3QgaWdub3JlIGl0Li4K
Ci0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
