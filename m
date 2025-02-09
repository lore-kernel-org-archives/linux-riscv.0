Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5653C021A2
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+kjy5cj2rUqpFwWxF3zDiAAl7jGork6AoLgpkBnU48=; b=SYvnf65DFDZac5
	W9o4BPFTOTWm0EzMrRIM8Ov+6TWFiaIBbJrbOh4SLNYRwpsoOZBGb5xetWBBKOuWJzILV3WEs8MGO
	aL3PV4tOl+CVkUso7KQ/tdy02GGwgf2ys8fXVgJmLTtl+g5g4jIV7UCmkn2cM1aZhAZntpMAN4CF8
	DpHdwGU6lexOPvraYtfJab2iLVtRuPzuPjqZ8XfjNuYYLOSYNYRWZ/n+Tt+U2CTepYN8Xg+J2sLhz
	2Ik3YjuuJzGpVsw7njjox9f14TnobMSyBO1Qf4aoiaB0svjYrM/h22QqKH80dHPcPW5CNVTWPAot2
	2TCxZnd0RhbqKq9ZAzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cr-0000000Esrv-0zER;
	Sun, 09 Feb 2025 12:41:29 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Rk-0000000EqyS-1iOk
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:30:01 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b8618be68bso346964185a.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104199; x=1739708999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYbWxCYZA5WaHiuw8zocuQEfssF69DUt56KBjVWUWgU=;
        b=Jqv4pk0rMIXO8y1s6s64uGdd/XVGIqdvT3w9engAprioWJwEA8sKHOjC+S0gWTy6zx
         aIM0oA42aVhZV2C/G5uSh47BVRJbRBceUPXm+BPta0L2Nb+QPN0lv16qO4JpA/t8N2kd
         N48Lz4NMHYxS/nSPSzRom5jlS3gPGpNZXryKft7WLrrMGVJvLFKuGn9499Q5R0dJUeoy
         CYQG7F86lzXYaia5JpxmqMnvtbYqKAYHQWwHn1MCiOKNevDVTk5d3eoYgvr55BcC6Ast
         3z8K5zm645NdBEdskMSTu7S/26rMcEYiUHWVQEGgun1YJFgUymiJeK2syKDB5YN3hiEQ
         Qxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104199; x=1739708999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbWxCYZA5WaHiuw8zocuQEfssF69DUt56KBjVWUWgU=;
        b=WCCqHJjmp3kB0TO9um/NZK7kEItlE6bdcMtaF0zWhWxWZNPAzK+qB/i8KaKGof8pZ8
         iiJG7x2mCQMe7EUTgcaMaLpA98qGPRxOMhWxZRKZF0ICGMCAU/c0XGuvqapqZpZCHhnC
         RbTVY3vaXdYFzptDyjqqJ832qQ72miiakdbZrv1wFEpdz5wy95LpeZeopHjB/rm5tFwN
         /JhoImaaPGVPP4byGo/N3m8u9upRFNpt+nWqk2ovNAxn4hdx8W+igxAgdV+nPt/CSJ9f
         u1RjHvago1Ss1sW7sYLAGUcNwuIjlaNnkLZCyi0yTq6/fWUUkDZMb76o8Ri2UVr7A6Xm
         pP3g==
X-Forwarded-Encrypted: i=1; AJvYcCULTzY1b/OqNpna2Ng83ycKezd+CysLMuwDPp6+5XSvINh7l0rkMuIRqfSOckR9cXomy9FdBulaWqDJLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFZUmo3lA7GQ62fmln3k4xQr55swm8xDRZiUGqFnSbqU6hqDU
	DfxoI/wFJQcKJdGz/YL2PmHLM5prFYoROQU27PWEwuhgr0YsaYAs
X-Gm-Gg: ASbGncuZ9MikKPw6Vkp76w80wwOf3GLxr6VoE6nVif3Z+PgOc71a77tk8cyKqgwsC47
	xt+sbUx/Z9y1GDG6l3Z1vQ6/X87+Ciwg5hwzOjrKX4xxEnoh6h0nwU/mWxK/N+R0RoGmlyFErwl
	k09jlQUxLZ3T1ubVnoutYgZQUd6/aMquMSm0Y5xBaLFbbQHNAKU8bQeQkJ2++9PKlZEA5psWSPv
	ijdDrNuKQnzVjbxcx84RqLb9If55Umms+41Yt14rZFH7ZhktiJKSl7gWiRBfdrFTWk=
X-Google-Smtp-Source: AGHT+IF7/UiOHBHWEIdTmUIeNwhHQwhT5jPl13Wc38VigifCku77zNqoVMizXLccpIUuEFaQ6LNRYg==
X-Received: by 2002:a05:620a:4d98:b0:7c0:5c74:57b7 with SMTP id af79cd13be357-7c05c745a41mr99264185a.27.1739104199557;
        Sun, 09 Feb 2025 04:29:59 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e45df55744sm3134736d6.30.2025.02.09.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Date: Sun,  9 Feb 2025 20:29:33 +0800
Message-ID: <20250209122936.2338821-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_043000_483593_E055A5DA 
X-CRM114-Status: UNSURE (   9.94  )
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

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
