Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBE0C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph5bCbZtZpmQ0oTN1SDbe4qoY7hJiOtqdwJoXCG12Yw=; b=AQMyMQzr2iXVp6
	krRuKFDGDanJHGHcd+D8ypC28biBl15W5Uk+grlSD7q1rThdPqhEQ321PRP7hAzimDEh1QFHgAlkG
	6IR/udv18KxROJbblNpMe8KGR3p1V55QqogORsDQH3puAEG1Sh8exEQY3w5w+LCs9OjgNw8Atz7au
	nbCm07Te0mdR6mSBe7XLqbXKuvKwWg86uGZ2NDAs4gf9kVLFMherMAhQfi4kXNF9Ur59rga5VlTeq
	fp8/JVTBktGdNarIrauV0Farb2Ixpkzvyo/t4R973mKq1U77+xpSz7BJzK6/3hWim/TVtSoOlqP3G
	nRuifVhEMn2PMORBg79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCgb-008hTZ-0p;
	Thu, 10 Aug 2023 20:55:13 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCgX-008hRq-1z
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 20:55:11 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-40c72caec5cso23531cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691700907; x=1692305707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbz6nfirzOItWcULJrhy76vEH5UntBJ+zAdtRqxrtIs=;
        b=mkXquOWImM+ipsQFpSuV6HphXWcMu0DYJyCRbKA/Dq79yQhHG6TR+uE6DNBjdtFfKW
         9Ou/urveYZ4pdU9VR2letW3AyzwHrPpup+XFQvg0vonxJ42AGrE0ltKx1/f55708OXYf
         vRUx09Hzn0lW4KrJOE9nmWrwtUjt3v4ixV/ExTTUVlINSh80tyHy1p6Y/nwisurUxSg3
         Wmv9YQlCHLhD3Pnz+PxZu242lj8GKSajSa1rIlgV/+M9oPmy8Wnkw4+ChJ0Lg9d6ijtw
         nCaMDID/yxucfw6q1AGYHCMLPpDCnZU/dtO0FRBlOqagop7dekdu3rV5nFgzRGnaj5/N
         zDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691700907; x=1692305707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fbz6nfirzOItWcULJrhy76vEH5UntBJ+zAdtRqxrtIs=;
        b=YY+3S1y8NKsZGaK+Q2S5hReusYEKC3Mra6oT/yYz7fLfhkKuOMzKEgufN2xkTd68AX
         I0cJy1B6TlNdv5lFjMIvoQksKdPQyCBP5XusNhOCXfubmAVPii4myMtC6l1AyOEzsOIQ
         q7c3DvKO3Dqo8wgzQlFZ/R/tG5TKtAVq2sLsQYoGa24FOzjQPl9QtATlcTOIr8ZK8WMo
         y/qyqMS/Ok53oroY11WtfbaPC1X+1tHsM1MJ6rHV3478GhnQG6awjSKYVCmn7pDz6ekc
         1LvVXFbsxc8mXpmUFVOCYkvx/g5nxRuv67IKsVwmrh5OgW+FKCbsH9G7JtbJ003EcsgZ
         IpFw==
X-Gm-Message-State: AOJu0Yw3NyFjVBQG/8W7/s5mXUbfCRMheaZu9RyO9xx+6TosTgj+/M9o
	lgCuQEV9VcvQH8eURar9ZPIGgNOURlmdnIqXLyLQ1w==
X-Google-Smtp-Source: AGHT+IETRvm1u0c2tw6CwIcy/y+qdG7C9yLn61u49rI1SxhvjvsG0R6dfHP+vWIwnY34cSPU455isRrBYsnfx2fRx9Y=
X-Received: by 2002:ac8:7f86:0:b0:403:96e3:4745 with SMTP id
 z6-20020ac87f86000000b0040396e34745mr69781qtj.20.1691700906744; Thu, 10 Aug
 2023 13:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com>
