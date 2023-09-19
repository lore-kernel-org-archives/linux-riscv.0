Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41053CD5BA3
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw83WnpX7P7CHWpmvpB+5H0J8TZeOxPGiOcKSRHIJ7I=; b=nnQpeXy+sEpO1N
	f6AuFNZ2qOoygNt9eY1SO5em0Y9kL9srJc2/nloRVf1EM0ylCVZl5dbSPwk8FwBrop2kaL3znZ6/E
	YntA9WX+6CCAI5Z22rOY+kgGwsJtxLvphM4LnHoVlPEURg0+kmXqf2mzmbpYmkV1XFspq9wEJ8oR7
	CjBia4IGjspf7YpWn1+lL+oRZirVV4nwOvn7AoS+bjMzdPA+0EFP2c//GQPzU0ZAUreyz3v6I3xUE
	jj3/3VxsEH0CulBKEGp11areUGxYYp+gu/PdDqTSEVwKg641HW4tQh1xJeqHI6NKjWt2KY60LI8CL
	d8Mkyjqw6QeL4mZVHhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZYj-000NDL-2z;
	Tue, 19 Sep 2023 12:10:29 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZYh-000NAu-0r
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 12:10:28 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-496a775af2fso938417e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695125422; x=1695730222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otH2l7DgYxaFQnjXnKhV0+9aJ0UN2k5pI6WFG4Jn/ls=;
        b=J6c5S7kt9gh2D6xnawYEfNdVttevsX92vev1cMGJgarL0yEZ/G/FElS4ZBloI7LKxP
         hFqSgZunsfkK1+vJH1+A/MgA3cr/1aC4K09Qx9XlokRMJndPiVr9coF7/pZmZ0JUDtHU
         upddtNLgT7lfmpQlvvVl9ZC1+jPE1hwl0UDRPqOCTfd9cVWlrHi1+UkFfe3QYEhVjtlY
         r4SHnDVp67wyYa3YjKGz/NAd53j/3Jj/IkCUVGi+iE95UpQRj5gc/uuMvJO0Dog12gPk
         PKBLQu5ra9SesL/K8tzDa/uKPXXVe/fOuTKHNnDzMAUknY55T3JUYbGzf+gpD3WhVFLl
         PHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125422; x=1695730222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otH2l7DgYxaFQnjXnKhV0+9aJ0UN2k5pI6WFG4Jn/ls=;
        b=nmfcsyqVJkKPXF7QLiJvmgeirjUalsLBfmyC5kJwbQ78RHgnvxnHOTZ2Xrq5AK32yF
         sQo2XWO5c/urIZX2qI+NPZNXbz8rpj25Grk7Ddj6Rj2Wrz1uRbwsr9xRPIzaGOIA53+s
         Tc55inHlupnFzk8aea4kpXVVS9qyu0bGNyHrXvN5i42Wenm9YwOe0d2J0ipuhE8VGy4e
         XYiS1meVn6LkEMmHn1fEkamyd/PbJ+XdNTTuJgtjvo+r7ZXeMMKGp8DnamF8/vkYRH/Q
         MIeN8QLwV6lIjf0d+p1DHxLFAnGFudG7dzqFIUJ+X9H6ME9SAR915V1Da+2FWeRXehA8
         2oxg==
X-Gm-Message-State: AOJu0YxK9K3IQaNeEChEDiZBlggQZuJKhvqQATGWgRCH1d06XrcISWyJ
	EyYaoV8p5yED+/JhS3yES0gQ5By2yp38ir6s6t4=
X-Google-Smtp-Source: AGHT+IFUoRUYdeh3aal3s8ZGxXglp4Zw/7X1D+5aoErFjGOGnaS1NN/Gz7027xrOyGCLYjU43a35Fj6he61azzqvzWY=
X-Received: by 2002:a1f:c942:0:b0:496:248e:43fc with SMTP id
 z63-20020a1fc942000000b00496248e43fcmr8950298vkf.8.1695125422241; Tue, 19 Sep
 2023 05:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com> <20230911131224.61924-5-alexghiti@rivosinc.com>
