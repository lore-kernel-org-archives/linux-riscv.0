Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30788C54788
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ho5q0a0Yt3PAuLaSIyr3l59NPqVJgvz9JMijg94s50=; b=a3WI/P8LWFA6Ff
	tLu4Yf6YCgsawRv5X6SV2mYG0m5h8IthF1iMIHFY8xWnEiwe9mnqC5WNaFRYinR432HGpJKpnohB2
	5B3trBqd1UzCmCe1Tk7ocS+o8WVxHULfjDWnXn9su1HtaND32aJx7CIepsH6R6JRiYjeXhOkEH4+/
	T2ZG0S18oM16CFgH3/xdUCHg/MTILqkqAmz2U/mdQfFe9KkBFhbulKwNJM5J7tZ+6zALwBHscAid0
	d1cz/DNVz2O5kXI4eQqjaHCzptsrxeb89JkKiuWZrw2sfcdj2xlBXLRxreMMywQ9LRpZvtdtY6/w3
	vMSYhyL52NOq4CZa9LCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8uk-00000004yI8-18Ml;
	Thu, 22 Feb 2024 13:15:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8ug-00000004yFf-2VdJ;
	Thu, 22 Feb 2024 13:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34E63CE2297;
	Thu, 22 Feb 2024 13:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CAAC43390;
	Thu, 22 Feb 2024 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708607695;
	bh=RS33a5NAXMYkmcGbonHNshPN7xX7MMKFPNs6Cwp2KpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LP+bYP4uecGnPP5dkdkYukDVfPWQu8dMR5Jkrs1trXr09+T71XWJ9Mn01c5F/o/Xv
	 F64RIvknhyXCGIFa3lK7RsVyAQiHSiLpdp43kcUNHfbWI6njNz2Rj0FY74Iu8sr7W1
	 QX2+JPEb0Ro1m9xCA/Lx9f7x9BYgYbcb9mgF1xeMmc15QKS4jBXntIzpvWro7H2MkW
	 HdWFX6B0b598v9jWqFV+992oA4904XMhgnMzhsM5LMV3eoGz4vtYmOODe7nS+cisn0
	 4IJs1BYIxbUU9E6D8+o2GKvBkneaFpq3vXHnngjZ96TG1ZmaBaGsU29N4FpiTZfFXK
	 Uo8DErPX+JbDg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v14 13/18] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
