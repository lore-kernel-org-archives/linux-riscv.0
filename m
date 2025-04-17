Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E61C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moiPvK3qh0qOOpUqTi+gwU229Zfc1dOmgXzClv+3l0M=; b=1xT/b2K85wOarr
	Q75/a/z8cpNAtN3EOfZSiJdp00WQyu9caHSoOmvfF6v/UkPMhciELZasFJ0v6vtK7ZQ7rlOxACI76
	4E7zBoppTpcuki1M7V84WKp81OELOXQaqXn04lzYVHrBmabj6xCcPqoC3fO6UjN51uyFGDKs4HyXE
	tCSZs20HxTUOAEy3YwhpoF1NRGP+Fson84m5+SDoFLb+fKT0JRjC/k37Nm/Kkj1Q9NX7ke/kpgziO
	UbBiERv/OGBneUIcG2UsVSb4TCkLEeQ+l6FHJSYonsLYmAwsPenG7UhecHzeNqxGFTh5HASi2tvkg
	hc3nKnXd/WBPHTP1G1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pzh-0000000DGgO-3aa3;
	Thu, 17 Apr 2025 14:13:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Oin-0000000D36z-1ylV
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Apr 2025 12:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=128aOD0HeldmNUa28jrs19qlYjVCdjVZq6egvszSPpE=; b=rZufVbJUaqQcVzXKJ+u6lYWrRa
	MzLahSupFJC8K2mIDWdcHufFJIOFFCbv//KwWTp6HOCExWuCpYnMFfSnt00MJsie2K4UpQb1Kw3tT
	qqu5W06KZp0M2UOiaGoivEedI9tI9P468o6s2Gvm3R6yCNNr6IO7EtC3Dgg6tAK1cWz9zWRpMtzyr
	bXR4pSDnHByxgr6I9BaiOAef1FyjS2zHjSqh1l981iciRFMCgEpBTrKvZiumdF0WkVgmUOcbzOIED
	TUTCP0dfjyIaeBx4ku6nieglKrtwBnZrt1u2lNw6cQ//U85uDKeDv6liisqEC97WhWsMGL4j294EP
	FZYYtrtg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5Oik-0000000AHfI-05ru
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:52:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so629464f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744894315; x=1745499115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=128aOD0HeldmNUa28jrs19qlYjVCdjVZq6egvszSPpE=;
        b=tFLZIDTtbQLnbse0sRSHivF8SgH7k0m+NDH5MZZs5yVAvdVP3Tl/Qjv9KJSP/+9KSo
         MFpzGxMCjiwzpZgGND0BFqeJSLhRPIGeE9OAS9J4Jo5Iv4KdfvQxu/H5WGxU1gxDAR03
         dBhjUnIA1D0XLA4LStlqqtqUKx9JCHnocENtygDTg6EltuR13kux1UqIEIL8082muwlr
         H88Wpc/H4xnYQkw0FVl74q+KcKXgZtTkwRsiJVg1dsryMC9q0nhPWDxrEXmHqqWceNrL
         9JTJy0Ui6sKBgfTZrYOJJjo0D4oiq4EDhinpV7m6GHLlteW5r6Euxs/GaHcL/Hcj8fvw
         L0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894315; x=1745499115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=128aOD0HeldmNUa28jrs19qlYjVCdjVZq6egvszSPpE=;
        b=s9TepsQmdDMRHbeI53/e42tDXF/97olqp5UhiTzkp7WBCRf81o7UCh2zFN2xXsIUn9
         JRz1ArJ9mUY6h3GMREHKDui3Y9Rz87bd1dnVvD79QppjBTbh6dAwnYVM9QayljQ3BV6S
         QigxJVVzG4Rf3aAFyVfO9LFnsXTVCx9DL4s7RjUOquXbjFeo5c+e+IXSFDb7YD4OvQkE
         enHRqcJS2UIFxXjnVk3ro+XjeS5DXLQEgC+i0PEV8WaBdsl5jYMrCT5KX1liy86J1bZ/
         7CP9sBJmRm6twpavgA7/65qWjNaWh3ZwtBtv82ODOL6vBhNe++b6TyBSQZdDpz64SfVN
         dcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5VH7tNxiYCc6FNfIsFCAh0y2qo5uKogZlqxH6GKf2UqQTVUmKH5QdLqHerB5BDp95kVUAc2PTCvQtqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhnXYzrrD3DP9WXYLgk+p4vn54kWM2RoMW/Lz/p8V3ZyD1+rd
	93NB2mlB8YVzyKAL4NA7M4wG2+yKYGi+ef7nizmvY4nK3O31+RDTAUwELVUjzbiCDEbF7/4DJGQ
	aNyhmZQ47HpdiqSl5/Ou0zaNQ6ZGTmrXO5NRjHQ==
