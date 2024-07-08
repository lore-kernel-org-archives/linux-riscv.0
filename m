Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D8DC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKJ221zhjnZxtiThK4MmXMmoGhv7sJExgLWPsQhd3yQ=; b=LqS5hptAP2sgq6
	agTbQru73wH2z0pSN228npgRz0yCnuzKd3XfdpBmhsaUvw331SzCn1toUh4zP1vBCd52yAygT/v27
	djERfimuGtFB4mcrJ6w59IylorEHhyNsF1NnGUXADoXnlc3HtLKF5Xfq1LFA6gPur03sWxGjayR+v
	Jqz65TklJVsS6nGNW/S3Mm+KM22X6Y4u25zF1BwJLv8mc5zYNg9RybXULoXI9KG50YxFK+5/wpxVu
	nISfQCTuRH40jt7Cgz3JmZO4vnnjdlIl9ydhWmSm/elC4OH51RPkW94JlDlRR7W/C3J9mYLKH5Gas
	PS69Ewh/cSGYrz0MnISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnPP-00000003lvs-2KZy;
	Mon, 08 Jul 2024 12:23:55 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnPL-00000003luC-3nEc
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 12:23:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7847540006;
	Mon,  8 Jul 2024 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720441427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JsbKApEK51Bmx24wtoB9YLZiYCpQ37ANs0wnRzdLyY=;
	b=dJ9+nW/o+fVVXF1/oX60X3/1FFNguSv7QqTgpSH6ISm1XaTz7AKXh9iLkm92nIsZXzGC/D
	JV+ZzNriHyLW5xA3/ERIvMSATBKDgZ5ZUQDrrUYZXAE+RlXyy9Q7Cvb61DbjBZ5oUVREy6
	zXwEvCvGD6Walndgld/sFqpFxVKTamIihqLHfUYpuqKboPZjfr9LN+Th5MGVrzwqQqRFKy
	HHM6DPQQjQkmMeqT+jabUeQ/nTyNPIPqbYahiPHOXbliqyUwrXWDBEMeYdtp8E9H5PXPuM
	Tev+LzF9Ibbq9vbj/L/RXYdvcthJKR5KlTkvK0adv+6LvGRSUKAqBEr/8VEgfQ==
Date: Mon, 8 Jul 2024 14:23:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
Message-ID: <20240708142344.47da466e@xps-13>
In-Reply-To: <304b7bb1-d315-4147-820b-1ec0aa63e759@kernel.org>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
	<20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
	<20240705-unaired-pesticide-4135eaa04212@spud>
	<6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
	<20240706-remote-undergo-3b9dfe44d16f@spud>
	<20240708083011.058d0c57@xps-13>
	<304b7bb1-d315-4147-820b-1ec0aa63e759@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_052352_379163_9B4BE957 
X-CRM114-Status: GOOD (  17.56  )
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

SGkgS3J6eXN6dG9mLAoKa3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgOCBKdWwgMjAyNCAw
OTozMzowNCArMDIwMDoKCj4gT24gMDgvMDcvMjAyNCAwODozMCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpIENvbm9yLAo+ID4gICAKPiA+Pj4+PiArcHJvcGVydGllczoKPiA+Pj4+PiArICBj
b21wYXRpYmxlOgo+ID4+Pj4+ICsgICAgb25lT2Y6Cj4gPj4+Pj4gKyAgICAgIC0gaXRlbXM6Cj4g
Pj4+Pj4gKyAgICAgICAgICAtIGVudW06Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgLSBzb3BoZ28s
Y3YxODAwYi1zYXJhZGMKPiA+Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IHNvcGhnbyxjdjE4eHgt
c2FyYWRjICAgIAo+ID4+Pj4KPiA+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGZhbGxiYWNrIGhlcmUg
bWFrZXMgc2Vuc2UuIElmIHRoZXJlJ3Mgb3RoZXIgZGV2aWNlcwo+ID4+Pj4gd2l0aCBhIGNvbXBh
dGlibGUgcHJvZ3JhbW1pbmcgbW9kZWwgYWRkZWQgbGF0ZXIsIHdlIGNhbiBmYWxsIGJhY2sgdG8g
dGhlCj4gPj4+PiBjdjE4MDBiLiAgCj4gPiAKPiA+IEknbSBzb3JyeSBidXQgaXNuJ3QgdGhpcyBz
bGlnaHRseSBkaXNhZ3JlZWluZyB3aXRoIHRoZSAid3JpdGluZwo+ID4gYmluZGluZ3MiIGRvYyBw
b2ludGVkIGluIHYxPyBJdCBzYXlzLAo+ID4gCj4gPiAqIERPIHVzZSBmYWxsYmFjayBjb21wYXRp
YmxlcyB3aGVuIGRldmljZXMgYXJlIHRoZSBzYW1lIGFzIG9yIGEgc3Vic2V0Cj4gPiAgIG9mIHBy
aW9yIGltcGxlbWVudGF0aW9ucy4KPiA+IAo+ID4gSSBiZWxpZXZlIHdlIGZhbGwgaW4gdGhlICJk
ZXZpY2VzIGFyZSB0aGUgc2FtZSIgY2F0ZWdvcnksIHNvIEkgd291bGQKPiA+IGhhdmUgbXlzZWxm
IHdyb3RlIGEgc2ltaWxhciBiaW5kaW5nIGhlcmUgd2l0aCBhIGNvbXBhdGlibGUgbWF0Y2hpbmcK
PiA+IHRoZW0gYWxsLCBwbHVzIGEgaGFyZHdhcmUtaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgY29t
cGF0aWJsZSBhcyB3ZWxsOwo+ID4ganVzdCBpbiBjYXNlLiAgCj4gCj4gRmFsbGJhY2sgZnJvbSBv
bmUgbW9kZWwgdG8gYW5vdGhlci4gVGhlcmUgaXMgbm8gImFub3RoZXIiIG1vZGVsIGhlcmUsCj4g
YnV0IHdpbGRjYXJkLiBUaGVyZSBpcyBubyBzdWNoIGRldmljZSBhcyBjdjE4eHgsIHJpZ2h0PwoK
Tm8gdGhlcmUgaXMgbm90LiBCdXQgSSBkb24ndCB0aGluayB0aGVyZSBpcyBhICJiYXNlIiBtb2Rl
bCBlaXRoZXIuCkp1c3QgbXVsdGlwbGUgU29DcyBuYW1lZCBjdjE4PHNvbWV0aGluZz4gd2l0aCBh
cHBhcmVudGx5IHRoZSBzYW1lIEFEQy4KClNvIGFjdHVhbGx5IEkgZ3Vlc3MgdGhlIGRpc2N1c3Np
b24gaGVyZSBpcyBhYm91dCB0aGUgd2lsZGNhcmQKY29tcGF0aWJsZS4gSXQgZmVlbHMgc3RyYW5n
ZSB0byBtZSB0byBoYXZlIG5vIGdlbmVyaWMgY29tcGF0aWJsZSBlaXRoZXIKd2l0aCBhIHdpbGRj
YXJkIG9yIHdpdGggYSAiYmFzZSIgaW1wbGVtZW50YXRpb24gKGJlY2F1c2UgdGhlcmUgaXMKcHJv
YmFibHkgbm9uZSkuIFNvIEkgZ3Vlc3MgdGhlIHNvbHV0aW9uIGhlcmUgaXMgdG8ganVzdCBsaXN0
IGEgc2luZ2xlCnNwZWNpZmljIGNvbXBhdGlibGUgaW4gdGhlIGVuZC4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
