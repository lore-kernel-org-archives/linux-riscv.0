Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41FEC25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tU5T7HDfhoMtfryFmWb4xSAXrORBWUl77lYCzGiAqYI=; b=eoGuILTrS7GEfE
	w9ddpKWfBt8UlgUQM7tsSkb9TrEAtReQoWoFlIfYKvH4V6dQI82DE8VpiidlqZpQA5F5hOuRuzifH
	c5yOtj5M88cE55sDhqppDJ0Y2bwOGpUM+Mwmtu5t5KPS2G/sqq9EVO1SI2W/yVL9KlktQ3TrthUDq
	diFfRtRCpNMiKIjnVFHXpg7l7nv3Q7Q76aiYT8m/aaG5RpUc2o+vymiF7We0dwdWmOknQYNbn7Enc
	w12PRl1G4QSbgZ0QyiE8LfhW8G/9yTngbPJszdOaqsR5LO87ZkGI7FjM4KLzDEtzDNyOR2kHTBpaV
	iYDcbkyZCUiNHd/11rYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIpY-00Fzjo-1k;
	Fri, 27 Oct 2023 09:08:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIpW-00Fzii-0D
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 09:08:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698397712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Mik8A9xbm7B9NaPlH1OFdo3giewagd8ozyvOVETdeM=;
	b=xEGfJtTXcMzSiccUwqeK/tNw8/5AtkrWY7H7wCbleDmqjUbjUyWSm37sDkBDPnuujLAXg6
	1xR24zmkvIgwnyykSd/LENC/6QDTGVJMH2OUssdRYgJqgLWVhXRaEpBPTKJvLYYryFcWLM
	UMfF2ha+Hooh7wjvM7AFGbxhqQgIeVjprhG5+ErRqE+3n8P7sgSNXVzjzXsPeJMlGh1DuH
	9z11mifRop85mU0AWUix2a9+UUqz6wyiRrohOe/w4i77a2chv1IlKms9eLQR1EwVwsDH2n
	9pEsk1IVvVXNV0ugaIrAeaYZfih8Eb1Zz20bkD2GSYHXZFFyuNHrlMuUzSK65w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698397712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Mik8A9xbm7B9NaPlH1OFdo3giewagd8ozyvOVETdeM=;
	b=JX0juIhhEDJ22N56IbsoZOOAgusFUAxt9RwDw1vEfT7BD9S5G0X4wTe4PBwPy/gsjsMrP6
	cb3zmhobY/M62HDQ==
To: Anup Patel <apatel@ventanamicro.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Anup Patel
 <anup@brainfault.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
In-Reply-To: <CAK9=C2Xou_sZKX96c8Z7RXPCnmdf-_DPHZ8rfPmNdBqx8s_30Q@mail.gmail.com>
References: <20231026101957.320572-1-bjorn@kernel.org>
 <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
 <87a5s5z44x.fsf@all.your.base.are.belong.to.us> <87fs1x3re9.ffs@tglx>
 <CAK9=C2Xou_sZKX96c8Z7RXPCnmdf-_DPHZ8rfPmNdBqx8s_30Q@mail.gmail.com>
Date: Fri, 27 Oct 2023 11:08:32 +0200
Message-ID: <87sf5w301b.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_020834_247556_39417396 
X-CRM114-Status: GOOD (  10.15  )
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

T24gRnJpLCBPY3QgMjcgMjAyMyBhdCAxMDowMSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmks
IE9jdCAyNywgMjAyMyBhdCA0OjQ34oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+IFdlIGhhdmUgdGhyZWUgdHlwZXMgb2YgTVNJcyBvbiBSSVNDLVYgcGxh
dGZvcm1zOgo+IDEpIFBDSSBNU0lzIChoYW5kbGVkIGJ5IHRoZSBJTVNJQyBkcml2ZXIgb2YgdGhl
IFJJU0MtViBBSUEgc2VyaWVzKQo+IDIpIFBsYXRmb3JtIE1TSXMgKGhhbmRsZWQgYnkgdGhlIElN
U0lDIGRyaXZlciBvZiB0aGUgUklTQy1WIEFJQSBzZXJpZXMpCj4gMykgV2lyZWQgSVJRcyBjb252
ZXJ0ZWQgdG8gcGxhdGZvcm0gTVNJcyAoYWthIHdpcmVkLXRvLU1TSSBicmlkZ2UsIHdoaWNoCj4g
ICAgIGlzIGhhbmRsZWQgYnkgQVBMSUMgZHJpdmVyIG9mIHRoZSBSSVNDLVYgQUlBIHNlcmllcykK
Pgo+IFRoZSBSSVNDLVYgQUlBIHNlcmllcyBuZWVkcyB0aGUgZ2VuZXJpYyBJUlEgZnJhbWV3b3Jr
IGNoYW5nZXMKPiByZWxhdGVkIHRvICMyIGFuZCAjMyAoYWJvdmUpIGZyb20geW91ciBzZXJpZXMg
aGVuY2UgbXkgc3VnZ2VzdGlvbgo+IHRvIHJlYmFzZSBvbiB5b3VyIHNlcmllcy4KPiAoaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMTIxMTM1NjUzLjIwODYxMTIzM0BsaW51dHJvbml4
LmRlLykKPgo+IElzIHRoZXJlIGEgd2F5IHRvIGhhdmUgeW91ciBnZW5pcnEgY2hhbmdlcyBtZXJn
ZWQgYmVmb3JlIGFsbCBBUk0KPiBkcml2ZXJzIGhhdmUgYmVlbiBtb3ZlZCB0byB0aGUgbmV3IHBy
b2dyYW1taW5nIG1vZGVsID8KPiBPUgo+IEFueSBvdGhlciB3YXkgdG8gZGVhbCB3aXRoIHRoaXMg
ZGVwZW5kZW5jeSA/CgpJJ2xsIGhhdmUgYSBsb29rIGF0IHRoaXMgbWF6ZSBhZ2FpbiBhbmQgc2Vl
IGhvdyB0aGF0IGNhbiBiZSBzZXBhcmF0ZWQKZnJvbSB0aGUgQVJNIHBpbGUsIHVubGVzcyB5b3Ug
YmVhdCBtZSB0byBpdCA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
