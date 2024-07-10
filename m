Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99477C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KkWER4FqHswXMFPtKIBpYLxYup/Vxu5A4n5UUbc8Qig=; b=328K7ra7aaSPGgKLiOD4BeXZmH
	QVTfgLPzeKmTwHwEp83hQO0LK1ShoOAC3Cgj4FkYiLLzrND9rKB2Lh6MdhE6p2MDqFMdsITqSOEYZ
	3ToyOvkkenLbIMZxTnhquW6b1uCZjJHRbwVVSUxQhsqZxTqGAFBV6CnjxuIkgjtQirQLMlPj9iVlU
	SbM8mDTMJgqXrRK7OXBr08N4MeMppMU4U8VC9DLjFp2Om1x2shdOkS1uMJvb9lWRShANN4cfRMOnN
	EYMQ6y8J/PxMzoD6X7aQo4AhsWn5ngk+8CgzgXh9CFvEwfui02r8bupvPPMZs1pArLl7uhMQP1SUQ
	+/y1H6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZc4-0000000B1Pe-1koF;
	Wed, 10 Jul 2024 15:52:12 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZbn-0000000B1Lm-0HEi
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 15:51:57 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1faf6103680so32431085ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720626713; x=1721231513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2S/Ws8T8aRzTnaLMwEZxjsu7iN6mSUkQ05y/iw/B/rc=;
        b=weEUKlssUu+BRPlrudJBBjLR2jW/GiCfJGONVchQJyq1a9aO7sJ3MaOKd3Ixm7WArM
         rtZrBldXbmoTW8neXvmw2YyUsK2prlT1j8AS7SXu1JId5CGLS1qXJVFmumIzWmt18Nwu
         TCKXFGhOgSRyKo/RFbh+tSVstRbaApWuUVDWb/5IiQEji+wGUeYtUlsY3gV6aLyFwi0N
         if7jpFdZCfcU03Ob9qV+ZlME3xDe/kDj92KVF8IW1GbCVFXVKeIEVevas7a2mrKEZw5a
         T/42xbvGj3Ypg2XTzKRXFmIwMU17X1M/qjV8I7/qYlX3MIVu1KjY494+0LcIuxSYPp9+
         n3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626713; x=1721231513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2S/Ws8T8aRzTnaLMwEZxjsu7iN6mSUkQ05y/iw/B/rc=;
        b=Mo0MEuCoUgFuT0cjJ5PsP+6+Fd8GKAtcsYtCIgXwAVzVfa5AIBBLQdVIlEg9Jutswr
         W/+djrsSwpawAJncKb7+4LyzNkAgT9IyVtn7GtEO9T48ypRShglkfr/qpDGGnN/fgvo9
         tsCna1cu1t4i/olxce0K3N9YjIHSeUHOhZA3yBYRCqFGWz+5aynrmZoFCPCmKFz/Ptgf
         BV4ScJ0V+9v4Mn39Z4Eqt01uRCq9NdcDfJw6UazvmNIRqIDukrOHDe8hJIlK4pRdxner
         gQV7LlCIsOj+9owhMjYn7HcrKbpdflKvmP11AlQrVYmIdpFu1uAs/PqG95AZX0vZVA2S
         Ouwg==
X-Forwarded-Encrypted: i=1; AJvYcCVU6YkDzzo5XHqK8BfK5uigL2HmfjM/FagGa6Lbjh2R8T0Z2hcpwHEnDWY+m/W4csOBJYdXqeZ7EPqRdY2bkJr2HexsBLkUkWfugCoDGSMk
X-Gm-Message-State: AOJu0Yy8RvvR6xHHh3mNoxX7M6swBb5GmtWW4Ovg+vIJM8RF4rcDwwIp
	FT1Qu5tNNjSdxhW+4XpDTdDiVsss9XFYO85ywP8IMH7R6G4P2bN/Ok9LvJk0ZKCeku0/aWC7oON
	t2Q==
X-Google-Smtp-Source: AGHT+IGFDWyL4oVIv+kd3eR4ozKAgHx5u/arXUHJsTVnFMVwi1+9LesGIr7Enb4S0IMxOwQQwYsx6SyO0KU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dad2:b0:1f7:175a:69ab with SMTP id
 d9443c01a7336-1fbb6ce3e7dmr4023085ad.4.1720626712651; Wed, 10 Jul 2024
 08:51:52 -0700 (PDT)
Date: Wed, 10 Jul 2024 08:51:51 -0700
In-Reply-To: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
 <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Message-ID: <Zo6uFz187FBYnQiY@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_085155_118396_DDB95B55 
