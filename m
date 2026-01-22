Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4099C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJVx0jbZQWpItwVNQIiu4MqCL+SIFWXIm9q9U/op24U=; b=DoHNuPGjRFdTEu
	1MDZcwDo5+loOVoV970kgBOS/lgqHXeDkCbeF2dU2nul+T8Q43Hm4iD8u2+hNJaDfKl6DygjL2zTN
	PfVsZOmCRTUmpciXuKX1SXXEuW/1iyIBAN09gAr53UxjMc2mDm+Ic3mWquy23RuWNYD9O5J408nj6
	7eidNPcKXu/6xOo1s97D1n5uqjtvPYOb+xyi4MpMkUHbwb6Stekjwwtp0vx1vpJvkHOScnbvlvgxN
	plpHNiJboqViS6zj+ufCNgDdJPH+JzRt8Ya7Nfa5kwHboqOhUBbWZ1oABfLzMvT8AnSFlJQYLLuWN
	BCTo3QLxEDclHIpC565Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIV-00000006lZp-4Bmb;
	Thu, 22 Jan 2026 09:48:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIT-00000006lWu-0g02
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769075260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NmW93cmjM/+j+hM+wZK5y4eQLWOLm64Nz9ojwrChvJsLjlhyBFHz3ee49Qhbhnu1nH++FGcz07qoJx6oXxIBWvyieEFw56yRrssoGZPATp76EJpgbYE4lwhMzfq9/dOk0MvakTYYHx9yGxq4zOe83rzWSKNlxz8FuQJrqmTHJJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769075260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9w3yuU3WlAYbiHJ1EXGxjW9Zlg3UpYdlbJ8SL5HYfBE=; 
	b=CByadPfQm2KVMpVYEd/U7dF/riNM0QsG9t0YvFbEZxy8UmG2C2N6IQXZWuOUw3pMPc72Rawer45H9/kUBrhWI4B9//NtF8LtS/bSWKgqnw9WbigvE+3yjYvCSZwJAU3Oq9VxYm1FuFaLqJPu6+XWJ4pUfT0AmfPh/1znrDqjgEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769075260;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=9w3yuU3WlAYbiHJ1EXGxjW9Zlg3UpYdlbJ8SL5HYfBE=;
	b=cD+4yMkUSrVPLC9RCPknQcmJj5FAaki4N/5fAf9RtKbNI8cFB/99GcguJikYbNwD
	LSKWeWYx3bwT15eeGllIkj9xrofbJuzWHq58oO8XwlF5VvCGHIjKTP8/SnjPcVFxgox
	vBi5vdIixi1l0+lKmv5yLL09fhzf6gWLQP1OndzrzNkrT/O6zEzWyVbLHTFVLCA6/xS
	sXWb+ZuEr2wzoZiP1fWZYETSPs9wqu9Mloz78keYh7elAq7dfN53VOiBVUlSSt9TTok
	vRxOy8jUPUM5Kls1+Eq3wxoG1VHctXXbiYRR8Q36hKtDCDM4l0uMkFjVDGCaHcWNuf0
	VYVtO3sXFg==
Received: by mx.zohomail.com with SMTPS id 1769075259007389.09373127752656;
	Thu, 22 Jan 2026 01:47:39 -0800 (PST)
