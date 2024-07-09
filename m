Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F7C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 07:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebwWGclPRpejk3U88r/IyIfOlsr2C1c/bf/mUgvPMYQ=; b=danEcK6g8orGZH
	S7KtdXSJy2SvYrPt1gGsAgBRcr8z8CD5OMSJB+v0rkt7tZZVYiVpoUccKahw94HO3pqeNvkpquEEf
	VVC/ZEZO+F0ZOKGdv2gAiqi3L6QV//RMFvJItIi/TezKVmypVjZ9eu1qru3Cc5FNoJhUwxbmT9dtK
	2bBdh3WzzzAJ1Rg6FoA6k2+MqyKAs8rClcPYQJq5lXesg2DtkKflcW6qj/ymxkKYZkAFxBcmxqkqQ
	xktMffnev+tjZiUVEZx+7kTNqFoEfiLtOHm3wnhVZaCVQx7sV4yJGHcKMLagN/WbPAcoV6X18Mq/1
	XkN32eymiHFzOYMT+iKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5G9-00000006E45-3upq;
	Tue, 09 Jul 2024 07:27:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5G6-00000006E3K-3346
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 07:27:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22E2D24000B;
	Tue,  9 Jul 2024 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720510046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HibcTUfYnEmcYJNR1chZFfn71QJWTGsOoH5RNfwQefg=;
	b=Ceyuq7NyzSiJ0uMtuQPS2sSe0gfh1H5majfQZpQXoUjWx3QxtXz9+4GoC721Xm7Lb07AOj
	72FNsBvyOpq9AlTa3A7OakQk8ZGSJ81B5t9w+LvVjQYYV8jluE0b3svt+hH6YgYF1Ecf/C
	KE2ukLJ8yebR/x0u28u7StSBV/Odz+R8a0z5n3pGrkAtslcJxyw6VlM12zIw+jcIsT+/7Y
	xSJKjKN6A8OaZYGr3syfyCBDgz1EyOp6cgB7caZOJMX0VxbP1MmJAXA4d6capMNp98tueB
	8GNQGPFeTGs62oKyfIIj2XJsxc3Z1GApmK0C/ZuI8nAUZ/N457aBibvSVJpzcA==
Date: Tue, 9 Jul 2024 09:27:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc:
 sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
Message-ID: <20240709092722.1a3a2482@xps-13>
In-Reply-To: <20240708165719.000021b9@Huawei.com>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
	<20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
	<20240705-unaired-pesticide-4135eaa04212@spud>
	<6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
	<20240706-remote-undergo-3b9dfe44d16f@spud>
	<20240708083011.058d0c57@xps-13>
	<304b7bb1-d315-4147-820b-1ec0aa63e759@kernel.org>
	<20240708142344.47da466e@xps-13>
	<20240708165719.000021b9@Huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_002731_060272_A03DF2EB 
X-CRM114-Status: GOOD (  26.62  )
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

