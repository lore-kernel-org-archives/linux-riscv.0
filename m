Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5CC43602
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 20:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNi585UPc1a1WNnwk5xwaWjJs0/fZoCrQ3QIw+2aWkE=; b=evkrh8omUP4uuZ
	WpB9qI/3CUg/s5ywqZuhhORp22s4WenPWg2KGNybkPLNHZSlJgl/mknLd+YyRGjHNm/8TSjhx9Z4w
	kX0hbkS35+k6GROKcZgkp+YxZ+2ORzHVnMl4JBjcTiye6vuNlyiTcV17Nmhj2DB3jguIBhU5UrCoq
	f49wItWZGGvBeD6L/nfIfRl7ttyCdXLp2/fURQhM5fQW+sa1jgyX9SPRNGW/vgscGrYmsiLDU7WNz
	G5o14pHZHdfEj4EGXyubVZwymUKy7s0BXHySrU3MqdUpvKTUKGRwo8titMfIG4YRWAWXscWC/bmGJ
	I0ExFugi7aOB+DP0tANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvx7-0000000DMZj-2nt2;
	Sun, 28 Jun 2026 20:18:05 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvx5-0000000DMYe-1z4Q
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 20:18:04 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gpLLx2G9bz9tSc;
	Sun, 28 Jun 2026 22:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRjPBjPuglGnWcYt2EDxgR0fDCyPIyJQtIkqBiIfQ2Q=;
	b=FPxJ49dEGetgN/5e84HERwmCNj9+TKlfGnmNHB2x993dTS72TteObGCqkhWa8XZBTV6GHp
	gB/blLpqD7QtALe50h6loOcqmMy401LDaHXdcw4tNyM5zRf79cy+PZ8zoo+hirboW6HzE8
	Bx8M2EADwbPj0zimmIjfCWD8ULqkyKtQBSafOte3ZhIcKO9PSy0IhHEwQY/Hl028beVGlI
	6TOA6yuLlgD5hothDMykDg3LOMRo5rGoaycbh5Yqmb4KbavGmz8JieSNOx7OtPa3kmGW3z
	VMurq//K64ty6RHwucVGyGnenuX9EOTiRrsXH8jmkLec4BeY++n6E+q3gX57gw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=apYC0TcZ;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRjPBjPuglGnWcYt2EDxgR0fDCyPIyJQtIkqBiIfQ2Q=;
	b=apYC0TcZfZHw73DlxsMfV7sdGIZieeciDhp8qEIkQwEznLamPEybETpMuq8YsepP1BhS1P
	+zbk4AAcAu36MGbl0HK/UrkNV+wjs+/waIIpf8mhqtuD++C16nMj5Gl6SetLLj4G+kktsb
	WRkLPybaZM4VdRKBd+XzLfcow1uYSc2HfiJWTyjuE2bHkYogp758ABT7QNdBx4DU/bJvoV
	U/s/8a3prfMWxFjhU+K1xQGMqwV6zjZM7D2YC13IOE5QfP3z/9Ii5QbS8zek206JfSgguo
	u0Z5BDcNgARTg1EBC5I5+FaHo3dlsFjSQMn5jrOZJd1nP84twUG+3yDjkzQjDQ==
Date: Sun, 28 Jun 2026 22:17:30 +0200
Subject: [PATCH v3 2/2] pwm: th1520: Lock clock rate with
 clk_rate_exclusive_get
MIME-Version: 1.0
Message-Id: <20260628-rate-exclusive-get-th1520-v3-2-c7ca3ebcf60f@mailbox.org>
References: <20260628-rate-exclusive-get-th1520-v3-0-c7ca3ebcf60f@mailbox.org>
In-Reply-To: <20260628-rate-exclusive-get-th1520-v3-0-c7ca3ebcf60f@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782677860; l=1864;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=XTt9Wb3t8dMkZzuvXmoKi5n+eeWfIrk4FFd5V+XRvs8=;
 b=w5HEi6rilfUCETusSD51fB8jWGnN9098rDsP3lrQyWJzNupIqTBA+PY88VZmgt21lBjME+2K7
 32EsHv5Uxi1C122ip+EZkgnvYzI6pUIrzeiK7eAdGYUtTI/ohaIOw/F
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: b30f71789f64a967c2b
X-MBO-RS-META: 6p3fhh7ejax8dtf73i364e4ahzjzwsut
X-Rspamd-Queue-Id: 4gpLLx2G9bz9tSc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_131803_674838_6233A896 
X-CRM114-Status: GOOD (  10.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The driver derives period and duty cycle from the clock rate read at
probe, so a later rate change would silently miscompute waveforms.
Switch to the new ExclusiveClk wrapper to hold the rate for the lifetime
of the driver data and drop the corresponding TODO.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/pwm/pwm_th1520.rs | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 343a1178c5e7..8f9d3fa39200 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -22,8 +22,16 @@
 
 use core::ops::Deref;
 use kernel::{
-    clk::{Clk, Enabled},
-    device::{Bound, Core, Device},
+    clk::{
+        Clk,
+        Enabled,
+        ExclusiveClk, //
+    },
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
     devres,
     io::{
         mem::IoMem,
@@ -93,7 +101,7 @@ struct Th1520WfHw {
 struct Th1520PwmDriverData {
     #[pin]
     iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
-    clk: Clk<Enabled>,
+    clk: ExclusiveClk,
 }
 
 impl pwm::PwmOps for Th1520PwmDriverData {
@@ -319,10 +327,8 @@ fn probe(
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
 
         let clk = Clk::<Enabled>::get(dev, None)?;
+        let clk = clk.rate_exclusive_get()?;
 
-        // TODO: Get exclusive ownership of the clock to prevent rate changes.
-        // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
-        // This should be updated once it is implemented.
         let rate_hz = clk.rate().as_hz();
         if rate_hz == 0 {
             dev_err!(dev, "Clock rate is zero\n");

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
