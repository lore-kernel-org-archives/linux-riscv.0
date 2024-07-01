Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97AC3065A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqPszaX4B64yD2Qa8SyuTHt9l5OVJ+TlUrz4gU9kQnA=; b=VXb+7p4GNutIKD
	PHpdxY81tQiUUG1F97QTB7nb1+US/aTLskbCNZIZ4jA1lruuadiCkpMe6mR2Atz4gMxNJugNaRAuj
	19i1LBirlbWCG/ZqrM7JWcznIPdZQ3gyotwktg3v/XFgTs1Z+p3h8tBNlZu1KHhS4957y8GoaHO0i
	MmjYXRtS43h4Lo0XVHDYTNIx9mKIdyzudZ05g6Lho41BcQdM2aetA6l0Y8wAQWURMBj75tm7pea//
	Gdv8CUh5EJkb5595kp0BERdUNtqLjvTYRBt935oR6jQQyMneNAlsGm/qwXECjPyBtsxXAcJSddwPT
	TWgnanzUesPhKCAde/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLCg-00000004MdT-2ClZ;
	Mon, 01 Jul 2024 17:52:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLCV-00000004MZx-1ssy
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 17:52:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-361785bfa71so2377886f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719856341; x=1720461141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=I39I7VWdn8BKL5wwqhftkrEr4IskSKt45waiFKRMq7JyiqGbsTYavBqCm3bssRhh9M
         QymJZ0gX4R5S8YIEGsRuGSsWtL3zjFj/EdjHGIhrktzG5JeSQ9pm9NvaNHCnb+67Qkyu
         k/TTATUdkdkRya8splw4JlYYyrB90gsejOdpS6tAdKg1jFo2Ki1PiSSMNalJeubOl9zV
         9Y7jeFq3+bpFPzKhNwhxo0+ALpiBKlRJ/30EomukzdxxBIPZaURu9mljTkJIjobUE5vn
         mLcDphL5VNj7rTxVgEz9p8zU3b4e1m4c2q0PFy7h4dXjuBxN2HzdvdDODGzspqCzf2zU
         4a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719856341; x=1720461141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=bO9SwH66UTHWuqgiu/T8GY88KDcmUDmjgIcL9HB0fTWVuXeQVP8gpQBn5LV69b3IT7
         f4Ov6vrwJj0aCIAK6TK1YxJjfe6JnMv+NiiAXIu3NCHpDquAYmI2UgeACWZF9K68lZCX
         a5JsfbDhxnPh/ewNs94Ow6jD1NDYXtFwXTJXbTdHkBE6Y9ZG1qtW17/vGf8xpp8EcfPi
         Nrtko1/h3Ym6OBlslVm6EVLl6Ftdfo0JTHTt10mmFKWKCtvVDZDl5WNWul3MB3fLUBtw
         o+5vrPvmNeeXuaTC+WySgP+J1lyk0zWIrNe0vtkdbh3XNF9eC61Doe7kEjdBh9rM3uuk
         Ueyw==
X-Forwarded-Encrypted: i=1; AJvYcCVYXFy/n8ipRPPZj33gjgjC51RR1WHRzSY2AMbUv98b8vU7crQOB67jpYk6slGWSGAUCDqJ4e0wX8/1V8XXOOg6xsxE8aBEUmJ83/NKKrQ6
X-Gm-Message-State: AOJu0Yzt6UD+rxZ0duMK1z2JrgVhRmdvxiS91vb/nbjH6Jv/1N9JQird
	FuEFZZ46G6aRLw6HQAabuOGX6ZGY2Tm5m1pP2yzanPZx2eyiviQB0MgmCv8n3jwPF6Aq8wPNsSx
	2x1kSuOE4XKGA4/VR+2BVtC2Sm9F4ukXTBPXS
X-Google-Smtp-Source: AGHT+IG7kANdMixnrRX/w/wCL06WRJILCv9aR81l3eU1ucu2os0oVGFSDzYlK6U+a1azCoA3WAsnnYnMeJC+/F+ecm0=
X-Received: by 2002:a5d:49cc:0:b0:366:eade:bfbb with SMTP id
 ffacd0b85a97d-367757200admr5266366f8f.46.1719856341379; Mon, 01 Jul 2024
 10:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
