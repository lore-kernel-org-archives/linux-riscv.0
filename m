Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E43A1099B35
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGS2yoihrgD1uNtdOLR+7KmRCJyIH3/g4SFoDEJ/vS0=; b=Obh+NYAPkViqfm
	23nN+8sCKI6IKgUJOtNzpZvv+X7T4F+5mh+7HpDYWIhhGV7piIHPIUF1TF5ATqV3pd/g0rC0yISj5
	iGl5PUkLWE/Oc0+38sDnfMwNlMHAnmubPKAXsRINLMeRfQSVfg9GYolnWFsIMOBrsYn3umVwYi/dy
	FnIJjAmHydyMOGv5zJHrOgBbM77WrNNz10A8SFtMHdZn/5/1BEs5Z588YgsQr8BRRPp441bUonckF
	Nw9g+HiWwT1s/WTI6DNdTuOY2hnClJuK+f/b7kTdGFEmslCQkbhbcBperPvz8jbadNWKM9OqoVg5q
	vKQchWIn7jdhLP81HX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGm-0000000DQWn-0Wq8;
	Fri, 20 Mar 2026 19:12:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGj-0000000DQVd-0IF2
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 19:12:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35bb9070644so631894a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774033944; x=1774638744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzUsZ0V+OsYZzU5hFHvU5ER39DG7821lBv6s9PN+5+U=;
        b=luuijGz8b4omPQIJFfOPg/2pNJVGIcq4a2Axsw3QAupCJJaV85r0NvCQyv65U8Szot
         YNQFVeCkYhhoBJZHPibRU0fhiLAQmVjI2PcPF3TtlWIp244c6cqQCE+Dfj8lEXiDthU9
         Wo3M2snkjR48sXrdHk3ZZul//KQn0PgKkMM03g0G4vjuv9VvoODqCZgdnHh2cKJvToiT
         KtmIebuSDUs+NAdqYoQe0WTzBxAdjLc7RcXsaa4XzEEZhfybjd6gF69dMInRo6uWT9aI
         hYr5A3otpF3rK48DxXK1iBXDQTI1PHdOUXvcVxZzeo+kkJBLEN0DuQ3blzXbsNwA2XxB
         QbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774033944; x=1774638744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GzUsZ0V+OsYZzU5hFHvU5ER39DG7821lBv6s9PN+5+U=;
        b=atqpAFDq17MyEM/hztWyjXo6rUgPRoAefphVj08P70JRO96/U+4NQpxJlPf2YC0tge
         ldsxIfHr+keOigc1/G2e6MDPn792IjvgtSOoeuE+jiA7TwEYGpaFSTeXX6VBk6gX0npO
         6ycLqEdxj3H8sRtpqSUjwt1KZzunt4JG55fJSSjHXJhLZzuwzwGouyGvM+9Pj3oZMOhG
         QtqsFx+Wo1xz24Il5d3AKVY+FqKWmUZJm0WQvl2ojBomMUsuXNoytQL+thzEBbC/a18m
         owoiQQA8brGBoufqke+uvk6os/TZISUbKNyNyRFBrK1Wfsest1Fwg7lAs4iDJfmq5WSc
         Q0Xg==
X-Gm-Message-State: AOJu0YyDLJuKqdLA9HLCBQJXfvTifRS7LpDmc1pOvI2J5cRpKBVoE2AD
	hALyfY0U/tT7Y5zwQt7S6SP+Pm9e8tC6lk6EXNDSOfFzi3R+p6r1D73D
X-Gm-Gg: ATEYQzyomJxPkxMBhSVv5jFgSHGaJ/wXAFZoO56n667BxpD2TvxX1e6qn8kpJC0ToFV
	33RTeGUWkSThmlgID/oI0D3qnZkOj6cBfjli3hMufVWBR8aGtnDMrxU5fvN8AucDfeMCwna6wxf
	W3nkZdOXSRTwQSD+MV9/78oacpXH1b48P+pH7dTUzjCMCsVgeg51QMbSsdwCdGbpwSqFe37bYKi
	0yjfo1UBOW6YqIhty2474KPx31IEwG8BnQbNRuN5wSoZuBBHS580FaZOKs9fyGdhmaKpQxvMXsr
	X1TkY/cjz10EyPxmQ0C5qT14uVZtC6BjGBGDmxQGtX/4+XEKtFWelVN7UkJ9a7cS5bAxe3yKpRq
	YZJtkewdOfwAvAxWnuFTV5ikv+yTHPHyXq2cMvmvrvbur2Vq6km6TYTXFjLg7jH8f7HQPd2l69x
	kUmWpu/7rA8cMoMOxXlpjdcUy8f2SeI8Vpxf+l
X-Received: by 2002:a17:903:38cf:b0:2b0:6961:150a with SMTP id d9443c01a7336-2b0827d7e20mr37519215ad.38.1774033944094;
        Fri, 20 Mar 2026 12:12:24 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083688ca4sm39599915ad.67.2026.03.20.12.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:12:23 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 03:12:10 +0800
Subject: [PATCH 1/2] drm/bridge: th1520-dw-hdmi: Fix error check on
 dw_hdmi_probe() return value
MIME-Version: 1.0
Message-Id: <20260321-th1520-v1-1-ec877197770d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774033935; l=995;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=4F+Ll1PWHhd/QixktSYleAKOUdmCyNteN2mj0AKQq7Y=;
 b=1wKT8Nsz2Paz9DLjSvFMhtNlNWSOreFb8Roupg24Rg5qwt9FTGGanMq1ALok9+x2liB+HzDBH
 13ucLSz6c/ECAxSLCoMI4i+CbOdxMEYfXaNVwZGrBm0CPKJkIRxF64J
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_121225_128448_B036AF40 
X-CRM114-Status: GOOD (  11.11  )
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

The error check after calling dw_hdmi_probe() was incorrectly checking
the struct pointer hdmi instead of the probe result hdmi->dw_hdmi.

Fix this by checking the correct variable.

Fixes: 96f30ee0fb9d ("drm/bridge: add a driver for T-Head TH1520 HDMI controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
index 389eead5f1c4..c9968ec1823c 100644
--- a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
@@ -136,8 +136,8 @@ static int th1520_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->priv_data = hdmi;
 
 	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi))
-		return PTR_ERR(hdmi);
+	if (IS_ERR(hdmi->dw_hdmi))
+		return PTR_ERR(hdmi->dw_hdmi);
 
 	platform_set_drvdata(pdev, hdmi);
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
