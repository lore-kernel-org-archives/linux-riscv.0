Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080F1C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEKPQWBtgsC95Qj9g5RXlUXAPcNjoHvo+JV/ha4Ja/E=; b=IDShmuOzZiCJeM
	XVXLYigklBA/5x7a6zWdxM5XYh2Ja4LRUp3Ls59y2a68IgVRHfsw5MDCL+6a7p1rcjBKmHK2x7WV6
	W6WtJoQaJKEpF5y+7H4DDxoWG+wwQkFwWNCOmiK2Z4FR+rCDOnLYnW0hl7jz5GJ70+/mY/P04uy5s
	p1L4afKtNYBq6XzEjVloMb5bSM/ZGFmh3i0tiDyBe+WlsYJdvlFI8XhvVSS/ayZXIUuh2zPwXvWW8
	5oOXpyRxQeJZ0iGlnXeCaUC/acb7OO6P89lJvlTGkJqO8zYakKUwJzsJrDTkuos6S1eFraL8y3YwH
	B77lZnZwNoAisvaBlN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whV2y-0000000HaSc-1KN5;
	Wed, 08 Jul 2026 16:22:52 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whV2v-0000000HaS8-1AwE
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 16:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=oIho4lOceahQWqwg/8lgK/WREkp1NIyVJzaL/dtXx2w=; b=Qk+aebJP6/CUkDhtq/NRXoRatI
	0Cb7gyap9J7R+qGwyGYk3I0vPxh8yyruXRlf7LInEBTOy9j5Z2SDq/R+G2e3IUh/nVj9amnuS1/kb
	U/nOQln4Q3LVIgZFAIcRbP4LIuD/Fiqa4F37Z/GeyAguNg/U2No0XJGse+K1OWZ9W4OGaREJBG938
	WyBVLTIb683D3MRXVURKSHM+WT8p52rukYiIo06uL4jU+F0omtl3Wl5ezYrO9rCJ+JB8koRLSYtTm
	iovknmEV2HiaauaIYpI4LG6iwixL4mgDtXhyKHFxt5wCGaaoVHZ2u6PI4RYO0mEPkzRc1dYu4DRlt
	SBW9R1iA==;