In-Reply-To: <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 13:54:55 -0700
Message-ID: <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_135509_656188_5B57B70C 
X-CRM114-Status: GOOD (  24.87  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgNToyNuKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDgvMTAvMjMgMDA6MzgsIFJhZ2hhdmVuZHJh
IFJhbyBBbmFudGEgd3JvdGU6Cj4gPiBIaSBHYXZpbiwKPiA+Cj4gPiBPbiBUdWUsIEF1ZyA4LCAy
MDIzIGF0IDk6MDDigK9QTSBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPiB3cm90ZToKPiA+
Pgo+ID4+Cj4gPj4gT24gOC85LzIzIDA5OjEzLCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3Rl
Ogo+ID4+PiBUaGVyZSdzIG5vIHJlYXNvbiBmb3IgdGhlIGFyY2hpdGVjdHVyZXMgdG8gZGVjbGFy
ZQo+ID4+PiBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIGluIHRoZWlyIG93biBoZWFkZXJz
LiBIZW5jZSB0bwo+ID4+PiBhdm9pZCB0aGlzIGR1cGxpY2F0aW9uLCBtYWtlIHRoZSBkZWNsYXJh
dGlvbiBnbG9iYWwsIGxlYXZpbmcKPiA+Pj4gdGhlIGFyY2hpdGVjdHVyZXMgdG8gZGVmaW5lIG9u
bHkgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTCj4gPj4+IGFzIG5lZWRlZC4KPiA+
Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBn
b29nbGUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmggfCAxIC0KPiA+Pj4gICAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oICAgICAgICAgfCAy
ICsrCj4gPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPj4+IGluZGV4IDliMGFk
OGYzYmYzMjcuLjU0YTg1ZjFkNGYyYzggMTAwNjQ0Cj4gPj4+IC0tLSBhL2FyY2gvbWlwcy9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gPj4+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCj4gPj4+IEBAIC04OTcsNiArODk3LDUgQEAgc3RhdGljIGlubGluZSB2b2lkIGt2bV9h
cmNoX3ZjcHVfYmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQo+ID4+PiAgICBzdGF0
aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV91bmJsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkge30KPiA+Pj4KPiA+Pj4gICAgI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVN
T1RFX1RMQlMKPiA+Pj4gLWludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3Zt
ICprdm0pOwo+ID4+Pgo+ID4+PiAgICAjZW5kaWYgLyogX19NSVBTX0tWTV9IT1NUX0hfXyAqLwo+
ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51
eC9rdm1faG9zdC5oCj4gPj4+IGluZGV4IGUzZjk2OGIzOGFlOTcuLmFkZTVkNDUwMGMyY2UgMTAw
NjQ0Cj4gPj4+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4+PiArKysgYi9pbmNs
dWRlL2xpbnV4L2t2bV9ob3N0LmgKPiA+Pj4gQEAgLTE0ODQsNiArMTQ4NCw4IEBAIHN0YXRpYyBp
bmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKPiA+
Pj4gICAgewo+ID4+PiAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsKPiA+Pj4gICAgfQo+ID4+PiAr
I2Vsc2UKPiA+Pj4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICpr
dm0pOwo+ID4+PiAgICAjZW5kaWYKPiA+Pj4KPiA+Pj4gICAgI2lmZGVmIF9fS1ZNX0hBVkVfQVJD
SF9OT05DT0hFUkVOVF9ETUEKPiA+Pgo+ID4+IElzIHRoZSBkZWNsYXJhdGlvbiBpbmNvbnNpc3Rl
bnQgdG8gdGhhdCBpbiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oPwo+ID4+IEluIG9y
ZGVyIHRvIGtlZXAgdGhlbSBjb25zaXN0ZW50LCBJIGd1ZXNzIHdlIG5lZWQgbW92ZSBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxicygpCj4gPj4gZnJvbSB4ODYncyBoZWFkZXIgZmlsZSB0byBhcmNo
L3g4Ni9rdm0vbW11L21tdS5jIGFuZCAnaW5saW5lJyBuZWVkcyB0byBiZSBkcm9wcGVkLgo+ID4+
Cj4gPiBVbnN1cmUgb2YgdGhlIG9yaWdpbmFsIGludGVudGlvbnMsIEkgZGlkbid0IHdhbnQgdG8g
ZGlzdHVyYiBhbnkKPiA+IGV4aXN0aW5nIGFycmFuZ2VtZW50cy4gSWYgbW9yZSBwZW9wbGUgYWdy
ZWUgdG8gdGhpcyByZWZhY3RvcmluZywgSSdtCj4gPiBoYXBweSB0byBtb3ZlLgo+Cj4gVGhpcyBp
cyBhbWF6aW5nIHRvIG1lLiBUaGlzIGNoYW5nZSBjYW4gYmUgY29tcGlsZWQgd2l0aG91dCBhbnkg
ZXJyb3IKPiBldmVuIGlmIHRoZSBkZWNsYXJhdGlvbiBpbmNvbnNpc3RlbnQgYmV0d2VlbiB0aGUg
a3ZtX2hvc3QuaCBhbmQgeDg2J3MKPiBoZWFkZXIgZmlsZS4KPgo+IEknbSBjdXJpb3VzIHdoaWNo
IG9wdGlvbiBtYWtlIGl0IHBvc3NpYmxlPwo+CkFmdGVyIGRvaW5nIHNvbWUgZXhwZXJpbWVudHMs
IEkgdGhpbmsgaXQgd29ya3MgYmVjYXVzZSBvZiB0aGUgb3JkZXIgaW4Kd2hpY2ggdGhlIGlubGlu
ZS1kZWZpbml0aW9uIGFuZCB0aGUgZGVjbGFyYXRpb24gYXJlIGxhaWQgb3V0LiBJZiB0aGUKJ2lu
bGluZScgcGFydCBvZiB0aGUgZnVuY3Rpb24gY29tZXMgZmlyc3QgYW5kIHRoZW4gdGhlIGRlY2xh
cmF0aW9uLCB3ZQpkb24ndCBzZWUgYW55IGVycm9yLiBIb3dldmVyIGlmIHRoZSBwb3NpdGlvbnMg
d2VyZSByZXZlcnNlZCwgd2Ugd291bGQKc2VlIGFuIGVycm9yLiAoSSdtIG5vdCBzdXJlIHdoYXQg
dGhlIHRlY2huaWNhbCByZWFzb24gZm9yIHRoaXMgaXMpLgoKSnVzdCB0byBiZSBzYWZlLCBJIGNh
biBtb3ZlIHRoZSBkZWZpbml0aW9uIHRvIGFyY2gveDg2L2t2bS9tbXUvbW11LmMKYXMgYSBub24t
aW5saW5lIGZ1bmN0aW9uLgoKVGhhbmsgeW91LgpSYWdoYXZlbmRyYQo+IFRoYW5rcywKPiBTaGFv
cWluCj4KPiA+Cj4gPiBUaGFuayB5b3UuCj4gPiBSYWdoYXZlbmRyYQo+ID4+IFRoYW5rcywKPiA+
PiBHYXZpbgo+ID4+Cj4gPgo+Cj4gLS0KPiBTaGFvcWluCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
