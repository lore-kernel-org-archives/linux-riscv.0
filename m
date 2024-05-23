Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD8C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 04:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrwsenlOprH0IaEKNg8ZGsVYZyDQ/apmPgRP1CAkicU=; b=ZwvrKmHZjyMw1V
	Ie2gMGlE7QBDCFJVSvkf2dFDfsXRs3s1WxJpHGLf4b/3PZ0x8aLHqTF8PzPb+ShDwWg7AwfCsqMxG
	SODmN03t9Ishmtl4+tpZAfO6Z++uHM4k/sM8xHmsQ0/3W4qdMyt4yK88GN6KZUJIM8Fvkf+uB/Vog
	nP+oy4f1qDRShoD/4QNAXoR0YN7IszHKCRaUWDnGHVkxqqllkUPIxsq7yqEBCLli6JJY9/WdBYxfX
	BmsdZNcDCNU5yjHxi1a8F5jAMthI+dteWVzkl0oNyR8W0Rg4ZiYZ4kWaUVa6KAgAiaSGs4ijloI6f
	EVdi6QG1BA9pW0nk70Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zxA-00000004yVp-3rhX;
	Thu, 23 May 2024 04:21:20 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zx4-00000004yVL-3QmI
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 04:21:18 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-371cc143f6aso7983995ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 21:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1716438072; x=1717042872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqFpxyZ6rzHfXC3E6CAF1RLsqjtlBkIgyPwQJ8CpBcU=;
        b=zQVC25fGoJ2P20/vReHs74rwz89tMvpxIYDWBxz+zFeOjnKM0mjt09X4tH4ZbEV9kx
         LqgcNG8kpMREj+pFLVqwRApXLci/vtj60h34vsSoP+eo2jyq5RU7PZLVIG+7gWj4TuHn
         s+pKS8r2OWp3xqNuKfo8nz3QjptS/w6MLtwQxe370ZtM4/V1rwe6mGREgO30p/KX648Z
         KP59lNJFvJNJM3rFfDh60yodEfk1/Aackss04omNexHD2a5m8lcfdv+Nb/9NAXFiYdlh
         AFrd9h/y9u6NHHki8bR9pJBTkHZJug+QSUXbDLDyClv4yljrPVzW71Y83tmxUgLdMiwJ
         kaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716438072; x=1717042872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqFpxyZ6rzHfXC3E6CAF1RLsqjtlBkIgyPwQJ8CpBcU=;
        b=SEyBhR+3x+U3QscCt7SUGAlBLYnJOJU9NpJNV80H1zKt1PtKydtGBsvoekoW0EFn1P
         hjCnMUAWpbzsG3oz3HG2aRMTPaKssGpXkd7NZId2CH8nnMKPBLouu2C9E97T9cmfjdNa
         jSQEbWXilG7bTCe/hQ9WHC7u2eJduvKRbBTZovj38gEmuErDHpf5nDQC4+w5IdKxhKoI
         rAd8UKnSyZiOu8QWqfjEMW/TnXzUezFPJ1Ccox9Qkv/O6jC24L5sL2xiwEnFT32z9TlX
         3WA1IqG6QM4uf+yYIC8LsJXKHsaeE7VVVtWEXbolTAu2R8YjAUPjEL6iWk2SSN4w4ulA
         E4+A==
X-Forwarded-Encrypted: i=1; AJvYcCVT9/ffZxR/zSaq0cyIESdSL+r7W8QATlfJjcNXppM7Cqz+SHPWyAbdZbQ1HjmOJrKELFJRDMqiYdlPEEpoVd5/3FS+hEnrO31tB6H8cL8L
X-Gm-Message-State: AOJu0Yy92FLlotMARFrAyn+uD6zcrt2LZoFlw4LMu4wqmHOAhrdsqmEw
	in+Ue7sumNR7gqbJWu6gVVfPv8czSuoygOvI4Gx1hiIi1JwyRSI2Se8iYXtYkavkt2JVKrV+FWi
	KXklQfoh9WfOQCp1xhSfQXWck7EHSWBnB+A/Y/w==
X-Google-Smtp-Source: AGHT+IGApx7/JOvBCBD2391AMJlV4TfZRvcEeIjNXruuf/n6lKOYxnvBWSiCRptaBp2oOw/22seBN0MnLs4UqP49bUw=
X-Received: by 2002:a05:6e02:1c21:b0:36c:cda:e2fc with SMTP id
 e9e14a558f8ab-371faf4ee77mr40735325ab.16.1716438072560; Wed, 22 May 2024
 21:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240522184953.28531-3-palmer@rivosinc.com>
