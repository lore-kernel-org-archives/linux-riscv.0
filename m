Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE4C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuuJ+QAe9b2odS12oSAu1Hjl2z3c+GEWVTMeq90PR44=; b=sag7lJCwQ62P7J
	/okYdgsxEJJ7hZ/yeJLOS3q3XDHRRR9KTM0qTfNVt9/hIR7oBRAWAOh3vxQVEp0H8wqFWXje4xlEC
	KUaz0bnIxyLmsHCKN0kkz+L4PT8K3FspWMgz6zjGtPBm4dqqWUP/509qk/R2W9sjSBRPFveKLYqN6
	B2i8zy77BwoTdNpJncIUZQFmcktuutncTClhV47ZeR32k3GURTT443EUAiT7XLt/YrUge5rYZLkLj
	dXOeRq9qH3BcAsoI0ZRqxI+WVAlY5towIPLqeH0/RiHuSDIXys8TBrD7AyjAL4YW2hGWgupqONO35
	VgcVeNxBfR/B6ffpBZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLIx-0068HS-2N;
	Wed, 02 Aug 2023 23:30:59 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLIt-0068F6-2z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 23:30:57 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-348c7075afcso30365ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691019052; x=1691623852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9p/r3/7OOEeGD98k45cJqzqj6mNEuBO34pHN8nni+M=;
        b=74I1bKG+cUGnNnM5v1W9CDg6dB5zyEzL79S4xKJ2+2Edhl1U9InloCoPEDOGpy0W5e
         QR6wX7vPxgrnBZLbn/tKyGzZ2MlFeiQsyr2vFDccoVJ7m/Et41Fwik9a3tcDOSbyQIuR
         8oT4GU9k50imuXJnxAIH/z9VasQzFEmdbm9IODpaRbsmmllM0tGn7Qs5IBsZz6xVKVvP
         7ID4x+7rgDFCZN8KN0W58Dk4u8Q17Vltew/Z4aGNGmxbWXmZmNShOKsgtQlIngeBh0Nr
         ErvAin+XghBxhi+3LCi+ulGJo6UBU5u0Y1VdpNZJnOjIdgB+FAs201GN7Q2Alq6seMV+
         zKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691019052; x=1691623852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9p/r3/7OOEeGD98k45cJqzqj6mNEuBO34pHN8nni+M=;
        b=Yagv6G142I/H18T4dSQxZIuA8HWf76zasMaqeB5g/8Z6Ty6rI52pSggYgBKbX48S+N
         GiNKBShXpw6PNYeV6GmZwWtuLCTfRHTs2dmc0SvBn+sCJ1uKx8G9GreL3YhfcKop2WTe
         6goCM3uVVcW5kNi/QkzcQfnPFRez+6AYzWVQdG7rUog9JQurBkc7FmQQwq27MAsSgMCR
         BHtzsEUzgxYYEovquBfKHGBKxrgkiw+FgbKFODLK3VD0vFR3jvLh0Sjs0/rEziXmCwop
         zAjqdLCj36aotck9yvcOZR5IijzixSrdLtz0dQHVgB1RAATf8skEP3szQpqJEQBnED+t
         hKhg==
X-Gm-Message-State: ABy/qLYHJlGyVjEdL8eUFbzwLcQjSULVZBKZF7M4lWiSzKqOEHnrugK4
	cKbdR1py7/90762g5qxGK2PRfdW5IEBASWmI9lTGDQ==
X-Google-Smtp-Source: APBJJlELAYNKKPfecK64fKx5Ci1HyUNKE08JkQGkdOgzq5gUkMmu0eZ6vl6aaIwqTlVQfSan7JpwYd6tPF2vIZQ+LNM=
X-Received: by 2002:a92:c54a:0:b0:340:502b:1487 with SMTP id
 a10-20020a92c54a000000b00340502b1487mr1178689ilj.12.1691019050973; Wed, 02
 Aug 2023 16:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org> <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
 <ZMgqueePlmKvgUId@google.com> <CAJHc60xM+KsUKxtoqORnpzrRke4T-sob2uLJRMvBKwruipxnpw@mail.gmail.com>
 <878ratqw2l.wl-maz@kernel.org> <ZMqABp6OdrgOtsum@google.com>
In-Reply-To: <ZMqABp6OdrgOtsum@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 2 Aug 2023 16:30:39 -0700
Message-ID: <CAJHc60zvKSoPU6uTzZQCY2ZAeVj18qmu3=U-rUt5er0zGLQ33Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_163055_971294_04A9D209 
X-CRM114-Status: GOOD (  15.28  )
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

T2theSwgc28ganVzdCB0aGUgI2RlZmluZSBpbiB0aGUgcmVzcGVjdGl2ZSBhcmNoIGhlYWRlciB3
aXRoIGEgZ2xvYmFsCmRlY2xhcmF0aW9uLiBJJ2xsIGNvbnNpZGVyIHRoaXMgaW4gdjguCgpUaGFu
a3MsClJhZ2hhdmVuZHJhCgpPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDk6MTDigK9BTSBTZWFuIENo
cmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAw
MiwgMjAyMywgTWFyYyBaeW5naWVyIHdyb3RlOgo+ID4gT24gVHVlLCAwMSBBdWcgMjAyMyAwMTo0
Mjo1NCArMDEwMCwKPiA+IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNv
bT4gd3JvdGU6Cj4gPiA+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb25zOyBJIGNhbiBnbyB3aXRo
IGEgY29tbW9uIGRlY2xhcmF0aW9uLiBBbG9uZwo+ID4gPiB3aXRoIHRoYXQsIGRvIHdlIHdhbnQg
dG8ga2VlcCBkZWZpbmluZwo+ID4gPiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMg
aW4gdGhlIGFyY2ggY29kZSB0aGF0IHN1cHBvcnRzIGl0IG9yCj4gPiA+IGNvbnZlcnQgaXQgaW50
byBhIENPTkZJR18/Cj4gPgo+ID4gVGhpcyBpc24ndCBzb21ldGhpbmcgdGhhdCBhIHVzZXIgY2Fu
IHNlbGVjdCwgbW9yZSBzb21ldGhpbmcgdGhhdCBpcyBhbgo+ID4gYXJjaGl0ZWN0dXJhbCBkZWNp
c2lvbi4gTWF5YmUgaW4gYSBsYXRlciBwYXRjaCBpZiB0aGVyZSBpcyBhIGNvbnNlbnN1cwo+ID4g
YXJvdW5kIHRoYXQsIGJ1dCBwcm9iYWJseSBub3QgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4KPgo+
ICsxLiAgSSBhZ3JlZSBpdCdzIGFubm95aW5nIHRoYXQgS1ZNIHVzZXMgYSBtaXggb2YgS2NvbmZp
Z3MgYW5kIG1hbnVhbCAjZGVmaW5lcwo+IGZvciB0aGUgdmFyaW91cyAiS1ZNX0hBVkUiIGtub2Jz
LCBidXQgd2UgaGF2ZSBzbyBtYW55IG9mIGJvdGggdGhhdCBvbmUtb2ZmCj4gY29udmVyc2lvbnMg
d2l0aG91dCBhIHJlYWwgbmVlZCBkb24ndCBtYWtlIG11Y2ggc2Vuc2UuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
