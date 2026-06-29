Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3569EC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOzZkw7xf/QMVRaEsNT3a5p0NOCGbZ8hy0n7GxGZdM8=; b=lElRxA4BQZKh4M
	6P+yYsqCdH9qE9hTkFcpsQ+JBFwmCqrWcuZcO2Zi+6ZSLWUZVU/vG1sgYDofZ71bSB14YNt/PsTeu
	SCdc6CFS+8hpq9irZEQwubYGTd0s+ONgyCgjzxB0Exo+3bPrW2vXqjSskgs9kO8mELTd291pF+/ar
	SF+D7lE4tTkP86kRpop2msn1ATkP22TU4dSZcBdRh+Q93kfDz9qHTdGvqSmW3g1z9i1dNoHAv4RHt
	97XAOQbWTVzkje5G4XLCSIgxi96zaLGRC5WfpzTZ5rg6yKv2nLnOi/3e1Wn3Qvj5Ufk4BMAXTK4gb
	bXSknD9UtBb/2WmXUFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pb-0000000Dd2I-1v4K;
	Mon, 29 Jun 2026 03:38:47 +0000
Received: from out-13.smtp.spacemail.com ([63.250.43.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pY-0000000Dd13-0ZcZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 03:38:45 +0000
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gpX7L3L2qz8sbh;
	Mon, 29 Jun 2026 03:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1782704321;
	bh=YS27Kixvby6KSWXTt2w35oH9jMdFGUOYAotvdtSmrSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YKtNGdPNllSWHUf29xTf+H/qJRGsTx9ge6T579+WgPUypUW5v6y3OJtqWs9HWUTiV
	 zbhlllaRoZxWjota9YxkLFCLGUnaZSNXbEHfDHKvUTG+CT7vASnJUFZVfv57AR/Ec4
	 Fd5+G/+P+UUSqhj8+IT43fw3bELljdvhSncYSiDIFxwhmV9y+Otp+AcMqSGLXXXdl4
	 1p0/vY7R4zmYhlP/s+8tmuFG4M0xvDXSzDQZQqw1SNiukkScPwDdbYFoBIAx57yRsb
	 A4UBNbrxuI8Ovx4rFMv+ZAmaWs7neivc5ZH3vRpkCpGXtKUUb1OEKNc3Z5hcESrTNF
	 WpS5rTL2gqnAw==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 28 Jun 2026 20:38:20 -0700
Subject: [PATCH 6/7] net: phy: qt2025: use vertical import style
MIME-Version: 1.0
Message-Id: <20260628-b4-rust-vertical-imports-v1-6-98bc71d4810b@gurudas.dev>
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
To: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-block@vger.kernel.org, netdev@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_203844_616764_18E9E93B 
X-CRM114-Status: UNSURE (   8.33  )
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
 drivers/net/phy/qt2025.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 470d89a0ac00..efde3f909367 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -14,11 +14,17 @@
 use kernel::io::poll::read_poll_timeout;
 use kernel::net::phy::{
     self,
-    reg::{Mmd, C45},
+    reg::{
+        Mmd,
+        C45, //
+    },
     Driver,
 };
 use kernel::prelude::*;
-use kernel::sizes::{SZ_16K, SZ_8K};
+use kernel::sizes::{
+    SZ_16K,
+    SZ_8K, //
+};
 use kernel::time::Delta;
 
 kernel::module_phy_driver! {

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
