Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3086C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naJanfF80DQUh1chmqRFKKBkZQQIqyi1a3g8c5ph+5A=; b=jjgFR3+xle7ooh
	OEXuja6007LaRwvQcqxL6PO5cGZ1ZLUVoH2LMxrpz71zPvsSRj4e9aAA/p+e3YA2pjQkJ+yl1iNOZ
	rl/fow7UDVKZBw6QYcb0S6gBs/N5gOxk+lTco6J8lCGfkx79An8dUjgCx43JUxZHJZ3KYCcKPwTIi
	iauwf2lNUGcX0833xr2TmXYo+aElVvf5Zlo2pyaMJwzU6X6U4ebFxHfX2Thm+xYFRHIOl5l0dGmGa
	y13zA4f/DIBNEbacxvT8INq1lX51sKIYVI04pfTC+PQtneKJuNQVY4vMJYW/sEPnAz9ugNsQ86fb5
	uHzTL4Y/gHsbmrEVNsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfJ-00000009SxU-2gLA;
	Thu, 13 Feb 2025 02:09:21 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfH-00000009Sw6-42Dh
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 02:09:21 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso7341146d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 18:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412558; x=1740017358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJwmjznjyY0FbBsGwbEfQueE5DfCYZR8yX3zAlCe4RU=;
        b=eKJwJsLR39OC72c0ugkS0qjwfM8ZiMPar/7qOtWdCvJ9mCdUKmPANBmK2HGXYzUKYi
         jWICZaHemNciKQk5UKhCR5THfBFIFfFOq0+OzvremIHc+95kqsWxx1rbslxGRczbx1fB
         ESOX14a07oQdOEjQfLHOPx6MKvv8dEi4JX8FDJqV4SZWcB5Bli93v318ljwKcdw+767N
         YTCOBzq4damwLKIYja5DlN8wfDkTdoPzMNu+Kbw4fxKiCK/86SYzUN5mKGYAk2ycKlcu
         DQSCUfCG/uJ4yOGXqJIqCgC0bWh3xpladWT96e0dMD5hTMdk0Xc+sxSSHThh/cJsVLhk
         8/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412558; x=1740017358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJwmjznjyY0FbBsGwbEfQueE5DfCYZR8yX3zAlCe4RU=;
        b=N+++fve4+QmJhQmKsd3p4BTFj8DLWhC1X5WMlHNIBGscqJyJWFncNizMNkNI/aaTeq
         0BkWHZVrxzJ2iUSfwtmNcnZWDU4DOo5gw8z4NLdo/nO8V8jWeR81hKXM2i8KePbEd5nL
         6LXN5OwJ11uFLiXTiyA4+5RypHUdP9k+ko5lxyfflZRnPZ1gIg6watThIIwoHVqit9gt
         cqrrOwieVuTlYDVtTkQc4t3h2bgK+GGtuChk58kItspkhpRE3i8o2jzrtAA7lzjoJ4xw
         sZLOz9Hiqf/wWpXC78UAhKu6xDhUJb+2G43+M0HmLzI/ClA/tQffvnGyn8OQf2BDQthk
         yVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOh6VKLhGUDJwFARiI4ejAIZYVS9CfbE/77orTLtgYb7HFxhSvQWkqE59+FkBHyTclC+XJolQg5ruiLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOUa9iJ4luuuGz7ycBJyHu8AFjC2k8AbYEeVX2S8SMtoxyJXte
	38mpt9NIIE4ANMvK4Rz1vt1pyAM9zjbRDOFTt8OYGmJjVbFwMu+M
X-Gm-Gg: ASbGncuXfRe2DdZiT0IQDKi6cO4JZJmVIhI6IomdB31tfRPCP8UV5DXyoqhSx7nxDKb
	X3Lsxah0SanuYFS8rpMk2IC+CANcIRaFncUPYwgo3l0oF4QwVGxNMuQrFu6PAWr1Zow2/w4SRYm
	mESMNwnGz7+l+iUXWbSHov4ixWL0vYv3XHa6s6/z4H+XIVmk7unonLgHUM2GIolEvrZMPssTnET
	db32cdJsZGyf+gNU1lC9+sCJj13CEX99TGdSamAHlEPDhL4OgBKUpIC/IoFU5c99a4=
X-Google-Smtp-Source: AGHT+IGmj+oM47tfcJcPNQ8fw1vpHd2JW2ApUYWw/rZfMQyrEUWN3vtTcOqHh/Zum1ZuC2b+S4ButA==
X-Received: by 2002:ad4:5ba8:0:b0:6e4:4484:f358 with SMTP id 6a1803df08f44-6e65c150e61mr36705926d6.33.1739412558648;
        Wed, 12 Feb 2025 18:09:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d7a3caesm2558026d6.54.2025.02.12.18.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:18 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] reset: simple: add support generic reset-simple device
Date: Thu, 13 Feb 2025 10:08:55 +0800
Message-ID: <20250213020900.745551-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180920_004394_A0D05269 
X-CRM114-Status: UNSURE (   9.13  )
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

Add support for generic bit reset device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..a24f8fcc6a06 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -148,6 +148,9 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "reset-simple-high" },
+	{ .compatible = "reset-simple-low",
+		.data = &reset_simple_active_low },
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
