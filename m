Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB9C5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOr+RpwnLMqvvUhpxE5Kj/bdLWhWjnRFqnMTDQdy1k0=; b=IaTVlPoWoryDL7
	A9BJXmlTpe2HHwR2tU+nbpK7e5P1UsTopSexp/14U7mYrv5oFOW71JzKVhvczITXz0rqdt6rM8+Vj
	7LtGxsv71+v09v/6OfCGnqgDmZzdcIS4r/sh1DkrE5MYxQ/QND8Y8J1bGPvMZbgb/XeRrpcUdXVg5
	K9yGxO1CVDrB5oWuT4QiWSMhm7Io0qP/3DUWqRp+JnZencJneeXBrbe1YmbGIYU4ero4oXuq7O4Ze
	3R6ZCAdiwrPhh9y34UXNYTRpFtfyNtQ0yRtd6eXGl4nU85RvJOoBaDZ+1HoA1jqWL8EpbcIT6P6rP
	tx85O5TfMNpnwtJKGr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLPe-00000004dq9-06QH;
	Tue, 20 Aug 2024 09:44:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLLv-00000004cf7-2xc9
	for linux-riscv@bombadil.infradead.org;
	Tue, 20 Aug 2024 09:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZY/iGek7oJwLxPJ1JKwoSRK1o1gPKN3vGl9eBXs8wms=; b=pLoBlWRRlcQt9wm5n+dQNZtbTb
	1WUJhIIZgCN4HUSk940NEdrcIh9mfPLpfHPe6DxIUtJdtkwwr9K/CQRYENHQb16zCPxCDU/2I8z6p
	vbbYrMUAPhM/YRMrP3AruLuVDSIpTpuzDE7jS6BK3kOj7RCm0Ajr6sReAOpvTTjj7XaAPdPTBxFOr
	rWw07VMJgsgeIorT5t/6SBaXRr5dFPnF434bkYP2p37pHb7lAJeaNQWXDcOXysf1S9mTAiEI1XbqG
	5WnuHPn+IiZOFR5rugTLcqkQJiitML1gYzAi4ZC2Ew4CPW7C6xyc+HIAeWLwmbNQNVBhDScORrpBR
	wru4PQBg==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLLs-00000009IbW-2WrS
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:40:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so727851166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146828; x=1724751628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY/iGek7oJwLxPJ1JKwoSRK1o1gPKN3vGl9eBXs8wms=;
        b=Wla9F86sJ8X1NZTDRXrPrS4ygzmMb5v/M5D+OfT5i8UsBENoHACKLlwcNtErmYofHq
         MME564KlnVhrCCl86icHhr8P2862QZLhXrdRbzoB2mALaNePYzRasS4yI6SeSq2Nkm/i
         Us+K1THY9BFrMy+XzydM6i4mlc541qqZLqK1qUYUB2eazBhNc3DGpjZobsy90/a8L4Tt
         L81puT49ZkHIJLWNZwTnIMl5iUD+me5pS0w0tQC8+CQkTMKo7y5MuyGstucOUk2lOy54
         T95J8nuqljziBdxSkWFoHZP4pwnf/R17ejbRkDG5Mp3iq7qFMPGEzy9warWX9JXZEbK1
         VVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146828; x=1724751628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZY/iGek7oJwLxPJ1JKwoSRK1o1gPKN3vGl9eBXs8wms=;
        b=ij7PI1zFot7IRL614wJU3Z7k2dvHdryLtzTSumT29Ku0HPAZykg0OqfG09eSQrJNsP
         KqHIBUf8ewtbZdTWnEucCdw99rl0UxA95zXrtg5C4axfbVCvZ4Q2ah9VEus6ABj1R/O2
         VpLMUWho2OHjIe8hRdTUNS1WSeoOCeTSpWLrRamaXNHOthBA7A9HyUH/lUU7wGIel41l
         8391X9Pd7BiIrvxeyL8iFDa4xUnISpQnswyFhXLhzyK1/QlHp2LO4++fIkmSHx/uEXpn
         l1VJx9L3lsmEAip7Cs40K/IIK7dBToh0ABJLv3Ynh4YdG5Y+iiA6KeqBAegGORQ8h3tb
         pHWw==
X-Forwarded-Encrypted: i=1; AJvYcCX9hNjZl8Dw0DZ9MQywk9h7R7XMAXaaN3WckJxX0i9oA0KStjwN5X8KR/5tbVEuGuQs5c+OuV1XA8MGFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx11z/ckO0jmCa6MqLwts7iYeWcnVDkUMrsYjTjmEWyeaLDNI4E
	4ihzA5LgIWuYwv71x+UrgaejEs2zKTf7ADF/x62+8o1Xi4ZXpIALGUSruKJwSv8=
X-Google-Smtp-Source: AGHT+IG+nLIH5fnCkD0hF9cIx7+KS2wkkUp+2yCqq4ti9srWQVHwWsENFCJzq2xptsWju6FvoZxRiQ==
X-Received: by 2002:a17:907:70a:b0:a83:a85b:ed40 with SMTP id a640c23a62f3a-a83a85bedb0mr774398566b.6.1724146828420;
        Tue, 20 Aug 2024 02:40:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d023dsm733613366b.64.2024.08.20.02.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 02:40:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 2/2] cpuidle: riscv-sbi: Simplify with scoped for each OF child loop
Date: Tue, 20 Aug 2024 11:40:23 +0200
Message-ID: <20240820094023.61155-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org>
References: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_104032_824229_162D7202 
X-CRM114-Status: GOOD (  11.79  )
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None, only Rb tag.

Other patches from the set were applied.
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
