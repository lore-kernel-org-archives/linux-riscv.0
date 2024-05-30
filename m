Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622DFC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 03:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f70ZidJXCafMAg0QQfSaqJykuQyo28nUjEJ6hC6TE24=; b=r6R8577ys1Gmvv
	rA6cU9jZP9ni/wxJRBzKVC7jVhKToR/552IIuWvmnURF6ePWqLot3phHNWOvvbJlS/gMuHpTFKZmp
	RL94DG86txehcce8xuuFtVTXIVkGQLCczEiz8jSXXofcTITjAJj50kQNIy63hzKoJn4WHY8ZNmB4I
	bdWq2eOGIqI7m0Sy2tV+evv16jSmHtGidiHOlodvism+8KXn2gGiU4rqiggtSQekYMUAw5SJ+S23m
	zoNmAGYpVkemaEyVFAoETBkqi/d+62+mzzCw2C/tT0QcW7Sas67BJfjut0hgn0Dr/mWgGoOEIorpy
	pcFneN/L0wRTHdHvVHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWSr-00000006Byc-3H4N;
	Thu, 30 May 2024 03:28:29 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWSm-00000006BuB-3Jak
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 03:28:27 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-43fe3289fc5so118541cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717039702; x=1717644502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyFUQdvGKe8UpOcfXmkz33OD4v6xcNcft6Wk6HjbLrw=;
        b=M6cbfFneVkIt2SrODbCzHAqbVmybQn3VXNqyHkcNjUv4U51rFxw5a2hMkNh1Zv6mpl
         2fCYyo1zsXtSmZn/q0yRfxXU2f7UF1c3uDtpOHUkb2bxBKUbDSMn/yqCCns++uEJvLug
         0LFdpvGOTRmZhhJUPQZD4uENogxo2ZgS//k5Ben62UGw+yZJ19MqMW9jtUr4tif90gML
         ZsaVZJgy77HjpV863BBlvOl068kPXZ2eGSF2PIvXPGo1rKq3mpTi8p5A3WxAYepWNbDB
         3kkwl7Ld0+OXW1n7Tw++X+wrT8IkUqgZaYseB/Ruk9n9tbtZfcNRgDZwAXu2naf5wuXS
         p7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717039702; x=1717644502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyFUQdvGKe8UpOcfXmkz33OD4v6xcNcft6Wk6HjbLrw=;
        b=G2HWu62HQUrNQPQoe+i2lOHcuEFz4ehZjmSj3O5wIoA9FnEr5xH9eEX19mePoRmnd7
         jkiKS8gA9uKDQyMyr9q+kfCis1OVfP36+27rbw7YJVVZ3FVVfuNZ3LONILtD9NY2RkND
         319H1xZYp4lAjXZCOEk79amgxKiAP0dqhKya7b95kF8Hhb5mRcW4cGhVva49IfbX3jsv
         KhcNmic197jbX8ideFlK+CbBpyx73QZo57IWz/FnOOWvV4M5M0VWYEMOvaUzYHN2SwIb
         kAExPbPSAtY+6EW3Xl9hvasszmINBwhfhCxnaybPMEUMc/kRLTMEt/aNAoTAyIUdTaXK
         Ac3g==
X-Forwarded-Encrypted: i=1; AJvYcCWpCa8zop+Y5ocFWRIUC6mI8hJKwiDdHC36uvqOH4P5s8z/3zHhRa9OK83xY37Hz1j7xpmfeKFCembaTcUHkRMBwMGshQIuvduFX+tzGR3r
X-Gm-Message-State: AOJu0Yy5NbOUi42TqRfA2wh02mFnlYyKLLWbZw/KpgwnGWOXBRRdFkeZ
	r1uu9bXOr70f8wGjzIoTOs87dlnhKkAIK0QlZBFg6txlQqMmW0i4HvsAtYOHanpGKT/zYGWPKq/
	eNptEzsQdTBJHZ9vrW9oClL2M+JUN7/oeMliT
