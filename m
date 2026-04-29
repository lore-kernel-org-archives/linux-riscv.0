Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11449FF885A
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xprTt8tpGcibeVoUplMw/AsUvREcKDlCbI/zck9QGI=; b=x8CDpsVyaejMVD
	wiL8q3kC3cWQi8Q4OWYXPTeJ2o9htO0ro6v9c75s4UBeRvG+ry8sqLwISNj8dR6nGxnpvQslNQPSC
	7qF7PnVKKYh8DrvWiF415ux/5okhSo08nJm4KUieGkwxBGpUfo5bG0kVT7pzE4LMlq4h4Dh39hf68
	DFper5SJ/XBfxEDMxIzLUEU37xKveDBQrwTNmCN2hXYhwTK7koyBYPsPQmselKpktUE1UxdrSRQIM
	9tFecPZ+h+yRMHvZH3q0vNfsqBiWOiLYYafGdHnu2trt28NoTzV6BDNH7hdV5lch0alw871gr309T
	9J3cXPmt7Fz6jKQA5QhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtuL-00000002jIX-0tJ2;
	Wed, 29 Apr 2026 01:40:09 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtuI-00000002jBG-2CW1
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 01:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426767;
	bh=Fa1GhJ9Mm6+UlP/0zx8pjid8wYuGhB8oXYTC38+xnlU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=OFpZrdLGIL5Rp8EVGVfsPCwQaoPT/bwEyQvguwWb8Gsa8MQ/olcHQGa72ZDirruVg
	 2ElFES1hjIqQPtNgGCeFPUeWwVMjUJGYqjEdWpjaIotgV8mFPZvuzpHgDXQYC8Uosc
	 3V0esNPEHEyHPm2ncAHN8/cGKkxR3+NJuIhN2U6M=
X-QQ-mid: esmtpgz14t1777426759ta66e92bf
X-QQ-Originating-IP: TnZa94EYn/Y67XrWQDnUM6ySI8l1koZCnIZNF1cOgfk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8148319090196438835
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:51 +0800
Subject: [PATCH 6/7] ASoC: spacemit: add fixed-sample-rate constraint
 support
MIME-Version: 1.0
Message-Id: <20260429-k3-i2s-v1-6-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=2155;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=rQ3g1iEURZi4LnziZ1fc6sbszDwJlqQ9RIGs3gyTlGc=;
 b=1QAW1hqaGPJM7giTj3fW5j/i0VLxVFmLKJwW6gR8vxiDo5ByP5sbUNgS70bD3NzQFt64DAf0Z
 HYKiC8VJCVOAt8KHIMtFWqYJgdquan9RXkP5vET9BXSGlQQqWfcQuxr
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OZqyam1FSiaosYAPBJcGjTlyY+Nl7Xjby3zM2bXOAa9mzlgzEy2FA3ME
	Qg8pOhr6zcBWmB/gcs59ScX1rPu6hPlxEHN7boBxqghMnp9TAfrrN5+O8RFzDtteD8L2SNl
	Lau8WiYJIpyvA6bHTsBEIQpN+kTJVK0iEeQw1n5mRpv/0MCQH23nreYvp/8s9ALzSIZfKoq
	Lb1OjOySOkdNuXfb2RiuHo6ckqL9PCKPvyg31pl3r7khxojDPAOSSLkLJJSYlBabundEiN+
	l08ckLrd6G9UGS3lIGtGo2lmwVm18qr+1AHlk+TNhKOKq+l6QbJVtkMYzyjpStFWtwuv+hL
	yjLlsU73L4Tt0NjseFCHy3mcOPZyLpcBVm53uxWonePBB4mCCPFfJ+zSYBqcjIOktwBDFgE
	VmCuevXQh512xoOA6yvlr7ZHXRsaFVxf1Wo7x9dm+vkFgTK/KDylhy555gYhqC5scCnvQkJ
	dGTYZJFqaOiIu3iBnNBFtC/Y56teEuqdPK11O8dOdG82QrKW1JT0RVwb1ddHq7U8St62hmc
	9kPi3OGpW406Q7g9XtzD68hTu/qwsykX83RGkSj3w5nJv1LZ0PzmIhlqCi1CjkEYDx+yHSj
	dNfjGPi04yN6QC8UUrfsomUAvE30XReWuqi3hSrmCgIyXUnSIx9Zfb7yzOHqtCF6QJasWmr
	B0ssS7jVZnO8oy01oTIKCZFIFi0a5lnZngSh10Zf2wbmFXrnA/Aeft6r0/QownADpLkfWQU
	tVg6N208DN1l88TlOF0yOU3SvdN8WjaEgzVQjxKZ1/NtqyOPyAcvPUx2aS7EsDJ4zYmSHTW
	3IIaSFLTpFISuY1S6FKm2b06Kp4xpqwi2TvZ2jSWc42r+F4igP+jIb4zfswTDuxdHz5VH5Q
	wCBc5Srug3xP+qnKMKYNFDdDDFcU2h2RidJOpJIdynLlqh9DTcYJ7DzDN0DLGESPj5cQF2W
	X5DtQ3DRoGvLe/aWzxxRn4Un0T/Xl7rwBxJg0nnllJLOfcsbmAKv3kZFQppOzG6KLAp9ts7
	3+21ClppmGjH9h8bMLJbLOyLjNLrJ1XTfH7h7dBUF2DlQJOxj6oacHxGjQTLyvLzBoh6oVy
	9f49m7Qn+iubk3r5bQmBONTgmzD4esNrWoj1BkdggTbgG+nPjdAn0Xbb1luvJlhtzrggj09
	vSoKlw4pRjYtNL6GhKelgeOMI1auqsy+8ApC
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_184007_098492_A376ABD0 
X-CRM114-Status: GOOD (  12.13  )
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

When multiple I2S controllers share a common bclk, they must all use
the same sample rate. Read the optional spacemit,fixed-sample-rate DT
property and apply it as a hardware constraint in the startup callback,
restricting the PCM rate to the specified value.

This applies to both K1 and K3 SoCs and is only needed when two or
more I2S controllers are active simultaneously.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index cef883ba4de9..7d0794d21ea6 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
@@ -54,6 +55,8 @@ struct spacemit_i2s_dev {
 	struct clk *bclk;
 	struct clk *sspa_clk;
 
+	unsigned int fixed_sample_rate;
+
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 
@@ -111,6 +114,13 @@ static int spacemit_i2s_startup(struct snd_pcm_substream *substream,
 {
 	struct spacemit_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
 
+	if (i2s->fixed_sample_rate) {
+		snd_pcm_hw_constraint_minmax(substream->runtime,
+					     SNDRV_PCM_HW_PARAM_RATE,
+					     i2s->fixed_sample_rate,
+					     i2s->fixed_sample_rate);
+	}
+
 	switch (i2s->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		snd_pcm_hw_constraint_minmax(substream->runtime,
@@ -437,6 +447,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
 				     "failed to enable sspa clock\n");
 
+	of_property_read_u32(i2s->dev->of_node, "spacemit,fixed-sample-rate",
+			     &i2s->fixed_sample_rate);
+
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
 		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
