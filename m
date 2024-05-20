Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F7C25B79
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQqH51O4p6euZarRRcQ93F5cdzAS5aoiYsxgUqSI6f0=; b=sp2+hA+5jo4tp9
	WhGndolPsDgg556cwckM7kvVAUvQDk/DsvmipiiyoZM5z1EHM+j5qsbETLfF1UXJzEe1lUf1sklfE
	e96Mgdb8CtfUR4P9QWgegIsUnudoCeAFEvuqiBM8xICa3/WinXgcuftUZZxSBjzU1himsI/lea6fH
	x9GJGUmYx6UtczhYmgDfOmpSX7tZEAh2jTaRwDlJaLV8LzizKvf0Q+xp2AlhO1AGzlKOLLMNeg53v
	0qvoWXSM4DqGB7iiIQ7a4VG7RlipfAlu4RCEjoFjGBRohbEk+ZaklqvUD9ulOkZduuzQUv0pj46Q4
	DB7PGDoiLIU73YZWbS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94GP-0000000EjX7-1tRH;
	Mon, 20 May 2024 14:45:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94GM-0000000EjW1-0EIM
	for linux-riscv@lists.infradead.org;
	Mon, 20 May 2024 14:45:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so6689423a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 May 2024 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716216314; x=1716821114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeSLRL0OKsRhD4qQFOfBvy1JJv4XgJp3PPoxz2ixx5E=;
        b=AjqK3XKfSZ6IbYzXS288uItfBzZtTS2jf/dnphfIx/TnZcO4o6jafF8egY4yXABt2M
         5Vqqo2DRf6tnk4Gz3EbdwEj4uhIUz1EEU6i2DUt/qSpVPnl5mRkjijktUySF7y3Im+0d
         a9ZN0W+BAe6NdPR4gQfSzUrBmNIuqhtkCVgvQkJHEZIAHp18a3xXp09G0J0EUEChvrZO
         bKR8Qdzp575twUfPJ4NEoxSH6D3TKJ7RezCRzqcFhOnFuzj7oiC/Cp45YLk83lDWPh7k
         OxoPQqF8FwLwFzS3fDR8M3KYPu/V6NVujto1j3OQFCzPs84wCjG0aJCxitXx7sy9Hjzw
         NJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716216314; x=1716821114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeSLRL0OKsRhD4qQFOfBvy1JJv4XgJp3PPoxz2ixx5E=;
        b=BbYnLRpLprb9RmU6x84a6H9Zo1u2J6cg4eM2K6A59a1beUb31VJqE6z8mhdF2ADHRj
         XhS8IGc5uH+BjBuhA+J5UBdIQL3Dhp/TYI7ZOrNQCjTFKESV/aC2XbT6ZlVUH2Tgv2AJ
         F2eEaqxBccPTTQ011uchzBwp2S/261PwVG13VOQHaHkgwtsTl02kAbiv+R2fkLSPp1he
         rlV7bemB+uvDcAKeuanRayZT95R9D0SMJHJyzL/8v1E/KUpyzYr3acjQ+RiJev5rPyrg
         3VFD4Tqbry9LD9XD7TYgFZ5Hain6NxiHOg4a/YBnpjjAZrB4xDhpvJBWhgpgtWU+f5Yk
         VBzA==
X-Forwarded-Encrypted: i=1; AJvYcCWkmzyYHsRNR4cCyZl/iB35HOjeaq1pSEo5fNsvwRvp/1j4/G9jEda7jEecsSDTjoFOqdFnCKzBxRCiDzxgukMuL4fLDhmVreJvunl6opYF
X-Gm-Message-State: AOJu0YwHOgWEHi+SoO5u6ypXiA3LosrkIuDs5cXaH8bubw9IJix6JK5o
	P2U1X1frRIbrkEMpkSaY3XAvEzoIpNtARHiPkUafMnklV0v08m/dtloMMI6xiJHPUID1IkyCEAq
	QeYXKa4dmfOE+UVn0H6su5YV8aNU=
