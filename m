Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3B1C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DobINzxIzwxCuH6K02cE1vVhE/rGHqdnib9LFWegU2w=; b=V5Hn9OmDhDXryc
	4Ih9OrPqNb3SunE4DXQgVvebtsNAtHuTOJG2P+nxn+KQlZDljCa47NNz1TrqwyWWtupVCb0zsiQvd
	iG78fZzDolaYpvVrlwPqTkCKn/es2zxVRSPKA2ClYt++ZebtTzzTajyGOQVTizozLq/YVaiNu8JON
	R/HuWx/h3gfgUMszqyafoaDV32aSXPCJLbXq+R+iAcD3VxeVhOe5/wN9QhXbSwqLJz4aiHy0Z0Uhv
	2vUVVEadYEdAORySJ2RWuUPNG9U7uZrNYEdII5ydGWKBzhi0IBqHzQ2JX6IjqVU2cYLY6nuDEh/iR
	YxjigMyQ2JED/yS75kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAZ-00F0nz-27;
	Tue, 19 Dec 2023 17:46:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAQ-00F0hd-14
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3ea5cc137so1863415ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007963; x=1703612763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIbnDt1gfwHKXHRoQ8BCVk+wpgvY6XHWajEKia0uA/M=;
        b=H7rWLXiVCjVVWcBsRo7Q9ZE4od4x7l36Gm/VO1uraIkiSR+cldghZ2fOT9W0sh55XI
         Q3gqrWEKc0RtxHeTJ5lS8iBCypkQcljSYixiw9gAgbTP20keIkNj036+DbuUbvsjEbFB
         OPfuWKai7yZ7x9zgm1ghZkRtJWZ2+lzcPzuCd9mU/zWR3hnSBJ3YA3qmv0D4mlxRe+nJ
         EN3J9vDGyVPllF21P9z6UmPeWtkWFGMXww9UPnc66bEVRVZN1PzMZZ6e6aZLXu7XrE/G
         z4qnOJqJS59yAM77utm5LEAsNsd/oQTazP6GyrvkYoqaJXN8N4HrOLlwj9L76AQtwqXd
         FXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007963; x=1703612763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIbnDt1gfwHKXHRoQ8BCVk+wpgvY6XHWajEKia0uA/M=;
        b=MtcVCjSy4IgMYgfcaLeqgT4QU1aZhZYXYTvZkEks/7oQsxu7UPGBHMxgmSMk+nFEwP
         B/V0Ke11ivNGkTQlJDGFZhqdWHmoQftvXSpAwLewDSyFpv4clbWclarwbfn5WtbUisxi
         8ExlFt34r2ODs80Vbq2Dg85oADbS0QOLuOH43BXXdvPJKWgFyHKlx90b6is2cEH83Dnp
         D49mvgoviZSLpFLFA0OXzF8oJnWQJmYipHz6504buHc3yvee1woZBizT2L65+qaU3YZs
         bgyRNnLP63Vjp397l4mC5gNybsnr5NqR5k0tfeGRVznGzKDjoy9lQc5E8BjRMHAOrUjX
         z0Qg==
X-Gm-Message-State: AOJu0YwB72Lgyr6aMqdDvyTeTzFGGXMgyyXnskiVDLhG1gq1q03bvNvM
	fDRDFBXYzWSN2hqS68rIYS8oDQ==
X-Google-Smtp-Source: AGHT+IHoJyst8qKxevbQtQHjUD2Bmcj6vMHRjagPkED1xi9g/ptnAuHzMtmh5nHrJpPdrkAYQWohig==
X-Received: by 2002:a17:903:28f:b0:1d3:d8e5:9e38 with SMTP id j15-20020a170903028f00b001d3d8e59e38mr2543797plr.2.1703007963429;
        Tue, 19 Dec 2023 09:46:03 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:03 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 05/17] ACPI: irq: Add support for deferred probe in acpi_register_gsi()
Date: Tue, 19 Dec 2023 23:15:14 +0530
Message-Id: <20231219174526.2235150-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094606_370527_EDC49720 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The chip which provides the GSI support may not be initialized at the
time of acpi_register_gsi(). Return -EPROBE_DEFER to support deferred
probing similar to acpi_irq_get().

This is required to support ResourceSource as supported by ACPI spec for
Interrupt resource.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index b3409e2e2041..c4605fdcda77 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -52,6 +52,7 @@ EXPORT_SYMBOL_GPL(acpi_gsi_to_irq);
  *
  * Returns: a valid linux IRQ number on success
  *          -EINVAL on failure
+ *          -EPROBE_DEFER if irqdomain not created yet
  */
 int acpi_register_gsi(struct device *dev, u32 gsi, int trigger,
 		      int polarity)
@@ -65,6 +66,9 @@ int acpi_register_gsi(struct device *dev, u32 gsi, int trigger,
 		return -EINVAL;
 	}
 
+	if (!irq_find_matching_fwnode(fwspec.fwnode, DOMAIN_BUS_ANY))
+		return -EPROBE_DEFER;
+
 	fwspec.param[0] = gsi;
 	fwspec.param[1] = acpi_dev_get_irq_type(trigger, polarity);
 	fwspec.param_count = 2;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
