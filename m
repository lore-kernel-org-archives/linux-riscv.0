Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D56C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=We083hNLCuDiTUyL06BxdTYJyGAIBakze4XaefWXkmc=; b=MWC2SphxBYefkg
	zNqSwRoFeI1wS71BWKh4/KU8jDto36oCKDAcAZf+XyzcHA2rLgC1B/p9N0aG7/w80LpxRQcSWxrgZ
	lPzIxHQKhFwnn+oOmJ4ViQjGZ89rQjeDxFrPdeN8F26WhSGq+cpGl/rdf0I7rshs5RH7Tp6WND11J
	xMSzvaac8MnOd9mOX+I8MrfetZgnpEgeW2l10KWouBbeCWhdoU6yHvZ44pF5FEsNsPvP5tUlwR46C
	2Nu6gvr59eQCj5yP+EjzjxWEwjKG6hxlfi7X7LjDOsCHbXpucTXf5r9iDCJErBW8WLu0k3xiS9U+n
	IicVogk1gaZokJ7XV7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvwz-0000000DMWl-1vP3;
	Sun, 28 Jun 2026 20:17:57 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvww-0000000DMWP-121Z
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 20:17:56 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gpLLk5zXkz9sld;
	Sun, 28 Jun 2026 22:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ie6nZOtCCEs/4gM6JA/fBtqmGphyj1Qv1SevnnJ4fyY=;
	b=P0k1buk9fkz39VlR3zNbcqO4XRsKRXCaMH2TOID74YIpIAEX0L/y259I5F9TPinSTFr9M1
	MbrOWMWCoaan14F1d7Liy7HGJzcpwRFXnxaQCQVJXJpYG9Pv5TzBgJ8VKKd/d3536vSbZa
	Bbh309vV7OOQl5H8if0WvobXC3KsD+xWkvV2erE4daK4i7irw/Y+DerUdZrw4AV/O6FDzN
	wX79HYb4vfkIlJV7Ks+yb6GpZPsEzXNYZNxOr2jN6V4INlvDysD0AEqkasUu2MiqeD0lOR
	QZIAT1Jhq9x9GZI70XDReTfhAiMwu/q6vdkr2rRYrH7C+fwdEG7432LV2sGUtg==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ie6nZOtCCEs/4gM6JA/fBtqmGphyj1Qv1SevnnJ4fyY=;
	b=JGcUz/BjqQ40tRChZ4sPwrJ4u4DIUmkkBNCMm5ttNO7kMaOeCSKYV8VQsNqKlpnHXkxe6N
	iqni2TXY9YGTNACQkUc7mHj6DD0B3B+u91pDwo3Rg+VTA6dt+4fz25g94e036pREbD+ZVp
	FjO2zNK0db/x3kkKsYWwflrZDQwyV5Za27Wb9oipxvMeGARZBMT8/zL/9VZ551nHKllgiC
	QOF9KlM5+pSMf6f7EV5eVkq208rmmvJGoalRMHvuRjtVmUcA1EBvji4u9C7hGAvBd6vH49
	0VXvMR45fvgnEpf8FCV9M6gddsqFdwgpU4j7MLxOGdbdpXJ4igTfkZUwwAr/zw==
