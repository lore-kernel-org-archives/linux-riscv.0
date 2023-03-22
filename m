Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8032EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjQvx03ieV77NYFb53C8CaHAXEQ+qe9WC5mFAS8lSnk=; b=y1E0rBjh9D0ZKl
	GKkw0Mfvff6zaP8Vsm9A4qO896jbeGUDxXPFKVnJ22Z48Tj7UnCNL6L0GRYuBvRx6364CqT5GOl3a
	qNEz2bcRsgZX7djl9dfDKQgkaO+/DJ2CBwVUoi37jMCB9Zz+vttVRAfZGqn6UojxsUBpQmP81wUSL
	Mui2HLqw4f4cqfWlSctEwRDMpx0tFHRZZhLGvAANUblQJPtiAh0/ShGxrJLoIPuStETze/JWONQRB
	HtUXwgLACLJAqkjEoahU+HG7OjDWTzEyJzx42JSC1FXEKhPc0un5azeLaEtefjjB1HDed5SgLAq4N
	9OfxY4p9o/hYlUEZflew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezjR-00GMRF-2G;
	Wed, 22 Mar 2023 14:46:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pezjP-00GMPm-0R
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 14:46:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0618BCE1DD3;
	Wed, 22 Mar 2023 14:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8027C4339B;
	Wed, 22 Mar 2023 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679496383;
	bh=mcvsw1hiR3Qyp1OeN9vHnJd3gGmdmQuM7Wjd77b+bFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ELQQHZhIzJhFR/Tk978Cc4oL5KccT10G3P7OufM8u/DwJJrgnZYhnwjbsbICQlAMV
	 H+J2nxPCk7sKDxEk34dFgAr484iXX4ipdk//qSUVurVNswYNy4ZSHw5nYc790DuL3M
	 PnNS/ccgSsaYCQELdpk4B0pPGzXNVCo1CFLdg1MfyiNyibq7XYuZHOI0bzhHhix8lj
	 U6J4yngMnQ+jtjD45ynxoDUuwZ57lvqd/kXS1x484UXRQ4eNCmEdQzZJDa/oy2x3Ia
	 VYXpIz0i0RFlhNGItPYC8Dn2i2KTVu5XRZTviQ2+ZYGkJJUGLZ+Fac/BU6OCPSePxT
	 XixNdk9EVFQPg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 mark.rutland@arm.com, ben@decadent.org.uk, palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Subject: Re: [PATCH -next V17 1/7] compiler_types.h: Add __noinstr_section()
 for noinstr
In-Reply-To: <20230222033021.983168-2-guoren@kernel.org>
References: <20230222033021.983168-1-guoren@kernel.org>
 <20230222033021.983168-2-guoren@kernel.org>
Date: Wed, 22 Mar 2023 15:46:20 +0100
Message-ID: <87ilesu9mr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_074627_365188_6AE18441 
X-CRM114-Status: UNSURE (   7.26  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBMYWkgSmlhbmdzaGFuIDxsYWlqc0Bs
aW51eC5hbGliYWJhLmNvbT4KPgo+IFVzaW5nIF9fbm9pbnN0cl9zZWN0aW9uKCkgZG9lc24ndCBh
dXRvbWF0aWNhbGx5IGRpc2FibGUgYWxsCj4gaW5zdHJ1bWVudGF0aW9ucyBvbiB0aGUgc2VjdGlv
bi4gSW5oaWJpdGlvbiBmb3Igc29tZQo+IGluc3RydW1lbnRhdGlvbnMgcmVxdWlyZXMgZXh0cmEg
Y29kZS4gSS5FLiBLUFJPQkVTIGV4cGxpY2l0bHkKPiBhdm9pZHMgaW5zdHJ1bWVudGluZyBvbiAu
bm9pbnN0ci50ZXh0LgoKR3VvLCB0aGUgZ2VuZXJpYyBlbnRyeSBzZXJpZXMgZG9lc24ndCBhcHBs
eSBjbGVhbmx5IG9uCnJpc2N2L2Zvci1uZXh0ID42LjItcmMxLCBhbmQgdGhpcyBwYXRjaCBpcyB0
aGUgaXNzdWUuCgpDb3VsZCB5b3UgZG8gYSByZXNwaW4gKHBvdGVudGlhbGx5IHcvbyB0aGlzIHBh
dGNoKT8KCgpDaGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
