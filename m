Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39990C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYDbaaZ0EY8+nHreiZq2waIcM8PUfB9ggup7FleVJAY=; b=bOp7T4+H66z/Sd
	n4pv2tlbINCFaAeUbhNxLZDp+ft6cQm4FRrEDGUAxq5QqPueGjR2jMOW5wMqrkQxK8Z5EEbkuJ4Q9
	Aoow+YL953A2ePgJLX5kJvbYGzy0dhFI3hsnETnrqcA2MAVnvTrjgd1XEtyXzeXZlcxVQrVPWK7th
	djbj/35DnKHQkcbjrVMzKP1rfIGZHpq6Jp0XOiL3Qpeii6gCnJUDTPTgRXTlwUCs62DqjimWoZnq6
	phZ0h8c6CbtD1JUqXsaapEPvr5YcwPZC+Jmwc1g3ogtGQQy37UtVae4vil0ll6nKxT1LYVmIWp0OW
	LOUu7cPrMqoZ/S6fxdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virMs-00000006mrT-4Bxj;
	Thu, 22 Jan 2026 09:52:47 +0000
Received: from sender4-pp-e108.zoho.com ([136.143.188.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virMr-00000006mr4-0Lvi
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769075537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JBJ/+wc0b5Hxlf5ahsSQPhwaW6hiu9azg9PvCFgw/mjFVv1ImjMp76R9IbWao0fOKXfJ3A1c+BQwG+Gw8EnEUbHtwqxqQqYI6Cqor7RvhRaDruYaAA6+wpBx2lr20yFZ/vKERc8hPRb7nalIJgWXJomMQSZBEZd2XEkPQmjG/54=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769075537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=En2qI4RcwDlkrfG6MdSabUnMFEl4jAYZLW1cW7ujXac=; 
	b=BJu2tKOz8v1SK2RshUDIvNiowM7rthLgXWS9m7Iuu5xEImEBiZRBQgzrUVcRmOwRdEu3km2xSxGwZcUC9v3RILQ1JNXaKsYVqO6H2OqAUi4zBxYwyKtGy1O/8WURxP4prJWhi93qGS2wjw70F9ZJnCb02W0DZN8wa0VoHKDkj48=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769075537;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=En2qI4RcwDlkrfG6MdSabUnMFEl4jAYZLW1cW7ujXac=;
	b=mkW0kRHDimVziqSg9qFRzy59I3am3tCQCNMQPdjs+aw10eI288VmpkLEfVChez/4
	tr8uuot/nFxyjRw6NMcGahZJ22d3RjzhWsQV9ZEiznwVNlbZx4ShK3BGS9vGitfvmZt
	djM16PLS/D0vTZBgFNBx2UGBDlnwVFAHpXnhuRx68cIA+gWQMEOLGjCRTAOEJfKDeVE
	/+twAuvquRm0RAt1zruS3wQZcBpygpzT1T2meo2lcC3KDbs0l1c4s9Yf1+xB327qySI
	WOAFzOyMfP0arIOSBHcBr51p2ZbqxVF1TBbUD1Dupz1A2BnCJzr+Co6k5rrFX+czVlH
	kRrxs79w2w==
Received: by mx.zohomail.com with SMTPS id 176907553619080.19812547444451;
	Thu, 22 Jan 2026 01:52:16 -0800 (PST)
Message-ID: <7dcf09b4c09f3bfb3650219d9d174f65dce17970.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 17:52:04 +0800
In-Reply-To: <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
	 <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_015245_179474_C2D25065 
X-CRM114-Status: GOOD (  14.38  )
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

5ZyoIDIwMjYtMDEtMjLmmJ/mnJ/lm5vnmoQgMTc6NDcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4g5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMg
WmltbWVybWFubuWGmemBk++8mgo+IAo+ID09PT09PT09PT09PT09PT09PT0gODwgPT09PT09PT09
PT09PT09PT09PT0KPiA+ID4gK3ZvaWQgZHJtX2Zvcm1hdF90b192c19mb3JtYXQodTMyIGRybV9m
b3JtYXQsIHN0cnVjdCB2c19mb3JtYXQKPiA+ID4gKnZzX2Zvcm1hdCkKPiA+ID4gK3sKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgc3dpdGNoIChkcm1fZm9ybWF0KSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9YUkdCNDQ0NDoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1f
Rk9STUFUX1JHQlg0NDQ0Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWEJH
UjQ0NDQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JYNDQ0NDoKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+Y29sb3IgPSBWU0RD
X0NPTE9SX0ZPUk1BVF9YNFI0RzRCNDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQVJHQjQ0NDQ6
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JBNDQ0NDoKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FCR1I0NDQ0Ogo+ID4gPiArwqDCoMKgwqDCoMKg
wqBjYXNlIERSTV9GT1JNQVRfQkdSQTQ0NDQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB2c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfQTRSNEc0QjQ7Cj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1hSR0IxNTU1Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNl
IERSTV9GT1JNQVRfUkdCWDU1NTE6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1B
VF9YQkdSMTU1NToKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUlg1NTUx
Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xvciA9
IFZTRENfQ09MT1JfRk9STUFUX1gxUjVHNUI1Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BUkdC
MTU1NToKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkE1NTUxOgo+ID4g
PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjE1NTU6Cj4gPiA+ICvCoMKgwqDC
oMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBNTU1MToKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1BVF9BMVI1RzVC
NTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCNTY1Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSNTY1Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX1I1RzZCNTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9SR0JYODg4ODoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1hCR1I4
ODg4Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSWDg4ODg6Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPmNvbG9yID0gVlNEQ19D
T0xPUl9GT1JNQVRfWDhSOEc4Qjg7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBicmVhazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Ogo+
ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCQTg4ODg6Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSODg4ODoKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSBEUk1fRk9STUFUX0JHUkE4ODg4Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX0E4UjhHOEI4Owo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGNhc2UgRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMDoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX1JHQkExMDEwMTAyOgo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9G
T1JNQVRfQUJHUjIxMDEwMTA6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9C
R1JBMTAxMDEwMjoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1h
dC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1BVF9BMlIxMEcxMEIxMDsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0
Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRFJNX1dBUk4oIlVuZXhwZWN0
ZWQgZHJtIGZvcm1hdCFcbiIpOwo+ID4gCj4gPiBkcm1fd2FybigpLiBJZiB0aGlzIGNhbiBiZSBp
bnZva2VkIGZyb20gdXNlciBzcGFjZSxlYXNpbHksIGJldHRlcgo+ID4gdXNlCj4gPiBkcm1fZGJn
KCkKCkFoLCBieSB0aGUgd2F5LCB0aGlzIGZ1bmN0aW9uIGN1cnJlbnRseSB0YWtlcyBubyBwYXJh
bWV0ZXIgdGhhdApjb250YWlucyB0aGUgc3RydWN0IGRybV9kZXZpY2UgcG9pbnRlci4gU2hvdWxk
IEkgcmV3b3JrIHRoZSBmdW5jdGlvbgpwcm90b3R5cGUgdG8gdXNlIGRybV93YXJuKCkgaW4gdGhp
cyBjYXNlIChJIGRpZG4ndCBzZWUgdXNlIG9mCmRybV93YXJuKE5VTEwsIHh4eCkgaW4gdGhlIGtl
cm5lbCBjdXJyZW50bHkpLCBvciBzaG91bGQgSSBzd2l0Y2ggYmFjawp0byBwcl93YXJuKCkgb3Ig
a2VlcCBEUk1fV0FSTigpID8KCj4gCj4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgZHVyaW5nIGF0
b21pY191cGRhdGUgb2YgcGxhbmVzLCBhbmQgSSB0aGluawo+IGluCj4gdGhpcyBjYXNlIHRoZSB1
bmtub3duIGZvcm1hdHMgc2hvdWxkIGFscmVhZHkgYmUgcmVqZWN0ZWQgYmVjYXVzZQo+IHRoZXkn
cmUgbm90IGFkdmVydGlzZWQgZm9yIGFueSBwbGFuZXMuCj4gCj4gRGlkIEkgZ2V0IGl0IHJpZ2h0
IG9uIHRoaXM/Cj4gCj4gPiAKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoHN3aXRjaCAoZHJtX2Zvcm1hdCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfUkdCWDQ0NDQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9SR0JBNDQ0NDoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQlg1
NTUxOgo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCQTU1NTE6Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYODg4ODoKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkE4ODg4Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNl
IERSTV9GT1JNQVRfUkdCQTEwMTAxMDI6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB2c19mb3JtYXQtPnN3aXp6bGUgPSBWU0RDX1NXSVpaTEVfUkdCQTsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNl
IERSTV9GT1JNQVRfWEJHUjQ0NDQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1B
VF9BQkdSNDQ0NDoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX1hCR1IxNTU1
Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjE1NTU6Cj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1I1NjU6Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1f
Rk9STUFUX0FCR1I4ODg4Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJH
UjIxMDEwMTA6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQt
PnN3aXp6bGUgPSBWU0RDX1NXSVpaTEVfQUJHUjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdS
WDQ0NDQ6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JBNDQ0NDoKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUlg1NTUxOgo+ID4gPiArwqDCoMKg
wqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTU1NTE6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9CR1JYODg4ODoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9S
TUFUX0JHUkE4ODg4Ogo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTEw
MTAxMDI6Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPnN3
aXp6bGUgPSBWU0RDX1NXSVpaTEVfQkdSQTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJyZWFrOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogTi9BIGZvciBZVVYgZm9ybWF0cyAqLwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5zd2l6emxlID0gVlNEQ19T
V0laWkxFX0FSR0I7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gKwo+ID4gPiArwqDCoMKg
wqDCoMKgwqAvKiBOL0EgZm9yIG5vbi1ZVVYgZm9ybWF0cyAqLwo+ID4gPiArwqDCoMKgwqDCoMKg
wqB2c19mb3JtYXQtPnV2X3N3aXp6bGUgPSBmYWxzZTsKPiA+ID4gK30KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
