Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5260C2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hQX2HpWR74XI3/kWntyXopA8mRGEmRvWqejPXRspObg=; b=jLKCcl5hMlTAkwJXOZGYl6q8D2
	y/MoNNVxgndwTz3lW2DcZgmwxAoW3z8a1ewTqP/hpv0Peo9JJ5Trr6em0mCksCe8Q7Anr78eZPQPr
	UTJeZhHhmZoCF9GAXbIOOS7nKpgJVVGujJsGb8PLx19ToSi7NyrSvnsEGuziNsBGhPnNOcLrBXJla
	/xsQiNTYMI4H7dmYK9OuhnPoIWJru7yqm2wHfWfUYzIeJu4OOf7YI4bOgQO06XlnoLLuvOJjDRSNA
	D+GoMLbsqekUosMdVawsRzJN4rACh7FKcQqE8+aniIAt9AkBVqVdiOJD2CWUQ2ZrwwgGE7ZC0/CAy
	WwI4/JjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLlg8-0000000HKny-25Jr;
	Mon, 24 Jun 2024 15:32:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLlg5-0000000HKmH-1S1a
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 15:32:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2c7d2380cb8so3818682a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719243140; x=1719847940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WawAVsLJ2wrVp06E1yLAnPzm2a05JueYQ9ExxNigc3k=;
        b=0/wo+ppheP2fkPy0zieksi98wEeRgNJ46QGG9IOpHuCI5kDhxi0tkpPj7dz4jDOGw2
         9WdVOa8tVVSYgUWKguTYge9jld7rLKgWpwl7tSC9tWnP1vllS5prhtHKAkqDahpIDpyr
         wLYtRA0++nhWasifCmVpERTgdHhpPch8tL08aBqx43ARb3U0CFhp7KaPgagxhE5d7hfk
         /hcriaS0dBLEwYfZrCdLltZqEKn9chsS6M930wWEQHHaiEnHvekYs134yKjvH9mosLzM
         Y6XB8N6baIUxXaOXNaKi8vGu78e0oYoNt+E8WC0OtmQur6zLi8IRblyxtf+3f6BeRLED
         UifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243140; x=1719847940;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WawAVsLJ2wrVp06E1yLAnPzm2a05JueYQ9ExxNigc3k=;
        b=olauum2hLUShkzqYlLgA3xW7VF5sL5UgO3tQ1kOkJN8KjBa0HdbhvyVSrmOpvq6HAm
         YKS8OHtv4K+josQ8b6Hy0P1Om6pdfzPsrzfv7iZHeU9vjNUsGhRlMLAxOkaMSHOZqwKy
         I7Eq0GAqKum99B3jk0IM28wHD/qEAiJYXGdoYqGV0cJlLq4IhE28Ex6v5+vrjRBgGrqx
         mwgFbPdIsetdjTl1w5m/hIdVoD7vutCWjlO6m18UdzJYu6K5rmmSJ6u+ssxa7Hbvz5eo
         5EPWbOjTmHkVHZPjf+sXcJRjMbD7hTpA/fyGDtrNyHq5W5tDLS9PDv2wswn3AqNvkc6y
         rO6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWoS/qc3ifcuGxavhT7RCVSXYRE/uOjk8OVbETUBrVM8z2ngOWp1P2UJFDgu9EXc3oi0SLUL85L6n6RSwkIIkGFKcIaLzxqh/o/+nGcTPI
X-Gm-Message-State: AOJu0Yy/+bUWsc0mAA6rQX1lI2FafOzN8RQoGn4tDDq8Ay6aD5fy3pkA
	Fgq3hGZMkFpanwylKFUu+BaHliz6ca9pKblHoYKPj/XI5cKQ/tZ2U4V5xYwLE2RrH2zbHO9JAOA
	/Eg==
X-Google-Smtp-Source: AGHT+IEtazAEW7Z9YwGGcKXL++Dckd0kAEwC6pBQKn1v/nxqOqzOdwWoLb56caKLmrQdFmUesETPkh89cIs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:2ecc:b0:2c6:d13f:3f9e with SMTP id
 98e67ed59e1d1-2c8489b9ed7mr123696a91.1.1719243139430; Mon, 24 Jun 2024
 08:32:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:32:18 -0700
In-Reply-To: <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
Message-ID: <ZnmRgqD6FmXNNzzI@google.com>
Subject: Re: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
From: Sean Christopherson <seanjc@google.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Anish Ghulati <aghulati@google.com>, 
	Venkatesh Srinivas <venkateshs@chromium.org>, Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_083221_411583_6D4E6D5B 
