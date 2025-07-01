Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41788C8303F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLhQvSBHqF73gxoa9HXuvNfNCIKNxmHDuPbsynyJ6fE=; b=XEr6b7h9Rh/k+G
	m4hZC90rfBH+5Sl67FyshuC2MbO+rAABE5HHEjqKwGFaZj28TXgjiDlJMcSGakNNKPXR+eDeK4SRH
	Awt2Km9y/juqlKj+ck5zNGJqfSq16PIC5IdpTWDFZ/FnOFFxDqfuSLEqkOmGKo2gRUg9Q1Ilp9Hun
	eJDNmCbQCYsClHF5/ebKAI8Jj/6fQyk1iMJ+KaBapj95j3zJE4qM0KjIETmm15+b6zL+JN4ex45Fk
	21QRJvxnNIfjkLzd/TOkmpQ1pxvAMFSwzXhWpO5OdO9bgaGKkZt9EzOKnHqNiJt5gPDfo6j/+2goR
	tKXcAM0vwImoD2UR2Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzL-00000006MiX-1jX4;
	Tue, 01 Jul 2025 18:45:51 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQo-00000005xlW-3RrE
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:07 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250701160159euoutp01433635350cb75fd67f95323325e68358~OLAhdKJxB0451404514euoutp01a
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 16:01:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250701160159euoutp01433635350cb75fd67f95323325e68358~OLAhdKJxB0451404514euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751385719;
	bh=9Vo2d35sEyLP44uYKj+D2S0nhQkzl0XSExM9Iiwegts=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ZQAt6TtCcCcETmRmK1KxRG1jJwEG0EuQyjwiykWb8sSRXP8GBB/b/mACARZxLX/R6
	 uv6xPXBY459Kz6XnfS/iNABH7koUEGgbMkT/g4Awrrsh3onJ7sKxylhXPUOp9l6ouQ
	 XPYCxGNi1zvRCx4TTRiadjtHSq1Tonk57CQ+m5Os=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160158eucas1p1402f4cb2ed2b4d0d672d47f5d3beb3d1~OLAgxb6Yb2273322733eucas1p14;
	Tue,  1 Jul 2025 16:01:58 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160157eusmtip1c29a1b313849ae8a233003c533485342~OLAflrnya0876208762eusmtip1e;
	Tue,  1 Jul 2025 16:01:57 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 01 Jul 2025 18:01:38 +0200
Subject: [PATCH v6 1/8] pwm: Expose PWM_WFHWSIZE in public header
MIME-Version: 1.0
Message-Id: <20250701-rust-next-pwm-working-fan-for-sending-v6-1-2710932f6f6b@samsung.com>
In-Reply-To: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
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
	Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Benno
	Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250701160158eucas1p1402f4cb2ed2b4d0d672d47f5d3beb3d1
X-Msg-Generator: CA
X-RootMTR: 20250701160158eucas1p1402f4cb2ed2b4d0d672d47f5d3beb3d1
X-EPHeader: CA
X-CMS-RootMailID: 20250701160158eucas1p1402f4cb2ed2b4d0d672d47f5d3beb3d1
References: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
	<CGME20250701160158eucas1p1402f4cb2ed2b4d0d672d47f5d3beb3d1@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_090204_288096_1DEF5DEF 
X-CRM114-Status: GOOD (  14.73  )
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

The WFHWSIZE constant defines the maximum size for the hardware-specific
waveform representation buffer. It is currently local to
drivers/pwm/core.c, which makes it inaccessible to external tools like
bindgen.

Move the constant to include/linux/pwm.h to make it part of the public
API. As part of this change, rename it to PWM_WFHWSIZE to follow
standard kernel conventions for namespacing macros in public headers.

This allows bindgen to automatically generate a corresponding constant
for the Rust PWM abstractions, ensuring the value remains synchronized
between the C core and Rust code and preventing future maintenance
issues.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/core.c  | 26 ++++++++++++--------------
 include/linux/pwm.h |  2 ++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index b86f06ab2a324ac98115845f72d9386966a0a3b8..c1e8ab1a0945889d92dada003060b8b109f2a138 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -210,8 +210,6 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
 	return ret;
 }
 
