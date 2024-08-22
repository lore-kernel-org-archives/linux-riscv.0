Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F099C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 05:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8FLEouj+MnBk73EOCQLyOkKSCgVo5eP+tn96kkS7K4=; b=iS+Yomgj6cQpRv
	jzKA1rT3zUQRL4rqHqk9MgXdGS7KWQTmLX6AYD/JGJOyhWGg5HtsgYpz6s+wzskg4lZ6aO6unqVLu
	Dv0pZYtOA9Nb4uvPV0p4WWfXjXGV2jQdTP5Yrm/mfHrEvbkia5N+t1zAyD1HEXkBEtzDnYw+1kdFV
	b1iKwIGCdE7KWrsv//czTVXdEd9AqX9xqwtA3LyN7ooD39SbaFDiboTpaemH1l1LGcJ2r4ZIC/759
	wwZDnHUAxVRYWSL6Xqh4tMQV3OT1aU9B5et4CrbBio0/SJucS8mhGTk+fgvWPwXy2dolhtlXgYVM9
	ick2YbC7O6elBLIIzoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh0AX-0000000BRZO-0TYS;
	Thu, 22 Aug 2024 05:15:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh09m-0000000BRNN-3DZs;
	Thu, 22 Aug 2024 05:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C88D0CE0FAA;
	Thu, 22 Aug 2024 05:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A4FC4AF0C;
	Thu, 22 Aug 2024 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724303684;
	bh=ngDz7AVNJAUvMqiSy4yLF8BEcn3Ug63o03RV0QSI7As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvmPV9NXqdombM0PixL1Rz1L8hnVmLhM/nT7uN//JOYsQ4ikNMF4yIjWioKyAHi7U
	 i1IPgzSne267LhLUlNoDVXZKlNvHax8kXpgU9jOIBr4GZP6TvgTZNiVgQkETYXemrQ
	 oWf4eUnU3vvEMu6Tf16e32MKRtt5lGZ+5sHH+XHo=
Date: Thu, 22 Aug 2024 13:14:41 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082227-sports-resource-9c65@gregkh>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
 <2024082210-stadium-sly-cf06@gregkh>
 <b356bdb2-fc17-44ef-b0e5-3868b452a8c2@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b356bdb2-fc17-44ef-b0e5-3868b452a8c2@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_221447_009356_7232EE52 
X-CRM114-Status: GOOD (  15.78  )
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

T24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMTI6NDY6MTBQTSArMDgwMCwgTGVpIExpdSB3cm90ZToK
PiAKPiBvbiAyMDI0LzgvMjIgMTI6MjcsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IE9u
IFRodSwgQXVnIDIyLCAyMDI0IGF0IDEyOjA3OjI1UE0gKzA4MDAsIExlaSBMaXUgd3JvdGU6Cj4g
PiA+IFRoZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGhlbHBlcnM6Cj4gPiA+ICAgICAgLSBjYWxs
IGRldm1fY2xrX2dldCgpCj4gPiA+ICAgICAgLSBjYWxsIGNsa19wcmVwYXJlX2VuYWJsZSgpIGFu
ZCByZWdpc3RlciB3aGF0IGlzIG5lZWRlZCBpbiBvcmRlciB0bwo+ID4gPiAgICAgICBjYWxsIGNs
a19kaXNhYmxlX3VucHJlcGFyZSgpIHdoZW4gbmVlZGVkLCBhcyBhIG1hbmFnZWQgcmVzb3VyY2Uu
Cj4gPiA+IAo+ID4gPiBUaGlzIHNpbXBsaWZpZXMgdGhlIGNvZGUgYW5kIGF2b2lkcyBjYWxscyB0
byBjbGtfZGlzYWJsZV91bnByZXBhcmUoKS4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiBUaGUgZmls
ZXMgdXg1MDAuYywgbXBmcy5jLCBhbmQgcHhhMjd4X3VkYy5jIGhhdmUgaW5jb3JyZWN0IHVzYWdl
IG9mCj4gPiA+IGNlcnRhaW4gaW50ZXJmYWNlcyBkdWUgdG8gdGhlIGxhY2sgb2Ygc3luY2hyb25p
emF0aW9uIGR1cmluZyB0aGUKPiA+ID4gY29tbWl0IHVwZGF0ZXMuIFRoZXNlIGlzc3VlcyBoYXZl
IGJlZW4gY29ycmVjdGVkIGluIHRoZSB2MSB2ZXJzaW9uLgo+ID4gPiAKPiA+ID4gdmVyc2lvbiAx
IGNoYW5nZXMKPiA+ID4gMS51eDUwMDogSW5jb3JyZWN0IHVzYWdlIG9mIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIHNob3VsZCBiZSBjb3JyZWN0ZWQgdG8KPiA+ID4gICAgZGV2bV9jbGtfZ2V0X2VuYWJs
ZWQoKS4KPiA+ID4gMi5tcGZzOiBJbmNvcnJlY3QgdXNhZ2Ugb2YgZGV2bV9jbGtfZ2V0X2VuYWJs
ZSgpIHNob3VsZCBiZSBjb3JyZWN0ZWQgdG8KPiA+ID4gICAgZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
KS4KPiA+ID4gMy5weGEyN3hfdWRjOiBJbmNvcnJlY3QgdXNhZ2Ugb2YgY2xrX3ByZXBhcmVfZW5h
YmxlKCkgc2hvdWxkIGJlCj4gPiA+ICAgIGNvcnJlY3RlZCB0byBkZXZtX2Nsa19nZXRfZW5hYmxl
ZCgpLgo+ID4gUGF0Y2ggdmVyc2lvbnMgc3RhcnQgYXQgMSwgdGhpcyBzaG91bGQgYmUgMiwgcmln
aHQ/Cj4gCj4gSGnvvIxEbyBJIG5lZWQgdG8gdXBkYXRlIHRoZSBwYXRjaCBmcm9tIHYxIHRvIHYy
IGFnYWluPwoKWWVzIHBsZWFzZSwgb3RoZXJ3aXNlIG91ciB0b29scyB3aWxsIGdldCBjb25mdXNl
ZC4KCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
