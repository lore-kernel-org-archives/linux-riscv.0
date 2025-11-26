Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A71D1118F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDKqLtnOgCYAh6lxZ8lSzFrJs3qamj0K0EiqcAz0vWo=; b=OJ129LSavHzzLK
	MxR1i930FMQi5opLnc0SmrlINIlw3pSnvz1pxySx6A5vEl8H64tm+6y0UFvfvDXfK3+oyS2objTFk
	SPBR7gcCtfb2B+3kYAh3PzS61fLmwr641CJC9+XvLcGZm8sGFKaBTI3W8p0dAZFijQAQTBbWY9gbX
	tlDiWnfEeRz4XAtIzZabEwoBnGPO4FTyQ2FWjNsmAKUAr/T8JxA5ijJZgH/6udTTksDEVw2heIAgI
	lDJ1KDpd4VpE+l7ANPX9Z1Z5pGxhCEv6T7frYIOdeF9zCYeHWz3CsUtMy51b7lWXYqQOhveoZ6u5/
	e/NA9c1+1vOZCawoZxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJw1-0000000FTgY-3RrH;
	Wed, 26 Nov 2025 18:08:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJvz-0000000FTeI-0EsH
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 18:08:08 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764180482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOfVoAvwVfkMv0CkBNziqO3DoB+DwhfACrlo+JZQuoY=;
	b=zZefXdB+fpMdDPg9Gu5WI7TqNDb16+k0KrO46bEcrfK7+LVNyWrVwEAdA5EEDFnDmU3MpA
	Arc1xTGoeezX25iOa1FiNgbsjm845HdTvVVJ4t4XC7VO+jAF6pBtW59NMxAhAeaczqkqjB
	uXy+yo7XnBD5gB4e7GWt1gmutb6Gv1Kk2BJKEKyV0tKfZ/2yWPuEXnAggH+offKLXKLH0K
	Ef/T+e1buNX3TVWBnGX3XWMeMjqzbaO6lTjsxW3WAxNEHtRAbnGycCBY9OmtNbH2X9yJJu
	eLa1NyiVo0lku3OUH4luCkxPbCM5RyQgrAaOTTZzKU0Axu/Dlag8+VIBe+yL5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764180482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOfVoAvwVfkMv0CkBNziqO3DoB+DwhfACrlo+JZQuoY=;
	b=QCeZYUwSxXm50lT7nXzkgoAtKDC2/KZC/bOdFGOpzIkce8rYL8Oeq91HYukJ2ahWxRwfCV
	DpomQsAw8n71FfDA==
To: =?utf-8?B?6K645L2z5Yev?= <xujiakai2025@iscas.ac.cn>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building with
 Clang
In-Reply-To: <875xax5eq8.fsf@yellow.woof>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
 <875xax5eq8.fsf@yellow.woof>
Date: Wed, 26 Nov 2025 19:08:01 +0100
Message-ID: <875xawwttq.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_100807_238174_7A091288 
X-CRM114-Status: UNSURE (   9.92  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKPiDorrjkvbPlh68gPHh1amlh
a2FpMjAyNUBpc2Nhcy5hYy5jbj4gd3JpdGVzOgo+PiBDbGFuZyBtaXNhbGlnbnMgdGhlIHRlc3Rf
a3Byb2Jlc19hZGRyZXNzZXMgYW5kIHRlc3Rfa3Byb2Jlc19mdW5jdGlvbnMKPj4gYXJyYXlzLCBv
ciBkb2VzIG5vdCBleHBvcnQgbG9jYWwgbGFiZWxzIGJ5IGRlZmF1bHQuIEJvdGggY2FuIGNhdXNl
Cj4+IGttYWxsb2NfYXJyYXkoKSBhbGxvY2F0aW9uIGVycm9ycyBhbmQgS1VuaXQgZmFpbHVyZXMu
Cj4+Cj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5Ogo+PiAtIEFkZGluZyAuc2VjdGlv
biAucm9kYXRhIHRvIGV4cGxpY2l0bHkgcGxhY2UgYXJyYXlzIGluIHRoZSByZWFkLW9ubHkgZGF0
YSBzZWdtZW50Lgo+PiAtIEFkZGluZyAuYWxpZ24gMyB0byBhbGlnbiBhcnJheXMgdG8gOCBieXRl
cy4KPj4gLSBBZGRpbmcgLmdsb2JsIHRvIHByb2JlIGxhYmVscyB0byBlbnN1cmUgc3ltYm9scyBh
cmUgdmlzaWJsZS4KPgo+IFdlIGRvIG5vdCBoYXZlIHRvIG1ha2UgaXQgZXhhY3RseSB0aGUgc2Ft
ZSBhcyBidWlsZGluZyB3aXRoIEdDQywgcmlnaHQ/Cj4gT25seSBtb3ZpbmcgdGhlIGFycmF5cyB0
byAucm9kYXRhIHNlZW1zIHN1ZmZpY2llbnQgdG8gZml4IHRoZSBpc3N1ZSwgYnV0Cj4gSSBjYW5u
b3QgZXhwbGFpbiB3aHkgeWV0Lgo+Cj4gV2hhdCBJIG9ic2VydmVkIGlzIHRoYXQgd2l0aCBDT05G
SUdfUkVMT0NBVEFCTEU9eSwgdGhlIGtlcm5lbCdzCj4gLnJlbGEuZHluIHNlY3Rpb24sIHdoaWNo
IGhvbGRzIHRoZSByZWxvY2F0aW9uIGVudHJpZXMgZm9yIHRoZSB0d28KPiBhcnJheXMsIGhhdmUg
aW5jb3JyZWN0IGFkZHJlc3NlcyAodGhleSBhcmUgYWxsIGluY29ycmVjdGx5IG9mZnNldCBieSA2
Cj4gYnl0ZXMgZm9yIG15IGJ1aWxkKS4gVGhlIGtlcm5lbCB1c2VzIHRoZXNlIHJlbG9jYXRpb24g
aW5mb3JtYXRpb24gdG8KPiBmaWxsIHRoZSBhcnJheXMgZHVyaW5nIGJvb3QsIGFuZCBmaWxsIHRo
ZW0gYXQgd3JvbmcgYWRkcmVzc2VzLgo+Cj4gSSBzbWVsbCBhIGxpbmtlciBwcm9ibGVtLCBidXQg
bW9yZSBpbnZlc3RpZ2F0aW9uIG5lZWRlZC4uLgoKSSBzZW50IG15IGZpbmRpbmdzIHRvIExMVk0g
Zm9sa3M6Cmh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvMTY4MzA4
I2lzc3VlY29tbWVudC0zNTgyNTk2Njk0CgpJIHN1c3BlY3QgbGlua2VyIHByb2JsZW0uIEJ1dCBs
ZXQncyBzZWUgd2hhdCBMTFZNIHBlb3BsZSB0aGluay4KCk5hbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
