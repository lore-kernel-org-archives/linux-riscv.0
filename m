Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71C1C25B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 03:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2Cjz+D6HZNcdohMILS82x+aICYgvDL1HYAUqCEgk+c=; b=d5zZ1ZmYcAcDXu
	5HIeOBZF86jFDWMbf2p2gxCvkZteuNjUVN69OZiGTQWmJCZqVnQWzhA7hX9pGiDHXqdSU/HsHYZZB
	Rn67eZR7tAwq1H9FeMBp2opNNBsm1S56pSUnuk1NfrCoDAm/zxppYcFVCVgVFtc4Fnh8RGVNtrS0u
	aZkfBHcujr92BXNxg5J+Fu2U81VBQ9Qm7huDnqxbY3NV4iwBHoRLyNQmfcBzNDAFVwlU+etlglE9q
	ryYxBQJ+3oSBVTBhZCi//V7eUIuzlqOEVCOBcnUdLTFrm7WcWhtaKvlkdu2Uq14+KFsAEjM+iwbST
	9AQo7/CBnrfxFQgRSfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWRo-00000006BW2-2rc4;
	Thu, 30 May 2024 03:27:24 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWRk-00000006BRy-20T9
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 03:27:22 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-43e14f0bd75so110831cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 20:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717039638; x=1717644438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzO8DZyZzCqrZIAMGt7yPpLcZJsj3wUliJt03pVmX2A=;
        b=SAjAB06Rv9/iB006+lGrD3N/526XHpA/BBpn541+xMjBx1ew104i7bJBJF1MTLM0ZR
         TCNZ9VUAHfpH93gx3UKhYCM75/lOupXse+o9f7XoBGIZ0i1ZHMrpqASb6J5rwOWX4ABD
         RUx1+w97l9uyWGZPRofza/edKdVKVMommPCDEHTgZcK1ZVGPiDYcMBeRyz5MPPmwijhy
         zssNIyNvd5Mcv/qZLOxqsnVYOB80aYPP1ol9nrBes2RVh76PhTuBf0mARqT12gNP6RzL
         x8grCQ9pvQYY7xesy5W//xs+oUJ/PmX8QtXIa+mzrs/4rbgRcyzyYolkAP+jPleCxpmb
         Vw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717039638; x=1717644438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzO8DZyZzCqrZIAMGt7yPpLcZJsj3wUliJt03pVmX2A=;
        b=H1V68NYo19zweluN7yUdECZXxJoxj3dXlKBbu7d5LYNAiJFbkt8268yOAhbZGYGCXA
         TOgOlmIKqAKoT00dzOadWFmfFy9A8/Gk0fg/Y4hdp5M2hRPeHR94j6idEmc4vAoSNJh/
         nqiiO68Q0dYtEl+xjJ4aexN2jqrL6ls9gJrOEbj5Z9iJC45asWWaAgzIxC2lQhSbu+gB
         gdQnB6ZedFt3sTs8+gMpbB2PP9wW+8IuMGSDP5+ggsMfC5HtNiiyANx9cDQQFin9B0yB
         aAXWjAV+n/KklEKLh7kmrojjwnfbAR4/zYrF74D8tqh9fbkQu1FvvCQDw0Ib6+Y6Ko9y
         WWHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6vBWGmeRdCrcjFIYXAwMKm2wwyFoiPIHTe1o86VU6bJFGzUdUty6x7FyZuugn8aWI6te9HGXu3TBRDygo35jQe0uMrFPaQeuDpdCgjI4n
X-Gm-Message-State: AOJu0Yzmc6weuPkAQ5cjGrDhjok87O82c1PhxN83gb75DklYtszIwp/a
	73LhQAoRsr/4So0BN6id7zjfhXvncScZaVqcCRlMRsS2F/bsCvXDhUjSzzd4fmiEeXDfvUPrCNH
	abcTai1jOV7tozPps4ZyvV1NoW9S4JrKt7SxJ
X-Google-Smtp-Source: AGHT+IFVU+i/PACo9p4/Bfxh1CqiMIWSQeR950pdjWP8hj1BhsXnC5rRHtunLNirP/Gyt4FL6G7AiU0HcN3VuQYeCls=
X-Received: by 2002:a05:622a:a313:b0:43f:ebce:be50 with SMTP id
 d75a77b69052e-43febcebe65mr835941cf.16.1717039638165; Wed, 29 May 2024
 20:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-4-jthoughton@google.com> <ZlejXCYIuJ7_DlwL@google.com>
