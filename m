Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB1C001DE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RSFL6atLPjZu2oDls1yy55+c88oMBeG/8ZocgHzhVME=; b=UFR+N2TF9tzdikUyxeepN95CRN
	HjZmbTrnBzHAvRxfTeRZRARZbUIyAk6L2jq+NWyA8P/WXsyCKz0IorfvhwCRqNgd45396isAYd7ZW
	zIXsnAOIjP2vtIc7yShqShH2cDV6EFu2V5esYHmeZZfkSfQ6+sBMYxw1801Lb/HPRlFFN/NfSyEmj
	wsYDj2nIn64UmX0luDOTPn4n9O5SDW5Bp0rGPwkbTGhKp+tLmcov9Fp5JsYftziA66GpjdqmH4dHI
	6wrLAJOusJDyNrMq9Sh2dE31J0ygPBsWXjNfUe+QZCeKgDhWgIl1lQT6rKSL0BJ60bDvYFItRlInh
	b1fJm/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOJS-002nTJ-0o;
	Tue, 08 Aug 2023 15:07:58 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOJO-002nRV-1P
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 15:07:56 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5646868b9e7so3550308a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691507266; x=1692112066;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaiJ+rWGolW4ovI22gadBn2AFu8/7ikdaAkBdyz0qCk=;
        b=ayK3mYp5ZQm5F204c8SfuM/WFFVkRk0fgjxIN5q1r27VDVtngJ+7mGzuMl45HAdfj+
         V0WUPOd+87OJ1kHr8JYMh1jq5/tq0s1635UzLBWQvYLHswE1gAXBqE56zdYG8sjZPtDA
         7V8ZJPVauL7LNyPcAMrHkgeX4lK3nQuvXLwGO4LTA3Ld1a1174s+Z3Ro0YWwTJ0bmels
         x1gehns8QavBItnA8zjbhJEYkc9b4ERehz8TcMLkVftVKrJxnEapaV9ia5Kx4INBTTln
         mT/PFDUjApHcOuvbXA3Z6GkBBZAh+Gz0FHUPQ0QQMlY0jiz3lf4rRwDfnf637apvnFTV
         /Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691507266; x=1692112066;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BaiJ+rWGolW4ovI22gadBn2AFu8/7ikdaAkBdyz0qCk=;
        b=E5qcXfYxO1i5RuAC9T+dWgAu2sWbKQfLQadBo42qDMKDApAgXNfgNx3qvk9eHkMSuB
         +l/YNl2GXUJtMiHwElbiybFp1Nt4YDGYlPoE/2wsAhEnZ/WsCCS4Mrsm1S2fK1x6SdoE
         jxzYwbDM3IvKEwauz7xsm5mo58pz8zdieZcMyYhBh7FlDddhD3uZhO40yabffg8wm3Ac
         c7EB3e0TXYQ/2CnkhwGdV2aegyqxrCQCmNy8LMIGzjTJYFu9mJ5zbHUV9qLTyVeaw/I0
         IAzv/aa0GlzMCZTibYMwSf4dG/WMWHGB54ezoYP3ldoyk4OwzPUGuv2CXvpVBLp+VB8W
         2nog==
X-Gm-Message-State: AOJu0Ywkd8XeBHnMKivp8dROeUrFRZuBoDZyWRTeNwPUw5ahJMucRCaf
	YuvnmU0hvaAfzCoEDGhWokFg4oAYQQQ=
X-Google-Smtp-Source: AGHT+IG5/N2ZE1Ejorc8NLEsKzeCITxV+EG+130yb+21WD/iP5VWmZCCV6UyxFu6UTgxWYvax2jHbb68fQQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3c11:0:b0:564:179a:d5cb with SMTP id
 j17-20020a633c11000000b00564179ad5cbmr56114pga.8.1691507265754; Tue, 08 Aug
 2023 08:07:45 -0700 (PDT)
Date: Tue, 8 Aug 2023 08:07:43 -0700
In-Reply-To: <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
Message-ID: <ZNJaPxTtPRCv0HOl@google.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_080754_472701_43CBB463 
X-CRM114-Status: GOOD (  14.77  )
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

T24gRnJpLCBBdWcgMDQsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
V2VkLCBBdWcgMiwgMjAyMyBhdCA0OjI44oCvUE0gUmFnaGF2ZW5kcmEgUmFvIEFuYW50YQo+IDxy
YW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IFN1cmUsIEknbGwgY2hhbmdlIGl0IHRv
IGt2bV9hcmNoX2ZsdXNoX3ZtX3RsYnMoKSBpbiB2OC4KPiA+Cj4gV2hpbGUgd29ya2luZyBvbiB0
aGUgcmVuYW1pbmcsIEkgcmVhbGl6ZWQgdGhhdCBzaW5jZSB0aGlzIGZ1bmN0aW9uIGlzCj4gY2Fs
bGVkIGZyb20ga3ZtX21haW4uYydzIGt2bV9mbHVzaF9yZW1vdGVfdGxicygpLiBEbyB3ZSB3YW50
IHRvIHJlbmFtZQo+IHRoaXMgYW5kIHRoZSBvdGhlciBrdm1fZmx1c2hfKigpIGZ1bmN0aW9ucyB0
aGF0IHRoZSBzZXJpZXMgaW50cm9kdWNlcwo+IHRvIG1hdGNoIHRoZWlyIGt2bV9hcmNoX2ZsdXNo
XyooKSBjb3VudGVycGFydHM/CgpIbW0sIGlmIHdlJ3JlIGdvaW5nIHRvIHJlbmFtZSBvbmUgYXJj
aCBob29rLCB0aGVuIHllcywgSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0bwpyZW5hbWUgYWxsIHRo
ZSBjb21tb24gQVBJcyBhbmQgYXJjaCBob29rcyB0byBtYXRjaC4KCkhvd2V2ZXIsIHg4NiBpcyBy
aWZlIHdpdGggdGhlICJyZW1vdGVfdGxicyIgbm9tZW5jbGF0dXJlLCBhbmQgcmVuYW1pbmcgdGhl
IGNvbW1vbgpBUElzIHdpbGwganVzdCBwdXNoIHRoZSBpbmNvbnNpc3RlbmNpZXMgaW50byB4ODYu
ICBXaGlsZSBJIDEwMCUgYWdyZWUgdGhhdCB0aGUKY3VycmVudCBuYW1pbmcgaXMgZmxhd2VkLCBJ
IGFtIG5vdCB3aWxsaW5nIHRvIGVuZCB1cCB3aXRoIHg4NiBiZWluZyBwYXJ0aWFsbHkKY29udmVy
dGVkLgoKSSB0aGluayBJJ20gb2sgcmVuYW1pbmcgYWxsIG9mIHg4NidzIG1hbnkgaG9va3M/ICBC
dXQgSSdkIGRlZmluaXRlbHkgd2FudCBpbnB1dApmcm9tIG1vcmUgeDg2IGZvbGtzLCBhbmQgdGhl
IHNpemUgYW5kIHNjb3BlIG9mIHRoaXMgc2VyaWVzIHdvdWxkIGV4cGxvZGUuICBVbmxlc3MKTWFy
YyBvYmplY3RzIGFuZC9vciBoYXMgYSBiZXR0ZXIgaWRlYSwgdGhlIGxlYXN0IGF3ZnVsIG9wdGlv
biBpcyBwcm9iYWJseSB0byBpZ25vcmUKdGhlIHBvb3IgInJlbW90ZV90bGJzIiBuYW1pbmcgYW5k
IHRhY2tsZSBpdCBpbiBhIHNlcGFyYXRlIHNlcmllcy4KClNvcnJ5IGZvciBub3Qgbm90aWNpaW5n
IHRoaXMgZWFybGllciwgSSBkaWRuJ3QgcmVhbGl6ZSBqdXN0IGhvdyBtdWNoIHg4NiB1c2VzCnJl
bW90ZV90bGJzLgoKPiAoc3BpcmFsaW5nIG1vcmUgaW50byB0aGlzLCB3ZSBhbHNvIGhhdmUgdGhl
ICdyZW1vdGVfdGxiX2ZsdXNoX3JlcXVlc3RzJyBhbmQKPiAncmVtb3RlX3RsYl9mbHVzaCcgc3Rh
dHMpCgpSZWdhcmRsZXNzIG9mIHdoYXQgd2UgZGVjaWRlIGZvciB0aGUgQVBJcywgZGVmaW5pdGVs
eSBsZWF2ZSB0aGUgc3RhdHMgYWxvbmUuICBUaGUKbmFtZXMgYXJlIEFCSS4gIFdlIGNvdWxkIHBy
ZXNlcnZlIHRoZSBuYW1lcyBhbmQgY2hhbmdlcyB0aGUgc3RydWN0IGZpZWxkcywgYnV0IHRoYXQK
d291bGQgYmUgYSBuZXQgbmVnYXRpdmUgSU1PLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