X-CRM114-Status: GOOD (  19.64  )
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

T24gTW9uLCBKdWwgMDEsIDIwMjQsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MTgsIDIwMjQgYXQgMjo0MeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUu
Y29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIDAzIE1heSAyMDI0IDExOjE3OjMxIC0wNzAwLCBE
YXZpZCBNYXRsYWNrIHdyb3RlOgo+ID4gPiBUaGlzIHNlcmllcyBjaGFuZ2VzIEtWTSB0byBtYXJr
IGEgdkNQVSBhcyBwcmVlbXB0ZWQvcmVhZHkgaWYtYW5kLW9ubHktaWYKPiA+ID4gaXQncyBzY2hl
ZHVsZWQgb3V0IHdoaWxlIHJ1bm5pbmcuIGkuZS4gRG8gbm90IG1hcmsgYSB2Q1BVCj4gPiA+IHBy
ZWVtcHRlZC9yZWFkeSBpZiBpdCdzIHNjaGVkdWxlZCBvdXQgZHVyaW5nIGEgbm9uLUtWTV9SVU4g
aW9jdGwoKSBvcgo+ID4gPiB3aGVuIHVzZXJzcGFjZSBpcyBkb2luZyBLVk1fUlVOIHdpdGggaW1t
ZWRpYXRlX2V4aXQ9dHJ1ZS4KPiA+ID4KPiA+ID4gVGhpcyBpcyBhIGxvZ2ljYWwgZXh0ZW5zaW9u
IG9mIGNvbW1pdCA1NGFhODNjOTAxOTggKCJLVk06IHg4NjogZG8gbm90Cj4gPiA+IHNldCBzdC0+
cHJlZW1wdGVkIHdoZW4gZ29pbmcgYmFjayB0byB1c2VyIHNwYWNlIiksIHdoaWNoICBzdG9wcGVk
Cj4gPiA+IG1hcmtpbmcgYSB2Q1BVIGFzIHByZWVtcHRlZCB3aGVuIHJldHVybmluZyB0byB1c2Vy
c3BhY2UuIEJ1dCBpZiB1c2Vyc3BhY2UKPiA+ID4gaW52b2tlcyBhIEtWTSB2Q1BVIGlvY3RsKCkg
dGhhdCBnZXRzIHByZWVtcHRlZCwgdGhlIHZDUFUgd2lsbCBiZSBtYXJrZWQKPiA+ID4gcHJlZW1w
dGVkL3JlYWR5LiBUaGlzIGlzIGFyZ3VhYmx5IGluY29ycmVjdCBiZWhhdmlvciBzaW5jZSB0aGUg
dkNQVSB3YXMKPiA+ID4gbm90IGFjdHVhbGx5IHByZWVtcHRlZCB3aGlsZSB0aGUgZ3Vlc3Qgd2Fz
IHJ1bm5pbmcsIGl0IHdhcyBwcmVlbXB0ZWQKPiA+ID4gd2hpbGUgZG9pbmcgc29tZXRoaW5nIG9u
IGJlaGFsZiBvZiB1c2Vyc3BhY2UuCj4gPiA+Cj4gPiA+IFsuLi5dCj4gPgo+ID4gQXBwbGllZCB0
byBrdm0teDg2IGdlbmVyaWMsIHdpdGggbWlub3IgY2hhbmdlbG9nIHR3ZWFrcyAobWUgdGhpbmtz
IHlvdSd2ZSBiZWVuCj4gPiBhd2F5IGZyb20gdXBzdHJlYW0gdG9vIGxvbmcgOy0pICkuICBUaGFu
a3MhCj4gCj4gVGhhbmtzIGZvciB0aGUgY2xlYW51cHMuIExvb2tzIGxpa2UgeW91IHJlcGxhY2Vk
ICJbVHRdaGlzIGNvbW1pdCIKPiB0aHJvdWdob3V0LiBBbnl0aGluZyBlbHNlIChzbyBJIGNhbiBh
dm9pZCB0aGUgc2FtZSBtaXN0YWtlcyBpbiB0aGUKPiBmdXR1cmUpPwoKSSBkb24ndCB0aGluayBz
bz8gIFRoZSAiVGhpcyBjb21taXQiIHN0dWZmIGlzIHRoZSBvbmx5IHRoaW5nIHRoYXQgSSByZW1l
bWJlciwgc28KYW55IG90aGVyIHR3ZWFrcyBjYW4ndCBiZSB0aGF0IGltcG9ydGFudCA6LSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
