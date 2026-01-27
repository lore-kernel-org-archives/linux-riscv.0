Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E4FD2FED9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/abgJtegn6+j3eszzX1vbzyB2sKeA4R1UAbkBI30YU=; b=LeastALeGPc4z9
	0w/i1EDmZ3UeKtSR1xyZvkacj3u1VIBrzIFb8ismtKY5TJ23+00G39pKgEJ4LYlDzhC9RoKRZfvOz
	jjVfZ2AiBUa5yiYLja+eR07eA61jFYZgvj4aMpQcqggAs8MX0tdQm/6IRaGvmPQEfXfdRbJ5633L9
	ZcUZMvbWAkqEvlhv1d94lPdjSrLfx1/b9Dkr+rDsvYeQ5KdWu6a8QkvBq0sBPevqaQmIygeMasVbz
	M3k5lGJbxyLIrYDMlO8/QnojumxEL09yzBMRWESIZjTnPLx3zHLhAEVh+oTe1VoUuTz+kyKGIhC1G
	ZE2Krqsil8h+DXEF4Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7I-0000000EqHx-3ZVh;
	Tue, 27 Jan 2026 18:48:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7G-0000000EqHB-0LjC
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:48:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-4359108fd24so3639622f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 10:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539720; x=1770144520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=fxLzGAdwUumi0X+4dNQgN3ifXBlNDDDoHcMOHFp4qlFfC9VqyX48SJyG173Kfc8XE7
         I9GxmMELAAGQdxyMKjzuFP7eKxOizMfkfpiORCW+rdLehDlh1NUq+49jIwGDL5D2hiPV
         +o1n/8hEtQhvj83HoeswC/PfJepYArNEuSJ+Mk/o/GoxYk5wFoe9Eb+A6ihEUbbF2UyU
         cY6of9a+ksUcRUqK6u6OOa4S9+xejUOudP4REdJE+D9I8qdUgjxROsbS1XJ8u/Vmvat8
         IiZDdspWqci6KtNvZEy4oflOCwjAdvTK72wVFG5twck/p45n9uqhU1Do4hjB1eXNaZ71
         3XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539720; x=1770144520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=tIpQWf282y7savH44XS6Tl0jUERfNx8YfDNm7eLmNjAJbNjj1rakKm7EYHAwJIlKk7
         sRRkCy6kU8xxeskT56NLlSVGM/iD62eHrVScSpqI8BfY75Jxcv0rEBwM1x7SndIDzO6F
         IxkRjn/ZmidRAFmTuve39I3o9bflujyk6CpUS+qhgoJ4m9+PXYgCd5k05ShsKd/E5Ccp
         Df8fiX/PhUDf3Z2munaq77pTcB9jtzoEZDeYJ8UGbODEr/k0XtiZAxlAoQzCTMbTlBn/
         rNrOTlwTc88cfFUTbB8DTutg1nKzNkmHRJWFMLE3+okSIIrhtQoK6GkOSgdURi9ahA0t
         B4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW7pLlv7/3+QYR23un0sGYgbOTrFGox+XcOrULiMoK+iS/zsO83VdzbNE/0x3h3Ti7OG9mu+UXNbLMvxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEY4CYfnuHURmYA57aWYlSHq+xMvYh05VQkk2BHOOWPVn/OyZN
	jmqkrE0/O7GA82RiPUyy7h4IxRAPzYoeZPJCKku6/B4LESHAYijL2U1y
X-Gm-Gg: AZuq6aKW7BlmvXmPb4lbnaIsbSKl/sCx0qmX310rUqcFNQfv3l9CeJopn2WEZvBtkv9
	jkhzLeXXuPcMaq7rNoS7tDFVnvv2bd6mXqFnX1svhoILRRRNtChHMvLoAVq5axFGrdhK+nQA6ar
	usrlu1Ce9LPb5bxLGVEWL8LpZBTl3hxthx+EZGdBZ0wgAWeAxYbsz+QIAx/aakzesoVLcyAUdPP
	eUjsfMuIC01tkR2f9/Vl5vCJ6fqWcaJrFdQjPZxSYz5B5OAwighQeNv60+K5LzFqkIw0M0qrTwP
	N/WsAHEv1w2N0UKWcr3O0cIKG0fEOB4RiQAXrL+66i2T7V4FDrl8X0Q5RMbJHrSPjTKygJOvGtk
	dGON35zuzENz2uXTp8ApgBaaFQ9tyHDrcu/rXuejyl+Zx71WU+hkwgIYFXF/wEIepuwXg550cQ+
	e88DJf1JPK+P5SuZIMM1xEa4cUMRzE1/7NG7sXxV5xnspcO+xxXpIsfSc=
X-Received: by 2002:a05:6000:2689:b0:435:a501:359 with SMTP id ffacd0b85a97d-435dd0a3549mr3707922f8f.41.1769539719907;
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:07 +0400
Subject: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
MIME-Version: 1.0
Message-Id: <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=1227;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=AAbdYSDBi4nid+vR4fUUeQUqMN1ByaToFMJu3nLnoTA=;
 b=EBjERO/do4uI4s6LDi0EEae7uhFRf1KBOOxPbimgtsnly9GdSGLKz0u7DPv20vrXS76n0vTk4
 V30AAY1GAInD44pnZDm7KhGkPBKJzms0Rgw1lZyPo47NIssrrNme8x6
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_104842_143042_847152BC 
X-CRM114-Status: GOOD (  10.51  )
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

Add comments to cv1800b_dac_mute() and its caller to explain how the
overwrite mechanism works and why we force it off before playback.
---
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
index ccf386174639..135322bcf6ad 100644
--- a/sound/soc/sophgo/cv1800b-sound-dac.c
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -57,6 +57,10 @@ static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
 	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
 }
 
+/*
+ * Control the DAC overwrite bits. When enabled, the DAC outputs the fixed
+ * overwrite value instead of samples from the I2S input.
+ */
 static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
 {
 	u32 val;
@@ -105,7 +109,7 @@ static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
 		dev_err(priv->dev, "rate %u is not supported\n", rate);
 		return -EINVAL;
 	}
-
+	/* Clear DAC overwrite so playback uses I2S data. */
 	cv1800b_dac_mute(priv, false);
 	/* minimal decimation for 48kHz is 64*/
 	ret = cv1800b_dac_decimation(priv, DECIMATION_64);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
