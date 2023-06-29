Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C588EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/4uZbw7MEdi65R9akYTQvL2V1t1ZVnZx0mSJFSBbyo=; b=jUjic/LvstpdaY
	UWw1QL/XHMtp//MuliqKwg9L2YkzKe/b9dxCvKeMZUdNTQgJ6yc/BTKcIIg4bXirVKKlqydbyg67s
	4St8HHOVi4k3Cu0C+H4Vj5A55StIH/NPlhxfze6tii8OnbNRHlkywcavp+Y1fgvyKNPcoTFtvL69Z
	NbKKC24L8d1H2tVIwCzoyH7jkBKf5hY7S7vjUiBvtgv3XCpFokYWJCMiDhFjd1Pee/cGDap9vlGGf
	8SKbMPBDtBRo7Sb7PXwyxHSaq8N1m9dKbq/JCj4IRCuOhFhxKOygEPR8Xda1K3no9fPWZ4wukEGVl
	Wo07iuqmaMH2DfHagWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEs0V-001Dq3-2o;
	Thu, 29 Jun 2023 13:48:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEs0S-001Dpc-1c
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 13:48:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 767B6614E3;
	Thu, 29 Jun 2023 13:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77636C433C8;
	Thu, 29 Jun 2023 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688046498;
	bh=PH8aSohWWdvaZRG37bt8dE7ai4BFcS6D37ZmrWwFLC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rR0dz3VB81cr28RspgXkIZRnrO8hdfjsoi2fqj4OPIF8iqXaTCIHWgZj/nIHkkKyf
	 vKLDYfYkjBFiHZhXMfiHCvAulHVZ+8v0U95R5Meb9L8jacwIOcXfq+FfjXyZNSAI5Q
	 PeSsCw5mUWjAObNNVvYW4SPi9AsMzF0pmeLaqFDkBIoihQmeQkGYkyQHgN2DtGjYhY
	 Nt34OiKeAAyQqh2kegMYjKxPGTZiRscF4JZBVzra7M2FF6/nIHvz+jsLo38oGksHQH
	 3ds5n8RvUw7UEx1V9gQBoc3LisVEW0GL4g3wweUb3B07g0WememuSdwV6u6gCvrAlf
	 eRelCHxZxsP9Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, =?utf-8?Q?R?=
 =?utf-8?Q?=C3=A9mi?=
 Denis-Courmont <remi@remlab.net>, Darius Rad <darius@bluespec.com>
Subject: Re: [PATCH v3] riscv: Discard vector state on syscalls
In-Reply-To: <20230629-flight-vanity-c1c86240e7fc@wendy>
References: <20230629062730.985184-1-bjorn@kernel.org>
 <20230629-flight-vanity-c1c86240e7fc@wendy>
Date: Thu, 29 Jun 2023 15:48:15 +0200
Message-ID: <87fs6amlb4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_064820_598920_B8520A86 
X-CRM114-Status: UNSURE (   4.59  )
X-CRM114-Notice: Please train this message.
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBjbGFu
ZyBhbGxtb2Rjb25maWcgYW5kIHJ2MzJfZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgd2l0aCB0aGlz
IHBhdGNoLAo+IGFjY29yZGluZyB0byBwYXRjaHdvcms6Cj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYzoyOTk6MzogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAncmlzY3Zf
dl92c3RhdGVfZGlzY2FyZCc7IElTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0IGltcGxp
Y2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KClVnaC4gU2xvcHB5LiA6LSgKClRoYW5rIHlvdSEKQmrDtnJuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
