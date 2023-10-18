Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E73CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB+edmnQ48p5e3/m+xSH7WBbU0LLWM+Y/5jQF9EhJjk=; b=0XX663O62dEZNr
	sgFS6BSqOdpsvHXYGjVN/wzgBmD5o+XWuJPHcbj5Me7LW+NsRjAwzo+xQOUFpIo56whzOEk8FlnIn
	yqrY5pHTivV8EaAWv12la+ia4xrVcoVAsCHx1BWNlnPshJOW+SLNjIf8ce6CNJftA7RiDFKRS4CNN
	SFS63eavpoDuhutwlRSfTLJliEVcN2dj7zwHf8zZheja+l1bk06WWti0ZeBkz8c7AH++2NvWu5fIp
	8m7ddTCOW1hiWTuH+1IyB6dgapVNhCTfeG4HsgtxZo4zkIV2+dJd9wuynfjjrk41b6ZVD+DyWjf5b
	v0fDzLQ/0KpVZ/c/GAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4hJ-00EXpJ-0G;
	Wed, 18 Oct 2023 11:26:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4hF-00EXo2-2M
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:26:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40566f8a093so63141005e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697628396; x=1698233196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo7B+cdiTA7QkXzogWs+Pqnw9GSLWygwDRl43SgG4dc=;
        b=1wLhNhEuoA23g4M+JyNVWIKXK8FNkmGm3Pei9UpHi0xRoC8SHmoWm8LLiMhQoTHsJ1
         QqPhuAbuxtfc7iWyCkT5whH14KWgs+rjeoYYz46C/bGdiTl01Gbs4nhI8TkluOlarf25
         XCVYQUdx2qElATM07CSAoJ3AzcQ8uvsEJdFEHU4O18wB6f534e8lrbCr9AKYWdryTcyS
         /UlwDKLlinmTDFgFTIamrVVHF32i0YzDCX6nMMxoyUXHeBsjgJAQaMhtBTzxRBBXaAqV
         qw96EWU5QhtV1z4XR91XBa4L8hBEz6BCwEGhgOnKw04jn6AqZA1EDGNY8JoxyOzfpVeR
         yuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628396; x=1698233196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fo7B+cdiTA7QkXzogWs+Pqnw9GSLWygwDRl43SgG4dc=;
        b=ayrvWI6P3e4wHLUZXRUqIlXsJwZI9E7uQYw0qSrC5Md6c/O4/vKzzaH6DWDz05cmQ6
         2RmO96g5t13njbFnmLjZZK1yUz1tBLv43Tj1XJ3FhpyXGPecSSwIg3vhS+0YU3M6xvip
         R9d7frUs6wL88Z2Mr10l2NTD5p/DiqolmwP4VqdtbS0ISO0TAgB+5PJx4QP24/8891Gt
         ZjZd68E+ykT4LDjfmqhELrNmyvVqwZ+haIt7q1wW/GqTSQEDGFK1/2i/c1Fx3HzMEoJ6
         dyyQzjC2wmRvJt36d96WWeOVSq7fPov/iDzBycOoU9htfF6hzrUjvLbHtZ29k+pIVMmE
         +kzQ==
X-Gm-Message-State: AOJu0YwTu5Uxlopw3fBr6yB5LpJMZpmlctRhf4sZIyJibZp4QMM0mCYG
	HsPXSCtlX85fGNqxM3OZrY1d3yUDkWOw+NoAB2RwSw==
X-Google-Smtp-Source: AGHT+IEGTdYVt+EPdhZK2SJoJGQwAAt5GzCSXuLlL/UEP8u+GheBaAJrwgwf37URmrStLQQQxRBRAHFjOKB/q7DtxmM=
X-Received: by 2002:a5d:58da:0:b0:32d:b051:9a2b with SMTP id
 o26-20020a5d58da000000b0032db0519a2bmr4179536wrf.2.1697628396063; Wed, 18 Oct
 2023 04:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
 <20230911131224.61924-2-alexghiti@rivosinc.com> <2047b2c2-bf37-4c02-9297-d89f95863ed5@sifive.com>
In-Reply-To: <2047b2c2-bf37-4c02-9297-d89f95863ed5@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 18 Oct 2023 13:26:25 +0200
Message-ID: <CAHVXubiM=JPRZXjsdK1JTGBbywxT_tYRNminZw8ZLo=jAj8N+w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] riscv: Improve flush_tlb()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Lad Prabhakar <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_042641_769132_AF7ACC88 
X-CRM114-Status: GOOD (  20.83  )
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

