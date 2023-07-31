Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE14AC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 21:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gq3o65Fybie81NIdyaMzPF+5qK7hOfL9ru3hI/JK2FI=; b=hY/YP3dn+axiFyHLZ2iMlWo6PA
	S/xGmMFAQJGLzRttjmPF1u2CeX8+oJ99D8F0PW/cjfqUOndyfI94YYiP8JrUSdXjWpfv+/ssHZegd
	pO6Bbre/X/wq1TnQ9qVdvFDvmhemFcS/oPX3ngsmKpNAGnhzKiA3P+TWXkdwg5E9MDPqPeXjLWXP2
	2Mdp+Fx1kf4Pg+C4v5VMDhzLctEC3le8MO91iYpskryYuJoiQgzdCiUlu30DtqadoWvna2KXPdpSI
	w/l/+6g96wohtqoDEA4PGgpfB5kauMykv9IgAm/wfvD5w7tk5jR5PfmrQPgbgWWwwVHtvtZA3K09/
	iDFqMTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQaem-00HPVT-24;
	Mon, 31 Jul 2023 21:42:24 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQaej-00HPU9-2d
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 21:42:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bbd4f526caso38303185ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690839739; x=1691444539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU1Eyv4/z0dADLWEV1nEcRpLxJELbihGWkSyugO3ex8=;
        b=zHV044O9XwNQjgOLB3AfcpUidtjFsHSm7411oU0FzT/hBIi1OVCl2irlR0nDqKL8Cv
         hr4KfnJvAQ8KZYVTxOCRf7feP1xd884smGeXDTwo1Mxw39juIFwqargVifxiYkX3oNFO
         jGZAeL3BraA/GHqzFzm8zichi53qOSusN9afNCtFEmHZFTDQ5+1SlvbReoCXw9xfn3Sq
         Nxy3SDA+osZfzK8FprhkAlPfPKaV+dJMo4N5DxnhbU6aEOE2yJsGxe0D1EjnOIUEkic5
         iFCs47k5rbIbFAbkVkjH6/FwH8n0Jz0vylbUDue6VIQodFOLNkamKR23aV4KPT1WaTb8
         1QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690839739; x=1691444539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AU1Eyv4/z0dADLWEV1nEcRpLxJELbihGWkSyugO3ex8=;
        b=jXdJiEHQAdvJsjh3zQsDX51W7kzp6W+zI/0+OOkx3+NZRP7miwRkpLLPcpJKwStFAt
         E3IvsfVbzDDkeAxzwfAYv0ubwWcow0fPbkScVZQjjDEDcShIEGWC5TSSKtqdm6s2pGE6
         7N2VKUINiQyu1MVQ2pOHdUOIrVDyVCuUYK1UqOvKRloA3MMWPfoQBN0vN1b3V84DDmrE
         oqFRfstjam1pP5bVlJFnDulQgosCDJLoq+tWndwVzQKFULwPALpqQLLxG4UPGZ0pFZ2i
         ITrb7v0htjtYgWYsb1KtbgmxPfdvJ4KlW1inOaImwZHCRbYkY6ylQTMVVzjYOleUat2c
         r0xg==
X-Gm-Message-State: ABy/qLbmXzrOBJCG5tD3Tw8sbDzkd9qXGv/sCJ2aMRsHZTE3E9VVeaJQ
	7VYD4tavnZmJ1UyHz6qfrFwM/14HfFI=
X-Google-Smtp-Source: APBJJlGvM6eC2793heXvfSouAIwfR2kqtZard40LOvURGFRGLCXd0Mte19jhWawRDx9GHaLxbY3CRW2x+Q4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac4:b0:1bb:91c9:d334 with SMTP id
 q4-20020a170902dac400b001bb91c9d334mr42299plx.0.1690839739050; Mon, 31 Jul
 2023 14:42:19 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:42:17 -0700
In-Reply-To: <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org> <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
Message-ID: <ZMgqueePlmKvgUId@google.com>
Subject: Re: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
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
	Gavin Shan <gshan@redhat.com>, 
	"Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_144221_878763_68E64875 