X-Gm-Gg: ASbGnctWI1VCJt566umkZMFdEqISZdkulpaXa/DWLpjcDtU+EUuJxsGjVpydXvLdIsy
	apGpAjsLvwaeNkQjUz40+4UBygw3Ulh58ii3S4PZXtL3VhXiB5DoAwWm9FFyFbloaamtHE6NXiC
	rxb5XPOV9eOGV1xOpAVkPklJZchs3tafI=
X-Google-Smtp-Source: AGHT+IGSfaYlPsKYCZjwpMpDTw1oGQ6TfqqaE5dxySzTi8eYWLO/4VGzwdMbe3MJeePxuU0AjwYwUoAHiqHdzyVxgjQ=
X-Received: by 2002:a05:6000:1a88:b0:39e:dd1e:f325 with SMTP id
 ffacd0b85a97d-39ee5b3623cmr4465854f8f.31.1744894314691; Thu, 17 Apr 2025
 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
 <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
In-Reply-To: <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Thu, 17 Apr 2025 13:51:43 +0100
X-Gm-Features: ATxdqUGKyFbJpoByA6kTqSXnrGrcoiAJmkG-BaTaT2Bx7fpRX9c9j87i6CMLo9g
Message-ID: <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Ian Rogers <irogers@google.com>, ak@linux.intel.com
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, 
	ajones@ventanamicro.com, anup@brainfault.org, acme@kernel.org, 
	atishp@rivosinc.com, beeman@rivosinc.com, brauner@kernel.org, 
	conor@kernel.org, heiko@sntech.de, mingo@redhat.com, james.clark@arm.com, 
	renyu.zj@linux.alibaba.com, jolsa@kernel.org, jisheng.teoh@starfivetech.com, 
	palmer@dabbelt.com, will@kernel.org, kaiwenxue1@gmail.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_135158_263777_86845D54 
X-CRM114-Status: GOOD (  35.04  )
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

