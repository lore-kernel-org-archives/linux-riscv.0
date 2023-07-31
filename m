Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E00FC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cprUmJJueeCbkDPgcWSj0iliuKQFNFg4jQ5Q6j3Ihno=; b=XPLvaQyWJHWfCc
	Pmhxs378jwO68Vp6F/t3tvfTKWl5LX/37K4dpvHDSD9qK1fwn6w2hCpGGrqp9UZeKFuNIo1g7pWvX
	teJD6uwUZk+8TkA1GuBu0j0U+suhdqohzsH/ExTYG1Err5I0Mkq0olF5F2b0Gg+tSkabGED/U9U7E
	Hb7YUHvK9VyGngMOQL1nHI0fHGwGYxdWVxcsiwl3Z55837xm6NKLmj8yGNC3AX5NCvuh5A5mftaii
	QAgnfDIPGKFV8hHrl5wolNDIH9WE6HYawd8b0rjJV6lMfAuT3QtzU9WWH89Zbjx2dCWt3/c3q7HrB
	YEiwx5IO03Mucg2QSKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWaD-00GqYi-31;
	Mon, 31 Jul 2023 17:21:25 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWaB-00GqWE-1C
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:21:24 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-348c7075afcso4635ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690824079; x=1691428879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1yc8T49I2SK2WZwiTxo7poffYgxmNdrGJbub/r4Zew=;
        b=3sVZ6Pvu0MXolTiQ3qzM8kGAaMnBBEr6wdfZ02tKrrgnWJIvo3F3TkblR8+mCeqLz7
         1qXflSuEUvBPQ5UPzgIjQfEu4vFikLzhtIHvIPBXHMzl0AM/kqpA5ISl2NMmQYhDROP+
         9e8klrqjKR1eutqvlrh4m6oRlLgNeD45MZr0hKazL8rfmsz5VFIrEaoD9EbMPVM48OeE
         qCplx75r36D9baB9hAs1IgOBsL9TNbtYYnYvs0rvOqAoqW6tw1XlEV1PEwetGi2gpp4a
         kbIlhN/ej8BKcLn9QF4bsJVwJkRXrgYR7F2khR014azoZLG2kmXOWrtv2RUvhNa4ZpL3
         3Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690824079; x=1691428879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1yc8T49I2SK2WZwiTxo7poffYgxmNdrGJbub/r4Zew=;
        b=UJlxP/uSc+frDNDx2tTtnpY4R98bjT0/FRjaz4jWGNojaVlUnTtvSKRAHDMkz3j6+0
         8bkrNRSGsBgeuYWyn3x9Kc/twtG2SOe8bN1plonxeHSZfrs42wGB5D2Rr7nT8QBE9D4v
         krKzb4Ejoxm2UuNiG1Y9bKGeNCpVnh7Zmr61DVZHPUQ2AeafBwIUaEWI6K73DLGMYaCL
         bbNBd/k/+wjkkw69EXVJV8PxN/pJD9E0dcjwqgZZwLIjDmIhbzOxD/27kBpBEuDeh8wf
         XIKEduHnehmf/dXnnv43ylrRKJHrjxhCnGX0A7GKiwW0OpBV3FEF6fZk2tNAY22Cu0Yn
         pfSg==
X-Gm-Message-State: ABy/qLaAJhj7V66TTWRBy4VK4U2b/XXNS0lYqBUCvycj38WcYUg7I8eP
	L1BAWAuuMtc7m01jQGdlvJVsMwjl+8E0fNWNRkXWyg==
X-Google-Smtp-Source: APBJJlF2POzs0JiDlLB6/5fj5bT2PEm625iQ8R7ZMp4vjPEFJvEfQgAYflOknaXzwi3RrOdMIJI9UZP+pXJQibDjrAE=
X-Received: by 2002:a05:6e02:144d:b0:346:48bd:da43 with SMTP id
 p13-20020a056e02144d00b0034648bdda43mr600950ilo.4.1690824079368; Mon, 31 Jul
 2023 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org>
