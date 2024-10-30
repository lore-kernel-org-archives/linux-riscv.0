Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66859D74977
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/wjct+QjANbv2SpcV8a5r1+fNqelH8uLyWhGpvv8qw=; b=gpaO2P1ANd5CfX
	QtjGjmrzBtr7bkZ62COm+rnH79lbd5+Q2bX8jaTFPkvcr3ISJUuFWjG1hAnvV4NR0QQsgyd3b900A
	ZYghbZKOpRfTxyC/4tXZKiJ+lS12jFwjymsRh3fRx7Ti52YJb4r/byNd0qv+Z7QG2N7xEdiXyjilk
	/cbNl4f7cmQkop8Q0IaQ50GSYqrC1hmoFpx186ovlAV6uHygyfCGxs5WOqVA4mjtvJ1Yb/VYst+uY
	0h0V78Fat8zINjkLewVUbdZ1EZIOHVe4bYK+WkWcQrqa5056/+RXfIvBKDREkl2FDT6Bn0+M8TTxe
	jYL7I+WeyPfNMFX1FnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RR-0000000H0h0-091u;
	Wed, 30 Oct 2024 06:44:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RN-0000000H0fQ-1KMV
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 06:44:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so61514745e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 23:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270663; x=1730875463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xthRcNHrX1KA8pnYHsJC/36HOWII/OJyqHZyYAZYrXA=;
        b=SCopHxT3jgcXvnYrIZe9p97ZpuxCws6KGvy99R1J5S+3f5ZhdPhWBvu1H1OhQ6qkcl
         oDSRTvxwLoh8aW/oMwidnpp4IR91WClmQKibwmHvxgbd/hZnQbzdl3msl6ABVkIY75Bx
         2NKi0bLKt0gSb2layIobVyPzIZuL1zENwqdmCd6nlyd9mJC7ycZ2JkPuMe8cJHqCQm9U
         r6SUivK8x8BtAA03hLIPFor87rOFKMQse4C0MYisVPaVKTw//sUXvDF9NasQDOXrxOA8
         IfTNW/GAjjz0KVfhEeAjS6m0gfQFF6eReS62zQNTQMgK1ZxVvGhAFYfMWeAVOP7amFR+
         pqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270663; x=1730875463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xthRcNHrX1KA8pnYHsJC/36HOWII/OJyqHZyYAZYrXA=;
        b=cihGPiE/3k80aVa2rabvtr0nwfgTTz8o/8VdD6qi6x4BtUsaErkrQKW/kZYhTeT7Jt
         WUhQw6btZRtitnIqk4fOa7Y1Xavd9IYGf1wJaKe26LiCPF5XMz79bpi6iGf5XtgwLA0j
         qpSIe6tITIyDMsl2GLwdWzWUy2JtMxIRsTCQWCb8cLofN+YnxvvPPx0vB+Bt1qp83a5C
         A7+0FcWcHDdYxSJLWvl54xodzCsaForv0Dy16taoFo7SIF9Y7UWizH2TznQE4Zn5k03A
         dh3+YhqWgzReoNSa17UoSGHwBUJLcFs3l0OaibG0LXnTbLSBwuIF2c43WzYktiCgBSe1
         hg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/iaUnFw+hHI1EAD6dDhidr1vehtD4ndU3Qg0MhcbtcV6108QTmmWknyxiq2c5nvMtWpj05j3OSS7mbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl6jj+MpHAk0Kqzp72p9imljOXwKMSoZowhb36BgdBUqlkwsxS
	4kcwLOyUCa402lqeulxI2ON2jM45cdE4QRudcADDbwAjs3X2mj3s
X-Google-Smtp-Source: AGHT+IHQ1NHOTA/Y5PIyYKQkbEKei8UPfqq6CzosOO568i/CJvp0+diEhs8+E3HO+oAewO52R20TBQ==
X-Received: by 2002:a05:600c:3b86:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-4319ac7642emr125927235e9.7.1730270662983;
        Tue, 29 Oct 2024 23:44:22 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm11249655e9.41.2024.10.29.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:44:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 30 Oct 2024 07:44:10 +0100
Subject: [PATCH 2/2] cpuidle: riscv-sbi: use cleanup attribute for np in
 for_each_possible_cpu
MIME-Version: 1.0
Message-Id: <20241030-cpuidle-riscv-sbi-cleanup-v1-2-5e08a22c9409@gmail.com>
References: <20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com>
In-Reply-To: <20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com>
To: Anup Patel <anup@brainfault.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730270658; l=1323;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=m1T9HiX7+i3wBf2xZSXfSq8sq++p65LRzFdeJzf9CJM=;
 b=FHS7yNAJhB0v5GNqH1PLbBsfTbP5beoCMPpMWfQ6NgPppVeYQ2SabddKJWpbSascpojP1A6CL
 NqbpY1ha6EuCDToUI3DaeH4JLkvR6jBIP9xAYthV0M5/f7YLsBJ9iQf
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234425_409120_74340557 
X-CRM114-Status: GOOD (  11.46  )
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

Simplify the code and make it more robust against new execution paths in
the loop by means of the cleanup attribute.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 2b3aec09b895..3a78d6b7598b 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -504,23 +504,21 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	int cpu, ret;
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
-	struct device_node *np, *pds_node;
+	struct device_node *pds_node;
 
 	/* Detect OSI support based on CPU DT nodes */
 	sbi_cpuidle_use_osi = true;
 	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
+		struct device_node *np __free(device_node) =
+			of_cpu_device_node_get(cpu);
 		if (np &&
 		    of_property_present(np, "power-domains") &&
 		    of_property_present(np, "power-domain-names")) {
-			of_node_put(np);
 			continue;
 		} else {
 			sbi_cpuidle_use_osi = false;
-			of_node_put(np);
 			break;
 		}
-		of_node_put(np);
 	}
 
 	/* Populate generic power domains from DT nodes */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
