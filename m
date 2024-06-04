Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2A4C27C50
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UySSm6O44B56qf0Ic8A9uqeECiegWllwxg6VBfq6dz8=; b=OIzZN2nRU9HGz1
	ZICF/SfIx5nvgTTDWQ0AVH/melNjbbV8cm3HPIaXJluPCuWSgt+PCGFF5eJWNI6XhW9xyll5cH2Ze
	RoNiClOaL9bcBxgzgjfjj58XttoCAedK5x6TSnZ+IIUxZmdMWocMDh5JakbgyCn1FUMb4cithPGnB
	HmFmDWPBp2brrSkte4chFE2Fa95/4dmO3/T/q2twG8Ad6d0wvvgJxrk7o5uO0z2sNyZiGZG6Q/tim
	DjVT/xy6CBYYL1JUYwC/MCX2K8NQSxZ6nW+oB74iEHKVKvhHWurxb1/LzQaApdai3c/YoDkG7BnXi
	tLbW/kfe0rB6rREGzHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcWe-000000041rB-2wGX;
	Tue, 04 Jun 2024 22:21:04 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcWZ-000000041oO-2T85
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 22:21:02 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-44024f5271dso49691cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717539656; x=1718144456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIBmj4SOCWbNZTcEJ36wTOG253WABX8+/zZKq57PG38=;
        b=oM0nA+0GbD10UcSo9qjViOVUG7uyjC10YR9J/kckREJyMMT9mFZzL9gQ/HZbw8OPD4
         51PRR3bPAJG4Ig2Zp0gmDfSI4jjLZxrRCoOkAxbGkC2Bs4cab+VzadJ03QTZp8825k4O
         TA4qu0zhAYDCK3llb88P02ZVEbTJ0I3sz7VFddsQC3Mwg8YKNTeY+olTSGI5NKTh6RcZ
         rQasVZr5QpREo+4P5qxhExpLQ3pbymF9dTi2Fy87+3SPvhsBeHKnJfK8tLrEmcP1N+77
         3C2IVKrOX1kfTlrzvEbOdZDheILTQ2CnP9TvihOaKQYk5yOpKWYiwgUMvcZu3FWAU5zF
         78rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717539656; x=1718144456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIBmj4SOCWbNZTcEJ36wTOG253WABX8+/zZKq57PG38=;
        b=r/hvXtnEUtj56b3HdxAHwhCZhbxUdLrtqbtdY2z6FftKZCapdmGpUqapPnjeCfcBqA
         IWTUUQwi6c2DqZTbzzq9vcpikYe7J7osrV6xRVjO4U8VyH9VbvnNBdefpdb3J7PmYa6c
         0fPN9eKMUrC+XkZaSDPX0hlFRWMjw9g2bUOQpG+ke9rou2EEPZtjIex4vR/an3YOjZ8N
         TaFL30WVZIgObo85GtjafhSJ9AtRvbjgI7fY+euFkaIEjerwJ1caKrPsmL8JCjlLvmtV
         Xi/v8Fkw6vhLXyYHguMt5ifAuAy+Ei+q6lVQ6vwaUSJscrlaPGAwBWHyhzsdaHr7ZjtG
         E4TA==
X-Forwarded-Encrypted: i=1; AJvYcCXqZbU2SLsQpZprZ6A4ur68Gi1AlnY040DgzKu5PRFlrr8i3BnjOvGQ/hirLPSsOvquu92PagMRle8mghquitI4OLraXopSyffxRo12weUv
X-Gm-Message-State: AOJu0YwKVvuRx8Kb5VsszqCBU25jPyuvHLLwELbyLnEHZ9Oz8tmkgZG5
	1HnHhwqZv342hpi4ILhq2gl221a1XvZy62sj4QC5Wiz8osO9j7CgQL9ySB8UpaKecnu14iWsoUF
	LomK3cGSPJ73Nr31huflwGOtHddB7hWekPrnF
X-Google-Smtp-Source: AGHT+IFqQR6wV0ldEWSB61hJVaO5R3FbfhfGJ/jL2Y1RO1QFt4uPcpp04yR87XJA3WIv/pXl4si2o71lLJw9aUuCxfc=
X-Received: by 2002:a05:622a:5a98:b0:43d:dc3b:518c with SMTP id
 d75a77b69052e-4402ce13c55mr332451cf.11.1717539656344; Tue, 04 Jun 2024
 15:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com> <Zlog5Yk_Pjq0jQhC@linux.dev> <Zloicw4IU8_-V5Ns@linux.dev>
