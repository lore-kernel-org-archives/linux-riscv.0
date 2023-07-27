Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A05AC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtiUFH4W6uYILyq3V333Hl/je7dilaLJ7JzCQbxeBnc=; b=XfHU+jMuxqiB2K
	fV850VIqkbqgGjFi3Vbzp2U3QbVbWvvKB2cPIW4eN99VG5qCNiH45BcN4J4jfI7H6/aFG5rANpRV/
	78wUoN642azVsYz9J5tqOCGcr9n4NiVTGCv07UNKM3R9NtTQYPm5dNe0mcHdhcfFBOswMv6mY+m9j
	M1QJAknmkjvEgl0L4tmDINjn0UXTvNJFWxn9dtdI2xpd9foZgxH28EaejzgFdRcWfExiN5gYPnzov
	/fy0DvKk0VTSSgKbvHsta1PN66KflV4XVzPG9mo0ZQmJ3rLTu9uPMF1KAcf3L8z/AXXdHC0FCNYul
	JqZ7pAXdNBUDqNJ8Bi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx9X-00Cp17-1i;
	Thu, 27 Jul 2023 09:19:23 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx9U-00Cozp-0C
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 09:19:21 +0000
Received: from [192.168.124.11] (unknown [113.140.29.10])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 872301C1E3F;
	Thu, 27 Jul 2023 09:19:08 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690449554;
	bh=U3/iZtufbRk45Ts76eay7OLdIEe1IdvlvMnUnVReqh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z8mNShnFzFCDa+6T09xC9x+L74plUnIJhzVb1nZjZltH+qoaU6mGqmSzxrWpErjEt
	 k6ofcrPoVjzWt+bV2neqteEUYWxIRtl/Ti4h4tWpD0mXNPlZEPuaywC/g0Y/GX4fKs
	 ninbuE0bT73eHjVHFeH8zpFw2aDSSoypWL63nXR9behxJgfKWyEoNN/Hha8E9SKiQn
	 6IP8Y4r5O9LWZrsDguAo2XpyMgSr7ZYAI4tAQ1g+nwNoZ1a2+mdnk7SONgJp/Wut8I
	 gJ7ItS39IunM9F5YA20b712clPIe/5mqVq5JRUZfOoMdQidYarE7g8jB5tjV9qzU1y
	 qNvD0LcqdTV/w==
Message-ID: <c5e44ec519f4d56a71d416cf43a375cdbf0b9358.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Thu, 27 Jul 2023 17:18:51 +0800
In-Reply-To: <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
	 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
	 <20230725-unheard-dingy-42f0fafe7216@wendy> <ZL/jMYL3akl78ZZN@xhacker>
	 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
	 <ZME1J4mpVf5yth32@xhacker>
	 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
	 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_021920_325899_81A8EF6E 
