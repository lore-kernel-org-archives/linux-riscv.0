Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211DCCA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Z7OuJNrT0h2f/TDeGl8KJ5C7jotXaneRk5AQ/j2BeI=; b=1ruXe1Kele4KWb
	WELHXNzqk1eLfgSNJB/wkpcxbmlIVti5AxtWzWKPdEpgKdA+uKpMvaMF87BOHapwO1lkXWyKgnewU
	TGifGVwqLcqaEFoAsGFGsy52KtPjSvcT02R539O735SVPL/hnSFx86sMgkIEwRyGT+GKbdQsUe2nB
	9BpJifdcrSk2j4FFEYOBS+BGIyoVqNXDMrtzJ+KyOMBOO6FVThJkUs/t7oH40myyx0CthSeRCnvYQ
	Ugr3tC2jzNpbcHnXSZwGQcdr9KWDKjv+IXF8ecXuNZ+/0Ja7+wD0+D6MlWAuMYE7wx7IZBRyeCHsh
	fIKlNoztzl/QpioxytCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0qr-0000000Dd5v-1XpE;
	Sat, 03 Oct 2026 14:36:37 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0qn-0000000Dd5K-16Mn;
	Sat, 03 Oct 2026 14:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791038153; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kLHYAhye2LfTlMwX0V6q6TTBkux+wUFvoV4mXNTnSVevlJCYF5FyMMRkdeFkH0XszsbgO+qYY2nuDmDtmuWaPe/Qry8FJt2ZBs79Ypjdi3fNNl4hpSYv+BiOAYPvjEGr930y6mI6YFb29oTMGzg8MfOcXrhEuaUKicppeQkNN0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791038153; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9Egv4q97ghG6oqT2h8uxYWEJx97iLxhYm/0+T/pO2i4=; 
	b=kRHyPxPAhgGthdAaCK3cR3qk8LPjw/tJr7goGPLgT4hdbGXJLOiOJ1lqY0IdtuTXa9XDacMAmTO1f4RS03uNFPlHZxXQGT2pAIugaTweekvCg9hn+GKltqoM9snXW4m7nB8EGOvghDWut1qOUqMP68/t2wHIXMBOcPKR2QN3pmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791038153;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:Reply-To;
	bh=9Egv4q97ghG6oqT2h8uxYWEJx97iLxhYm/0+T/pO2i4=;
	b=aVP6eu9QquEmV95y1DiK1BJcTJUnvthZ3+boRCVkxLohCUk8OTC/+kQtbqhGdwwC
	V3gRD61LqmAqz0zOpqvCC3f+OHP72cIIbFN5+2qPbvitDeoBI/XjkIeRaTIsvgm5ev7
	f6L/Rn7N7zv+L3ETm7cY0TEXFhKrt4FIczIQYM5w=
Received: by smtp.zohomail.com with SMTPS id 1791038151074231.15688188388413;
	Sat, 3 Oct 2026 07:35:51 -0700 (PDT)
Mime-Version: 1.0
Date: Sat, 03 Oct 2026 22:35:41 +0800
Message-Id: <DLVA17A4RRG7.2ECQKV3SJDAGI@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Enzo Adriano"
 <enzo.adriano.code@gmail.com>, "Andre Przywara" <andre.przywara@arm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Yixun Lan"
 <dlan@gentoo.org>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
 <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
In-Reply-To: <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_073633_788384_77AC9C90 
X-CRM114-Status: GOOD (  22.83  )
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

