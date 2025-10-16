Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6083CCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkz4qZpsUptP4hb74Bft6SlhO2kR9Vdeq7hGcYetd+0=; b=Tmq60+yznALdkF
	LWfdsdPoY8HxKNVjUAzZQbcV89N93/3GMSXVM2UES9OwLEQL1pkDnqWes8KchVq2xS4j7Q/7/IvHt
	65zHIDGpRD/s6gNYUxHLSlDirNf0hj1Xpiald7NQW8CxbN/OZtqwRIanZXX0CAoBhgD7r5mfi30IB
	U7/ixZjIoVbYCEk1w+ifhbdZII4prg+DmfW39xiqpdV9PcHpsDV+cegMIbEbr2iGLZ53qeDfw5kmF
	YhDNUxoiGFDYOLP9bCRbBiPf/7yzfGVM76NbukgAukofoPFshoHPUnUcSScVifjxowWGQEVmWFnaU
	RyUaCglOAeNDt1Kilhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OBU-00000004tKg-43OY;
	Thu, 16 Oct 2025 13:38:24 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OBR-00000004tId-34wH
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 13:38:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251016133817euoutp013dd5c50c3d891dea5550276399c45b43~u-EmMa8B00221002210euoutp01N
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 13:38:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251016133817euoutp013dd5c50c3d891dea5550276399c45b43~u-EmMa8B00221002210euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760621897;
	bh=hzrq4YN2uxPOg/leJpiVtHnEWUk+dlsqQnLVVz66HuM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=WxZjjjw6sWUb4PnNgYlnHMrYxYhTnNbXCL6vcZIwAGnXqGqQxkisuEQavXsKTryzA
	 EBj5NsQ8Mueteh8zEKTCYC0UNFjdn0v6XkY6GONxbhCLt7COCdnV9rglhSQ7aktdEj
	 mDYB4vA6+SEMV/G7g9/Edm/A8y+Nl9dbObblKLbI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251016133816eucas1p1cf2b9498e4cedda601aaa73df353a03f~u-ElojZHD2477524775eucas1p1I;
	Thu, 16 Oct 2025 13:38:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251016133814eusmtip2c78e6e9672676ae6818c90c58f0ec878~u-Ej1lwtn2342023420eusmtip2U;
	Thu, 16 Oct 2025 13:38:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 16 Oct 2025 15:38:01 +0200
Subject: [PATCH v16 1/7] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0
Message-Id: <20251016-rust-next-pwm-working-fan-for-sending-v16-1-a5df2405d2bd@samsung.com>
In-Reply-To: <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>,  Benno Lossin
	<lossin@kernel.org>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Elle Rhumsaa <elle@weathered-steel.dev>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251016133816eucas1p1cf2b9498e4cedda601aaa73df353a03f
X-Msg-Generator: CA
X-RootMTR: 20251016133816eucas1p1cf2b9498e4cedda601aaa73df353a03f
X-EPHeader: CA
X-CMS-RootMailID: 20251016133816eucas1p1cf2b9498e4cedda601aaa73df353a03f
References: <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
	<CGME20251016133816eucas1p1cf2b9498e4cedda601aaa73df353a03f@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_063822_375188_89A8DD3E 
X-CRM114-Status: GOOD (  12.08  )
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

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/core.c  | 3 ++-
 include/linux/pwm.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ea2ccf42e81441d00a349f6d8641c92143d94797..47c9333baaf6c7d752a71c26bb1957ea2fd17a50 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1608,12 +1608,13 @@ void pwmchip_put(struct pwm_chip *chip)
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
index 549ac4aaad59ba6d7ba58d818b46a58a8759e09c..148f056f336bbe17ffc3df22aa6b6bc3ad854e40 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -488,6 +488,12 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
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
