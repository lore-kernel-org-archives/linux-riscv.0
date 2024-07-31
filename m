Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AA8C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY0rjm7M2MzfAr8TzqDECs+K77v3mJ5ueVhOucBFnv0=; b=rrUHG9jrOwy/Gm
	1XGjAT3iM3KL8TRh894M1myRoROochr2iK/1seyK2SDZUax2i1GLZlYU7evyHiUYxfrYoJgJI1zbc
	2G52ZI8X3nt28/kPLbmnZW1Fx+zuWfcGhnmlC0J+koAMJtxPAKl9w9PoStd2tfzfA766hWRm6Qtx/
	7d6u5tHgx39Dcp17LZq26GAe+k4M+FkCDIvBCLOGaxcoYqU/rPaK3ig3p6iuYnSvm09IWFuWfbS3D
	dcnd7ukf7yFbjlIpkGD0/ATDNR7Lx7WZEj8TgX13DfvD4s3jhz2tLSIE23PsbdgPgIwogUQ7NE9Jl
	qPWkN8s5L0svgkHg96hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZC74-00000001qsr-0bL8;
	Wed, 31 Jul 2024 16:23:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZC70-00000001qr6-0Xti
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 16:23:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7a8553db90so813460666b.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722443016; x=1723047816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=R9QSnkSqUXizd4+/F+zQQ7u+Q0IWE6VAvs4lEN1cIUZpaCf7c2Z2fjD4azVTUg7Gtw
         jGiVkicIKvtbxLIyFeQ3AFhWVXXpLam8K1iVwNUq2ahSyUPCAmtQvImleV3OEcROC8+J
         +CgyGTqk2RMgM1rbfilxXlgAwq+QwOUsLTQ7YcF0oYaM4BJHzbfebH9ceotBedPH0Dlu
         fNLgc/i4hA9ywcppOdUBi4FAAiqvWbotnV/StlVMdSL8bATwrY6T7k03m9GVawq5RZp5
         7oXyJZBDODmFJVy0ZhmG4e1/7TrcZbkRzHuMZoPFBPfoKExipohN+x0IE91hLof4A61X
         qwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722443016; x=1723047816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jy3Eo6Gu+vhJFsd2nEOfkihTm91GOS2uDXcn/bR1Cs=;
        b=qPUoPxzy6wEj4t+Z9iyIxitveSQLUi23JoYlYC+Ec5E6Jr9fpgxnbdl2m8de8iW0to
         44tvRaJfsrSDQECs+qs+EVtFsAuq7HUSAD2Tb29/NB+mRz8QQbDSLha6sDLxD3eDXrDs
         OZY9yC3GZka1twMwMgTyHL0vQa7T9d7Sw703TqGwtAUcG1YDnzvaEQ2cs12wI/JqW4ji
         gj/ZYJWe4Q3MaswnMoNqsrrRdyGrxqh8GzC6X6YF/Dypi1Zd0YUH76KPkCM9kOsxvtFY
         mdO6Y3/uDzAO248/jARKhIYbSlQ00rc/LyUJLRzsJTa0tkrDeWXfGDY0hujpLZd57cGo
         MM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUhHk1IVDTQNNqfapxW+lswyFXohZhnqkezYsUyXcBts1PgQQZJ/KDaT99nMJ3TRsN1eC/0rEiVkzR+JsdPO2GG6Z/difSmsGjAOZRy1io
X-Gm-Message-State: AOJu0Yz6JqtZ5nE7wdNqzbWP7Ifzw9mKKGKcA5ihA6qULTHXqdsKeT77
	TMVSrbCvanWD4TNjgoi4QyCRQxOHsHrLnPKmEHgna8P1aXNcgByveM98NZB7O5A=
X-Google-Smtp-Source: AGHT+IFaeuLsqXvHIvwNkMOmXQ/kk95KnaHAVzfZZFY2rJSwrdZANzuSfUeE19U50MBeGB1J/TbUHg==
X-Received: by 2002:a17:907:a0d5:b0:a7a:b070:92c6 with SMTP id a640c23a62f3a-a7d40116a4bmr801926666b.50.1722443015967;
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad416basm784769266b.104.2024.07.31.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:23:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 614DC5F8CB;
	Wed, 31 Jul 2024 17:23:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
