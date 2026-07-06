Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7BC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rhP5BPUPjDMbvUrmeB+tgiNJSgoKTLO2xTLjcdnTR8Y=; b=Cr/6n+Ygua3il4
	bhpCMhHSW9+1P4vxQI3WDNc3O7K9lVUOaw+Ra7WkdNmFOQTn7SNmfEx3riZQ2TKNyL/tFLRmXsavR
	f6hbn6vD1gZis0Oe4jexgj3HRnZZvNhX2UoplTgL5NvD2Ccu4czqOia9jQmFdhvFt2gaA38TVU72c
	xvj+pTAlIAIlAUJxr3wGI3Chq5VPn4kyaHearW+pdW/qp6LnDKo93G4jm60soQ3Ji+J3vScqSPyXS
	fKxU9LGMlfd6Sl7gwOyvporbwQMY8WuSK/0JtT0pj/giTwATGIQX8BrKTWKPeIb/Gke0vmEniHjjU
	KfkL9at5n6+FyoMGQqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZRQ-0000000BQgP-2yma;
	Mon, 06 Jul 2026 02:52:16 +0000
Received: from out-06.smtp.spacemail.com ([66.29.159.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZRN-0000000BQg5-13HE
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:52:14 +0000
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gtpmQ1cx8z2x9F;
	Mon, 06 Jul 2026 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783306327;
	bh=NnqR4JyUDyRYRTafEbt4K57u5begKiQTLOM1sWepyzs=;
	h=From:Date:Subject:To:Cc:From;
	b=BQxyIMALPYtm1EyydehD7eKiwKc1JRbGvtsIcpp4GnXYP4LnVcLgQ/diJW9j8Lm2c
	 7qU/mr/r4sQ0KeR1MxvXD/aoREKTYu+PVoLBkibLVbVUp94iuI9uQPAqC6RT1XBfIG
	 h2WaivXVIhMMOd8VVszS7ygM133WYsY70Mu/qsmishZKWLBPJms1dcfwQ278Q3dKHJ
	 OM+UBulPPE9iukPRJIAsznhLaHdaNvEFVymS/0vrUhSnJp9h9QgMn1noyo7o7jnVyg
	 YFs7i1JMEOZDntmfpRLWWydMJSX7QDkLbQmuwhGG0/qLZNMpDsoAE/BGwCeUvlwsT5
	 gManYo3UllHcA==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 05 Jul 2026 19:52:05 -0700
Subject: [PATCH] pwm: th1520: use vertical import style
MIME-Version: 1.0
Message-Id: <20260705-pwm-rust-vert-imp-v1-1-753dbbfc6061@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROXeSRdB6lcaB3cE0wWZm0US8e
 7ccv8P/H6AkTAp1coDQxsrLHJE+ErBjOw+E7KIhM1lpKlOg3yeUVQNuJAF58li82tylz84Z20P
 svFDP3+v5bm7r2n3Ihv8IzvMHuM7sunUAAAA=
X-Change-ID: 20260705-pwm-rust-vert-imp-59a3d18bd0cf
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_195213_371952_140386C3 
X-CRM114-Status: UNSURE (   7.18  )
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

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Separating out patches per-subsystem as per the review feedback in [0].

Tested via:

    $ make LLVM=1 rustfmtcheck || echo "fail"
    $

[0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
---
 drivers/pwm/pwm_th1520.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 3e3fa51ccef9..2a3b107157ac 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -23,15 +23,21 @@
 use core::ops::Deref;
 use kernel::{
     clk::Clk,
-    device::{Bound, Core, Device},
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
     devres,
     io::{
         mem::IoMem,
         Io, //
     },
-    of, platform,
+    of,
+    platform, //
     prelude::*,
-    pwm, time,
+    pwm,
+    time, //
 };
 
 const TH1520_MAX_PWM_NUM: u32 = 6;

---
base-commit: 1a4920940ebfd8d907858abd8f8dd09b13752946
change-id: 20260705-pwm-rust-vert-imp-59a3d18bd0cf

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
