Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588B4C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1AmUR/YEDjvxhD5zwngYv2Mz+9jMV2p3rl2qDnZofA=; b=OHQcaANCvCJLlB
	BdOQqBGIZrm+W5SKHeptey/y+cioNEGBtK1MgenA2S9R/OeY0eignMCZTmpY0GBUzEOcuZYBRT33U
	jpIHOYYpq41xa5z6J6Bct6cvTx2PA3n6/c3YXXaTbwIA4ZgNUqUjmhkyPBtf5BKjoHMDK0WG+EZ6l
	56zV3JnEpu48tPQcEXi1AlQrIzoeXFeIvPENiFhcv42r127phtcA+wxSHCxijnIB7chkXXPCmv5iK
	aGXFxYrdCf7ZLhoglCpsUDbbbCgV3EDT83EPJojowk3CzS8kuYr/rQ/PXHyKSgGDovcolpliLg5NS
	IM7b3UYg84NBKINxYpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saslg-0000000F48k-0rwg;
	Mon, 05 Aug 2024 08:08:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saslb-0000000F47Q-2ZRx
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 08:08:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722845307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAAdbpCNB7qdXIx7XkZ0OYkacQpR9SF6FMccPCE4uW8=;
	b=kO4OpgX6yRheMGGzR827GvOy3syxNldWwI7Sm9vXJwVMH4IfHDmLwJDVDRA5HrMMRUXlk+
	KcoSc/YmkxR+eEbOzv7pC0njuc0b6pbeB7wytrQ7OngRaWXNzubzyGRQqbQIQDDU917Ada
	qiE/+9/UPvl7QUpthUGPF9kKatWElHiyHcity781UI7hbafd+bfjz/DMlTk70ZpBzTgyHA
	0Ne8FI2zZqOHzB5yN6V+Mp5++xJd8yIb01u5pIOTUtt9ZBBqDmRj/i5JFE9ol8czcOmg8t
	UFGGWTaLyTWslrHXepPrZ1HbGA8vwKdY+PxHzxOyXjeFinjWpyq0mPrZvXP1Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722845307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAAdbpCNB7qdXIx7XkZ0OYkacQpR9SF6FMccPCE4uW8=;
	b=aFB/w5xIjuxVNieF0vC2qdlulYO+tcCtgQg74wuVBCq0OgMe2iN/fMbZCmyh12di1oMo2U
	+InW49QI+3DU0jAA==
To: Vincent Chen <vincent.chen@sifive.com>, Anup Patel <anup@brainfault.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
In-Reply-To: <CABvJ_xgcbyQKa1+U1MC7cLEB-SUzzNaWqKdXFp+13mni0YSvNw@mail.gmail.com>
References: <20240802075741.316968-1-vincent.chen@sifive.com>
 <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
 <CABvJ_xgcbyQKa1+U1MC7cLEB-SUzzNaWqKdXFp+13mni0YSvNw@mail.gmail.com>
Date: Mon, 05 Aug 2024 10:08:26 +0200
Message-ID: <87sevj5r45.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_010831_812410_579A1ACA 
X-CRM114-Status: GOOD (  13.68  )
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

