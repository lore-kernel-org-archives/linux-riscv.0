Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D931BEA3F0F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+XKwro4QJNuy0WjeXitfWa5/15/pAh9CVfztRx93y8=; b=VyH1tyKUxszWhz
	XZ7qU4ZwghIgqdJNAcb23r7aB+PqqJZzCp9iJewHgx5AkFGDkcda8V5edlWWLVuX7yDDB6nTgbJTq
	HZzpj92CmvH9kNGuc6mNPIuRiDGhAX+2snVg6tqfbPitwTk1MRtzVOSywakJcdyd+390UjIGE7HC1
	GvN9gx3eDfJZ9C6EvzfP3L/lWRkp2h9afU+jGuNAlTYyRUlUhI62WWdzHpVVe/oc5f1H0g/JaYZlW
	HWiFLlypQN6scmN8dUmKfEX4SG32IL+RxgfclbzQzChn9YwvuGyTaKQB0ZcshS9CzHB/wGMTB+7YQ
	xLbmNDaSqIIHnJ2Lx8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi8b-0000000GcyT-2o4p;
	Tue, 10 Feb 2026 07:26:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi8Z-0000000Gcxu-06Dw;
	Tue, 10 Feb 2026 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770708361;
	bh=8ledWZbn+TzX2T22Aa+xwzh+iAFsRkUxzf+EyA9TX7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E+HqPabozX7gbg0tjWTuECfyirjpr0nWgXujSn25Ar2B8oaYpH00TUh9B6IaioJHK
	 eqU8tsIKfX2npYQkA6VV+LUbeg3jeX5Y2Lp6C3QlDl3gMmxV7cvzCR0up3C42CRskV
	 gL5Re3fuUEVoMqQhoTsTCvPf9mBuv6DQeL5ijfZL3TgWi4JED1isiv96UgEinTPqia
	 0vuJioL5O2vOOTjQaUd9Ej0WeZECD8LcpZ0dYoPhUwD2bORMRPCMxY/u+ouZGTzSAT
	 KCNvYAYKiXaEZf2ASacIaApc7p3K7HOa68CmC+7YlH+XFkdyIJOB7BgjpzaLc8T6Qo
	 6kclYs2fn75UA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 179126024E;
	Tue, 10 Feb 2026 15:25:59 +0800 (AWST)
Message-ID: <feedc58438adad98f4b2a74a1499b2afa92a5eae.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"	
 <linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"	
 <linux-riscv@lists.infradead.org>, Jeremy Kerr <jk@codeconstruct.com.au>
Date: Tue, 10 Feb 2026 17:55:58 +1030
In-Reply-To: <6de719dc84324166ed60bb8ec130cf2c9ef351f5.camel@codeconstruct.com.au>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
		 <20260205-intrepid-vengeful-deer-14e2eb@quoll>
		 <TY2PPF5CB9A1BE69B07F90DFB245FAB735DF299A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
		 <d5e45c9f-f3c7-4289-8991-02bd2c5b9587@kernel.org>
	 <6de719dc84324166ed60bb8ec130cf2c9ef351f5.camel@codeconstruct.com.au>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_232619_263299_6E594480 
X-CRM114-Status: GOOD (  10.12  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCAyMDI2LTAyLTA2IGF0IDE3OjQ5ICsxMDMwLCBBbmRyZXcg
SmVmZmVyeSB3cm90ZToKPiBJcyBpdCBhY2NlcHRhYmxlIGlmIHdlIHRha2UgdGhlIGZvbGxvd2lu
ZyBhY3Rpb25zOgo+IAo+IMKgwqAgMS4gRG8gc29tZSBiNCBtYWdpYyB0byB0cmFuc3BsYW50IHRo
aXMgc2VyaWVzIGJhY2sgb250byBbMV0KPiDCoMKgIDIuIFNlbmQgYSBmb2xsb3cgdXAgcmV2aXNp
b24gd2l0aCBhIGxpbmsgdG8gdGhpcyBkaXNjdXNzaW9uIGluIHRoZQo+IMKgwqDCoMKgwqAgY292
ZXIgbGV0dGVyCgpGb2xsb3dpbmcgdXAgbXkgb3duIHBvc3QsIEkgZG9uJ3QgdGhpbmsgd2Ugc2hv
dWxkIGF0dGVtcHQgc3VjaApncmFmdGluZy4gWzFdIHJlZmVyZW5jZXMgdjQuIHY0IHdhcyBzdXBl
cnNlZGVkIGJ5IHY2IGF0IFsyXSwgd2hpY2ggd2FzCm1lcmdlZC4KCkJlY2F1c2Ugb2YgdGhhdCBt
ZXJnZSwgc2VwYXJhdGluZyB0aGlzIHByb3Bvc2FsIGludG8gYSBuZXcgc2VyaWVzIHNlZW1zCndh
cnJhbnRlZCwgYnV0IGhhcyB0aGUgZG93bnNpZGUgb2YgbWFraW5nIGl0IGRpZmZpY3VsdCB0byBj
b21wYXJlIHRvIHY0Cm9mIHRoYXQgZWFybGllciBzZXJpZXMuCgpJIGhhdmUgZ29uZSB0aHJvdWdo
IGVhY2ggb2YgeW91ciBmZWVkYmFjayBpdGVtcyBmcm9tIHRoZSBlYXJsaWVyIHNlcmllcwp0byBj
b25zaWRlciByZWN1cnJpbmcgaXNzdWVzLiBEZWZpbmluZyBhIG5ldyBiaW5kaW5nIGlzIHVuZm9y
dHVuYXRlIGJ1dAppdHMgYWRkaXRpb24gc2lkZS1zdGVwcyBhbiBBQkkgYnJlYWsgLSBwZXJoYXBz
IHJhdGhlciB0aGFuIHJlbW92ZSB0aGUKZXhpc3RpbmcgYmluZGluZyB3ZSBjYW4gZGVwcmVjYXRl
IGl0LCBhbmQga2VlcCB0aGUgYXNzb2NpYXRlZCBkcml2ZXIKKGFzc3VtaW5nIHRoaXMgaXNuJ3Qg
b3ZlcmtpbGwsIGdpdmVuIHRoZXJlIGFyZSBubyBpbi10cmVlIHVzZXJzKS4KT3RoZXJ3aXNlIGl0
IGxvb2tzIHRvIG1lIGxpa2UgdGhlIHByb3Bvc2FsIGhhcyBjb25jZXJucyBjb3ZlcmVkLCBidXQK
bGV0IG1lIGtub3cgaWYgbm90LgoKQW5kcmV3CgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8xYTJjYTc4NzQ2ZTAwYzJlYzRiZmMyOTUzYTg5N2M0ODM3NmVkMzZmLmNhbWVsQGNvZGVj
b25zdHJ1Y3QuY29tLmF1LwpbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAz
MDA2MDE1NS4yMzQyNjA0LTEtcnlhbl9jaGVuQGFzcGVlZHRlY2guY29tLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
