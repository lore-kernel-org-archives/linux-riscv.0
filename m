Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9477FD2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vb1ejjeVNMELAtO2L94VpjkbLY643j38eeypZsUFBvY=; b=hMJbsi2ON/BrJF
	SC9Zk0AT4Ow2wLhKFbq5E2sK4iPH+RABMbVwF13t/GcZavWB30bPRCjHFxI/2ahL0fLCiyX0YxDzT
	ft8xVOA/pH4l6+6H2z/+iCQPJifJBQ6J0D8KWJwfkUIwHWCVhqDgzzWQhAC3ZIIGSlex9LeUH06Qe
	knzqeaM9wW0Q9JeX+eJZU1FpaVgiSC/XWmwtsu69ZgYO42jU1dxkb00JjBC5k/S1wmFX/dJq7lN/L
	GT/c4wKobeUGeXN2JzDNmfPyXps9sK5fJaz5+R8Aa4jRnm+awy9rczbMMGKCQid/qH65endKGUna/
	LQ8tczfxOHIDLreKZzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQh-0000000Esxe-0oWy;
	Tue, 27 Jan 2026 19:08:47 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQe-0000000Esvy-3p8r
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 19:08:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so1219325e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540923; x=1770145723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=Va2Jh+LGsAbimjBg30qVYg2UHUgGdFBVqrCuAVjl+S17IJ7ELmueZRbIUZ/aL8MQRx
         mcq8Txsjojy/NskaAdGipQn6UNZK+wxSR8Abnz0mD35ZzDGjuF8A77RPZQuE4herVL3q
         mbraTfqmqnXtYKULPo61tQXX5ZSvq/55hcMW2vLaNrDdLEdkvfnZdYBfpEpDUZhxni11
         yrwRiNXTTiZf7syBXOCzMgriazdqGa7S/XXuPBjyrQaeOrtjPG+7ijfvTubHpjNqm31O
         s+UUP0+P8a3udoE+2XHsqIpGY0NLDXiDKaLMLuD1EIJOxUmM/lbsu1Ug5Q1gBq1fCE9p
         KDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540923; x=1770145723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=gkK931IAbbMq2EUFfAIm8iJ5OKZQRB6OphdorH6Vx3drs+yzhESEDjuSHh/QS2CJ/p
         zOPuRmglhX+AcsXfzJEHkdM1fG50W5YUvKSFKbpdBJ1UFLjtyWBf1lRZTyM8jg3qK6TD
         Zg3GsdQXLgbD6GJYsKwNxaJfkxHIKCtoI6qtHy4FGqBQeew/R3lSOuSXmscwStp/6tpZ
         9W5jFskuYJkQUGffRZ7bh5jgr7W3xylKNJGRMat/t3xwkWkADryB9q8tjdepN8eoWvtb
         QG4d1peZ71JX6KmBX+a2AB4//6s0s4yJk+iMU7Y3Ra6nuaXvg66zltvhK7fwtAzAlvZG
         eNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9dBHsDaCIu+u2XysMrj6l6ktwZdead+5c8tlLAUoqUUDqB2E90M8XFS5E8HCSMT08P95j7m2YMr+HpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze5aUsf+qSAeZggR9ZSDIp7SuWXdvQeuIPap+H2U1Pmn+WMlBe
	CWmkRP9Msib2laYGFoWuvtVgcR/7fXHwH7GLpr1EoLWq+1Qrl75GXBmk
X-Gm-Gg: AZuq6aIC1XUNDwHwTuI8PsVSrXgVZ7by4pOxImpRWR2PBEq/kDI5SRwX5qXdgRFGt0q
	bXFEaCbgDjf5KSjQJHALEEgyvOmNz3ogy8TMLkTVav7r7kCW2C6iscdeHfsdfwXxMOAx9uVZsSI
	8BCXWnAtzKt3s11gy48U9/PpXHKvXW9ky0j83lkGTE2MRVNtdL8oCnnESGhtrbzEiwvHCl7RSrt
	EWelwN4By4ceWqqWzXgj9SIRpJxXgC1q+AHWuq74VK4ESyaxayUYDy7w0In/mVWe4QB0QE0z+8U
	HVpxLaaSUWx8ydgyNyIZodxd2ZLmVCIb/CPjHvrB+FBvSfDZK/koOTUT0uC5wLQRqfhZmsQQPpv
	vX8fbICvDhmU5DqjcxaDtWqEyDvrviLarOUzaZRB7+9P+dW6DoDgSZ3isojXz/Fri73BGN82ov0
	+WQNxZ7GrDEWiO3WR2MzUuBDF6Pj9k0iGTu0AIDdME11lj
X-Received: by 2002:a05:600c:821a:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-48069e95c98mr40755575e9.15.1769540922876;
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:19 +0400
Subject: [PATCH v2 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
MIME-Version: 1.0
Message-Id: <20260127-incremental-for-i2s-dvier-v2-1-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1287;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=zadY22GSPVPhNTUtDV/+6Sluf6seV+Q8lASvyVpCmJ4=;
 b=rcy0EioZSDj08un85FD4cMTF4dOy7DTuSQ+7myJ0yfgsHFL4rCXoEjKKSGdM7eWN8MUM5J+1L
 rSTdu+GC0QwCHnuC5/qCHba9LWd4lsde4UUcAK/xj9+KiVKjYPcIw+f
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_110844_972094_BD7BFBC1 
X-CRM114-Status: GOOD (  10.70  )
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

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
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