In-Reply-To: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 1 Jul 2024 10:51:53 -0700
Message-ID: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
To: Sean Christopherson <seanjc@google.com>
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
X-CRM114-CacheID: sfid-20240701_105227_496209_C26606BA 
X-CRM114-Status: GOOD (  17.27  )
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

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMjo0MeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMDMgTWF5IDIwMjQgMTE6MTc6MzEg
LTA3MDAsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBjaGFuZ2VzIEtWTSB0
byBtYXJrIGEgdkNQVSBhcyBwcmVlbXB0ZWQvcmVhZHkgaWYtYW5kLW9ubHktaWYKPiA+IGl0J3Mg
c2NoZWR1bGVkIG91dCB3aGlsZSBydW5uaW5nLiBpLmUuIERvIG5vdCBtYXJrIGEgdkNQVQo+ID4g
cHJlZW1wdGVkL3JlYWR5IGlmIGl0J3Mgc2NoZWR1bGVkIG91dCBkdXJpbmcgYSBub24tS1ZNX1JV
TiBpb2N0bCgpIG9yCj4gPiB3aGVuIHVzZXJzcGFjZSBpcyBkb2luZyBLVk1fUlVOIHdpdGggaW1t
ZWRpYXRlX2V4aXQ9dHJ1ZS4KPiA+Cj4gPiBUaGlzIGlzIGEgbG9naWNhbCBleHRlbnNpb24gb2Yg
Y29tbWl0IDU0YWE4M2M5MDE5OCAoIktWTTogeDg2OiBkbyBub3QKPiA+IHNldCBzdC0+cHJlZW1w
dGVkIHdoZW4gZ29pbmcgYmFjayB0byB1c2VyIHNwYWNlIiksIHdoaWNoICBzdG9wcGVkCj4gPiBt
YXJraW5nIGEgdkNQVSBhcyBwcmVlbXB0ZWQgd2hlbiByZXR1cm5pbmcgdG8gdXNlcnNwYWNlLiBC
dXQgaWYgdXNlcnNwYWNlCj4gPiBpbnZva2VzIGEgS1ZNIHZDUFUgaW9jdGwoKSB0aGF0IGdldHMg
cHJlZW1wdGVkLCB0aGUgdkNQVSB3aWxsIGJlIG1hcmtlZAo+ID4gcHJlZW1wdGVkL3JlYWR5LiBU
aGlzIGlzIGFyZ3VhYmx5IGluY29ycmVjdCBiZWhhdmlvciBzaW5jZSB0aGUgdkNQVSB3YXMKPiA+
IG5vdCBhY3R1YWxseSBwcmVlbXB0ZWQgd2hpbGUgdGhlIGd1ZXN0IHdhcyBydW5uaW5nLCBpdCB3
YXMgcHJlZW1wdGVkCj4gPiB3aGlsZSBkb2luZyBzb21ldGhpbmcgb24gYmVoYWxmIG9mIHVzZXJz
cGFjZS4KPiA+Cj4gPiBbLi4uXQo+Cj4gQXBwbGllZCB0byBrdm0teDg2IGdlbmVyaWMsIHdpdGgg
bWlub3IgY2hhbmdlbG9nIHR3ZWFrcyAobWUgdGhpbmtzIHlvdSd2ZSBiZWVuCj4gYXdheSBmcm9t
IHVwc3RyZWFtIHRvbyBsb25nIDstKSApLiAgVGhhbmtzIQoKVGhhbmtzIGZvciB0aGUgY2xlYW51
cHMuIExvb2tzIGxpa2UgeW91IHJlcGxhY2VkICJbVHRdaGlzIGNvbW1pdCIKdGhyb3VnaG91dC4g
QW55dGhpbmcgZWxzZSAoc28gSSBjYW4gYXZvaWQgdGhlIHNhbWUgbWlzdGFrZXMgaW4gdGhlCmZ1
dHVyZSk/Cgo+Cj4gWzEvM10gS1ZNOiBJbnRyb2R1Y2UgdmNwdS0+d2FudHNfdG9fcnVuCj4gICAg
ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS14ODYvbGludXgvY29tbWl0L2E2ODE2MzE0YWY1Nwo+
IFsyLzNdIEtWTTogRW5zdXJlIG5ldyBjb2RlIHRoYXQgcmVmZXJlbmNlcyBpbW1lZGlhdGVfZXhp
dCBnZXRzIGV4dHJhIHNjcnV0aW55Cj4gICAgICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS14ODYv
bGludXgvY29tbWl0LzRiMjNlMGMxOTliMgo+IFszLzNdIEtWTTogTWFyayBhIHZDUFUgYXMgcHJl
ZW1wdGVkL3JlYWR5IGlmZiBpdCdzIHNjaGVkdWxlZCBvdXQgd2hpbGUgcnVubmluZwo+ICAgICAg
IGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0teDg2L2xpbnV4L2NvbW1pdC8xMTg5NjQ1NjI5NjkKPgo+
IC0tCj4gaHR0cHM6Ly9naXRodWIuY29tL2t2bS14ODYvbGludXgvdHJlZS9uZXh0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
