Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE08CD5BA0
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w/v0PHAWIeoRhTRqho/H3Ddhq+vbK0/3LmMMwaknDQ=; b=N/eLHnWf4rNnw6
	RxneX2yB3mhG7ea5WGL7HY+hB9cSVsm0GmgtoE5H6/aKDJDbkiylWWbECWgXB1Y/97ztSWqhehaEa
	nP7u5wl7Jmw4w1rmdp89JA80ReLBZU/MKoezPZxU4im7PPeJoo3F7tI2y7gFsUFRZgtQiwyY62atK
	UBmCSB8ug4iFYc+Mga2FM1txacwmX1sP6gRsGHUfA1UsUuVXfbiepsmmNlwNPCPex6/e4LLTB35UZ
	2CHoLm/bHem6Th9lpgbZmfglrYU/0sK7uayVgUIriYUkWCogNuJffugjHnQZmUEfbxUD0PouryLqE
	94wEKIsFgs/DLWEz7hBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZW2-000MYR-28;
	Tue, 19 Sep 2023 12:07:42 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZW0-000MXd-1u
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 12:07:42 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7a803afa8c5so1930988241.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695125259; x=1695730059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJltkCrkvXnqlCGBVJnlNJKBiks9lWDJ9wT58GRKfUo=;
        b=ls56RpJ/ARyr/c0aias/23F2moAcN6JtJxZu6JPpl/0NfxBpB13MUY4qcuEck9lCyz
         WyeLy8uUWk2zqs7YKu+ch8EyzAhGNWFJUHgzb7nD9Waii4ISAjDs01lYv4eGXVdrHu+g
         tHKzu2GY7aP4tHsaaNJaSV4kUkZmtySmdI6TboiqMuEvGr6eG8PCFVSmfeC1gUNsKkoh
         Id2/X7v2BOUNBkYjqlZs5+9MAo64hO8ZUqEUf2ZKthKNEVz5PeqZhIi2sKoasrqB7jLV
         /sQIrnRnjpSVDP/9lasZ2+VchXM+j/o27OfK7Ni9tm11NRNwLKVsNQqRwdtSYgc6Aot/
         pk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125259; x=1695730059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJltkCrkvXnqlCGBVJnlNJKBiks9lWDJ9wT58GRKfUo=;
        b=G3PYQ58pgM2PWGBwiFZKzI6d/RQVGuD5C9BgjU80l844huYCEmOb0U9NDYbhBuaSoI
         KnWWX2H4S1mhk6/IuukIigtuLokWbtNIKwpMLUQvYZS1QA+QcHPzDER9Z+++1fTQXKwt
         ZKdqZqoEyqTNDOKoRb/bC2bJnpJnfjNb6IXeCLxR6Gv+tvbE26yPpJKbkYELTKUa3yDV
         U42BFfctlj3i0IRqAsR1pok9QDTLk30SmkzBps2SeKv7SJj20yLs1RqhA5o0yUwey2nl
         ILdva0UzbLSQVp+W/DsGq2iyd2FQglD9vnRnukLBigTcDwx5Xw8LtY6C925Y25FCyPPy
         OQSg==
X-Gm-Message-State: AOJu0YwKBFjwzsi7iwzZOv52qghvLfnzKMm0AzUgAJm+XZsnxwmunxfe
	zr1DQ8nuVOT/axCb2MeG0ne4N6Uw/JFBUBxMgQo=
X-Google-Smtp-Source: AGHT+IFafZT6XJJv7X6AlrUpzvAuX5vIPbFV8GFxqI1svCGaqZLPKRCktqSUX/D6r+7xZdGTMbeSMlelrM5gI479ej8=
X-Received: by 2002:a1f:e741:0:b0:495:f061:f2c7 with SMTP id
 e62-20020a1fe741000000b00495f061f2c7mr9571105vkh.3.1695125258959; Tue, 19 Sep
 2023 05:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com> <20230911131224.61924-2-alexghiti@rivosinc.com>
