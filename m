Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE08C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+VMRg3cXIV9aFBDJc85rTWaMDgityMDS19W/OcHaoU=; b=K7NlDO4Tqv3vP3
	LvUDuDgLiEDqaUu5fSVhurY+tphDQJ5+BQtkXI07GtrvLCF+2Lk6ZCdAl5rwPZzH1Hb1760J6Nl1l
	I2IvgHFxKUNSEpODPP0iZwkdZTnKKf21FBHQPur60urryDXdz930KxuOU5z/zinScf/z6ddWKiGgm
	AvIjQgphfmpcOAPqek6HX08sTMNSu8XNBRi1TupFove77Bdu3JodRKNC0kxEQrPf3lyff0czR5Hlv
	dQ+JL5a8Kh5vV3alDifJLDZszv7l42ktuTs+5+up3d3Eq/DAsh6ofkgHJTeRs49u0DEyRmkQS1Zof
	GLoTMquLNQWLN5MPhcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seycO-0000000DKhy-12Kb;
	Fri, 16 Aug 2024 15:11:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyaC-0000000DK6m-3z8w
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:09:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-530e2287825so2092042e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723820979; x=1724425779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td2rg5GyKlqce51WO+zvnPs34jMkYsAdv+WksjCyFsM=;
        b=bNfNsL9V2FrInMEeMggdtLpO9JhTYBrK4l80P+Jyiowx/byws7KmTXL7V5oNoeO0XR
         MjpcfiiVZO50ItZ0pEMChBPaKiYQx1PjBs3F3MZRJUIY2pS5Zg7VKnwZjBj1+6AJHGuE
         WjTbXiANasVieYb0RYT8mCK38FioT1UuC3B/pJ6aeiul7j93QzUhlLOxFKGgSatrIkob
         J3IjWs7xk/RZZ8DdONVR5Pb7ukEe2Jrg/hL52ANAmoHcZWCQG9D9KjlfxLmQ1aG4VD4C
         pkJGHN7pgiB5r5WRGHqoPTGekDG/Puy7dSnJc6jaGuUWP4n5l2FeQE996ngTBlMjeC1O
         lLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723820979; x=1724425779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=td2rg5GyKlqce51WO+zvnPs34jMkYsAdv+WksjCyFsM=;
        b=q7ZJ5igsyqW/OFR+PcV5flL1PsSvslS7ngNzogBNN95ENnDFpujliQlJelGkY8UIT+
         j0K/tvM6mPVt6Rbj+BSK115lnD8RtFqiXJFvhB7Ngbg0Ysx/BB8vvMcgSZb4Uq5+voaj
         syA+/jrzPreWHHsnqQEuFL+CWVvm5iMbsHwBMYdw801twmTIkbGosLrpWr9tctQVx+8c
         VBrl84HV0cqXOuVnMst6as3MxClm7SocnEr2h8JeBd0prhe1BG++JlBpl+hBWn5N107J
         3P0edctNOyRD5GuOnccSfphLYHL0V+Lc3FwPzi6lWShml29slNueZWBZVnyQntYGMkWY
         ZUdA==
X-Forwarded-Encrypted: i=1; AJvYcCVidyBY4VuRN488gOb1U5mBYzKzsSgQOPFKInUpuYzIfgFvDL6frPBqQZ7N8B2mXv65wL5a8yJOXKT65tUaZXR0Qg4eyxdvkiaORjAH8pTZ
X-Gm-Message-State: AOJu0Yy/cPMlKx2StDGU74QAVCisGXTVbtZ5f3Se42MRYHlslkGer97X
	G35if/HuFJkk37lT0wmLjRkY8pCpu9/eTmR5SBrJ07kNeLuQ+7uzfumlEoASs/I=
X-Google-Smtp-Source: AGHT+IHaJrVe+YG7WrIsIhySz+TrI0z8q1N6+97MbyrpU5ReE7HuOkmva7Y8+xgV05N9m9+gUaX3EQ==
X-Received: by 2002:a05:6512:10c2:b0:530:da95:b54c with SMTP id 2adb3069b0e04-5331c6acec2mr2537162e87.23.1723820978496;
        Fri, 16 Aug 2024 08:09:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718984993fsm3808758f8f.31.2024.08.16.08.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:09:37 -0700 (PDT)
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
Subject: [PATCH 3/4] cpuidle: riscv-sbi: Simplify with scoped for each OF child loop
Date: Fri, 16 Aug 2024 17:09:30 +0200
Message-ID: <20240816150931.142208-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_080941_007227_28E081F8 
X-CRM114-Status: GOOD (  11.80  )
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
 drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 5bb3401220d2..d228b4d18d56 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -448,7 +448,6 @@ static void sbi_pd_remove(void)
 
 static int sbi_genpd_probe(struct device_node *np)
 {
-	struct device_node *node;
 	int ret = 0, pd_count = 0;
 
 	if (!np)
@@ -458,13 +457,13 @@ static int sbi_genpd_probe(struct device_node *np)
 	 * Parse child nodes for the "#power-domain-cells" property and
 	 * initialize a genpd/genpd-of-provider pair when it's found.
 	 */
-	for_each_child_of_node(np, node) {
+	for_each_child_of_node_scoped(np, node) {
 		if (!of_property_present(node, "#power-domain-cells"))
 			continue;
 
 		ret = sbi_pd_init(node);
 		if (ret)
-			goto put_node;
+			goto remove_pd;
 
 		pd_count++;
 	}
@@ -480,8 +479,6 @@ static int sbi_genpd_probe(struct device_node *np)
 
 	return 0;
 
-put_node:
-	of_node_put(node);
 remove_pd:
 	sbi_pd_remove();
 	pr_err("failed to create CPU PM domains ret=%d\n", ret);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
