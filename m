Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3268DC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OEEi0eJSWs3qcgxTVKz5amssRsNzFvQ7cIfmLwv5Bl4=; b=3e17zPKmaF4GAd
	qbpEAhEngsmvGvi5ubChYSz6to/+sA+5nZecPOD6yV9fpleicAw+7BHzsEbE3lz07f2oe4zjhmc1w
	0udgw/bzYFD3yX1KlqgNK9v/SBcvF55qyk/wJZsdcrc96auwYO1qwubQqYFhoUTS8VpBcWKRBhIma
	pdnwZjzlDsPSgUe/7X7mfWTYXRehLPnKifmClfF0/93n9gZJQHAgSIIA+Xq72/aJ0K+fIblWdvgvl
	ecN7a24lX1j+MMpTY397HPUQYjKJCacpXfouIA8VpePW1vmbpFsWOOvffFHsfu5ml7mw9nnKeVb7C
	Ynfyk7alWSaWm3v2kFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUlh-00000006S0b-2sfW;
	Sat, 11 Jul 2026 10:17:09 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUlb-00000006Rya-2YBi
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 10:17:08 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gy4PP0dlZzKvv9;
	Sat, 11 Jul 2026 12:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783765017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U3ImstQrsA9UW+38lhQ1sNds7gu/oGbkbhambfG/NR0=;
	b=M/h8gBoOZzGcKOjKkhO2U3RWnN/IbG1O1jBcYDl9RQ4AA5snm9OVJEtarFLd9J3rDReFj6
	cNpOq7imAUFtt6EZ8L/lnnrdHaG+lLjh/ygkcd2tV06KZPvPWWJKqTNn2AItsvYuXUB3Qj
	iutPsL6iGbqfXhp6eFBgCIjMRq1ZpedOUVrV22S9WqnVI5V4bQpL41lYMBsFU4uc07gPzh
	+21VEAw93+HcFc9lffr2jdn4pjKKLg6hpVtlv7+7M0dWCcObsRjYFe7i8elsi0z9jB/T7U
	qGi/mlOMjMCU3zWv8qR3f+MamcxyaSqqFh9Ggfh0srW7njLA+ZfE71s8pqrc+Q==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783765014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U3ImstQrsA9UW+38lhQ1sNds7gu/oGbkbhambfG/NR0=;
	b=p8w14CPZ0kWEU7bX10C1ghN0UHreb54mtp4opQHTe3FNRthqsgGq7vqIfcp7mTgjL7iyBq
	asnDirQLwQNdcRS9mp5FYmRd7q/e6/mY1/lZZA6ZhUE4vayuQXfwjpLnc4EdrPyfF22o0Y
	8Oo8fFnYiwoNeRIB954FI0S0S3XEnmETjWFaaS4+7O7U5YK2y/nRUrIlLcRoMZHHeyN4LZ
	QG+4EeZFnI3eJ+YZ+OUv3oApZHbkyxJ7rPX3ZnpxbrVP80sOkGemDtSRB6SWmhVkY4KLpe
	DWvoxZOHglK7I3Mq+AvdP1sHQshrQl3Q6nSCWDKgmDXKbpll++Y3b4Unh722zQ==
Subject: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
Date: Sat, 11 Jul 2026 12:16:28 +0200
Message-Id: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QTW7DIBAF4KtYrEsFw4+NV71H1QWGwUZN4hSI5
 SjK3YuTRVpVirqckeZ7o3chGVPETPrmQhIuMcf5UAf50hA32cOINPo6E2CgmQJNky1IcXW7U44
 L0hELLRNXwGirpTXSeOQdknp/TBjierPfP+o8xVzmdL5FLXzb/kddOGVUSBeYkMhrxtvext0wr
 69zGsnmLvCwqvbMgmppo7RkQ2hBmr+W+GFB98wS1XKtswIHFzQLv63rvYCEX6faabm38Ki0b2q
 EYoYZ6naftJyPSHPZwhzj1rbeK8V9v6ityMHmup/3+1j6xgDjDMA4OYiuM23gghtf3+UaPASjD
 Sj0vK0vXL8BKCEg+94BAAA=
X-Change-ID: 20260526-rate-exclusive-get-th1520-764a949de18e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, Maurice Hieronymus <mhi@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783765003; l=2054;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=+Q01IOSPpbl6YaJ1sx2U1xpDg/zo1GCHE9ISpCMdGX4=;
 b=wrIw8EiPXBMgXwOPtE10nUhaLnGuBvvXnluKQnp020xOGAt974/hFA4jcJSIM/LAIYqar4qEW
 TwOwcYvbqCsAW9XZmIYQ5zix6qVPq2cHcCTaxtX3rG7/0g/ox4qJTaR
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-META: p68pwkc35abrj1qzbhy65xyydo66i3rj
X-MBO-RS-ID: 17a3b90175c5235e027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_031703_951019_B70A7795 
X-CRM114-Status: UNSURE (   5.99  )
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

