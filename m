Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7140CCD5BD5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QgGAnrBUIVqueGLph6SLO3RUz3nrpRvkL5pCHRJzEY=; b=4sDXhvz2rgrMhR
	dMPwLzXfJ7jgICDWw74PKlwsR0Xpxmz34132YEiRL6RkvqUr9QzWmmfPjMyUO2RAC0wYfKIzc+yU2
	c7zkA49pvMYllVwetLLyYDvYFG49xdhIeJbjZoJ/DFhotWSgEKXJI4E39iti7OvXgIXVmeSXaiZk8
	g908xi1hm81R15uHicPpLE+fXYdzgmIcIk1QIkegrW2Fa0bI3/2DVWcoRKMEa3QJfGhKlyghDq9hY
	UdTcJphyLBG991UszY0HzQXVYrY9PR66s0XHA3s4xOgXxjxneZxvZs14U82W/cbjASM22Fubx3nuJ
	JBYnHXeUDfM3AZ7b/Fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvDJ-00000002eEQ-2AJd;
	Tue, 26 May 2026 17:05:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvDD-00000002eBw-1gST
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 17:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60EFA44581;
	Tue, 26 May 2026 17:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00C9DC2BCC9;
	Tue, 26 May 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779815102;
	bh=yrmRRDToEBZZ7jEdU2KG9nrpGDIu9Wpd7gXYykBz04Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dFqk76QlNElAM5H7xAHPaXpx9FncYaY+4f54FmskJListbAG/w2CQ9eO2bF3mnwVc
	 4hA/q6rr3n84k4wjtayowylsI6eWIe3KM2123jrR5whtYMF+S09IvQRxwBLPh3CAJU
	 kLieFmJX0+zH8AlgPrL9e5n3GECGU9QWa7IeeFU4u8hJMqdhs3EYuWatEJKB/kQxb2
	 MBjbAuXXOwCUyRaFKBRpU2Tv3U8spZbCYc9S6mn+IilvZJm1SJeKfNz92d+TL3aTXh
	 MLzwjF7inD8zdAan6zUOTadBom3ZwH0p9cr9JwrHLvkIKBFyIHFj+lEyFEYnMAsi/p
	 De65y9o0bFNiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D802ACD5BB1;
	Tue, 26 May 2026 17:05:01 +0000 (UTC)
From: Maurice Hieronymus via B4 Relay <devnull+mhi.mailbox.org@kernel.org>
Date: Tue, 26 May 2026 19:04:58 +0200
Subject: [PATCH 2/2] pwm: th1520: Lock clock rate with
 clk_rate_exclusive_get
MIME-Version: 1.0
Message-Id: <20260526-rate-exclusive-get-th1520-v1-2-34cf034e1764@mailbox.org>
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org>
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779815100; l=1525;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=ijdGRfoTVRxXfNyIw+J4I55qYh5/j8fCJaQQLZ2ik/o=;
 b=FPRu4JUed3iOmruEs1DxB2Ies0lJTysltEPmsJb+yRb3RbZgYri/ak4s5sUuEOq5AhAWxdm6S
 5ZDPX57xtalDvqgMwlQkE/6IdDfz4ZwAwsotRXKRDMAcrokkQv8J2PE
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-Endpoint-Received: by B4 Relay for mhi@mailbox.org/20260525 with
 auth_id=790
X-Original-From: Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_100503_616281_DC6CD993 
X-CRM114-Status: GOOD (  12.09  )
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

From: Maurice Hieronymus <mhi@mailbox.org>

The driver derives period and duty cycle from the clock rate read at
probe, so a later rate change would silently miscompute waveforms.
Switch to the new ExclusiveClk wrapper to hold the rate for the lifetime
of the driver data and drop the corresponding TODO.

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