In-Reply-To: <20230911131224.61924-2-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Sep 2023 13:07:12 +0100
Message-ID: <CA+V-a8tb8=nLz4vazd=B_zibkbk0kpqymCTmKMTabK1LT=pumQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] riscv: Improve flush_tlb()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_050740_648131_6C82B8BE 
X-CRM114-Status: GOOD (  19.82  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMjoxM+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGb3Igbm93LCBmbHVzaF90bGIoKSBzaW1wbHkg
Y2FsbHMgZmx1c2hfdGxiX21tKCkgd2hpY2ggcmVzdWx0cyBpbiBhCj4gZmx1c2ggb2YgdGhlIHdo
b2xlIFRMQi4gU28gbGV0J3MgdXNlIG1tdV9nYXRoZXIgZmllbGRzIHRvIHByb3ZpZGUgYSBtb3Jl
Cj4gZmluZS1ncmFpbmVkIGZsdXNoIG9mIHRoZSBUTEIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGxiLmggICAgICB8IDggKysrKysrKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oIHwgMyArKysKPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAg
IHwgNyArKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ClRlc3RlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPiAjCk9uIFJaL0ZpdmUgU01BUkMKCkNoZWVycywKUHJhYmhha2Fy
Cgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYi5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGIuaAo+IGluZGV4IDEyMGJjZjJlZDhhOC4uMWViNTY4MmIyYWY2IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RsYi5oCj4gQEAgLTE1LDcgKzE1LDEzIEBAIHN0YXRpYyB2b2lkIHRs
Yl9mbHVzaChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiKTsKPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQg
dGxiX2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpCj4gIHsKPiAtICAgICAgIGZsdXNoX3Rs
Yl9tbSh0bGItPm1tKTsKPiArI2lmZGVmIENPTkZJR19NTVUKPiArICAgICAgIGlmICh0bGItPmZ1
bGxtbSB8fCB0bGItPm5lZWRfZmx1c2hfYWxsKQo+ICsgICAgICAgICAgICAgICBmbHVzaF90bGJf
bW0odGxiLT5tbSk7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGZsdXNoX3RsYl9t
bV9yYW5nZSh0bGItPm1tLCB0bGItPnN0YXJ0LCB0bGItPmVuZCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRsYl9nZXRfdW5tYXBfc2l6ZSh0bGIpKTsKPiArI2VuZGlmCj4g
IH0KPgo+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Rs
YmZsdXNoLmgKPiBpbmRleCBhMDkxOTZmOGRlNjguLmY1YzRmYjBhZTY0MiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiBAQCAtMzIsNiArMzIsOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2UodW5zaWduZWQgbG9uZyBhZGRyKQo+ICAjaWYgZGVmaW5l
ZChDT05GSUdfU01QKSAmJiBkZWZpbmVkKENPTkZJR19NTVUpCj4gIHZvaWQgZmx1c2hfdGxiX2Fs
bCh2b2lkKTsKPiAgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+ICt2
b2lkIGZsdXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyBzdGFydCwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCwgdW5z
aWduZWQgaW50IHBhZ2Vfc2l6ZSk7Cj4gIHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4gIHZvaWQgZmx1c2hfdGxiX3Jh
bmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKTsKPiBAQCAtNTIsNiArNTQsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+ICB9Cj4KPiAgI2RlZmluZSBmbHVzaF90bGJfbW0obW0pIGZsdXNoX3RsYl9hbGwo
KQo+ICsjZGVmaW5lIGZsdXNoX3RsYl9tbV9yYW5nZShtbSwgc3RhcnQsIGVuZCwgcGFnZV9zaXpl
KSBmbHVzaF90bGJfYWxsKCkKPiAgI2VuZGlmIC8qICFDT05GSUdfU01QIHx8ICFDT05GSUdfTU1V
ICovCj4KPiAgLyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
aW5kZXggNzdiZTU5YWFkYzczLi5mYTAzMjg5ODUzZDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTEz
Miw2ICsxMzIsMTMgQEAgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4g
ICAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShtbSwgMCwgLTEsIFBBR0VfU0laRSk7Cj4gIH0KPgo+
ICt2b2lkIGZsdXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwK
PiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9zaXplKQo+ICt7Cj4g
KyAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShtbSwgc3RhcnQsIGVuZCAtIHN0YXJ0LCBwYWdlX3Np
emUpOwo+ICt9Cj4gKwo+ICB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gIHsKPiAgICAgICAgIF9fZmx1c2hfdGxiX3Jh
bmdlKHZtYS0+dm1fbW0sIGFkZHIsIFBBR0VfU0laRSwgUEFHRV9TSVpFKTsKPiAtLQo+IDIuMzku
Mgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
