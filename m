Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31FEC3601E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7DbTukQT8bwCQeIAeoLteUTd99YKbXaybAqkv/l0t0=; b=FBA2dAtg4uUE6T
	5UYK4gAuprLecSG9pS04cC9zoha7infUj6V7jH7q9Dpc5W8idyKmdikeAhXHnGxr4xi8PM1gJO9Wn
	qADpc3W7dqRhNAQwKHUtqY37IwRIMx9Mx2y0rbBXymMzon8lgIzugnwJOBjaAwzx0YzNpVOgmoI6c
	xBGPUPGS4FT3iB2MbxHWnqPRpfyt79/4iBz4hwQmrZ01NqpgshHaIRnQYuyHWbnTjrRmWtyPk6mQQ
	Iyz5u8JdWDT9O9bGGE1M0ljIDdwRCM2A32Gw7PnG97wOCxWZhGigQw+HMLbNlon4urhlNsNP75Bho
	lmWTx/h2wECWBnxgcLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45w8-00000000GQv-2k4q;
	Sun, 13 Apr 2025 22:36:24 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45w6-00000000GNX-0T5e
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6ecf0e07947so36033916d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583781; x=1745188581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=nRL7E0NF2jjELckn4moBxeNziPpos7/sWonaQEe/sB8bXxcqgbHu+LLjJeyP/lHosj
         F/sS6kd/z3/etMJBq/lappRhuNX3bpr0gnZdHQlCnUutqPswdfrDPobpgpSLJ1ElgJpL
         x3z/wpW1vFtRc4CidKy9sSpQ8eqPUGyYkkGWPzcmqCQBek6eCjxfDE5ub20BdyHc8tD1
         Es+41KYOcHbN7Okc/suGlZTWV0Riscf57gRmswMGs8xijOE7jFiCKaI9RpgLwYqT/EUJ
         IvSwksatpOY32aCXGlZqXg+YI8gm//qnGI3rfm1r9ooe4qEtNwCjg7kZbvPY/8TCokSw
         u9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583781; x=1745188581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=VseHr2Nm1xGsmLRDZjNxN8QkaG9T8b93O561CXWcmPWBMPS438OLl7uwpHrEq8vjLz
         08c4JbcfqDet6eXZcKP5cO2/jzhe9l1pmr89m2Pe89+iNwqzJh7JrZ4ncMRMauuSMHVY
         OQSvX/krvKRTD+YDVyL6Wf1vPyf/LskomMxa/fQDmXrRXTA600uSdlmdjeKSwSqnL9Rx
         sNSuWbWYK3xLmQwDOm3hNZU3Si0NKR0Ai6QaWwHjBgxh3KW3xCPQcZHYxk9G/CMq1CNH
         mOr2TL05FATLB3SJd4/TX5H6RTdV3kGOYq7jzijB7Q+7xVxtdfC2hxu5FQtv/kyttcYr
         HBKA==
X-Forwarded-Encrypted: i=1; AJvYcCUJN6z5LFOYo8g+QEiKmD2Akxt/inOAlygDxYmL///wM3c9OAqZDypaAhdc4Pe8wzFdyA3OwxUIsDBTJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDd7jzIf5etUDqnT78Yokk+cihpp59WrkusGosg/4uyo+o7Vb
	eKRE8UjbrFCwyHnKiUnrUXsfPZHqFLeQ6h8JmCd+Mhd9iQU2ctXL
X-Gm-Gg: ASbGncv05A8Bgku5TMfMyeEZF/EqypoVR5393ceh0nLuKGKSHC5h2BVP1xkcvsMuG6a
	ftaG6ug562EtRDsfq+GbPQbzvr2rKYvkjuagpsUj6e/GrdsUPSxt2xIgDBL154ri16XtP3ZH2Br
	1uiz16bT1zaMKuEKJAML0KEBxFZWm1nYSUkXD3igh1jWqHgqwUQm8h+buZaXV3u3atqWQ5WHuw2
	cIAPnUFx0k+9RGNNMiq43cQgOvrCJyfZ4Wh5KbD3hcUMzT2/1Wuq3DfA6TcBXE1qpeRhgyy6m8U
	G1/GoLFr9znDZ5vt
X-Google-Smtp-Source: AGHT+IG/MwghfEhc97YvFHZWLozw9xlagqWPjSNN/9ACmR9MjI4Awfl/moCJE8mwkkuxdSflay6C9w==
X-Received: by 2002:ad4:5aea:0:b0:6ed:18cd:956d with SMTP id 6a1803df08f44-6f2230c7614mr156245706d6.22.1744583780708;
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea10755sm71031576d6.112.2025.04.13.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon, 14 Apr 2025 06:35:03 +0800
Message-ID: <20250413223507.46480-10-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153622_157432_B1279EAD 
X-CRM114-Status: UNSURE (   8.56  )
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

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..b4c4d7a7d7ad 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,pioneer
           - const: sophgo,sg2042
+      - items:
+          - enum:
+              - sophgo,srd3-10
+          - const: sophgo,sg2044
 
 additionalProperties: true
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