T24gTW9uLCBBdWcgMDUgMjAyNCBhdCAxMDo0MywgVmluY2VudCBDaGVuIHdyb3RlOgo+IE9uIEZy
aSwgQXVnIDIsIDIwMjQgYXQgNzowM+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+IHdyb3RlOgo+PiBTZWNvbmRseSwgY2hhbmdpbmcgY29tcGlsYXRpb24gb3JkZXIgaW4gTWFr
ZWZpbGUgdG8gaW5mbHVlbmNlCj4+IHRoZSBwcm9iZSBvcmRlciB3aWxsIG5vdCBoZWxwIGluIGFu
eSB3YXkuCj4+Cj4gSSB3YXMgY29uZnVzZWQgaGVyZS4gSWYgcG9zc2libGUsIGhvcGUgeW91IGNh
biBoZWxwIG1lIGNsYXJpZnkgaXQuCj4gVGhlIGZvbGxvd2luZyBpcyB0aGUgYmFja3RyYWNlIG9m
IHJlYWxseV9wb3JiZSgpIGR1bXBlZCBieSBHREIuCj4gIzAgIDB4ZmZmZmZmZmY4MDkyMzE4YSBp
biByZWFsbHlfcHJvYmUgKCkKPiAjMSAgMHhmZmZmZmZmZjgwOTIzNTE2IGluIF9fZHJpdmVyX3By
b2JlX2RldmljZS5wYXJ0LjAgKCkKPiAjMiAgMHhmZmZmZmZmZjgwNTdjODU2IGluIGRyaXZlcl9w
cm9iZV9kZXZpY2UgKCkKPiAjMyAgMHhmZmZmZmZmZjgwNTdjOWJhIGluIF9fZHJpdmVyX2F0dGFj
aCAoKQo+ICM0ICAweGZmZmZmZmZmODA1N2FhYTQgaW4gYnVzX2Zvcl9lYWNoX2RldiAoKQo+ICM1
ICAweGZmZmZmZmZmODA1N2MzZWEgaW4gZHJpdmVyX2F0dGFjaCAoKQo+ICM2ICAweGZmZmZmZmZm
ODA1N2JjNGEgaW4gYnVzX2FkZF9kcml2ZXIgKCkKPiAjNyAgMHhmZmZmZmZmZjgwNTdkNzVhIGlu
IGRyaXZlcl9yZWdpc3RlciAoKQo+ICM4ICAweGZmZmZmZmZmODA1N2U4M2MgaW4gX19wbGF0Zm9y
bV9kcml2ZXJfcmVnaXN0ZXIgKCkKPiAjOSAgMHhmZmZmZmZmZjgwYTI0NTVlIGluIGltc2ljX3Bs
YXRmb3JtX2RyaXZlcl9pbml0ICgpCj4gIzEwIDB4ZmZmZmZmZmY4MDAwMjEyYyBpbiBkb19vbmVf
aW5pdGNhbGwgKCkKPiAjMTEgMHhmZmZmZmZmZjgwYTAxMTg4IGluIGtlcm5lbF9pbml0X2ZyZWVh
YmxlICgpCj4gIzEyIDB4ZmZmZmZmZmY4MDkyOGQ4MCBpbiBrZXJuZWxfaW5pdCAoKQo+Cj4gQWNj
b3JkaW5nIHRvIHRoaXMgcmVzdWx0LCB0aGUgc291cmNlIHRvIGNhbGwgcmVhbGx5X3Byb2JlIGlz
Cj4gZG9fb25lX2luaXRjYWxsKCksIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBpdCBpcyBBUExJQyBv
ciBJTVNJQy4gVGhlCj4gZG9fb25lX2luaXRjYWxsKCkgZnVuY3Rpb24gZm9sbG93cyB0aGUgcGxh
Y2VkIG9yZGVyIG9mIHRoZQo+IGluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucyBpbiB0aGUgX19pbml0
Y2FsbDYgc2VjdGlvbiB0byBpbnZva2UgdGhlbS4KPiBUaGUgY29tcGlsZSBvcmRlciBkZXRlcm1p
bmVzIHRoZSBvcmRlciBvZiB0aGUgX19pbml0Y2FsbDYgc2VjdGlvbi4KPiBUaGVyZWZvcmUsIEkg
dHJ5IHRvIGFkanVzdCB0aGUgY29tcGlsZSBvcmRlciB0byBpbmZsdWVuY2UgdGhlIHByb2JlCj4g
b3JkZXIgYmV0d2VlbiBJTVNJQyBhbmQgQVBMSUMuIERvIEkgbWlzdW5kZXJzdGFuZCBzb21ldGhp
bmc/CgpUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0aGlzIG9yZGVyIGlzIHJldGFpbmVkLiBU
aGUgbGlua2VyIGNhbiBmcmVlbHkKcmVvcmcgdGhlIHNlY3Rpb24uIFRoYXQncyB3aHkgd2UgaGF2
ZSBkZWZlcnJlZCBwcm9iaW5nLiBJdCdzIG5laXRoZXIgYQpidWcgbm9yIGEgcHJvYmxlbSwgc28g
d2hhdCBhcmUgeW91IHRyeWluZyB0byBzb2x2ZT8KClRoYW5rcywKCiAgICAgICAgdGdseAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
