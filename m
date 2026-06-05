Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F704CD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 07:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tna3CTqLzCnrlgLwnToGsm0+BCSWUHX5g711IwCKVLE=; b=St6reiLOBcvifr
	oXLFDdI2HBbsNvZZEvX9E5wgiueUlhGUA6TfUH6bYsnpPajlrbbeTrUQonFTVB42Hj3abRVYnac8Y
	6NQ13XK4U62rUonwabSW4PHL5XGmyX6DpvyIrCrfFZDLg8VRoLNB5vKmwt9xzxrQ0WNsCVAwD/WXU
	R9auuFUieZmrHE+Q6IZVYR4D5Way+64BqU7YksXw77u3LV4FK0o5pJ+F81vgWtZ6ntpLMBzxMZaKE
	k7QgXZ3stYslJfX2e11Sg7yRXdwxd0VCfZB2wK1Neo4dpKEL6PSwNI0qZERSXlB4SUH89+Pqehgk9
	7NYxmalXLE9D6AAuG5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOYN-00000000CCZ-1frf;
	Fri, 05 Jun 2026 07:01:15 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOYL-00000000CBt-0Wt5
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 07:01:14 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gWsm66mFWz9vJQ;
	Fri,  5 Jun 2026 09:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780642871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AisOK8s0MrDK37/TSGMnTNdk0xSn+SbMsbMUZ0nmfk=;
	b=JdHrpnDOYCj2thOK1j2uixDXieb+46nyuy9pggdoRq9ZmunnyGBU4yK4sQwIvzHXYpxMnU
	/jYA2ihhzuwJR9d2mhWdVOLRuYmfOCCBucoYXa5khSwDTK+GWNoeh0MkpJ9fqpdWLhGkqz
	ZjKRFTqNSHSseMskqKqmsS5e4nOgpKQue4rjiDG0kenW0Q2qx5m2SDCnaZQMXNP+JpXFlD
	GroEL7ugJNhbViNlNupCZyOUJqoMKXpnR91GYZyNUeddBAVFquBt38bgBWQivA4XRijC5r
	DaPoQHdXAqL3rJzQuazzo4JzVDQYihRXzuFmrtX08+gP0eKnMpjEbg7d9bn5WQ==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780642869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AisOK8s0MrDK37/TSGMnTNdk0xSn+SbMsbMUZ0nmfk=;
	b=eYEFdiXUTttRaoD+Afyd77elgOXcd3PbYltjw5qY1wPSxqjrh0bAcBU4fi8ViG/wGiFoLL
	WLB95UAcV9UXQr7AmrW3OmfvHzbLVw2IzxSDelnbt4EIMddcPPNU7v+oM4+AxEgVEKdmUv
	AEhf0qkm0ASOCl0fsmfyH4ztqA5UDc47pAFHR8iZzNTLgJPGNcvKjvVX8U42QESQnIX6Iz
	BdcWageqTOo3PEwTcK9ysLezZjHQ4P2EgUWjUi8i8ivnHWGrQDYtnuP3Xr3q77hb+bcIU7
	ITtyQF7JJNn5kCWc4ZYqpXBIP8CbKST5L8+nkNQtsSCOWgX40kpsjR5H2+PPMQ==
Date: Fri, 05 Jun 2026 09:00:00 +0200
Subject: [PATCH v2 2/2] pwm: th1520: Lock clock rate with
 clk_rate_exclusive_get
MIME-Version: 1.0
Message-Id: <20260605-rate-exclusive-get-th1520-v2-2-695640bf7249@mailbox.org>
References: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
In-Reply-To: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780642818; l=1573;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=60xrDe66k4ro+KvVbaFJv2mj9P8kpFvqUKywbpSaqwI=;
 b=WGnFX7PcxbBDEWUXjmEwNTBR0kSfl2DufCpeg/+PtLA111qvEc4g/HvbvGFUtb8xe+w8VJkIJ
 ajVQyrtia3FCoSl7ss/PX3cylicvjwS9bby/KwyEGzgtYLN+c49u4L1
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: 0b9247bacab9cefd338
X-MBO-RS-META: 3b51q85kj4buq3xszfzwttb54czpc51w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_000113_323726_A0F37982 
X-CRM114-Status: GOOD (  11.06  )
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
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/pwm/pwm_th1520.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index ddd44a5ce497..19e8621bc52c 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -22,7 +22,7 @@
 
 use core::ops::Deref;
 use kernel::{
-    clk::Clk,
+    clk::{Clk, ExclusiveClk},
     device::{Bound, Core, Device},
     devres,
     io::{
@@ -93,7 +93,7 @@ struct Th1520WfHw {
 struct Th1520PwmDriverData {
     #[pin]
     iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
-    clk: Clk,
+    clk: ExclusiveClk,
 }
 
 impl pwm::PwmOps for Th1520PwmDriverData {
@@ -328,10 +328,8 @@ fn probe(
         let clk = Clk::get(dev, None)?;
 
         clk.prepare_enable()?;
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
