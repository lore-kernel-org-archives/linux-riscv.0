Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E55FC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LIqtbd0ewr8MzN/7ymaqC1a8O884ACsaAzX/4XPSfI=; b=wxTtHUif8o1pnx
	Yuh2mlYJdVJztFTU7NBzuQ6P+J3tTgJPq67aq2mtYvn0y0NWogdz/aeoYiUu2Q61h5sfLArdx+Cao
	S6ORuRZUFpgD5ddJJJGcLrsfPMYW0nSO+NmXHpkaYu60clibYjB+/6DSQKDv8QY4X2ngcF/KuWoWU
	dqkHwdVG4tABZ7+NJgdiMUnJURelzSmn84IiTFDRvRK79r80+azTFByu2kLUk8Olu3rghjLSeDJw+
	mqaTw+MbCXvlHWaMjpC/jh7r32peI6ha6zqcMT1uaciqK53Sb0sIQNIRLI1bNxunZAtnnqJvLNG68
	tJlJIsG+yWkZxuvIdBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4H-00000009kJH-2CJV;
	Thu, 17 Jul 2025 09:38:21 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKbR-00000009gbm-1dSZ
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 09:08:35 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250717090831euoutp01e35919b8c7f2c7a5de3cecebecbd2453~S-sFuK8cX0793107931euoutp01a
	for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 09:08:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250717090831euoutp01e35919b8c7f2c7a5de3cecebecbd2453~S-sFuK8cX0793107931euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752743311;
	bh=nDSmSNpkyDqN+0uDTeiaM6bqnry5ClWU0W8WQ15siTk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=o2motPbhm36QUgClLstkmJ71FnCsOblOikU3CBdS6drDSzEefOnO2VXf4t5fEDfZq
	 bwiLlex21BG2k2XWnN04qNaVPAfvuzv4Y5MBfM1FbzODbJNVkD1M6gT2Kuirqt7sRO
	 Ndop7P3M4N4BHFGhA5gddhoVdHd/ivmV2HJ9O7N8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250717090830eucas1p191fbd4e0baa40468884307a1b6277be3~S-sEtNIw52894328943eucas1p1k;
	Thu, 17 Jul 2025 09:08:30 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250717090829eusmtip219cf93ca91b35a023e836ca35c24a3eb~S-sDm3ayG0473704737eusmtip2k;
	Thu, 17 Jul 2025 09:08:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 17 Jul 2025 11:08:23 +0200
Subject: [PATCH v12 1/3] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0
Message-Id: <20250717-rust-next-pwm-working-fan-for-sending-v12-1-40f73defae0c@samsung.com>
In-Reply-To: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250717090830eucas1p191fbd4e0baa40468884307a1b6277be3
X-Msg-Generator: CA
X-RootMTR: 20250717090830eucas1p191fbd4e0baa40468884307a1b6277be3
X-EPHeader: CA
X-CMS-RootMailID: 20250717090830eucas1p191fbd4e0baa40468884307a1b6277be3
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
	<CGME20250717090830eucas1p191fbd4e0baa40468884307a1b6277be3@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_020834_065037_D1F55A68 
X-CRM114-Status: GOOD (  11.88  )
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

The upcoming Rust abstraction layer for the PWM subsystem uses a custom
`dev->release` handler to safely manage the lifetime of its driver
data.

To prevent leaking the memory of the `struct pwm_chip` (allocated by
`pwmchip_alloc`), this custom handler must also call the original
`pwmchip_release` function to complete the cleanup.

Make `pwmchip_release` a global, exported function so that it can be
called from the Rust FFI bridge. This involves removing the `static`
keyword, adding a prototype to the public header, and exporting the
symbol.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/core.c  | 3 ++-
 include/linux/pwm.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 4d842c69219445ff1c97ebdb9f1f64031c183a84..bbf729b95c7b94b05bc25bdc1febafb0f2437121 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1598,12 +1598,13 @@ void pwmchip_put(struct pwm_chip *chip)
 }
 EXPORT_SYMBOL_GPL(pwmchip_put);
 
-static void pwmchip_release(struct device *pwmchip_dev)
+void pwmchip_release(struct device *pwmchip_dev)
 {
 	struct pwm_chip *chip = pwmchip_from_dev(pwmchip_dev);
 
 	kfree(chip);
 }
+EXPORT_SYMBOL_GPL(pwmchip_release);
 
 struct pwm_chip *pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv)
 {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 63a17d2b4ec8d0d34a02b05240efb75b637dd99f..82707802ff93432086e5a8f915b519b987c68041 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -480,6 +480,12 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
 #define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
 void pwmchip_remove(struct pwm_chip *chip);
 
+/*
+ * For FFI wrapper use only:
+ * The Rust PWM abstraction needs this to properly free the pwm_chip.
+ */
+void pwmchip_release(struct device *dev);
+
 int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
 #define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
