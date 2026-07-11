Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E6C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNi585UPc1a1WNnwk5xwaWjJs0/fZoCrQ3QIw+2aWkE=; b=jyvvW+ecdfx7FF
	hEZn560PiRZukW7ohUxdsoNtw7N3vO+o4aCRtdTTcNC3HsSs9OSns+l0OTJE6ahEbJmqjc7ZOvCW/
	trQRbn+KEiUDI6ayKPUuuHQOhWRhEACNIB5vtKm+uQ4W6UxSIVE6ilt2u+cs7RSQs7iV0Vy3U46Sm
	Nt8TikPrUHvrA6l/Xyb+4/xXcsoKUalUhcF35aB4dusJCGVF5SueGgdWhAYCkhCdFzDi9BoFEz6IG
	DczI78NzDn6I4z/Tu3eJ+oHtImD+twRRnzRGD+57TwMguSqwlGj97knqPyR8lvHXOJtZLDCp0Myei
	NFdgxYwF6XH8/OBe84yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUlk-00000006S1a-3npe;
	Sat, 11 Jul 2026 10:17:12 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiUlh-00000006S0O-3JvZ
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 10:17:11 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gy4Pb4bqTzMlFv;
	Sat, 11 Jul 2026 12:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783765027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRjPBjPuglGnWcYt2EDxgR0fDCyPIyJQtIkqBiIfQ2Q=;
	b=JfbgCxB9TRUQa2kRRu6/cJGU0wPjcmv7fX55qqEmbHZ0ZBPsmvahGxERdI3w8yHgLceIw/
	v3WIO+frbIBOxtCnc882BIRJtf6A+PRthCeNqjvmfUP7ueRDcxnYYxEuIcJtNG7JmhD+QK
	wRK7ct47rQoNnK5r0sBtjXF106cTsV7uPDxh5F2r1JYXfuohK26BmOLzxYqCY8SoVDpGrX
	HBojyS7/Eg4VFqHmRQlvKX+DzTljQ52TC3OpPEZ/Cthg9BMF6pquBDCG/f7awW6w1LsQ/J
	fx6lTEQnJpaKU9EgJIpAFeRr8ziEwSICtESWDb36pUS3Oo5ENoYDO6A9XSQDDw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783765026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRjPBjPuglGnWcYt2EDxgR0fDCyPIyJQtIkqBiIfQ2Q=;
	b=q70adOaIXLu0oeDkLv60N190Se0roRpqKdZ65Koz+f/N4vmnnBmjXKqMg5d0umux/Urlam
	sIl0OPc4e4dW/omhOsgG5BaazlM1UGO2u10Boy7Fmk400mNdbbQlLsf4ovRMFFm8i8Krvr
	cAYeJ/bStSQt+HfsysQEZ8OhOwXsp+OzmG1vuE6rF73pM5h9l7bxDKHd5oPIpdAsk8oL3P
	UFMUyKvLomcPDcO33xP0pvpZESKWdO9fmmB0YOhLK0jCW1aoFCpgmdFMjfKzLSUnwhNefR
	KaPmy71mCxx+yjtUl45uEAmRmPReMsWrpg4x5LJaRPiXhLLQ8wp+ghSQ1iT/eA==
Date: Sat, 11 Jul 2026 12:16:30 +0200
Subject: [PATCH v4 2/2] pwm: th1520: Lock clock rate with
 clk_rate_exclusive_get
MIME-Version: 1.0
Message-Id: <20260711-rate-exclusive-get-th1520-v4-2-8244a0666a71@mailbox.org>
References: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
In-Reply-To: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783765003; l=1864;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=XTt9Wb3t8dMkZzuvXmoKi5n+eeWfIrk4FFd5V+XRvs8=;
 b=WvdYOvOJeyFL1eIjD68+q/wUtv03eytEyxUw7mCbEVVNZnghVv3RC/d32QX6gAzQhzT91VZV+
 1dPp67NmmvQB3aPwHyICcmbvq/5iFCpDGSCjr5QxraWFOMRDMVvRr/1
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: c60d8243f9904d1ba72
X-MBO-RS-META: yus6awgdopfyu6x8nzir3j1jsbja9zx7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_031709_993764_DDB9CF23 
X-CRM114-Status: GOOD (  10.53  )
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
