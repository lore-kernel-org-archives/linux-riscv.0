Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C567DEFCD99
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dD4aJL2juORgtI5NY0jdCJpHDzNNYkx+IwMl5dAwhZU=; b=nyiM40oiaYLZqf
	iN0gXUMMtQs/NN7Is8CuRcA6sIFXdtun+uTARjbGv75kG3bMxSrYxVNXKfQorw+Y5G+1RGnNzWLOe
	MTCkO3WgVhmMG28nA/Nrn0tudqT8r76FLoNuNrZCwK4QLf1BO7S2ZIlfQt5yZmPQjL3P9+3rqAA83
	WFdP+O3kchnoMvam2Ej1j9QutwtBFwJEAKjBw/kY0ImqrnQCz1fDuQ4r+c6cD0wkDJ9rIPJwe2Zv9
	IaRPCpIl77SpkulRfAElkjX/adMl26kPM+ALNMlC8A4daQ2Ykxk219O+KFhnvGqrTygXhTUG3lt1x
	cjka5rLO5Bid6tkNOXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYZe-00000007A2R-28E1;
	Mon, 09 Mar 2026 11:14:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYZb-00000007A1Y-43ve
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:14:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzYZJ-0002Gl-Um; Mon, 09 Mar 2026 12:14:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzYZH-004WOQ-0i;
	Mon, 09 Mar 2026 12:14:36 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzYZI-000000007rl-1w15;
	Mon, 09 Mar 2026 12:14:36 +0100
Message-ID: <03d1bb1e0f73b4718900902122ef2dc97cb668c8.camel@pengutronix.de>
Subject: Re: [PATCH v4 02/10] reset: eyeq: Add EyeQ7H compatibles
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?ISO-8859-1?Q?Th=E9o?= Lebrun	
 <theo.lebrun@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
	 <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, Sari Khoury
	 <sari.khoury@mobileye.com>
Date: Mon, 09 Mar 2026 12:14:36 +0100
In-Reply-To: <20260304-clk-eyeq7-v4-2-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
	 <20260304-clk-eyeq7-v4-2-9d6bd9d24bec@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041456_034698_F6D205DE 
X-CRM114-Status: GOOD (  12.46  )
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

T24gTWksIDIwMjYtMDMtMDQgYXQgMTY6MjUgKzAxMDAsIEJlbm/DrnQgTW9uaW4gd3JvdGU6Cj4g
QWRkIHN1cHBvcnQgZm9yIHRoZSByZXNldCBjb250cm9sbGVycyBmb3VuZCBpbiB0aGUgRXllUTdI
IE9MQi4gRm9yCj4gdGhpcywgdGhyZWUgbmV3IHR5cGVzIG9mIHJlc2V0IGRvbWFpbiBhcmUgYWRk
ZWQgdG8gdGhlIGRyaXZlci4KPiAKPiBUaGUgRVFSX0VZRVE3SF9BQ1JQIHJlc2V0IGRvbWFpbiBp
cyBzaW1pbGFyIHRvIHRoZSBFUVJfRVlFUTVfQUNSUCBkb21haW4sCj4gc2hhcmluZyB0aGUgc2Ft
ZSByZWdpc3RlciBhZGRyZXNzIGNhbGN1bGF0aW9uIGJ1dCBmZWF0dXJpbmcgYSBkaWZmZXJlbnQK
PiByZWdpc3RlciBsYXlvdXQuIFdoZW4gd3JpdGluZyB0byB0aGUgcmVnaXN0ZXIsIE1CSVNUIGJp
dHMgYXJlIHNldCB0bwo+IHplcm8gdG8gZW5zdXJlIG5vcm1hbCBkZXZpY2Ugb3BlcmF0aW9uLgo+
IAo+IFRoZSBFUVJfRVlFUTdIX0NGRyByZXNldCBkb21haW4gaXMgc2ltaWxhciB0byB0aGUgRVFS
X0VZRVE1X1BDSUUgZG9tYWluLAo+IHdpdGggdHdvIGJpdHMgcGVyIGRldmljZSBpbnN0ZWFkIG9m
IG9uZS4gVGhlc2UgdHdvIGJpdHMsIGNsb2NrIGVuYWJsZSBhbmQKPiBucmVzZXQsIGFyZSBrZXB0
IGluIHN5bmMgd2hlbiBhc3NlcnRpbmcgYW5kIGRlYXNzZXJ0aW5nIHRoZSBkZXZpY2UgcmVzZXQu
Cj4gCj4gVGhlIEVRUl9FWUVRN0hfQUNDIHJlc2V0IGRvbWFpbiBpcyBzaW1pbGFyIHRvIHRoZSBF
UVJfRVlFUTZIX1NBUkNSIGRvbWFpbiwKPiB3aXRoIGEgZGlmZmVyZW50IHJlZ2lzdGVycyBsYXlv
dXQgYW5kIG5vIGJ1c3kgd2FpdGluZy4KPiAKPiBBbG9uZ3NpZGUgdGhlc2UgbmV3IHJlc2V0IGRv
bWFpbnMsIGFkZCBFUVJfTkJfRE9NX1RZUEVTIGF0IHRoZSBlbmQgb2YgdGhlCj4gZXFyX2RvbWFp
bl90eXBlIGVudW1lcmF0aW9uIGFuZCB1c2UgaXQgdG8gZGVjbGFyZSB0aGUgZXFyX3RpbWluZ3Mg
YXJyYXkuCj4gVGhpcyBlbnN1cmVzIHRoYXQgd2UgaGF2ZSB0aGUgZXhwZWN0ZWQgbnVtYmVyIG9m
IGVudHJpZXMgd2hlbiB1c2luZyB0aGUKPiB0aW1pbmdzIGluIGVxcl9idXN5X3dhaXRfbG9ja2Vk
KCkuCj4gCj4gQWRkIGFuZCBvcmRlciB0aGUgYXV4aWxpYXJ5X2RldmljZV9pZCBlbnRyaWVzIGlu
IGVxcl9pZF90YWJsZS4KPiAKPiBPcmlnaW5hbGx5LWJ5OiBTYXJpIEtob3VyeSA8c2FyaS5raG91
cnlAbW9iaWxleWUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgoKYW5kLCBzaW5jZSB0aGlzIGRlcGVuZHMgb24gcGF0Y2ggMSwKCkFja2Vk
LWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKdG8gYmUgbWVyZ2Vk
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