In-Reply-To: <ZlejXCYIuJ7_DlwL@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 20:26:41 -0700
Message-ID: <CADrL8HUa9o+G6-Yn9oWt2LUgoVYGU=sYE2-JhkpoRgrS6Wi57g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] KVM: Add lockless memslot walk to KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_202720_847729_E961F6F7 
X-CRM114-Status: GOOD (  17.06  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMjo1MeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0LCBKYW1lcyBI
b3VnaHRvbiB3cm90ZToKPiA+IEBAIC02ODYsMTAgKzY5NCwxMiBAQCBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwK
PiA+ICAgICAgIHJldHVybiBfX2t2bV9oYW5kbGVfaHZhX3JhbmdlKGt2bSwgJnJhbmdlKS5yZXQ7
Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2
YV9yYW5nZV9ub19mbHVzaChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHN0YXJ0LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl9oYW5kbGVyX3QgaGFuZGxlcikKPiA+
ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5nZV9ub19mbHVz
aCgKPiA+ICsgICAgICAgICAgICAgc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gPiArICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZW5kLAo+ID4gKyAgICAgICAgICAgICBnZm5faGFuZGxlcl90IGhhbmRsZXIsCj4gPiArICAg
ICAgICAgICAgIGJvb2wgbG9ja2xlc3MpCj4KPiBVbm5lY2Vzc2FyeSBhbmQgdW53YW50ZWQgc3R5
bGUgY2hhbmdlLgoKU29ycnkgLS0gdGhpcyB3aWxsIGJlIGZpeGVkLgoKPgo+ID4gIHsKPiA+ICAg
ICAgIHN0cnVjdCBrdm0gKmt2bSA9IG1tdV9ub3RpZmllcl90b19rdm0obW4pOwo+ID4gICAgICAg
Y29uc3Qgc3RydWN0IGt2bV9tbXVfbm90aWZpZXJfcmFuZ2UgcmFuZ2UgPSB7Cj4gPiBAQCAtNjk5
LDYgKzcwOSw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGt2bV9oYW5kbGVfaHZhX3Jh
bmdlX25vX2ZsdXNoKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uCj4gPiAgICAgICAgICAgICAgIC5v
bl9sb2NrICAgICAgICA9ICh2b2lkICopa3ZtX251bGxfZm4sCj4gPiAgICAgICAgICAgICAgIC5m
bHVzaF9vbl9yZXQgICA9IGZhbHNlLAo+ID4gICAgICAgICAgICAgICAubWF5X2Jsb2NrICAgICAg
PSBmYWxzZSwKPiA+ICsgICAgICAgICAgICAgLmxvY2tsZXNzICAgICAgID0gbG9ja2xlc3MsCj4K
PiBXaHkgYWRkIEBsb2NrZXNzIHRvIGt2bV9oYW5kbGVfaHZhX3JhbmdlX25vX2ZsdXNoKCk/ICBC
b3RoIGNhbGxlcnMgaW1tZWRpYXRlbHkKPiBwYXNzICVmYWxzZSwgYW5kIGNvbmNlcHR1YWxseSwg
bG9ja2luZyBpcyBhbHdheXMgb3B0aW9uYWwgZm9yIGEgIm5vIGZsdXNoIiB2YXJpYW50LgoKUmln
aHQsIHRoaXMgaXNuJ3QgbmVlZGVkIGluIHRoaXMgcGF0Y2guIEJ1dCBJIHRoaW5rIEkgbmVlZCBp
dApldmVudHVhbGx5IChsaWtlLCBpbiB0aGUgbmV4dCBwYXRjaCksIHNvIEknbGwgbW92ZSBpdCB3
aGVyZSBpdCBpcwpyZWFsbHkgbmVlZGVkLgoKCgo+Cj4gPiAgICAgICB9Owo+ID4KPiA+ICAgICAg
IHJldHVybiBfX2t2bV9oYW5kbGVfaHZhX3JhbmdlKGt2bSwgJnJhbmdlKS5yZXQ7Cj4gPiBAQCAt
ODg5LDcgKzkwMCw4IEBAIHN0YXRpYyBpbnQga3ZtX21tdV9ub3RpZmllcl9jbGVhcl95b3VuZyhz
dHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiA+ICAgICAgICAqIGNhZGVuY2UuIElmIHdlIGZpbmQg
dGhpcyBpbmFjY3VyYXRlLCB3ZSBtaWdodCBjb21lIHVwIHdpdGggYQo+ID4gICAgICAgICogbW9y
ZSBzb3BoaXN0aWNhdGVkIGhldXJpc3RpYyBsYXRlci4KPiA+ICAgICAgICAqLwo+ID4gLSAgICAg
cmV0dXJuIGt2bV9oYW5kbGVfaHZhX3JhbmdlX25vX2ZsdXNoKG1uLCBzdGFydCwgZW5kLCBrdm1f
YWdlX2dmbik7Cj4gPiArICAgICByZXR1cm4ga3ZtX2hhbmRsZV9odmFfcmFuZ2Vfbm9fZmx1c2go
bW4sIHN0YXJ0LCBlbmQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAga3ZtX2FnZV9nZm4sIGZhbHNlKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBpbnQga3Zt
X21tdV9ub3RpZmllcl90ZXN0X3lvdW5nKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAo+ID4gQEAg
LTg5OSw3ICs5MTEsNyBAQCBzdGF0aWMgaW50IGt2bV9tbXVfbm90aWZpZXJfdGVzdF95b3VuZyhz
dHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiA+ICAgICAgIHRyYWNlX2t2bV90ZXN0X2FnZV9odmEo
YWRkcmVzcyk7Cj4gPgo+ID4gICAgICAgcmV0dXJuIGt2bV9oYW5kbGVfaHZhX3JhbmdlX25vX2Zs
dXNoKG1uLCBhZGRyZXNzLCBhZGRyZXNzICsgMSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBrdm1fdGVzdF9hZ2VfZ2ZuKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fdGVzdF9hZ2VfZ2ZuLCBmYWxzZSk7Cj4g
PiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBrdm1fbW11X25vdGlmaWVyX3JlbGVhc2Uoc3RydWN0
IG1tdV9ub3RpZmllciAqbW4sCj4gPiAtLQo+ID4gMi40NS4xLjI4OC5nMGUwY2QyOTlmMS1nb29n
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
