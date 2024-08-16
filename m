Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD738C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YIf0lRv0uK+4nelOG4fnSyqRb6vLVH7N4deayisDt4=; b=T6IeUUJt5uXK+P
	T8C44yq51OPCMUVYDMahQSVKcTgdTZYAAFoIPYzyaDBY9xONICVKehcvOlL3pfdkDlxCd4PkjrW6W
	Y4TzRo3pWiM6L23Tghfhbp7GBCsREcrvxtTbX7Z62eYWsisl4CK7fttr3ZTIUAU1SPi4U6dstJDLs
	haRsaeoA+BpI8q8ei2h3BfzWMco1LiLNbzIDIygaQA5DYgzSypi1kvJfKJwm9ALEvj7MakLpYPe5o
	z87xSVn0bcf9x9v3mbwpq0ebMe9ruuj4DOIYoycWUF4w/K3UYePKLlgYvQCqcbmUhS9ZprTN4SYaV
	tsxx4ijc8q3oGTzHV+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyd2-0000000DKtS-0x24;
	Fri, 16 Aug 2024 15:12:36 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyaF-0000000DK7T-0Ei7
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:09:44 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530e2548dfdso2410598e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723820980; x=1724425780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbmbkUcCYIXjsRgrPS/3FHLQvhhOEq6OSnn8VLc5BA8=;
        b=mHRvDzTzdgmudZpBGlJEM/ParpBDycNuROUUUVExHq8L2jWios/oHcG9ysS2cICG7N
         HVKLd/aow6v7op0mdT8r5AeMOGmsNrD8XZoY5ZS7zOm5onLBr8JGi+IYrvLrU6Aslg2O
         Sle5dYCso2o9YJ+cjvuLF3pVslua6wJQZ8NO+pBf0X6ir7vdBbFFmtXpT/vy7prTgQY3
         8Lh6ZGU8yoGEEVDZfoIEjsZ4D0pmGuQvDcx0z5mfNOnsPGHCMH2oOlSvSMJAzLJqCxH2
         pNpvnOwDaVSROhWLkfP3lhDXgmR4xoKLb2HP16nrONcHp+Nu+nK+hZYPTFedNBUAR8MJ
         0M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723820980; x=1724425780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbmbkUcCYIXjsRgrPS/3FHLQvhhOEq6OSnn8VLc5BA8=;
        b=UArkpnNdiHl1RppxUbj5dd7v4G5uVFb62ccyoo6gBEasuZkkxoaU5Z4Reb6uyc8ld4
         sN39NbXkSf8Gx6Df19LJvtf+dcJe8+O2BbFp21DBMsv3rca9zKHTX9FKtwVxt6w1i2wa
         CJWrlbU87aL/SbfRpuqkkaNysmBiAc6tdmgRL+UN2EBDchUIX75QhdU0GyO+0OjPvNTV
         M8J+1wd2S37ZVdxSPBF60QfoCYi+xZzNCJWH5M1ExsEEf36dLYj0LnCf8h9gZaT8p7aF
         2dea3xMTWbi2ggWu4P4UtwBr8PXJJmR+rnJvfIKXdHDrjzyCrtCkpeWumkPZqZqESAR1
         YSwA==
X-Forwarded-Encrypted: i=1; AJvYcCVbxQC257v1mIh2L7joWap0URaypZeZ1KzXtxB0glaUTZEFuoQDJW96GMFS/oiyAzL/ySVtgkMM6I2wePr96WszFVeCnUPP7EbBDW1GP4vp
X-Gm-Message-State: AOJu0YzptJlU5hzOsoFiCkvv9emtqSzmSg5OX2qB0xyNsdvOFdCIQhvp
	LLn7E2FD8vy+vXuZoELYWDJgHzLQVIS6zPk/rugUGynkSqkkmh9BI/nyJOUpk/E=
X-Google-Smtp-Source: AGHT+IFmY/sEGKzTKMYSCVLBNr0cmG/bAj/lYGZIFzFIBymPr4dUDTzJ6fAp0qTNkGSzAxbZDMsqbw==
X-Received: by 2002:a05:6512:239e:b0:52f:c0ee:3b5f with SMTP id 2adb3069b0e04-5331c691494mr2172309e87.10.1723820980087;
        Fri, 16 Aug 2024 08:09:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718984993fsm3808758f8f.31.2024.08.16.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:09:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] cpuidle: dt_idle_genpd: Simplify with scoped for each OF child loop
Date: Fri, 16 Aug 2024 17:09:31 +0200
Message-ID: <20240816150931.142208-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_080943_105816_1A4645F5 
X-CRM114-Status: UNSURE (   9.71  )
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

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cpuidle/dt_idle_genpd.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_genpd.c b/drivers/cpuidle/dt_idle_genpd.c
index 1af63c189039..203e9b754aea 100644
--- a/drivers/cpuidle/dt_idle_genpd.c
+++ b/drivers/cpuidle/dt_idle_genpd.c
@@ -130,11 +130,10 @@ struct generic_pm_domain *dt_idle_pd_alloc(struct device_node *np,
 
 int dt_idle_pd_init_topology(struct device_node *np)
 {
-	struct device_node *node;
 	struct of_phandle_args child, parent;
 	int ret;
 
-	for_each_child_of_node(np, node) {
+	for_each_child_of_node_scoped(np, node) {
 		if (of_parse_phandle_with_args(node, "power-domains",
 					"#power-domain-cells", 0, &parent))
 			continue;
@@ -143,10 +142,8 @@ int dt_idle_pd_init_topology(struct device_node *np)
 		child.args_count = 0;
 		ret = of_genpd_add_subdomain(&parent, &child);
 		of_node_put(parent.np);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -154,11 +151,10 @@ int dt_idle_pd_init_topology(struct device_node *np)
 
 int dt_idle_pd_remove_topology(struct device_node *np)
 {
-	struct device_node *node;
 	struct of_phandle_args child, parent;
 	int ret;
 
-	for_each_child_of_node(np, node) {
+	for_each_child_of_node_scoped(np, node) {
 		if (of_parse_phandle_with_args(node, "power-domains",
 					"#power-domain-cells", 0, &parent))
 			continue;
@@ -167,10 +163,8 @@ int dt_idle_pd_remove_topology(struct device_node *np)
 		child.args_count = 0;
 		ret = of_genpd_remove_subdomain(&parent, &child);
 		of_node_put(parent.np);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
