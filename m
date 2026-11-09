Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4D606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZErk5LX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=TiIk+5K6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XhuWNNDXreiy6pa4oM+dysks1vv+NhodQGmralI1qxE=; b=AZErk5LXocplvLuY6MMWyokHav
	ZyFbdnzq3RRkE59+T/MgWRWqxuiBYBV8r9TALLw9PP05v2DhbgZmTvpAF9HwttZG+Wy/uYqslHupp
	TJJB9s2iP/CweXlv5pJOiYazZJv7UzVPALu/ZPvA7ny/EBIU1UozgcJHjZlP5SA//g0p6k7SbR8FP
	8hTkWJ/Jvy7Si7LPId5VcYKAz7tCIqqMw2TgUd6SVrItVIV0fvvToci/yYTHLVWTCgvuWF6RA3GwK
	U2WZCldDS7OkuYCKNNfjQQ3Nf8h2x9j+74UxA0aVUl71GOoggYGadEjOFqLlKOodws8mHljcmBQy6
	yoooaALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQK4-00000000wLj-0Tak;
	Mon, 09 Nov 2026 14:26:12 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQK1-00000000wKa-16mK
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 14:26:10 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67bf3c6654fso900573d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 06:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234367; cv=none;
        d=google.com; s=arc-20260327;
        b=fG1yWd+FWSKg7mneLT2p5yxeqAKp3un3bwF1ufxCK3DE3aokyY9zs6TIUEPJsP8QKl
         gG4lHyjo4O8ocuBNiVI2OFdHFhExWMKuNEquL1stdXWVbwzLIvVfaPMUaGGoSkzMDAmb
         4KHaWw5iVs11EHgJvvKtsY7XyJsJf3cZCfn+4CT0oZIKNnlGd41Oi8xvwvpUMyLTRDFi
         UmkXtehcVp4xbpfZLpdjoDvHPxDnkbU+1NBPZa0NXFfxxUDzoVVKHAG/EJ7uhA/RVdIU
         ybAN7CtAghtWIrDUb0W9xDpFvK129a42REaiFopxezZ3NlOXzykEbfhgTJV8FOyn4c2y
         cFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        fh=OOWpq4NQWb0DP9tbNbhjAk2mi2rBfsI/TKNyLRp8f90=;
        b=O2e1ZqPn+CyLBA7YQ6mXBCfgCfUXj2b+qbSitkoENKnZy06aDV/5QnWLlhW1AB2eqe
         qKfAUPWwCvUY6JPTazXlMQkEfBr2waYxJ4oKSPDuk+ohWGlsiIhqrGMv3Djiy0vdsVPS
         KP2ILhWdTIkpNdJcY36itnO9MwN0QszK0pXcjOPGQm2U7dlwwOCXAV66ahbS6MW1zxu/
         o+HKLGGiP/x5qFNG88aUOfPCPIZi2sSSXMYDl0sTA7jdw2svpcqTJeiFuW+kbOP0VKzF
         8yH6f2xbw+QYiSJCXVjydsH94fbPq6STQHyErr9oSE1a2J3cbUsQEAO4ZR6nGayEJc91
         t+Vw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794234367; x=1794839167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        b=TiIk+5K64fCnh7o9wwmGwF49hpEKLHEUW14sH/or46wh4nPR0hr6AMj1iB7I0JhRv6
         iRb59+fPntYg4H6gFcYd3U6gdJ+axwyIfxveqBPbH9LS54VT+vYlmFuBMymXl8nu2tQF
         0tAKul+YEtQwbmodyNk5GyOb5tMuVU3LD59VIpR9Z8pIG3v4H7lt1/uaoMdI4kPXbf9m
         wvtSltS4DfV7ZYonAPz4OVzckmmymz60BXpHl9Ea4DB92LPUXgmrou5Vj+X6NoTFpZ7t
         uHi+EjLjJhw7MFftKvokdnhvTUojKkb6JInZY36EDGj2dvGYzs8Dbgv4ipN3cQGeh14z
         L9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234367; x=1794839167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIH53Dn8wV1Rdnh4wAVpaQfyB6b4Tkg+abD1jmFQLjw=;
        b=LXYMxdUBAWkn8eXU1NlnRYT9HG76wD6fnbrp3+2S5MBkOXMQnWB5vwq76Cvlo34xBd
         Zt2NSl/siVnTe96fIcTAQY7Oaz8CyOGFYQIwGpHobEuqcXvA0pV2JdmM0NAt37yMq1lZ
         cyApzrYbOYksKxhjIHlo1ewgCEpkq+jqsiTJSjnP10ONk3Ij/qlQQ0PgWMylZzF+EVqB
         09DSXxa0qDO9Lc3d5H/s0YlgZz+/1myKvJ3iLLJB7boYGQFUNgh1FAYgvP5Xkdcy1Uz2
         fdx1wA1cDcsimyoi1z8PlQjQ+qv07ScRkh72hDa+HjcUkODOXtnqE4kVhFdwKDgOVdO4
         G+zA==
