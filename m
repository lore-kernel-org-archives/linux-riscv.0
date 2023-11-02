Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2186CC0018A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLES4htyDDp+ZkD9EhNCG5RhjU5CR54jEnMfytSI3pA=; b=hBjGqRfboQcZ+E
	Jl5fFlkF5ctw/4kSabaUXcxr90KEM+IMO1ubKfn0cwRUknPdzGZbIdkq5qW6VzVYYj/5sVNFrsY1b
	Bt8cYnCwmwr42jVh6VvxKXPm9EkMWRDBZc/yEhWxHBHaE66f5xrqp5xiI26ZRqIj7AiNZDvK2Ej6J
	P+xj+Ixdsyyb45vqUvsnbXqAiJYXr1uxGp7309Qi/+Uj0ZWPLU120K8Cu3OZDBVMUKj3qwTr5EIKa
	VkIaZe4sqcGH9vnJcgJfcnMvRZo2Qk4tGu8OjmUKUnNvn1O/LUddxgjSAj/fetirBav5l7x/DoGy/
	JptfNafTwiAb2PmBbQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYBM-009aEr-04;
	Thu, 02 Nov 2023 13:56:24 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYBI-009aDF-2R
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 13:56:22 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-66d0760cd20so8297776d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933379; x=1699538179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWVbaemD/Qn2/IvLfOB52rG+LgMP2W3NogibJrZTMZ4=;
        b=AdiBXjNQiUOvQCPUKwYgAcwmC+oMskr6mscJQpsoCsqRRziYnHBxMYzM1RkoCtkwRX
         qjAGNa3UM2cZw3v4TcDRyGf/mPOxIvDj53ChL7ELjZI5ZufPRjvV3+SH7dfiFvwXoVqN
         bTTR7z662Myr28V5Ga75kmuX8cXrCVqOWtZLnei+n9DKKo9/AtAG7bzELkait9h+i0JH
         MvEwp6rzkT0WAyya1kmzB2SxERL4c4riRm0RuBrDJBnVOeRr5dXuH8eVRr1ft3OG0V5h
         JMce8F9qZdm35Tla+DFxdeem2+QyLpbURghx9NdPOtCYvZ4XA58EGjJgvmqAXdU0ym97
         oyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933379; x=1699538179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWVbaemD/Qn2/IvLfOB52rG+LgMP2W3NogibJrZTMZ4=;
        b=gwUtq2WGu31QHEPgfszjaHvfGK7e62WUlk0e0Hi+1bUx0ckQL6okFtkpiH7F1+Fn1Y
         UwoSK73THgCHlA+AU0OqOL8ujbgVyWZyMSjMd49/1AEBcQIfvbxE+mDLmiufcbKkF2Lf
         OrfXFd5V09GmVwLkUWEdkwQK4hQS+xx2FWLownYakRAqh3WhfHWC0WomGCnqsNV+3V8N
         Eut66+lcjbbh/yL18jg82khtwuaNZ/9P5nVGz52dbYlw91xkHjnu+dwmUa4DZJ+P7JLa
         e/t1Ni66aTy6s7UQQ8DamxKlbi0Ni093PoWW2o43ElSxVKTJOxfniRstlfqmsjfOIPJH
         stjw==
X-Gm-Message-State: AOJu0Yxw/cSxhxEaQOUTB7zcz3CZZenaNBYvG6rzdOjlFG6wCn/XvHKl
	G7L7zlSwL8q6y5KsK46nCucN1w2OGwBsavciZRoq0Q==
X-Google-Smtp-Source: AGHT+IFRO7nq4nst6JF9hgQLfpXFHnQOjyBS3ejG9W5aUngaZEoEMY927pDB5PiH0nPNP2AZTqWUqRKAOoKphwpYQM4=
X-Received: by 2002:a05:6214:27ce:b0:66f:b9ef:9636 with SMTP id
 ge14-20020a05621427ce00b0066fb9ef9636mr10883504qvb.32.1698933378923; Thu, 02
 Nov 2023 06:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-12-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-12-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:55:42 +0000
