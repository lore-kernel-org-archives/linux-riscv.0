Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEDDC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3qb4O61W6v2DqSvEd8Pf5+LNQ9CCzHOC5OeLO3OtpI=; b=IjgGrJYKLa4KJI
	emUu504K6Qg3OKky4TVRxA3B5NZ/6sQcbH0oaOc2FqKeqShRevfu3whCPKRvzkU4y9iDZGwpVSfuf
	QUcsR8EbHwkYfabXeubd/m0Yi3vPDeAbhWo+UeKNIv/KNiyecF7hu7AUuM8GLee19OqBaGw8HRuJJ
	GFtZ5IoOsiXgUo/drj9x+zWlVnjEIVsAoYDl6v0B+p5IvpVpbNXGWWdLFYsY8KchnZBDgoFppdWoY
	3O02Xcku2bY5xqM1OnfwbWS/r60gZoa4O1ot776wuHY32huU+QM47t+lc59VmGCPH/UY2epZ+E+q2
	RD+UgTJR3EDB8eD948bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHv-0000000Cyv8-24UG;
	Thu, 10 Jul 2025 20:54:39 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwPt-0000000CkdM-47NH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 18:54:47 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250710185439euoutp019e2de17f8739bde67df930d1267ac259~Q_K205ULE1557715577euoutp01M
	for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 18:54:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250710185439euoutp019e2de17f8739bde67df930d1267ac259~Q_K205ULE1557715577euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752173680;
	bh=2kNfWch7LzrMRqHXiR7iyaKomd7SGOhEOBbXDTwnav0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=OpxLArPpyibRoBlq+IiiyF1zBAgD5mJMdZnErrv2tO0iT7ydJbGjjNOQ0ncVQCdZC
	 nB6QzugQCyf+fwRFBdMVhVATN17OOFko41AngPBK5YSHo0UsFR8HTOZOHw1UgQaJYu
	 e1yUpwEEMxGqpsgana7t6L6ZvLhQBO1lN/vaQsmE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6~Q_K2N1woY3125331253eucas1p2c;
	Thu, 10 Jul 2025 18:54:39 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710185438eusmtip1c9d1a6749dfe98fbcdeeec80da5206a3~Q_K1ELu9C1987919879eusmtip1c;
	Thu, 10 Jul 2025 18:54:38 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 10 Jul 2025 20:54:28 +0200
Subject: [PATCH v11 1/3] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0
Message-Id: <20250710-rust-next-pwm-working-fan-for-sending-v11-1-93824a16f9ec@samsung.com>
In-Reply-To: <20250710-rust-next-pwm-working-fan-for-sending-v11-0-93824a16f9ec@samsung.com>
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
X-CMS-MailID: 20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6
X-Msg-Generator: CA
X-RootMTR: 20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6
X-EPHeader: CA
X-CMS-RootMailID: 20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6
References: <20250710-rust-next-pwm-working-fan-for-sending-v11-0-93824a16f9ec@samsung.com>
	<CGME20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_115446_620815_6485E767 
X-CRM114-Status: GOOD (  12.67  )
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
 include/linux/pwm.h | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 0d66376a83ec350e0c3718959f4d794efd71595a..a33da3dff608fdff91251e5fd07b0dbd295be022 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1600,12 +1600,13 @@ void pwmchip_put(struct pwm_chip *chip)
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
index 8cafc483db53addf95591d1ac74287532c0fa0ee..8f0698c09e62b893d63fc258da3c34781183056f 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -478,6 +478,7 @@ static inline bool pwm_might_sleep(struct pwm_device *pwm)
 
 /* PWM provider APIs */
 void pwmchip_put(struct pwm_chip *chip);
+void pwmchip_release(struct device *dev);
 struct pwm_chip *pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv);
 struct pwm_chip *devm_pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv);
 
@@ -551,6 +552,10 @@ static inline void pwmchip_put(struct pwm_chip *chip)
 {
 }
 
+static inline void pwmchip_release(struct device *dev)
+{
+}
+
 static inline struct pwm_chip *pwmchip_alloc(struct device *parent,
 					     unsigned int npwm,
 					     size_t sizeof_priv)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