X-CRM114-Status: GOOD (  15.77  )
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

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDA4OjU0ICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4gT24g
VGh1LCAyMDIzLTA3LTI3IGF0IDA4OjE0ICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4gPiBPbiBX
ZWQsIDIwMjMtMDctMjYgYXQgMjM6MDAgKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+
IHdoaWNoIGR0cyByIHUgdXNpbmc/IHNlZSBiZWxvdy4KPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4g
T3IgbWF5YmUgbXkgdG9vbGNoYWluIChHQ0MgMTMuMS4wLCBCaW51dGlscy0yLjQwLCB3aXRoIG5v
IHBhdGNoZXMpIGNhbgo+ID4gPiA+IG1pc2NvbXBpbGUgdGhlIGtlcm5lbD8KPiA+IAo+ID4gLyog
c25pcCAqLwo+ID4gCj4gPiA+ID4gQm9vdCBIQVJUIElEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgOiAwCj4gPiA+ID4gQm9vdCBIQVJUIERvbWFpbsKgwqDCoMKgwqDCoMKgwqDCoCA6IHJvb3QK
PiA+ID4gPiBCb290IEhBUlQgUHJpdiBWZXJzaW9uwqDCoMKgIDogdjEuMTEKPiA+ID4gPiBCb290
IEhBUlQgQmFzZSBJU0HCoMKgwqDCoMKgwqDCoCA6IHJ2NjRpbWFmZGN2eAo+ID4gPiAKPiA+ID4g
d2hhdD8gSSBkb24ndCB0aGluayB0aGUgbWFpbmxpbmUgZHRzIHByb3ZpZGUgdiBhbmQgeC4gCj4g
PiAKPiA+IEkgY29waWVkIHRoZSBjb21waWxlZCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3Ro
MTUyMC1saWNoZWUtcGktNGEuZHRiCj4gPiBpbnRvIC9ib290IGFuZCBsb2FkZWQgaXQgd2l0aCB1
LWJvb3QgImxvYWQiIGNvbW1hbmQgb250byAweDQ2MDAwMDAwLCBhbmQKPiA+IHBhc3NlZCB0aGlz
IGFkZHJlc3MgdG8gdGhlIGJvb3RpIGNvbW1hbmQuCj4gPiAKPiA+IEJ1dCBtYXliZSBJJ3ZlIGNv
cGllZCB0aGUgd3JvbmcgZmlsZSBvciBtYWRlIHNvbWUgb3RoZXIgbWlzdGFrZS4uLiBJJ2xsCj4g
PiByZWNoZWNrLgo+IAo+IEhtbSwgYW5kIGlmIEkgcmVhZCBPcGVuU0JJIGNvZGUgY29ycmVjdGx5
LCB0aGlzIGxpbmUgcmVmbGVjdHMgdGhlCj4gY29udGVudCBvZiB0aGUgbWlzYSBDU1IsIG5vdCB0
aGUgRFQgcmlzY3YsaXNhIHZhbHVlLgo+IAo+IFRoZSBsb2cgb2Ygc3VjY2Vzc2Z1bCBib290IHBy
b3ZpZGVkIGJ5IERyZXcgYWxzbyBjb250YWlucwo+ICJydjY0aW1hZmRjdngiOgo+IAo+IGh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL3BkcDcvMjMyNTk1OTVhNzU3MGYxZjExMDg2ZDI4NmUxNmRmYjYK
CkkgdHJpZWQgYSBfX3Nob3dfcmVnIGNhbGwgYmVmb3JlIHRoZSBwYW5pYzoKClsgICAgMC4wMTI5
NTNdIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDYuNS4wLXJjMyAj
NwpbICAgIDAuMDEyOTY3XSBIYXJkd2FyZSBuYW1lOiBTaXBlZWQgTGljaGVlIFBpIDRBIChEVCkK
WyAgICAwLjAxMjk3Nl0gZXBjIDogZmZmZmZmZmY4MGM4NGE2MCByYSA6IDAwMDAwMDAwMDAwMDAw
MDAgc3AgOiBmZmZmZmZmZjgwMDRkZmVlClsgICAgMC4wMTI5ODhdICBncCA6IDAwMDAwMDAyMDAw
MDAxMjAgdHAgOiBmZmZmZmZmZjgwYzAzZDIwIHQwIDogZmZmZmZmZmY4MDAwMmQ2YwpbICAgIDAu
MDEyOTk3XSAgdDEgOiBmZmZmZmZmZjgwMDRkZmVlIHQyIDogZmZmZmZmZmY4MDA0ZGZlNiBzMCA6
IGZmZmZmZmZmODBjMDNkMjAKWyAgICAwLjAxMzAwNV0gIHMxIDogZmZmZmZmZmY4MGM5NjZmMCBh
MCA6IGZmZmZmZmZmODBjOTgxNDAgYTEgOiAyMDAwMDAwMDAwMDAwMDAwClsgICAgMC4wMTMwMTJd
ICBhMiA6IDAwMDAwMDAwMDAwMDAwNDMgYTMgOiAyMDNhNjU2YzZmNzM2ZTZmIGE0IDogZmZmZmZm
ZmY4MGMwM2RlZgpbICAgIDAuMDEzMDIxXSAgYTUgOiBmZmZmZmZmZjgwZGNiNGEwIGE2IDogMDAw
MDAwMDAwMDAwMDAwMSBhNyA6IDAwMDAwMDAwMDAwMDAwMTQKWyAgICAwLjAxMzAzMF0gIHMyIDog
MDAwMDAwMDAwMDAwMDAwYSBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAw
MDAwClsgICAgMC4wMTMwMzZdICBzNSA6IGZmZmZmZmQ5ZmVmNjk3NDAgczYgOiAwMDAwMDAwMDAw
MDAwMDA4IHM3IDogMDAwMDAwMDAwMDAwMDAzMgpbICAgIDAuMDEzMDQ2XSAgczggOiAwMDAwMDAw
MDAwMDAwMDAyIHM5IDogZmZmZmZmZmY4MGMwM2RmMCBzMTA6IGZmZmZmZmZmODBkY2I0ZTgKWyAg
ICAwLjAxMzA1Nl0gIHMxMTogZmZmZmZmZmY4MGRjN2M4MCB0MyA6IGZmZmZmZmZmODBjMDNkNDgg
dDQgOiBmZmZmZmZmZjgwZGNiMmYwClsgICAgMC4wMTMwNjRdICB0NSA6IGZmZmZmZmZmODBjODRh
NjAgdDYgOiBmZmZmZmZmZjgwYzEwYjk4ClsgICAgMC4wMTMwNzFdIHN0YXR1czogMDAwMDAwMDAw
MDAwMDAwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAxIGNhdXNlOiBmZmZmZmZmZjgwZGNiNGY3
ClsgICAgMC4wMTMwODJdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiB1bmV4cGVjdGVkIGlu
dGVycnVwdCBjYXVzZQoKSSBjb21wYXJlZCB0aGVzZSB3aXRoIFN5c3RlbS5tYXAgYW5kIHRoZSBy
ZXN1bHQgc2VlbXMgY29tcGxldGVseSBlcnJhdGljCihmb3IgZXhhbXBsZSwgc3AgaXMgb3V0IG9m
IGluaXRfc3RhY2ssIGFuZCBncCBpcyBub3QgX19nbG9iYWxfcG9pbnRlciQpLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