SGkgQ2hlbi1ZdSwKCk9uIFNhdCBPY3QgMywgMjAyNiBhdCA5OjM3IFBNIENTVCwgQ2hlbi1ZdSBU
c2FpIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDMwLCAyMDI2IGF0IDE6MjfigK9BTSBKdW5odWkgTGl1
IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+IHdyb3RlOgo+Pgo+PiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG1haW4gQ0NVIGFuZCB0aGUgUFJDTSBtb2R1bGUgKFItQ0NVKSBmb3VuZCBpbiB0aGUKPj4g
QWxsd2lubmVyIEE3MzMgU29DLiBUaGUgY2xvY2sgYXJjaGl0ZWN0dXJlIGlzIGRlcml2ZWQgZnJv
bSB0aGUgcHJldmlvdXMKPj4gQTUyMyBkZXNpZ24sIHdpdGggdGhlIE1DVV9DQ1UgcmVtb3ZlZCBh
bmQgdGhlIGNsb2NrIHRyZWUgZXh0ZW5kZWQgZm9yCj4+IHRoZSBhZGRpdGlvbmFsIGZ1bmN0aW9u
YWwgYmxvY2tzIGZvdW5kIG9uIHRoZSBBNzMzLgo+Pgo+PiBUaGUgQTczMyBpbnRyb2R1Y2VzIGEg
InBsbC1yZWYiIGNsb2NrIHRoYXQgbm9ybWFsaXplcyB0aGUgcGh5c2ljYWwKPj4gb3NjaWxsYXRv
ciBmcmVxdWVuY3ksIHdoaWNoIGNhbiBiZSAxOS4yTUh6LCAyNE1Ieiwgb3IgMjZNSHosIGludG8g
YQo+PiBjb25zaXN0ZW50IDI0TUh6IHJlZmVyZW5jZSBmb3IgdGhlIFBMTCBjbG9jayB0cmVlLgo+
Pgo+PiBUaGUgcGVyaXBoZXJhbCwgdmlkZW8sIGFuZCBERSBQTExzIHByb3ZpZGUgbXVsdGlwbGUg
aW5kZXBlbmRlbnRseSBnYXRlZAo+PiBvdXRwdXRzIHdpdGggcHJvZ3JhbW1hYmxlIGRpdmlkZXJz
LiBNb2RlbCB0aGVzZSBvdXRwdXRzIGFzIHNlcGFyYXRlCj4+IGRpdmlkZXItYW5kLWdhdGUgY2hp
bGQgY2xvY2tzLiBBbHNvIGZvbGxvdyB0aGUgZG9jdW1lbnRlZCBoaWVyYXJjaHkgZm9yCj4+IHRo
ZSBkZXJpdmVkIHBlcmlwaGVyYWwgUExMIG91dHB1dHMuIFRoZSBleHBsaWNpdGx5IG5hbWVkIFBM
TF9BVURJTzEgLzIKPj4gYW5kIC81IG91dHB1dHMgYXJlIG1vZGVsZWQgYXMgZml4ZWQtZmFjdG9y
IGNsb2Nrcywgd2l0aCB0aGVpciBkaXZpZGVyCj4+IGZpZWxkcyBpbml0aWFsaXplZCBhY2NvcmRp
bmdseS4KPj4KPj4gQWxzbyBleHRlbmQgdGhlIHN1bnhpLW5nIFNETSAoU2lnbWEtRGVsdGEgTW9k
dWxhdGlvbikgc3VwcG9ydCBmb3IgdGhlCj4+IGR1YWwtcGF0dGVybiByZWdpc3RlciBsYXlvdXQg
dXNlZCBieSB0aGUgQTczMyBQTExzLiBQTExfQVVESU8wIHVzZXMgdGhlCj4+IGR1YWwtcGF0dGVy
biBTRE0gc3VwcG9ydCB0byBzeW50aGVzaXplIGl0cyBmcmFjdGlvbmFsIG91dHB1dC4KPj4gUExM
X0FVRElPMSBkb2VzIG5vdCBleHBvc2UgZnJhY3Rpb25hbCByYXRlcywgYnV0IGl0cyBTRE0gY29u
dHJvbHMgYXJlCj4+IG1vZGVsZWQgc28gdGhhdCBzdGFsZSBzZXR0aW5ncyBsZWZ0IGJ5IGZpcm13
YXJlIGNhbiBiZSBkaXNhYmxlZCB3aGVuIGFuCj4+IGludGVnZXIgcmF0ZSBpcyBwcm9ncmFtbWVk
Lgo+Cj4gU29tZSBvZiB0aGUgY2xvY2sgY29udHJvbHMsIGxpa2UgdGhlIFBMTCBhbmQgQUhCL0FQ
QiBidXMgZGl2aWRlcnMsIGFyZQo+IHNlY3VyZSBieSBkZWZhdWx0IGFuZCBuZWVkIHRvIGJlIHNl
dCB0byBub24tc2VjdXJlIGZvciBMaW51eCB0byBiZSBhYmxlCj4gdG8gdXNlIHRoZW0gcHJvcGVy
bHkuIEFuZCB0aGVyZSBpcyBhbHNvIGEgVFdEIGNsb2NrIGluIHRoZSBQUkNNIHRoYXQgdGhlCj4g
dXNlciBtYW51YWwgc2F5cyBpcyBzZWN1cmUgb25seS4KPgo+IEhhdmUgeW91IGdpdmVuIGFueSB0
aG91Z2h0IHRvIHRoaXM/IElmIHdlIGVuZCB1cCBoYXZpbmcgdG8gY29udmVydCB0bwo+IFNDTUkg
b3Igc29tZXRoaW5nIHRvIGhhbmRsZSB0aG9zZSBjbG9ja3MgaXQncyBnb2luZyB0byBiZSBhIGJp
dCB1Z2x5Lgo+Cj4gQW5kIHByZXN1bWFibHkgdGhpbmdzIHdvcmsgbm93IGJlY2F1c2UgdGhlIHNl
Y3VyZS9ub24tc2VjdXJlIGFjY2VzcyBiaXQKPiBpc24ndCBpbiBlZmZlY3QgcmlnaHQgbm93IGJl
Y2F1c2UgeW91IGFyZW4ndCB1c2luZyBzZWN1cmUgYm9vdD8gQXQgbGVhc3QKPiB0aGlzIHdhcyBh
IHRoaW5nIGluIHRoZSBwYXN0Li4uCj4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIFRo
aXMgaXMgaW5kZWVkIHNvbWV0aGluZyBJIGhhZCBub3QKY29uc2lkZXJlZCBiZWZvcmUuIEkgd2ls
bCB0cnkgZW5hYmxpbmcgc2VjdXJlIGJvb3Qgb24gbXkgc3BhcmUgQ3ViaWUgQTdaCmJvYXJkIGFu
ZCB0ZXN0IGl0IG9uIGFjdHVhbCBoYXJkd2FyZS4KCkZvciB0aGUgUExMIGFuZCBBSEIvQVBCIGJ1
cyBjbG9jayBjb250cm9scywgdGhlIHVzZXIgbWFudWFsIGluZGljYXRlcwp0aGF0IHRoZSByZWxl
dmFudCBzZWN1cml0eSBiaXRzIGNhbiBiZSBzZXQgYnkgVEYtQSB0byBhbGxvdyB0aGUga2VybmVs
CnRvIGFjY2VzcyB0aGVzZSByZWdpc3RlcnMuIFRoaXMgYWxzbyBhcHBlYXJzIHRvIGJlIGhvdyB0
aGlzIGhhcwp0cmFkaXRpb25hbGx5IGJlZW4gaGFuZGxlZCBvbiBzdW54aSBwbGF0Zm9ybXMuIFNv
IEkgdGhpbmsgd2UgY2FuIGRvIHRoZQpzYW1lIGluIFRGLUEgZm9yIHRoZSBBNzMzLgoKRm9yIGJ1
c19yX3R3ZF9jbGssIEkgd2lsbCB0ZXN0IHdoZXRoZXIgdGhlIHJlZ2lzdGVyIGlzIGluZGVlZCBh
bHdheXMKc2VjdXJlLiBJZiBpdCBpcywgSSB0aGluayB0aGUgY2xvY2sgY2FuIGJlIHJlbW92ZWQg
ZnJvbSB0aGUga2VybmVsIGFuZApsZWZ0IGVuYWJsZWQgYnkgaXRzIGhhcmR3YXJlIHJlc2V0IHZh
bHVlIG9yIGJ5IHRoZSBib290IGZpcm13YXJlLgoKPgo+IFRoYW5rcwo+IENoZW5ZdQo+CgotLSAK
QmVzdCByZWdhcmRzLApKdW5odWkgTGl1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