Message-ID: <CA+EHjTzz2PftRAFU9pQaE1D=E3hwBDCDQpJ69O6r5akdAs0Exw@mail.gmail.com>
Subject: Re: [PATCH v13 11/35] KVM: Drop .on_unlock() mmu_notifier hook
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_065620_796030_48B69AC5 
X-CRM114-Status: GOOD (  20.15  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyMuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IERyb3AgdGhlIC5vbl91bmxvY2soKSBtbXVfbm90
aWZlciBob29rIG5vdyB0aGF0IGl0J3Mgbm8gbG9uZ2VyIHVzZWQgZm9yCj4gbm90aWZ5aW5nIGFy
Y2ggY29kZSB0aGF0IG1lbW9yeSBoYXMgYmVlbiByZWNsYWltZWQuICBBZGRpbmcgLm9uX3VubG9j
aygpCj4gYW5kIGludm9raW5nIGl0ICphZnRlciogZHJvcHBpbmcgbW11X2xvY2sgd2FzIGEgdGVy
cmlibGUgaWRlYSwgYXMgZG9pbmcgc28KPiByZXN1bHRlZCBpbiAub25fbG9jaygpIGFuZCAub25f
dW5sb2NrKCkgaGF2aW5nIGRpdmVyZ2VudCBhbmQgYXN5bW1ldHJpYwo+IGJlaGF2aW9yLCBhbmQg
c2V0IGZ1dHVyZSBkZXZlbG9wZXJzIHVwIGZvciBmYWlsdXJlLCBpLmUuIGFsbCBidXQgYXNrZWQg
Zm9yCj4gYnVncyB3aGVyZSBLVk0gcmVsaWVkIG9uIHVzaW5nIC5vbl91bmxvY2soKSB0byB0cnkg
dG8gcnVuIGEgY2FsbGJhY2sgd2hpbGUKPiBob2xkaW5nIG1tdV9sb2NrLgo+Cj4gT3Bwb3J0dW5p
c3RpY2FsbHkgYWRkIGEgbG9ja2RlcCBhc3NlcnRpb24gaW4ga3ZtX21tdV9pbnZhbGlkYXRlX2Vu
ZCgpIHRvCj4gZ3VhcmQgYWdhaW5zdCBmdXR1cmUgYnVncyBvZiB0aGlzIG5hdHVyZS4KPgo+IFJl
cG9ydGVkLWJ5OiBJc2FrdSBZYW1haGF0YSA8aXNha3UueWFtYWhhdGFAaW50ZWwuY29tPgo+IExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgwMjIwMzExOS5HQjIwMjE0MjJA
bHMuYW1yLmNvcnAuaW50ZWwuY29tCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8dGFi
YmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29tPgoK
Q2hlZXJzLAovZnVhZAoKPiAgdmlydC9rdm0va3ZtX21haW4uYyB8IDEzICsrKy0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBp
bmRleCAyYmMwNGM4YWUxZjQuLmNiOTM3NjgzM2MxOCAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9r
dm1fbWFpbi5jCj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC01NDQsNyArNTQ0LDYg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qga3ZtICptbXVfbm90aWZpZXJfdG9fa3ZtKHN0cnVjdCBt
bXVfbm90aWZpZXIgKm1uKQo+ICB0eXBlZGVmIGJvb2wgKCpnZm5faGFuZGxlcl90KShzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fZ2ZuX3JhbmdlICpyYW5nZSk7Cj4KPiAgdHlwZWRlZiB2b2lk
ICgqb25fbG9ja19mbl90KShzdHJ1Y3Qga3ZtICprdm0pOwo+IC10eXBlZGVmIHZvaWQgKCpvbl91
bmxvY2tfZm5fdCkoc3RydWN0IGt2bSAqa3ZtKTsKPgo+ICBzdHJ1Y3Qga3ZtX21tdV9ub3RpZmll
cl9yYW5nZSB7Cj4gICAgICAgICAvKgo+IEBAIC01NTYsNyArNTU1LDYgQEAgc3RydWN0IGt2bV9t
bXVfbm90aWZpZXJfcmFuZ2Ugewo+ICAgICAgICAgdW5pb24ga3ZtX21tdV9ub3RpZmllcl9hcmcg
YXJnOwo+ICAgICAgICAgZ2ZuX2hhbmRsZXJfdCBoYW5kbGVyOwo+ICAgICAgICAgb25fbG9ja19m
bl90IG9uX2xvY2s7Cj4gLSAgICAgICBvbl91bmxvY2tfZm5fdCBvbl91bmxvY2s7Cj4gICAgICAg
ICBib29sIGZsdXNoX29uX3JldDsKPiAgICAgICAgIGJvb2wgbWF5X2Jsb2NrOwo+ICB9Owo+IEBA
IC02NjMsMTEgKzY2MSw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUga3ZtX21uX3JldF90IF9f
a3ZtX2hhbmRsZV9odmFfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgaWYgKHJhbmdl
LT5mbHVzaF9vbl9yZXQgJiYgci5yZXQpCj4gICAgICAgICAgICAgICAgIGt2bV9mbHVzaF9yZW1v
dGVfdGxicyhrdm0pOwo+Cj4gLSAgICAgICBpZiAoci5mb3VuZF9tZW1zbG90KSB7Cj4gKyAgICAg
ICBpZiAoci5mb3VuZF9tZW1zbG90KQo+ICAgICAgICAgICAgICAgICBLVk1fTU1VX1VOTE9DSyhr
dm0pOwo+IC0gICAgICAgICAgICAgICBpZiAoIUlTX0tWTV9OVUxMX0ZOKHJhbmdlLT5vbl91bmxv
Y2spKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJhbmdlLT5vbl91bmxvY2soa3ZtKTsKPiAt
ICAgICAgIH0KPgo+ICAgICAgICAgc3JjdV9yZWFkX3VubG9jaygma3ZtLT5zcmN1LCBpZHgpOwo+
Cj4gQEAgLTY4Nyw3ICs2ODIsNiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFu
ZGxlX2h2YV9yYW5nZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgICAgICAgICAgICAgICAg
LmFyZyAgICAgICAgICAgID0gYXJnLAo+ICAgICAgICAgICAgICAgICAuaGFuZGxlciAgICAgICAg
PSBoYW5kbGVyLAo+ICAgICAgICAgICAgICAgICAub25fbG9jayAgICAgICAgPSAodm9pZCAqKWt2
bV9udWxsX2ZuLAo+IC0gICAgICAgICAgICAgICAub25fdW5sb2NrICAgICAgPSAodm9pZCAqKWt2
bV9udWxsX2ZuLAo+ICAgICAgICAgICAgICAgICAuZmx1c2hfb25fcmV0ICAgPSB0cnVlLAo+ICAg
ICAgICAgICAgICAgICAubWF5X2Jsb2NrICAgICAgPSBmYWxzZSwKPiAgICAgICAgIH07Cj4gQEAg
LTcwNiw3ICs3MDAsNiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2
YV9yYW5nZV9ub19mbHVzaChzdHJ1Y3QgbW11X25vdGlmaWVyICptbgo+ICAgICAgICAgICAgICAg
ICAuZW5kICAgICAgICAgICAgPSBlbmQsCj4gICAgICAgICAgICAgICAgIC5oYW5kbGVyICAgICAg
ICA9IGhhbmRsZXIsCj4gICAgICAgICAgICAgICAgIC5vbl9sb2NrICAgICAgICA9ICh2b2lkICop
a3ZtX251bGxfZm4sCj4gLSAgICAgICAgICAgICAgIC5vbl91bmxvY2sgICAgICA9ICh2b2lkICop
a3ZtX251bGxfZm4sCj4gICAgICAgICAgICAgICAgIC5mbHVzaF9vbl9yZXQgICA9IGZhbHNlLAo+
ICAgICAgICAgICAgICAgICAubWF5X2Jsb2NrICAgICAgPSBmYWxzZSwKPiAgICAgICAgIH07Cj4g
QEAgLTgxMyw3ICs4MDYsNiBAQCBzdGF0aWMgaW50IGt2bV9tbXVfbm90aWZpZXJfaW52YWxpZGF0
ZV9yYW5nZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgICAgICAgICAgICAgICAg
LmVuZCAgICAgICAgICAgID0gcmFuZ2UtPmVuZCwKPiAgICAgICAgICAgICAgICAgLmhhbmRsZXIg
ICAgICAgID0ga3ZtX21tdV91bm1hcF9nZm5fcmFuZ2UsCj4gICAgICAgICAgICAgICAgIC5vbl9s
b2NrICAgICAgICA9IGt2bV9tbXVfaW52YWxpZGF0ZV9iZWdpbiwKPiAtICAgICAgICAgICAgICAg
Lm9uX3VubG9jayAgICAgID0gKHZvaWQgKilrdm1fbnVsbF9mbiwKPiAgICAgICAgICAgICAgICAg
LmZsdXNoX29uX3JldCAgID0gdHJ1ZSwKPiAgICAgICAgICAgICAgICAgLm1heV9ibG9jayAgICAg
ID0gbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSksCj4gICAgICAgICB9Owo+IEBA
IC04NTgsNiArODUwLDggQEAgc3RhdGljIGludCBrdm1fbW11X25vdGlmaWVyX2ludmFsaWRhdGVf
cmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4KPiAgdm9pZCBrdm1fbW11X2lu
dmFsaWRhdGVfZW5kKHN0cnVjdCBrdm0gKmt2bSkKPiAgewo+ICsgICAgICAgbG9ja2RlcF9hc3Nl
cnRfaGVsZF93cml0ZSgma3ZtLT5tbXVfbG9jayk7Cj4gKwo+ICAgICAgICAgLyoKPiAgICAgICAg
ICAqIFRoaXMgc2VxdWVuY2UgaW5jcmVhc2Ugd2lsbCBub3RpZnkgdGhlIGt2bSBwYWdlIGZhdWx0
IHRoYXQKPiAgICAgICAgICAqIHRoZSBwYWdlIHRoYXQgaXMgZ29pbmcgdG8gYmUgbWFwcGVkIGlu
IHRoZSBzcHRlIGNvdWxkIGhhdmUKPiBAQCAtODg5LDcgKzg4Myw2IEBAIHN0YXRpYyB2b2lkIGt2
bV9tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQoc3RydWN0IG1tdV9ub3RpZmllciAq
bW4sCj4gICAgICAgICAgICAgICAgIC5lbmQgICAgICAgICAgICA9IHJhbmdlLT5lbmQsCj4gICAg
ICAgICAgICAgICAgIC5oYW5kbGVyICAgICAgICA9ICh2b2lkICopa3ZtX251bGxfZm4sCj4gICAg
ICAgICAgICAgICAgIC5vbl9sb2NrICAgICAgICA9IGt2bV9tbXVfaW52YWxpZGF0ZV9lbmQsCj4g
LSAgICAgICAgICAgICAgIC5vbl91bmxvY2sgICAgICA9ICh2b2lkICopa3ZtX251bGxfZm4sCj4g
ICAgICAgICAgICAgICAgIC5mbHVzaF9vbl9yZXQgICA9IGZhbHNlLAo+ICAgICAgICAgICAgICAg
ICAubWF5X2Jsb2NrICAgICAgPSBtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSwK
PiAgICAgICAgIH07Cj4gLS0KPiAyLjQyLjAuODIwLmc4M2E3MjFhMTM3LWdvb2cKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