X-CRM114-Status: GOOD (  26.14  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMjcsIDIwMjMgYXQgMzoyNOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgMjIgSnVsIDIwMjMgMDM6MjI6NDAgKzAxMDAsCj4g
PiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBGcm9tOiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+ID4gPgo+
ID4gPiBSZW5hbWUga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYigpIGFuZCB0aGUgYXNzb2NpYXRl
ZCBtYWNybwo+ID4gPiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQiB0byBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxicygpIGFuZAo+ID4gPiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVN
T1RFX1RMQlMgcmVzcGVjdGl2ZWx5Lgo+ID4gPgo+ID4gPiBNYWtpbmcgdGhlIG5hbWUgcGx1cmFs
IG1hdGNoZXMga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkgYW5kIG1ha2VzIGl0IG1vcmUKPiA+ID4g
Y2xlYXIgdGhhdCB0aGlzIGZ1bmN0aW9uIGNhbiBhZmZlY3QgbW9yZSB0aGFuIG9uZSByZW1vdGUg
VExCLgo+ID4gPgo+ID4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiA+ID4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBnb29nbGUu
Y29tPgo+ID4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4KPiA+ID4gUmV2aWV3ZWQtYnk6IFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCA0ICsr
LS0KPiA+ID4gIGFyY2gvbWlwcy9rdm0vbWlwcy5jICAgICAgICAgICAgIHwgMiArLQo+ID4gPiAg
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgfCA0ICsrLS0KPiA+ID4gIGluY2x1ZGUv
bGludXgva3ZtX2hvc3QuaCAgICAgICAgIHwgNCArKy0tCj4gPiA+ICB2aXJ0L2t2bS9rdm1fbWFp
bi5jICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBz
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAo+ID4gPiBpbmRleCAwNGNlZGY5Zjg4MTEuLjliMGFkOGYzYmYzMiAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+ID4gKysrIGIvYXJjaC9taXBz
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+ID4gQEAgLTg5Niw3ICs4OTYsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQga3ZtX2FyY2hfc2NoZWRfaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQg
Y3B1KSB7fQo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIGt2bV9hcmNoX3ZjcHVfYmxvY2tpbmco
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIGt2bV9h
cmNoX3ZjcHVfdW5ibG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHt9Cj4gPiA+Cj4gPiA+
IC0jZGVmaW5lIF9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCCj4gPiA+IC1pbnQga3Zt
X2FyY2hfZmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qga3ZtICprdm0pOwo+ID4gPiArI2RlZmluZSBf
X0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMKPiA+ID4gK2ludCBrdm1fYXJjaF9mbHVz
aF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICprdm0pOwo+ID4KPiA+IEhvdyBhYm91dCBtYWtpbmcg
dGhpcyBwcm90b3R5cGUgZ2xvYmFsPyBJIGRvbid0IHNlZSBhIHBvaW50IGluIGhhdmluZwo+ID4g
aXQgcGVyLWFyY2hpdGVjdHVyZSwgc3BlY2lhbGx5IGFzIHlvdSBhcmUgYWRkaW5nIGFybTY0IHRv
IHRoYXQgbWl4IGluCj4gPiB0aGUgZm9sbG93aW5nIHBhdGNoLgo+ID4KPiBXZSBjYW4gbWFrZSBp
dCBnbG9iYWwsIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCB3YXMgdGhlIGludGVudGlvbiBvZiB0aGUK
PiBvcmlnaW5hbCBhdXRob3IuIE15IGd1ZXNzIGlzIHRoYXQgaGUgd2FzIGZvbGxvd2luZyB0aGUg
c2FtZSBzdHlsZSB0aGF0Cj4gd2UgaGF2ZSBmb3Igc29tZSBvZiB0aGUgb3RoZXIga3ZtX2FyY2hf
KigpIGZ1bmN0aW9ucwo+IChrdm1fYXJjaF9mcmVlX3ZtKCkgZm9yIGV4YW1wbGUpPwoKSGVoLCBL
Vk0gaGFzIGEgKmxvdCogb2YgY29kZSB0aGF0IHdhcyB3cml0dGVuIHdpdGggcXVlc3Rpb25hYmxl
IHN0eWxlLiAgSSBhZ3JlZQp3aXRoIE1hcmMsIEkgY2FuJ3QgdGhpbmsgb2YgYSBzaW5nbGUgcmVh
c29uIG5vdCB0byBoYXZlIHRoZSBkZWZpbml0aW9uIGluIGNvbW1vbgpjb2RlLiAgRGVjbGFyaW5n
IHRoZSBmdW5jdGlvbiBkb2Vzbid0IHByZWNsdWRlIGEgInN0YXRpYyBpbmxpbmUiIGltcGxlbWVu
dGF0aW9uLAphbmQgd2UgY291bGQgZXZlbiBrZWVwIHRoZSBwcm90b3R5cGUgdW5kZXIgYW4gI2lm
ZGVmLCBlLmcuIAoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCA5ZDNhYzc3MjBkYTkuLjVhYzY0ZjkzMzU0NyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaApAQCAtMTQ4NCw2ICsxNDg0LDggQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hf
Zmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qga3ZtICprdm0pCiB7CiAgICAgICAgcmV0dXJuIC1FTk9U
U1VQUDsKIH0KKyNlbHNlCitpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qga3Zt
ICprdm0pOwogI2VuZGlmCiAKICNpZmRlZiBfX0tWTV9IQVZFX0FSQ0hfTk9OQ09IRVJFTlRfRE1B
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
