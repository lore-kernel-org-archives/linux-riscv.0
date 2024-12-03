Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C02E74AD5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klMLRdkHThxxCbvsDzQlo6navUCq4pUVOgQR0dCCyHI=; b=pspSYpxx8/FSma
	qLCn8r5aX//P+Si7CPtDYjb0D76RiW4aEjGl+OGaVCgJA8YWxzqciqb7iaLy3bokwdTCCKwc4IgGQ
	jJ3ymfHXYw7zgRoBdRfS03cfTIDJ84L5pqqrOcMzQ9uHShAlK/RwO9J4ZA7IFifQKStPKm8BOLzyD
	6iSQciejE/52VFxUNwXK1WlcX98lIxFBYhrl08QqVRsDzYaHpZgKezC3yMmY6R2zglkS3oKTV8WI9
	4LFIzP3UD8Os2Gz16M9pwd0xEJu0y1gx7pBv8hFd9bAEoM5IZzropSXFg9Ls66E8cQb0eT1aiYIOV
	/zOHqsBRXS/YJK7H1qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZvo-0000000AhP3-3wcP;
	Tue, 03 Dec 2024 20:55:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZvl-0000000AhNg-2kdK;
	Tue, 03 Dec 2024 20:55:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733259333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Vw7nq1aQDtWvQcv5ozrIWgauqOHp4Xst17oCDS5tdk=;
	b=j3xZ7ZWFy2hL7pxYlVg9MJz3602gMHQLlOCSB5IFE2hYgwHiCmqq6cOGP61nFHziKbygNE
	7i/hkkxMjJQOQoOleLMCdadQNQwZBqWFs5xKvdodhd/CIeHlKTZIeeZlIs86hDBKoSKmDC
	u2HfN+VZPWy8mWBSBGZf9bBfGroISFgy4ikLuqlwQ9BIQ5asnEoDD8TxIjhK2jEUXdBSLn
	06fypEp/Dcj14ZildKSQ3yIGDGBX8FXAJdPnrtKBiUJZ4PtzWoeKq+g0YNMdBJ6LwMYn9/
	A2YrNMvXJpddF5IkFNxflgI62NoBk+vmQh1Yooegqi4Ibubo1nM5Yv9LN5pPjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733259333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Vw7nq1aQDtWvQcv5ozrIWgauqOHp4Xst17oCDS5tdk=;
	b=uAjTjd9Bdv3Hyb9oR+zF04wYQT7dpe7EddPHw1ftQ1vQ22n9XQU/tWMXhzuhbQ9TYsAtQ/
	3NcMtY0zXJK2JSCg==
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, atishp@atishpatra.org,
 alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach
 irq_set_affinity
In-Reply-To: <CAAhSdy08gi998HsTkGpaV+bTWczVSL6D8c7EmuTQqovo63oXDw@mail.gmail.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com> <87mshcub2u.ffs@tglx>
 <CAAhSdy08gi998HsTkGpaV+bTWczVSL6D8c7EmuTQqovo63oXDw@mail.gmail.com>
Date: Tue, 03 Dec 2024 21:55:32 +0100
Message-ID: <874j3ktrjv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_125537_833669_0D3711B2 
X-CRM114-Status: UNSURE (   9.46  )
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

T24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMjowNywgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUs
IERlYyAzLCAyMDI0IGF0IDc6MjPigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4gd3JvdGU6Cj4+IFNvcnJ5LCBJIG1pc3NlZCB0aGF0IHdoZW4gcmV2aWV3aW5nIHRoZSBv
cmlnaW5hbCBJTVNJQyBNU0kgc3VwcG9ydC4KPj4KPj4gVGhlIHdob2xlIElNU0lDIE1TSSBzdXBw
b3J0IGNhbiBiZSBtb3ZlZCBvdmVyIHRvIE1TSSBMSUIgd2hpY2ggbWFrZXMgYWxsCj4+IG9mIHRo
aXMgaW5kaXJlY3Rpb24gZ28gYXdheSBhbmQgeW91ciBpbnRlcm1lZGlhdGUgZG9tYWluIHdpbGwg
anVzdCBmaXQKPj4gaW4uCj4+Cj4+IFVuY29tcGlsZWQgcGF0Y2ggYmVsb3cuIElmIHRoYXQgd29y
a3MsIGl0IG5lZWRzIHRvIGJlIHNwbGl0IHVwIHByb3Blcmx5Lgo+Pgo+PiBOb3RlLCB0aGlzIHJl
bW92ZXMgdGhlIHNldHVwIG9mIHRoZSBpcnFfcmV0cmlnZ2VyIGNhbGxiYWNrLCBidXQgdGhhdCdz
Cj4+IGZpbmUgYmVjYXVzZSBvbiBoaWVyYXJjaGljYWwgZG9tYWlucyBpcnFfY2hpcF9yZXRyaWdn
ZXJfaGllcmFyY2h5KCkgaXMKPj4gaW52b2tlZCBhbnl3YXkuIFNlZSB0cnlfcmV0cmlnZ2VyKCku
Cj4KPiBUaGUgSU1TSUMgZHJpdmVyIHdhcyBtZXJnZWQgb25lIGtlcm5lbCByZWxlYXNlIGJlZm9y
ZSBjb21tb24KPiBNU0kgTElCIHdhcyBtZXJnZWQuCgpBaCBpbmRlZWQuCgo+IFdlIHNob3VsZCBk
ZWZpbml0ZWx5IHVwZGF0ZSB0aGUgSU1TSUMgZHJpdmVyIHRvIHVzZSBNU0kgTElCLCBJIHdpbGwK
PiB0cnkgeW91ciBzdWdnZXN0ZWQgY2hhbmdlcyAoYmVsb3cpIGFuZCBwb3N0IGEgc2VwYXJhdGUg
c2VyaWVzLgoKUGljayB1cCB0aGUgZGVsdGEgcGF0Y2ggSSBnYXZlIEFuZHJldy4uLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
