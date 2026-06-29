Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F55EC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3qCQuPMXzlKUnP8XRU1YkivcUcwdsep7tvkf778NoQ=; b=IFpcm3RynygyTC
	lHCTg3fs8olUV2NrXYsIn7/CBFyvE63M377WmxLZMzJhnDF9HBT0dW1MAua6qz84kiLI2oNpgebbT
	VY7+ZtTnWKXFqeTXZi6mX16iE+LxAY2lTv7xuYQk8skRGRzBFYdUFb2ht7wSKXsUzoIhkyITQYuP1
	hRKp7ZkoINuXMsXYtHms5iC/0CfD8ierDyJqcCiBrLvqFdgT6oQw5aqG8NfqVdM2h5VtI8NeVTox5
	pHLsRlt5FUyHMeoqvUrR7ZtKw772zrrFviImpSPbMNOSQyJu0te++4d2BWDx2QRQsw7fRlDChY8wt
	0We/oxhcNftfi6hjJnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pS-0000000Dcz0-3Vgi;
	Mon, 29 Jun 2026 03:38:38 +0000
Received: from out-13.smtp.spacemail.com ([63.250.43.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pP-0000000Dcxa-48SO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 03:38:37 +0000
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gpX7C0rnKz8sb8;
	Mon, 29 Jun 2026 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1782704313;
	bh=12kJt+AIgxakapjwIcyF/iXkCRfLwOpvhuLILXfF+08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jLuXfRzFg0qttahpIa6foL6H00Gl811uWp5MQXz4hhf4ExCOOLebSIOqCdH25gaVw
	 w+7wULiJuPP0pOJbMoG87Qr12+sPu2YQhik5HhMucF6ADHFqIgiF/AMyDFIw68+VFc
	 CA1Egal6jqOERY4nl6ozzQKji4gWbczzEdkSlT12vW8pJMzUjxy1lnzG3x1X/G40vm
	 SNgmdhqb1Dp5bANhBGtKi/YQEAQ5KAE5+ukV8d4SRdEUwLriy54prAIUrMjadV7HCG
	 vIFjEdOZpphWzC2dSb3y3Ar7MyN+3fV/bMoREtSa0C0D8aCwCRt+jzHq2XMxS0UVnQ
	 ZGMCXTwwI9+pA==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 28 Jun 2026 20:38:17 -0700
Subject: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
MIME-Version: 1.0
Message-Id: <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
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
X-CRM114-CacheID: sfid-20260628_203836_192773_1DC50AD5 
X-CRM114-Status: UNSURE (   8.86  )
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
 drivers/cpufreq/rcpufreq_dt.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 10106fa13095..6f83cf8955a6 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -6,7 +6,10 @@
     clk::Clk,
     cpu, cpufreq,
     cpumask::CpumaskVar,
-    device::{Core, Device},
+    device::{
+        Core,
+        Device, //
+    },
     error::code::*,
     macros::vtable,
     module_platform_driver, of, opp, platform,

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
