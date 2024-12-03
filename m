Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29168E64A84
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrA3wrByddibWFaNKvNZDT/YvXPRXXgTmsXP/DxCK4Y=; b=SVeq4feOrtiym6
	oH0gnauSXUI6BOCby3GbtRoOZux7K8F++ew7Yqnljm2ZPSsyNx9ALuDex6CT/3RczizabV7nEJfct
	Q2ZiM+NTy9kx23bKB1VOeZbNmYAYq0EwqisWwMljJBU7gbK3tybi9/NYbLCDWSReiZ0MP/wuM3fTs
	RTYfBLvv92j1vGd2LMwEfEZGoGPcYd9s88PF3HEEreHUT/2jGNfW2MkbNzTsn1UY4qFqV38naf/ip
	P97vLQWISb9LMewi/4Jz6Tv8QTzCsZgmvsV/c3Cc6Cs/1YyLJaM+g2T97NODT4NIRsjdf9kFPyWAa
	9GZauWU+mer+7qnQn2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRer-00000009Mv6-3nzu;
	Tue, 03 Dec 2024 12:05:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRep-00000009Mua-3KWH
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 12:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F0FA5C6C6F;
	Tue,  3 Dec 2024 12:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FC7C4CECF;
	Tue,  3 Dec 2024 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733227534;
	bh=XZL3EXcmYT1TBAIqC6Hq3AdX/PAarjlqzMpxn3DIAfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MLzgSAxoTaW3EsaOzZnGZ2LWvOEy3OwzJbnEqiOIgebxkSDHx+YaRme+b+h1s/2u3
	 EKVRL/eafvWSGKuS2DKduFZUgP+RrNqnAbAwucO89XIIdxMYW2pfQ3cYNO7+WUm+Ib
	 DeM/BO5i60VT7Osreuz5qV0ni9n7kT4W7k0mlm0HPI01LXIuIv7wADPdMqgBb5eoql
	 krFBvEOeRZHeU3Em2cg8WXhc3g3iQ/XFJT83Qb4wvATAwLhLn8yR83jnB+nViGu4pD
	 cxmwUy3kHMqBgbHEKyad9fJhR5qwYyCxFYPpxzONzdCS/Gbe7MTeNY+NCGa13U10pW
	 qM9Q56CkL6CLA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com,
 puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com,
 greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
 tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com,
 zong.li@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v3 1/7] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
In-Reply-To: <20241127172908.17149-2-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-2-andybnac@gmail.com>
Date: Tue, 03 Dec 2024 13:05:30 +0100
Message-ID: <87wmghotth.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_040535_876746_A2E09E5A 
X-CRM114-Status: UNSURE (   7.19  )
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

QW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+IHdyaXRlczoKCj4gRnJvbTogQW5keSBDaGl1
IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPgo+IFNvbWUgY2FsbGVyLXNhdmVkIHJlZ2lzdGVycyB3
aGljaCBhcmUgbm90IGRlZmluZWQgYXMgZnVuY3Rpb24gYXJndW1lbnRzCj4gaW4gdGhlIEFCSSBj
YW4gc3RpbGwgYmUgcGFzc2VkIGFzIGFyZ3VtZW50cyB3aGVuIHRoZSBrZXJuZWwgaXMgY29tcGls
ZWQKPiB3aXRoIENsYW5nLiBBcyBhIHJlc3VsdCwgd2UgbXVzdCBzYXZlIGFuZCByZXN0b3JlIHRo
b3NlIHJlZ2lzdGVycyB0bwo+IHByZXZlbnQgZnRyYWNlIGZyb20gY2xvYmJlcmluZyB0aGVtLgo+
Cj4gLSBbMV06IGh0dHBzOi8vcmV2aWV3cy5sbHZtLm9yZy9ENjg1NTkKPgo+IFJlcG9ydGVkLWJ5
OiBFdmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5AeWFkcm8uY29tPgo+IENsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvN2U3Yzc5MTQtNDQ1ZC00MjZkLTg5YTAt
NTlhOTE5OWM0NWIxQHlhZHJvLmNvbS8KPiBBY2tlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5h
dGhhbkBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+CgpGaXhlcyB0YWc/CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
