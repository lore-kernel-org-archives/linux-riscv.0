Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49DBC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 00:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X/3FSQZCdWcbHT41gWm7rUd4FcBIsupSCVKVHW+IcEM=; b=VX1cW53Cl5ev+rP7UBMqoEoa9Z
	+mZWGQ4+SKzM2fJXLXsCJ6Pcr52OXadfvFsMu45ax4tm+s/L7FZq/yYJ4fcyNYZ5QwYwr1RcgrNfc
	/Q1IEEtg1v248DGj0yGn93U/smZ33mBxuNtO3P1R98hh535yArtb6wc2gs33FfqdJ7BVVMYVmzdpX
	wIXEcWeCoiB9WpPzIkPJVFedRbFkhKcfrijn9U+c/Jb6hHzZQDI1hCktOU3gjq+WprTY9CDJKIXPO
	vBuYlml+ASfEzQzUL9AKqDLCxOsY+yZ9U/nPZKDWAy0LqkwyZBoAn63IqD0JT8Dd82XTXFzue2jwI
	vITwwcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEHxK-00000000j7x-2AZE;
	Tue, 04 Jun 2024 00:23:14 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEHxG-00000000j4z-05rI
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 00:23:12 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfa79b84623so5522275276.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 17:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717460588; x=1718065388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRuXM8qP8LdDvX6fn1r8scesSI9q9pU2JyFDr4cXXhA=;
        b=NCK+gAO8stENmQsjYQNejenTso0mPsUUrIcGxIy70mfYETQIJoiKU0aWy7JDn33qyk
         +X34ppOQOeKcNg22+E5m3UvmhosDwMNTCGJEunmab24MksUfOb5zj1pcozPRUPdiqB2k
         77lIejimnzhmXB3/uocik92DeU8FmgbjdHxKmG7OprTQ9UqLNhbubhUizYo/0wKFFafG
         wixxBLscTBBVBn6dh/9QUOp5GY4DyMeMK4tv/vWAUcmLRk9/roJVJyeRmvt5gfy4vaLx
         L2sjMoXI4iV9vWAd0aLkMKUcB/8J1rManezmdd4uX7r2azBik+fa/kEj58D4zdsomhoj
         9Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717460588; x=1718065388;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HRuXM8qP8LdDvX6fn1r8scesSI9q9pU2JyFDr4cXXhA=;
        b=eIt43vKA8FP0LMeZX8B2TVH3htX+C78ixG1B1Bd1pgYcBKYrtdzFxOMz8h/lYnROjk
         75TtrThoeUBJtPO/Hd3QuTlGumWzB3hosB676bB4KS4ZEXNDNJ/lCipd53wvognIS2rV
         PwKswlMe2C/cA5YmaGrziG/pkFAgJJdhKCIceHVx9DrOo6LbvYSbai+E6V+8mUHoyzFM
         C3Kh4CWKqzXmJvmlC6zZy88SW5Nv+6xLfnZ4BFTAz0YHxkRlDnBnOJHGNvVJSKiD4eOS
         sY0db/HW/wBaYf2P2u5+xpafs+WsaFxqx1r0zmIdOqloSBA6jKJhohw3hKEMuUDXWaCD
         HHYA==
X-Forwarded-Encrypted: i=1; AJvYcCVcE+FBm9rDx2pPVwVe9h6GN9ZmR9DrBK+Dti6ikUf9Wzs8654EjOO+OScHz4x1pexfsrOD4GmCLXj31N4lw5u+4I/dsNlagRCjBrz36Pxi
X-Gm-Message-State: AOJu0Yyvu3eLGgQjBKof2CaDcFx5FJNgDl39RxHqiXnecQqIbKqexq+c
	eBp+/VXOrJ+78gLHLO1YI2K4Qwq8BomsfMibVDE2lczxvLrKvqjSvNlGMAfz8djzWW8iMdhqVQe
	2cw==
X-Google-Smtp-Source: AGHT+IEk24C6d/QoiBbCyIExMW7OdPZLjaBEK4ZPTTj/IX3O1NfqjnOFuoealUEhXp84xV+hhBOGjvPTh7s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:707:b0:dfa:ba40:6f43 with SMTP id
 3f1490d57ef6-dfaba407295mr112473276.2.1717460587664; Mon, 03 Jun 2024
 17:23:07 -0700 (PDT)
Date: Mon, 3 Jun 2024 17:23:06 -0700
In-Reply-To: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
 <Zl5LqcusZ88QOGQY@google.com> <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Message-ID: <Zl5eat0sh7rrspUG@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_172310_082758_06BED63C 
X-CRM114-Status: GOOD (  13.53  )
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

T24gTW9uLCBKdW4gMDMsIDIwMjQsIEphbWVzIEhvdWdodG9uIHdyb3RlOgo+IE9uIE1vbiwgSnVu
IDMsIDIwMjQgYXQgNDowM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUu
Y29tPiB3cm90ZToKPiA+IEJ1dCBiZWZvcmUgd2UgZG8gdGhhdCwgSSB0aGluayB3ZSBuZWVkIHRv
IHBlcmZvcm0gZHVlIGRpbGVnZW5jZSAob3IgcHJvdmlkZSBkYXRhKQo+ID4gc2hvd2luZyB0aGF0
IGhhdmluZyBLVk0gdGFrZSBtbXVfbG9jayBmb3Igd3JpdGUgaW4gdGhlICJmYXN0IG9ubHkiIEFQ
SSBwcm92aWRlcwo+ID4gYmV0dGVyIHRvdGFsIGJlaGF2aW9yLiAgSS5lLiB0aGF0IHRoZSBhZGRp
dGlvbmFsIGFjY3VyYWN5IGlzIGluZGVlZCB3b3J0aCB0aGUgY29zdC4KPiAKPiBUaGF0IHNvdW5k
cyBnb29kIHRvIG1lLiBJJ2xsIGRyb3AgdGhlIEtjb25maWcuIEknbSBub3QgcmVhbGx5IHN1cmUK
PiB3aGF0IHRvIGRvIGFib3V0IHRoZSBzZWxmLXRlc3QsIGJ1dCB0aGF0J3Mgbm90IHJlYWxseSBh
bGwgdGhhdAo+IGltcG9ydGFudC4KCkVuYWJsZSBpdCBvbmx5IG9uIGFyY2hpdGVjdHVyZXMrc2V0
dXBzIHRoYXQgYXJlIGd1YXJhbnRlZWQgdG8gaW1wbGVtZW50IHRoZQpmYXN0LW9ubHkgQVBJPyAg
RS5nLiBvbiB4ODYsIGl0IGRhcm4gd2VsbCBiZXR0ZXIgYmUgYWN0aXZlIGlmIHRoZSBURFAgTU1V
IGlzCmVuYWJsZWQuICBJZiB0aGUgdGVzdCBmYWlscyBiZWNhdXNlIHRoYXQgZG9lc24ndCBob2xk
IHRydWUsIHRoZW4gd2UgX3dhbnRfIHRoZQpmYWlsdXJlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
