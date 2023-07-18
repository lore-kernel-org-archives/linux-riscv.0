Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFADC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnT/5dL61q2RatOSM14xwNVfU+W/a1THhhXSrcCSi28=; b=Afl19Ev5rWXdXW
	YEAaXqx8kpmPRhYth6EPpAwbXzTSMOl7NPPwXD1eyNQJ1I/0XynrgKK1jLCqP/Sm4Ecey5XaaIXqC
	uHD9JCYTX2NAHiFb1rBECZ1f+KJ3J+cb/IEqN5sG3EcONw7Huy9qVk763BrrJXjPz8W8/pq525Rdc
	goinoOKdeoQ6Z7CXrTn58KBMavGVrApg1XkZ3FOrnDqUGMGjnTMcgdlQpfMo5WPCzrvZ8oL42MmBO
	h0x6xeaXWM7H3jkFg3ssSyzd4bhjZqjTH8i6AUDbire7WtMhUdutQCxGzOBXEU35PgvpG2DV9F/Wv
	iKy/6OQ805DKy/quy4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM279-006BgS-0A;
	Wed, 19 Jul 2023 08:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM277-006Bf7-0B
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GG+/1fcvh5KqnoX850UtmvkXdfZhV+IvDLNUAsjH7cc=; b=PwcEo5jHLjoHYPo+un+stmQFuy
	sCOwmI/xmCau8smmo/hETLxkws70lVanO8HYwSaJedTXLAdlCllagXD6pq2wRWTKH/yB/uanVYnU3
	q/mhQg6VJzpdYyDMB272sDX/QP51B0q5yRW4zljM14+qxAsvikKDIQjw3KzsiCPHYcTfaITsv2KL9
	xOLdqPM4WIiL+Q8sxLZtUC6nAHPF4QpTBIxxlsrq4EK49w/zdsks5HQ58pCHWWhzeLPpLErM+hV+s
	wGlB1n15u3o5JZkpqeqgS5Pw3Xb9NTn1/F95511Z+dqq0QEq2DtrEMqXI0sQlCLmdPB51IW8g1QSp
	5/HW757A==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnkm-00BlL2-2d
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 16:40:51 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-345bc4a438fso142055ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689698354; x=1690303154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+/1fcvh5KqnoX850UtmvkXdfZhV+IvDLNUAsjH7cc=;
        b=TlTJiU5V+Q7OUEoY/0iRtJ7YOl8iw5mA9ajGTVmhWVCDz2388rieiZ0p1hVAdlJRrN
         z+C5FNBA5Bhs4GTEd0P+XnMXD7aE7cHwEn3Xnw7Fkd2graDraNrbyoqN9RF18Wzf5NzK
         psVNYtQh5Hax4YUuv9Cq+kXKBwdEQrArluQWO+rjsoSjPkvfh1rFVcDSiCznYvckC93H
         pC3BUBy5jSxy4ZGJJpWIeM0eonL1pGTFSfffbPGAKWjxUay0BH/zW6QMQ1yKgK7bwicK
         KXhSZ8truc0Oxx3bbcLYOVk5ujff5zNVB8oqau4fw7lRejIcK87ji4T8ISw4mkz33qRa
         eSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689698354; x=1690303154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG+/1fcvh5KqnoX850UtmvkXdfZhV+IvDLNUAsjH7cc=;
        b=U/QUSWzGhqxrzEnmrSprKlKmBLTnQ7irgaYDmOlbXQ4/32b9jDR8Xzv09IvWcWqvBs
         P+v5+yzQUzzw5ELTvBVnUthdg1guVm0p8JPA0RSJ+vfqs/ruwTnsQ82L3WCliI4Mtu1c
         4nvKGp1MZkmj/EPs124jHXhNj20EgYWF+tfqOOQZ1dTPVYRbXmAzoCIGe5W6ZYkOYOq7
         7I7GGfd4WXVd2OMSWLm5v5x1zeQuY4VOP3zcQEe0tb12HXm+gu37dt8TwWP0zpUg5/W6
         0JzhQO44ISMKQ7fmf7DbGLspau5GfhJvWG6OOPTdGZE8sKlynBtDgNhu38u6NKN2k2mw
         xTRA==
X-Gm-Message-State: ABy/qLZTfzbRxFkuuQWjgXezk78flrVfkB5JweHqX5skWnEOm2Tb0j75
	hbGzByUoOLlSaxW4Xzx+/aiWQjEQDKUyM/7oCWbp3g==
