Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D18C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFZBMMoJyWngQr4rD5GJwgIw8O7SnCzHlUqVrdalq+Y=; b=RzaN8HTNluFBzS
	HqSuEtPbPgCRYz6auVYADYNNn52S1OjeK85pYmhenkcm3MDPCz0AmzNJLCD0Dlug+d6UkUSC4qJo6
	c35RbiHkyHhe9OTns0t2vzdUDUnNE5BZAzVp7p4EMShOcWvTpDKLKROm+rdZZv17l+dOLOCR4GaMt
	J4jaSwn6QfVx9cEZjidBJiiMNAI/bXB8nMAGYkvjMuIJd6cPRZoiQnWHmZPjVF0Um+0+l/bLFXjNg
	MWH+eGQomFglyz+od9A6xehqIii/tikbMw7yHm2aVuBy+EXvEqzpuvw1mOcOvo3ucM4PeJDBVQ8yu
	1LJlthmdcK2SdEGr+kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvx3-0000000DMYG-2QDR;
	Sun, 28 Jun 2026 20:18:01 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvx0-0000000DMWk-2tUs
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 20:18:00 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gpLLr2ypfz9tq3;
	Sun, 28 Jun 2026 22:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HOFKh4PR2wybtyQprzVFoqSkRuBhet8B4vwHYABWVM=;
	b=YqzpIpo3L7EZaVwGrCKSWG5+qknchc8wL0MVgqAbrB/EBzrQZ6AWI/dVNHcoieK7j7xCL6
	BAPhntIvWuitag4UHNpvkNsYj1SkoGeOU40q1fMS8OfOxprncMgW+jhNjQVfmUM1w2P8Xy
	bzi20ZjqibOWuQeipRhpwEou0s2IsmSeBvlQUgiQ661ayJybxBnw/fctC+tcYmgVjsh37D
	+bV1kzSLZguKMToLX0S/MMKuaKrMDxdYuBgnIO0ddRyY/chy4FVL3wNLaHCko9+wILmC1F
	yfWQXiDU+ZlRsH3zMn1+AAwQT3gFrAOktTxy3YNGEPbYInndE/LBycsTjK3MCA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=v6DgoObr;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HOFKh4PR2wybtyQprzVFoqSkRuBhet8B4vwHYABWVM=;
	b=v6DgoObrYvyLWvtYtCcWS/hNjenTQ8GcAN/0OzrNlj9m42/HLLfDippnt7w6Ax+USjpT2A
	D2wTFNy7BpFQM2CiWOXMkxgMwvOEQR0tI3zHBc7LzOAoKbj9epCXojMR0RMybsdpisA+M6
	WwglmZZhdceePphzdIldPM9g+EKIc7lRdeJbplwJ79VRLnzOUrPb2nVBfBYpMaz1aT9Qlu
	3qtWoqIVaWOwzHhXHhSVmm6MddrQxR/ZJ3M7iZOLfTSatild5/vX0kJABK1wpdAOWiBohL
	Zb/sMY3+6hO0yjzjeIY7R52BzmTMHToA49naGlB1hRh+TgjDLde2pD6Y4X6Kmw==
Date: Sun, 28 Jun 2026 22:17:29 +0200
Subject: [PATCH v3 1/2] rust: clk: Add `ExclusiveClk` wrapper for
 `clk_rate_exclusive_get`
MIME-Version: 1.0
Message-Id: <20260628-rate-exclusive-get-th1520-v3-1-c7ca3ebcf60f@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782677860; l=3880;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=Y4wbuB2Q7UtRfee4Zl34eyEe9jsKHEIS7Gdb8j429aY=;
 b=xKwZuEATbxSwMsq/BqTX+EV73z4sJzVlYz5zbkRq7NQtOVxWxmhVAcEF+6MtVdkG7uJXRBEwl
 cV59Xj0xUg5A8PA+QvTAL3AoFq/Img4YHwS/oxOb/QUu3pL9GK34fyA
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-META: f4sdaq5bogyhktsjn8wgg5nx78msc1t4
X-MBO-RS-ID: 79f967012ba1555c077
X-Rspamd-Queue-Id: 4gpLLr2ypfz9tq3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_131758_885600_F621256E 
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

Add Rust bindings for `clk_rate_exclusive_get()` and
`clk_rate_exclusive_put()`.

`Clk::rate_exclusive_get()` consumes the `Clk<Enabled>` and returns an
`ExclusiveClk`. The matching put is issued from its Drop impl.
`ExclusiveClk` derefs to `Clk<Enabled>` so existing APIs remain
available on the locked handle.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 rust/kernel/clk.rs | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1412a2f0aedf..89f662b67b95 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -95,6 +95,7 @@ mod common_clk {
     use core::{
         marker::PhantomData,
         mem::ManuallyDrop,
+        ops::Deref,
         ptr, //
     };
 
@@ -621,6 +622,23 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
             // [`clk_set_rate`].
             to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
         }
+
+        /// Acquire exclusive control over the clock's rate.
+        ///
+        /// Consumes the [`Clk<Enabled>`] and returns an [`ExclusiveClk`] that releases
+        /// the exclusivity when dropped. While held, no other consumer may change the clock's rate.
+        ///
+        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API. Must not be called from
+        /// atomic context.
+        ///
+        /// [`clk_rate_exclusive_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get
+        #[inline]
+        pub fn rate_exclusive_get(self) -> Result<ExclusiveClk> {
+            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+            // clk_rate_exclusive_get.
+            to_result(unsafe { bindings::clk_rate_exclusive_get(self.as_raw()) })?;
+            Ok(ExclusiveClk(self))
+        }
     }
 
     impl<T: ClkState> Clk<T> {
@@ -650,6 +668,55 @@ fn drop(&mut self) {
             unsafe { bindings::clk_put(self.as_raw()) };
         }
     }
+
+    /// A [`Clk<Enabled>`] with exclusive control over its rate.
+    ///
+    /// While an [`ExclusiveClk`] exists, no other consumer of the same clock may change its rate.
+    /// Obtained by calling [`Clk::rate_exclusive_get`]; the exclusivity is released automatically
+    /// when the value is dropped, after which the inner [`Clk<Enabled>`] is dropped as usual.
+    ///
+    /// # Invariants
+    ///
+    /// An [`ExclusiveClk`] instance owns a [`Clk<Enabled>`] for which `clk_rate_exclusive_get` has
+    /// been called and the matching `clk_rate_exclusive_put` has not yet been called.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::clk::{
+    ///     Clk,
+    ///     ExclusiveClk,
+    ///     Enabled //
+    /// };
+    /// use kernel::device::{
+    ///     Bound,
+    ///     Device, //
+    /// };
+    /// use kernel::error::Result;
+    ///
+    /// fn lock_rate(dev: &Device<Bound>) -> Result<ExclusiveClk> {
+    ///     let clk = Clk::<Enabled>::get(dev, None)?;
+    ///     clk.rate_exclusive_get()
+    /// }
+    /// ```
+    pub struct ExclusiveClk(Clk<Enabled>);
+
+    impl Deref for ExclusiveClk {
+        type Target = Clk<Enabled>;
+
+        fn deref(&self) -> &Clk<Enabled> {
+            &self.0
+        }
+    }
+
+    impl Drop for ExclusiveClk {
+        fn drop(&mut self) {
+            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+            // clk_rate_exclusive_put and balances the clk_rate_exclusive_get call from
+            // Clk::rate_exclusive_get.
+            unsafe { bindings::clk_rate_exclusive_put(self.as_raw()) };
+        }
+    }
 }
 
 #[cfg(CONFIG_COMMON_CLK)]

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
