Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CDCEE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=damDJnxQDLLLvxaxJIt/VxN09jYdJvzXasSuwbwkJUs=; b=vG+g1hm6iTxPXj
	guoQuEDqOb0pyzWHrCAPVW4tS7B0WvjKbKPsEWlmIqYXQ7mr0WP84vNJjxZd25zwPa1nbujeq5ow5
	7HB1saEhW4HauzO8wThUYF32nB2e8uKd3ta3DwH7Q2kSLIuonz82TcKwgxRAqBeyhV0spvw03QQCP
	41upJWek90C0yjesm8CCpwX2ZJ5DMUqQVHxnHnEHQE7LSq4tXs7lxaLMWajnfUgjpCmxdBQ8rLNR8
	jt35Lgd8sFV0sF037axLO/UurgykPDJJbTCeGhnjqIja3bWjuXPy9M2TvmLUQNLXG55uyrXPaEQnr
	jklHneLigB4DocS7/iAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7X8-003vhZ-0G;
	Tue, 12 Sep 2023 17:50:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7X5-003vgR-1u
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:50:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c39bc0439bso739375ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541037; x=1695145837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yJEEb56ymg39YALnwyrySa9js/OLlIbNxAluFRWmmE=;
        b=mIzU4do7B5IhBcWFC+EuwVMMrHb9sy8iLkCw/Wu8yj+jMyb6A+HIhuEc/ySAtRG/r6
         BDZhj3CoDwIdIbDX24u3DhfnjytnKEM05JgJ6H3Rvd1lEnVJS6QBpV8GDD5sQORZaIJJ
         7SYWjxevm0ZzM1xZm37YuZzBttkCeHKOi9ciJuxyZRrb6rUUFtzvY1oYgk1yd/epU45V
         ddAAbNOyjStvGpvZUN2sh/SARRZVKAVqTKVlAMYAbhbB32CL+ZAdbWbQTXniR8I51Vz8
         mlI7UvcAt/hzQ19oLxy96eAW6+3SiUXtVJnghA2mupsYQgQONKWP0PrFzUq9+jot4vLF
         phjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541037; x=1695145837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yJEEb56ymg39YALnwyrySa9js/OLlIbNxAluFRWmmE=;
        b=G6hZlSnnxb25yKCbOi2+p7JHWiARmRn7JLYHfXntsEppdkJSg/AHZt8z3pY7FszwS7
         bsH3v61zV0om0m8qql9RiB0s/uBoeMZtsupzsHBYWqhotoTzNaFN5PQXHCk0Gncty7wo
         4ulkUVzMaRMYDFXkY3ByqseuZR1M0nqnZWSB2CDob+KQdF8Ca9yjEMfPOD409RStlcgi
         dgEpV0Lsoq/DjSddrTtgFESwvRP0/weufNNQhTA8L9EZ9waOKhkBzgUcyZPP1+zEDyeG
         FLeCh/QAiAXJofv5wiHBKJnHLIMKLZCCvlIZhlzzSV35jAcbc02tGAjoxYNjBSYVkDeP
         ZJMA==
X-Gm-Message-State: AOJu0Yz46nDklKSCvjZ2hFUJH5uUKI/mzcLQ5hicVsFEOSYpPXgasWzA
	Qk5ktKpBTEMZBqOd8RabrsJubA==
X-Google-Smtp-Source: AGHT+IHKvRNi6YOGIT3wdmpnSjIEAM3T0v9PHxMuDSYllDIMa60ow+WAwlzZGKgKrVexZ9AYeemUIA==
X-Received: by 2002:a17:902:ce90:b0:1bf:7aeb:c488 with SMTP id f16-20020a170902ce9000b001bf7aebc488mr386820plg.29.1694541036636;
        Tue, 12 Sep 2023 10:50:36 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:50:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 03/16] of: property: Add fw_devlink support for msi-parent
Date: Tue, 12 Sep 2023 23:19:15 +0530
Message-Id: <20230912174928.528414-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105039_628893_B7BFE0D5 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows fw_devlink to create device links between consumers of
a MSI and the supplier of the MSI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index cf8dacf3e3b8..758ea822e46d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1267,6 +1267,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(panel, "panel", NULL)
+DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1361,6 +1362,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
+	{ .parse_prop = parse_msi_parent, },
 	{}
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
