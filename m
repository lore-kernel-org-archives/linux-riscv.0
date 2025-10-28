Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A95BCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HguN3ht5J1R9wmdpzfNrvPqMQ5tE3NI7i/3WqpT0awg=; b=3hRrWZ6xekxn3z
	2grQ8pEw9+3NXOKnQNy7X8fz86y7ykCdVNXeiMXsfFtAjcJdwmsmBAvsnpr8vL/batyrVvgc/knpU
	2Sp5qxgrPrkYn7i1FtNmBYmbFr9JuOPifcgzNgY8JnagT6UnFiWqKeC+fK7s9QrNrHYRMVLl54b/3
	vl5YDL/WUHXwRvKbiDIYUejDI702F+d9dAzLPgDPSLl6kLsWu0lbofpppcvW/Kie5Xw5UZPw4JB8W
	iyRb8z+miIXQcpDkxMRtiV+SEO9Lmd+G4r1vOQEBYq+a96uLxxC7P1EiPMNrH4h1o7Tei/TnFEC0/
	9Iuljta+50NWpDDTRTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijV-0000000Fv2T-1LkY;
	Tue, 28 Oct 2025 12:23:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijR-0000000Fv0m-0V5h
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:23:24 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251028122318euoutp027366dc4f9f3a1df19ce5bf98767fc3da~ypyjbU_eR0283502835euoutp02R
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 12:23:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251028122318euoutp027366dc4f9f3a1df19ce5bf98767fc3da~ypyjbU_eR0283502835euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761654198;
	bh=jGjkU3U0JLre9e/0ro7TQvedWMp8tpNdUoBxZXg3c10=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=O4TEa0ovaGQfOSHEhlZb7p626KKV02YzVfksnIiEeGHcvJ6l4dpa+TCS8NYK2BXhe
	 5vEx6KyJ/dzsgLbX6C6dDUvcFj0JA2osFsYgPWoT5CLbxbUKvtsiTVkW2TzgG/ccZ1
	 bl6rc2jiMWdvb2ot7Hc4vriSkKbJOkmnDgB3R4JU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3~ypyidlIXm1056510565eucas1p1E;
	Tue, 28 Oct 2025 12:23:17 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251028122316eusmtip2a58bac4a211ef65df4d1d0fd332e1469~ypyhsC2tI3027130271eusmtip2Y;
	Tue, 28 Oct 2025 12:23:16 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 28 Oct 2025 13:22:33 +0100
Subject: [PATCH 2/4] rust: pwm: Add module_pwm_platform_driver! macro
MIME-Version: 1.0
Message-Id: <20251028-pwm_fixes-v1-2-25a532d31998@samsung.com>
In-Reply-To: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,  Danilo Krummrich
	<dakr@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,  Drew
	Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3
X-Msg-Generator: CA
X-RootMTR: 20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3
X-EPHeader: CA
X-CMS-RootMailID: 20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<CGME20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_052321_691998_0057E8C2 
X-CRM114-Status: GOOD (  10.74  )
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

Rust PWM drivers using the abstractions in `kernel/pwm.rs` typically
call C functions (like `pwmchip_alloc`, `__pwmchip_add`, etc.) that are
exported to the `PWM` C symbol namespace.

With the introduction of `imports_ns` support in the `module!` macro,
every PWM driver would need to manually include `imports_ns: ["PWM"]` in
its module declaration.

To simplify this for driver authors and ensure consistency, introduce a
new helper macro `module_pwm_platform_driver!` in `pwm.rs`. This macro
wraps the standard `module_platform_driver!`, forwards all user provided
arguments using the `($($user_args:tt)*)` pattern, and automatically
injects the `imports_ns: ["PWM"]` declaration.

This follows the pattern used in other subsystems (e.g.,
`module_pci_driver!`) to provide specialized module registration
helpers. It makes writing PWM drivers slightly simpler and less error
prone regarding namespace imports.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 rust/kernel/pwm.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 79fbb13cd47f75681283648ddc4fffb7889be930..6f2f78c687d5b924739f59052e9b3393c922540d 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -760,3 +760,26 @@ fn drop(&mut self) {
         unsafe { bindings::pwmchip_remove(chip_raw); }
     }
 }
+
+/// Declares a kernel module that exposes a single PWM driver.
+///
+/// # Examples
+///
+///```ignore
+/// kernel::module_pwm_platform_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+///```
+#[macro_export]
+macro_rules! module_pwm_platform_driver {
+    ($($user_args:tt)*) => {
+        $crate::module_platform_driver! {
+            $($user_args)*
+            imports_ns: ["PWM"],
+        }
+    };
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
