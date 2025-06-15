Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0045C71135
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 23:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y18NMYJFBw+VA6Z7fzx6AL/j2PFCinNUTYNkuzUD7FY=; b=C2l4H8mQvD++9k
	8gxlver4YJc3HxLUQiibkYYvgfsPFSXrQ4rZBDqW278/XtdoIJWXTBaFJrW3e4+pzdRMT45YR9Mob
	UswziOWcVCzKlqDDuNSHJg+tYHTPwKLwdb7A/8mxZq2kb719aV0zXeRFNL0Ito0u5sNBJc8BJ6Jua
	e4sL4A9bK/NcEHv1lyWu2D163oVlHsFJrS/0SGhk92EswZG3qTfjcrxukpXgV1mH/0L7EI/GkGn+L
	FKrlYKuF6SJq6yfXiWKlBjU9t1PZPKVdlCjopP8VMYlXFLfh+HYC5jqEzonY1uJ1+JDwHFKW/+GgY
	YiqsRUWuNm2cxAeZSrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQx6N-00000002x3c-3pmU;
	Sun, 15 Jun 2025 23:49:27 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQx6K-00000002x3D-30Qd
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 23:49:25 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7111d02c777so31214277b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750031363; x=1750636163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG9HUyM6bW1tFji2hu6a2hM7CvhozNYb72MSFTw02W4=;
        b=m2vTneTRjoGFf2kF7F0Qlz5OYzEKI/ESfHHgMV82YNhjAMOmDiydMyV34fAuhrTVOb
         8NtSCLfUtUXxpLtCY8PcXa+ooylIIg6BBLaLt1ynV1EeYB9k8voP41qi1BT0L3bQ5rKv
         hg85dYzUDqqkcPBcCS6O1JGdWN+wsNke6ZSboJJI5W55WP4GLDl6ZZJayQfo6Uiajetx
         p3cXkW87gi21M4fM4mhwG/7NRw8eqkiCv24Xz1wGyLjtJmcWFHJFX/k9QRkrxMdY6w4e
         vJVx1qvnhVlLb4DkZpDAcTeKB22/fgrE0obq/pxnkxXEwcAyDa1PY3uuhD5kt+VQv9DK
         B96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750031363; x=1750636163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG9HUyM6bW1tFji2hu6a2hM7CvhozNYb72MSFTw02W4=;
        b=ekVrY9ooHq6V8ej/lm4aZRwDtIevCGjBTajH7D1e0wReWKeOoonZqliqceugqFwKiW
         hykhFSeAFXjhxLjq9EMQzCmfbkuOil2e6R3n1g/fUrVIZ0GR8GdeQANQ11C10E/wKim7
         cjIBOAi3cgZrc1ps/wwAvaHdWzvJdRX56LADtaWtE68tvzzEXTs7BAx2XTVXY5ztD1VH
         Ak5OTIhLaXW9k88sq3BkiCQbe0LVMagW42RuhosJ7fF+fUKmcul+RhG1I6v5qLtygATx
         zb2aYLn9q7T9gi8r9DcUYow5NJ15fvfnrQ8cUCwQuYNwvrdPXie8ZeaeY51PkvJLiZeh
         7L8w==
X-Forwarded-Encrypted: i=1; AJvYcCWOnvxwL9oZtHRLm2q7W1xz6eDbmn4iJc9PYT1Pmml988Kk8QwrA0csu2rODbUkmaDzaUE3m40L9Q+zbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzZceCU1j85xIupo4AFFUfPwR4HwxfbZamSqfKvqSq8e2NimQb
	DsTT5w1367Rnx4tPBwRLefWfuTrnC+LExOapF/Qk/2SW/n8RXPfxlufx
X-Gm-Gg: ASbGncuLzHtjPBmOGEiXiqIE6GM/cbSMr7qQXreUDO4LGEtvxws4gI63i/pVi+4f5YA
	sRZX4aH1tFkVM8SFL5CsPmlVzbjh1xyXdXUV4h3jope0bVyO9rozqqUx68fOCGmPwgfVWlNBAut
	XjQEb/j7L6yXhJGAtuKMOLVjnoN3Y5/Mhp1cbc3QPi1ZhVZ3oj8PBBi193XommbISppJQuhih6L
	ec/T8Li2A9SnUBIuKSycZ5C65FEcVaD1yT6NRVw1DTiX8F1JGQDF1iFKgkCLkVPVWn7EFqy7New
	ZqQLUCqU04IR0D4Ewci93mn2+bos5pap+jKnIXYDq+bncdc22LMATQnX2+d4kv3QYHcipYIhr1Q
	Z
X-Google-Smtp-Source: AGHT+IHXglmGtVcHuPiRpWw41+NQ5ucgQ2jLPsoEFv34seFMTXSXLhbF2JBJp5LIoDqgsY2+4f1BPg==
X-Received: by 2002:a05:690c:7481:b0:70c:a5c2:cef8 with SMTP id 00721157ae682-7117542acd4mr106912707b3.19.1750031363289;
        Sun, 15 Jun 2025 16:49:23 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7118ab6aa0esm3416187b3.11.2025.06.15.16.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:49:23 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: conor.dooley@microchip.com
Cc: alexguo1023@gmail.com,
	daire.mcnamara@microchip.com,
	andi.shyti@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: busses: Fix out-of-bounds bug in mchp_corei2c_smbus_xfer
Date: Sun, 15 Jun 2025 19:49:19 -0400
Message-Id: <20250615234919.525431-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_164924_752787_0F618073 
X-CRM114-Status: UNSURE (   9.27  )
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

The data->block[0] variable comes from user. Without proper check,
the variable may be very large to cause an out-of-bounds bug.

Fix this bug by checking the value of data->block[0] first.

Similar commit:
1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
ismt_access()")
2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
bug in xgene_slimpro_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722..a79d4d327f20 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -492,6 +492,8 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 		if (read_write == I2C_SMBUS_WRITE) {
 			int data_len;
 
+			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
 			data_len = data->block[0];
 			msgs[CORE_I2C_SMBUS_MSG_WR].len = data_len + 2;
 			for (int i = 0; i <= data_len; i++)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
