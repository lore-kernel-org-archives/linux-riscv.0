Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2C7Y7qGOtZ4CNirT5LBSOoNvIGO5pn9GbT+IB9749A=; b=rsf38R9UaZuvzt
	g1MWK5rSlvownjmw3BMpDsvvOzqc8YsDi2pe5R4/9vbE4I5sO87mxzP9oWkYwjLaPg7I+h5/nc2Ng
	7oITU6WcqVXI4tizgB5NRk6wh3H6C0SiNa+Li6GdqZOo4CdjB/KYMhT7NMUuDyS5JtqmHlmhHHPWS
	twY9bjiFgNZMrCj38YskZsMJW/8NHh3XL+6gXPNjeW8hb/dG0wTJ+9yoPzWlHhuY6Ysxpztt1r9bF
	h8146zXqRhfwSmR82wc3cWCVei6+a7F+RBLCB6jaTrHu8rhYTLWbN2h4eXU9AyqXlmIVXdSkrOs1v
	J6I6DNPu0miBBhcvCvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqHH-00Amfj-0l;
	Mon, 26 Jun 2023 17:45:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqHF-00AmfI-0E
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 17:45:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64EC060F10;
	Mon, 26 Jun 2023 17:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AFAC433C0;
	Mon, 26 Jun 2023 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687801523;
	bh=+kUmBnlJJH57De2VxGhsUAjHC+GxcuB0Jy6ACQhtu1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lVnF0ewmjn07l1/Loc4mw3nbnex0dnqjCAH6ay9NGIeCFqI6eAEQcQT0yqwvvpb5d
	 74Qj97QphTcXEAmP1zsB1si8XaFTYH6PcFX55gJmXBAV6U5NewvZJaSJ17hmncmbYN
	 27ztGL82x54Q8aqOLtzaGJrSC+tNLLsawHmwEHgAmPmwlHuRf30mRtGMh4KH1GXyhE
	 czy9Jo1ffJYjy97NKWlT5Kq98q0awO/sgGdDsBLcJwwtgiIuY/OqW5mD/0VffGy63q
	 D02/IQGnFHxLBBTLhDqc+ZpfhSZuw8iz4WUJUAjmEY/oWJnmT025q5ZCl4qF7tkIhc
	 /na2/2kWtYuDg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, =?utf-8?Q?R?=
 =?utf-8?Q?=C3=A9mi?=
 Denis-Courmont <remi@remlab.net>, Darius Rad <darius@bluespec.com>, Andy
 Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2] riscv: Discard vector state on syscalls
In-Reply-To: <20230626165736.65927-1-bjorn@kernel.org>
References: <20230626165736.65927-1-bjorn@kernel.org>
Date: Mon, 26 Jun 2023 19:45:20 +0200
Message-ID: <87y1k6m827.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_104525_146502_C7EA4355 
X-CRM114-Status: UNSURE (   5.48  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGUgUklTQy1WIHZlY3RvciBzcGVjaWZp
Y2F0aW9uIHN0YXRlczoKPiAgIEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2Fs
bGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPiAgICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZz
dGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCgpBIGJpdCBvZiBhIGNvcm5lciBjYXNlLCBidXQg
dGhpcyB3aWxsIG1ha2Ugc2lncmV0dXJuIHN5c2NhbGxzIGRpc2NhcmQKdGhlIHZlY3RvciBzdGF0
ZSBhcyB3ZWxsLgoKSXMgdGhhdCBhbiBpc3N1ZT8gRS5nLiBhIHVzZXIgY2Fubm90IGJ1aWxkIHVz
ZXJzcGFjZSBjb250ZXh0IHN3aXRjaGluZwphcHBsaWNhdGlvbi4gRG9lcyBhcm02NCBTVkUgaGFu
ZGxlIHNpZ3JldHVybiBpbiBhIHNwZWNpYWwgd2F5PwoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