X-Google-Smtp-Source: AGHT+IGDDoObxx9h/znodmfXEVY75Zni6ttTKrQE+oaBai6EzaOM4y8AFd/boO5geigu1S0BoUNrW/+Xk2EHVDvwPRI=
X-Received: by 2002:a05:6402:3486:b0:574:ea61:3b01 with SMTP id
 4fb4d7f45d1cf-574ea613b99mr13223033a12.16.1716216314505; Mon, 20 May 2024
 07:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240518074914.52170-1-libang.li@antgroup.com> <20240518074914.52170-4-libang.li@antgroup.com>
In-Reply-To: <20240518074914.52170-4-libang.li@antgroup.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 20 May 2024 22:45:02 +0800
Message-ID: <CAK1f24=Cm--tn4MsxBQEoBV048OsrGGyVVsy0B2MT1VMn+YoBg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mm: Use update_mmu_tlb_range() to simplify code
To: Bang Li <libang.li@antgroup.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, ryan.roberts@arm.com, 
	libang.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_074518_119705_48D8CA6F 
X-CRM114-Status: GOOD (  15.15  )
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

T24gU2F0LCBNYXkgMTgsIDIwMjQgYXQgMzo1MeKAr1BNIEJhbmcgTGkgPGxpYmFuZy5saUBhbnRn
cm91cC5jb20+IHdyb3RlOgo+Cj4gTGV0IHVzIHNpbXBsaWZ5IHRoZSBjb2RlIGJ5IHVwZGF0ZV9t
bXVfdGxiX3JhbmdlKCkuCj4KCkxHVE0uClJldmlld2VkLWJ5OiBMYW5jZSBZYW5nIDxpb3dvcmtl
cjBAZ21haWwuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBCYW5nIExpIDxsaWJhbmcubGlAYW50Z3Jv
dXAuY29tPgo+IC0tLQo+ICBtbS9tZW1vcnkuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5
LmMgYi9tbS9tZW1vcnkuYwo+IGluZGV4IGVlYTZlNDk4NGVhZS4uMmQ1M2UyOWNmNzZlIDEwMDY0
NAo+IC0tLSBhL21tL21lbW9yeS5jCj4gKysrIGIvbW0vbWVtb3J5LmMKPiBAQCAtNDQyMSw3ICs0
NDIxLDYgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZG9fYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2Zh
dWx0ICp2bWYpCj4gICAgICAgICB2bV9mYXVsdF90IHJldCA9IDA7Cj4gICAgICAgICBpbnQgbnJf
cGFnZXMgPSAxOwo+ICAgICAgICAgcHRlX3QgZW50cnk7Cj4gLSAgICAgICBpbnQgaTsKPgo+ICAg
ICAgICAgLyogRmlsZSBtYXBwaW5nIHdpdGhvdXQgLT52bV9vcHMgPyAqLwo+ICAgICAgICAgaWYg
KHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpCj4gQEAgLTQ0OTEsOCArNDQ5MCw3IEBAIHN0YXRp
YyB2bV9mYXVsdF90IGRvX2Fub255bW91c19wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICAg
ICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYih2bWEsIGFkZHIsIHZtZi0+cHRlKTsKPiAgICAg
ICAgICAgICAgICAgZ290byByZWxlYXNlOwo+ICAgICAgICAgfSBlbHNlIGlmIChucl9wYWdlcyA+
IDEgJiYgIXB0ZV9yYW5nZV9ub25lKHZtZi0+cHRlLCBucl9wYWdlcykpIHsKPiAtICAgICAgICAg
ICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgdXBkYXRlX21tdV90bGIodm1hLCBhZGRyICsgUEFHRV9TSVpFICogaSwgdm1mLT5wdGUg
KyBpKTsKPiArICAgICAgICAgICAgICAgdXBkYXRlX21tdV90bGJfcmFuZ2Uodm1hLCBhZGRyLCB2
bWYtPnB0ZSwgbnJfcGFnZXMpOwo+ICAgICAgICAgICAgICAgICBnb3RvIHJlbGVhc2U7Cj4gICAg
ICAgICB9Cj4KPiAtLQo+IDIuMTkuMS42LmdiNDg1NzEwYgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
