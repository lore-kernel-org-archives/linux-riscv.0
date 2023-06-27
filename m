Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F887EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WW9SsXezwXJ/V7GXuohY7e9bKxqv5dvzBlRz2xGDSw=; b=dCdHTrgqevz9/+
	TLiMKtB/eHFNmX89DeD3qtR6gFNhT+267rZjnH1Yy7bHB27VRpKQFc9Kh9OWvAZL6xfDdiDe1eL1s
	B2jit7ZAqMkPcisg2qmSWmBQWlHmU19SXP8UMDWcIZOCy+osZHknzEHHZtIK8NmzO+7M9pDennx7+
	312FMMusRxhIq/oUy9Ut0mBrHYM8uYjBvgNwNXjKNvKhsE80Wf2zcYxfHYQ8hBcGBBptzpxI3BYci
	VxP3pH27CImQhl4yejTSQDYHd+R1HvDixr/SLthy/XpQ0npsQeEnukUqEcwgw8eMzcxmC3usHBg+P
	kvF5Hxs866fJWE6xAymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE354-00CLB2-2W;
	Tue, 27 Jun 2023 07:25:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE352-00CL9Q-1N
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 07:25:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2DC76103B;
	Tue, 27 Jun 2023 07:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B52C433C0;
	Tue, 27 Jun 2023 07:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687850739;
	bh=dY7O0inWKqxMcNEo507g6IqLULTmznVaHvhgDifv0FA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BSn19EGP+YMEUciJLXtTswoqBKJUyQn+j2Wx2M7DYgRfqqAwAn9vJcamBnT/xgHQF
	 ZmgM7dRLsSPU6p8ojug0rbCQZrah2f4z+icHyRllxoyYkA8fjkL3vAHMXm6DQFoo6d
	 wRCPmU3Zc23I1L9kidjoxZDdWk2wegnAxGznmtZ/YPhxexlzpkDeTzsKSrahx5PvgJ
	 XtzkKmW8KOZy3KTsaOre/xv+wFwS8oQTF8U83EmgucPx8rkAUlx2e78WRjLxwyDHJU
	 M951AuDJixExNQ9Ij17raaW7u/59M+Ikz7WlLF1tKauejjLGTHyBCONa7goLGy9vj0
	 +3iviujf597oA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, Andy Chiu
 <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Xianting Tian
 <xianting.tian@linux.alibaba.com>, Mattias Nissler
 <mnissler@rivosinc.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use
 trap
In-Reply-To: <20230625155416.18629-1-andy.chiu@sifive.com>
References: <20230625155416.18629-1-andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 09:25:35 +0200
Message-ID: <871qhxbc40.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_002540_507300_D9EFC899 
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBUaGUgZnVuY3Rpb24g
aXJxZW50cnlfZXhpdF90b191c2VyX21vZGUoKSBtdXN0IGJlIGNhbGxlZCB3aXRoIGludGVycnVw
dAo+IGRpc2FibGVkLiBUaGUgY2FsbGVyIG9mIGRvX3RyYXBfaW5zbl9pbGxlZ2FsKCkgYWxzbyBh
c3N1bWVzIHJ1bm5pbmcKPiB3aXRob3V0IGludGVycnVwdHMuIFNvLCB3ZSBzaG91bGQgdHVybiBv
ZmYgaW50ZXJydXB0cyBhZnRlcgo+IHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoKSByZXR1cm5z
Lgo+Cj4gRml4ZXM6IGNkMDU0ODM3MjQzYiAoInJpc2N2OiBBbGxvY2F0ZSB1c2VyJ3MgdmVjdG9y
IGNvbnRleHQgaW4gdGhlIGZpcnN0LXVzZSB0cmFwIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENo
aXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKR29vZCBjYXRjaCwKUmV2aWV3ZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
