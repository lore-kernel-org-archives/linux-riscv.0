Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741DACD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 03:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pFcKnDQJmIG6/cf/spn0t/6Cc4f2Xrq1b375/Ssxsw=; b=Nn2KRyuCqDnqLU
	Y9kJlUGncZJPntDxeAowLLRC+OX6ZYhIclzsifgnoYGJYasDibLKaCCZoxV+fVG726rKJSxL/uJ1T
	AeMkwRmdIdzM2OdEmI/KfnQzyqUPbLLl1KfYipmAKY+EDarWNgDik9fDVXqwlrDHU1somia7+bFbO
	jd2wh8+u7ZeYscYpYxlmGrkhwRO4uoxIP3AatSzwGBdgqPx3aKVrLXjv4j4z2et5SThwVSnE8WWAN
	wjJBTEhO/tv6dz7EWJATK/y+LBw4mP1l51H7Yqb1GEUrjWN0tEv3avIXMmN2oVpVSjMLUdHptuEtb
	gxMYvQa3jKVG+kScZQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3k5-00000000a7H-2RHn;
	Thu, 18 Jun 2026 03:48:37 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3k2-00000000a6S-2zXc
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 03:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781754498; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mNXOKcw9uzCiiYr5O9KI4cBXfISXVa5n9kATef+RRuQ7wWtji9H+phX7Vnl+CO1/cXeFBhbgYl41JnJ4OZKw+RBiz17jvQrCSJAYW3v6sVj0L6NRuUQV3sXeMmMAn82G//2YrkcSTsJUoFvddbu70aHG/LQF8wtbT3xx1WYpdjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781754498; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U2lJv0/DE3CCJO9+3Z4st8Eh7wfAyQlNJPVjWBCZG3U=; 
	b=hSjS4IQnIcFzPUorUV3amUfN+UL1yh7XGTtDtbKKFF8OtyNca7PeM1ZIAGWoTL1mpHEZw6RKaKvqkhepVdlv0+W0ejkpFFwbuqMO/j1w6RpQhb3OIVQ+r37PcY9C6PeXNoiPJsOpYqinastYnKDVWm0LfQ7CQytS8ByVo+EHwDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781754498;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=U2lJv0/DE3CCJO9+3Z4st8Eh7wfAyQlNJPVjWBCZG3U=;
	b=APn++8oq3SbVjjPkB0W+AeYEi4qEdpH7NvFESoL6kiFyxQkL2MlsJJSlh/Lmwtc6
	DhmWKbyWgbDZe0ChM4NFZj2zW8rc5KyW9TYaov4K1R1Uoe0EPvHiYb2n4D2fo/cftAF
	jYgn5x2BDFc2wOttOU4iVtD30mai4ZSz0VM5Zreg=
Received: by mx.zohomail.com with SMTPS id 1781754495642490.6198508965592;
	Wed, 17 Jun 2026 20:48:15 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 18 Jun 2026 00:46:37 -0300
Subject: [PATCH v4 3/3] rust: clk: use 'kernel vertical style' for imports
MIME-Version: 1.0
Message-Id: <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com>
In-Reply-To: <20260618-clk-type-state-v4-0-8be082786080@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Brian Masney <bmasney@redhat.com>, Boqun Feng <boqun@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_204834_808323_792BBB76 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert all imports to use the new import style. This will make it easier
to land new changes in the future.

No change of functionality implied.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/clk.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 692ee88ca772..1412a2f0aedf 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -80,12 +80,23 @@ fn from(freq: Hertz) -> Self {
 mod common_clk {
     use super::Hertz;
     use crate::{
-        device::{Bound, Device},
-        error::{from_err_ptr, to_result, Result},
-        prelude::*,
+        device::{
+            Bound,
+            Device, //
+        },
+        error::{
+            from_err_ptr,
+            to_result,
+            Result, //
+        },
+        prelude::*, //
     };
 
-    use core::{marker::PhantomData, mem::ManuallyDrop, ptr};
+    use core::{
+        marker::PhantomData,
+        mem::ManuallyDrop,
+        ptr, //
+    };
 
     mod private {
         pub trait Sealed {}
@@ -189,8 +200,15 @@ impl<State: ClkState> From<Error<State>> for kernel::error::Error {
         /// original [`Clk`], e.g.:
         ///
         /// ```
-        /// use kernel::clk::{Clk, Enabled, Unprepared};
-        /// use kernel::device::{Bound, Device};
+        /// use kernel::clk::{
+        ///     Clk,
+        ///     Enabled,
+        ///     Unprepared, //
+        /// };
+        /// use kernel::device::{
+        ///     Bound,
+        ///     Device, //
+        /// };
         /// use kernel::error::Result;
         ///
         /// fn get_enabled(dev: &Device<Bound>) -> Result<Clk<Enabled>> {
@@ -240,8 +258,17 @@ fn from(err: Error<State>) -> Self {
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
-    /// use kernel::clk::{Clk, Enabled, Hertz, Unprepared, Prepared};
-    /// use kernel::device::{Bound, Device};
+    /// use kernel::clk::{
+    ///     Clk,
+    ///     Enabled,
+    ///     Hertz,
+    ///     Prepared,
+    ///     Unprepared, //
+    /// };
+    /// use kernel::device::{
+    ///     Bound,
+    ///     Device, //
+    /// };
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device<Bound>) -> Result {
@@ -287,7 +314,11 @@ fn from(err: Error<State>) -> Self {
     /// and move between the variants:
     ///
     /// ```
-    /// use kernel::clk::{Clk, Enabled, Prepared};
+    /// use kernel::clk::{
+    ///     Clk,
+    ///     Enabled,
+    ///     Prepared, //
+    /// };
     /// use kernel::error::Result;
     ///
     /// enum DeviceClk {
@@ -481,7 +512,12 @@ pub fn enable(self) -> Result<Clk<Enabled>, Error<Prepared>> {
         /// clock or threading it through an intermediate state, e.g.:
         ///
         /// ```
-        /// use kernel::clk::{Clk, Enabled, Hertz, Prepared};
+        /// use kernel::clk::{
+        ///     Clk,
+        ///     Enabled,
+        ///     Hertz,
+        ///     Prepared, //
+        /// };
         /// use kernel::error::Result;
         ///
         /// fn read_rate(clk: &Clk<Prepared>) -> Result<Hertz> {

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
