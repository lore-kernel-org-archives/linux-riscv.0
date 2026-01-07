Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF22CFD651
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0m2Lfv7RPBMDowg1BpkT9J0HjKoHn/2qg/UIROtSOM=; b=fTHXag/AG47HQJ
	/kA5IUzTViXxXIkxZVfpZ6cgQUOSGPkHEwoq30OEpo0aC69kG8c93LmDaN+RbZIQmiFFgHHYcpiDZ
	niV/nda5jbUPVMoCWggNEhWDI0qSN2RvVpBHgAvH9cX0uuue5FbyiS9/9bA+x1T80wBVwqYGCM+y0
	iU0Tl3mBrGdq72M6geWLtL+JIZzeaWOsgOWdxgfVgkH3yNbZeVDaoTGvw5QT/Aq7BjaTBz+cyOy1B
	vRJ+A73VdGrttObOlfxFC7Ria8igPjYpAy+PGzDuhCCRuFfIwTpD6HnQWDEaM01dlo4HtrwjTz0VF
	oUgSbYKrE+/DnLXjiuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVAw-0000000F9Mw-2iTK;
	Wed, 07 Jan 2026 15:10:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVAu-0000000F9MA-0tI0
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 15:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767798613;
	bh=ruLJwy622onfjhp6xw4ADLI848biIUuAYSyoTpnglgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ns//fbuHmUm/HgngBvDsWHryUZciMHDGToh4HmqboY21nv7PgA6YRLVzqwc/ussOs
	 ZQP3qHnEY7LqDX37RDggfwg/Ml0FDGY0sMDUIiqk025dyeZ/kBFFdFq1l/kvUm0b5r
	 WXGEzLK7OW0bpfwKe3UVLwAfAsO6VZFPBNuX15y7DalJk+OIispsFWxNJqFoIgCif8
	 5BkFdTvV+ZVCAekmzuVxH/MuWSigA7mpmnDmERHcXxWk+noVZu12+Q28ujpxY4BxnW
	 pfNz18biBjrIzEvESliCT7I1uNocZbY439hV4UveGeKp3PvIvaxLxcSIUtDiznvijR
	 6j8wQDyLu0zfA==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D03E17E1534;
	Wed,  7 Jan 2026 16:10:09 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 07 Jan 2026 12:09:54 -0300
Subject: [PATCH v3 3/3] rust: clk: use 'kernel vertical style' for imports
MIME-Version: 1.0
Message-Id: <20260107-clk-type-state-v3-3-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
In-Reply-To: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
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
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_071016_411942_A7E57465 
X-CRM114-Status: UNSURE (   9.32  )
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
 rust/kernel/clk.rs | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index e840e7c20af7..73a2b51414a1 100644
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
@@ -216,8 +227,17 @@ pub struct Error<State: ClkState> {
     ///
     /// ```
     /// use kernel::c_str;
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

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