X-Google-Smtp-Source: APBJJlEeclBbyqTcLuu/Vnmge1cXNugZ3jxBkbdI1YXf+AHLvPkW9iPFyexvlRbMwFGOxqLWLSEtQPkPAiZqdo8kXgo=
X-Received: by 2002:a05:6e02:b2a:b0:346:90d:10c7 with SMTP id
 e10-20020a056e020b2a00b00346090d10c7mr302973ilu.20.1689698353849; Tue, 18 Jul
 2023 09:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-7-rananta@google.com>
 <0b2b367e-30c7-672e-f249-e4100c4dff5f@redhat.com>
In-Reply-To: <0b2b367e-30c7-672e-f249-e4100c4dff5f@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 18 Jul 2023 09:39:02 -0700
Message-ID: <CAJHc60whqQ0fnE9_Uv1GRuCYq+_DDyN_Jaw_hOgnRYx-8F7JVg@mail.gmail.com>
Subject: Re: [PATCH v6 06/11] KVM: arm64: Implement __kvm_tlb_flush_vmid_range()
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_174049_300723_60DCEE3B 
X-CRM114-Status: GOOD (  25.49  )
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

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTI6NTDigK9BTSBTaGFvcWluIEh1YW5nIDxzaGFodWFu
Z0ByZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpIFJhZ2hhdmVuZHJhLAo+Cj4gT24gNy8xNS8yMyAw
ODo1NCwgUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPiA+IERlZmluZSAgX19rdm1fdGxi
X2ZsdXNoX3ZtaWRfcmFuZ2UoKSAoZm9yIFZIRSBhbmQgblZIRSkKPiA+IHRvIGZsdXNoIGEgcmFu
Z2Ugb2Ygc3RhZ2UtMiBwYWdlLXRhYmxlcyB1c2luZyBJUEEgaW4gb25lIGdvLgo+ID4gSWYgdGhl
IHN5c3RlbSBzdXBwb3J0cyBGRUFUX1RMQklSQU5HRSwgdGhlIGZvbGxvd2luZyBwYXRjaGVzCj4g
PiB3b3VsZCBjb252aW5pZW50bHkgcmVwbGFjZSBnbG9iYWwgVExCSSBzdWNoIGFzIHZtYWxsczEy
ZTFpcwo+ID4gaW4gdGhlIG1hcCwgdW5tYXAsIGFuZCBkaXJ0eS1sb2dnaW5nIHBhdGhzIHdpdGgg
cmlwYXMyZTFpcwo+ID4gaW5zdGVhZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRy
YSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4g
U2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2t2bV9hc20uaCAgIHwgIDMgKysrCj4gPiAgIGFyY2gvYXJtNjQva3ZtL2h5cC9udmhlL2h5
cC1tYWluLmMgfCAxMSArKysrKysrKysrKwo+ID4gICBhcmNoL2FybTY0L2t2bS9oeXAvbnZoZS90
bGIuYyAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGFyY2gv
YXJtNjQva3ZtL2h5cC92aGUvdGxiLmMgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fYXNtLmggYi9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL2t2bV9hc20uaAo+ID4gaW5kZXggN2QxNzBhYWEyZGI0Li4yYzI3Y2I4Y2Y0NDIgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9hc20uaAo+ID4gKysrIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fYXNtLmgKPiA+IEBAIC03MCw2ICs3MCw3IEBAIGVu
dW0gX19rdm1faG9zdF9zbWNjY19mdW5jIHsKPiA+ICAgICAgIF9fS1ZNX0hPU1RfU01DQ0NfRlVO
Q19fX2t2bV90bGJfZmx1c2hfdm1pZF9pcGEsCj4gPiAgICAgICBfX0tWTV9IT1NUX1NNQ0NDX0ZV
TkNfX19rdm1fdGxiX2ZsdXNoX3ZtaWRfaXBhX25zaCwKPiA+ICAgICAgIF9fS1ZNX0hPU1RfU01D
Q0NfRlVOQ19fX2t2bV90bGJfZmx1c2hfdm1pZCwKPiA+ICsgICAgIF9fS1ZNX0hPU1RfU01DQ0Nf
RlVOQ19fX2t2bV90bGJfZmx1c2hfdm1pZF9yYW5nZSwKPiA+ICAgICAgIF9fS1ZNX0hPU1RfU01D
Q0NfRlVOQ19fX2t2bV9mbHVzaF9jcHVfY29udGV4dCwKPiA+ICAgICAgIF9fS1ZNX0hPU1RfU01D
Q0NfRlVOQ19fX2t2bV90aW1lcl9zZXRfY250dm9mZiwKPiA+ICAgICAgIF9fS1ZNX0hPU1RfU01D
Q0NfRlVOQ19fX3ZnaWNfdjNfcmVhZF92bWNyLAo+ID4gQEAgLTIyOSw2ICsyMzAsOCBAQCBleHRl
cm4gdm9pZCBfX2t2bV90bGJfZmx1c2hfdm1pZF9pcGEoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwg
cGh5c19hZGRyX3QgaXBhLAo+ID4gICBleHRlcm4gdm9pZCBfX2t2bV90bGJfZmx1c2hfdm1pZF9p
cGFfbnNoKHN0cnVjdCBrdm1fczJfbW11ICptbXUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBpcGEsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgbGV2ZWwpOwo+ID4gK2V4dGVybiB2b2lkIF9fa3ZtX3Rs
Yl9mbHVzaF92bWlkX3JhbmdlKHN0cnVjdCBrdm1fczJfbW11ICptbXUsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0LCB1bnNpZ25lZCBs
b25nIHBhZ2VzKTsKPiA+ICAgZXh0ZXJuIHZvaWQgX19rdm1fdGxiX2ZsdXNoX3ZtaWQoc3RydWN0
IGt2bV9zMl9tbXUgKm1tdSk7Cj4gPgo+ID4gICBleHRlcm4gdm9pZCBfX2t2bV90aW1lcl9zZXRf
Y250dm9mZih1NjQgY250dm9mZik7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vaHlw
L252aGUvaHlwLW1haW4uYyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9udmhlL2h5cC1tYWluLmMKPiA+
IGluZGV4IGExNjljNjE5ZGI2MC4uODU3ZDliYzA0ZmQ0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9h
cm02NC9rdm0vaHlwL252aGUvaHlwLW1haW4uYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rdm0vaHlw
L252aGUvaHlwLW1haW4uYwo+ID4gQEAgLTEzNSw2ICsxMzUsMTYgQEAgc3RhdGljIHZvaWQgaGFu
ZGxlX19fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYV9uc2goc3RydWN0IGt2bV9jcHVfY29udGV4dCAq
aG9zdF9jdHgKPiA+ICAgICAgIF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYV9uc2goa2Vybl9oeXBf
dmEobW11KSwgaXBhLCBsZXZlbCk7Cj4gPiAgIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQKPiA+ICto
YW5kbGVfX19rdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9jcHVfY29udGV4dCAq
aG9zdF9jdHh0KQo+ID4gK3sKPiA+ICsgICAgIERFQ0xBUkVfUkVHKHN0cnVjdCBrdm1fczJfbW11
ICosIG1tdSwgaG9zdF9jdHh0LCAxKTsKPiA+ICsgICAgIERFQ0xBUkVfUkVHKHBoeXNfYWRkcl90
LCBzdGFydCwgaG9zdF9jdHh0LCAyKTsKPiA+ICsgICAgIERFQ0xBUkVfUkVHKHVuc2lnbmVkIGxv
bmcsIHBhZ2VzLCBob3N0X2N0eHQsIDMpOwo+ID4gKwo+ID4gKyAgICAgX19rdm1fdGxiX2ZsdXNo
X3ZtaWRfcmFuZ2Uoa2Vybl9oeXBfdmEobW11KSwgc3RhcnQsIHBhZ2VzKTsKPiA+ICt9Cj4gPiAr
Cj4gPiAgIHN0YXRpYyB2b2lkIGhhbmRsZV9fX2t2bV90bGJfZmx1c2hfdm1pZChzdHJ1Y3Qga3Zt
X2NwdV9jb250ZXh0ICpob3N0X2N0eHQpCj4gPiAgIHsKPiA+ICAgICAgIERFQ0xBUkVfUkVHKHN0
cnVjdCBrdm1fczJfbW11ICosIG1tdSwgaG9zdF9jdHh0LCAxKTsKPiA+IEBAIC0zMjcsNiArMzM3
LDcgQEAgc3RhdGljIGNvbnN0IGhjYWxsX3QgaG9zdF9oY2FsbFtdID0gewo+ID4gICAgICAgSEFO
RExFX0ZVTkMoX19rdm1fdGxiX2ZsdXNoX3ZtaWRfaXBhKSwKPiA+ICAgICAgIEhBTkRMRV9GVU5D
KF9fa3ZtX3RsYl9mbHVzaF92bWlkX2lwYV9uc2gpLAo+ID4gICAgICAgSEFORExFX0ZVTkMoX19r
dm1fdGxiX2ZsdXNoX3ZtaWQpLAo+ID4gKyAgICAgSEFORExFX0ZVTkMoX19rdm1fdGxiX2ZsdXNo
X3ZtaWRfcmFuZ2UpLAo+ID4gICAgICAgSEFORExFX0ZVTkMoX19rdm1fZmx1c2hfY3B1X2NvbnRl
eHQpLAo+ID4gICAgICAgSEFORExFX0ZVTkMoX19rdm1fdGltZXJfc2V0X2NudHZvZmYpLAo+ID4g
ICAgICAgSEFORExFX0ZVTkMoX192Z2ljX3YzX3JlYWRfdm1jciksCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9rdm0vaHlwL252aGUvdGxiLmMgYi9hcmNoL2FybTY0L2t2bS9oeXAvbnZoZS90
bGIuYwo+ID4gaW5kZXggYjk5OTFiYmQ4ZTNmLi4wOTM0NzExMWMyY2QgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL2FybTY0L2t2bS9oeXAvbnZoZS90bGIuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rdm0v
aHlwL252aGUvdGxiLmMKPiA+IEBAIC0xODIsNiArMTgyLDM2IEBAIHZvaWQgX19rdm1fdGxiX2Zs
dXNoX3ZtaWRfaXBhX25zaChzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11LAo+ID4gICAgICAgX190bGJf
c3dpdGNoX3RvX2hvc3QoJmN4dCk7Cj4gPiAgIH0KPiA+Cj4gPiArdm9pZCBfX2t2bV90bGJfZmx1
c2hfdm1pZF9yYW5nZShzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11LAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGh5c19hZGRyX3Qgc3RhcnQsIHVuc2lnbmVkIGxvbmcgcGFnZXMpCj4g
PiArewo+ID4gKyAgICAgc3RydWN0IHRsYl9pbnZfY29udGV4dCBjeHQ7Cj4gPiArICAgICB1bnNp
Z25lZCBsb25nIHN0cmlkZTsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBTaW5jZSB0
aGUgcmFuZ2Ugb2YgYWRkcmVzc2VzIG1heSBub3QgYmUgbWFwcGVkIGF0Cj4gPiArICAgICAgKiB0
aGUgc2FtZSBsZXZlbCwgYXNzdW1lIHRoZSB3b3JzdCBjYXNlIGFzIFBBR0VfU0laRQo+ID4gKyAg
ICAgICovCj4gPiArICAgICBzdHJpZGUgPSBQQUdFX1NJWkU7Cj4gPiArICAgICBzdGFydCA9IHJv
dW5kX2Rvd24oc3RhcnQsIHN0cmlkZSk7Cj4gPiArCj4gPiArICAgICAvKiBTd2l0Y2ggdG8gcmVx
dWVzdGVkIFZNSUQgKi8KPiA+ICsgICAgIF9fdGxiX3N3aXRjaF90b19ndWVzdChtbXUsICZjeHQs
IGZhbHNlKTsKPiA+ICsKPiA+ICsgICAgIF9fZmx1c2hfdGxiX3JhbmdlX29wKGlwYXMyZTFpcywg
c3RhcnQsIHBhZ2VzLCBzdHJpZGUsIDAsIDAsIGZhbHNlKTsKPiA+ICsKPiA+ICsgICAgIGRzYihp
c2gpOwo+ID4gKyAgICAgX190bGJpKHZtYWxsZTFpcyk7Cj4gPiArICAgICBkc2IoaXNoKTsKPiA+
ICsgICAgIGlzYigpOwo+ID4gKwo+ID4gKyAgICAgLyogU2VlIHRoZSBjb21tZW50IGluIF9fa3Zt
X3RsYl9mbHVzaF92bWlkX2lwYSgpICovCj4gPiArICAgICBpZiAoaWNhY2hlX2lzX3ZwaXB0KCkp
Cj4gPiArICAgICAgICAgICAgIGljYWNoZV9pbnZhbF9hbGxfcG91KCk7Cj4gPiArCj4gPiArICAg
ICBfX3RsYl9zd2l0Y2hfdG9faG9zdCgmY3h0KTsKPiA+ICt9Cj4gPiArCj4gPiAgIHZvaWQgX19r
dm1fdGxiX2ZsdXNoX3ZtaWQoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSkKPiA+ICAgewo+ID4gICAg
ICAgc3RydWN0IHRsYl9pbnZfY29udGV4dCBjeHQ7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9rdm0vaHlwL3ZoZS90bGIuYyBiL2FyY2gvYXJtNjQva3ZtL2h5cC92aGUvdGxiLmMKPiA+IGlu
ZGV4IGU2OWRhNTUwY2RjNS4uNGVkOGExNzg2ODEyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02
NC9rdm0vaHlwL3ZoZS90bGIuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rdm0vaHlwL3ZoZS90bGIu
Ywo+ID4gQEAgLTEzOCw2ICsxMzgsMjkgQEAgdm9pZCBfX2t2bV90bGJfZmx1c2hfdm1pZF9pcGFf
bnNoKHN0cnVjdCBrdm1fczJfbW11ICptbXUsCj4gPiAgICAgICBkc2IobnNoKTsKPiA+ICAgICAg
IF9fdGxiaSh2bWFsbGUxKTsKPiA+ICAgICAgIGRzYihuc2gpOwo+ID4gKwo+ID4gKyAgICAgX190
bGJfc3dpdGNoX3RvX2hvc3QoJmN4dCk7Cj4gPiArfQo+ID4gKwo+ID4gK3ZvaWQgX19rdm1fdGxi
X2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0LCB1bnNpZ25lZCBsb25nIHBhZ2Vz
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCB0bGJfaW52X2NvbnRleHQgY3h0Owo+ID4gKyAgICAg
dW5zaWduZWQgbG9uZyBzdHJpZGU7Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogU2lu
Y2UgdGhlIHJhbmdlIG9mIGFkZHJlc3NlcyBtYXkgbm90IGJlIG1hcHBlZCBhdAo+ID4gKyAgICAg
ICogdGhlIHNhbWUgbGV2ZWwsIGFzc3VtZSB0aGUgd29yc3QgY2FzZSBhcyBQQUdFX1NJWkUKPiA+
ICsgICAgICAqLwo+ID4gKyAgICAgc3RyaWRlID0gUEFHRV9TSVpFOwo+ID4gKyAgICAgc3RhcnQg
PSByb3VuZF9kb3duKHN0YXJ0LCBzdHJpZGUpOwo+ID4gKwo+Cj4gSXMgdGhlcmUgbGFjayBvZiBz
d2l0Y2ggVk1JRCB0byBndWVzdD8KPiAgICAgICAgIF9fdGxiX3N3aXRjaF90b19ndWVzdChtbXUs
ICZjeHQsIGZhbHNlKTsKPgpPaCByaWdodCwgd2Ugc2hvdWxkIGhhdmUgdGhhdCAoSSB0aGluayBJ
IG1lc3NlZCB1cCB0aGUgY29uZmxpY3QKcmVzb2x1dGlvbiB3aGVuIHJlYmFzaW5nIHRoZSBzZXJp
ZXMgdG8gNi41LXJjMSkuIFRoYW5rcyBmb3IgcG9pbnRpbmcKdGhpcyBvdXQhIEknbGwgZml4IGl0
IGluIHY3LgoKLSBSYWdoYXZlbmRyYQo+IFRoYW5rcywKPiBTaGFvcWluCj4KPiA+ICsgICAgIGRz
Yihpc2hzdCk7Cj4gPiArICAgICBfX2ZsdXNoX3RsYl9yYW5nZV9vcChpcGFzMmUxaXMsIHN0YXJ0
LCBwYWdlcywgc3RyaWRlLCAwLCAwLCBmYWxzZSk7Cj4gPiArCj4gPiArICAgICBkc2IoaXNoKTsK
PiA+ICsgICAgIF9fdGxiaSh2bWFsbGUxaXMpOwo+ID4gKyAgICAgZHNiKGlzaCk7Cj4gPiAgICAg
ICBpc2IoKTsKPiA+Cj4gPiAgICAgICBfX3RsYl9zd2l0Y2hfdG9faG9zdCgmY3h0KTsKPgo+IC0t
Cj4gU2hhb3Fpbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
