Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03759C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNScWYRmBs3rOgd8f31fYj23ur5xU7CUvopCWhWjg+Q=; b=FFxHXumYyjuqU0
	CFlvH0f8sTlcDg9ajSZc0IYB7lMjTtTsskUXYkqtSuScgoevBdpdJ/KedSLSndTItoBLJ6NYokX3q
	wJfq/UoCkIkX5y+AblUGYViLhgG15w4wZTt3A3R70JYAZaqMLHWva1ZEJzxnTgKiacLjkHfpK85py
	57/CmDuIerKqdHqwDKjcWPnkFXnU4++To6B86JO/HxNXfAf16pcekoU6q71VZbnhYdnlt27gKjFt0
	J1NZ9wbWSrkxXX6aCQxUDFug0BCydqEOHLiMx9VQL3rvTxNa+noFq9gEKA9IEwqKaBlawR8hbKuIJ
	sZAvUyMbQnU93ZHQNTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWxN-00Gsvf-0T;
	Mon, 31 Jul 2023 17:45:21 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWxJ-00Gsso-22
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:45:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3492e05be7cso9105ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690825512; x=1691430312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGd0AsQAwp8H4S0Hha56MgdpWqYeFbEB+5/aXRn1dMo=;
        b=zhNx/6wzQh/59YeSRE6Zk4KX3oq74BFHs4UtLBkzn2jdHIAdFgvHuAar0N7QSKQ9f5
         gjQxMlF+fLNY+ZUISpJHI0elU+cLIdQf9GgISZnsqfCf83nff+p8ZoI4qwMxlGSHmRGS
         H9vLbyX49OVEAIxHJDj0yWOJiTKWw62piWzCVMyGtpsQzzwSHz6vu5Y5Kd4s7w/bM6ad
         yxqnXQ65tId6WoxniRpfQrscD+4ZkZbKquP8FbIAUUvtEeAJhDc8s8hf77qxAQblxC6d
         MGM+hARijf69iuafH7E2VxwLQh8Zk2A1wLG/KqMNKUk0JsY95RdIIY1aKBg+ToecJziV
         ljcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825512; x=1691430312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGd0AsQAwp8H4S0Hha56MgdpWqYeFbEB+5/aXRn1dMo=;
        b=cDgA8uPMT3MyjkXrV/50B8Zf8bhhdf6l/O0Ml1dIKXxPmcs5dS1TOz7KROTxciI7nz
         xGMedvTmGaCmOM3qEXynwkB8GGlnZ4GsrqTKsn6q3eAnNpHZS5M706/j9otIL2r/aMbP
         ZSfLIyD7IofcBAMBsSApWkMWGjB9V5+iF+OH7hXNbto1fCjq1JMtlvBp++wufJMRyg70
         BJDcQrAWIjOJFFcW1hJ4TzeMI0WotkF3UihUz6tD2AU6W/7pHt2MF9gTsPSX14o3lheY
         n+d5+GR95azQCqa4kgcZbN8v2jqmlFV6ngS6lwhSsBOdDD6oP6oVDZwqISKzu5mfmris
         3eig==
X-Gm-Message-State: ABy/qLbbN5uftzbkaoiIEMKgjOFUl3lypAP4p2XUBtyCl/wO9bq2foPb
	Ci+9wK7CCKahKWyjT5FqOSHietJLI/NkKxUqbjsYAA==
X-Google-Smtp-Source: APBJJlHvsEicZK0ZV+JPaAOpuRWgNNmyNpC20X4iCvK3kUuw0MwfTIC6ClvWz7VEDkFWRsgU9lS/jm5d+jFZ3qI9OLA=
X-Received: by 2002:a05:6e02:1d8e:b0:345:fd14:c32e with SMTP id
 h14-20020a056e021d8e00b00345fd14c32emr460245ila.25.1690825512355; Mon, 31 Jul
 2023 10:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-8-rananta@google.com>
 <87pm4dr0hd.wl-maz@kernel.org>
In-Reply-To: <87pm4dr0hd.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:45:01 -0700
Message-ID: <CAJHc60ztA7pNQVHbd1WPmPNkoEzZWarDmxnLxh=-5ZYo9CWw2g@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] KVM: arm64: Implement __kvm_tlb_flush_vmid_range()
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
	Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_104517_674341_24D4917C 
