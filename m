Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B83C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt4M6QrSn40VbpLk1IbZ+Vo1dHXpgKQkDD0Xip1b5UA=; b=iLqYaVqPj3Hgfj
	1Ig5nfDp+29v4SuvkqAVEIcXZb4vtfM1QAG28fxg2fQXjBtsOaOWhJftJVMDBstG5PZgdQOPlJaRQ
	zWqYpOLr8QLMWH4WqIFdmn9tLmA7taNOCveYA15Y+FYSE4pShENBnqPz+d3pEvSEMDsyuprxxiIW7
	AMoF1iif4LOwhD6grfZrjJ2RQTDst3VGd7lpjOfM+LxuwZ6VnW9IRJ72sON6CYp9oVtiC4bZViiSw
	9rj8oB4YsEG/I9ZDmDNyiisbLQKCXQqWgm4zxZl6rmMZJMqn8JYBgJ6KKIR5CEeEpwq04IoW7gJWK
	WHgiIQdVoANX8SU8+hgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRzOQ-00CynO-21;
	Fri, 04 Aug 2023 18:19:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRzOO-00Cyly-19
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 18:19:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc0075ab7aso18185ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691173154; x=1691777954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfl7UJxUbxuUeTFoCKSsO/YqaEDE5S858pqTp5fgS00=;
        b=uCBp75tLHriee//ikoqX2p7GjimbkirtfpIc8u1w4o4rJ5LjqEB3KYoXAiKiKEJ1MF
         DotbslqYm5Nhe3DYQsDTksQT7Her1ubNthHRWCzWT4FlTQfKRzfdCp6TYxeevDR31fvW
         0zyetWbMhkUr7qGOnjI6KiEqxCz6dPc2GmSHje5ATyYxqrTq6lSL+WS1dI0HHL++kfX8
         D+v4noCZoArF+1sIIwVhIBcDOTPnV5jsidMUaZYjedfSrLAc1z5UsqyKSi4/1p+Jm50S
         Tm2k90LzEhrYGbndJU95LHQSily8ML2kCFE6HRvTt1LMGvaeA2yRRJSEA2PA7YMzA0vp
         Y3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173154; x=1691777954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfl7UJxUbxuUeTFoCKSsO/YqaEDE5S858pqTp5fgS00=;
        b=Gl33nsNMVQ+aISdAStxfqwtBy+k3zkT7Vve4zwea7j09w55n9s6PcofKjIZKhCt/TD
         eyK0beOl8j9qywP1134Ht9WSi6Z8J3Tms4bIYQRdLQp3qUSZztfEDYvH7FVC8C+OdTZX
         tqPZkBvJPzqTMQ4ikhXhC0LnOAoHXukl54I1W3STmBjG4cGt7au37U9egF8sPiwEmaW3
         77WJ5MF4SBdLenQCBz0Gi5H7pbzeyIoVJvpnMaz/XXq+2XZTM9Ugv3OWKapJGmBMTUHk
         WOOdXlheDgTs2naLP9D8NeZn7ESyVUPZSmTEMVDNiQdZ2Ihc1EhIU+FqWirS9F18YtkQ
         WOCA==
X-Gm-Message-State: AOJu0YwUKRU9ScPzhANjcqcdUwIsX6yly05OO7FcJhFjRny2bM821l0a
	GIRspGK6hWBOeDJkCMhl7jvMqemWA1ATWdCUFACNeA==
X-Google-Smtp-Source: AGHT+IFFuspIZOGK/w9Z6kR37S5PKecewC+tAEgC1N9zpe8mnYVma9ptD/pOi27s4N+BxyB/wElI7D/qTwtc1r+Abqc=
X-Received: by 2002:a17:902:c409:b0:1a9:bb1d:64e with SMTP id
 k9-20020a170902c40900b001a9bb1d064emr24172plk.15.1691173154182; Fri, 04 Aug
 2023 11:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
