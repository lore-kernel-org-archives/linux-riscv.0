Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85CC4829D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRhsFwLGtKSGF5T8qsaKW2eHDNaQsjFZiaRT9dFu7N8=; b=C3tnAO81gRV5g5
	ATVtoxLnl5G/P6t3pfl/9LdseQxA/0rtAUmp6lOrRe2i5fHlz816p3hDBYs+Ya4swKLaIIR/4FwbW
	CajqwYMtGUnRLx5enkPdrOiR/iD4AyHY/wiq3jObzSLwb+kyvPGP6/I696htymjIUXApSpwBIYyjU
	BQZOkqEM8mVkZY2AJJiRofMIZtT/ZZfGQUjzIKQgrt9TkatE/U7L2B9XmnWn13h5wDCCSiqfI43JG
	uexMazWqp75abAJUnuDTVUo5E+IBJ7ZqgTBGu7DBiR0JadOorONby3w3oXdbIKqQGJFZevWbgW+9O
	tZsjjW9v3dIDGbkFckgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l1-0000000DlXs-1jo0;
	Thu, 08 Feb 2024 12:43:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3ky-0000000DlVZ-1zsA
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:43:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41047386c8dso2363215e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396234; x=1708001034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVbMwB0TiglM9Jy2bve9nHK/i2B3Um4Ecj9XE9vae54=;
        b=ScVgyrjnINqoTKo742MRLH69GLX+ttAqaJsgkJp4hRQCbrtkI66PEQGMq5mNE82YMG
         YNOSs4PZLP20Zj5ciqu7KM47eB0VVadcvHIXA0hOS+z8hbZBBrZHlf0jLJYtkMfXKwVY
         mTi0HUdb7uN32H3WbML6QeifWz72KxSnj8BAI70yCLMZ1BzKdfhXN6NZ4XJXPmJZWfw7
         dgBmB4Z224cul319jERfSQP5PyJcAVrv4zMxQ5H5p9K0cV5gB9bGTzNu/JTvf0xyHpp/
         BYVWS9iw3aCPlk/gsMhkMOVhpIXyGsb+sJwun259VoggDMORUHd1PQIoblWtlhqs3Ckq
         bAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396234; x=1708001034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVbMwB0TiglM9Jy2bve9nHK/i2B3Um4Ecj9XE9vae54=;
        b=u8KDxA0HXAzXJuxeT+Ms+7GfdhNSp6EKjQ81cbSEKfaOeWywdHwXnumS0mAICA65y6
         7JNVwykhwfXqtiivDV6onNKNE3s3gqqudanFgyZe61aPjv+scPbZ4/vQpUz3OAMN5UmS
         sfpvikIi2kK0aQGytSsN/kzD788/QVfg5d///lleKYwh6UajCRcZXOBpCCkbeRSZ9o/3
         ilVAdzTPaRJPBa8QZQCBCXE6uJ8oac2Fx+DxZv0AO2epyI6sHOyXvn5kX5k3BKJisxeB
         YDQd7tMUEFfZ1iIxvIeff2MGrM6kYtpjnZYCMJ8smkvO80hXdL0IoHFam0RHSAeiKU9p
         DiBw==
X-Gm-Message-State: AOJu0YzDUGv1ddxtMVtdtn73ySLgOqSHZEVSCTF0xVNrX0Hc6SnQVZTu
	g87ekxQeJ6qYiRIziNFHzJuSqb1qjO2TAdxPu2y4cS9yWirrjJS/MNTpgv4bReA=
X-Google-Smtp-Source: AGHT+IFGzF9o2pTF9T3Gci4TSPWcIsOUNfNbwJnaBk6HW7gCXyCkEcJabWF2d2a4zsvkUeM6h7+Pow==
X-Received: by 2002:a05:600c:1e1d:b0:40f:f4b2:b26 with SMTP id ay29-20020a05600c1e1d00b0040ff4b20b26mr5738131wmb.25.1707396233978;
        Thu, 08 Feb 2024 04:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+k3ak3Q1EAZ44zAFQPvAThcwM466bhXPNIxXdC0k+54Ou7Zc12txWb58P6bsgdd6OT/w183dgapwgULEVG/ja7p/6VXKOKpT+MtV6ONpsgZU22nzt5NFnpcivsGxTLBsffy2XBOkR6aygjtY2sYYajYX570vNa6itMviKmUW3M5dIhgxqAheRT4dzyGXIksavPo2IdYe+20QSO946qX3hna55YZvGE5mRX2dO+yzE+EEcZBUJPUY25g6hTXPYi9ZwW+nqXLtFXFhjczn0qcibAomrERJzAJ9Bd2PYioQ7Rjs8wywIlbk4UxTI2V0l40yeWyyKcrZwtn2yN1u8icvnREZZEt+tIcHVRX+DMADriAAGj8+htO/QbKMRtYapriyn2R9RfS25WNfbCk6024l4bftl0+DZ+rTGhZ8w7kuA64+GGvLU18c2NV2HIOeYW+Ki68P7icEAi5t2b1tk7nMqJKKohxeJOvpJWEbDkt+aXWJNYXAHajWum7ELpdGlfL76g0x6l1a8oUVR+d7xN13hVXNOI8m6pEBxETYCVGNGYRJ3oBo/WrzYMdk9niAjtvc=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:53 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
Date: Thu,  8 Feb 2024 14:42:48 +0200
Message-Id: <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044356_547270_04D7B1BE 
X-CRM114-Status: UNSURE (   8.14  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add always-on power domain ID for RZ/V2M (R9A09G011) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a09g011-cpg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/r9a09g011-cpg.h b/include/dt-bindings/clock/r9a09g011-cpg.h
index 41dd585d7115..250499faf049 100644
--- a/include/dt-bindings/clock/r9a09g011-cpg.h
+++ b/include/dt-bindings/clock/r9a09g011-cpg.h
@@ -349,4 +349,7 @@
 #define R9A09G011_DDI_RESET		93
 #define R9A09G011_DDI_RESETN_APB	94
 
+/* Power domain IDs. */
+#define R9A09G011_PD_ALWAYS_ON		0
+
 #endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
