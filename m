Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A03C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 00:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAWc/EHed6kHYXBeMbFtkozhXHO/7Ss2eztfB35k8sA=; b=UOvaYPzEcniE6q
	HC2HkvezIhQn13BBUu12OoTE4KaxLV3Yq+Y9MrWYPV1KmU5wApKqBm1C74bfR6fZi/GOVHJnISnYO
	2KCBBpbplB1IQp8ugT8uM+eLYGfJ/NMqf0Z+Z79GDeM8+dZiFf7hf9fzaRsgCQFOQzdNd38Dx1EvE
	ogzL9LBXIfvXuAREkBsTNOBBfIpplD1M842HOhM8yoPX4USPejMRZr8PgE9FBHSIe5zZkX50fFmJY
	wuVnVDAhW3fM5QY7ydD0GypH7fanVVYBF/SCp9P4Xp1jeoTFlFu0fb5cBCjzOF76aLPC5YJlDOXPD
	RbD+5yg8q956Y6nGvg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjq7c-00000003hWV-0rIL;
	Tue, 12 Mar 2024 00:36:01 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjq7W-00000003hVJ-1yhT
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 00:35:56 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-42f2a4f77a6so18401571cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 17:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710203752; x=1710808552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JTBtDRaEpoCIigQxhZrQrfkOxHxP/G0rOetjigew6g=;
        b=H1qoDRs/4cTmDCVtF0kDGUk0q4iXKaCGM49+yqEmp6oGB5Jt7eX9SX2tHe+ZgYaWfB
         uGdRBmY/S6E5MnS/bpKKPNvfOuvdjJKEcD5Zkh0uSb6IF2q1QnIvAE4cc2ggqzhHFzZC
         MXhMXczprLrwVYiJrSHJiXGHCnAnzYZzql0z1obcB5JNiSQbCHP4r/18YxH5Gr3jzx3e
         kaxr4GGT6se+uaFvYO/viWgHvJy+v+kJwXTqDB6SYgf3AUfJ9D/Rzn9W6j2dJvvYv1qW
         D2BKhU9rPuQu63MTB6Ivlw5LdlPqIwW3QJXqyUQhpVGi+Y1waM5fL4U8HFIuLO4VKym7
         jtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710203752; x=1710808552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JTBtDRaEpoCIigQxhZrQrfkOxHxP/G0rOetjigew6g=;
        b=bnJrepFGuXMtflgGPluUbYsP+ewGZbfTffFwIyIIxUlAC1WuZhm+3PRuxkYO1fhW/Y
         H8lNlhGRFBrQmAahdgTvsFCVN0y/GiH6wynRF5SIBT8lPOBc6G3cKU34seGlz6OXet14
         RMGFXXVRKs7q77voIEpdJeYvX+RUuU/TyYxi4ZRUWQ1ZDb0rDR/EiLPbkl4dHphxi1tL
         SJPK4LDNY+EUlrld6RemuKKlORxduA5ap1pydUEAAr2zx65CTntRM9rqKzPG9eDj5w7l
         rPiHBIUeWA/y9TLi0T7r1AD30Tq3RvFfsQtRhisxmkmcpFzxWRHue/Wyq8ilvQsKyjMo
         vd+A==
X-Forwarded-Encrypted: i=1; AJvYcCVGOppv24i0OgQZW/9SaYxYfXbH7gD9YoZE2b8fDa5hbiaU8Hu4sJGSbtP7J6ujp4JZKyMj+3Gw7f1QL34vbZGwnyBNa0qBy02OXLNrAW5E
X-Gm-Message-State: AOJu0YxLxbhXFZtq11KtgOy9t9D6ZdsSewyzwFBGG3hWIskE/SDMP34m
	8bzuJa9HaNTHT7oujA3AuVgm2UABr/Gr2oztJpMFBFHNGnjV9J8DqKw13LouJ+4cM66dK+y2BER
	P
X-Google-Smtp-Source: AGHT+IEf0OlYbf0aVPGX+KApg4PvxZ0cB3JvU5qic6wZx79zx+tbwWq5OvM38n+dAE1aOcxr4lfC8A==
X-Received: by 2002:a05:622a:3cd:b0:42e:fcf5:b0a0 with SMTP id k13-20020a05622a03cd00b0042efcf5b0a0mr589449qtx.66.1710203752404;
        Mon, 11 Mar 2024 17:35:52 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id o9-20020ac84289000000b0042c78553d1dsm3211862qtl.28.2024.03.11.17.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:35:51 -0700 (PDT)
Message-ID: <100d5414-11fa-4c47-9c35-51f5fad2d6e6@sifive.com>
Date: Mon, 11 Mar 2024 19:35:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v5 08/13] riscv: Avoid TLB flush loops when
 affected by SiFive CIP-1200
Content-Language: en-US
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
 <20240229232211.161961-9-samuel.holland@sifive.com>
 <CAEEQ3w=8dVxO=qtW6_-SChLJ5No+7nGgf+1fXz0wSeBhb0Kk0A@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAEEQ3w=8dVxO=qtW6_-SChLJ5No+7nGgf+1fXz0wSeBhb0Kk0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_173554_593881_BDB52417 