In-Reply-To: <20240726235234.228822-2-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:10 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-2-seanjc@google.com>
Date: Wed, 31 Jul 2024 17:23:34 +0100
Message-ID: <87a5hxfs3d.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_092338_207288_F2CB4DA7 
X-CRM114-Status: GOOD (  14.26  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gUHV0IHRo
ZSBwYWdlIHJlZmVyZW5jZSBhY3F1aXJlZCBieSBnZm5fdG9fcGZuX3Byb3QoKSBpZgo+IGt2bV92
bV9pb2N0bF9tdGVfY29weV90YWdzKCkgcnVucyBpbnRvIFpPTkVfREVWSUNFIG1lbW9yeS4gIEtW
TSdzIGxlc3MtCj4gdGhhbi1zdGVsbGFyIGhldXJpc3RpY3MgZm9yIGRlYWxpbmcgd2l0aCBwZm4t
bWFwcGVkIG1lbW9yeSBtZWFucyB0aGF0IEtWTQo+IGNhbiBnZXQgYSBwYWdlIHJlZmVyZW5jZSB0
byBaT05FX0RFVklDRSBtZW1vcnkuCj4KPiBGaXhlczogZjAzNzZlZGIxZGRjICgiS1ZNOiBhcm02
NDogQWRkIGlvY3RsIHRvIGZldGNoL3N0b3JlIHRhZ3MgaW4gYSBndWVzdCIpCj4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCj4gIGFy
Y2gvYXJtNjQva3ZtL2d1ZXN0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vZ3Vlc3QuYyBiL2FyY2gvYXJtNjQv
a3ZtL2d1ZXN0LmMKPiBpbmRleCAxMTA5OGViN2ViNDQuLmUxZjBmZjA4ODM2YSAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybTY0L2t2bS9ndWVzdC5jCj4gKysrIGIvYXJjaC9hcm02NC9rdm0vZ3Vlc3Qu
Ywo+IEBAIC0xMDU5LDYgKzEwNTksNyBAQCBpbnQga3ZtX3ZtX2lvY3RsX210ZV9jb3B5X3RhZ3Mo
c3RydWN0IGt2bSAqa3ZtLAo+ICAJCXBhZ2UgPSBwZm5fdG9fb25saW5lX3BhZ2UocGZuKTsKPiAg
CQlpZiAoIXBhZ2UpIHsKPiAgCQkJLyogUmVqZWN0IFpPTkVfREVWSUNFIG1lbW9yeSAqLwo+ICsJ
CQlrdm1fcmVsZWFzZV9wZm5fY2xlYW4ocGZuKTsKCkkgZ3Vlc3MgdGhpcyBnZXRzIHJlbmFtZWQg
bGF0ZXIgaW4gdGhlIHNlcmllcy4KCkhvd2V2ZXIgbXkgbWFpbiBjb21tZW50IGlzIGRvZXMgbGFj
ayBvZiBwYWdlIGFsd2F5cyBtZWFuIGEgWk9ORV9ERVZJQ0U/Ckxvb2tpbmcgYXQgcGZuX3RvX29u
bGluZV9wYWdlKCkgSSBzZWUgYSBidW5jaCBvZiBvdGhlciBjaGVja3MgZmlyc3QuIFdoeQppc24n
dCBpdCB0aGF0IGZ1bmN0aW9ucyByZXNwb25zaWJpbGl0eSB0byBjbGVhbiB1cCBhZnRlciBpdHNl
bGYgaWYgaXRzCnJldHVybmluZyBOVUxMcz8KCj4gIAkJCXJldCA9IC1FRkFVTFQ7Cj4gIAkJCWdv
dG8gb3V0Owo+ICAJCX0KCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFk
IEAgTGluYXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
