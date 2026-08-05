Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ACAC55822
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VhMsOFlS8cCObJfQZ0K4KUt0FwQRqkg1O/6XF0N1io=; b=4uy2l5+o/96i+5
	gxU/lrpynYOHX1o+mr39xUJZ/B1w/YDYQJmkCaBQxWwId7s352jY6Pj3YYJ1Z4CCLDEOcNyOecKFm
	xt90AhuUI/hlZ/xlJFADGWdu3qvGDiJ0UpwW+ipECjLB8zdXlNpYpX/SZxTy7vISUTJTPTE3dgick
	88Hkfvfm0dEyk69svGsZrpqPo/5BV3X24qCYOOow1GNtWdRW1gYnyqon+YQXG+YoFq996wOvgDCcV
	Q9zrsMU3eH64yBjuMeASieQ9PiD+0RjxPvlrSs4pydQk7GhAYc3RYujKiLq6vr3awghBeF7wV8Iv1
	kGMSJKkYJodOyJG5KlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVML-00000003L4D-1vWF;
	Wed, 05 Aug 2026 06:44:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVMH-00000003L3f-1Cb6
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 06:44:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ce98cb8165so7612725ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912247; x=1786517047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=ZbfwozJlDjw1kdzxZ6/MhqAx6DOxOcYgrxL0n0qxMdKbjEqXJj2X2TRzRjs8vG1uOe
         iQrXw6xqtwe0MTotIZgTvtvrfu/8IYh3aan6+D7T2Gs9DTR7DU1n0xYquxYUrgux1KRM
         eG7Cr8Pkwun87o3rOEKxbJ3MEZAt0i14D+nieo+zqRMdWwCmHpOHGojVQZeO72es8Rh/
         FeK1Kq4dB2p1M77ZMXLBp4FYhim9uwV8YkLLUJrEp+bjb0iSXBvt11X2okXDL5R/q/Uo
         mWKXFfRn/sdQlisFhS/2er+uCULFcHymFfHSW50mxPPlfTKNIoGkVldHMPitWmOqQWTH
         yxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912247; x=1786517047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=qWHrwZ4yLDD41J07M0e3wF6B2hafFf8zw02x9t1hA+Uz0z6+Lg3t1Oa0W9uyP9e9//
         FPK7+xYJ7jiAoF5a/nLFj5ndQTpo3QScPq984JghMDr9iHNc8hs3Weetqz1OZ1A10dlo
         IUIEAQd4x8ICNUJuewga97PCiXI0qmHxjTkbjAosO+GhZbhWhsa+0RKBeMqGAXnBmRo2
         dx1n/Ivxh9NLzVtL7XrWo8XHmeBUdqQgp01RN3gOOWJF5crUdoc/dXG8OsnDdEYzxDTs
         ZmS0dttgUfY8QMrqsr2KFjcmjbHgzcwMQqTeiM9dKftL84bcCD32iU4ayte5gJDScQ5t
         tX7w==
X-Forwarded-Encrypted: i=1; AHgh+RrfwUj//apQGWVSFYoI37ENdvNHYf/D5ht/GpM2BUBYT7IUjfvVOOCpgFmS+3RchKNHs3WIDX4DgiFqmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxduMjRNt/AVY7BxHUEzMRBnWuG9fxfz/5RMgp7qhf3gI8n3KiG
	I2rgo2h54vLwqHex2XBtCYhzwOLvBgdY1JgCPtl6IAYo/8WF2JSe4B8E
X-Gm-Gg: AR+sD13Gr14UxoNS9Y0h8wF607QZCcxEzT+2TfZSMH95t3UsPY6BWlU1VCqp3NuqClV
	YKAcPlCS/qnQk44r4kkoVaoZFBt2/RlAnP3xefYZEnzCXaSrVvToii3D8m+6GukOZ6/IGXEBsMi
	EhRmdrxYqP9qy72gRgbV4LVEaxtx72cHsUimRSG/3sankxEuO30QJSpJs0ajrlw6zj7qjQyymds
	rxIWQsK4Gp8KydaRBR7ZLeF/ygWQ/wQHC/W4/6AcXLPXdJp8u3iTvoFZ0XTAEcQPpHe3TyIxd8u
	W9hcVWpbtVjYf5ItZuaqBV8W/l599rNd/zZwp8tbaXDHMdVGBf/IvCSLenJcUGiLxsr/HkHgwZQ
	FQjgYfCjV4zRisPjpbfINIuyEjgOC7Z/BzcsdDCw6++57kRK4odZDkOhDIYYZNVKKyzFcW19eoY
	aWbOdgiBwkGU09EXuKTJyFzRSNEa6FXdvWgCiOzm78RK7iZVTv/avqioKVSBNZF7L68AxletXhp
	BDXee9r5WP6+XZQ/cjoFysc8cJbbZDMDt1DJWmN2m8Fw3+4jV+hzmeWAcQwesHZ09WztazMgoS2
	I1H2hg==
X-Received: by 2002:a17:902:e551:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d08aa1c85bmr95025355ad.1.1785912247199;
        Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm14094435ad.39.2026.08.04.23.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:44:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI streams
Date: Wed,  5 Aug 2026 13:43:48 +0700
Message-ID: <20260805064348.44283-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_234409_369692_5549D7A6 
X-CRM114-Status: GOOD (  11.51  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The static DAI template initializes both playback and capture stream
capabilities before dma-names is examined. As a result,
snd_soc_dai_stream_valid() considers both directions valid even when the
device only provides a single DMA channel.

Move the playback and capture capability initialization into
spacemit_i2s_init_dai(), where it is performed only for the stream
directions backed by a corresponding DMA channel. This preserves the
existing capabilities for devices with both "tx" and "rx" DMA channels,
while preventing unsupported stream directions from being advertised.

Initialize rate_min and rate_max together with the other stream
capabilities to preserve the existing rate constraints.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message to describe the functional fix as 
   suggested by Troy.

Link v1 : 
  https://lore.kernel.org/all/20260804043036.22065-1-phucduc.bui@gmail.com/

 sound/soc/spacemit/k1_i2s.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 2d5ea1fd5d49..28a762769253 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
 	.ops = &spacemit_i2s_dai_ops,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
 	.symmetric_rate = 1,
 };
 
@@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->playback.channels_min = 1;
 		dai->playback.channels_max = 2;
 		dai->playback.rates = SPACEMIT_PCM_RATES;
+		dai->playback.rate_min = SNDRV_PCM_RATE_8000;
+		dai->playback.rate_max = SNDRV_PCM_RATE_48000;
 		dai->playback.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->capture.channels_min = 1;
 		dai->capture.channels_max = 2;
 		dai->capture.rates = SPACEMIT_PCM_RATES;
+		dai->capture.rate_min = SNDRV_PCM_RATE_8000;
+		dai->capture.rate_max = SNDRV_PCM_RATE_48000;
 		dai->capture.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
