Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87705C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4muacswdo2qtVS57o2uLJgRnPS17t7RrpL4YQpa7H7k=; b=4XxuOKgHAQ7qb0
	mjA4Sn+9nmngVvszHo/M4X2hI93YSKWU30cHsgUIyEYzdvXEz28P/CHZzgAyLS5q6VTqsLsrUB/GN
	+WCJNjPfE/8goxA01hTxCG6ckSGYowg9hcV8V7QNEa84m7MG9Y6e6WaO4eaTJM67HSynhApYd4Vjc
	Njz5ORQN5mGk3wdoE8Kbl9KzAI32PJs9BfqrOhNpV7y/5jjIjDNGk9BezRF3QaGDAvhNmlJhENvFY
	anzK4FjAXCcRj0QV9ffAZ9EjvG0jmFOVExksjOMTpUePAnVJ6dvpfBV1KGQYHmwx8GB7Ee+HPm4R4
	cAQbYSjTujd/oHdkQsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1wa-00000004Rrt-2vvd;
	Tue, 08 Jul 2025 06:36:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1qs-00000004RF7-1nXZ;
	Tue, 08 Jul 2025 06:30:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-748f5a4a423so2284482b3a.1;
        Mon, 07 Jul 2025 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956249; x=1752561049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTSaPd2KsxbQLmtDO+kQIyiudpoUlJNATnX1VXPLxSg=;
        b=IJCB3wnknusKGoDcfMw4S2Gm5Q1cvDLAiaQEIUhaEFS+I1ufGdUptLK5UigvNnNnxq
         pRFzch5+VrthAWByq0rBB9Hm2fjJRaBUpJp1u8hCheHtfxSXfq1LW4ek3ANZCxm1Fo2U
         gBArj37r9XkbYiGU+oiz22aOwHpcJP+2a6vJyqIOFDRg9zeTiy5nomhyNtE64HnHW9cr
         vWLK1zbznmBEL4Tgf0Yr7IgwaRjYwMgOgQms0ePzLehXMW2V5B2GCKXiL/2qxt/kUWsT
         d8brlmtwijyzWKX3pc+O/eNdgGIchdTJN2iTmHIVlbsI/fYsMPk6q4UFl5LbFc+JEFix
         coyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956249; x=1752561049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTSaPd2KsxbQLmtDO+kQIyiudpoUlJNATnX1VXPLxSg=;
        b=sP23f/jj3CJaJ7xtYc79oelv/fWsbwbpTDDPn5bmdfZsAJ2BBEymLxyHlD6mWJWH0f
         k8vQas4/HhH4dvjW6lRYamN5Y9uy8NK/vsaToLWpAeXDtyYB574VQuyY5z8TBEXGX4mP
         fE4V2WRhicX59RSmrsALC+DfkMB6xA+m4khFUqgr4rA2sE6mU8BnTjwnTwiDmrZxGCO4
         SIcI7fN8w2Hi2Lkh+uQKhhYaorNnpkvzesta38hMnsVMVqk2m3GqSk2UvVgcmbRwKqAC
         XBhacbySP48oCPA4f3SYYk/FxasD5uJvsiXyIZzBJj8TO0WtBg3nQ3k4kqo+tw3drIxJ
         M53Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4pwco+c+9KkzPSJRdqApur/BTzS985qdd4tfaxTKKKpZHtZM94fw7MwjbNNjWeIoJRbhuBhYYNhXcAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd2MfOcXlmykmfLO4m60hcfnx79bZbQ4DDicwNC5XXMHRZL8r4
	Hek45eMbK9MdxiMWdRDB8FopxObNiDbVHvMduBDPiqJQUeaQAYxJUxpA
X-Gm-Gg: ASbGnctKdU5jKgSxff75MiFXFXmXPpQtnunqmo+7ipRpcPJpwixxN/tnHO91owEMuun
	3GFIRKqiBfsRsK3ESEazVeMpth3RnhCXrwkvJSCrjv2O/2p0y9Oaeco4N8X3MOezf/dtzfKtKYL
	s1b93jba+DQyRuMDGLK4mUSS+109thZUpDy71MCcUh501z13wVpoAxM82b49drvPC0yvXmVbeWf
	nBgOFCRC/ZLwWukH0lfFMu61f32HJx/XIBpIIS31D1M5gaZLKuoAF0QxIc+LqPRhpWEo4Q0psR4
	lcLyVzsM8aTKWoQwAZPkw0IH7SXXrx1BXabTAY9Fr6F7G501ZvPanVGYD+UXkfWcmsKGxqis
X-Google-Smtp-Source: AGHT+IF2gopwxM64FAD0FZDnw1lPgQORZkvtpUYpoRgRuNfklUmt4fK4rmjd5HBaL3Snj8yAGWBBoA==
X-Received: by 2002:a05:6a00:3cd6:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-74ce8acd777mr21400752b3a.20.1751956249103;
        Mon, 07 Jul 2025 23:30:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce42cc925sm9765276b3a.152.2025.07.07.23.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:30:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Tue,  8 Jul 2025 14:30:35 +0800
Message-ID: <20250708063038.497473-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_233050_485622_1D0AA0E8 
X-CRM114-Status: GOOD (  10.16  )
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

Add USB PHY support for CV18XX/SG200X series

Changed from v4:
- https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
1. patch 1: apply Conor's tag
2. patch 2: remove dr_mode debugfs entry.
3. patch 2: simplify the cv1800_usb_phy_set_clock function

Changed from v3:
- https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
1. patch 1: remove vbus-gpio, switch-gpio and dr_mode properties.
2. patch 2: remove all logic related to the bindings change.
3. remove the syscon header file.

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  54 ++++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 ++
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 170 ++++++++++++++++++
 6 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
