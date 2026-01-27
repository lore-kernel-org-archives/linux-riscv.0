Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1208DD2FED9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTQGIVR4q6Q6oOblwbpFkWCKuWss8BA/yWaHzxOJZi8=; b=LbojefkDwDrCKy
	EYKDbR4NXIGKNGZUTExHAytf9zrJ6/9pdaay4pfJrF3PHvIywoPWa1XvMUJt6jRYRXg7DfSkDen8t
	LqjyJPQ/t+rfOAxWmZf1Bild2UXImroQM6ibbYvTxutpK7RHSLpTL42DMLnO7IZhja4TerTY+we25
	cmT6Pp4HW7YCRwj5Upgo1twsMEaLGc33wcogOKzL1pMnvB/JbQudD8JAH5RzZNmPxqRxGvYuAbEAd
	8Jl8QoFrs5XKNxLUaopl+K+EJoQuRAgMgfXjGNVdzD7p7MFC533NfJoTUjMh0rV0ShYoNiW/mzIT1
	HtDA00EDMes0QqXeLUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQm-0000000Esz1-29lb;
	Tue, 27 Jan 2026 19:08:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoQi-0000000EsxB-0fo8
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 19:08:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so1078285e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540926; x=1770145726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=b++nqIDgtM9hmf108BNNDlP1C/qj1EsMw7uLSXXxIDtjT75AuGh5VGiav34SOtjl9V
         9s2i7zZbR5f/6JZyQBGdTC1Jd0cpn2Rz0mkBpT8nww2TU3uNMXxuolaUUiPYzwj7waZi
         xiBqelVKzGD6/QoUaWbVbfvoMOrFA29nGglbxejxX6PBA7K3JjvbSvipYJHNsksZW5Ov
         /4kkC1cPOHOETfoGlV8ubyOE/pKmgiZasHaFX2D0KWPrlmSni98d6uzv9Q20ZeooS7ea
         H53/ZcOcK/72Qf8GBKCE1qTm7mm7NUgIp2stIJ4xv6O2t6jYDA4DVKgNcCI++TJlTioo
         NW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540926; x=1770145726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=c4xjO8HyR1+NFexx3wHilf0PJ918FFwErpNqhsYzMoxjscgTBelOR67whfwlosm9cn
         9eWtvr2KlUXZmT/N5MJxy/SVlFnmbLde1HdlP6uv061HXY02OduwYJZXfLnOCWz5LGwP
         SnmapONMm57E+kCuWcOjH2ufelA6CJBS8Ei2hl5wLp6pJ1Qr2kqMfxaH3BPhCwdl4NfY
         tMBOqv2+JJ4VdktBXws1Eg/n0/oHqKcsOxAMrLbH02tLFBt/i51G5AEZ9im5cJS4IUVg
         /ZIqK0Z9IU5HU9jv3BGUX8pYzNEN52OlXuW7EkRioFmqAYadajOjaKO0+YxRwmqcQYsq
         TsXg==
X-Forwarded-Encrypted: i=1; AJvYcCUVBxeEBG8iAF61jC6t8QwNuUDTtWsalSxAjhZ7Tinh4fddAGVqiHUYdHg8bJYNVRnmA6hWLW8NqvunGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYd25c+9hqiZbE7zM3xZpGFuqijqf7TNkDDc5DzVytcl4uABi7
	kLvm2scPhE05FPO/YY44YCrGgsmGr0OgF1sGKPpNYr5T9QbbBV2Q78Cb
X-Gm-Gg: AZuq6aJ0m8o2XxhvNUmfhrCmRzD4PiCU0ZsWztNU+c+1iZKJ6Mt3uT3+lYtZ0HcPU7s
	2jYUdQ39IksTwWWHMWsMG8uRvG3VfQxi3Sd7PBB8AU4EmOD2cttBklf/gvlGPgRfl5egCKZqaSV
	1WiwMmdHX9YXqWnCvBg/6Kq6G/MlNIp3X5IcHtMbxB06EKvGGUHuo8JQRAf/PPIL/UvFklbICGD
	qEr0/97C4VahA9hC2bL00sLQCNl5+HfrfpdY8iJ9ZCrUyoq8dGzbsprTf/w9SY1R0BNoprYdM8L
	HFR8cV7qUPYsjDmQXXpDuHLk65vE06xBet++SRObWfwkcjiXoja0FaS+w60zlvVulrNN0tEc971
	BddX/q3oDljS/cCzgibK3tpDkT9ZbJWbjtBMUqA+IsBdO9da0kIb5yXXeQsEBSn4fCRqTXVyihC
	QqNEsXJ0Wg+2XG+VMfz1JLs93pzC/nTC4TIu8UcDf7cb66
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48069e0fd24mr22092945e9.1.1769540926002;
        Tue, 27 Jan 2026 11:08:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:45 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:20 +0400
Subject: [PATCH v2 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
MIME-Version: 1.0
Message-Id: <20260127-incremental-for-i2s-dvier-v2-2-5f66b841f63d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=/rD5GXHuEV3Sch9Z9gONegfTboapMyzZ1kxLPbu0BxspfEG4J5ZGlb3BJaQZ1f5WUa+G/K3eS
 KFadRcvrmSsDhGovRx87GE3yJ9CT++kOJFN6LW4GVcq35PrmpLbd6BN
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_110848_223742_3C9C70A0 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Restore the empty line that was accidentally removed earlier

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index e4786f087589..9b454261bcfd 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
+
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