KyBBZGRpbmcgQW5kaSBLbGVlbi4KCk9uIFRodSwgRmViIDIwLCAyMDI1IGF0IDY6NTHigK9QTSBJ
YW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMTYs
IDIwMjUgYXQgMzoxMOKAr1BNIFJham5lc2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gUklTQ1YgQ1RSIGV4dGVuc2lvbiBzdXBwb3J0IGEgbWF4aW11bSBkZXB0
aCBvZiAyNTYgbGFzdCBicmFuY2ggcmVjb3Jkcy4KPiA+IFRoZSAxMjcgZW50cmllcyBsaW1pdCBy
ZXN1bHRzIGluIGNvcnJ1cHRpbmcgQ1RSIGVudHJpZXMgZm9yIFJJU0MtViBpZgo+ID4gY29uZmln
dXJlZCB0byBiZSAyNTYgZW50cmllcy4gVGhpcyB3aWxsIG5vdCBpbXBhY3QgYW55IG90aGVyIGFy
Y2hpdGVjdHVyZXMKPiA+IGFzIGl0IGlzIGp1c3QgaW5jcmVhc2luZyBtYXhpbXVtIGxpbWl0IG9m
IHBvc3NpYmxlIGVudHJpZXMuCj4KPiBJIHdvbmRlciBpZiByYXRoZXIgdGhhbiBhIGNvbnN0YW50
IHRoaXMgY29kZSBzaG91bGQganVzdCB1c2UgdGhlIGF1dG8KPiByZXNpemluZyBoYXNobWFwIGNv
ZGU/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2hhc2htYXAuaAo+Cj4gSSBhc3N1
bWUgdGhlIHZhbHVlIG9mIDEyNyBjb21lcyBmcm9tIHBlcmZfZXZlbnQuaCdzIFBFUkZfTUFYX1NU
QUNLX0RFUFRIOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2luY2x1ZGUvdWFwaS9saW51eC9wZXJmX2V2ZW50
LmgjbjEyNTIKPgo+IFBlcmhhcHMgdGhlc2UgY29uc3RhbnRzIHNob3VsZG4ndCBleGlzdC4gVGhl
IHBlcmYtcmVjb3JkIG1hbiBwYWdlIG1lbnRpb25zOgo+IHN5c2N0bC5rZXJuZWwucGVyZl9ldmVu
dF9tYXhfc3RhY2sKPiB3aGljaCBJIGJlbGlldmUgZ2V0cyBhIHZhbHVlIGZyb20KPiAvcHJvYy9z
eXMva2VybmVsL3BlcmZfZXZlbnRfbWF4X3N0YWNrLCBzbyBtYXliZSB0aGVzZSBzaG91bGQgYmUK
PiBydW50aW1lIGRldGVybWluZWQgY29uc3RhbnRzIHJhdGhlciB0aGFuIGNvbXBpbGUgdGltZS4K
PgoKVGhhbmtzIElhbiBmb3IgeW91ciBmZWVkYmFjay4gSSBhbSBub3Qgc3VyZSBpZiBpdCdzIGZl
YXNpYmxlIHRvIHVzZSBhdXRvCnJlc2l6aW5nIGhhc2htYXAgaGVyZS4gT24gZWFjaCBzYW1wbGUg
b2YgMjU2IGVudHJpZXMgd2Ugd2lsbCBiZSBkb2luZwo2IGNhbGxvY3MgYW5kIHRyYW5zZmVycmlu
ZyBhIHdob2xlIGxvdCBvZiBlbnRyaWVzIGluIGhhc2htYXBfZ3Jvdy4gV2UKY2FuJ3QgcmV1c2Ug
b2xkIGhhc2htYXAgYXMgd2VsbC4gT24gZWFjaCBzYW1wbGUgd2UgYmVhciB0aGUgc2FtZSBjb3N0
CgpCdXQgSSBkbyBhZ3JlZSB0aGlzIHNob3VsZCBiZSBtb3JlIGR5bmFtaWMgYnV0IHRoZSBtYXhp
bXVtIG51bWJlcgpvZiBlbnRyaWVzIHJlbW92ZV9sb29wcyBjYW4gcHJvY2VzcyBpcyBsaW1pdGVk
IGJ5IHRoZSB0eXBlIG9mIGNoYXNoIGFycmF5CmhlcmUuIEkgY2FuIGNoYW5nZSBpdCBhbmQgcmVs
YXRlZCBsb2dpYyB0byB1c2UgdWludDE2X3Qgb3IgaGlnaGVyIGJ1dCB3ZQp3aWxsIHN0aWxsIGhh
dmUgYSBjYXAgb24gdGhlIG51bWJlciBvZiBlbnRyaWVzLgoKUEVSRl9NQVhfQlJBTkNIX0RFUFRI
IHNlZW1zIHRvIGJlIGRlbm90aW5nIHdoYXQgcmVtb3ZlX2xvb3BzCmNhbiBwcm9jZXNzLiBUaGlz
IGlzIGJlaW5nIHVzZWQgYnkgdGhyZWFkX19yZXNvbHZlX2NhbGxjaGFpbl9zYW1wbGUgdG8KY2hl
Y2sgaWYgdGhlIHNhbXBsZSBpcyBwcm9jZXNzYWJsZSBiZWZvcmUgY2FsbGluZyByZW1vdmVfbG9v
cHMuIEkgdGhpbmsKdGhpcyBjYW4ndCBiZSBjaGFuZ2VkIHRvIHVzZSBwZXJmX2V2ZW50X21heF9z
dGFjay4gQnV0IEkgY2FuIHJlbmFtZQp0aGlzIG1hY3JvIHRvIGF2b2lkIGNvbmZ1c2lvbi4KCkkg
ZGlkbid0IG5vdGljZSBQRVJGX01BWF9TVEFDS19ERVBUSC4gVGhpcyBzZWVtcyB0byBiZSBkZWZp
bmVkIGluCm11bHRpcGxlIHBsYWNlcyBhbmQgdG91Y2hlcyBicGYgYXMgd2VsbC4gSSBhZ3JlZSB0
aGF0IHdlIHNob3VsZCBhdm9pZAp1c2luZyB0aGlzIG1hY3JvIGFuZCB1c2UgcnVudGltZSBkZXRl
cm1pbmVkIHZhbHVlIGluc3RlYWQuIFRiaCBJIGRvbid0CmhhdmUgc3VwZXIgaW4tZGVwdGggcGVy
ZiB1bmRlcnN0YW5kaW5nLiBJIHdpbGwgZ2l2ZSB0aGlzIGEgdHJ5IGFuZCBzZW5kIGEKcGF0Y2gg
aW4gdGhlIG5leHQgdXBkYXRlLiBJdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4gcmV2aWV3
IGl0LgoKVGhhbmtzCi1SYWpuZXNoCgo+IFRoYW5rcywKPiBJYW4KPgo+ID4gU2lnbmVkLW9mZi1i
eTogUmFqbmVzaCBLYW53YWwgPHJrYW53YWxAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgdG9v
bHMvcGVyZi91dGlsL21hY2hpbmUuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jIGIvdG9vbHMvcGVyZi91dGlsL21h
Y2hpbmUuYwo+ID4gaW5kZXggMjdkNTM0NWQyYjMwLi5mMmViM2MyMDI3NGUgMTAwNjQ0Cj4gPiAt
LS0gYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jCj4gPiArKysgYi90b29scy9wZXJmL3V0aWwv
bWFjaGluZS5jCj4gPiBAQCAtMjE3NCwyNSArMjE3NCwzMiBAQCBzdGF0aWMgdm9pZCBzYXZlX2l0
ZXJhdGlvbnMoc3RydWN0IGl0ZXJhdGlvbnMgKml0ZXIsCj4gPiAgICAgICAgICAgICAgICAgaXRl
ci0+Y3ljbGVzICs9IGJlW2ldLmZsYWdzLmN5Y2xlczsKPiA+ICB9Cj4gPgo+ID4gLSNkZWZpbmUg
Q0hBU0hTWiAxMjcKPiA+IC0jZGVmaW5lIENIQVNIQklUUyA3Cj4gPiAtI2RlZmluZSBOT19FTlRS
WSAweGZmCj4gPiArI2RlZmluZSBDSEFTSEJJVFMgOAo+ID4gKyNkZWZpbmUgTk9fRU5UUlkgMHhm
ZlUKPiA+Cj4gPiAtI2RlZmluZSBQRVJGX01BWF9CUkFOQ0hfREVQVEggMTI3Cj4gPiArI2RlZmlu
ZSBQRVJGX01BWF9CUkFOQ0hfREVQVEggMjU2Cj4gPgo+ID4gIC8qIFJlbW92ZSBsb29wcy4gKi8K
PiA+ICsvKiBOb3RlOiBMYXN0IGVudHJ5IChpPT1mZikgd2lsbCBuZXZlciBiZSBjaGVja2VkIGFn
YWluc3QgTk9fRU5UUlkKPiA+ICsgKiBzbyBpdCdzIHNhZmUgdG8gaGF2ZSBhbiB1bnNpZ25lZCBj
aGFyIGFycmF5IHRvIHByb2Nlc3MgMjU2IGVudHJpZXMKPiA+ICsgKiB3aXRob3V0IGNhdXNpbmcg
Y2xhc2ggYmV0d2VlbiBsYXN0IGVudHJ5IGFuZCBOT19FTlRSWSB2YWx1ZS4KPiA+ICsgKi8KPiA+
ICBzdGF0aWMgaW50IHJlbW92ZV9sb29wcyhzdHJ1Y3QgYnJhbmNoX2VudHJ5ICpsLCBpbnQgbnIs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaXRlcmF0aW9ucyAqaXRlcikKPiA+
ICB7Cj4gPiAgICAgICAgIGludCBpLCBqLCBvZmY7Cj4gPiAtICAgICAgIHVuc2lnbmVkIGNoYXIg
Y2hhc2hbQ0hBU0hTWl07Cj4gPiArICAgICAgIHVuc2lnbmVkIGNoYXIgY2hhc2hbUEVSRl9NQVhf
QlJBTkNIX0RFUFRIXTsKPiA+Cj4gPiAgICAgICAgIG1lbXNldChjaGFzaCwgTk9fRU5UUlksIHNp
emVvZihjaGFzaCkpOwo+ID4KPiA+IC0gICAgICAgQlVHX09OKFBFUkZfTUFYX0JSQU5DSF9ERVBU
SCA+IDI1NSk7Cj4gPiArICAgICAgIEJVR19PTihQRVJGX01BWF9CUkFOQ0hfREVQVEggPiAyNTYp
Owo+ID4KPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yOyBpKyspIHsKPiA+IC0gICAgICAg
ICAgICAgICBpbnQgaCA9IGhhc2hfNjQobFtpXS5mcm9tLCBDSEFTSEJJVFMpICUgQ0hBU0hTWjsK
PiA+ICsgICAgICAgICAgICAgICAvKiBSZW1haW5kZXIgZGl2aXNpb24gYnkgUEVSRl9NQVhfQlJB
TkNIX0RFUFRIIGlzIG5vdAo+ID4gKyAgICAgICAgICAgICAgICAqIG5lZWRlZCBhcyBoYXNoXzY0
IHdpbGwgYW55d2F5IGxpbWl0IHRoZSBoYXNoCj4gPiArICAgICAgICAgICAgICAgICogdG8gQ0hB
U0hCSVRTCj4gPiArICAgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgaW50IGgg
PSBoYXNoXzY0KGxbaV0uZnJvbSwgQ0hBU0hCSVRTKTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAg
Lyogbm8gY29sbGlzaW9uIGhhbmRsaW5nIGZvciBub3cgKi8KPiA+ICAgICAgICAgICAgICAgICBp
ZiAoY2hhc2hbaF0gPT0gTk9fRU5UUlkpIHsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