In-Reply-To: <20230911131224.61924-5-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Sep 2023 13:09:56 +0100
Message-ID: <CA+V-a8tJUry9G=k-TgPTEFdVJKhhLzfhFO-MSNRRWDb5L3pdHg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] riscv: Improve flush_tlb_kernel_range()
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
X-CRM114-CacheID: sfid-20230919_051027_303067_22D5C012 
X-CRM114-Status: GOOD (  27.76  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMjoxNuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGZ1bmN0aW9uIHVzZWQgdG8gc2ltcGx5
IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBtb3JlCj4gc3VidGlsZSBhbmQg
dHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdlLgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBj
YW4gb25seSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4gdGhl
IHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1bmN0aW9uIHdp
bGwgYmUgaW1wcm92ZWQKPiBvbmx5IGlmIHRoZSBzaXplIG9mIHRoZSByZWdpb24gdG8gZmx1c2gg
aXMgPCB0aHJlc2hvbGQgKiBQQUdFX1NJWkUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGxiZmx1c2guaCB8IDExICsrKysrKy0tLS0tCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPgpUZXN0ZWQtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4g
IwpPbiBSWi9GaXZlIFNNQVJDCgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oCj4gaW5kZXggMTcwYTQ5YzUzMWM2Li44ZjM0MThjNWYxNzIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTQwLDYgKzQwLDcgQEAgdm9pZCBmbHVzaF90bGJf
bW1fcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gIHZv
aWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxv
bmcgYWRkcik7Cj4gIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgZW5kKTsKPiArdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKPiAgI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9I
VUdFUEFHRQo+ICAjZGVmaW5lIF9fSEFWRV9BUkNIX0ZMVVNIX1BNRF9UTEJfUkFOR0UKPiAgdm9p
ZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIHN0YXJ0LAo+IEBAIC01NiwxNSArNTcsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIGZs
dXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgICAgICAgIGxvY2Fs
X2ZsdXNoX3RsYl9hbGwoKTsKPiAgfQo+Cj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVz
aF90bGJfYWxsKCkKPiAtI2RlZmluZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQs
IHBhZ2Vfc2l6ZSkgZmx1c2hfdGxiX2FsbCgpCj4gLSNlbmRpZiAvKiAhQ09ORklHX1NNUCB8fCAh
Q09ORklHX01NVSAqLwo+IC0KPiAgLyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8K
PiAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9u
ZyBzdGFydCwKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICB7Cj4gLSAgICAgICBmbHVz
aF90bGJfYWxsKCk7Cj4gKyAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gIH0KPgo+ICsj
ZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkgZmx1c2hfdGxiX2FsbCgpCj4gKyNkZWZpbmUgZmx1c2hf
dGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5kLCBwYWdlX3NpemUpIGZsdXNoX3RsYl9hbGwoKQo+
ICsjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPiArCj4gICNlbmRpZiAv
KiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90
bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggMmMxMTM2ZDczNDEx
Li4yOGNkODUzOWI1NzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
KysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTk3LDE5ICs5NywyNyBAQCBzdGF0
aWMgdm9pZCBfX2ZsdXNoX3RsYl9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQg
bG9uZyBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHNpemUsIHVuc2lnbmVkIGxvbmcgc3RyaWRlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZmx1c2hf
dGxiX3JhbmdlX2RhdGEgZnRkOwo+IC0gICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNrID0gbW1f
Y3B1bWFzayhtbSk7Cj4gKyAgICAgICBzdHJ1Y3QgY3B1bWFzayAqY21hc2ssIGZ1bGxfY21hc2s7
Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBGTFVTSF9UTEJfTk9fQVNJRDsKPiAtICAg
ICAgIHVuc2lnbmVkIGludCBjcHVpZDsKPiAgICAgICAgIGJvb2wgYnJvYWRjYXN0Owo+Cj4gLSAg
ICAgICBpZiAoY3B1bWFza19lbXB0eShjbWFzaykpCj4gLSAgICAgICAgICAgICAgIHJldHVybjsK
PiArICAgICAgIGlmIChtbSkgewo+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1aWQ7
Cj4gKwo+ICsgICAgICAgICAgICAgICBjbWFzayA9IG1tX2NwdW1hc2sobW0pOwo+ICsgICAgICAg
ICAgICAgICBpZiAoY3B1bWFza19lbXB0eShjbWFzaykpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuOwo+Cj4gLSAgICAgICBjcHVpZCA9IGdldF9jcHUoKTsKPiAtICAgICAgIC8qIGNo
ZWNrIGlmIHRoZSB0bGJmbHVzaCBuZWVkcyB0byBiZSBzZW50IHRvIG90aGVyIENQVXMgKi8KPiAt
ICAgICAgIGJyb2FkY2FzdCA9IGNwdW1hc2tfYW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1
X2lkczsKPiArICAgICAgICAgICAgICAgY3B1aWQgPSBnZXRfY3B1KCk7Cj4gKyAgICAgICAgICAg
ICAgIC8qIGNoZWNrIGlmIHRoZSB0bGJmbHVzaCBuZWVkcyB0byBiZSBzZW50IHRvIG90aGVyIENQ
VXMgKi8KPiArICAgICAgICAgICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlfYnV0KGNtYXNr
LCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAg
ICAgY3B1bWFza19zZXRhbGwoJmZ1bGxfY21hc2spOwo+ICsgICAgICAgICAgICAgICBjbWFzayA9
ICZmdWxsX2NtYXNrOwo+ICsgICAgICAgICAgICAgICBicm9hZGNhc3QgPSB0cnVlOwo+ICsgICAg
ICAgfQo+Cj4gLSAgICAgICBpZiAoc3RhdGljX2JyYW5jaF91bmxpa2VseSgmdXNlX2FzaWRfYWxs
b2NhdG9yKSkKPiArICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9h
bGxvY2F0b3IpICYmIG1tKQo+ICAgICAgICAgICAgICAgICBhc2lkID0gYXRvbWljX2xvbmdfcmVh
ZCgmbW0tPmNvbnRleHQuaWQpICYgYXNpZF9tYXNrOwo+Cj4gICAgICAgICBpZiAoYnJvYWRjYXN0
KSB7Cj4gQEAgLTEyOCw3ICsxMzYsOCBAQCBzdGF0aWMgdm9pZCBfX2ZsdXNoX3RsYl9yYW5nZShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgICAgICAg
ICAgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3RhcnQsIHNpemUsIHN0cmlkZSwgYXNpZCk7
Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHB1dF9jcHUoKTsKPiArICAgICAgIGlmIChtbSkKPiAr
ICAgICAgICAgICAgICAgcHV0X2NwdSgpOwo+ICB9Cj4KPiAgdm9pZCBmbHVzaF90bGJfbW0oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCj4gQEAgLTE4OSw2ICsxOTgsMTIgQEAgdm9pZCBmbHVzaF90bGJf
cmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4K
PiAgICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKHZtYS0+dm1fbW0sIHN0YXJ0LCBlbmQgLSBzdGFy
dCwgc3RyaWRlX3NpemUpOwo+ICB9Cj4gKwo+ICt2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gK3sKPiArICAgICAgIF9f
Zmx1c2hfdGxiX3JhbmdlKE5VTEwsIHN0YXJ0LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpFKTsKPiAr
fQo+ICsKPiAgI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+ICB2b2lkIGZsdXNo
X3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcg
c3RhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gLS0K
PiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
