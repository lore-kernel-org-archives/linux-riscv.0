Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1763F1099B35
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 19:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quf3IdkQXrlv2EO12vsGlmtCVvWEyMDc024py8Pu5fE=; b=TanCshMhM+vZbU
	WAYcvMQmGxbcqwumnSRZJIfA693CLAPoT1HVeICZO6wjMDBoFUSA+laHPO4MgcYVD+O2dWsNEuSzE
	lI7cR51fDfJ4Q+jytOOyukncZrsZvXWW2bPcFs3vF4Nn2IoxtdNO49q/9Ym6XfrWmeUdD5Ozs/0yV
	O5EryOtc0f45A1oDkR2ITVYJPWuAgqStgLY/Im9W3afk9f4MOs0uaqfrlLyVVA4jjrW2MWOOZ/GAf
	HFYA9rn0o7iLwbBaSCEC4w4IdjthxMjXvrdYQBvWjCX6V0mKzDB+cH/sSA3c1Y5QEcMUTX1cOU4z4
	nixxqy5nxGRznB/K87MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGp-0000000DQYd-1sdm;
	Fri, 20 Mar 2026 19:12:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGn-0000000DQXD-16Vr
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 19:12:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b07069e2efso12630255ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774033948; x=1774638748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux+DVa2N+/JaIwDNhsnggYM4bsW17uE79GBmRoiXmjI=;
        b=RRzXwxgIZuAKP+l7G5WTyxnMjyVFNmsjY+/EnmXj4e0WTbrGq4/0ODljBJlTta3bNj
         8Emsrx67HGgui2wJTbVqj9ninsHiLZYZWEPxRYsDcshNO8cbkqUvlCaaEy9k0vi9SEQX
         Lr6l7GcuzySeQBFoh9tMqY/Lzm6lg/oJV7lp4nzyK7jXmT55UdN/gwyDDQPC05Bsu1Sm
         +6uFb/lgpMtKOmMu7ATQLLaG7TfrtH+pyqzEZmvt+bntlvYFB2As/+kExA9Z4iJBHEv+
         0nE4EHg1yeSpBQjn3WdfgjAcxpzO0lVAbTNjkFigthLpelzOLMcp/aZ4BmtsxjEKobXY
         3qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774033948; x=1774638748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ux+DVa2N+/JaIwDNhsnggYM4bsW17uE79GBmRoiXmjI=;
        b=Loi0CbWnCNucWUKeMOhNi8qrf7FcYekilDeVNH1eMB1ItvIpCfIvhpo/blyYqylTUw
         pgDCmQiybriAE+a/QwLJKYM1h1ykW91mnVF6VXQdxI05Du/vYPlwFycYABaYylQ99bIr
         TYZw3oZSzCfeeTFcZZSXJGLL7jKwreA0e+VsZIhYheeifbmXdvD74OOaCjXbVRXQBra+
         +IaSxpZ8t+uZRMyAmE3jcpsjJpyyglHgRs8WDDCTnervY27SQQXw7mgqyeyAmWGaYoAp
         dv/x5Xwawg53W9qG2Wn8uNYLOIr5d+XEbHIuWHrfCcoPwRPKg1xolDopTEYgIqF9/MHQ
         8Olg==
X-Gm-Message-State: AOJu0YyqAH6ikd8fke3ilF3v7DtJIVR6fJipM/Fpo4rjwqULzuUma43E
	PVebCqLzVFRg9nUpI1hB12r6txFg+yYges3xEezhNMIVhFUCC7sXU3TU
X-Gm-Gg: ATEYQzyt2lSL1QN1/H/QSAkM075rCO31VpYIXewjzGVnlCCTmTUMZzt9JVYSLiL9Yjf
	NAsTzwBjOpCX/KGt+oVDALylxE6kp4OsJGKRJkOBfVQnApTvpEMn33ftOxJcb5tbu6WyJj2amYo
	6Oa+5i5On7g0htplT4IgiEdbukgoq5uqAwNezjvf85M32GBnYiTwMj2f+Y3U6aFaFEqVDf/3W24
	BP31sN4+DRH4mJTToZK3JJivV9CFNGBlIzxQEt3aGnBBciLWv5Oj7K51E9K0DZVVM48nVWxblt4
	Zs19aEFJPRb2B1vnoduDKypK/VGDrIrWqWkiBsNiY2duPO3UAiLx/yVQ2vh84MM5hpY23DON4gF
	VTkyS04jA9k5vkpqJDYeVho++jIyZDH6O52QKZcxZ48i5Ynod/YR4Yim9whhg72Tyc5MPVB6+n5
	dPndSjckcDo2als3ztIcj0vJ+ALz4gPSoj2ffs
X-Received: by 2002:a17:902:ef52:b0:2b0:663f:6b4b with SMTP id d9443c01a7336-2b0827054d4mr34682875ad.18.1774033948205;
        Fri, 20 Mar 2026 12:12:28 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083688ca4sm39599915ad.67.2026.03.20.12.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:12:27 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 03:12:11 +0800
Subject: [PATCH 2/2] drm/bridge: th1520-dw-hdmi: Fix remove() callback
MIME-Version: 1.0
Message-Id: <20260321-th1520-v1-2-ec877197770d@gmail.com>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
In-Reply-To: <20260321-th1520-v1-0-ec877197770d@gmail.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774033935; l=1195;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Iq/IF6LUudYr57iCsECUorrqheDDpz1NtopP1SQaLhI=;
 b=GX+DTp9uRhkW8/vmyR0grrfU+rSZbqh4XWzlbmadXi2TWUSN0llN144L4kkBfk70i1b317S+3
 2XHAcJkfyuMDz9PgvWt7KQzxoWiCgZ+TY3AUqycUY7w+DTZGVesfOAQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_121229_313365_C122416D 
X-CRM114-Status: GOOD (  12.37  )
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

This driver stores struct th1520_hdmi * in platform drvdata, but
th1520_dw_hdmi_remove() was reading it back as struct dw_hdmi *
and passing it to dw_hdmi_remove(), so teardown runs on the wrong
pointer.

Retrieve struct th1520_hdmi * from platform drvdata and pass
hdmi->dw_hdmi to dw_hdmi_remove().

Fixes: 96f30ee0fb9d ("drm/bridge: add a driver for T-Head TH1520 HDMI controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
index c9968ec1823c..6ec9003a8f3f 100644
--- a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
@@ -146,9 +146,9 @@ static int th1520_dw_hdmi_probe(struct platform_device *pdev)
 
 static void th1520_dw_hdmi_remove(struct platform_device *pdev)
 {
-	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+	struct th1520_hdmi *hdmi = platform_get_drvdata(pdev);
 
-	dw_hdmi_remove(hdmi);
+	dw_hdmi_remove(hdmi->dw_hdmi);
 }
 
 static const struct of_device_id th1520_dw_hdmi_of_table[] = {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
