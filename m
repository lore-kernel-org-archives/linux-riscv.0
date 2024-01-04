Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6327C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 05:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZYl4B1pdR9CDzCJsmBUzigfOGBikCfIy20HSg6tSzA=; b=ucyydoZBtE0qoe
	VHJvEecOF5RPZVtsTx0WmKTa7BjDP+ytEuNneXtEu2bQvdLQKYJiccQlbqo0LTgKydz5ApQx6WnOD
	HxHYNAJB46ypci2I61U2jNeBZvNBbpR92ZFK3YGinT0s6algc3oVJ6fFkrMO4SOBjZpcpp6YpXjbt
	hI+0iSAoPgkVICVzaFfUBVY7hSyy0oEQbsIIMTpf1ca2CExvgtr8pnjfwrAjVYiHyOP66sC7SBOg5
	foA5xyUmrS4JIGeT8FsX6JHAfmCtmc8gQRkFM6gKsQckKThRqyvmjUlGw8Fez8g3xLM513mD4j+VL
	zuxZ3Vu+POhdBeBgittA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLGJW-00CtoS-1m;
	Thu, 04 Jan 2024 05:30:42 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLGJT-00Ctn9-0F
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 05:30:40 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7b7fdde8b54so4970639f.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 21:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704346237; x=1704951037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2ixpTVJPJvqrYlOE9jVUVHqg8qaW8lY49AbVHVK/go=;
        b=e1OEMvOiRkQL6aIPAB1a7HfzJHCMOi/Q6iRCNH4TDczVhrHwgzNq30VGoVZgl39mfe
         NsRa/UbQ1xaDYCEvs7pqfsRUzbDuDehxdfxIWi3mhwxP5Qs0igzwa0p3Oyqwt3aN9njt
         i950xjIq7hVj4rk6sXzoIcAW5DKkUTvSLs95rotRA6wCmEzQSw/2H/uJeu6b5d6yzFC4
         R/id/QgXYryuG3RJ0R96hzHwrZSQ2qNazI+kSeV/nsJio8WWmvqlmdUYQVoYR8VVKs9J
         5uagk8ZQoKny8twm2bRubfnQirQWIW7YYmWhL4X12X/K2H2AF1oGeKNf6PtpQ10QgwGt
         U3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704346237; x=1704951037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2ixpTVJPJvqrYlOE9jVUVHqg8qaW8lY49AbVHVK/go=;
        b=hWsEBYizqY3qpZI6PV8YC+v1GGl+hLTH+iREOdQv/B3vNEdeY+dl+334PFla9eB0qE
         5Xfnj31FbfAUUWFrsrlLR0O+XINh59Wat2i+iA+7u8zi3eJg2z4RUguulxWLqkfj/Pqe
         r1c+JenL8aEV6PgPtxn4gNwjr3s1XNGsNAEOv32CM5yBYsyQ/VBeG8uirVs6L6qPW9X/
         lAfWw51/futsaDG1tWe1DGdLM6F2fm8UREAjGo4jQtL33KibynOTzjlnqR8mpH5KnVPJ
         QNfDB3W574lSWcCgiyDIiW9PrcrpyMOn8yA4tJA2m56K7iAYJTkvUyYMb8oymPz8no1i
         PkQQ==
X-Gm-Message-State: AOJu0Ywg27uinuN8jBZBGECzzq1k2EmGREg7pHYxsXKdaclTIPbVDgW6
	NItHiKrI9BmCbrJdXWiq9FAi8xuGw75tlcuoE1x+9zIm7Pl+iQ==
X-Google-Smtp-Source: AGHT+IHGGBS0cD3yh40wy6CQgR75OfbGKBNuVs6ng214otd0OCP2GlKFDQSVXB8H0pgPPvYpTYPaOj16OfVLcHNEKm0=
X-Received: by 2002:a05:6e02:1d83:b0:35f:a33f:a181 with SMTP id
 h3-20020a056e021d8300b0035fa33fa181mr121135ila.15.1704346237045; Wed, 03 Jan
 2024 21:30:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com> <20240102-c07d32a585f11ee80bd7b70b@orel>
In-Reply-To: <20240102-c07d32a585f11ee80bd7b70b@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jan 2024 11:00:25 +0530
Message-ID: <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
Subject: Re: Re: [GIT PULL] KVM/riscv changes for 6.8 part #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_213039_438226_5441F738 
X-CRM114-Status: GOOD (  20.20  )
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

