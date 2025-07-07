Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAFDC83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Pgu5jZ2aN7Xas7gMgweHG0+zjuD03TjLpF9MaOt74k=; b=4z8TRIgRXgdAt+
	XZ2stMBAQBR9QTJ/SlUV5R4cJCWzlAdW3b+4UH59F/OGgeTij1gXC03am/6wHTIwBeEADeC9I78FC
	9FT/MFBo1Oh7uyIZQnHIb+JHUfW0+ikg27mBsEjx+EN7wL7tB1iSUgT5KbuVyzP3mXhRqpcGDn8E7
	GqddLh002y8/4fmGpQLaT03iuhQwqA85kidY2ZJGor8yo6DW15azZSZKd2/guRa42Xi7FsbZPArk9
	je6G9rmdgjPkYiD9WW8pAaNonytsWo8Ayam64KjC4gc5Z1AL2E2VhPveoV0G3RuRR4QK9b4JEGKAf
	0lt9SYBsW8mdirWagqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj3s-0000000298U-2p5F;
	Mon, 07 Jul 2025 10:27:00 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiTc-000000022XI-0GKB
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:49:34 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250707094928euoutp01edc83df82e0e49c7e568448a8f0f9b6e~P7y_9Olc_2269722697euoutp016
	for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 09:49:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250707094928euoutp01edc83df82e0e49c7e568448a8f0f9b6e~P7y_9Olc_2269722697euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751881768;
	bh=v184H/+hjF+g7LMn8OCQL3GzK+GQt5a9rJlf+wIu6Rs=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=C2/hVxWstxbxgta80C5Ph98Wnyw6+Oxm+ufwF584REQNd5gtjD1vleKcGwgiKTSeu
	 8BpIUMKmFDtBRIshTnTFGWm9Qk/oA0ud8HewRF5X5nJr37k0XlYmvJz/e8ITw9v33k
	 tlI8ObBlv7E7B6lTBTYN6PK0+QawZVbdx5yIyWt0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250707094927eucas1p2be0302112d89f0ea39e4eeb21c771234~P7y_UFxDO1730317303eucas1p2t;
	Mon,  7 Jul 2025 09:49:27 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250707094926eusmtip1f0ccbebd2086190de86602af194461dc~P7y9MVE5l0369203692eusmtip1X;
	Mon,  7 Jul 2025 09:49:26 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 07 Jul 2025 11:48:29 +0200
Subject: [PATCH v10 1/7] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0
Message-Id: <20250707-rust-next-pwm-working-fan-for-sending-v10-1-d0c5cf342004@samsung.com>
In-Reply-To: <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
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
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250707094927eucas1p2be0302112d89f0ea39e4eeb21c771234
X-Msg-Generator: CA
X-RootMTR: 20250707094927eucas1p2be0302112d89f0ea39e4eeb21c771234
X-EPHeader: CA
X-CMS-RootMailID: 20250707094927eucas1p2be0302112d89f0ea39e4eeb21c771234
References: <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
	<CGME20250707094927eucas1p2be0302112d89f0ea39e4eeb21c771234@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024932_701261_05A76333 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/pwm/core.c  | 2 +-
 include/linux/pwm.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index c1e8ab1a0945889d92dada003060b8b109f2a138..1d33438cd2cf0b5ca53dd22786ed5b5a9f5def8d 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1600,7 +1600,7 @@ void pwmchip_put(struct pwm_chip *chip)
 }
 EXPORT_SYMBOL_GPL(pwmchip_put);
 
-static void pwmchip_release(struct device *pwmchip_dev)
+void pwmchip_release(struct device *pwmchip_dev)
 {
 	struct pwm_chip *chip = pwmchip_from_dev(pwmchip_dev);
 
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