SGkgU2FtdWVsLAoKT24gTW9uLCBPY3QgOSwgMjAyMyBhdCA3OjUz4oCvUE0gU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy0wOS0xMSA4
OjEyIEFNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBGb3Igbm93LCBmbHVzaF90bGIoKSBz
aW1wbHkgY2FsbHMgZmx1c2hfdGxiX21tKCkgd2hpY2ggcmVzdWx0cyBpbiBhCj4KPiBzL2ZsdXNo
X3RsYi90bGJfZmx1c2gvIGhlcmUgYW5kIGluIHRoZSBzdWJqZWN0Lgo+Cj4gT3RoZXJ3aXNlOgo+
IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4K
CkFoYWggZ29vZCBjYXRjaCwgdGhhbmtzIGZvciB0aGF0IGFuZCB0aGUgUkIhCgpBbGV4Cgo+Cj4g
PiBmbHVzaCBvZiB0aGUgd2hvbGUgVExCLiBTbyBsZXQncyB1c2UgbW11X2dhdGhlciBmaWVsZHMg
dG8gcHJvdmlkZSBhIG1vcmUKPiA+IGZpbmUtZ3JhaW5lZCBmbHVzaCBvZiB0aGUgVExCLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29t
Pgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGIuaCAgICAgIHwgOCArKysr
KysrLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDMgKysrCj4gPiAg
YXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgNyArKysrKysrCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3RsYi5oCj4gPiBpbmRleCAxMjBiY2YyZWQ4YTguLjFlYjU2ODJiMmFmNiAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGxiLmgKPiA+IEBAIC0xNSw3ICsxNSwxMyBAQCBzdGF0aWMgdm9pZCB0bGJf
Zmx1c2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYik7Cj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgdm9p
ZCB0bGJfZmx1c2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYikKPiA+ICB7Cj4gPiAtICAgICBmbHVz
aF90bGJfbW0odGxiLT5tbSk7Cj4gPiArI2lmZGVmIENPTkZJR19NTVUKPiA+ICsgICAgIGlmICh0
bGItPmZ1bGxtbSB8fCB0bGItPm5lZWRfZmx1c2hfYWxsKQo+ID4gKyAgICAgICAgICAgICBmbHVz
aF90bGJfbW0odGxiLT5tbSk7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIGZsdXNo
X3RsYl9tbV9yYW5nZSh0bGItPm1tLCB0bGItPnN0YXJ0LCB0bGItPmVuZCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRsYl9nZXRfdW5tYXBfc2l6ZSh0bGIpKTsKPiA+ICsj
ZW5kaWYKPiA+ICB9Cj4gPgo+ID4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQl9IICovCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBpbmRleCBhMDkxOTZmOGRlNjguLmY1YzRmYjBh
ZTY0MiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+
ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBAQCAtMzIsNiAr
MzIsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2UodW5zaWduZWQg
bG9uZyBhZGRyKQo+ID4gICNpZiBkZWZpbmVkKENPTkZJR19TTVApICYmIGRlZmluZWQoQ09ORklH
X01NVSkKPiA+ICB2b2lkIGZsdXNoX3RsYl9hbGwodm9pZCk7Cj4gPiAgdm9pZCBmbHVzaF90bGJf
bW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+ID4gK3ZvaWQgZmx1c2hfdGxiX21tX3JhbmdlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgcGFnZV9zaXplKTsKPiA+
ICB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIGFkZHIpOwo+ID4gIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZW5kKTsKPiA+IEBAIC01Miw2ICs1NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAgfQo+ID4K
PiA+ICAjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkgZmx1c2hfdGxiX2FsbCgpCj4gPiArI2RlZmlu
ZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1c2hfdGxi
X2FsbCgpCj4gPiAgI2VuZGlmIC8qICFDT05GSUdfU01QIHx8ICFDT05GSUdfTU1VICovCj4gPgo+
ID4gIC8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2VybmVsIHBhZ2VzICovCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBp
bmRleCA3N2JlNTlhYWRjNzMuLmZhMDMyODk4NTNkOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBA
QCAtMTMyLDYgKzEzMiwxMyBAQCB2b2lkIGZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkKPiA+ICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKG1tLCAwLCAtMSwgUEFHRV9TSVpFKTsKPiA+
ICB9Cj4gPgo+ID4gK3ZvaWQgZmx1c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGxvbmcgZW5kLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX3Np
emUpCj4gPiArewo+ID4gKyAgICAgX19mbHVzaF90bGJfcmFuZ2UobW0sIHN0YXJ0LCBlbmQgLSBz
dGFydCwgcGFnZV9zaXplKTsKPiA+ICt9Cj4gPiArCj4gPiAgdm9pZCBmbHVzaF90bGJfcGFnZShz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gIHsKPiA+
ICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKHZtYS0+dm1fbW0sIGFkZHIsIFBBR0VfU0laRSwgUEFH
RV9TSVpFKTsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
