Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B3C369BA
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSnb0c8HOPgavPN0vXnSrZZM3pLmkMbxEx65efKZvQU=; b=fq7XnVm2hmBCIQ
	hCqDCC8eASSE9pg58957nB1nhyUV8+POvEsWDwVhSjg3iSuTBqblTfGDlkKmGuWaEZm+N/ISI1bom
	CSDNgyGzl0zJYXO25up7/Ll9ZStTD4ZlsRFB3rkiYSJUjIBxUBDJAi6KQU4CauK/HzQwB6amMQKZ7
	Z48/M0VRnq1ZLf4PGh0JiEZgAasyHBF9LmwpEn1mWZX7LAqw8hiBptciITkKjfTcZdvdiTFPnWmZi
	qDndpFXW9G1qlnyyRKveD5GoIk0n2ruTAG3jTnFvVNV1IfTVMsHDrJZAD5gJvY6SSADYrYRsC4Dt2
	mjQuXJ+NebQTxaPDLNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN2-00000003JXt-0oaf;
	Mon, 14 Apr 2025 19:21:28 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJA-00000003HoT-325w
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:17:29 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e15dc801aso382824339f.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658247; x=1745263047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=ENLcl8Rnx1eExr2nxdNNZOi9CI9i8fp5Em8ss5lvY4KNLaVDyYINwUktQVfNV0wf7R
         qqdoOWGWM347yYbJXPSXR7wtpQJEgMnp3D6TJlV6tF+TQ8v8YuprRx/HvtR1ED3bbpbf
         XzZlFVSipINkntyohCbaNmM2T4k4Mnh4xKsX42kA9bPyePaZ8SFjwR5m1l61q5fSxwZa
         wbUJaQlAIZBFssp5VrtuAlk5NiM9tlqn/FcXR8GQEy2oMl01jpYRfqMTUd1FU/fABdL1
         bZt/ETtymJftAMEYqY4aHE0eGuT/q1pQLnRARHsPUjKIKW5r5h/PLsho3geAEUygkrcS
         zULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658247; x=1745263047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=UPndOS0QAp/hmi3VMuDF5XB1OHlhvSVqqPqfRZtkpiosjQcR/gYKafrTtk20P0/xho
         ExungGzRnNg4kU8TgzRquqRoODt2RI20YCYfvTRFZ8uP6O9qOI8UKx+1Vz3dWnqihKT7
         DEQmMYlhylBRTdaKGfM12XQDs7ls253otXOlUCTNHOJV6JGz2df/VLy76hY//xiX66Xw
         BeqGrs/dki+zWVKJKCMYHFlOUUBaodflfY5P71NU6F6wuZRPsDiZeXnp36VskRpSqRy4
         P1Lo50N6zlCT5K5JChRPBjH2eSqsalHfAEFzfJ/QUz2EvDbDT2pnZG8KcKwZMhPSl+/5
         Sucg==
X-Forwarded-Encrypted: i=1; AJvYcCWhjAUQKS6Qdp5GGL0ltmvO84JYIALZmqV2E53/IDTW6s08szS2Uu/A+so34xw854HfK8JRkewMNiAXdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10kKqWJ1bryNg7BoA1Hlq6TVL8mQEWpqoMzyAIIUNsJ9R06Xb
	papAVBUlUQz+8sfXO+04k0Y538IlQ6QrJk7eb8Mgzm7vB2zT9VFlrGGdfuPCwV0=
X-Gm-Gg: ASbGncvIGv8WGl5lmjhwTi+AkDTY6qcRUo1j6jrwxvi2qEsg0x+qjxRQMg7BhPdM9Tr
	aejPEujlSYHCxe4AaxPevFOW7ba5jogz+d0Ccq0KNqxBqQT4NkuCX3hlUezHJxuPmjMkBoYk1R0
	vTnMyULcnO7ZYmeo2PCKXFXSqNZbu2YG4l36gq0FOBPrkEVSUjBsJMBnH/gb9t+uq4GLlmcCoPe
	eB6n+ftDwkdv19w6Rp5lCWbJPe3bwNCNqOHf2zyrrcWVttol4B+JiRCPHbtdCU2mZbI7ikorW2w
	q0TcMwo4jOOiKjgzIaV19XrYMKKLR9Pu6ZRsN5GD9kLB4eyzshyQkm0xcqjc6tAdhwC1wLLNvP8
	7+U4IPnDHCnXzVA==
X-Google-Smtp-Source: AGHT+IHJnhTbYGz+3fsC47NWjJwKIj8trSko9MC7l40QBwUPgSKgLh4fWO2GzddHNuwBXhAUnso6EQ==
X-Received: by 2002:a05:6e02:1945:b0:3d4:2306:6d6 with SMTP id e9e14a558f8ab-3d7ec27bd0cmr159074725ab.21.1744658247528;
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] clk: spacemit: make clocks optional
Date: Mon, 14 Apr 2025 14:17:12 -0500
Message-ID: <20250414191715.2264758-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_121728_759220_0267448F 
X-CRM114-Status: GOOD (  11.74  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 09f101a52b1af..7494c97c3c7ec 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