Message-ID: <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
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
Date: Thu, 22 Jan 2026 17:47:26 +0800
In-Reply-To: <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_014813_238956_BDFAAE3D 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT09PT09PSA4PCA9PT09PT09PT09PT09PT09PT09PQo+
ID4gK3ZvaWQgZHJtX2Zvcm1hdF90b192c19mb3JtYXQodTMyIGRybV9mb3JtYXQsIHN0cnVjdCB2
c19mb3JtYXQKPiA+ICp2c19mb3JtYXQpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgc3dpdGNo
IChkcm1fZm9ybWF0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWFJHQjQ0
NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCWDQ0NDQ6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWEJHUjQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSWDQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX1g0UjRHNEI0Owo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX0FSR0I0NDQ0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFU
X1JHQkE0NDQ0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FCR1I0NDQ0Ogo+
ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUkE0NDQ0Ogo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1B
VF9BNFI0RzRCNDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+
ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YUkdCMTU1NToKPiA+ICvCoMKgwqDCoMKg
wqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYNTU1MToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJN
X0ZPUk1BVF9YQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JY
NTU1MToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPmNvbG9y
ID0gVlNEQ19DT0xPUl9GT1JNQVRfWDFSNUc1QjU7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQVJHQjE1
NTU6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCQTU1NTE6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjE1NTU6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSQTU1NTE6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX0ExUjVHNUI1Owo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX1JHQjU2NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9C
R1I1NjU6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xv
ciA9IFZTRENfQ09MT1JfRk9STUFUX1I1RzZCNTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4
ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYODg4ODoKPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9CR1JYODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB2c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfWDhSOEc4Qjg7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNl
IERSTV9GT1JNQVRfQVJHQjg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRf
UkdCQTg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjg4ODg6Cj4g
PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTg4ODg6Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFU
X0E4UjhHOEI4Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEwOgo+ID4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkExMDEwMTAyOgo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX0FCR1IyMTAxMDEwOgo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9S
TUFUX0JHUkExMDEwMTAyOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zv
cm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1BVF9BMlIxMEcxMEIxMDsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRFJNX1dBUk4oIlVuZXhwZWN0ZWQg
ZHJtIGZvcm1hdCFcbiIpOwo+IAo+IGRybV93YXJuKCkuIElmIHRoaXMgY2FuIGJlIGludm9rZWQg
ZnJvbSB1c2VyIHNwYWNlLGVhc2lseSwgYmV0dGVyIHVzZQo+IGRybV9kYmcoKQoKVGhpcyBmdW5j
dGlvbiBpcyBjYWxsZWQgZHVyaW5nIGF0b21pY191cGRhdGUgb2YgcGxhbmVzLCBhbmQgSSB0aGlu
ayBpbgp0aGlzIGNhc2UgdGhlIHVua25vd24gZm9ybWF0cyBzaG91bGQgYWxyZWFkeSBiZSByZWpl
Y3RlZCBiZWNhdXNlCnRoZXkncmUgbm90IGFkdmVydGlzZWQgZm9yIGFueSBwbGFuZXMuCgpEaWQg
SSBnZXQgaXQgcmlnaHQgb24gdGhpcz8KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGRybV9mb3JtYXQpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9SR0JYNDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9SR0JBNDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYNTU1
MToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JBNTU1MToKPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9SR0JBODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1B
VF9SR0JBMTAxMDEwMjoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3Jt
YXQtPnN3aXp6bGUgPSBWU0RDX1NXSVpaTEVfUkdCQTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdS
NDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSNDQ0NDoKPiA+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9BQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9CR1I1NjU6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWEJHUjg4ODg6
Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjg4ODg6Cj4gPiArwqDCoMKg
wqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjIxMDEwMTA6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5zd2l6emxlID0gVlNEQ19TV0laWkxFX0FCR1I7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKg
wqBjYXNlIERSTV9GT1JNQVRfQkdSWDQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9G
T1JNQVRfQkdSQTQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSWDU1
NTE6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTU1NTE6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSWDg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSQTg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JN
QVRfQkdSQTEwMTAxMDI6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9y
bWF0LT5zd2l6emxlID0gVlNEQ19TV0laWkxFX0JHUkE7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIE4vQSBmb3IgWVVWIGZvcm1hdHMgKi8KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPnN3aXp6bGUgPSBWU0RDX1NX
SVpaTEVfQVJHQjsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oC8qIE4vQSBmb3Igbm9uLVlVViBmb3JtYXRzICovCj4gPiArwqDCoMKgwqDCoMKgwqB2c19mb3Jt
YXQtPnV2X3N3aXp6bGUgPSBmYWxzZTsKPiA+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
