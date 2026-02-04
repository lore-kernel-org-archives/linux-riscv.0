Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08403E9539B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0g4hSn/jthVgaei+D53XoBWyHH5ZvE6h55Mz44aiImM=; b=DdetYQ8h1WaLuJ
	EsBrGxyS4+jKrN9gyDiWdd4oxg3GexeXbCBzuSlOTYsJRmW1Szul4Q0+s+Nr/iC7YUwWOWAp0Oa+h
	SUtVM1ja5HuD0nrykC7FjFGFW8qKINj+vy2QdDauUpY4JeWdkwzFfs4tGhoDTNvvfGdQL22L3zs3R
	Vx0WjATsmfLEnCDV5TwWnh/QHqnURlDEbqLjCqXMCja8NoIvwr1QYWkNy6Gf3csh2JDM2R0C5JL71
	6QeNbU7GXkd1kH3Pt1mN6p1sjp0gx31RcPi1tv86YDS64y6tbILWABaQVEfGVHlazPZPRwTQmDoG7
	c2K6sXY+mwVI0Bcecfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqr-00000008V2N-3a5x;
	Wed, 04 Feb 2026 13:23:25 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqp-00000008V0y-1TgU
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:23:24 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b834e17c3fso837620eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211402; x=1770816202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52QKyIhmM4dHDYapFPsbOIih+RtCQKdTf8CY2ufMs44=;
        b=gm3EivYg/HnPN4q6JqCU192D51E9y3jrkNy873ItYVfdnicbAOeFg2YslPB9tK02TU
         YBEqxl2ytHbhahDYup86vLlTjOcc+OVqA26fbFdqiG0VMDkat86e0DXYFgM3j/A9JyRr
         f48vDjp4OvH5QitbydhyhIMQqKRZ76HqQFMEmR4oHzW2a1gK9kJeSqCMfCxsKOSNBydl
         3Wt2oWdq9qsc1gwqP9bTYeRWS8Mt7KAl+O1+U6JdSqfZTI0w9B7dwrdpKJ7LjjeHe+rp
         2IK2IsVIbOQTy8NFrdxQ9nuBCwDY1W5xDQoFPeXDLbyCj+b9WBNMdA3VEMz6GIWAPPux
         ldSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211402; x=1770816202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52QKyIhmM4dHDYapFPsbOIih+RtCQKdTf8CY2ufMs44=;
        b=E/XRLgzSymlcP+GL5PonFxkKBMSA5B6MSfyCAvsN9aa59wnR0X43dv1UN0n22DrmEp
         nsG3buPUih1aLFFtdQE7MDK8jto/uFksnfcNErP7sh3laSrkkz7dQ0BjOX0+AE04M1aZ
         ZNhe7d6Ro9IXSet84DhF3i8/0QgyVIVJ3rv/S35aUdpyY7fErAQVBBxlMH9ISy5SbLGs
         RNphEjinxac2sFvDPddFY8ggxBLOTkW0h/DyaYN06iI9yl7UhX4974JssAuqiCK9hzuv
         bAnlIJGrARRlXZLJLoVucGr55ynTY9skunQ/s2AXgnaQSFhskZ6TyrISN4N/NGZ+a806
         8SoA==
X-Forwarded-Encrypted: i=1; AJvYcCWnZU80KORRyXwM/nPYKHHDQcV4f20p1u/xI1Jjur0AI9rfDS1QkcQE1yCZQJbMAw1eT2iHVoAgjh4YRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBBAdTFkNBxL2Vw34wQ779m+nPDpwSApGs/EcrlqzxFWI/XHbz
	Px0mbWBzA9qFzeXsb+vPe0R51TPJ2xORsBE2xPvJaDyjouz9PG02h14XVQZHMoONJNI=
X-Gm-Gg: AZuq6aIaERsOGfmE0lP0NIn6wxPGOX3fNrh7nLkbLp8SKi/wmIUMorPnRys6ldU3/SU
	eDB/9igZDXBBiXbfuRP/q9YPcMBgMubs5EhP6YMYOoLbsFkXLpXlMd6LFMLabL4uHESD6Ihk01u
	QvTdzL9/gPXmLpLOFp7r05rJXUZYvyuybdYAkNdbl5Nh6Os79uK75ZZaIIC6ZQieppyvlcSz1wk
	X4QZdvO8kjRW7MYGyAnPn49RcCU685Wl8UrR7Sqm+oL0AeVTM5YGiPJdhS56c+VqY+77aVxo5xQ
	JbpSYb+wFU3d7LF7wBl+LlyEFng3xg7r6pNiNSRnngUQ6Yz7tErAGczzfEJJxsdOCdfTwwBe7k2
	5WiH9IocetoH7rtM4RJIGKfVtRnQHBziIctN/IzVn1sO+uue8w6jyWS4XX7DkMUv/TJoTTJJPCK
	QrYYUZRgPh6M+RCm/PLt9UMv70TSZ/c4s=
X-Received: by 2002:a05:7300:df41:b0:2b8:711:ae4f with SMTP id 5a478bee46e88-2b832876e1fmr1379549eec.9.1770211402261;
        Wed, 04 Feb 2026 05:23:22 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:02 +0800
Subject: [PATCH v3 2/3] regulator: spacemit-p1: Update supply names
MIME-Version: 1.0
Message-Id: <20260204-spacemit-p1-v3-2-a894b3057026@riscstar.com>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
In-Reply-To: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052323_397131_916A60D4 
X-CRM114-Status: GOOD (  11.48  )
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

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

This is an ABI change from the original "vin" and "buck5" supplies.
The P1/PMIC regulator has no consumers in the DTS tree yet. For the two
K1 boards in-tree (BPI-F3 and Jupiter), power settings come from
boot firmware, so a probe failure has minimal impact.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No code change.
    Update the commit message to state ABI change explicitly.
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93..57e6e00a73fa 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
-#define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+#define P1_DLDO1_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+
+#define P1_DLDO2_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),
@@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
 	P1_ALDO_DESC(3),
 	P1_ALDO_DESC(4),
 
-	P1_DLDO_DESC(1),
-	P1_DLDO_DESC(2),
-	P1_DLDO_DESC(3),
-	P1_DLDO_DESC(4),
-	P1_DLDO_DESC(5),
-	P1_DLDO_DESC(6),
-	P1_DLDO_DESC(7),
+	P1_DLDO1_DESC(1),
+	P1_DLDO1_DESC(2),
+	P1_DLDO1_DESC(3),
+	P1_DLDO1_DESC(4),
+	P1_DLDO2_DESC(5),
+	P1_DLDO2_DESC(6),
+	P1_DLDO2_DESC(7),
 };
 
 static int p1_regulator_probe(struct platform_device *pdev)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
