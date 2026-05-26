Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008C2CD5BB1
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hbz2vOV44k4ohfdLL19B+giMFTlulsE1xUA5gkg2nn0=; b=j4+4afsjQt5X3Z
	Dl/0hO0ZYGo+d9QJ+06ZVm8jWHvJlxebccR3nP6RUVt/647bPlNSgQnu0uq91U7CBhG3pA/EzFbId
	US7cSrUMHD3PpaXztCeAiLJtZlwNf3dwN8NRAoy+Lv9OZCTNgAbKqXx6KLqxZhetLHbjFhspGVAq8
	v5rUsyYqdfMEGAIdK5mw2o1WLlwQqtE8IUvoNKrPUinOjW3gT+PKrdds4hlCef8C+hoo4wItVRxcU
	GtLyDTz0ROjzy4yNnU1dud4itieencx25nzi/4M9W/Onnknp60RUCSoH5dGCu6YSvbJXKEBslGzP5
	DHTWTE0Y5wdSMnuw4eDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvDJ-00000002eEU-2YXU;
	Tue, 26 May 2026 17:05:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvDD-00000002eBu-01eH
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 17:05:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE58440AE;
	Tue, 26 May 2026 17:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD445C2BCB3;
	Tue, 26 May 2026 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779815101;
	bh=rw34vtqykP3gLbod3ZqxjK1eri8oVxXKFkcTw3m/x34=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sHPrMY1VAxp5wJH1r2VQ9KfEVvnLNZZJjtnYVPdLtWtjVilALRPQ3W6eB3PQdorvp
	 GD9iTGMQFxVf11CHTaYY0rJEuzpIJpNe9ko0s2SxVi+R4gCTc8gEglAAp35hzmuPuj
	 jtMaQvWD1T/HD/gCZEGp/YNMlyu1DSt0rx04BztFoWwgdAhrG4CxKa8ugNYUMfanOl
	 E+CIey60UjnUfpa2L+aKgdyNfmTEWKSk2zoZSr4UbE5V7ustZiVAVV1JOK/NkWsesm
	 E8YQrkGLqWILBTd1XDfx2M+s/OSRWdtuizsX1Woz/6pXjhHBclgVkX3VdgyLn7fRxB
	 NoEQQTm4bvUvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB624CD5BD1;
	Tue, 26 May 2026 17:05:01 +0000 (UTC)
From: Maurice Hieronymus via B4 Relay <devnull+mhi.mailbox.org@kernel.org>
Subject: [PATCH 0/2] rust: clk: Add ExclusiveClk and use it in pwm-th1520
Date: Tue, 26 May 2026 19:04:56 +0200
Message-Id: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMBBF0a3I1A4kQeNnK2IR9KkDopJEEcS9G
 yxPce9DAV4QqM0e8rgkyL4l6DyjYXHbDJYxmYwyVpXGsncRjHtYzyAXeEbkuOjSKK5s4ZqiGaF
 rUOoPj0nu/9317/sBXvSclWsAAAA=
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
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, Maurice Hieronymus <mhi@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779815100; l=764;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=rw34vtqykP3gLbod3ZqxjK1eri8oVxXKFkcTw3m/x34=;
 b=PL6YfDGWIuf8evRDeF2cmn1l3faTN3bvFDtgClsXkELDWCCjTqreu+xhqpuXNB8YWUsdq/qPW
 fD3wuj/fp7dCDdADJUZhO9wLasJfLgNtJQeyXNQzGz2v/GHT2Tv0wQz
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-Endpoint-Received: by B4 Relay for mhi@mailbox.org/20260525 with
 auth_id=790
X-Original-From: Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_100503_080741_5A44BA2B 
X-CRM114-Status: UNSURE (   6.68  )
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
Reply-To: mhi@mailbox.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a Rust binding for clk_rate_exclusive_get() / clk_rate_exclusive_put()
and use it in pwm-th1520, which previously carried a TODO noting the
missing binding.

Based on pwm/for-next.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
Maurice Hieronymus (2):
      rust: clk: Add ExclusiveClk wrapper for clk_rate_exclusive_get
      pwm: th1520: Lock clock rate with clk_rate_exclusive_get

 drivers/pwm/pwm_th1520.rs |  8 +++---
 rust/kernel/clk.rs        | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 5 deletions(-)
---
base-commit: 0e5e0db3e954b32a410ab4f74a4faac7a0e8889f
change-id: 20260526-rate-exclusive-get-th1520-764a949de18e

Best regards,
-- 
Maurice Hieronymus <mhi@mailbox.org>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