SGkgSm9uYXRoYW4sCgo+ID4gPiA+ICogRE8gdXNlIGZhbGxiYWNrIGNvbXBhdGlibGVzIHdoZW4g
ZGV2aWNlcyBhcmUgdGhlIHNhbWUgYXMgb3IgYSBzdWJzZXQKPiA+ID4gPiAgIG9mIHByaW9yIGlt
cGxlbWVudGF0aW9ucy4KPiA+ID4gPiAKPiA+ID4gPiBJIGJlbGlldmUgd2UgZmFsbCBpbiB0aGUg
ImRldmljZXMgYXJlIHRoZSBzYW1lIiBjYXRlZ29yeSwgc28gSSB3b3VsZAo+ID4gPiA+IGhhdmUg
bXlzZWxmIHdyb3RlIGEgc2ltaWxhciBiaW5kaW5nIGhlcmUgd2l0aCBhIGNvbXBhdGlibGUgbWF0
Y2hpbmcKPiA+ID4gPiB0aGVtIGFsbCwgcGx1cyBhIGhhcmR3YXJlLWltcGxlbWVudGF0aW9uLXNw
ZWNpZmljIGNvbXBhdGlibGUgYXMgd2VsbDsKPiA+ID4gPiBqdXN0IGluIGNhc2UuICAgIAo+ID4g
PiAKPiA+ID4gRmFsbGJhY2sgZnJvbSBvbmUgbW9kZWwgdG8gYW5vdGhlci4gVGhlcmUgaXMgbm8g
ImFub3RoZXIiIG1vZGVsIGhlcmUsCj4gPiA+IGJ1dCB3aWxkY2FyZC4gVGhlcmUgaXMgbm8gc3Vj
aCBkZXZpY2UgYXMgY3YxOHh4LCByaWdodD8gIAo+ID4gCj4gPiBObyB0aGVyZSBpcyBub3QuIEJ1
dCBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgImJhc2UiIG1vZGVsIGVpdGhlci4KPiA+IEp1c3Qg
bXVsdGlwbGUgU29DcyBuYW1lZCBjdjE4PHNvbWV0aGluZz4gd2l0aCBhcHBhcmVudGx5IHRoZSBz
YW1lIEFEQy4KPiA+IAo+ID4gU28gYWN0dWFsbHkgSSBndWVzcyB0aGUgZGlzY3Vzc2lvbiBoZXJl
IGlzIGFib3V0IHRoZSB3aWxkY2FyZAo+ID4gY29tcGF0aWJsZS4gSXQgZmVlbHMgc3RyYW5nZSB0
byBtZSB0byBoYXZlIG5vIGdlbmVyaWMgY29tcGF0aWJsZSBlaXRoZXIKPiA+IHdpdGggYSB3aWxk
Y2FyZCBvciB3aXRoIGEgImJhc2UiIGltcGxlbWVudGF0aW9uIChiZWNhdXNlIHRoZXJlIGlzCj4g
PiBwcm9iYWJseSBub25lKS4gU28gSSBndWVzcyB0aGUgc29sdXRpb24gaGVyZSBpcyB0byBqdXN0
IGxpc3QgYSBzaW5nbGUKPiA+IHNwZWNpZmljIGNvbXBhdGlibGUgaW4gdGhlIGVuZC4KPiAKPiBJ
dCBjb21lcyBmcm9tIGxvbmcgZXhwZXJpZW5jZSBvZiBzaWxpY29uIHZlbmRvcnMgbm90IGJlaW5n
IGNvbnNpc3RlbnQKPiB3aXRoIHBhcnQgbmFtaW5nLgoKT2gsIGFncmVlZCA6LSkKCj4gIEZhciB0
b28gb2Z0ZW4gd2UndmUgaGFkIGEgbmljZSBnZW5lcmljIHdpbGQgY2FyZAo+IGVudHJ5IGFuZCBh
bG9uZyBjb21lcyB0aGUgdmVuZG9yIHdpdGggYSBuZXcgcGFydCBpbiB0aGUgbWlkZGxlCj4gb2Yg
dGhhdCByYW5nZSB0aGF0IGlzIGNvbXBsZXRlbHkgaW5jb21wYXRpYmxlLiAgVGhlbiB3ZSBlbmQg
dXAgd2l0aAo+IHBlb3BsZSBhc3N1bWluZyB0aGUgd2lsZGNhcmQgbWVhbnMgaXQgd2lsbCB3b3Jr
IGFuZCBhIGJ1bmNoIG9mIGJ1Zwo+IHJlcG9ydHMuICBIZW5jZSBubyB3aWxkIGNhcmRzLCBqdXN0
IGRlZmluZSBmaXJzdCBzdXBwb3J0ZWQgcGFydCBhcyB5b3VyCj4gJ2Jhc2UnIGFuZCBnbyBmcm9t
IHRoZXJlLgoKSSBzZWUgd2hhdCB5b3UgbWVhbi4gSSBtdXN0IGFkbWl0IEknbSBub3QgYSBiaWcg
ZmFuIG9mIG5hbWluZwpjb21wYXRpYmxlcyAoYW5kIGRyaXZlcnMpIGFmdGVyIGEgd29ya2luZyBi
YXNlIHJhdGhlciB0aGFuIGEgZ29vZAplbm91Z2ggd2lsZGNhcmQsIGJ1dCBJIGRvIHVuZGVyc3Rh
bmQgeW91ciBwb2ludCBhbmQga2luZCBvZiBhZ3JlZSB3aXRoCml0IGFjdHVhbGx5LgoKPiBJdCdz
IGV2ZW4gbW9yZSBmdW4gd2hlbiBhIHZlbmRvciBkcml2ZXIgcGFwZXJzIG92ZXIgdGhlIGRpZmZl
cmVuY2VzCj4gYW5kIHNvIGl0ICd3b3JrcycsIGJ1dCB0aGUgdXBzdHJlYW0gb25lIGRvZXNuJ3Qu
ICBJbiBleHRyZW1lIGNhc2UKPiBiZWNhdXNlIGEgZGlmZmVyZW50IGRyaXZlciBlbnRpcmVseSBp
cyByZXF1aXJlZC4KPiAKPiBTbyBiYXNpY2FsbHkgd2UgZG9uJ3QgdHJ1c3Qgc2lsaWNvbiB2ZW5k
b3JzIDopCj4gU3BlYWtpbmcgYXMgc29tZW9uZSB3aG8gd29ya3MgZm9yIG9uZSAtIEkgdGhpbmsg
dGhhdCdzIGVudGlyZWx5Cj4gcmVhc29uYWJsZSEhCgpIYWhhIDwzCgpUaGFua3MgKG9uY2UgYWdh
aW4pIGZvciB5b3VyIHZhbHVhYmxlIGlucHV0cyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
