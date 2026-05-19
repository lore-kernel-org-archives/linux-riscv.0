Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C954ECD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwD0AveVvMxFTF77XVKgHYML8KVcuwRKCSqvBrAagTw=; b=b41ftUVLsgU1ci
	+sS+yOR7s+KLQmFqGsuQu0Ix9NQOoIUuS/pOHmSWfHMDClNjUO6O9Ynztaof/9+y4xVUFDhq7VuJ3
	h3smSnoe5p8Z9l+FVGd82GT+EQIeTNo1mLvEc5pQ2BHz7yiAuT6NpPOc0LjYZcTrgriFwpf7o1O/v
	LiAo2Q+EvoXuPjM1L7mzRzohxGhptoedmZFc5qRwh4GYbz3D6AtAemgLrJzdud2XcNH+j2YDxnw/x
	5+7CW8U2Y65r7fzd4lDXrTBl576729nJFoBCVyAsSxXXLGck/8mUYEeDDbwEVUzMOkZfekVy3ww2+
	4W6/NKsumnMIw0qMwrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlU-00000000IdC-1Lei;
	Tue, 19 May 2026 06:17:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlS-00000000Ibz-08OG
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:17:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-835c98b659eso2721293b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171433; x=1779776233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=GKLK+xeFXib1xTzP6b+uG2K1NeT/xXXkzSFOVkwm584yGaGXY2P/NqprYVqi72JXch
         g9LydzPmGyMCKHBLq0vvycPICQJS9alUDVSOGA9YoGuwKVRwEhplnDcrepqAgdDG9DCP
         rhFi1Qcz/SOdmaCsTfQhixFIOASR3BjUhJ373K9pGGZazRE3HkYePQs/uBv8AIsbqNRv
         uSEbhStC33zM5i0QZcwg/zXAOe7hl2bEh2scV+HdJ47FALMR1HVesAIZ4QdW1wyx5oSg
         EtIegqpMBjgiFkL1ZREpoynhpksDhHNYrRIQEggnMt+mHlFnSOKtu6758wcEawsvpJ7U
         zttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171433; x=1779776233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=DDqAfqjCmVeSx5Snu3gDu0b9SiVpY7D/2OcJ2ec8cTWrYLD312wUqNzQ3SljrB1tCl
         5+V10LpIfudM1oFZ7FPgcXN8OV8c8IR50XLy5pFjmIWWhB960XLmuxnwWcS7ROKBJMBt
         7TmcYqs/Em3xv2XO6U4KLr1jl6FlXtpC1kezVnS6i/d3XmWdH83aTZF5sb1lGsP1J9iE
         grZYjeJ2HQR1/BpGue+tmeMSieZw8EnOpZG4sgQCywhyL5QP8FdQ3eaMKP93vVlVUmmy
         WViKTwijEZtJZgNRYT+NVbg3OrDn/z0CKuQYp4WY+boH7JVMyr2l+6Ivyn/oeTFAMN1F
         w6IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N6Al9UxZ+WIDaNGoXVIO//VEPEAT+45mhjxlzrX64tWCKPIeHXo8LC4/E0WuQKQmWIoQV8Aoe5lMO9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YznLLCnV2ubAVxpGBCLooU5Ug6FXscjTjAo27Z/iAAQyvmWnrmN
	wlCyfuMAlwIXoUQYabkwxeiOBB7G/yg4Mz0iWeNOlWOt8NU3hrb3SpBz
X-Gm-Gg: Acq92OGATj+/scVvbxRHKCRdYRKxjNYccwFy/5T4fQT0YbG0IT2Y45GzRHahq/jFpPh
	Oep2+yKP1pKqksxJVjPjkUuk/iGwzZHVLMi329qn7Li2KZp5RSowZZy7UXMjVHVWdzbj3ulXAKL
	Mtl6aw0tMJNElND5h9ssbgNiVlnL00XgR5c2XL1ko9trNkMSsKkClxV8PEeYCsd6yj781tVgfzx
	wOcbbZk87C3lUonmOt2ueCmcamO2swhjj5EiCyZkz8HoOZpoET6XUr/rbdGWpyR/5BQo/+JKPz+
	vyJYA3wqXDAbMYATUxaJkdiIPkNjVNOG4svr6BbOHBOXkoCgf/8x+MynvUJkiBkpnHclMpXjxN0
	KzG4vusxFwH9u22B1KgzTpDQcEbMfccW/w6Vsg5mVakvG/P1M2/gQ4NkltLgnk7SY2w66SAnh3u
	qQ+a3BYnU3Pos4PA+Zl2FH8cyHYx9T5w==
X-Received: by 2002:a05:6a00:1797:b0:835:5aa3:2dab with SMTP id d2e1a72fcca58-83f33c333f4mr18789859b3a.6.1779171433260;
        Mon, 18 May 2026 23:17:13 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:12 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:56 +0800
Subject: [PATCH 2/3] spi: fsl-qspi: add SpacemiT K3 support
MIME-Version: 1.0
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-2-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=QQ5srJ1k52NpjI+Q3HaLSa9pVnjXdE8OZht6hpCEbfA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABXIRd9mve9a3LQBUJIUGDCj75EfmGr6SWgm
 EgLvgHfmoaJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVwAKCRDN9pw2gLgN
 2B0UEACbVrBMVl9AKoDlOthIdXOqinDtkvcCtGfWilREm6uKD0VHDaDqUbYqUyyngN2LzVqqsbM
 4fPTAtLTqOVySq3qbYFX3li10q48NOGWn5QFQ5v+JNkNd/Fe2l8mLhiSiKRtYG4M34VtWUBChoL
 L4FVnsJ7mLlU5zChZFZYySvPDRsgheMHCJpL1MUvfnB3Ln3iitWB2cyhV1Ir1LHYUnALTrVSzIU
 X7a/fAWMFmGN3z3Oiow1a11VMmZPFgW3jtrXMavZ3hVCYbUtnpZkwuYRUAReJqNEdFfm4m2WOYe
 +8PnK2BUOn2U7pnF4I8qnlcAqU2h1xxUGSXXywuRLuPigKDnpTAmhYwhtZqkpJTt4UDNkMbt57j
 JwzUhz1F16xy8nm2mHzgB2folx/0lKSpcxEz9VkjmixyFn6WA/SAUzBCQnK84kXdhFuJxavaN0v
 YeIJ9Fms027WtDd8alyE6tnGz5Nue//wz9sXiIcd9dbi/Y3vA6y5gMtXVsQ80hTZ9XkfEcm1n0S
 orR0nudtNEWioux2TH/BmzcDbRE/rxyUAzeC5Y6Be484DxyHtGdNjw1RxFS4WKD4ZJs8PaHivbf
 B0OcC9+Y6MuCpmZjh0N8Cb22uSIcdI9nfNP5iPdRJNBPgeWp0uaweU83FV4ew/fE7d6tYYYY267
 UwbX6qasCIKqbwQ==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231714_081666_C14AA889 
X-CRM114-Status: GOOD (  10.88  )
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

K3 uses the FSL QSPI controller with the same programming model as the
existing SpacemiT integration, but has its own compatible string.

Add the match entry so DTs using the K3 compatible bind to the driver.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 drivers/spi/spi-fsl-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 57358851029b..bb94fae32609 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -1015,6 +1015,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
 	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
+	{ .compatible = "spacemit,k3-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
