Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F48C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxbCdHhzmDY+mmChmU3LyZbgaWtiOgaUlDlBqi/U80A=; b=jopp7ZRivdT6NC
	F12+faadwozavVfHHNlFLZ3cn5s3sWsNrjChfpehiKA9dVxhErnUltS849prrtcE63bBe40dt37sw
	yO2xEr2hZq216AOs5S0ygXZ5FAO4o/QlIs+nLIj/ppA6lui+qYVxy7JMSX7a3qV9dmOBtYjqQlSvP
	rjKA1H7bhQ8YH7rR8ONXLkrZ5uYitogwFOTt721LGf0m8k8PaUsKwslu3CshgFkNF0Bl/dAqwIz8g
	mivJ4NGSLkoOP6P51nY23V1C+vMvg3SpHBE213xUM8Nf+4Txrn754u8zTYQ6JrpODPVnq/YV0Dd1u
	ATepqk/Kyri/y3UgTHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhSt-0000000Agqp-3wIL;
	Wed, 07 Feb 2024 12:55:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhSr-0000000Agq3-0sUO;
	Wed, 07 Feb 2024 12:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 437A6CE189E;
	Wed,  7 Feb 2024 12:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295D0C433C7;
	Wed,  7 Feb 2024 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707310542;
	bh=OqO47zrMtFcqPOc5eFmBtHhP/Vp4uEHbdMjDNWFDyDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J2ouZ6MkZ6Aq1Hi0Y3We/Gn/CLPgFPHOZd3JpzD+EnxJrxY/Foaono86PQnCY3/3L
	 neeign9PDE8fspUqWU8jaMAslNYdvVw+DGmtJhgc5Rn+ssD4nLdgo7DtvxwEhZYrJ1
	 qi99a7HI7YJBfmvhKcS3oAAu5V3Ay6NZ98E8tfdyBczVYb5KvxTJ5ockjO/fh0T5rF
	 5AlCtH9ivlUGlQyNOz/3AJDmDqdG65BImOdkqBeDUq9R5OrvAgGbn/97dzFFSEApwD
	 e3J80Nn/F7DNsWbBuJd61iB+Hi+9LST8cs5A5aifhmI0xF2y65m94GUfRfkKpDWu87
	 NSuqC4hhG9B8A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <87plx8y5s3.fsf@all.your.base.are.belong.to.us>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87h6ily53k.fsf@all.your.base.are.belong.to.us>
 <CAAhSdy2PPjS6++Edh8NkgiBmcovTUjS5oXE2eR5ZwPfAfVA0ng@mail.gmail.com>
 <874jekag3w.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2XJYTfY4nXWtjK9OP1iXLDXBVF-=mN1SmJDmJ_dO5CohA@mail.gmail.com>
 <87plx8y5s3.fsf@all.your.base.are.belong.to.us>
Date: Wed, 07 Feb 2024 13:55:39 +0100
Message-ID: <87sf24mo1g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_045545_443113_A2C3D2EB 
X-CRM114-Status: GOOD (  10.04  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPj4+IEhtbSwgc2VlbXMg
bGlrZSB3ZSdyZSB0YWxraW5nIHBhc3QgZWFjaCBvdGhlciwgb3IgYXQgbGVhc3QgSSBnZXQgdGhl
Cj4+PiBmZWVsaW5nIEkgY2FuJ3QgZ2V0IG15IG9waW5pb25zIG91dCByaWdodC4gSSdsbCB0cnkg
dG8gZG8gYSBxdWljayBQb0MsCj4+PiB0byBzaG93IHlvdSB3aGF0IEkgbWVhbi4gVGhhdCdzIHBy
b2JhYmx5IGVhc2llciB0aGFuIGp1c3QgdGFsa2luZyBhYm91dAo+Pj4gaXQuIC4uLmFuZCBtYXli
ZSBJJ2xsIGNvbWUgcmVhbGl6aW5nIEknbSBhbGwgd3JvbmchCj4+Cj4+IEkgc3VnZ2VzdCB0byB3
YWl0IGZvciBteSB2MTMgYW5kIHRyeSBzb21ldGhpbmcgb24gdG9wIG9mIHRoYXQKPj4gb3RoZXJ3
aXNlIHdlIG1pZ2h0IGR1cGxpY2F0ZSBlZmZvcnRzLgo+Cj4gT0shCgpJIGRpZCBzb21lIHJlYWxs
eSByb3VnaCBjb2RlIHNrZXRjaGluZywgYW5kIEknbSBjb25maWRlbnQgdGhhdCB5b3UgY2FuCmdl
dCByaWQgb2YgYWxsIGlkc19lbmFibGVkX2JpdG1hcCwgaHdpcnFzX3VzZWRfYml0bWFwLCBhbmQg
dGhlCmNvcnJlc3BvbmRpbmcgZnVuY3Rpb25zL2xvY2tzLiBJJ2Qgc2F5IG9uZSBsb2NrIGlzIGVu
b3VnaCwgYW5kIHRoZSBrZXkKaXMgaGF2aW5nIHRoZSBwZXItY3B1IGltc2ljX2xvY2FsX3ByaXYu
dmVjdG9ycyBjaGFuZ2UgZnJvbSBzdHJ1Y3QKaW1zaWNfdmVjdG9yICogdG8gc3RydWN0IGltc2lj
X3ZlY3RvciAqKi4KClVzaW5nIHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZSgpIHRvIElQSSBlbmFi
bGUgKGFuZCBkaXNhYmxlIGlmIHlvdSBkb24ndAp3YW50IHRvIHVzZSB0aGUgbGF6eSB0aW1lciBk
aXNhYmxlIG1lY2hhbmlzbSkgc2VlbXMgZmVhc2libGUgYXMgd2VsbCEKCihMZXQgbWUga25vdyBp
ZiB5b3UgZG9uJ3QgaGF2ZSB0aGUgc3BhcmUgY3ljbGVzLCBhbmQgSSBjYW4gaGVscCBvdXQuKQoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
