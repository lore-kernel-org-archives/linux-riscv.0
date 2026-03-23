Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911ADEC01B4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWaFX8zzSQTbySdZ4NVCK1VJs65JwzCJPTdGu5JAK5M=; b=MaSoItX5H61m4R
	Fo5wnhewYA8/QwpoLK/6QjpP8A26Y1fOdzwaKj4kYw335kn/vE5WbT52kZS5GQ7ASmcHEiZR86Kax
	D4YkfxYbNMhsfmGVBBsECPHUyn8R765exCps+izUBqhoiygjNKvk7VVokpcTEO5kfx4K3ufA31P8L
	QSz+lsK815syys/g2e8sRVEPVJmiYQA4zOwlQY3uSWDM64UP/jTu5PCsz+Jpw7gXfIsDYT335IizO
	aVoOEqtW1kG23JpW1WPgntellEGOSfCAAFdhUa+zyBWZvP3Ba5+GQ0zqJsaTLXMCUgZnnyFpMt9Ej
	vbRkO0PEJXvMswPFHWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNj-0000000GU1G-0QR6;
	Mon, 23 Mar 2026 10:19:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNg-0000000GU07-32pR
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fb14227cso42326705e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261171; x=1774865971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=eXfpNHs5JGey7nk+wGanrXDMNy5ytX5waQYnUUvReWV57HkqL7Yq5bFPKVkYr0Dbrm
         rXOkpoMykilwL2YmEoKyP7beDhj6GYhiNGgCq1xkBp2YcJKILlvTCNdIhHp3oSBbEzvN
         8+p4Enb7QUIuCmSBkOUTb41svoXa3Umno7IubMZp1vpQ20es/xgYCRcUJxrEq1lP98Qv
         myxBaceTdXcmWc4JnZ4tEU9cizXiSs66S5Z0+/qi4VLBDPQUOgz7O/maWEN/RzmVk2vU
         4JluKIdBepeAEoor9A410oUHzpn7EXpxPkE1LbsHzTl3COVM8vJ81NBIca8BuZJ71LIm
         Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261171; x=1774865971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=Uz1YjsX9TxOklEGwnrmZE04U2HkC1iVa2P4Be/JRsXma0yBBMNK7Y3W8GkH4cz2ECM
         Ap6kl7gN5B+V2wP9gxsxs0dR/mJ4xUyGkIW9QJYrUVJIxwYIkc4w6FBMaGTRGu7ZruIu
         AdJDHGD2LQijxa06+X5uiz8RbQpKe5qatruTyXb1dKfRze7WVgx/4UHJGIx48ZZoMgAM
         4TEt3MPglNpUt2+WNx06eJwXq0EogPtihc6XqEdnFMwvTx0JSICZ/vDFpUkZPRd4V8jd
         mcvhC8/MOeCA5+LFAy56/mLVycpq+ruPkTFZyiNeGZvjAgDdD9n16TkZfPm1GmF46sB3
         /DkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUor4yqWKu6+iifS46FfRA0aC/9I4oaIF9M3VfRzynDTnqp5Xe1Umc/JBP0yfN6SVt1P6p5JlcKE+AZ0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy9+8AaPnYkmAGWTxe03nPvo9Yh/ZRx0LKGkYrLxf+1nabgglW
	mGCdkngDP/MPYA2iOFccY8v2BV7OmgIcOhwmTmKa4ITqvkNHoO/Yz0uc
X-Gm-Gg: ATEYQzzaJimo8v9YdLIb62yKTzi0DecgAyE7gnG2L7wmEQzSvwtOLilblIDqErMUWgS
	c23Y4H4VxnlTPOwFAycrdex3Qb+YXxhoO1bv6+r8f4+ov9nA55YjifIRj17dfrY543Hj9gO/JSs
	9GsRFYOkY9b2QvqSmLolEfkGPN5VojdLnLK6m5enA+Nbat4O2iN3qM+/1AwKKi+XT7gi5LL8AmN
	ryaypEGXHIBDe0SL1R3ks4DXSrJFraTzBbt0NHT3Tnwt4ORNWruGxjMzxPI7XBpJacRBkze2VMh
	7t+EkP2N3kGO1pCmNciYmaGqWi6lQc2arutngsk4cVPGEFnJmM0FNIQl8acaSDE3o1mjVemRGn/
	xiAfzxFBntZ+ppGwvaSfNYUjiHlWANofKHamEj9WnK80l14nnWP2kyzYeLapIbMj5l7Ni8RZW7n
	jN1g7QbszB8vAjZGEXBc8KAzRVH014BbnBqVv+vcK5s4rhThyQdtpaER93JGiprdS3
X-Received: by 2002:a05:600c:474f:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-486feddb659mr165327915e9.14.1774261170709;
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:04 +0100
Subject: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-1-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031932_784033_F689AD8C 
X-CRM114-Status: GOOD (  10.39  )
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
