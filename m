Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE0CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asFpRq4Qj3VlnGiAyYGyjn/tH0hPXeTdeN93IEXYv78=; b=mp7Q38bbNfJEXx
	6x/Lrxn5FX2/0wtXlYoZ1tHkhOjJSF8dj1XmvYLjdd+xrnAZfpzyNmSMVy1XjT0nyaG1aRWcH1Ooh
	YeAr+qMQFZDXl8K6NhMHGk7z0evGNkQ6N/9LP3C7b9g71zJrIY08nrYQofMxCAuFiHHIbTrJqIF26
	h46cvG4iQwqCzVb7X09FcwfWs5qv7W3nw54YiEbz0Fot1FQL9zqDFr60YJ/EVkduOnt3YU+ui0dsb
	XCvHKLQs2A/vHngeuUx6vZJpfDijly+tgtpZB1HfBAG7dZn0q2Hn8qeJMojdrF71tvHf08R2yxkIS
	s+R+4y//quaA4lublwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKt-00000003QGy-0olW;
	Thu, 08 Oct 2026 02:58:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKr-00000003QGN-3TrT
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4828060136;
	Thu,  8 Oct 2026 02:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C211F000FF;
	Thu,  8 Oct 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428301;
	bh=L/KpMPW/cfYhU188gUGG66uswSsQntLXpfBhZ1oJPlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BJxiFcDKdQZuelGxj1C2JSIT6Wd2F0VMbLnrNME9HWpxAKIZG2F2cvZ/3SsawLSsl
	 oNT1BugEouBTcDk46i7Oq8JqnDOPQTL97eTIBfmdVdZUgmFx8OOYncvkM5+FxlXzxe
	 dErBgnyziUNqjii8xu6Wd6YcMNhQhhjD44xholc1spQpx6Z5ydo8+6RT8nt9xMOG3q
	 1KvTAf8sQ1zmMg+qmeEIbaHNrQrcdfzsULX0JUHMS0Xs9/4ylgJoSBvAqW1uPmuDg8
	 ZAco1Ercm0BOzXUSBMLlRq3/ejwRd77BSVyzik01gLFHqCwMZsiwzSbAm1eBcntHak
	 +xrK3riEZULbw==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 08 Oct 2026 02:57:56 +0000
Subject: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
MIME-Version: 1.0
Message-Id: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525; i=dlan@kernel.org;
 h=from:subject:message-id; bh=H7ZCKYOgp3C41MQBZ7N1uzwtq++DacOm3eo3KL4+HX4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa+ElFiik+kEh7JOJaThddGv6UwjQMqdEY2I
 WtdU0bhKNWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGvhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1RoRAAlzmQewOqmd5qcGC1pKazht+H7nTiQQ5uPaGj1drxpNxlDRbL9WfZj
 YzDMykU7DaQYlg/s5LpbCSBPgHRYljEkvToZRAKxO76pW8RxLsNBW0G9UAwtcKM7WZlBNplXLCF
 qaL9kjBK2Vc1ceWzpypqnuOjPMat26Uy+Mmc4U48hgX4H8bdkXzfvmPtN3Y7fG832Xt77CkTo4G
 zH6sVAC3htDtjuC54/Kx3V2MtFWRSuJZHKlNpSbbZaxUa94a7juEGHonALfeSWPAIBm/dcZaphZ
 h7eYdd9GuYLs2Uky3Zj2ecOWeLXMdzIXSd/aP9pwWn5wuFMIvKp7u50LDo8TpShK33K8YDedJs0
 dV3c2mR0N6ZdH6mT1qg7YMrvpAylj/TADKP4czCQM3UUFAzDzk++1N7oBrS0UHXFi9ooAOhzt6G
 HdwmoE2kwZt8gER/41/3rF3amL+sl+HNDFbEADak/mz5OCHA2IiqrYMXB9WiJDJcX5SK3DoEXbf
 3Z9Lg4BwcJA0ZISK8O5JT8KeiVDyREVcza6QTAzhpM/DpLaM/1aljHORiaL6lW/MWjGoSp/ls7Z
 JU+1mFc4cUyr76Dcx7iJXksZLgPzvRWTzZVHSvIgGXy/WS4bc2zIfB7Cqbj1Nnz67/rRoioh35D
 NQFJduSurYk4ht2YVjdS5XkQo+LHN0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-clk@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The APMU (Application Subsystem Power Management Unit) register region
block contains the pm domain management capabilities, introduce a pm_name
member inside CCU data to register a pm domain device via the auxiliary
bus if that is needed - if pm_name is null, no device is registered.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k1.c     | 1 +
 drivers/clk/spacemit/ccu-k3.c     | 1 +
 drivers/clk/spacemit/ccu_common.c | 4 ++++
 drivers/clk/spacemit/ccu_common.h | 1 +
 4 files changed, 7 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index dee14d25f75d..9e2727521916 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -972,6 +972,7 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_name	= "k1-apmu-reset",
+	.pm_name	= "k1-apmu-pmdomain",
 	.hws		= k1_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 92b930d5ff30..e895d3ee6a28 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -1449,6 +1449,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] = {
 
 static const struct spacemit_ccu_data k3_ccu_apmu_data = {
 	.reset_name	= "k3-apmu-reset",
+	.pm_name	= "k3-apmu-pmdomain",
 	.hws		= k3_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k3_ccu_apmu_hws),
 };
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 56f3d081857e..38577fb7776a 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -169,6 +169,10 @@ int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register resets\n");
 
+	ret = spacemit_ccu_aux_register(dev, base_regmap, data->pm_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register pm domain\n");
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index 8691698e007d..221a92117b94 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -41,6 +41,7 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 
 struct spacemit_ccu_data {
 	const char *reset_name;
+	const char *pm_name;
 	struct clk_hw **hws;
 	size_t num;
 };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