In-Reply-To: <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 4 Aug 2023 11:19:02 -0700
Message-ID: <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_111916_394367_D01CA870 
X-CRM114-Status: GOOD (  22.14  )
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCA0OjI44oCvUE0gUmFnaGF2ZW5kcmEgUmFvIEFuYW50YQo8
cmFuYW50YUBnb29nbGUuY29tPiB3cm90ZToKPgo+IFN1cmUsIEknbGwgY2hhbmdlIGl0IHRvIGt2
bV9hcmNoX2ZsdXNoX3ZtX3RsYnMoKSBpbiB2OC4KPgpXaGlsZSB3b3JraW5nIG9uIHRoZSByZW5h
bWluZywgSSByZWFsaXplZCB0aGF0IHNpbmNlIHRoaXMgZnVuY3Rpb24gaXMKY2FsbGVkIGZyb20g
a3ZtX21haW4uYydzIGt2bV9mbHVzaF9yZW1vdGVfdGxicygpLiBEbyB3ZSB3YW50IHRvIHJlbmFt
ZQp0aGlzIGFuZCB0aGUgb3RoZXIga3ZtX2ZsdXNoXyooKSBmdW5jdGlvbnMgdGhhdCB0aGUgc2Vy
aWVzIGludHJvZHVjZXMKdG8gbWF0Y2ggdGhlaXIga3ZtX2FyY2hfZmx1c2hfKigpIGNvdW50ZXJw
YXJ0cz8gIChzcGlyYWxpbmcgbW9yZSBpbnRvCnRoaXMsIHdlIGFsc28gaGF2ZSB0aGUgJ3JlbW90
ZV90bGJfZmx1c2hfcmVxdWVzdHMnIGFuZAoncmVtb3RlX3RsYl9mbHVzaCcgc3RhdHMpCgpUaGFu
ayB5b3UuClJhZ2hhdmVuZHJhCgo+IFRoYW5rcywKPiBSYWdoYXZlbmRyYQo+Cj4gT24gV2VkLCBB
dWcgMiwgMjAyMyBhdCA4OjU14oCvQU0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gT24gTW9uLCAzMSBKdWwgMjAyMyAyMjo1MDowNyArMDEwMCwKPiA+IFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
VGh1LCBKdWwgMjcsIDIwMjMsIE1hcmMgWnluZ2llciB3cm90ZToKPiA+ID4gPiBPbiBTYXQsIDIy
IEp1bCAyMDIzIDAzOjIyOjQxICswMTAwLAo+ID4gPiA+IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEg
PHJhbmFudGFAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU3RvcCBkZXBl
bmRpbmcgb24gQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FMTCBhbmQgb3B0IHRvCj4g
PiA+ID4gPiBzdGFuZGFyZGl6ZSBvbiBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIHNpbmNl
IGl0IGF2b2lkcwo+ID4gPiA+ID4gZHVwbGljYXRpbmcgdGhlIGdlbmVyaWMgVExCIHN0YXRzIGFj
cm9zcyBhcmNoaXRlY3R1cmVzIHRoYXQgaW1wbGVtZW50Cj4gPiA+ID4gPiB0aGVpciBvd24gcmVt
b3RlIFRMQiBmbHVzaC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGFkZHMgYW4gZXh0cmEgZnVu
Y3Rpb24gY2FsbCB0byB0aGUgQVJNNjQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkKPiA+ID4gPiA+
IHBhdGgsIGJ1dCB0aGF0IGlzIGEgc21hbGwgY29zdCBpbiBjb21wYXJpc29uIHRvIGZsdXNoaW5n
IHJlbW90ZSBUTEJzLgo+ID4gPiA+Cj4gPiA+ID4gV2VsbCwgdGhlcmUgaXMgbm8gc3VjaCB0aGlu
ZyBhcyBhICJyZW1vdGUgVExCIiBhbnl3YXkuIFdlIGVpdGhlciBoYXZlCj4gPiA+ID4gYSBub24t
c2hhcmVhYmxlIG9yIGlubmVyLXNoYXJlYWJsZSBpbnZhbGlkYXRpb24uIFRoZSBub3Rpb24gb2Yg
cmVtb3RlCj4gPiA+ID4gd291bGQgaW1wbHkgdGhhdCB3ZSB0cmFjayB3aG8gcG90ZW50aWFsbHkg
aGFzIGEgVExCLCB3aGljaCB3ZQo+ID4gPiA+IG9idmlvdXNseSBkb24ndC4KPiA+ID4KPiA+ID4g
TWF5YmUga3ZtX2FyY2hfZmx1c2hfdm1fdGxicygpPyAgVGhlICJyZW1vdGUiIHBhcnQgaXMgbWlz
bGVhZGluZyBldmVuIG9uIHg4NiB3aGVuCj4gPiA+IHJ1bm5pbmcgb24gSHlwZXItViwgYXMgdGhl
IGZsdXNoIG1heSBiZSBkb25lIHZpYSBhIHNpbmdsZSBoeXBlcmNhbGwgYW5kIGJ5IGtpY2tpbmcK
PiA+ID4gInJlbW90ZSIgdkNQVXMuCj4gPgo+ID4gWXVwLCB0aGlzIHdvdWxkIGJlIG11Y2ggYmV0
dGVyLgo+ID4KPiA+IFRoYW5rcywKPiA+Cj4gPiAgICAgICAgIE0uCj4gPgo+ID4gLS0KPiA+IFdp
dGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
