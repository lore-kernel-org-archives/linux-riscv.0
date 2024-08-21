Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DADC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mI4Vzlzu9oraDBFZKUwu2KNXa3ZPG4lYnpTyX/I1mnM=; b=OD+LGQHdOuh0dn
	6efLhAWt3SpuskZZD27a/jcSuXf8aEm4h7jIz9i5kst9m+18SMWICEeVZs1cZt53uB9R4Nc/ObpKN
	FEPHBxkmPZqSuziP01SOMgf2OynuITZTMCWLmfySuv1cAnB8C7q1jtOSq80XfeC8emxuuPr68Hyyf
	32hm3BDsES2pf/EukwnhkNd7PV3I28WqfEQlPYAfKZSos/YrMXuy3xv5q31LD8MdQ6EBb1gOwhmnx
	yh8ZuJHoXpmpznQQm1t2PUnn/HP+LcVvQ7M9OS6YPa+MGdv9M58aNvV5hjGJWaXCcelEpqUiTvlFf
	Mpwh/T2ShOieBlsiAECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfyj-00000007xBT-2nu4;
	Wed, 21 Aug 2024 07:42:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfyg-00000007xAa-07T5
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 07:42:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6544F1BF203;
	Wed, 21 Aug 2024 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724226114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNVE1Euex1vHgd16nkcpKWq4uCJnI5txc/wed22g5ng=;
	b=ptK8mW9UZGOaggQGmNwz0GVW3ar1qMYjrhdzLxxeT0cZmtOUj+Yfann9zwjzSeYDpICP4a
	wkqW6yljlgDLZcm+YmfuYK8oFEa/uWDIdgPkrqJw1CBCbdJN5h/y+FWiy7YM1wBv+6/5kJ
	qPtCIUCjzaZI760eRAQHhH5qJqcR6DHTcWSuMvAvWd3rYETUkR3izusP5EHYmW9HyZkNAM
	MT3AoU9azucVdMJA9a7ZqtFl0WTW2ruP0EiftemmT7B3syAOpDpaCTsDkaWPejC0Y+fVQc
	u35aozbT8wXo8FJqb8E1oPgteuMyxcjIM+TD702CPRB9aivYSHNMPr1MZZO3eQ==
Date: Wed, 21 Aug 2024 09:41:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo CV18XX SARADC binding
Message-ID: <20240821094150.5787905b@xps-13>
In-Reply-To: <20240820-borough-latch-17d785301aef@spud>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
	<20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
	<20240812-unwary-mongrel-9f6758bf624c@spud>
	<89aabfbe-79bf-4da7-be44-b6cbd92b72a9@bootlin.com>
	<20240820-borough-latch-17d785301aef@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_004159_024108_29557192 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo+ID4gPiA+ICsgICAgICBSZXByZXNlbnRzIHRoZSBjaGFubmVscyBvZiB0aGUgQURD