QWRkIGEgUnVzdCBiaW5kaW5nIGZvciBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgLyBjbGtfcmF0
ZV9leGNsdXNpdmVfcHV0KCkKYW5kIHVzZSBpdCBpbiBwd20tdGgxNTIwLCB3aGljaCBwcmV2aW91
c2x5IGNhcnJpZWQgYSBUT0RPIG5vdGluZyB0aGUKbWlzc2luZyBiaW5kaW5nLgoKU2lnbmVkLW9m
Zi1ieTogTWF1cmljZSBIaWVyb255bXVzIDxtaGlAbWFpbGJveC5vcmc+Ci0tLQpDaGFuZ2VzIGlu
IHY0OgotIFJlYmFzZWQgb24gdjUgb2YgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3It
bGludXgvMjAyNjA3MDYtY2xrLXR5cGUtc3RhdGUtdjUtMC02N2M1ZjMyNmExNmNAY29sbGFib3Jh
LmNvbS8KLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNjI4LXJh
dGUtZXhjbHVzaXZlLWdldC10aDE1MjAtdjMtMC1jN2NhM2ViY2Y2MGZAbWFpbGJveC5vcmcKCkNo
YW5nZXMgaW4gdjM6Ci0gQWRkICNbaW5saW5lXSB0byBDbGs6OnJhdGVfZXhjbHVzaXZlX2dldCgp
IChPbnVyIMOWemthbikKLSBEcm9wIGludHJhLWRvYyBsaW5rcyBmcm9tIHRoZSByZWd1bGFyIFNB
RkVUWSBjb21tZW50cyAoT251ciDDlnprYW4pCi0gUmViYXNlIG9uIERhbmllbCBBbG1laWRhJ3Mg
Q2xrIHR5cGUtc3RhdGUgcGF0dGVybgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9y
LWxpbnV4LzIwMjYwNjE4LWNsay10eXBlLXN0YXRlLXY0LTAtOGJlMDgyNzg2MDgwQGNvbGxhYm9y
YS5jb20vCi0gVXNlIHZlcnRpY2FsIGltcG9ydHMgaW4gcHdtX3RoMTUyMC5ycwotIExpbmsgdG8g
djI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA2MDUtcmF0ZS1leGNsdXNpdmUtZ2V0
LXRoMTUyMC12Mi0wLTY5NTY0MGJmNzI0OUBtYWlsYm94Lm9yZwoKQ2hhbmdlcyBpbiB2MjoKLSBS
ZWJhc2Ugb24gcHdtL2Zvci1uZXh0Ci0gUmVtb3ZlIG5ld2xpbmUgYWZ0ZXIgW2BjbGtfcmF0ZV9l
eGNsdXNpdmVfZ2V0YF0gY29tbWVudAotIFJlbW92ZSB1bnVzZWQgW2BzdHJ1Y3QgY2xrYF0gbGlu
awotIFB1dCBzZW1pY29sb24gb3V0c2lkZSBvZiB1bnNhZmUgYmxvY2sKLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNTI2LXJhdGUtZXhjbHVzaXZlLWdldC10aDE1
MjAtdjEtMC0zNGNmMDM0ZTE3NjRAbWFpbGJveC5vcmcKCi0tLQpNYXVyaWNlIEhpZXJvbnltdXMg
KDIpOgogICAgICBydXN0OiBjbGs6IEFkZCBgRXhjbHVzaXZlQ2xrYCB3cmFwcGVyIGZvciBgY2xr
X3JhdGVfZXhjbHVzaXZlX2dldGAKICAgICAgcHdtOiB0aDE1MjA6IExvY2sgY2xvY2sgcmF0ZSB3
aXRoIGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQKCiBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIHwg
MTggKysrKysrKystLS0tLQogcnVzdC9rZXJuZWwvY2xrLnJzICAgICAgICB8IDY3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDc5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogOTIwMTAy
MjljNGIzODg5N2YxMzE5ZDI2MDE2MmQyZjk2OTI1ZWQxNwpjaGFuZ2UtaWQ6IDIwMjYwNTI2LXJh
dGUtZXhjbHVzaXZlLWdldC10aDE1MjAtNzY0YTk0OWRlMThlCnByZXJlcXVpc2l0ZS1jaGFuZ2Ut
aWQ6IDIwMjUwOTA5LWNsay10eXBlLXN0YXRlLWMwMWFhN2RkNTUxZDp2NQpwcmVyZXF1aXNpdGUt
cGF0Y2gtaWQ6IDJkM2RjNDVjMjQxZDkwNjJhMGQyNTQ2ZWM2NDllZWM3OTcwZmE1MGEKcHJlcmVx
dWlzaXRlLXBhdGNoLWlkOiA2N2FkNTM1ZmUxMTAyMDdlYmM3OTA0NWJhMDIyZWJiNzEzN2IwMzA5
CnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogM2QxZDhlZTVjMmE0OTU3ZWRkMDgwN2I3YTVjYjY1ZGFi
YWIzNDViNQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGUyNjU5MDM3YjhhYWY1MTgzMWRhMDk5Y2M1
NjhhZDViM2MyNGE0ZGQKCkJlc3QgcmVnYXJkcywKLS0gCk1hdXJpY2UgSGllcm9ueW11cyA8bWhp
QG1haWxib3gub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