X-CRM114-Status: GOOD (  30.34  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNTo0MOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAyMiBKdWwgMjAyMyAwMzoyMjo0NiArMDEwMCwKPiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+
IERlZmluZSAgX19rdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UoKSAoZm9yIFZIRSBhbmQgblZIRSkK
PiA+IHRvIGZsdXNoIGEgcmFuZ2Ugb2Ygc3RhZ2UtMiBwYWdlLXRhYmxlcyB1c2luZyBJUEEgaW4g
b25lIGdvLgo+ID4gSWYgdGhlIHN5c3RlbSBzdXBwb3J0cyBGRUFUX1RMQklSQU5HRSwgdGhlIGZv
bGxvd2luZyBwYXRjaGVzCj4gPiB3b3VsZCBjb252aW5pZW50bHkgcmVwbGFjZSBnbG9iYWwgVExC
SSBzdWNoIGFzIHZtYWxsczEyZTFpcwo+ID4gaW4gdGhlIG1hcCwgdW5tYXAsIGFuZCBkaXJ0eS1s
b2dnaW5nIHBhdGhzIHdpdGggcmlwYXMyZTFpcwo+ID4gaW5zdGVhZC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2FzbS5oICAgfCAgMyArKysKPiA+ICBhcmNoL2FybTY0
L2t2bS9oeXAvbnZoZS9oeXAtbWFpbi5jIHwgMTEgKysrKysrKysrKysKPiA+ICBhcmNoL2FybTY0
L2t2bS9oeXAvbnZoZS90bGIuYyAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgYXJjaC9hcm02NC9rdm0vaHlwL3ZoZS90bGIuYyAgICAgICB8IDI3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9hc20uaCBi
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2FzbS5oCj4gPiBpbmRleCA3ZDE3MGFhYTJkYjQu
LjJjMjdjYjhjZjQ0MiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Zt
X2FzbS5oCj4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9hc20uaAo+ID4gQEAg
LTcwLDYgKzcwLDcgQEAgZW51bSBfX2t2bV9ob3N0X3NtY2NjX2Z1bmMgewo+ID4gICAgICAgX19L
Vk1fSE9TVF9TTUNDQ19GVU5DX19fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYSwKPiA+ICAgICAgIF9f
S1ZNX0hPU1RfU01DQ0NfRlVOQ19fX2t2bV90bGJfZmx1c2hfdm1pZF9pcGFfbnNoLAo+ID4gICAg
ICAgX19LVk1fSE9TVF9TTUNDQ19GVU5DX19fa3ZtX3RsYl9mbHVzaF92bWlkLAo+ID4gKyAgICAg
X19LVk1fSE9TVF9TTUNDQ19GVU5DX19fa3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlLAo+ID4gICAg
ICAgX19LVk1fSE9TVF9TTUNDQ19GVU5DX19fa3ZtX2ZsdXNoX2NwdV9jb250ZXh0LAo+ID4gICAg
ICAgX19LVk1fSE9TVF9TTUNDQ19GVU5DX19fa3ZtX3RpbWVyX3NldF9jbnR2b2ZmLAo+ID4gICAg
ICAgX19LVk1fSE9TVF9TTUNDQ19GVU5DX19fdmdpY192M19yZWFkX3ZtY3IsCj4gPiBAQCAtMjI5
LDYgKzIzMCw4IEBAIGV4dGVybiB2b2lkIF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYShzdHJ1Y3Qg
a3ZtX3MyX21tdSAqbW11LCBwaHlzX2FkZHJfdCBpcGEsCj4gPiAgZXh0ZXJuIHZvaWQgX19rdm1f
dGxiX2ZsdXNoX3ZtaWRfaXBhX25zaChzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11LAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgaXBhLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGxldmVsKTsKPiA+ICtleHRl
cm4gdm9pZCBfX2t2bV90bGJfZmx1c2hfdm1pZF9yYW5nZShzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBz
dGFydCwgdW5zaWduZWQgbG9uZyBwYWdlcyk7Cj4gPiAgZXh0ZXJuIHZvaWQgX19rdm1fdGxiX2Zs
dXNoX3ZtaWQoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSk7Cj4gPgo+ID4gIGV4dGVybiB2b2lkIF9f
a3ZtX3RpbWVyX3NldF9jbnR2b2ZmKHU2NCBjbnR2b2ZmKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2t2bS9oeXAvbnZoZS9oeXAtbWFpbi5jIGIvYXJjaC9hcm02NC9rdm0vaHlwL252aGUv
aHlwLW1haW4uYwo+ID4gaW5kZXggYTE2OWM2MTlkYjYwLi44NTdkOWJjMDRmZDQgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL2FybTY0L2t2bS9oeXAvbnZoZS9oeXAtbWFpbi5jCj4gPiArKysgYi9hcmNo
L2FybTY0L2t2bS9oeXAvbnZoZS9oeXAtbWFpbi5jCj4gPiBAQCAtMTM1LDYgKzEzNSwxNiBAQCBz
dGF0aWMgdm9pZCBoYW5kbGVfX19rdm1fdGxiX2ZsdXNoX3ZtaWRfaXBhX25zaChzdHJ1Y3Qga3Zt
X2NwdV9jb250ZXh0ICpob3N0X2N0eAo+ID4gICAgICAgX19rdm1fdGxiX2ZsdXNoX3ZtaWRfaXBh
X25zaChrZXJuX2h5cF92YShtbXUpLCBpcGEsIGxldmVsKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRp
YyB2b2lkCj4gPiAraGFuZGxlX19fa3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKHN0cnVjdCBrdm1f
Y3B1X2NvbnRleHQgKmhvc3RfY3R4dCkKPiA+ICt7Cj4gPiArICAgICBERUNMQVJFX1JFRyhzdHJ1
Y3Qga3ZtX3MyX21tdSAqLCBtbXUsIGhvc3RfY3R4dCwgMSk7Cj4gPiArICAgICBERUNMQVJFX1JF
RyhwaHlzX2FkZHJfdCwgc3RhcnQsIGhvc3RfY3R4dCwgMik7Cj4gPiArICAgICBERUNMQVJFX1JF
Ryh1bnNpZ25lZCBsb25nLCBwYWdlcywgaG9zdF9jdHh0LCAzKTsKPiA+ICsKPiA+ICsgICAgIF9f
a3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKGtlcm5faHlwX3ZhKG1tdSksIHN0YXJ0LCBwYWdlcyk7
Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB2b2lkIGhhbmRsZV9fX2t2bV90bGJfZmx1c2hfdm1p
ZChzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpob3N0X2N0eHQpCj4gPiAgewo+ID4gICAgICAgREVD
TEFSRV9SRUcoc3RydWN0IGt2bV9zMl9tbXUgKiwgbW11LCBob3N0X2N0eHQsIDEpOwo+ID4gQEAg
LTMyNyw2ICszMzcsNyBAQCBzdGF0aWMgY29uc3QgaGNhbGxfdCBob3N0X2hjYWxsW10gPSB7Cj4g
PiAgICAgICBIQU5ETEVfRlVOQyhfX2t2bV90bGJfZmx1c2hfdm1pZF9pcGEpLAo+ID4gICAgICAg
SEFORExFX0ZVTkMoX19rdm1fdGxiX2ZsdXNoX3ZtaWRfaXBhX25zaCksCj4gPiAgICAgICBIQU5E
TEVfRlVOQyhfX2t2bV90bGJfZmx1c2hfdm1pZCksCj4gPiArICAgICBIQU5ETEVfRlVOQyhfX2t2
bV90bGJfZmx1c2hfdm1pZF9yYW5nZSksCj4gPiAgICAgICBIQU5ETEVfRlVOQyhfX2t2bV9mbHVz
aF9jcHVfY29udGV4dCksCj4gPiAgICAgICBIQU5ETEVfRlVOQyhfX2t2bV90aW1lcl9zZXRfY250
dm9mZiksCj4gPiAgICAgICBIQU5ETEVfRlVOQyhfX3ZnaWNfdjNfcmVhZF92bWNyKSwKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9oeXAvbnZoZS90bGIuYyBiL2FyY2gvYXJtNjQva3Zt
L2h5cC9udmhlL3RsYi5jCj4gPiBpbmRleCBiOTk5MWJiZDhlM2YuLjA5MzQ3MTExYzJjZCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva3ZtL2h5cC9udmhlL3RsYi5jCj4gPiArKysgYi9hcmNo
L2FybTY0L2t2bS9oeXAvbnZoZS90bGIuYwo+ID4gQEAgLTE4Miw2ICsxODIsMzYgQEAgdm9pZCBf
X2t2bV90bGJfZmx1c2hfdm1pZF9pcGFfbnNoKHN0cnVjdCBrdm1fczJfbW11ICptbXUsCj4gPiAg
ICAgICBfX3RsYl9zd2l0Y2hfdG9faG9zdCgmY3h0KTsKPiA+ICB9Cj4gPgo+ID4gK3ZvaWQgX19r
dm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0LCB1bnNpZ25lZCBsb25n
IHBhZ2VzKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCB0bGJfaW52X2NvbnRleHQgY3h0Owo+ID4g
KyAgICAgdW5zaWduZWQgbG9uZyBzdHJpZGU7Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAg
ICogU2luY2UgdGhlIHJhbmdlIG9mIGFkZHJlc3NlcyBtYXkgbm90IGJlIG1hcHBlZCBhdAo+ID4g
KyAgICAgICogdGhlIHNhbWUgbGV2ZWwsIGFzc3VtZSB0aGUgd29yc3QgY2FzZSBhcyBQQUdFX1NJ
WkUKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgc3RyaWRlID0gUEFHRV9TSVpFOwo+ID4gKyAgICAg
c3RhcnQgPSByb3VuZF9kb3duKHN0YXJ0LCBzdHJpZGUpOwo+ID4gKwo+ID4gKyAgICAgLyogU3dp
dGNoIHRvIHJlcXVlc3RlZCBWTUlEICovCj4gPiArICAgICBfX3RsYl9zd2l0Y2hfdG9fZ3Vlc3Qo
bW11LCAmY3h0LCBmYWxzZSk7Cj4gPiArCj4gPiArICAgICBfX2ZsdXNoX3RsYl9yYW5nZV9vcChp
cGFzMmUxaXMsIHN0YXJ0LCBwYWdlcywgc3RyaWRlLCAwLCAwLCBmYWxzZSk7Cj4KPiBJIHJlYWxs
eSB0aGluayB3ZSBuZWVkIGFuIGFic3RyYWN0aW9uIGhlcmUuIEFsbCB0aGlzIEFTSUQgYW5kIHVz
ZXIKPiBub25zZW5zZSBzaG91bGRuJ3QgYXBwZWFyIGhlcmUuIFNvbWV0aGluZyBzdWNoIGFzCj4g
X19mbHVzaF9zMl90bGJfcmFuZ2Vfb3AoKSwgd2hpY2ggd291bGQgcGFzcyB0aGUgY29ycmVjdCBw
YXJhbWV0ZXJzCj4gdGhhdCB0aGlzIGNvZGUgc2hvdWxkbid0IGhhdmUgdG8gd29ycnkgYWJvdXQu
Cj4KWWVzLCBhIHNpbXBsZSB3cmFwcGVyIHdvdWxkIGJlIG5pY2UuIEknbGwgaW1wbGVtZW50IHRo
aXMgaW4gdjguCgo+IEknbSBhbHNvIGEgYml0IGNvbmNlcm5lZCBieSB0aGUgZmFjdCB3ZSBjb21w
bGV0ZWx5IGxvc2UgdGhlIGxldmVsCj4gaGVyZS4gVGhpcyBpcyBhIG1hc3NpdmUgZmFzdC1wYXRo
IGZvciB0aGUgQ1BVLCBhbmQgd2UgZG9uJ3QgbWFrZSB1c2UKPiBvZiBpdC4gSXQnZCBiZSB3b3J0
aCB0aGlua2luZyBvZiBob3cgd2UgY2FuIG1ha2UgdXNlIG9mIGl0IGlmIGF0IGFsbAo+IHBvc3Np
YmxlLi4uCj4KSW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgc2VyaWVzIGluY2x1ZGVkIHRo
ZSAnbGV2ZWwnLCBidXQgaGFkCnNvbWUgY29tcGxleGl0aWVzIFsxXSwgYW5kIHNvIHdlIGhhZCB0
byBnZXQgcmlkIG9mIGl0IGZvciB0aGluZ3MgdG8gYXQKbGVhc3QgYmUgY29ycmVjdC4KQnV0LCB3
ZSBjYW4gdGhpbmsgYWJvdXQgaXQgYW5kIGluY2x1ZGUgdGhlICdsZXZlbCcgYXMgbmVlZGVkLgoK
LSBSYWdoYXZlbmRyYQoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWkNUamlya0Nn
QmtUNjVlUEBsaW51eC5kZXYvCgo+ID4gKwo+ID4gKyAgICAgZHNiKGlzaCk7Cj4gPiArICAgICBf
X3RsYmkodm1hbGxlMWlzKTsKPiA+ICsgICAgIGRzYihpc2gpOwo+ID4gKyAgICAgaXNiKCk7Cj4g
PiArCj4gPiArICAgICAvKiBTZWUgdGhlIGNvbW1lbnQgaW4gX19rdm1fdGxiX2ZsdXNoX3ZtaWRf
aXBhKCkgKi8KPiA+ICsgICAgIGlmIChpY2FjaGVfaXNfdnBpcHQoKSkKPiA+ICsgICAgICAgICAg
ICAgaWNhY2hlX2ludmFsX2FsbF9wb3UoKTsKPiA+ICsKPiA+ICsgICAgIF9fdGxiX3N3aXRjaF90
b19ob3N0KCZjeHQpOwo+Cj4gQW5vdGhlciB0aGluZyBpcyB0aGF0IGl0IGlzIGhpZ2ggdGltZSB0
aGF0IHNvbWUgb2YgdGhpcyBjYWxsIGdldHMKPiByZWZhY3RvcmVkLiBBbGwgdGhlc2UgaGVscGVy
cyBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lIHNlcXVlbmNlLCBvbmx5Cj4gZGlmZmVyaW5nIGJ5IGEg
Y291cGxlIG9mIGxpbmVzLiBOb3Qgc29tZXRoaW5nIHdlIG5lZWQgdG8gZG8KPiBpbW1lZGlhdGVs
eSwgYnV0IGV2ZW50dWFsbHkgd2UnbGwgaGF2ZSB0byBiaXRlIHRoZSBidWxsZXQuCj4KPiAgICAg
ICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNz
IGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