X-Forwarded-Encrypted: i=1; AL+hErGKfa98cvo1eg0SFXrfwV70tvhC6v87qOjluw4OUVgR7+57kdhqX4Hh5zLcSbnNvZk4jcV2f37ots3abg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+M8nGxN9K+P5p3Un4042O4E0VzBVuM00HUJxqgCLemEdDNI+DY
	wz+/Ee9mzLgXbCePnfqrMbQPGopRBqDFYPkkhr8simP5gyao0v3d9ulpJ7obkB2DZJrY8A7sVnR
	lgGExFtk3Qm5lA2v5wOe5VpmIW4B1lgRNirenUTgIq3wh/0b+FKsa0So=
X-Gm-Gg: AYBFou3C0+8Jmgafzk9dOkiSnWe88cpefxFBpCb1MWuptpwO9LTGsIaf8YpoxBZGahx
	qg08vpB20CJqx48r300WeI8Hz5s3B486p+6mrMji7ekyylNhF+3Q6Xl/xJDLjGilX4BO7OZwnYD
	gBES9MSTQP2/r6sIRXnCM3BealvMjAjrkKHe0AnLpjA76Sugc1fhmLQm74nGdQU6308bi6stJG4
	LSPTMWzFqesE8NcBrVelM1u3ndTE4J9eReRbUGYn/XXH441nZTZYhcbFQ/DxojAvIUoO84QMsc3
	1kXvwwMRvUuznSamxPfcfbgm8IozynzWBcxebR7s7uUhZm+xQnBAFhJDGWV8DC7WruAfrSggFIW
	MrcyYze1SzBg2cZUhfdOFg0JiUfXAkpZevKbMRui+FLqWWrF93jroC8vGZQ+2GAj91fY=
X-Received: by 2002:a05:690e:3c8:b0:67b:f736:2f89 with SMTP id
 956f58d0204a3-67c3da9c866mr1700371d50.162.1794234367353; Mon, 09 Nov 2026
 06:26:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
