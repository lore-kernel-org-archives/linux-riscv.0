Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A27C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWVakahKLZUkKVfXfBBzi+BuXNGR5T/IwhRG8b9EyDU=; b=g00eP4/OEdkCCU
	Vu8HiBTIDyn88xHM86I1ksO9Ec4gAEIATwjinZQuge5WCTa0MFky91+ptKKSLptL0jGhSIQOvNz2P
	NOwbkBnh7x3CDIJYse86u++7s5KllLFDnxG8nFOE4xXLSkUS3T078aTZ58ydWbuZEKs+hkLRMQQAH
	89hpjsQdn2bUrevU+aMQs4Na6LQl5tko9TMQIWCbYUP2UHC5V3uT1lZLUO/oBKVyBeC2NecP9tbGM
	4txHMSZ8Vp/u8NM95MmFxoorXw/pOLds80bTTxwQft7I8ZJFKWAUlRnmtfaswMTDGGeD0CjmaodqR
	nYDdXqLSw3V0B+jzUY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrUc-001JIU-2X;
	Tue, 15 Aug 2023 10:41:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrUa-001JHn-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 10:41:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51A6D62AD2;
	Tue, 15 Aug 2023 10:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6B5C433C8;
	Tue, 15 Aug 2023 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692096096;
	bh=go9GktnTDQemuyYp+pjz7YeZT6EfkYyvAQSsmKP2/HM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EjpuD1IXzhFvx8GnuKnapM0gwyhbHu08DI5FgZFXLLZwCK4YB2pDeYPpi2xoeFa0m
	 +7TAfBhyIXWNx4lcJ6SgxBbFJosJGZePG1mZOR0V6qNFeSM02swvJBhbU3J0tQwPZ0
	 OYBREGOKsFKINAq6azv/1Rxda9eNzfPQdUfiSBOVsfszD28p/8r/raVH44t24LY/e7
	 wBRw6A50NuxkDKH+Ld7g4u6pAykCmBOgwOp6avw2slRXHZyCWVNn07kc9pXReNhpvt
	 hbqkmIcIAdz+kRGmRD1DRzTzggthwY6KNpc4tuEheGprBIC9gKyBj0X+QslvQuQqTK
	 QsgKjiTuHPiWg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, paul.walmsley@sifive.com,
 guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org,
 heiko.stuebner@vrull.eu, Andy Chiu <andy.chiu@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Yipeng Zou <zouyipeng@huawei.com>, Jisheng
 Zhang <jszhang@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, Heiko
 Stuebner <heiko@sntech.de>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, Mathis
 Salmen <mathis.salmen@matsal.de>, Andrew Bresticker
 <abrestic@rivosinc.com>
Subject: Re: [v2, 1/5] riscv: sched: defer restoring Vector context for user
In-Reply-To: <20230721112855.1006-2-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-2-andy.chiu@sifive.com>
Date: Tue, 15 Aug 2023 12:41:33 +0200
Message-ID: <87o7j8egf6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_034140_586923_B5FD3A25 
X-CRM114-Status: GOOD (  11.13  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBVc2VyIHdpbGwgdXNl
IGl0cyBWZWN0b3IgcmVnaXN0ZXJzIG9ubHkgYWZ0ZXIgdGhlIGtlcm5lbCByZWFsbHkgcmV0dXJu
cwo+IHRvIHRoZSB1c2Vyc3BhY2UuIFNvIHdlIGNhbiBkZWxheSByZXN0b3JpbmcgVmVjdG9yIHJl
Z2lzdGVycyBhcyBsb25nIGFzCj4gd2UgYXJlIHN0aWxsIHJ1bm5pbmcgaW4ga2VybmVsIG1vZGUu
IFNvLCBhZGQgYSB0aHJlYWQgZmxhZyB0byBpbmRpY2F0ZXMKPiB0aGUgbmVlZCBvZiByZXN0b3Jp
bmcgVmVjdG9yIGFuZCBkbyB0aGUgcmVzdG9yZSBhdCB0aGUgbGFzdAo+IGFyY2gtc3BlY2lmaWMg
ZXhpdC10by11c2VyIGhvb2suIFRoaXMgc2F2ZSB0aGUgY29udGV4dCByZXN0b3JpbmcgY29zdAo+
IHdoZW4gd2Ugc3dpdGNoIG92ZXIgbXVsdGlwbGUgcHJvY2Vzc2VzIHRoYXQgcnVuIFYgaW4ga2Vy
bmVsIG1vZGUuIEZvcgo+IGV4YW1wbGUsIGlmIHRoZSBrZXJuZWwgcGVyZm9ybXMgYSBjb250ZXh0
IHN3aWN0aCBmcm9tIEEtPkItPkMsIGFuZAo+IHJldHVybnMgdG8gQydzIHVzZXJzcGFjZSwgdGhl
biB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc3RvcmUgQidzCj4gVi1yZWdpc3Rlci4KPgo+IEJlc2lk
ZXMsIHRoaXMgYWxzbyBwcmV2ZW50cyB1cyBmcm9tIHJlcGVhdGVkbHkgcmVzdG9yaW5nIFYgY29u
dGV4dCB3aGVuCj4gZXhlY3V0aW5nIGtlcm5lbC1tb2RlIFZlY3RvciBtdWx0aXBsZSB0aW1lcyBm
b3IgdGhlIHVwY29taW5nIGtlbmVsLW1vZGUKPiBWZWN0b3IgcGF0Y2hlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gQWNrZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZpZXdlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
