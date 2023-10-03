Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9BCE75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU8HfEqy+hX+pZBrwnTN04v6NcGG5PAVL0D/1+NLCDo=; b=TwMJDWPBwxolpV
	P7DqyYpOgXTwyZvJeq1JQdLGSwNmyRfQPo6sazFrUOKpi3/DK4p6kZP+XHjHXAnlW8tIGP9BaeLQH
	imuq2TGS2uwkw+hQHabpL5hxu9zPWAUDoMjwnJHckbIJYS/cqRyOWSlQagABmGkVb4ajxan4EXgC6
	mrKg25HL2R5auoc+3Yf3w8xdthJ+JaQMj+enszLXNbVAPPoDTX3PHimE8bHhw+zRrQBoW4tUnJ+Uh
	OxQsYvb08RzNPYsxXuhzuVc4WsRReTTel+qJ0lTFdBzj2p9QmVqEUfEglJNMpkHk8LIqbtGDQkAvc
	2E7yORnseVNwdSixZftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXH4-00DntK-0z;
	Tue, 03 Oct 2023 04:44:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXH2-00Dnsa-12
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:44:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-577fff1cae6so324020a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308283; x=1696913083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=L48JsDXBG5wQxcj20D0Dcsltc4EnOgheggI2CwlsmNfI37glwInnGD0qotJOgxf7tZ
         WdQtR9u2RXaeiQatPK5sDLCvNfoQA1IsrkUYoZ7fP9jhJDRd4qpDd2Kme/Y1AW0/h6ck
         ntMsfAMv6GR2a6d5QUbsoRblLdsbUEa0MqSrVXMHAGPOCPpAcxK0yOdy7SefoLhKvKE8
         OgJugl0So/A3p6UgbZKEx1aueCyzrRRIVaaCxzDFP3MVwr6+t6Q19GWuNs4KJXaCvMPa
         gMKEJtdDBtAPT7HQXQq5BsW0nv2PhaK8hqHvkTXxOZMdIhazVHTTe072+PGIkau3FVKq
         xibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308283; x=1696913083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=EuINR6sL5hih2/U4CiZWoDtm9fm58h//mGMg8Fz/nFa8Ym0TRzfmYfirgaABEEwxf9
         PU6mrJIt75UkE04F0lEOhGvw2dVw5Hg1N6+ul6JUMkw2f5fUn/J4d1fz8YBOWhSXg9E0
         MxnrLGPIxCcgJjTbc3UeBmUdfcikjKCuHacUUslTWTeT7xgRvZ32zGpHt+HT+LR6HDF4
         I+dsugJg0QwDoFV2uCVPO5U4NJ11s55Q64oSD3c2yPoMzpExDTn80lo6ZrNk+mOWs4zx
         K92sfqUbPz0QFsvf0PF3VoL+dZ3ooUyS1vfcPNwK5l9bhsRLO0VlKKfYPoxjNWBuXYT0
         NYOw==
X-Gm-Message-State: AOJu0Yz5KLd0AmbfSpmmGSexRoxb2PiP+RUjsxFPK1bDcqHH5XMI+AF1
	GszvmF0Y7V+CYW3q4OLcwsI6NQ==
X-Google-Smtp-Source: AGHT+IFGg/K6YXM3J+EKrEFvni3eUnfBZxPN5GQXl30b0bUztVZt5cBa2cf9Hxdefsa/91znIXj0mQ==
X-Received: by 2002:a05:6a21:3395:b0:14e:2208:d62f with SMTP id yy21-20020a056a21339500b0014e2208d62fmr2942718pzb.22.1696308283477;
        Mon, 02 Oct 2023 21:44:43 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 02/15] of: property: Add fw_devlink support for msi-parent
Date: Tue,  3 Oct 2023 10:13:50 +0530
Message-Id: <20231003044403.1974628-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214444_361949_F1862728 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows fw_devlink to create device links between consumers of
a MSI and the supplier of the MSI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index cf8dacf3e3b8..afdaefbd03f6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1267,6 +1267,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(panel, "panel", NULL)
+DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1356,6 +1357,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
 	{ .parse_prop = parse_panel, },
+	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
