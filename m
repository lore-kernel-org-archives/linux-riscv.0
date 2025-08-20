Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3476CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTPVonPYOM+/5za1TLSr6XPkzK2iPFhwn7O4DqgQBRc=; b=233UexOL+KBeKX
	gzDGzdk6v+k+fILb4ZrWIbVImcGI0089G2j458Hw4+Gwu46A12VrWVxGQYohhhlo9RXFcXgU2HPVK
	xV8WNi9e42AYqnDjZkS2RQuqPuTQPcwH122/WKn8h30tygVC/XZv9xQUfLULI3srvni/b2SHczqT+
	j4DHNwD2qjZ83teFD0jr+qpimNCOUWgD1xGTEiGF6gMf8cL+2oZIeuvDjw9FHyM8SYRNixBHius2s
	0BC5tF+Jz4yllxgZ5Arjphrr9CfEDDiAJmeskU2I3K+8tfCN+44V8CQh1BPxKEImq3CGxQ74hPjjf
	KFD6b21BjkhLyBbF+ZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouPh-0000000FUcc-3Dkb;
	Thu, 21 Aug 2025 01:48:25 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorsp-0000000F9Op-2zod
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 23:06:20 +0000
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C986933BEB9;
	Wed, 20 Aug 2025 23:06:15 +0000 (UTC)
Date: Thu, 21 Aug 2025 07:06:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, elder@riscstar.com
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
Message-ID: <20250820230605-GYA1065530@gentoo>
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
 <1a4a25d2-25a1-4d06-bba6-50f51cfbb619@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a4a25d2-25a1-4d06-bba6-50f51cfbb619@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_160619_773828_93CD57E9 
X-CRM114-Status: GOOD (  22.64  )
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

T24gMjA6MjcgV2VkIDIwIEF1ZyAgICAgLCBIZW5kcmlrIEhhbWVybGluY2sgd3JvdGU6Cj4gSGVs
bG8sCj4gCj4gT24gOC83LzI1IDIxOjE4LCBIZW5kcmlrIEhhbWVybGluY2sgd3JvdGU6Cj4gPiBB
ZGQgcmVzZXQgY29udHJvbCBlbnRyaWVzIGZvciBhbGwgVUFSVHMgaW4gdGhlIFNwYWNlTUlUIEsx
IFNvQyBEZXZpY2UgVHJlZS4KPiA+IFVBUlQwIHdhcyBmdW5jdGlvbmFsIGFzIGl0IGRpZCBub3Qg
bmVlZCBhIHJlc2V0LiBCdXQgdGhlIG90aGVyIFVBUlRzIHdlcmUKPiA+IHVuYWJsZSB0byBhY2Nl
c3MgdGhlaXIgcmVnaXN0ZXJzIHdpdGhvdXQgdGhlIHJlc2V0IGJlaW5nIGFwcGxpZWQuCj4gPgo+
ID4gQWx0aG91Z2ggcGVyaGFwcyBub3QgbmVlZGVkIEkgZGlkIGFkZCB0aGUgcmVzZXQgZm9yIFVB
UlQwIGFzIHdlbGwsCj4gPiB0byBlbnN1cmUgY29uc2lzdGVuY3kgYWNyb3NzIGFsbCBVQVJUcy4g
V2l0aCB0aGUgY3VycmVudC1zcGVlZCBzZXQgdG8KPiA+IDExMjUwMCBiYXVkIHJhdGUsIGl0IG1h
dGNoZXMgdGhlIGZhY3RvcnkgVS1Cb290IHNldHRpbmdzLgo+ID4gVGhpcyBzaG91bGQgbm90IGdp
dmUgaXNzdWVzIHdpdGggZWFybHkgY29uc29sZSB1c2FnZS4gQnV0IHBlcmhhcHMgaXQgY291bGQK
PiA+IGJlIGEgZ29vZCBpZGVhIHRvIGxldCBzb21lYm9keSBlbHNlIGNvbmZpcm0gdGhpcyBhcyB3
ZWxsLgo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyB2ZXJzaW9uIGZvciBhIHdoaWxlIGFuZCBubyBsb25n
ZXIgc2VlIHRoZSBuZWVkIGZvcgo+IGFkZGl0aW9uYWwgY29uZmlybWF0aW9uLgo+IAo+ID4KPiA+
IFRlc3RlZCB0aGlzIGxvY2FsbHkgb24gYm90aCBPcmFuZ2UgUGkgUlYyIGFuZCBCYW5hbmEgUGkg
QlBJLUYzIGJvYXJkcy4gCj4gPiBJIGVuYWJsZWQgdGhlIFVBUlQ5IGFuZCB3YXMgYWJsZSB0byB1
c2UgaXQgc3VjY2Vzc2Z1bGx5Lgo+ID4KPiBKdXN0IGEgZ2VudGxlIHJlbWluZGVyIGFib3V0IHRo
aXMgcGF0Y2guCj4gCj4gQWxsIFVBUlRzIGFyZSBsaXN0ZWQgaW4gdGhlIEsxIGRldmljZSB0cmVl
IGFuZCBwcm9iZWQgYnkgdGhlIDgyNTBfb2YgZHJpdmVyLAo+IGJ1dCB3aXRob3V0IHJlc2V0IGxp
bmVzIG1vc3Qgb2YgdGhlbSBhcmUgbm9uLWZ1bmN0aW9uYWwuIEFkZGluZyB0aGUgcmVzZXRzCj4g
bWFrZXMgdGhlbSB1c2FibGUgd2hlbiBtYXBwZWQgdG8gZGV2aWNlcy4KPiAKdGhhdCBwcm9iYWJs
eSBkdWUgdG8gb3RoZXIgVUFSVHMgYXJlIGluIGFzc2VydCBtb2RlIGJ5IGRlZmF1bHQsIHdoaWxl
ClVBUlQwIGFscmVhZHkgY29uZmlndXJlZCBieSBib290bG9hZGVyLi4KCj4gVGhpcyBwYXRjaCBp
cyBsaW1pdGVkIHRvIERUUyByZXNldCBoYW5kbGluZywgc28gVUFSVHMgYXJlIHVzYWJsZSBpbiB0
aGUKPiBjdXJyZW50IHN0YXRlLiBJ4oCZbSBhd2FyZSBBbGV4IEVsZGVyIGlzIGFzc2lnbmVkIHRv
IHRoZSBVQVJUIHBlcmlwaGVyYWwgb24KPiB0aGUgd2lraSBhbmQgd2lsbCBsaWtlbHkgaGFuZGxl
IHRoZSBicm9hZGVyIGRyaXZlciBpbXByb3ZlbWVudHMgKERNQSwKPiBjbG9jayB1cGRhdGVzLCBm
dWxsIGJhdWQtcmF0ZSBzdXBwb3J0KSwgc28gdGhpcyBzaG91bGQgbm90IGludGVyZmVyZSB3aXRo
Cj4gdGhhdCB3b3JrLgo+IAo+IFRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayEKPiAKPiBLaW5kIHJl
Z2FyZHMsCj4gSGVuZHJpawo+IAoKLS0gCllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
