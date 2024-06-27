Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A9C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB5rW0+/EpTQx69D/NO35CbylalLEDwZ7NQ2Q3isHQI=; b=XqZxYRTz9dXAdD
	JUvSlflLFFQCQn/o1Mv1UD2ywdDeIfizQ3tP0qoThCiWe5t/yKo1u0/rVky3PL2zbzfq2dxTOe+m0
	vjFK/0779gMNoAj0WSNfaXQMLO4GqfIztt0TSVopJseOu+Ro9+TmcgSVJcVg/CVHjoTmkHe9r/4tc
	aFZX7TOf7ROH3DSa2M+N/cUpYlQjwIBQVyfN4sgTSakuKMhtSfJArB7cZ449b7v2Ssh15tG7J0AzA
	47bAFuKOEWWw+YbiShN01UGAnJuDyyLCM6Vd6OshVri6ltkj9uLk1e+0TM/BmZ2S7GnjO/uIRuCkw
	KrK+X5Gts4NCtO1ijsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrN4-0000000AvtH-1lCP;
	Thu, 27 Jun 2024 15:49:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrN1-0000000Avsb-1Ah8
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FC6A61F36
	for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 15:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD65C4AF0A
	for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719503349;
	bh=nqL74ax75pWruU5MiHx4Tv8OQ6oYMWOlYMX7W+QBVFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BI5FgBqBMP5FKrncNAqqVJtPra5024pG9hl1ijpvcDJsIekV5rUj0JzgScOCtjGC0
	 5laD6fVdBlHLEWeUuyxwrn5ksk2coCoascyolx4NC/vAs2HdZYYUX2Tv3zXt5dOaAQ
	 g/vYRl+eXkTjNFPKvtDcIYixM1jrPHLfIUMPyB2m1Ode7rOdm3OD58I/UQIe0IaEAx
	 ymg23fV285rs5Hl6J7aozM0aLhJacvWpFe12agHVX2mUOGrszB/FCd9Ho9S+dm3Six
	 oeDjIwOnBBsruFY6DBWptVbcNlbLNQLkM0mQ0YVcnu/0VArqVybhhlCIMursp1Uq8L
	 qa9g4uHyogXtQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso933652166b.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 08:49:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxa3AsgMevA7yCH+UFxTbB0eAYzzPuc2YRbPPc6ateXIX2QGoPp
	C1ci59HM9e2h1NxJ1FiYukdccTkTDedgbjbnedP5u+dF39Qb7suLbtm+ZSGWkJSom5Qf1JKO5XF
	oRBkeH89gVOPhdHhLyYJ/tzZha8w=
X-Google-Smtp-Source: AGHT+IGMJMc5MnM5ZGkcUNODngcS4Rbq5bn55PsQgrJaAUmsDOl1dWXQyEwf2gvEQISuwOi9m+9gihIbKE4DI1b6frU=
X-Received: by 2002:a17:906:d509:b0:a6f:5192:6f4d with SMTP id
 a640c23a62f3a-a7242c4dfd3mr701399466b.8.1719503347692; Thu, 27 Jun 2024
 08:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240627103205.27914-2-CoelacanthusHex@gmail.com>
 <87o77mpjgd.fsf@all.your.base.are.belong.to.us> <6b8e1e79-5a2e-416c-8fee-878b3f5568a0@gmail.com>
In-Reply-To: <6b8e1e79-5a2e-416c-8fee-878b3f5568a0@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 27 Jun 2024 17:48:55 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNhV2d53G-ZPDXUkSTP-AzhqXs54XZuCiYjR=06A1+oq_A@mail.gmail.com>
Message-ID: <CAJ+HfNhV2d53G-ZPDXUkSTP-AzhqXs54XZuCiYjR=06A1+oq_A@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: always initialize regs->a0 to -ENOSYS
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Dmitry V . Levin" <ldv@strace.io>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_084911_404049_97EE5E08 
X-CRM114-Status: GOOD (  11.55  )
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

T24gVGh1LCAyNyBKdW4gMjAyNCBhdCAxNjoyOSwgQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hl
eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNC0wNi0yNyAyMjowOCwgQmrDtnJuIFTDtnBl
bCB3cm90ZToKPgo+ID4gQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdy
aXRlczoKPiA+Cj4gPj4gT3RoZXJ3aXNlIHdoZW4gdGhlIHRyYWNlciBjaGFuZ2VzIHN5c2NhbGwg
bnVtYmVyIHRvIC0xLCB0aGUga2VybmVsIGZhaWxzCj4gPj4gdG8gaW5pdGlhbGl6ZSBhMCB3aXRo
IC1FTk9TWVMgYW5kIHN1YnNlcXVlbnRseSBmYWlscyB0byByZXR1cm4gdGhlIGVycm9yCj4gPj4g
Y29kZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLiBGb3IgZXhhbXBsZSwgaXQg
d2lsbCBicmVhawo+ID4+IHN0cmFjZSBzeXNjYWxsIHRhbXBlcmluZy4KPiA+Pgo+ID4+IEZpeGVz
OiA1MjQ0OWMxN2JkZDEgKCJyaXNjdjogZW50cnk6IHNldCBhMCA9IC1FTk9TWVMgb25seSB3aGVu
IHN5c2NhbGwgIT0gLTEiKQo+ID4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPj4gU2ln
bmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBnbWFpbC5jb20+Cj4gPgo+
ID4gUmVwb3J0ZWQtYnk6ICJEbWl0cnkgVi4gTGV2aW4iIDxsZHZAc3RyYWNlLmlvPgo+ID4gUmV2
aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IFBhdGNoIHYy
IGhhcyBiZWVuIHNlbnQuCgpGb3IgZnV0dXJlIHBhdGNoZXM7IFlvdSBkb24ndCBuZWVkIHRvIHJl
c3BpbiBhIHBhdGNoIHRvIGFkZCB0YWdzLiBUaGUKdG9vbGluZyB3aWxsIHBpY2sgdXAgdGhlIHRh
Z3MgYXV0b21hdGljYWxseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
