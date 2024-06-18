Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F47AC2BA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 22:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uD6nMU6rLGhKpuOqnKfhWfZOix/3GL6Iszp3wiSWjaI=; b=1Dg3LTmEOgVQ4V
	D8RXuOzwebYgG41d6BBGKxFjKCP4oyuWtMjxkE63sOzlZCPJT8PMCCOKbz9LZed/vnxY8rQcPHQvv
	plyBSHlWuAURGCjD8nSFAvA2hVBm1XnXtmdNAG8F+0Bj7/pysAVKRkFdeBhULEnnU3BVcwkwuCa2H
	hlANeL2cIwWLlE8D8y/sJvAyfuPKHl/seIrP3p2dX8fArM0kv8nZ2xn0SNAL8YMzcUlAaVUclTZHh
	cd9PosxANWyPBiloKR6nBJaVYfT6bcSFREWNFodkNtLbF7YuLpbNjz11lHuGjEa/yLD6W+U5gFHDJ
	BogidmBT7SEuN2QhwwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJh8d-0000000GlSg-3Zpk;
	Tue, 18 Jun 2024 22:17:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJh8Z-0000000GlQV-0ZVz
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 22:17:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f6da393ae4so2762345ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 15:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718749029; x=1719353829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnC1LBQnjtEKO+X1jyWNJR9MMF6f5OsiOUP4k8JZc+E=;
        b=ECPjqg6MY0ftuBtO9PoZmLXLB5gKIEE0gVibGwemTkAxqhCD7NK5AFE8zi1zvuDSU8
         ZkKQAJqOFSY/HOsqv2sShSsOty96P8NNP+lnTpYeERJ3CEoKssMdDt0j37G+gBBGFX03
         I+gEXAW7xpZhMLZCBz+wyMuHaj01Bq88HkwFFKXX+C/5RWSIErdnqSFHo4JhK+WG4kJ5
         l/tWnyDwXWr70b0iGINB3oal3a9dt5JgFNv4h6Q6mu7gPYpwDBo190AfoDp6TJ5iv8Bq
         hyklriilNmQ7PKi3w4De2LPprC9kwuhW3rqOrNZ1x1f+R0HNhSkrZ1qCG5YpyVuALZPH
         mCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718749029; x=1719353829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnC1LBQnjtEKO+X1jyWNJR9MMF6f5OsiOUP4k8JZc+E=;
        b=PqPmoJ12yPFlg8ZWIeil6I3hNL6bCBLgDjADq1pNhfVGfXKYnxIv9VFzE1xOHnXwCm
         owsMQr82eScrg7sRxleqEka1Vl/VPlTq/9unSKd9lBiAKVsmNbUlbgGqj4I8Qh09mN+Z
         eyCREK8hWJ5dFeWOiJXm7HwImw5AIr87rROpYVlNp35hNqhfnkiIa1QAcv4CZ5nFBScl
         IyOCQRbM12KBtrPwuuc76RP138Ha1V80CugWJfzZCCk28hO8bmnbegKtZI94v33PGiuV
         oqYNYysZIt6SeGyfv7Hf4/HqF4bHYJ4sbu/DNJaAnE1LmaUnSGjQgM8HaXcaBHSfoPg1
         Nseg==
X-Forwarded-Encrypted: i=1; AJvYcCXKGSngLocojlMm4nGT4thNbTF99WzgXhPYVP6Ygr8Af+/fDqpwtCydIH9yIaW0dMtsIdd2Xx7UnongyaiFE4YYXgAo1ATxBunHCQb3tH1Q
X-Gm-Message-State: AOJu0Yz0T+9vgJfP7010Hbg6HQ6AEeDwXlVldRDiktxn2w3Bd+6+gaOx
	6A90xmMeHN6o7aYAv8bk9Yj1/7ByDjd/iB76uJR7BWnCIiHA50vS3MIS38gnRMfRy0dK1cHXnAl
	+OIdc+KHmlfgcj9S8O4B+l/m/EF75f9ooeVTk