In-Reply-To: <20261109051050.105623-8-joel@jms.id.au>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 9 Nov 2026 08:25:55 -0600
X-Gm-Features: AclHuK--u5hRluPg1JE9nyFkIi-1UdC4R-UX8R7Z_hm47QF1ZiCQSficXx35Ivg
Message-ID: <CAEev2e_M6bqhDuQyygKBFUhy6euX7BmCyFQbk_q0VHtwz2ncBQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_062609_436454_FD48211A 
X-CRM114-Status: GOOD (  22.25  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgOCwgMjAyNiBhdCAxMToxMeKAr1BNIEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+IHdyb3RlOgo+Cj4gQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFRlbnN0b3JyZW50
IEF0bGFudGlzIHBsYXRmb3JtLCBiYXNlZCBvbiB0aGUKPiBBdGxhbnRpcyBTb0MgZmVhdHVyaW5n
IDh4IFJWQTIzLWNvbXBsaWFudCBUZW5zdG9ycmVudCBBc2NhbG9uLVhHIGNvcmVzLgo+Cj4gVGhl
IGV2YiBtYWNoaW5lIHJlcHJlc2VudHMgYW4gaW50ZXJuYWwgYnJpbmd1cCB2ZWhpY2xlIHdpdGgg
anVzdCB0aGUKPiBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYW5kIGEgVUFSVC4gVGhpcyB3aWxsIGJl
IHVwZGF0ZWQgaW4gdGltZSB3aXRoIGEKPiBmdWxsIGZlYXR1cmVkIG1hY2hpbmUgb25jZSBkZXRh
aWxzIGFyZSBhdmFpbGFibGUuCj4KPiBUaGUgY2hvc2VuIG5vZGUgc2V0cyBib290YXJncyB0byBl
YXJseWNvbj1zYmkgdG8gYWlkIGRlYnVnZ2luZyBlYXJseQo+IGJvb3QsIGFzIHRoZSBwbGF0Zm9y
bSBtYXkgbm90IGhhdmUgYSBib290bG9hZGVyIHRvIGZpbGwgb3V0IHRoZSBjaG9zZW4KPiBub2Rl
Lgo+Cj4gVGhlIG0tbW9kZSBJTVNJQyBzZXR0aW5nIHJpc2N2LGd1ZXN0LWluZGV4LWJpdHMgbG9v
a3Mgc3RyYW5nZSwgYXMgbS1tb2RlCj4gZGV2aWNlcyBkb24ndCBoYXZlIGd1ZXN0IGludGVycnVw
dCBmaWxlcy4gVGhlIHNwYWNpbmcgKHN0cmlkZSkgYmV0d2Vlbgo+IG0tbW9kZSBmaWxlcyBpcyB0
aGUgc2FtZSAyNTZLQiBhcyBzLW1vZGUgb24gQXRsYW50aXMsIHNvIHdlIHNldCB0aGUKPiBwcm9w
ZXJ0eSBzbyBzb2Z0d2FyZSAoZWcgT3BlblNCSSkgY2FuIGRlcml2ZSB0aGUgbGF5b3V0Lgo+Cj4g
VGhlIFNvQyBoYXMgYSA4LXdheSA2NEtCIEwxSSwgNC13YXkgMjU2S0IgTDFELCBhbmQgYSAyNC13
YXkgMTJNQiBsYXN0Cj4gbGV2ZWwgY2FjaGUgc2hhcmVkIGFjcm9zcyBhbGwgY29yZXMuCj4KPiBD
by1kZXZlbG9wZWQtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gLS0tCj4gdjM6Cj4gIC0gRml4IHBy
Y21fcmNwdSBwYXJlbnQKPiAgLSBEZWxlZ2F0ZSBhbGwgYXBsaWMgaXJxcwo+ICAtIERyb3AgdWFy
dDEgY2xvY2sgb3ZlcnJpZGUKPiAgLSBVc2UgZWFybHljb249c2JpLCBkb2N1bWVudCByYXRpb25h
bGUKPiAgLSBGaXggbWlzdGFrZXMgaW4gY2FjaGUgaW5mbwo+Cj4gdjI6Cj4gIC0gVXBkYXRlIG10
aW1lciBjb21wYXRpYmxlCj4gIC0gQWRkIERyZXcncyBjby1kZXZlbG9wZWQtYnkKPiAgLSBDb3Jy
ZWN0IGFwbGljIG51bS1zb3VyY2VzIGNvdW50Cj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMv
dGVuc3RvcnJlbnQvTWFrZWZpbGUgICAgICB8ICAgMSArCj4gIC4uLi9ib290L2R0cy90ZW5zdG9y
cmVudC9hdGxhbnRpcy1ldmIuZHRzICAgICB8ICAyOSArKwo+ICAuLi4vYm9vdC9kdHMvdGVuc3Rv
cnJlbnQvYXRsYW50aXMtc29jLmR0c2kgICAgfCA0NzMgKysrKysrKysrKysrKysrKysrCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgNTAzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvYXRsYW50aXMtZXZiLmR0cwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1zb2Mu
ZHRzaQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvTWFr
ZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RlbnN0b3JyZW50L01ha2VmaWxlCj4gaW5kZXgg
MmM4MWZhYWJhNDYyLi45MmQ4YmIxYTY4M2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy90ZW5zdG9ycmVudC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGVu
c3RvcnJlbnQvTWFrZWZpbGUKPiBAQCAtMSwyICsxLDMgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAo+ICBkdGItJChDT05GSUdfQVJDSF9URU5TVE9SUkVOVCkgKz0gYmxh
Y2tob2xlLWNhcmQuZHRiCj4gK2R0Yi0kKENPTkZJR19BUkNIX1RFTlNUT1JSRU5UKSArPSBhdGxh
bnRpcy1ldmIuZHRiCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJl
bnQvYXRsYW50aXMtZXZiLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvYXRs
YW50aXMtZXZiLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li44MzlhNjNkYzk1MDcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1ldmIuZHRzCj4gQEAgLTAsMCArMSwyOSBAQAo+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ICsvLyBDb3B5cmlnaHQg
MjAyNiBUZW5zdG9ycmVudAo+ICsvZHRzLXYxLzsKPiArCj4gKyNpbmNsdWRlICJhdGxhbnRpcy1z
b2MuZHRzaSIKPiArCj4gKy8gewo+ICsgICAgICAgbW9kZWwgPSAiVGVuc3RvcnJlbnQgQXRsYW50
aXMgZGV2ZWxvcG1lbnQgcGxhdGZvcm0iOwo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJ0ZW5zdG9y
cmVudCxhdGxhbnRpcy1ldmIiLCAidGVuc3RvcnJlbnQsYXRsYW50aXMiOwo+ICsKPiArICAgICAg
IG1lbW9yeUAwIHsKPiArICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiAr
ICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDgwMDAwMDAwPiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgPDB4MSAweDgwMDAwMDAwIDB4MCAweDgwMDAwMDAwPjsKPiAr
ICAgICAgIH07Cj4gKwo+ICsgICAgICAgYWxpYXNlcyB7Cj4gKyAgICAgICAgICAgICAgIHNlcmlh
bDAgPSAmdWFydDE7Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIGNob3NlbiB7Cj4gKyAgICAg
ICAgICAgICAgIGJvb3RhcmdzID0gImVhcmx5Y29uPXNiaSI7Cj4gKyAgICAgICAgICAgICAgIHN0
ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwIjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsm
dWFydDEgewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RlbnN0b3JyZW50L2F0bGFudGlzLXNvYy5kdHNpIGIvYXJjaC9y
aXNjdi9ib290L2R0cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1zb2MuZHRzaQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wODViMGFiOTBiYmUKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90ZW5zdG9ycmVudC9hdGxhbnRpcy1zb2Mu
ZHRzaQo+IEBAIC0wLDAgKzEsNDczIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMCBPUiBNSVQpCj4gKy8vIENvcHlyaWdodCAyMDI2IFRlbnN0b3JyZW50Cj4gKy9kdHMt
djEvOwo+ICsKPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ly
cS5oPgo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMt
cHJjbS1yY3B1Lmg+Cj4gKwo+ICsvIHsKPiArICAgICAgIG1vZGVsID0gIlRlbnN0b3JyZW50IEF0
bGFudGlzIjsKPiArICAgICAgIGNvbXBhdGlibGUgPSAidGVuc3RvcnJlbnQsYXRsYW50aXMiOwo+
ICsKPiArICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICsgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47Cj4gKwo+ICsgICAgICAgY3B1cyB7CgpQbGVhc2UgYWRkIGEgY3B1czogbGFiZWwgaGVy
ZSAobGlrZSBiZWxvdykuIEl0J2xsIGJlIHVzZWZ1bCBpZiB3ZSBuZWVkCnRvIHJlZmVyIHRvIHRo
aXMgbm9kZSBpbiB0aGUgdS1ib290IERULgoKICAgICAgICAgICAgY3B1czogY3B1cyB7CgogICAg
ICAgICAgICB9OwoKPiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAg
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsgICAgICAgICAgICAgICB0aW1lYmFz
ZS1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwMD47Cj4gKwo+ICsgICAgICAgICAgICAgICBjcHUwOiBj
cHVAMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0ZW5zdG9ycmVu
dCxhc2NhbG9uLXhnIiwgInRlbnN0b3JyZW50LGFzY2Fsb24iLCAicmlzY3YiOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
