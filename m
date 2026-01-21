Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C7BC44506
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JtcIHnYpNDv2Tg+6Bp5apA5Qfi3/Lz5218ymuyS3ILw=; b=Mlwf4hgGVSS+Qk
	W4h8dn2a6BOkU25hlBPTuBWIlOkzLzDnw1nJMYCWiorjfGXPHL7+SCje8FGXYP5Tfb5isdINrRkgW
	s/gc/ZNFiHeUNqG/LRPOJfRbUXwXKCfytPzROGBVXSrcpyyvPnS2871HUWE9V8C/EHFmlcTiUUv1C
	uWbBlX8L0NR2AI/vgd5LsU3p197kumuVwgodrp8vUxea7sZAQMdChD/158sK110cGc8WVv5+2+es9
	TkXue1RaoYWA+ILRpKyCMLmjIv8DlEpk5G4ZlU1QTBGtCIdqXkyFYPIUswzNPD3LvbRy5lX5IWz6F
	ObtReqOn76tDBA6+2xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vid5P-00000005vzi-3Xzm;
	Wed, 21 Jan 2026 18:37:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vid5N-00000005vzG-0UTu
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 18:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3028443B35;
	Wed, 21 Jan 2026 18:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10C1C4CEF1;
	Wed, 21 Jan 2026 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769020663;
	bh=8T1qZVajvSALxKbn1Sgv203jG4lWXIBnloTGX4o8U2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=RudXW77beLzcaLcdgGX+h5Xm5+3I9fn4Y1tFrhtA0NJWpg26c9rT5rizuzlncgrBj
	 ocAJpf0rRrGQDU5YuNkbRAw1ehv6QgkwwV0O08oTL+qKnsv1LSKe2GgYjMlu7mU3Jn
	 3EJp1jRUNgqm5xL7GiIrqb7IfbPoRldWhOrikM6Wd35ebodmcz6WY6onMI45AhicfP
	 4rYRz1UspK8yFoXiT2DD9+YNiBsqXf3hKCEum3ryYnn6wDr6yKic9bllmxWG+LXTa1
	 ocqpJNKlpkAgd7qipA6zbeG3R9NeZ1uejJ8IFyhDSm8zhb4PtSav3kjiRTbqQ9zJ4D
	 Fn32N/Hb8EG3A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Date: Wed, 21 Jan 2026 19:37:19 +0100
Message-ID: <20260121183719.71659-1-ojeda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_103745_190709_CABF04B1 
X-CRM114-Status: UNSURE (   9.79  )
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

The Rust kernel code should be kept `CLIPPY=1`-clean [1].

Clippy reports:

    error: this pattern reimplements `Option::unwrap_or`
      --> drivers/pwm/pwm_th1520.rs:64:5
       |
    64 | /     (match ns.checked_mul(rate_hz) {
    65 | |         Some(product) => product,
    66 | |         None => u64::MAX,
    67 | |     }) / NSEC_PER_SEC_U64
       | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(u64::MAX)`
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
       = note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
       = help: to override `-D warnings` add `#[allow(clippy::manual_unwrap_or)]`

Applying the suggestion then triggers:

    error: manual saturating arithmetic
      --> drivers/pwm/pwm_th1520.rs:64:5
       |
    64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U64
       |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider using `saturating_mul`: `ns.saturating_mul(rate_hz)`
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
       = note: `-D clippy::manual-saturating-arithmetic` implied by `-D warnings`
       = help: to override `-D warnings` add `#[allow(clippy::manual_saturating_arithmetic)]`

Thus fix it by using saturating arithmatic, which simplifies the code
as well.

Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [1]
Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
It would be nice to clean this up, so that Mark may start enforcing it
in linux-next -- thanks!

Completely untested, so please beware. Also, I am not sure if I am
missing something here, since saturation arithmetic is already used
a few lines below already.

Cc: Mark Brown <broonie@kernel.org>

 drivers/pwm/pwm_th1520.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 21b4bdaf0607..fb95f994f963 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -61,10 +61,7 @@ const fn th1520_pwm_fp(n: u32) -> usize {
 fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
     const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;

-    (match ns.checked_mul(rate_hz) {
-        Some(product) => product,
-        None => u64::MAX,
-    }) / NSEC_PER_SEC_U64
+    ns.saturating_mul(rate_hz) / NSEC_PER_SEC_U64
 }

 fn cycles_to_ns(cycles: u64, rate_hz: u64) -> u64 {

base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
--
2.52.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
