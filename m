Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD35EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNwUeprW2zu0/8ShM1JbyX7SQOgutMmlLQ0+KuVJTsY=; b=BBuqs/uc6uOnNx
	DMlWanU2pvozBDOaFWgs94CXiXWOLVO27JZBNoKj4r2npsX8JIRUXdUAwoMf9oNAqlqSrzQMPFBiB
	pCODxBD09F6HiiILvUkDmzEOmozqRZzp26iZA1FAinVck3OSwUuUeyJCpqA3PsiCNAHqNJX2x1RET
	kWNfDiEl9M+dDf5I2JM3ssBJO3GFQhnsibnkCG4lfwZZ6od3d8Gt4M0kaIxhCFxSaYiQNdLM4OGcd
	1wCQTFXHNkfBbNm0oRcoTZIcd7OIG3A39/agUwinRjxXT6S/DW2gbqlP+ZmzxGaLP+56UXodj5ovr
	cr4mACBvBbZ14a5vhuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoQh-00AXyS-2V;
	Mon, 26 Jun 2023 15:47:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoQf-00AXy3-1s
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:47:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09D2C60EE2;
	Mon, 26 Jun 2023 15:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597B4C433C0;
	Mon, 26 Jun 2023 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687794420;
	bh=Q60Kt5vlLtP8NFJ/7bDseV+2BBSppFzAzKnhgFt9Has=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nJYpTvPowv2grZcTH4v+Ljy1s52QpDQy2kgsioY81I9mMXSjRYFgq1B8KFPIjAYhm
	 OvJcY+Q/9H8De5I/om0K+nUkh6J81V3JbNhJnD0aj1TjQjgD+tKwgTq/Z41Rh4J3WI
	 Dt7S7GnJzpKELkmKmpXFRaS/VwFw5xygR8N0+0KFXtl5wSlOgReWRTcLAsMDU6sPWh
	 7QFEYDjvlK1bX0yYzlzaBRzgxY/PPMI271wTJawZ2kASTzdQ6ikQ8vht/spYKv7rez
	 RwJ5OL4Ji7bjOo4xsFTEnrkMI1tFgUuvOG8ylAHm5ZE0SJqclD9LLty7NS1uu8fK8E
	 cp62z+Nvkw8jw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, =?utf-8?Q?R?=
 =?utf-8?Q?=C3=A9mi?=
 Denis-Courmont <remi@remlab.net>, Darius Rad <darius@bluespec.com>, Andy
 Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH] riscv: Discard vector state on syscalls
In-Reply-To: <b990638b-a86a-ee43-f8b1-18a0a0651ad0@rivosinc.com>
References: <20230622173613.30722-1-bjorn@kernel.org>
 <b990638b-a86a-ee43-f8b1-18a0a0651ad0@rivosinc.com>
Date: Mon, 26 Jun 2023 17:46:57 +0200
Message-ID: <874jmuns3y.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_084701_665577_0CE302DC 
X-CRM114-Status: UNSURE (   5.24  )
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

VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBPbiA2LzIyLzIz
IDEwOjM2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4+Cj4+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNpZmljYXRpb24gc3Rh
dGVzOgo+PiAgICBFeGVjdXRpbmcgYSBzeXN0ZW0gY2FsbCBjYXVzZXMgYWxsIGNhbGxlci1zYXZl
ZCB2ZWN0b3IgcmVnaXN0ZXJzCj4+ICAgICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFydCB0
byBiZWNvbWUgdW5zcGVjaWZpZWQuCj4KPiBTbyB0aGUgb25seSB1c2UgY2FzZSBvZiBzYXZpbmcv
cmVzdG9yaW5nIFYgcmVncyBpbiBfX3N3aXRjaF90byBpcyBhbiAKPiBpbnRlcnJ1cHQgaW5kdWNl
ZCB0YXNrIHN3aXRjaCA/CgpZZXMhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
