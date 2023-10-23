Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF2C25B47
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU8HfEqy+hX+pZBrwnTN04v6NcGG5PAVL0D/1+NLCDo=; b=07hyxtfvnKwjMt
	p/v5FmoXhK6/RspFKQZ/BmPPrS0oo10TRh9UW3j2Ha0LEwZOolzM5TkCAplrXAS7whwLIVLzVVfWh
	+OLav1iJvV8hSrrk8Jw06yTeFM0lIGMe/bSZqgQNa3DscfI9YRYCsR0n4AuMyB7IoniYhRQi2P820
	h6Cm6rE0FetR4982iWvwZ9S42wm+8rTuyyZkMaffxE/WMhpyA867/47cQ6Rd1rG+Nb9TN5KKTMW99
	EY9o7hDtXhvtl8spgihtmYI/lLVUmmElJzqovnN7zewHaMsQUfxekRdTfWnVZr2Lq02lPgF4nMWva
	H3IX4r+AZtdsdo3HuAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyj3-007w9J-24;
	Mon, 23 Oct 2023 17:28:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyj0-007w7w-2z
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:28:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b44befac59so3342992b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082100; x=1698686900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=ckliycTfgWUh5V4z5GekcOzXOKimNkBfxOUnxE23GxLElPY/9+FaNlN2t4SJn8RENy
         zmyKhrKYX8vUlx8n3jR8Dz9H+APU69qmdiIRpShWzSMlxg/ejbedG0e+EvxQUkkN3oqg
         HeFlmObeBNyjUHT8mZItCGXazhihorxwtBKtGWDW+XeSsKhc3Q2z/1yLjFQiu+eh0q3I
         Z/nbUrHMx+qctQmVT95inqysy+GkI/+xHEwk/06rtL9LIOUmk9O3A+S84VNXD3i4FLeU
         L8jb3XhbJfnmLeAeJtHRdCHhxVHTI40EyK5p0nJMAcqJT8cthPe3SBD90it+zvZD3whf
         kbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082100; x=1698686900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBK3NZC+n7aQ9gEOFAwoNpYjPv+cjuqYwdG+XSaoH8=;
        b=BEUfMNjhSChHmREunFxk6W7T2hTdO+IswpnLp8unj3haO9xkTs8Bg7eUF0Ay9KIt9x
         qqWCZbRVbDwyMYMfDbSjcS0EdfaGweif0OnPGf6ieS8QHr50siJe6FTGgpbgcJBHRSqf
         HJlac5lcrDfm8PdW/yAzwXyFlvvS7t9CacBgTThD2OCl7uyMS+eVu6YaEhgBLno7f/Ux
         3osmqeHA8aOmkUEaDxV+wlDyYQenCt4gGQV1uWBuxKOcUtqwTaMScuUORwLYa4x8NVhY
         z3UGC8r5wCpdr7eO4DuxafA0iUEfH+TxOu4gcRKkw+HdpNm7c3UV+BJcOU0olKycoHNn
         7DLQ==
X-Gm-Message-State: AOJu0Yw0vCb4FmpckJbiCfrVGdceE8WrkkGX6hE0oH6409yhUGY0SexB
	oewVcoTpFtm6Nfh7rOlj90NBvA==
X-Google-Smtp-Source: AGHT+IEhamlczERwlzDzetrJnAlZ5sdu84K72HLg62pHuk1whfdxvOWdFru0gvqURGDGnkMiM0yB5g==
X-Received: by 2002:a05:6a20:4323:b0:15d:1646:285a with SMTP id h35-20020a056a20432300b0015d1646285amr279865pzk.21.1698082100040;
        Mon, 23 Oct 2023 10:28:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:28:19 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 02/14] of: property: Add fw_devlink support for msi-parent
Date: Mon, 23 Oct 2023 22:57:48 +0530
Message-Id: <20231023172800.315343-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102822_962992_32A92FF5 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