Received: from 189-68-33-146.dsl.telesp.net.br ([189.68.33.146] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1whV2i-00BoIK-20; Wed, 08 Jul 2026 18:22:36 +0200
Message-ID: <8d1bd8fb-1c35-4944-ab77-4dfc73ae5056@igalia.com>
Date: Wed, 8 Jul 2026 13:22:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
To: Nam Cao <namcao@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
 <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernel-dev@igalia.com
In-Reply-To: <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_092249_322754_59E62974 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTmFtIENhbywgdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKRW0gMTkvMDYvMjAyNiAxMToxMSwg
TmFtIENhbyBlc2NyZXZldToKPiBUaGlzIGlzIHRoZSBSSVNDLVYgcG9ydCBmb3IgX192ZHNvX2Z1
dGV4X3JvYnVzdF90cnlfdW5sb2NrKCkuIEl0IGlzIGJhc2VkCj4gb24gdGhlIHg4NidzIGltcGxl
bWVudGF0aW9uIGluIGNvbW1pdCA2MWNmYzhlMzcyZDEgKCJ4ODYvdmRzbzogUHJlcGFyZSBmb3IK
PiByb2J1c3QgZnV0ZXggdW5sb2NrIHN1cHBvcnQiKSBhbmQgY29tbWl0IGEyMjc0Y2MwMDkxZSAo
Ing4Ni92ZHNvOiBJbXBsZW1lbnQKPiBfX3Zkc29fZnV0ZXhfcm9idXN0X3RyeV91bmxvY2soKSIp
Lgo+IAoKWy4uLl0KCj4gCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9u
aXguZGU+Cj4gLS0tCgpIb3cgaGF2ZSB5b3UgdGVzdGVkIGl0PwoKWy4uLl0KCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9mdXRleC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZHNvL2Z1dGV4LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uODlhOGM0MjU5OTRiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby9mdXRleC5oCj4gQEAgLTAsMCArMSw5IEBACj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKwoKSSBiZWxpZXZlIHRoaXMgaXMgbWlzc2lu
ZyB0aGUgaWZkZWYgaGVhZGVyIGd1YXJkCgojaWZuZGVmIF9fQVNNX1ZEU09fRlVURVhfSAojZGVm
aW5lIF9fQVNNX1ZEU09fRlVURVhfSAoKWy4uLl0KCj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVND
Vl9JU0FfWkFDQVMpICYmIGRlZmluZWQoQ09ORklHX1RPT0xDSEFJTl9IQVNfWkFDQVMpCj4gKyNk
ZWZpbmUgRlVURVhfQ0FTX09WRVJXUklURV9WRFNPX0NTX1JBTkdFKHZkc28sIGZkLCBpZHgsIHhs
ZW4sIHN5bWJvbCkJCQkJXAo+ICt7CQkJCQkJCQkJCQkJXAo+ICsJaWYgKHJpc2N2X2hhc19leHRl
bnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQUNBUykpIHsJCQkJXAo+ICsJCXZvaWQgKnN0
YXJ0ID0gc3ltYm9sKHZkc28sIENPTkNBVDMoZnV0ZXhfbGlzdCwgeGxlbiwgX3RyeV91bmxvY2tf
Y3NfY2FzX3N0YXJ0KSk7XAo+ICsJCXZvaWQgKmVuZCAgID0gc3ltYm9sKHZkc28sIENPTkNBVDMo
ZnV0ZXhfbGlzdCwgeGxlbiwgX3RyeV91bmxvY2tfY3NfY2FzX2VuZCkpOwlcCj4gKwkJCQkJCQkJ
CQkJCVwKPiArCQlmdXRleF9zZXRfdmRzb19jc19yYW5nZShmZCwgaWR4LCAodWludHB0cl90KXN0
YXJ0LCAodWludHB0cl90KWVuZCwgeGxlbiA9PSAzMik7CVwKPiArCX0JCQkJCQkJCQkJCVwKPiAr
fQo+ICsjZWxzZQo+ICsjZGVmaW5lIEZVVEVYX0NBU19PVkVSV1JJVEVfVkRTT19DU19SQU5HRSgu
Li4pCj4gKyNlbmRpZgo+ICsKPiArI2RlZmluZSBGVVRFWF9TRVRfVkRTT19DU19SQU5HRSh2ZHNv
LCBmZCwgaWR4LCB4bGVuLCBzeW1ib2wpCQkJCQlcCj4gK3sJCQkJCQkJCQkJCQlcCj4gKwl2b2lk
ICpzdGFydCA9IHN5bWJvbCh2ZHNvLCBDT05DQVQzKGZ1dGV4X2xpc3QsIHhsZW4sIF90cnlfdW5s
b2NrX2NzX2xyc2Nfc3RhcnQpKTsJXAo+ICsJdm9pZCAqZW5kICAgPSBzeW1ib2wodmRzbywgQ09O
Q0FUMyhmdXRleF9saXN0LCB4bGVuLCBfdHJ5X3VubG9ja19jc19scnNjX2VuZCkpOwkJXAo+ICsJ
CQkJCQkJCQkJCQlcCj4gKwlmdXRleF9zZXRfdmRzb19jc19yYW5nZShmZCwgaWR4LCAodWludHB0
cl90KXN0YXJ0LCAodWludHB0cl90KWVuZCwgeGxlbiA9PSAzMik7CQlcCj4gKwkJCQkJCQkJCQkJ
CVwKPiArCUZVVEVYX0NBU19PVkVSV1JJVEVfVkRTT19DU19SQU5HRSh2ZHNvLCBmZCwgaWR4LCB4
bGVuLCBzeW1ib2wpOwkJCQlcCj4gKwkJCQkJCQkJCQkJCVwKClNvIGlmIHRoZSBidWlsZCBoYXMg
c3VwcG9ydCBmb3IgQ0FTLCB0aGUgZnVuY3Rpb24gb3ZlcndyaXRlIHdoYXQgaXQgaGFkIApqdXN0
IHNldC4gV2h5IGRvIGl0IGV2ZW4gd3JpdGVzIGl0IGluIHRoZSBmaXJzdCBwbGFjZSB0aGVuLCBj
YW4ndCB0aGlzIApiZSBhbiBpZi9lbHNlPwoKPiArfQo+ICsKVGhhbmtzLAoJQW5kcsOpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
