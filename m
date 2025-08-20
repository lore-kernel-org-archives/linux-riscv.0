Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B4CA0EFD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TDXAPGlqbLJyoAxEP4ISjlUq5dNqS1txnOVXALL2tk=; b=tK6s9u3LxLvfrW
	2hLSS7k2bIq66bt4YRKXf0DtkyUY0xndRYympfAJ8QTfIdGs4cBiwSBRVgPv+/H5pb/KuRjWJE6tz
	8X5dM31NKY/P6r+aJxHUWh/FyqE8Rr6XLQR4VKbYcazrpRdMOOiv0SILLfp9UdIRuaj6x98ftR47j
	vwX6BhIpSLUc6N2Qg61TlLzTm0OX93o3chFcbwukwKH4psvAsMRrDoS22QTp6CysfSaRHYxdzE8rz
	SGl89pKRZAIKCrfOe8XetwLFPqBMUTcNR96inQ+R5lgECg7/jYhXahfI8A23ikFGJwidVH2Gj5Pfl
	bixMs1ZY9gm2+k5tI0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeyh-0000000CtEn-3vir;
	Wed, 20 Aug 2025 09:19:31 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeIL-0000000ClTe-36TP
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 08:35:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250820083541euoutp01b031889ffa7897e0ec9fbbe59a01a1ef~dbLIRQhFr1804718047euoutp012
	for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 08:35:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250820083541euoutp01b031889ffa7897e0ec9fbbe59a01a1ef~dbLIRQhFr1804718047euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755678941;
	bh=6iiEvUCRFtFK7DqM8g315/TTGl9FgUVC8GFQ/o9G3Hk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=WQ5mRwGD7rW46UInbJIDy7zI5XY5SYvg8BFCLoyAXChvso6MRxuiEBX0FQn21H1Q+
	 qe+b7/lKowraEg98G/ZPpjW0eDlls0kWTF931jCH3LQhXgyYQbdLiKC4RaZj/F/Qqk
	 iG3veOSfec6DUaDNIiOs9JZGQDiyyeFPOBN5Xw1A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9~dbLHuSde72603926039eucas1p2c;
	Wed, 20 Aug 2025 08:35:41 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250820083540eusmtip271037063dd315265e69eb937ff57049d~dbLGpKgbq0492104921eusmtip2W;
	Wed, 20 Aug 2025 08:35:40 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 20 Aug 2025 10:35:36 +0200
Subject: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0
Message-Id: <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
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
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
X-Msg-Generator: CA
X-RootMTR: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
X-EPHeader: CA
X-CMS-RootMailID: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013546_395904_145D77FA 
X-CRM114-Status: GOOD (  12.43  )
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
index 8cafc483db53addf95591d1ac74287532c0fa0ee..d86061024b52172edf3845bf9252a966f120e365 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -485,6 +485,12 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
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