X-CRM114-Status: GOOD (  18.97  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQsIFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgd3JvdGU6Cj4g
PiBUaGlzIGlzIGEgYm9yZGVybGluZSBSRkMgc2VyaWVzIHRvIGhpZGUgS1ZNJ3MgaW50ZXJuYWxz
IGZyb20gdGhlIHJlc3Qgb2YKPiA+IHRoZSBrZXJuZWwsIHdoZXJlICJpbnRlcm5hbHMiIG1lYW5z
IGRhdGEgc3RydWN0dXJlcywgZW51bXMsICNkZWZpbmVzLAo+ID4gQVBJcywgZXRjLiB0aGF0IGFy
ZSBpbnRlbmRlZCB0byBiZSBLVk0tb25seSwgYnV0IGFyZSBleHBvc2VkIGV2ZXJ5d2hlcmUKPiA+
IGR1ZSB0byBrdm1faG9zdC5oIChhbmQgb3RoZXIgaGVhZGVycykgbGl2aW5nIGluIHRoZSBnbG9i
YWwgaW5jbHVkZSBwYXRocy4KPgo+IEhpIFNlYW4sCj4gCj4gSnVzdCB0aG91Z2h0IG9mIGNoZWNr
aW5nIHdpdGggeW91IG9uIHRoaXMgc2VyaWVzLiBEbyB5b3UgaGF2ZSBwbGFucyB0byByZXZpdmUg
dGhpcwo+IHNlcmllcz8KClllcCEKCj4gVGhlIHJlYXNvbiBJIGFtIGFza2luZyBpcywgb24gQVJN
NjQvS1ZNIHNpZGUgd2UgZG8gaGF2ZSBhIHJlcXVpcmVtZW50Cj4gdG8gc2hhcmUgdGhlIEtWTSBW
TUlEIHdpdGggU01NVVYzLiBQbGVhc2Ugc2VlIHRoZSBSRkMgSSBzZW50IG91dCBlYXJsaWVyIHRo
aXMKPiB5ZWFyWzFdLiBUaGUgc2VyaWVzIGJhc2ljYWxseSBwcm92aWRlcyBhIHdheSBmb3IgS1ZN
IHRvIHBpbiBhIFZNSUQgYW5kIGFsc28KPiBhc3NvY2lhdGVzIGFuIGlvbW11ZmQgY3R4IHdpdGgg
YSBzdHJ1Y3Qga3ZtICogdG8gcmV0cmlldmUgdGhhdCBWTUlELiAKPiAKPiBBcyBtZW50aW9uZWQg
YWJvdmUsIHNvbWUgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMoZXNwZWNpYWxseSAxLTQg
JiA2KSB0aGF0Cj4gZG9lcyB0aGUgVkZJTyBjbGVhbnVwcyBhbmQgZHJvcHBpbmcgQ09ORklHX0tW
TV9WRklPIGxvb2tzIHZlcnkgc3RyYWlnaHRmb3J3YXJkCj4gYW5kIHVzZWZ1bC4gSSBhbSB0aGlu
a2luZyBvZiBpbmNsdWRpbmcgdGhvc2Ugd2hlbiBJIHJlLXNwaW4gbXkgUkZDIHNlcmllcywgaWYK
PiB0aGF04oCZcyBvay4KClBsZWFzZSBkb24ndCBpbmNsdWRlIHRoZW0sIGFzIHRoZSBwYXRjaCB0
aGV5IGJ1aWxkIHRvd2FyZHMgKHBhdGNoIDUpIGlzIGJ1Z2d5WypdLAphbmQgSSBhbSBmYWlybHkg
Y2VydGFpbiB0aGF0IGF0IGxlYXN0IHNvbWUgb2YgdGhlIHBhdGNoZXMgd2lsbCBjaGFuZ2Ugc2ln
bmlmaWNhbnRseS4KCkkgZXhwZWN0IHRvIHJlLXN0YXJ0IHdvcmtpbmcgb24gdGhlIHNlcmllcyBp
biB+MiB3ZWVrcywgYW5kIGFtIHBsYW5uaW5nIG9uIGFjdGl2ZWx5CnB1c2hpbmcgdGhlIHNlcmll
cyAoaS5lLiBub3QgaWdub3JpbmcgaXQgZm9yIG1vbnRocyBvbiBlbmQpLgoKWypdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9aV3BfcTF3MDFOQ1ppOEtYQGdvb2dsZS5jb20KCj4gUGxlYXNl
IGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuCj4KPiBbMV0uIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWlvbW11LzIwMjQwMjA5MTE1ODI0LkdBMjkyMjQ0NkBteXJpY2EgCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