In-Reply-To: <87v8e5r6s6.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:21:08 -0700
Message-ID: <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230731_102123_407133_EF11B7D5 
X-CRM114-Status: GOOD (  21.00  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMzoyNOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAyMiBKdWwgMjAyMyAwMzoyMjo0MCArMDEwMCwKPiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+
IEZyb206IERhdmlkIE1hdGxhY2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+Cj4gPgo+ID4gUmVuYW1l
IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoKSBhbmQgdGhlIGFzc29jaWF0ZWQgbWFjcm8KPiA+
IF9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCIHRvIGt2bV9hcmNoX2ZsdXNoX3JlbW90
ZV90bGJzKCkgYW5kCj4gPiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMgcmVzcGVj
dGl2ZWx5Lgo+ID4KPiA+IE1ha2luZyB0aGUgbmFtZSBwbHVyYWwgbWF0Y2hlcyBrdm1fZmx1c2hf
cmVtb3RlX3RsYnMoKSBhbmQgbWFrZXMgaXQgbW9yZQo+ID4gY2xlYXIgdGhhdCB0aGlzIGZ1bmN0
aW9uIGNhbiBhZmZlY3QgbW9yZSB0aGFuIG9uZSByZW1vdGUgVExCLgo+ID4KPiA+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1hdGxh
Y2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBS
YW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hh
biA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8
c2hhaHVhbmdAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIHwgNCArKy0tCj4gPiAgYXJjaC9taXBzL2t2bS9taXBzLmMgICAgICAgICAgICAg
fCAyICstCj4gPiAgYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgfCA0ICsrLS0KPiA+
ICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICB8IDQgKystLQo+ID4gIHZpcnQva3Zt
L2t2bV9tYWluLmMgICAgICAgICAgICAgIHwgMiArLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL21p
cHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCj4gPiBpbmRleCAwNGNlZGY5Zjg4MTEuLjliMGFkOGYzYmYzMiAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiArKysgYi9hcmNoL21pcHMvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gQEAgLTg5Niw3ICs4OTYsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQga3ZtX2FyY2hfc2NoZWRfaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KSB7
fQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF92Y3B1X2Jsb2NraW5nKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkge30KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV91
bmJsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkge30KPiA+Cj4gPiAtI2RlZmluZSBfX0tW
TV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQgo+ID4gLWludCBrdm1fYXJjaF9mbHVzaF9yZW1v
dGVfdGxiKHN0cnVjdCBrdm0gKmt2bSk7Cj4gPiArI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxV
U0hfUkVNT1RFX1RMQlMKPiA+ICtpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0
IGt2bSAqa3ZtKTsKPgo+IEhvdyBhYm91dCBtYWtpbmcgdGhpcyBwcm90b3R5cGUgZ2xvYmFsPyBJ
IGRvbid0IHNlZSBhIHBvaW50IGluIGhhdmluZwo+IGl0IHBlci1hcmNoaXRlY3R1cmUsIHNwZWNp
YWxseSBhcyB5b3UgYXJlIGFkZGluZyBhcm02NCB0byB0aGF0IG1peCBpbgo+IHRoZSBmb2xsb3dp
bmcgcGF0Y2guCj4KV2UgY2FuIG1ha2UgaXQgZ2xvYmFsLCBidXQgSSdtIG5vdCBzdXJlIHdoYXQg
d2FzIHRoZSBpbnRlbnRpb24gb2YgdGhlCm9yaWdpbmFsIGF1dGhvci4gTXkgZ3Vlc3MgaXMgdGhh
dCBoZSB3YXMgZm9sbG93aW5nIHRoZSBzYW1lIHN0eWxlIHRoYXQKd2UgaGF2ZSBmb3Igc29tZSBv
ZiB0aGUgb3RoZXIga3ZtX2FyY2hfKigpIGZ1bmN0aW9ucwooa3ZtX2FyY2hfZnJlZV92bSgpIGZv
ciBleGFtcGxlKT8KCi0gUmFnaGF2ZW5kcmEKPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQg
ZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