-#define WFHWSIZE 20
-
 /**
  * pwm_round_waveform_might_sleep - Query hardware capabilities
  * Cannot be used in atomic context.
@@ -248,10 +246,10 @@ int pwm_round_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *
 	struct pwm_chip *chip = pwm->chip;
 	const struct pwm_ops *ops = chip->ops;
 	struct pwm_waveform wf_req = *wf;
-	char wfhw[WFHWSIZE];
+	char wfhw[PWM_WFHWSIZE];
 	int ret_tohw, ret_fromhw;
 
-	BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
+	BUG_ON(PWM_WFHWSIZE < ops->sizeof_wfhw);
 
 	if (!pwmchip_supports_waveform(chip))
 		return -EOPNOTSUPP;
@@ -306,10 +304,10 @@ int pwm_get_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf
 {
 	struct pwm_chip *chip = pwm->chip;
 	const struct pwm_ops *ops = chip->ops;
-	char wfhw[WFHWSIZE];
+	char wfhw[PWM_WFHWSIZE];
 	int err;
 
-	BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
+	BUG_ON(PWM_WFHWSIZE < ops->sizeof_wfhw);
 
 	if (!pwmchip_supports_waveform(chip) || !ops->read_waveform)
 		return -EOPNOTSUPP;
@@ -334,11 +332,11 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
 {
 	struct pwm_chip *chip = pwm->chip;
 	const struct pwm_ops *ops = chip->ops;
-	char wfhw[WFHWSIZE];
+	char wfhw[PWM_WFHWSIZE];
 	struct pwm_waveform wf_rounded;
 	int err, ret_tohw;
 
-	BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
+	BUG_ON(PWM_WFHWSIZE < ops->sizeof_wfhw);
 
 	if (!pwmchip_supports_waveform(chip))
 		return -EOPNOTSUPP;
@@ -650,9 +648,9 @@ static int __pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
 
 	if (pwmchip_supports_waveform(chip)) {
 		struct pwm_waveform wf;
-		char wfhw[WFHWSIZE];
+		char wfhw[PWM_WFHWSIZE];
 
-		BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
+		BUG_ON(PWM_WFHWSIZE < ops->sizeof_wfhw);
 
 		pwm_state2wf(state, &wf);
 
@@ -809,10 +807,10 @@ int pwm_get_state_hw(struct pwm_device *pwm, struct pwm_state *state)
 		return -ENODEV;
 
 	if (pwmchip_supports_waveform(chip) && ops->read_waveform) {
-		char wfhw[WFHWSIZE];
+		char wfhw[PWM_WFHWSIZE];
 		struct pwm_waveform wf;
 
-		BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
+		BUG_ON(PWM_WFHWSIZE < ops->sizeof_wfhw);
 
 		ret = __pwm_read_waveform(chip, pwm, &wfhw);
 		if (ret)
@@ -1696,8 +1694,8 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
 		    !ops->write_waveform)
 			return false;
 
-		if (WFHWSIZE < ops->sizeof_wfhw) {
-			dev_warn(pwmchip_parent(chip), "WFHWSIZE < %zu\n", ops->sizeof_wfhw);
+		if (PWM_WFHWSIZE < ops->sizeof_wfhw) {
+			dev_warn(pwmchip_parent(chip), "PWM_WFHWSIZE < %zu\n", ops->sizeof_wfhw);
 			return false;
 		}
 	} else {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 2492c91452f9641881e9923e5a97e0705047da59..8cafc483db53addf95591d1ac74287532c0fa0ee 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -274,6 +274,8 @@ struct pwm_capture {
 	unsigned int duty_cycle;
 };
 
+#define PWM_WFHWSIZE 20
+
 /**
  * struct pwm_ops - PWM controller operations
  * @request: optional hook for requesting a PWM

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