In-Reply-To: <20240522184953.28531-3-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 May 2024 09:51:01 +0530
Message-ID: <CAAhSdy2UFh+BYX=gMVPZRJivLxhatZOqBpOuKef0cc0OvrSAGA@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Fixup riscv_ipi_set_virq_range() conflict
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_212115_127910_EDF21D2A 
X-CRM114-Status: GOOD (  18.62  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMTI6MjbigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJp
dm9zaW5jLmNvbT4KPgo+IFRoZXJlIHdhcyBhIHNlbWFudGljIGNvbmZsaWN0IGJldHdlZW4gMjFh
OGY4YTBlYjM1ICgiaXJxY2hpcDogQWRkIFJJU0MtVgo+IGluY29taW5nIE1TSSBjb250cm9sbGVy
IGVhcmx5IGRyaXZlciIpIGFuZCBkYzg5MmZiNDQzMjIgKCJyaXNjdjogVXNlCj4gSVBJcyBmb3Ig
cmVtb3RlIGNhY2hlL1RMQiBmbHVzaGVzIGJ5IGRlZmF1bHQiKSBkdWUgdG8gYW4gQVBJIGNoYW5n
ZS4KPiBUaGlzIG1hbmlmZXN0cyBhcyBhIGJ1aWxkIGZhaWx1cmUgcG9zdC1tZXJnZS4KPgo+IFJl
cG9ydGVkLWJ5OiBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMuY29tPgo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9taG5nLTEwYjcxMjI4LWNmM2UtNDJjYS05YWJm
LTU0NjRiMTUwOTNmMUBwYWxtZXItcmkteDFjOS8KPiBGaXhlczogMGJmYmM5MTRkOTQzICgiTWVy
Z2UgdGFnICdyaXNjdi1mb3ItbGludXMtNi4xMC1tdzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eCIpCj4gU2lnbmVkLW9mZi1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
IFNvcnJ5IEkgd2Fzbid0IGNsZWFyIGFib3V0IHRoaXMgb25lLCBidXQgbG9va3MgbGlrZSBpdCBn
b3QgZHJvcHBlZCBhcwo+IHBhcnQgb2YgdGhlIG1lcmdlLiAgSSdtIGhhcHB5IHRvIHBpY2sgdGhp
cyB1cCB2aWEgdGhlIFJJU0MtViB0cmVlIGlmCj4gZm9sa3Mgd2FudCwgYnV0IEknbGwga2VlcCBp
dCBzdGFzaGVkIG9mZiB0byB0aGUgc2lkZSBmb3Igbm93IGFzIGl0J3MKPiBqdXN0IHRvdWNoaW5n
IGlycWNoaXAuICBJJ20gcGxhbm5pbmcgb24gc2VuZGluZyBzb21lIG1vcmUgc3R1ZmYgb24KPiBG
cmlkYXkgbW9ybmluZywgc28ganVzdCBMTUsuCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtZWFybHkuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJs
eS5jCj4gaW5kZXggODg2NDE4ZWMwNmNiLi40ZmJiMzcwNzRkMjkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gKysrIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gQEAgLTQ5LDcgKzQ5LDcgQEAgc3RhdGljIGlu
dCBfX2luaXQgaW1zaWNfaXBpX2RvbWFpbl9pbml0KHZvaWQpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiB2aXJxIDwgMCA/IHZpcnEgOiAtRU5PTUVNOwo+Cj4gICAgICAgICAvKiBTZXQgdklSUSBy
YW5nZSAqLwo+IC0gICAgICAgcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKHZpcnEsIElNU0lDX05S
X0lQSSwgdHJ1ZSk7Cj4gKyAgICAgICByaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UodmlycSwgSU1T
SUNfTlJfSVBJKTsKPgo+ICAgICAgICAgLyogQW5ub3VuY2UgdGhhdCBJTVNJQyBpcyBwcm92aWRp
bmcgSVBJcyAqLwo+ICAgICAgICAgcHJfaW5mbygiJXBmd1A6IHByb3ZpZGluZyBJUElzIHVzaW5n
IGludGVycnVwdCAlZFxuIiwgaW1zaWMtPmZ3bm9kZSwgSU1TSUNfSVBJX0lEKTsKPiAtLQo+IDIu
NDUuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