X-CRM114-Status: GOOD (  26.22  )
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

SGkgWXVuaHVpLAoKT24gMjAyNC0wMi0yOSA4OjQ4IFBNLCB5dW5odWkgY3VpIHdyb3RlOgo+IEhp
IFNhbXVlbCwKPiAKPiBPbiBGcmksIE1hciAxLCAyMDI0IGF0IDc6MjLigK9BTSBTYW11ZWwgSG9s
bGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IFNpbmNlIGltcGxl
bWVudGF0aW9ucyBhZmZlY3RlZCBieSBTaUZpdmUgZXJyYXRhIENJUC0xMjAwIGFsd2F5cyB1c2Ug
dGhlCj4+IGdsb2JhbCB2YXJpYW50IG9mIHRoZSBzZmVuY2Uudm1hIGluc3RydWN0aW9uLCB0aGV5
IG9ubHkgbmVlZCB0byBleGVjdXRlCj4+IHRoZSBpbnN0cnVjdGlvbiBvbmNlLiBUaGUgcmFuZ2Ut
YmFzZWQgbG9vcCBvbmx5IGh1cnRzIHBlcmZvcm1hbmNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+IChu
byBjaGFuZ2VzIHNpbmNlIHY0KQo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAgLSBPbmx5IHNldCB0
bGJfZmx1c2hfYWxsX3RocmVzaG9sZCB3aGVuIENPTkZJR19NTVU9eS4KPj4KPj4gQ2hhbmdlcyBp
biB2MzoKPj4gIC0gTmV3IHBhdGNoIGZvciB2Mwo+Pgo+PiAgYXJjaC9yaXNjdi9lcnJhdGEvc2lm
aXZlL2VycmF0YS5jIHwgNSArKysrKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVz
aC5oIHwgMiArKwo+PiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMiArLQo+
PiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyBiL2FyY2gvcmlz
Y3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+PiBpbmRleCAzZDlhMzJkNzkxZjcuLjcxNmNmZWRh
ZDNhMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YS5jCj4+
ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+PiBAQCAtNDIsNiArNDIs
MTEgQEAgc3RhdGljIGJvb2wgZXJyYXRhX2NpcF8xMjAwX2NoZWNrX2Z1bmModW5zaWduZWQgbG9u
ZyAgYXJjaF9pZCwgdW5zaWduZWQgbG9uZyBpbXAKPj4gICAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPj4gICAgICAgICBpZiAoKGltcGlkICYgMHhmZmZmZmYpID4gMHgyMDA2MzAgfHwgaW1w
aWQgPT0gMHgxMjAwNjI2KQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiArCj4+
ICsjaWZkZWYgQ09ORklHX01NVQo+PiArICAgICAgIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkID0g
MDsKPj4gKyNlbmRpZgo+PiArCj4+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4+ICB9Cj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPj4gaW5kZXggNDYzYjYxNWQ3NzI4Li44ZTMyOTcyMTM3
NWIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+PiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPj4gQEAgLTY2LDYgKzY2LDgg
QEAgdm9pZCBhcmNoX3RsYmJhdGNoX2FkZF9wZW5kaW5nKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3Vu
bWFwX2JhdGNoICpiYXRjaCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgdWFkZHIpOwo+PiAgdm9pZCBhcmNoX2ZsdXNoX3RsYl9iYXRjaGVkX3BlbmRpbmco
c3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+PiAgdm9pZCBhcmNoX3RsYmJhdGNoX2ZsdXNoKHN0cnVj
dCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCk7Cj4+ICsKPj4gK2V4dGVybiB1bnNp
Z25lZCBsb25nIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkOwo+PiAgI2Vsc2UgLyogQ09ORklHX01N
VSAqLwo+PiAgI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAgICAgICBk
byB7IH0gd2hpbGUgKDApCj4+ICAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+
IGluZGV4IDM2NWUwYTBlNDcyNS4uMjI4NzBmMjEzMTg4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L21tL3RsYmZsdXNoLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+IEBA
IC0xMSw3ICsxMSw3IEBACj4+ICAgKiBGbHVzaCBlbnRpcmUgVExCIGlmIG51bWJlciBvZiBlbnRy
aWVzIHRvIGJlIGZsdXNoZWQgaXMgZ3JlYXRlcgo+PiAgICogdGhhbiB0aGUgdGhyZXNob2xkIGJl
bG93Lgo+PiAgICovCj4+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyB0bGJfZmx1c2hfYWxsX3RocmVz
aG9sZCBfX3JlYWRfbW9zdGx5ID0gNjQ7Cj4+ICt1bnNpZ25lZCBsb25nIHRsYl9mbHVzaF9hbGxf
dGhyZXNob2xkIF9fcmVhZF9tb3N0bHkgPSA2NDsKPj4KPj4gIHN0YXRpYyB2b2lkIGxvY2FsX2Zs
dXNoX3RsYl9yYW5nZV90aHJlc2hvbGRfYXNpZCh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBzaXplLAo+PiAtLQo+PiAyLjQzLjEKPj4KPiAKPiBJZiBsb2NhbF9mbHVzaF90bGJfYWxsX2Fz
aWQoKSBpcyB1c2VkIGV2ZXJ5IHRpbWUsIG1vcmUgUFRXcyB3aWxsIGJlCj4gZ2VuZXJhdGVkLiBX
aWxsIHN1Y2ggbW9kaWZpY2F0aW9ucyBkZWZpbml0ZWx5IGltcHJvdmUgdGhlIG92ZXJhbGwKPiBw
ZXJmb3JtYW5jZT8KClRoaXMgY2hhbmdlIGluIHRoaXMgY29tbWl0IHNwZWNpZmljYWxseSBhcHBs
aWVzIHRvIG9sZGVyIFNpRml2ZSBTb0NzIHdpdGggYSBidWcKbWFraW5nIHNpbmdsZS1wYWdlIHNm
ZW5jZS52bWEgaW5zdHJ1Y3Rpb25zIHVuc2FmZSB0byB1c2UuIEluIHRoaXMgY2FzZSwgYSBzaW5n
bGUKY2FsbCB0byBsb2NhbF9mbHVzaF90bGJfYWxsX2FzaWQoKSBpcyBvcHRpbWFsLCB5ZXMuCgo+
IEhpIEFsZXgsIFNhbXVlbCwKPiBUaGUgcmVsYXRpb25zaGlwIGJldHdlZW4gZmx1c2hfeHhfcmFu
Z2VfYXNpZCgpIGFuZCBucl9wdGVzIGlzCj4gYmFzaWNhbGx5IGxpbmVhciBncm93dGggKHk9a3gg
K2IpLCB3aGlsZSBmbHVzaF9hbGxfYXNpZCgpIGhhcyBub3RoaW5nCj4gdG8gZG8gd2l0aCBucl9w
dGVzICh5PWMpLgo+IFNvbWUgVExCcyBtYXkgZG8gc29tZSBvcHRpbWl6YXRpb24uIFRoZSBvcGVy
YXRpb24gb2YgZmx1c2ggYWxsIGl0c2VsZgo+IHJlcXVpcmVzIHZlcnkgZmV3IGN5Y2xlcywgYnV0
IHRoZXJlIGlzIGEgY2VydGFpbiBkZWxheSBiZXR3ZWVuCj4gY29uc2VjdXRpdmUgZmx1c2ggYWxs
Lgo+IFRoZSBpbnRlcnNlY3Rpb24gb2YgdGhlIHR3byBzdHJhaWdodCBsaW5lcyBpcyB0aGUgb3B0
aW1hbCBzb2x1dGlvbiBvZgo+IHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkLiBJbiBhY3R1YWwgc2l0
dWF0aW9ucywgY29udGludW91cwo+IGZsdXNoX2FsbF9hc2lkIHdpbGwgbm90IG9jY3VyLiBPbmUg
cHJvYmxlbSBjYXVzZWQgYnkgZmx1c2hfYWxsX2FzaWQoKQo+IGlzIHRoYXQgbXVsdGlwbGUgZmx1
c2ggZW50cmllcyByZXF1aXJlIFBUVywgd2hpY2ggY2F1c2VzIGdyZWF0ZXIKPiBsYXRlbmN5Lgo+
IFRoZXJlZm9yZSwgdGhlIHZhbHVlIG9mIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkIG5lZWRzIHRv
IGJlIGNvbnNpZGVyZWQKPiBvciBxdWFudGlmaWVkLiBNYXliZSBkb2luZyBsb2NhbF9mbHVzaF90
bGJfcGFnZV9hc2lkKCkgYmFzZWQgb24gdGhlCj4gYWN0dWFsIG5yX3B0ZXNfaW5fcmFuZ2Ugd291
bGQgZ2l2ZSBiZXR0ZXIgb3ZlcmFsbCBwZXJmb3JtYW5jZS4KPiBXaGF0IGRvIHlvdSB0aGluaz8K
ClllcywgdGhpcyB3YXMgc29tZXRoaW5nIEFsZXggYnJvdWdodCB1cCB3aGVuIGFkZGluZyB0aGlz
IHRocmVzaG9sZCwgdGhhdCBpdApzaG91bGQgYmUgdHVuZWQgZm9yIHZhcmlvdXMgc2NlbmFyaW9z
LiBUaGF0IHN0aWxsIG5lZWRzIHRvIGJlIGRvbmUuIFRoaXMgcGF0Y2gKanVzdCBjb3ZlcnMgb25l
IHNwZWNpZmljIGNhc2Ugd2hlcmUgd2Uga25vdyB0aGUgb3B0aW1hbCBhbnN3ZXIgZHVlIHRvIGFu
IGVycmF0dW0uCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