In-Reply-To: <20240222094006.1030709-14-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-14-apatel@ventanamicro.com>
Date: Thu, 22 Feb 2024 14:14:51 +0100
Message-ID: <87msrstzck.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_051459_031974_2E11298C 
X-CRM114-Status: GOOD (  15.57  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIExpbnV4
IFBDSSBmcmFtZXdvcmsgc3VwcG9ydHMgcGVyLWRldmljZSBNU0kgZG9tYWlucyBmb3IgUENJIGRl
dmljZXMKPiBzbyBleHRlbmQgdGhlIElNU0lDIGRyaXZlciB0byBhbGxvdyBQQ0kgcGVyLWRldmlj
ZSBNU0kgZG9tYWlucy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgfCAgNyArKysrKwo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBs
YXRmb3JtLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvS2NvbmZpZyBiL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gaW5kZXggODVmODZl
MzFjOTk2Li4yZmMwY2IzMjM0MWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+IEBAIC01NTMsNiArNTUzLDEzIEBA
IGNvbmZpZyBSSVNDVl9JTVNJQwo+ICAJc2VsZWN0IEdFTkVSSUNfSVJRX01BVFJJWF9BTExPQ0FU
T1IKPiAgCXNlbGVjdCBHRU5FUklDX01TSV9JUlEKPiAgCj4gK2NvbmZpZyBSSVNDVl9JTVNJQ19Q
Q0kKPiArCWJvb2wKPiArCWRlcGVuZHMgb24gUklTQ1ZfSU1TSUMKPiArCWRlcGVuZHMgb24gUENJ
Cj4gKwlkZXBlbmRzIG9uIFBDSV9NU0kKPiArCWRlZmF1bHQgUklTQ1ZfSU1TSUMKPiArCj4gIGNv
bmZpZyBFWFlOT1NfSVJRX0NPTUJJTkVSCj4gIAlib29sICJTYW1zdW5nIEV4eW5vcyBJUlEgY29t
YmluZXIgc3VwcG9ydCIgaWYgQ09NUElMRV9URVNUCj4gIAlkZXBlbmRzIG9uIChBUkNIX0VYWU5P
UyAmJiBBUk0pIHx8IENPTVBJTEVfVEVTVAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXBsYXRmb3JtLmMKPiBpbmRleCBlMjM0NGZjMDhkY2EuLjkwZGRjZGQwYmJhNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiArKysg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBAQCAtMTQsNiAr
MTQsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaXJxZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21zaS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
cGNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3NwaW5sb2NrLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiBAQCAtMjA4LDYg
KzIwOSwyOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlycV9kb21haW5fb3BzIGltc2ljX2Jhc2Vf
ZG9tYWluX29wcyA9IHsKPiAgI2VuZGlmCj4gIH07Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1JJU0NW
X0lNU0lDX1BDSQo+ICsKPiArc3RhdGljIHZvaWQgaW1zaWNfcGNpX21hc2tfaXJxKHN0cnVjdCBp
cnFfZGF0YSAqZCkKPiArewo+ICsJcGNpX21zaV9tYXNrX2lycShkKTsKPiArCWlycV9jaGlwX21h
c2tfcGFyZW50KGQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBpbXNpY19wY2lfdW5tYXNrX2ly
cShzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gK3sKPiArCWlycV9jaGlwX3VubWFza19wYXJlbnQoZCk7
Cj4gKwlwY2lfbXNpX3VubWFza19pcnEoZCk7Cj4gK30KPiArCj4gKyNkZWZpbmUgTUFUQ0hfUENJ
X01TSQkJQklUKERPTUFJTl9CVVNfUENJX01TSSkKPiArCj4gKyNlbHNlCj4gKwo+ICsjZGVmaW5l
IE1BVENIX1BDSV9NU0kJCTAKPiArCj4gKyNlbmRpZgo+ICsKPiAgc3RhdGljIGJvb2wgaW1zaWNf
aW5pdF9kZXZfbXNpX2luZm8oc3RydWN0IGRldmljZSAqZGV2LAo+ICAJCQkJICAgIHN0cnVjdCBp
cnFfZG9tYWluICpkb21haW4sCj4gIAkJCQkgICAgc3RydWN0IGlycV9kb21haW4gKnJlYWxfcGFy
ZW50LAo+IEBAIC0yMzEsNiArMjU0LDEzIEBAIHN0YXRpYyBib29sIGltc2ljX2luaXRfZGV2X21z
aV9pbmZvKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCj4gIAkvKiBJcyB0aGUgdGFyZ2V0IHN1cHBv
cnRlZD8gKi8KPiAgCXN3aXRjaCAoaW5mby0+YnVzX3Rva2VuKSB7Cj4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfSU1TSUNfUENJCj4gKwljYXNlIERPTUFJTl9CVVNfUENJX0RFVklDRV9NU0k6Cj4gKwlj
YXNlIERPTUFJTl9CVVNfUENJX0RFVklDRV9NU0lYOgo+ICsJCWluZm8tPmNoaXAtPmlycV9tYXNr
ID0gaW1zaWNfcGNpX21hc2tfaXJxOwo+ICsJCWluZm8tPmNoaXAtPmlycV91bm1hc2sgPSBpbXNp
Y19wY2lfdW5tYXNrX2lycTsKCmlycV9zZXRfYWZmaW5pdHkoKT8KCgpCasO2cm4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