Subject: [PATCH v3 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
Date: Sun, 28 Jun 2026 22:17:28 +0200
Message-Id: <20260628-rate-exclusive-get-th1520-v3-0-c7ca3ebcf60f@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QO27DMBBEryKwDgP+aarKPYIU/CwlIpJlk7Qgw
 /DdQ9mFkSZIOQPsm9m5oQI5QUF9d0MZ1lTScmyCv3XIj/Y4AE6hacQIU0QyhbOtgGHz06WkFfA
 AFdeRSkawVsIaYQLQA6B2f8oQ0/Zgf341PaZSl3x9RK10d/9DXSkmmAsfCRdAW8bHbNPklu19y
 QPauSt7sRrtLxZrLGWkEsRFzYT5zbo/S2c4X9oO9dn8NUPftQhJDDHYT9+4Xk+AS93DPKHW6hC
 kpKFfxf68s6X5yzyn2neHQLj3glnBHLU8Usmlljoq6aLTbTUtuZE8tgr3H0ct8DuSAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782677860; l=1774;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=xif+QOYVfTkTh915IArvTrN/H12Ehq+umM4Is5gGqAk=;
 b=j8OVFl6Qn7Y9f7bAHBMjQEbRY9neZadP0D1+PLGyVCHN7qqKKgBsKC2flsOzyMiG8XsIiFfW2
 RBVBGnQS7eNAR81LFLn6bH2ZdmuGwpcWJRabobBPYNDekKEQe3n+AIL
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-META: yxzgidr591ib5afmf87ktj48uz8j9749
X-MBO-RS-ID: 334c0e422a882688ded
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_131754_440741_2E7BEDD6 
X-CRM114-Status: UNSURE (   6.41  )
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
c2x5IGNhcnJpZWQgYSBUT0RPIG5vdGluZyB0aGUKbWlzc2luZyBiaW5kaW5nLgoKQmFzZWQgb24g
Y2xrL2Nsay1uZXh0CgpTaWduZWQtb2ZmLWJ5OiBNYXVyaWNlIEhpZXJvbnltdXMgPG1oaUBtYWls
Ym94Lm9yZz4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gQWRkICNbaW5saW5lXSB0byBDbGs6OnJhdGVf
ZXhjbHVzaXZlX2dldCgpIChPbnVyIMOWemthbikKLSBEcm9wIGludHJhLWRvYyBsaW5rcyBmcm9t
IHRoZSByZWd1bGFyIFNBRkVUWSBjb21tZW50cyAoT251ciDDlnprYW4pCi0gUmViYXNlIG9uIERh
bmllbCBBbG1laWRhJ3MgQ2xrIHR5cGUtc3RhdGUgcGF0dGVybgogIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNjE4LWNsay10eXBlLXN0YXRlLXY0LTAtOGJlMDgy
Nzg2MDgwQGNvbGxhYm9yYS5jb20vCi0gVXNlIHZlcnRpY2FsIGltcG9ydHMgaW4gcHdtX3RoMTUy
MC5ycwotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA2MDUtcmF0
ZS1leGNsdXNpdmUtZ2V0LXRoMTUyMC12Mi0wLTY5NTY0MGJmNzI0OUBtYWlsYm94Lm9yZwoKQ2hh
bmdlcyBpbiB2MjoKLSBSZWJhc2Ugb24gcHdtL2Zvci1uZXh0Ci0gUmVtb3ZlIG5ld2xpbmUgYWZ0
ZXIgW2BjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0YF0gY29tbWVudAotIFJlbW92ZSB1bnVzZWQgW2Bz
dHJ1Y3QgY2xrYF0gbGluawotIFB1dCBzZW1pY29sb24gb3V0c2lkZSBvZiB1bnNhZmUgYmxvY2sK
LSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNTI2LXJhdGUtZXhj
bHVzaXZlLWdldC10aDE1MjAtdjEtMC0zNGNmMDM0ZTE3NjRAbWFpbGJveC5vcmcKCi0tLQpNYXVy
aWNlIEhpZXJvbnltdXMgKDIpOgogICAgICBydXN0OiBjbGs6IEFkZCBgRXhjbHVzaXZlQ2xrYCB3
cmFwcGVyIGZvciBgY2xrX3JhdGVfZXhjbHVzaXZlX2dldGAKICAgICAgcHdtOiB0aDE1MjA6IExv
Y2sgY2xvY2sgcmF0ZSB3aXRoIGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQKCiBkcml2ZXJzL3B3bS9w
d21fdGgxNTIwLnJzIHwgMTggKysrKysrKystLS0tLQogcnVzdC9rZXJuZWwvY2xrLnJzICAgICAg
ICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCi0tLQpiYXNl
LWNvbW1pdDogOGQwM2NjNDJhNDJiMWEzZjE1MzU3NTdmNjViZmI3NGE5NzUzOTUzZgpjaGFuZ2Ut
aWQ6IDIwMjYwNTI2LXJhdGUtZXhjbHVzaXZlLWdldC10aDE1MjAtNzY0YTk0OWRlMThlCnByZXJl
cXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjUwOTA5LWNsay10eXBlLXN0YXRlLWMwMWFhN2RkNTUxZDp2
NApwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDAzMTc3YzVmOGUzNTU5NjQ2NDNmYzFlYjc4MDE2Yzcw
MmE4NGYzZDQKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBhNWM1Y2NkNjI0OTY0ZWRhODVhYWI5ZjQy
NWM2MzQwZWRlN2ZjZjVkCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogOTJiZDhlNGRmMzE5NGVmZjMz
MGUxYmMyZmMzMzg2ZDIxYzNjNTZkMAoKQmVzdCByZWdhcmRzLAotLSAKTWF1cmljZSBIaWVyb255
bXVzIDxtaGlAbWFpbGJveC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