X-Google-Smtp-Source: AGHT+IEXKq/xECPLoVdaKRzGmnRVLc8vS2zPQcYKvrbgroA29vHQSq/4IWdtC4KntTt0ibP6NnNAW9EX6e44UbzWnEM=
X-Received: by 2002:a17:902:ce84:b0:1f7:2a95:f2de with SMTP id
 d9443c01a7336-1f9ab0c21bbmr9093575ad.6.1718749029420; Tue, 18 Jun 2024
 15:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240616170553.2832-1-jszhang@kernel.org>
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
From: Cyril Bur <cyrilbur@tenstorrent.com>
Date: Wed, 19 Jun 2024 08:16:58 +1000
Message-ID: <CANtDSir9O+B1mZx-k+j0+bHo03A653itida8f34frFaY2doM0Q@mail.gmail.com>
Subject: [PATCH 0/6] riscv: convert bottom half of exception handling to C
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_151711_209608_B9B8DAEC 
X-CRM114-Status: GOOD (  24.26  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzoyMeKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGb3IgcmVhZGFiaWxpdHksIG1haW50YWluYWJpbGl0eSBh
bmQgZnV0dXJlIHNjYWxhYmlsaXR5LCBjb252ZXJ0IHRoZQo+IGJvdHRvbSBoYWxmIG9mIHRoZSBl
eGNlcHRpb24gaGFuZGxpbmcgdG8gQy4KPgo+IER1cmluZyB0aGUgY29udmVyc2lvbiwgSSBmb3Vu
ZCBBbnRvbiBmaXhlZCBhIHBlcmZvcm1hbmNlIGlzc3VlCj4gYW5kIG15IHBhdGNoZXMgd2lsbCB0
b3VjaCB0aGUgc2FtZSBleGNlcHRpb24gYXNtIGNvZGUsIHNvIEkgaW5jbHVkZQo+IEFudG9uJ3Mg
cGF0Y2ggZm9yIGNvbXBsZXRlbmVzcy4gSSBhbHNvIGNvb2tlZCBhIHNpbWlsYXIgcGF0Y2ggdG8g
YXZvaWQKPiBjb3JydXB0aW5nIHRoZSBSQVMgaW4gcmV0X2Zyb21fZm9yaygpIHBlciB0aGUgaW5z
cGlyYXRpb24uCj4KPiBNb3N0bHkgdGhlIGFzc2VtYmx5IGNvZGUgaXMgY29udmVydGVkIHRvIEMg
aW4gYSByZWxhdGl2ZWx5Cj4gc3RyYWlnaHRmb3J3YXJkIG1hbm5lci4KPgo+IEhvd2V2ZXIsIHRo
ZXJlIGFyZSB0d28gbW9kaWZpY2F0aW9ucyBJIG5lZWQgdG8gbWVudGlvbjoKPgo+IDEuIHRoZSBD
U1JfQ0FVU0UgcmVnIHJlYWRpbmcgYW5kIHNhdmluZyBpcyBtb3ZlZCB0byB0aGUgQyBjb2RlCj4g
YmVjYXVzZSB3ZSBuZWVkIHRoZSBjYXVzZSB0byBkaXNwYXRjaCB0aGUgZXhjZXB0aW9uIGhhbmRs
aW5nLAo+IGlmIHdlIGtlZXAgdGhlIGNhdXNlIHJlYWRpbmcgYW5kIHNhdmluZywgd2UgZWl0aGVy
IHBhc3MgaXQgdG8KPiBkb190cmFwcygpIHZpYS4gMm5kIHBhcmFtIG9yIGdldCBpdCBmcm9tIHB0
X3JlZ3Mgd2hpY2ggYW4gZXh0cmEKPiBtZW1vcnkgbG9hZCBpcyBuZWVkZWQsIEkgZG9uJ3QgbGlr
ZSBhbnkgb2YgdGhlIHR3byBzb2x1dGlvbnMgYmVjYXNlCj4gdGhlIGV4Y2VwdGlvbiBoYW5kbGlu
ZyBzaXRzIGluIGhvdCBjb2RlIHBhdGgsIGV2ZXJ5IGluc3RydWN0aW9uCj4gbWF0dGVycy4KPgo+
IDIuVG8gY29wZSB3aXRoIFNJRklWRV9DSVBfNDUzIGVycmF0YSwgaXQgbG9va3MgbGlrZSB3ZSBk
b24ndCBuZWVkCj4gYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIGFueSBtb3JlIGFmdGVyIHRoZSBhc20t
PmMgY29udmVydGlvbi4gSnVzdAo+IHJlcGxhY2UgdGhlIGV4Y3BfdmVjdF90YWJsZSB0d28gZW50
cmllcy4KPgo+Cj4KPiBBbnRvbiBCbGFuY2hhcmQgKDEpOgo+ICAgcmlzY3Y6IEltcHJvdmUgZXhj
ZXB0aW9uIGFuZCBzeXN0ZW0gY2FsbCBsYXRlbmN5Cj4KSSd2ZSByZXRlc3RlZCB0aGlzIHBhdGNo
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBhcHBsaWVkLiBJIGNhbiBjb25maXJtCnRoYXQg
dGhlIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGlzIHN0aWxsIHRoZXJlLiBEZWZpbml0ZWx5IHRo
dW1icyB1cCBvbiBteSBlbmQuCgo+IEppc2hlbmcgWmhhbmcgKDUpOgo+ICAgcmlzY3Y6IGF2b2lk
IGNvcnJ1cHRpbmcgdGhlIFJBUwo+ICAgcmlzY3Y6IGNvbnZlcnQgYm90dG9tIGhhbGYgb2YgZXhj
ZXB0aW9uIGhhbmRsaW5nIHRvIEMKPiAgIHJpc2N2OiBlcnJhdGE6IHJlbW92ZSBBTFRfSU5TTl9G
QVVMVCBhbmQgQUxUX1BBR0VfRkFVTFQKPiAgIHJpc2N2OiBlcnJhdGE6IHNpZml2ZTogcmVtb3Zl
IE5PTU1VIGhhbmRsaW5nCj4gICByaXNjdjogcmVtb3ZlIGFzbWxpbmthZ2UgZnJvbSB1cGRhdGVk
IGZ1bmN0aW9ucwo+Cj4gIGFyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyAgICAgICAg
IHwgMjUgKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhX2NpcF80
NTMuUyB8ICA0IC0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaCAg
IHwgIDcgKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCAgICAgIHwg
MjEgKystLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgICAg
fCA2MSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3Ry
YWNlLmMgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAg
ICAgICAgICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrLS0tCj4gIDcgZmlsZXMgY2hhbmdl
ZCwgODEgaW5zZXJ0aW9ucygrKSwgOTggZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMuMAo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
