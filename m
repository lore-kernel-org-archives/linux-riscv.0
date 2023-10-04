Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA85E8FDCB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 05:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjbyZfzLsRnwRS9ggBBZiRwMK+taeDSyHLBHE74sSUw=; b=KzJUZD2L/JrK9f
	h93UK0nkUIOVasnmKhYDhhnn5acINDA5H1CnAClf4DugOwm/nWXIg0iPeN/b/8f8AOQEKFdYLIof3
	12D9XKWB22RYEVidh5ulBx+igFznskVS8m/AO0mcVsInbBgUsB6GM1N5I8/ETqm5yiqYNUN88wvsD
	1RBT7xIMC8JT8GVjFguQKReMFH8Dga5ORAXOm0xhTEQ259GUbrip36jKRxSaNX/pFOyxUd4apzley
	6t+7AYH2Ic64K4hZdjRdtU3EPSnefsNC88L8UnMWJzRW7GMoRvvzZgaWftwrXumlCtiZSs03tBIdX
	2DnlGaJI2cVDDNRqh2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnurV-00GKIv-2H;
	Wed, 04 Oct 2023 05:55:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnurT-00GKIS-2T
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 05:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ADF161435;
	Wed,  4 Oct 2023 05:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F41C433C7;
	Wed,  4 Oct 2023 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696398953;
	bh=ssPARn68NgZDptbx2mvFf6HZm3RGCbrKiLLObwEzL6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cfb7ppcDmUlLaFFSKE4IQKv/be6tMpKFfECXmye5RC4kDTwlvkn4oIqiX6iAVNIxn
	 yEfyicZRlqC3jadXNqUBaTa4HiaqekF2w/VI6dWbCCmaB3/Z/ymmAY7PwDb+8FGr3P
	 V0xNYXYja95n/PyMqGZrkwiGJ0EJ1aGes4ewYNYR3SESSpnsPmR74609h2uwIwYq6h
	 9GmlBsUOtLVAwVGBnGMskAvIUuPw1ixj6mDkFmHDlpfcarITey7MZXJale6rKGYvjt
	 EZs8Uz2gjGlI+UjcK1Pz4Z9o7xTzSSG7EyAHnKwk1Z0USVLpmQGDwLTbDyvqzSoN+C
	 3NVQ1KnszEb+w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now
 prefixed with __riscv_
In-Reply-To: <20231003182407.32198-1-alexghiti@rivosinc.com>
References: <20231003182407.32198-1-alexghiti@rivosinc.com>
Date: Wed, 04 Oct 2023 07:55:50 +0200
Message-ID: <87r0mb3p95.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_225555_853447_B86BEAF1 
X-CRM114-Status: UNSURE (   7.33  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IGZ0cmFj
ZSBjcmVhdGVzIGVudHJpZXMgZm9yIGVhY2ggc3lzY2FsbCBpbiB0aGUgdHJhY2VmcyBidXQgaGFz
IGZhaWxlZAo+IHNpbmNlIGNvbW1pdCAwOGQwY2UzMGUwZTQgKCJyaXNjdjogSW1wbGVtZW50IHN5
c2NhbGwgd3JhcHBlcnMiKSB3aGljaAo+IHByZWZpeGVzIGFsbCByaXNjdiBzeXNjYWxscyB3aXRo
IF9fcmlzY3ZfLgo+Cj4gU28gZml4IHRoaXMgYnkgaW1wbGVtZW50aW5nIGFyY2hfc3lzY2FsbF9t
YXRjaF9zeW1fbmFtZSgpIHdoaWNoIGFsbG93cyB1cwo+IHRvIGlnbm9yZSB0aGlzIHByZWZpeC4K
Pgo+IEFuZCBhbHNvIGlnbm9yZSBjb21wYXQgc3lzY2FsbHMgbGlrZSB4ODYvYXJtNjQgYnkgaW1w
bGVtZW50aW5nCj4gYXJjaF90cmFjZV9pc19jb21wYXRfc3lzY2FsbCgpLgo+Cj4gRml4ZXM6IDA4
ZDBjZTMwZTBlNCAoInJpc2N2OiBJbXBsZW1lbnQgc3lzY2FsbCB3cmFwcGVycyIpCj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhpcyBm
aXggZG9lcyB0aGUgQlBGIHRlc3Qgc3VpdGUgaGFwcGllciEKClRlc3RlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
