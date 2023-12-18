Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC7C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95Yx1d9j6QMJLnHdzvN6EDQr4c5KHVUxtiBdRU+YSKA=; b=DqVBED0Eu80IIs
	Stk53SRFj8kJhqemQNZSYK8fiaNLJ5GXwT/wO8YgDpc+OQD+9ZUbitwvDsEHv8OqsZpRH7/JjgRKw
	KuNF+oDmKg39tGsYNCjlF9QYmgQYbaOrcAbuFdM2BYpr+Rg3hmJr2nRC6h8/cqhdp4iNW66u11QEq
	GVH7xf0uMBkuNmhci1JiZQVoJFiTURFMzphNVJc9qx69ebdnW72o/zlLzXIWfXWlZ7sMpnaNK+E/R
	6wKaJQUqoLun9vqHiDdbQP6K/25iO5viR7b7r/GiXmUmjQ1TuWiLSnGOZTOoNl70CkTPSjfboIqIS
	sI4OjvpgUmPIlUY8HCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSf-009yxq-0Y;
	Mon, 18 Dec 2023 11:07:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSa-009yrT-2E;
	Mon, 18 Dec 2023 11:06:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so324185366b.1;
        Mon, 18 Dec 2023 03:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897611; x=1703502411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=EiY8/U6pmn9MsQbxlNCKQaA8nnRM8wch0EETlYEnUjmsFTBDEhRTakPucbZHhWdxJz
         3x2PuH3lpvn9uwFn0wG0HCDS1smRyP7qI4LdIHOmQZWuxlolNS4MjHLW6OXY4cyzdkPv
         Na9ikJrxFmoZauCs6E7jw1zOMHDjStf35bzW9ItHVfMNkPgQANwZz5sjx6yRLnniY+EQ
         kwkcAEwHXEcJfGOplV6KWnolGD9oEXQwjIserlDeYIS86LAKpl8ibZ9WmPxu0hR3VVJz
         HaUnoamFuvivz0L436bW2vz3TMuEOGGkWGe5juAdluIjAIMjPLOcy1iiOuwbNkh9zZex
         3wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897611; x=1703502411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YMMP/qsVfdoJtEElBLyEEO9c305KOAYJqUkekDdPZs=;
        b=uPpu0oehxcH7i76XWNXrMxhENpKAowjhJqMCcbVLr57qUi7Yuo7eRg8X0IQeExASxx
         tSwRTaYIO/oaRMXpt94liPzZlmyTtaLYh1rOsCMd5Yu3t+8zaKMjKxkbsRnlpeiqvbGq
         Nb8tkdeGVPebPpt5a2fIFt9cpw+uUL6EEzqvmSy4FemV20et2RhlJAe9lIIYUvmM+r40
         3+igv8A4Czgm/RrITNHiyVCSnfG+jdFJVOLyjOq8rTh3Zi2u6o2oQeN3QzbDxjUlzq67
         awAsqv4+CyRO9K5f6RVVNLMKMDZZ+N29EpOr5D1waRyO/5Qw1v3IUt0JeLJZL4zBMQ9A
         7bZw==
X-Gm-Message-State: AOJu0YwtJJeNpERlagsz5zMRNtzNqgnzhPj3avTNUROdu1jcPSy6KM4S
	VCGBsboJxS467jExEH8Ry601nne+TYnkGw==
X-Google-Smtp-Source: AGHT+IFvCQuixkVNgpJoy4iekrTbntIvFyqQXesXqFyDPHUVUrNSA7K6fhKQ0zABch1KMEk0awPKmQ==
X-Received: by 2002:a17:907:6094:b0:9fe:5d39:41c6 with SMTP id ht20-20020a170907609400b009fe5d3941c6mr8647546ejc.51.1702897611128;
        Mon, 18 Dec 2023 03:06:51 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:50 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Date: Mon, 18 Dec 2023 12:05:41 +0100
Message-Id: <20231218110543.64044-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030656_834963_2902A14E 
X-CRM114-Status: GOOD (  11.20  )
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

Add support for D1 based devices to the Allwinner H6 cpufreq
driver

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 32a9c88f8..ccf83780f 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun20i-d1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
