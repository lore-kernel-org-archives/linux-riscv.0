Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6178CD6E6B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmZyN0Dqt8o7LW9StOV4mJo99SWPKn3ztfu6ZNp2hpU=; b=Z/94tssIC7dzeb
	dR2rvZPKPVHGe/lIE1JoZsZyLzJnlxq50maOhzYWT4zXGgpsoXvq4XGozdJsGKeNRBUwOBoyZ367K
	870oyrOi0RZUz3hn7Hy0sxvZTHZjxsfGzBAXjvQZk3WL0FSIE6AKGxZp+XRNZL3+MDmIypIG+UC+S
	d9vPRjLyzRmW03HZIaFYRrpeImDJ+tIMFoYLkzkyaj8lAt6zqhH4sAdpRHAuvzGdJxeqJRoeaEd53
	TojcajeH6VNM6uzEDpruv9MD1KMyPE2vI5ms/YhkW5diGRahMcOFZANCQGClBNCpuDW/3F9FGkJ5e
	rc+NYrEihsjUxy/X7glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOYF-00000000CB1-1GY6;
	Fri, 05 Jun 2026 07:01:07 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOYC-00000000CAP-0Gwj
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 07:01:05 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gWslx34H3z9v3Q;
	Fri,  5 Jun 2026 09:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780642861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpNBtlw9n2UCJW3D0hBUmygvSZ9hYaw7j0NNMC94AK4=;
	b=GGaoMEEQI3Xwgau5/KSpvAySoomQK91gLt491999CJTJ6qWIxbsGyRWlpefLN9VdkpzswO
	JGAcgDUAzmc7UgPYlp4OKVWP4tJKbFhq5wsvnqMJ6OUU3pK0gOALDBwQFrNC6szaYKMIw2
	6krzfuD35LZwtB+Qdtm5yuWQztwa6NpqaGvu4htpakZpnkGwh6M8ntZSXp2/9r5OfXQY03
	FMMKyGXZi6x7fr28Nb5AfT9rYeJI8seAq2HSlQQiIHMZGwOwKE+5JUwwHWvy9ykS7kaP15
	VRUvl/pXHMPpDyO6kFED+yZTmSRkanpNWF+zRJP6Pf3KK0NkF4iOUSH4HqUnFg==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780642859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpNBtlw9n2UCJW3D0hBUmygvSZ9hYaw7j0NNMC94AK4=;
	b=h4ZJD7pWeiBrHP178TiWZuxtX1fdKlYrIYx1VcSOMs+fzU84EYqGbu5FcO9uzIEgn91tcS
	Jn5LZ2ope1hnWhoapqqxQyz/frTp8TYH0gFRD5hSu0z9fFZxcx5oZRFn2FphEN4y86L+Oz
	fr6v2oGNgsu3TatoZA7Cm9zbjwpwIShCh6Qt9G9a1z4VOqsku+joy1N4jRACQlNvi9g7hf
	Hm4rcBOOLU7Wgoqddlr3fTTyQbz00s+Hv6+R8c3LLyTgDkYXMMcQAKoqm3OQPJkzyAYRd+
	3wgGQiQ1dBDrTr66YS16GVW+Q4Hs7zg1EsKk/MLGVaCo6DkfRtOL9lXNx+T13Q==
Date: Fri, 05 Jun 2026 08:59:59 +0200
Subject: [PATCH v2 1/2] rust: clk: Add ExclusiveClk wrapper for
 clk_rate_exclusive_get
MIME-Version: 1.0
Message-Id: <20260605-rate-exclusive-get-th1520-v2-1-695640bf7249@mailbox.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780642818; l=3552;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=Eq2/FqQK+/3GGvQH1jgzjXllW8SOFixYwWstqkvt+Ks=;
 b=EnPdbF7ZbiSZsoiQzpqVV642CEH+9nF8nNVKGzxReY0KS0hzY5ErgB16n/ogDC4ZIgDHlnxRs
 3pOhFWYN/TeBhXC4PYk2qu9FhThAApgBG4qR+jGpgZpndrfq7TktHcu
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-META: btqxt863ejstfjtaxooubyxo1r5tg14c
X-MBO-RS-ID: 46288b54c5fc677ce46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_000104_256633_8252E401 
X-CRM114-Status: GOOD (  10.77  )
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

Add Rust bindings for clk_rate_exclusive_get() and
clk_rate_exclusive_put().

Clk::rate_exclusive_get() consumes the Clk and returns an ExclusiveClk;
the matching put is issued from its Drop impl. ExclusiveClk derefs to
Clk so existing rate / prepare / enable APIs remain available on the
locked handle.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 rust/kernel/clk.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 7abbd0767d8c..f834f4833f18 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -249,6 +249,22 @@ pub fn set_rate(&self, rate: Hertz) -> Result {
             // [`clk_set_rate`].
             to_result(unsafe { bindings::clk_set_rate(self.as_raw(), rate.as_hz()) })
         }
+
+        /// Acquire exclusive control over the clock's rate.
+        ///
+        /// Consumes the [`Clk`] and returns an [`ExclusiveClk`] that releases the exclusivity
+        /// when dropped. While held, no other consumer may change the clock's rate.
+        ///
+        /// Equivalent to the kernel's [`clk_rate_exclusive_get`] API. Must not be called from
+        /// atomic context.
+        ///
+        /// [`clk_rate_exclusive_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_rate_exclusive_get
+        pub fn rate_exclusive_get(self) -> Result<ExclusiveClk> {
+            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+            // [`clk_rate_exclusive_get`].
+            to_result(unsafe { bindings::clk_rate_exclusive_get(self.as_raw()) })?;
+            Ok(ExclusiveClk(self))
+        }
     }
 
     impl Drop for Clk {
@@ -329,6 +345,50 @@ fn deref(&self) -> &Clk {
             &self.0
         }
     }
+
+    /// A [`Clk`] with exclusive control over its rate.
+    ///
+    /// While an [`ExclusiveClk`] exists, no other consumer of the same clock may change its rate.
+    /// Obtained by calling [`Clk::rate_exclusive_get`]; the exclusivity is released automatically
+    /// when the value is dropped, after which the inner [`Clk`] is dropped as usual.
+    ///
+    /// # Invariants
+    ///
+    /// An [`ExclusiveClk`] instance owns a [`Clk`] for which `clk_rate_exclusive_get` has been
+    /// called and the matching `clk_rate_exclusive_put` has not yet been called.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::clk::{Clk, ExclusiveClk};
+    /// use kernel::device::Device;
+    /// use kernel::error::Result;
+    ///
+    /// fn lock_rate(dev: &Device) -> Result<ExclusiveClk> {
+    ///     let clk = Clk::get(dev, None)?;
+    ///     clk.prepare_enable()?;
+    ///     clk.rate_exclusive_get()
+    /// }
+    /// ```
+    pub struct ExclusiveClk(Clk);
+
+    // Make [`ExclusiveClk`] behave like [`Clk`].
+    impl Deref for ExclusiveClk {
+        type Target = Clk;
+
+        fn deref(&self) -> &Clk {
+            &self.0
+        }
+    }
+
+    impl Drop for ExclusiveClk {
+        fn drop(&mut self) {
+            // SAFETY: By the type invariants, self.as_raw() is a valid argument for
+            // [`clk_rate_exclusive_put`] and balances the [`clk_rate_exclusive_get`] call from
+            // [`Clk::rate_exclusive_get`].
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