In-Reply-To: <Zloicw4IU8_-V5Ns@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 4 Jun 2024 15:20:20 -0700
Message-ID: <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_152059_767689_71911835 
X-CRM114-Status: GOOD (  22.81  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTI6MTjigK9QTSBPbGl2ZXIgVXB0b24gPG9saXZlci51
cHRvbkBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTI6MTE6
MzNQTSAtMDcwMCwgT2xpdmVyIFVwdG9uIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQg
YXQgMDY6MDU6MDlQTSArMDAwMCwgSmFtZXMgSG91Z2h0b24gd3JvdGU6Cj4gPgo+ID4gWy4uLl0K
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jIGIvYXJj
aC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+ID4gPiBpbmRleCA5ZTJiYmVlNzc0OTEuLmVhYmIw
N2M2NmEwNyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+
ID4gPiArKysgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiA+IEBAIC0xMzE5LDEw
ICsxMzE5LDggQEAgc3RhdGljIGludCBzdGFnZTJfYWdlX3dhbGtlcihjb25zdCBzdHJ1Y3Qga3Zt
X3BndGFibGVfdmlzaXRfY3R4ICpjdHgsCj4gPiA+ICAgICBkYXRhLT55b3VuZyA9IHRydWU7Cj4g
PiA+Cj4gPiA+ICAgICAvKgo+ID4gPiAtICAgICogc3RhZ2UyX2FnZV93YWxrZXIoKSBpcyBhbHdh
eXMgY2FsbGVkIHdoaWxlIGhvbGRpbmcgdGhlIE1NVSBsb2NrIGZvcgo+ID4gPiAtICAgICogd3Jp
dGUsIHNvIHRoaXMgd2lsbCBhbHdheXMgc3VjY2VlZC4gTm9uZXRoZWxlc3MsIHRoaXMgZGVsaWJl
cmF0ZWx5Cj4gPiA+IC0gICAgKiBmb2xsb3dzIHRoZSByYWNlIGRldGVjdGlvbiBwYXR0ZXJuIG9m
IHRoZSBvdGhlciBzdGFnZS0yIHdhbGtlcnMgaW4KPiA+ID4gLSAgICAqIGNhc2UgdGhlIGxvY2tp
bmcgbWVjaGFuaWNzIG9mIHRoZSBNTVUgbm90aWZpZXJzIGlzIGV2ZXIgY2hhbmdlZC4KPiA+ID4g
KyAgICAqIFRoaXMgd2FsayBtYXkgbm90IGJlIGV4Y2x1c2l2ZTsgdGhlIFBURSBpcyBwZXJtaXR0
ZWQgdG8gY2hhbmdlCj4gPiA+ICsgICAgKiBmcm9tIHVuZGVyIHVzLgo+ID4gPiAgICAgICovCj4g
PiA+ICAgICBpZiAoZGF0YS0+bWtvbGQgJiYgIXN0YWdlMl90cnlfc2V0X3B0ZShjdHgsIG5ldykp
Cj4gPiA+ICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOwo+ID4KPiA+IEl0IGlzIHByb2JhYmx5
IHdvcnRoIG1lbnRpb25pbmcgdGhhdCBpZiB0aGVyZSB3YXMgYSByYWNlIHRvIHVwZGF0ZSB0aGUK
PiA+IFBURSB0aGVuIHRoZSBHRk4gaXMgbW9zdCBsaWtlbHkgeW91bmcsIHNvIGZhaWxpbmcgdG8g
Y2xlYXIgQUYgcHJvYmFibHkKPiA+IGlzbid0IGV2ZW4gY29uc2VxdWVudGlhbC4KClRoYW5rcyBP
bGl2ZXIuCgo+Cj4gT2gsIGFuZCB0aGUgV0FSTl9PTigpIGluIGt2bV9wZ3RhYmxlX3N0YWdlMl90
ZXN0X2NsZWFyX3lvdW5nKCkgaXMgYm9ndXMKPiBub3cuIE1heWJlIGRlbW90ZSBpdCB0bzoKPgo+
ICAgciA9IGt2bV9wZ3RhYmxlX3dhbGsoLi4uKTsKPiAgIFdBUk5fT05fT05DRShyICYmIHIgIT0g
LUVBR0FJTik7CgpPaCwgaW5kZWVkLCB0aGFuayB5b3UuIEp1c3QgdG8gbWFrZSBzdXJlIC0tIGRv
ZXMgaXQgbWFrZSBzZW5zZSB0bwpyZXRyeSB0aGUgY21weGNoZyBpZiBpdCBmYWlscz8gRm9yIGV4
YW1wbGUsIHRoZSB3YXkgSSBoYXZlIGl0IG5vdyBmb3IKeDg2WzFdLCB3ZSByZXRyeSB0aGUgY21w
eGNoZyBpZiB0aGUgc3B0ZSBpcyBzdGlsbCBhIGxlYWYsIG90aGVyd2lzZSB3ZQptb3ZlIG9uIHRv
IHRoZSBuZXh0IG9uZSBoYXZpbmcgZG9uZSBub3RoaW5nLiBEb2VzIHNvbWV0aGluZyBsaWtlIHRo
YXQKbWFrZSBzZW5zZSBmb3IgYXJtNjQ/CgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzIwMjQwNTI5MTgwNTEwLjIyOTUxMTgtNi1qdGhvdWdodG9uQGdvb2dsZS5jb20vCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
