Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C12C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLhQvSBHqF73gxoa9HXuvNfNCIKNxmHDuPbsynyJ6fE=; b=eJU1lplPEoOnB6
	rOAmvutnwEc1cGeuqNcEW+5+qjrLOsCoW1YeanHVFHYtQE0FbfBvq9PuwXfJHdQte61rz/m7cWkLQ
	/dC0nIH0IPoMhtC4gO8Vv5HrnH5NWOFOds+IbeM1Gev4x2D0qiGVupPDhIjV2pUnsD2L4c2XmKWGz
	3MSjPwneSTWIt+rX9Sdw7CSv9EgAp+xT+b/ztLXwvfxnz/43oBmZhaVy3ekS11ZHPTH2anPDOe/kz
	QAaXdmezoF6UycaAw8qepx3hgSWnRZyJI84uAn6mdR+swrnooNVZtE9TlbCTMztJoMOee2zLBIw83
	cQAPUlx2Vkbbo1pNi44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyov-00000008geh-1fNs;
	Wed, 02 Jul 2025 14:52:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqd-00000008WZv-0SYR
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Vo2d35sEyLP44uYKj+D2S0nhQkzl0XSExM9Iiwegts=; b=g+NnEffJFT12bp0BIR3ixBbpZE
	5QdXP2j0TEXC/qdTxhL2OxxQHe/8O/6KHOUoM9sByyEz4Di+43jUKENSDcYzVlTEyg0aIHf03+7UZ
	ggdMDf3sEYP9yTaZ55m5dRWWB1Y4zx0lAoFozZvPS7VxBTphsIuCOsBM6rDljSjBoojhR6XN8JhlU
	PYucVmHhwwxDCMdckHVcX5nq99+fzf7ALCUkFoA1Aj9r5ulY5aFMtIB/cODmg3EInOAGWplvOUICp
	DockXvXP4VcoYBIbYtCbm5XRbQDInpby0AF4+cavx5DggUZvG2DtwHc35G00Z30E3vM+xno8f3qAX
	JwV3a5bA==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqZ-00000007QZq-2Ysj
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:50:01 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250702134955euoutp02288ad3565aeb65bedaeaad1d54a96f3c~Oc2gJx7sZ2698026980euoutp02Z
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:49:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250702134955euoutp02288ad3565aeb65bedaeaad1d54a96f3c~Oc2gJx7sZ2698026980euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751464195;
	bh=9Vo2d35sEyLP44uYKj+D2S0nhQkzl0XSExM9Iiwegts=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=knHNssPC/jAO3og3ag6EnZtO5+CTbWwrdFHyR3DxgbsFF5hA3bq4d4r87IXxicTGT
	 Hcn+HddVOtQzDBmBaqX5lZbfj/pDZwDh1S++Cyk8xpQus4nJgZychHwRWnPd6ft1p0
	 fD24YhrxqwEJY6oBttL2I0f4tG97ttBSda3LDO0s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702134955eucas1p2ca553f63f44c63a56ba0b2c605edd097~Oc2flYolM0138301383eucas1p2u;
	Wed,  2 Jul 2025 13:49:55 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702134954eusmtip280bf8af38661f8acaf6fd2cc62a6ce1c~Oc2egQ78x1329113291eusmtip22;
	Wed,  2 Jul 2025 13:49:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 02 Jul 2025 15:45:29 +0200
Subject: [PATCH v7 1/8] pwm: Expose PWM_WFHWSIZE in public header
MIME-Version: 1.0
Message-Id: <20250702-rust-next-pwm-working-fan-for-sending-v7-1-67ef39ff1d29@samsung.com>
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
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
X-CMS-MailID: 20250702134955eucas1p2ca553f63f44c63a56ba0b2c605edd097
X-Msg-Generator: CA
X-RootMTR: 20250702134955eucas1p2ca553f63f44c63a56ba0b2c605edd097
X-EPHeader: CA
X-CMS-RootMailID: 20250702134955eucas1p2ca553f63f44c63a56ba0b2c605edd097
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
	<CGME20250702134955eucas1p2ca553f63f44c63a56ba0b2c605edd097@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_144959_802654_60DE2F09 
X-CRM114-Status: GOOD (  15.01  )
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