Lgo+ID4gPiA+ICsKPiA+ID4gPiArICAgIHByb3BlcnRpZXM6Cj4gPiA+ID4gKyAgICAgIHJlZzoK
PiA+ID4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiA+ICsgICAgICAgICAgVGhlIGNo
YW5uZWwgbnVtYmVyLiBJdCBjYW4gaGF2ZSB1cCB0byAzIGNoYW5uZWxzIG51bWJlcmVkIGZyb20g
MCB0byAyLgo+ID4gPiA+ICsgICAgICAgIGl0ZW1zOgo+ID4gPiA+ICsgICAgICAgICAgLSBtaW5p
bXVtOiAwCj4gPiA+ID4gKyAgICAgICAgICAgIG1heGltdW06IDIgIAo+ID4gPiAKPiA+ID4gSXMg
dGhpcyBzdWZmaWNpZW50IHRvIGxpbWl0IHRoZSBudW1iZXIgb2YgY2hhbm5lbHMgdG8gMz8gQXJl
bid0IHlvdSByZWx5aW5nCj4gPiA+IG9uIHRoZSB1bmlxdWUgdW5pdCBhZGRyZXNzZXMgd2Fybmlu
ZyBpbiBkdGMgdG8gbGltaXQgaXQsIHJhdGhlciB0aGFuCj4gPiA+IGFjdHVhbGx5IGxpbWl0aW5n
IHdpdGggbWluL21heEl0ZW1zPwo+ID4gPiAgIAo+ID4gSXQgc2VlbXMgbGlrZSBJIGNhbid0IHVz
ZSBtaW4vbWF4SXRlbXMgb24gdGhpcyBwcm9wZXJ0eS4gSSB0aGluayB0aGF0IGl0IGlzCj4gPiB1
c2luZyBzaXplLWNlbGxzICsgYWRkcmVzcy1jZWxscyB0byBkZWR1Y2UgdGhhdCB0aGUgbnVtYmVy
IG9mIGl0ZW1zIHNob3VsZAo+ID4gYmUgZXF1YWwgdG8gMS4gIAoKTG9va2luZyBhdCBkdC1zY2hl
bWEsIEkgY291bGRuJ3QgcGVyc29uYWxseSB1bmRlcnN0YW5kIGZyb20gd2hlcmUgZGlkCnRoZSBl
cnJvciBtZXNzYWdlcyByZXBvcnRlZCBieSBUaG9tYXMgY2FtZSBmcm9tLiBUaGVyZSBhcmUgY2xl
YXIKY29uc3RyYWludHMgb3ZlciBtaW5JdGVtcy9tYXhJdGVtcyByZWdhcmRpbmcgdGhlIHVzZSBv
ZiB7I2FkZHJlc3MtY2VsbHMsCiNzaXplei1jZWxsc30gYmVpbmcgezEsIDF9LCB7MiwgMn0gYW5k
IHsyLCAxfSAoaW4gcmVnLnlhbWwpLCBidXQgbm90aGluZwpleHBsaWNpdCByZWdhcmRpbmcgdGhl
IG90aGVyIHNpdHVhdGlvbnMsIG5hbWVseSB7MSwgMH0gaW4gdGhpcyBjYXNlCndoaWNoIGVuZm9y
Y2VzIG1heEl0ZW1zIHRvIDEgaXMgbm90IGNsZWFybHkgc3RhdGVkIGluIGFueSBvZiB0aGUgY29y
ZQp5YW1sIGZpbGVzLiBBbnkgaWRlYSB3aGVyZSB0byBsb29rIGF0PyBBbHRob3VnaCwgSSdtIGNv
bnZpbmNlZCB0aGVyZSBpcwpzb21ldGhpbmcgZGVmaW5lZCBiZWNhdXNlIHJlbmFtaW5nIHRoZSBw
cm9wZXJ0eSBmcm9tICdyZWcnIHRvICdmb28nCnNpbGVuY2VzIHRoZXNlIHdhcm5pbmdzLgoKPiBJ
IHRoaW5rIEkgd2FzIG1pc3Rha2VuIGluIHRhbGtpbmcgYWJvdXQgbWl4L21heCBpdGVtcyBoZXJl
LiBJIGhhZCB0aGUKPiByaWdodCBpZGVhLCBidXQgbWVudGlvbmVkIGFuIGluY29ycmVjdCBzb2x1
dGlvbiAtIHNvcnJ5IGFib3V0IHRoYXQuIEkKPiB3YXNuJ3QgdGFsa2luZyBhYm91dCB0aGUgbnVt
YmVyIG9mIGVsZW1lbnRzIGluIHRoZSByZWcgcHJvcGVydHksIHdoYXQgSQo+IG1lYW50IHdhcyBs
aW1pdGluZyB0aGUgbnVtYmVyIG9mIGNoYW5uZWwgbm9kZXMgaW4gdGhlIGZpcnN0IHBsYWNlIC0K
PiBzb21ldGhpbmcgd2hpY2ggbWluL21heEl0ZW1zIGNhbm5vdCBkby4gQXMgZXhhbXBsZXMgb2Yg
dGhlIHByb2JsZW0gSSB3YXMKPiB0aGlua2luZyBvZiwgc2VlIHRoZSBiZWxvdyB0d28gZXhhbXBs
ZXM6Cj4gCj4gICAgIGFkY0AzMGYwMDAwIHsKPiAgICAgICAgIGNvbXBhdGlibGUgPSAic29waGdv
LGN2MTgwMGItc2FyYWRjIjsKPiAgICAgICAgIHJlZyA9IDwweDAzMGYwMDAwIDB4MTAwMD47Cj4g
ICAgICAgICBjbG9ja3MgPSA8JmNsayBDTEtfU0FSQURDPjsKPiAgICAgICAgIGludGVycnVwdHMg
PSA8MTAwIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiAKPiAgICAgICAgIGNoYW5uZWxAMCB7
Cj4gICAgICAgICAgICAgcmVnID0gPDA+Owo+ICAgICAgICAgfTsKPiAgICAgICAgIGNoYW5uZWxA
MiB7Cj4gICAgICAgICAgICAgcmVnID0gPDI+Owo+ICAgICAgICAgfTsKPiAgICAgICAgIGNoYW5u
ZWxAMjIgewo+ICAgICAgICAgICAgIHJlZyA9IDwyPjsKPiAgICAgICAgIH07Cj4gICAgIH07Cj4g
Cj4gICAgIGFkY0AzMGYwMDAwIHsKPiAgICAgICAgIGNvbXBhdGlibGUgPSAic29waGdvLGN2MTgw
MGItc2FyYWRjIjsKPiAgICAgICAgIHJlZyA9IDwweDAzMGYwMDAwIDB4MTAwMD47Cj4gICAgICAg
ICBjbG9ja3MgPSA8JmNsayBDTEtfU0FSQURDPjsKPiAgICAgICAgIGludGVycnVwdHMgPSA8MTAw
IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiAKPiAgICAgICAgIGNoYW5uZWxAMCB7Cj4gICAg
ICAgICAgICAgcmVnID0gPDA+Owo+ICAgICAgICAgfTsKPiAgICAgICAgIGNoYW5uZWxAMiB7Cj4g
ICAgICAgICAgICAgcmVnID0gPDI+Owo+ICAgICAgICAgfTsKPiAgICAgICAgIGNoYW5uZWxAMjIg
ewo+ICAgICAgICAgICAgIHJlZyA9IDwyPjsKPiAgICAgICAgIH07Cj4gICAgIH07Cj4gCj4gVGhl
IHNvbHV0aW9uIGlzIHNpbXBsZSwgcmVtb3ZlIHRoZSArIGZyb20gdGhlIHJlZ2V4LiBTb3JyeSBm
b3Igc2VuZGluZwo+IHlvdSBvbiB0aGUgd3JvbmcgdHJhY2sgVGhvbWFzLgoKQWghIFRoYW5rcyBD
b25vciBmb3IgdGhlIGRldGFpbHMsIG5vdyBpdCBtYWtlcyBmdWxsIHNlbnNlIDotKSBCVFcgVGhv
bWFzCnRoZSByZWdleCBpcwoKCV5jaGFubmVsQFswLTNdKyQKCmFuZCBJIGd1ZXNzIGl0IHNob3Vs
ZCBpbnN0ZWFkIGJlCgoJXmNoYW5uZWxAWzAtMl0kCiAgICAgICAgICAgICAgICAgICAgXgoKaW4g
b3JkZXIgdG8gZnVsbHkgbWF0Y2ggdGhlIHJlYWwgaW5kZXhpbmcgY29uc3RyYWludHMgeW91J3Jl
IGVuZm9yY2luZwp3aXRoIG1pbmltdW0vbWF4aW11bS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
