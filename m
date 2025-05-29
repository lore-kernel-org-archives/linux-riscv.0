Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB16C54FB3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ALfPP9ttRgGAilfEMzLGzbcdWlB6K/Qd8p7HDGaP+lo=; b=YzERYaSBy3JCN3
	iyOkflZ3PNhtsdlqIqjS6SksgEcY7cCyQXQEXEGbA2hKRncqVoWQE1Traq56R3LdBOJVbt/z6lEqa
	4lAmKXfaGDZW4cY7cTxHAAQPjPCqs9I4DoKM6xGtDt1UQbSNgLvnjR0gbtAnOTNGIvf4UNdhaLBfZ
	M2lICTA3laKYCziX8e+g6JypnITldIdRjlYqm8Zl3ygi/JF/NIpl8WRtwtOoGxobOtoeP5qtTCJaC
	T/E/BtESSVg6uE8md04DiZJuVFvbCACAj02YSfGdeGPr6rUVESRozEKM2O97ELekBUtQmInyjmpXD
	RLVOOCp166S25H3Ul0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcne-0000000FnHj-0mDa;
	Thu, 29 May 2025 12:55:58 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcHJ-0000000Fioa-1Ej1
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 12:22:34 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6fac7147cb8so57756d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748521351; x=1749126151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=H0b7r3NMax7EN8xVbBuDoXuWbJ3+aL5nRSqFumTR/rdIFVUyuIIg6jI75WHtCA/qyN
         3gh6ZgtciwLrusG3l/7J1wSTF4W51Uz5DtuB4vr2oBgRAW0wKLeM+E95E6/OgPh637e/
         T93iRKGN+7ufdiGTY6nw1Pj7b0lYtnDqzb6pKOjUDnynz9VXZcLfzZKrOYUDXY1AOobY
         nroCaIZVYoshMas8Szke1wgjKuKrS/DQQYMeNMZVA4MQXqA/xyet7s/VR/qTWe9wDxbY
         4Cv93ZVuxxGZd+OFcDU4oK1YoQ1L80+CeG9ENREZuWDnwBqzeVc3B2ojQx8Jdg+VNedP
         572Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521351; x=1749126151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=Aj3jWWZ/XEamlRRlOKi/JqxBP292Ob2k9QumCH2NZgvEpDGyuBp03gQK2kibCS0tE9
         VxlzV5iDe4KvtChDANyQCZs/4km9trJjerw/wW3yUMdBMN65MS8zzBU9vLSb9qLCf8K7
         9y36rVwFJc7f0v/sWGgqre2CA5qHlKO9uQph5VO9JnDeWu3h9hSdimz2w+fU3B2il3UQ
         LMlZvm41rGTy+3ehg6nCTs/xmHfW3s+lRY4oNVT75zy+sGUnkodDoPvrrC/yK4ftpSqt
         tPi6iufuklLBtzO2CJ8gYGDqaaV5jI1icK0pdPA/CoZJTrmmd79BtB5FhO/jnE1fbYF3
         LTzw==
X-Forwarded-Encrypted: i=1; AJvYcCXDaUm+wxq2X1GAG8BYB4EqsQJu5eIWiFrNLckU0BowS0RZ8jO0rVb8BfnxzuKQl/Ta8rxI0VdX3qmLbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlezNETH4lC0/S70IBa2QC1kujNBvoKrcZuwMHwfsNLZocktV5
	gSW33/n91l+K4nXy/xGvJ5PCTGQIILeekQj2LvIeLPNMPHCUB9wr4UHXoMiFDAqQEq8=
X-Gm-Gg: ASbGncvn3ot8QYjIZ1jHfklIT+Mth1b+Sw6bVk4uYomZ7ifIRcHurXCV8CMHqeQxyb5
	rAsNCLmJkyw8FbyEO1csiQG51XVZswQPy3fp/2YipmFop1ew6dnY9T8lFGZXhaakyBcic1Y1Gkq
	D5enHIWsQSx9mczghN6rKSQmaVGZVlut2SN3gGfK4xgFvRqLy8Sf87ae1QacLItvTt/HA7BCYzq
	wxo/Y0/25x34el5kz7YcorAfnUYsZ5SSMFqiLMgYxfCDz6D9sUYgbPM6UZuZoXZKbl/d6b1R+xX
	gEBTA4K6yxM1yH429f4L4zjivvItlnv8gWx2g9nUc2Lgo6lxac38SPzffttVJJkHnneLGWDCp1B
	7oOsOGdEySVuSRztsMr294FR1
X-Google-Smtp-Source: AGHT+IGKJiOHPciyv3QtiOSyy/RZt9nsdwc7fAQpB3gb8J6aM4q7mvFoREGf65Wv1z/Aaq14437gYA==
X-Received: by 2002:a05:6214:212e:b0:6fa:c44f:2ae6 with SMTP id 6a1803df08f44-6fac44f2d96mr79427466d6.38.1748521351418;
        Thu, 29 May 2025 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5bd30sm8814346d6.67.2025.05.29.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:22:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 29 May 2025 07:22:26 -0500
Message-ID: <20250529122227.1921611-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_052233_595895_8442DD20 
X-CRM114-Status: GOOD (  15.39  )
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

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