X-Google-Smtp-Source: AGHT+IGBhNbFRaaD0WOEIsVSMflxCvd13kkSSK1hcGeX1B4TzLlXvTq7xC3rTsBmGx8uhqPHEIa2GYmfEXsD+JkYxAs=
X-Received: by 2002:a05:622a:90e:b0:43e:cb4:1d10 with SMTP id
 d75a77b69052e-43fe8e5f830mr1851431cf.14.1717039701993; Wed, 29 May 2024
 20:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-5-jthoughton@google.com> <ZlekYljG7KJwblUj@google.com>
In-Reply-To: <ZlekYljG7KJwblUj@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 20:27:45 -0700
Message-ID: <CADrL8HVZxoO33F2UJBoTjF_SXpxyZmH=RTM5G3stgo_kRPjazA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
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
X-CRM114-CacheID: sfid-20240529_202824_924463_5917C834 
X-CRM114-Status: GOOD (  12.45  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMjo1NeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0LCBKYW1lcyBI
b3VnaHRvbiB3cm90ZToKPiA+IEZvciBpbXBsZW1lbnRhdGlvbiBtbXVfbm90aWZpZXJfe3Rlc3Qs
Y2xlYXJ9X3lvdW5nLCB0aGUgS1ZNIG1lbXNsb3QKPiA+IHdhbGtlciB1c2VkIHRvIHRha2UgdGhl
IE1NVSBsb2NrIGZvciB1cy4gTm93IG1ha2UgdGhlIGFyY2hpdGVjdHVyZXMKPiA+IHRha2UgaXQg
dGhlbXNlbHZlcy4KPgo+IEhtbSwgKmZvcmNpbmcqIGFyY2hpdGVjdHVyZXMgdG8gdGFrZSBtbXVf
bG9jayBpcyBhIHN0ZXAgYmFja3dhcmRzLiAgUmF0aGVyIHRoYW4KPiBhZGQgYWxsIG9mIHRoaXMg
Y2h1cm4sIHdoYXQgYWJvdXQgYWRkaW5nIENPTkZJR19LVk1fTU1VX05PVElGSUVSX0xPQ0tMRVNT
LCBlLmcuCj4KPiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5n
ZV9ub19mbHVzaChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZW5kLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl9oYW5kbGVyX3QgaGFuZGxlcikKPiB7Cj4gICAg
ICAgICBzdHJ1Y3Qga3ZtICprdm0gPSBtbXVfbm90aWZpZXJfdG9fa3ZtKG1uKTsKPiAgICAgICAg
IGNvbnN0IHN0cnVjdCBrdm1fbW11X25vdGlmaWVyX3JhbmdlIHJhbmdlID0gewo+ICAgICAgICAg
ICAgICAgICAuc3RhcnQgICAgICAgICAgPSBzdGFydCwKPiAgICAgICAgICAgICAgICAgLmVuZCAg
ICAgICAgICAgID0gZW5kLAo+ICAgICAgICAgICAgICAgICAuaGFuZGxlciAgICAgICAgPSBoYW5k
bGVyLAo+ICAgICAgICAgICAgICAgICAub25fbG9jayAgICAgICAgPSAodm9pZCAqKWt2bV9udWxs
X2ZuLAo+ICAgICAgICAgICAgICAgICAuZmx1c2hfb25fcmV0ICAgPSBmYWxzZSwKPiAgICAgICAg
ICAgICAgICAgLm1heV9ibG9jayAgICAgID0gZmFsc2UsCj4gICAgICAgICAgICAgICAgIC5sb2Nr
bGVzcyAgICAgICA9IElTX0VOQUJMRUQoQ09ORklHX0tWTV9NTVVfTk9USUZJRVJfTE9DS0xFU1Mp
LAo+ICAgICAgICAgfTsKPgo+ICAgICAgICAgcmV0dXJuIF9fa3ZtX2hhbmRsZV9odmFfcmFuZ2Uo
a3ZtLCAmcmFuZ2UpLnJldDsKPiB9CgpUaGFua3MgU2VhbiwgeWVzIHRoaXMgaXMgYSBsb3QgYmV0
dGVyLiBJIHdpbGwgZG8gdGhpcyBmb3IgdjUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