SGkgUGFvbG8sCgpPbiBXZWQsIEphbiAzLCAyMDI0IGF0IDE6NTXigK9BTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDAyLCAyMDI0
IGF0IDA3OjI0OjI2UE0gKzAxMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiBPbiBTdW4sIERl
YyAzMSwgMjAyMyBhdCA2OjMz4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFBhb2xvLAo+ID4gPgo+ID4gPiBXZSBoYXZlIHRoZSBmb2xs
b3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2Ljg6Cj4gPiA+IDEpIEtWTV9HRVRfUkVHX0xJ
U1QgaW1wcm92ZW1lbnQgZm9yIHZlY3RvciByZWdpc3RlcnMKPiA+ID4gMikgR2VuZXJhdGUgSVNB
IGV4dGVuc2lvbiByZWdfbGlzdCB1c2luZyBtYWNyb3MgaW4gZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0
Cj4gPiA+IDMpIFN0ZWFsIHRpbWUgYWNjb3VudCBzdXBwb3J0IGFsb25nIHdpdGggc2VsZnRlc3QK
PiA+Cj4gPiBKdXN0IG9uZSBzbWFsbCB0aGluZyBJIG5vdGljZWQgb24gKDMpLCBkbyB5b3UgcmVh
bGx5IG5lZWQgY3B1X3RvX2xlNjQKPiA+IGFuZCBsZTY0X3RvX2NwdSBvbiBSSVNDLVY/IEl0IHNl
ZW1zIHRoYXQgaXQgd2FzIGNvcGllZCBmcm9tIGFhcmNoNjQuCj4gPiBObyBuZWVkIHRvIHJlc2Vu
ZCB0aGUgUFIgYW55d2F5LCBvZiBjb3Vyc2UuCj4KPiBXaGlsZSBMaW51eC9LVk0gaXMgb25seSBM
RSwgdGhlIGFyY2ggZG9lc24ndCBwcm9oaWJpdCBTLW1vZGUgYmVpbmcKPiBjb25maWd1cmVkIHRv
IHVzZSBCRSBtZW1vcnkgYWNjZXNzZXMsIHNvIEkga2VwdCB0aGUgY29udmVyc2lvbnMuIFRoZXkK
PiBhdCBsZWFzdCBwcm92aWRlIHNvbWUgc2VsZi1kb2N1bWVudGluZyBvZiB0aGUgY29kZS4gVGhl
IGJpZ2dlc3QKPiBwcm9ibGVtIHdpdGggdGhlbSwgdGhvdWdoLCBpcyB0aGF0IEkgZGlkbid0IHVz
ZSBfX2xlNjQgdHlwZXMgYW5kIG5vdwo+IHNwYXJzZSBpcyB5ZWxsaW5nIGF0IG1lLiBJIHBhdGNo
ZWQgdGhhdCB0aGlzIG1vcm5pbmcsIGJ1dCBkaWRuJ3QgZ2V0Cj4gYSBjaGFuY2UgdG8gcG9zdCB5
ZXQuIEkgY291bGQgaW5zdGVhZCByaXAgb3V0IHRoZSBjb252ZXJzaW9ucyB0bwo+IHF1aWV0IHNw
YXJzZSwgaWYgdGhhdCB3b3VsZCBiZSBwcmVmZXJyZWQuCgpUaGUgU0JJIHNwZWMgaXMgcXVpdGUg
ZXhwbGljaXQgYWJvdXQgZW5kaWFubmVzcyBvZiBkYXRhIGluIHNoYXJlZAptZW1vcnkuIEFsc28s
IHRoZSBSSVNDLVYgcHJpdiBzcGVjIGFsbG93cyBCRSBsb2FkL3N0b3JlIG9wZXJhdGlvbnMKc28g
ZXZlbnR1YWxseSB3ZSBtaWdodCBzZWUgQkUgcGxhdGZvcm1zLiBJIHN1Z2dlc3Qga2VlcGluZyB0
aGUgTEUKY29udmVyc2lvbiBtYWNyb3MgYW5kIF9fbGUzMi9fX2xlNjQgZGF0YSB0eXBlcy4KClJl
Z2FyZGluZyB0aGUgc3BhcnNlIGVycm9ycywgRHJldyBjYW4gc2VuZCBmaXggcGF0Y2hlcyB3aGlj
aCBJCndpbGwgaW5jbHVkZSBpbiB0aGUgc2Vjb25kIFBSIGZvciA2LjguCgpJIGhvcGUgdGhpcyBp
cyBva2F5LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
