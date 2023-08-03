Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C17DC001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3QQoOzYa5yxDvVUb47rsK55EE/HLx1L8/NSLPIWBmA=; b=nwYwCQxRRsbmvU
	qbGn+4mdrfAy/XYb7sH6tnrQv/JOwudwvD6+FtOP7yqPu+0JOv5YOA0nkyyyGYJE3iY8JvxWF0iCS
	GPkBAuDSAdFwnWnuyRM58XEE64cqK+5EC5xs0+0dcNiiSEUJ7pEFO53cQeMsM33Pe9FNEC3MIiw3y
	mbjCtlHyK7SLisGNT3UnS1X+19bX2K8/ruPUWMUFdhC73OMP0hEYAgaqgmFFqrOvjIoHRiA7MtAfC
	5jYRxThSh1IijRdg9aIyn0Sx6eBt2cDLEYHtXUhpBrstO8AuxHOv/J4NeKmIqZrJGBbZuz1KDGy1r
	XxHnQXxRDHBOm5QyaYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRce9-00AWBL-2N;
	Thu, 03 Aug 2023 18:02:01 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRce5-00AW6R-0U
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so887289b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085716; x=1691690516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oa5JuUdn7+qjYPf/m5YirkX0l5WPw2pxjpAQ3vHoF5I=;
        b=KQbJbLeA4TGtIxIuFW6WC8NJApS9TUoRPunkwh/7C0r1L0sLBDwJGs8OUTxRfQN8yL
         IZgS1FD+/A7me33MFHYJD0l0yTtrtfiDYXF3e8iNfPm93ITz3TvFfxLpZrkvFjfajmGf
         EMdRXrFFA3X7X7YRRnEWo+UPpR2JQ9GgdKaKpv9xyaKOqY2AwIvxxCCF7PewHi3Faua6
         jFe8/UkDo4eFfqQ4KvSjqlO/i1RJALvToWFdrastu4Qw7KsNlgXKVspIMSkXJgK5IbJo
         eJSEBF9ZP7B5NkjyH0BsRNEDtOJgtdIONOGak2Or0tgEW0/gVlXNtRRwCRBHdYyNBhLJ
         6pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085716; x=1691690516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oa5JuUdn7+qjYPf/m5YirkX0l5WPw2pxjpAQ3vHoF5I=;
        b=QzquvtteUpiKobvVRpVQwgjnV5V6JyPICyMiSEZpeSRHIyesl1DQXxy8+qa1hkZR6t
         LOeY9klMt5KBYQrhVIVaV8hcG0hI6zJVtGpLAUsslftK4ixm1yBBTvsIq4vKCrVRFStW
         Z1EokbiLcx25lPMnoyKeEckBVbvshZccEJ+y0nOixSl9zVrc61aIPE0X+VfbnbcPO3Xo
         6Y/FNW3wFc8T+IWbHBVCGpTUIBuwHlmzhXAXnpf8j1DVnHqaKo76lTw1sr/yW+ZChjlV
         2G59jSVWL3FYhQVrl8NXR9l9xJZXNKja7Kz3UD3wy6OyEe9/Ej0h14p5ZxeAfambYRie
         o/OA==
X-Gm-Message-State: ABy/qLaaH8byI3FKJ4X2tsXqjTMo4PRdz6LW2fntLgnk5a7zyp4hL1VC
	Qt1MTO1ruvziWWYt3ONemHd//A==
X-Google-Smtp-Source: APBJJlEdZK4VF6uWpmNFHink+0Aa6EYjLEIulHdNF+NehNeb7SxIQC3cwBrCreK5H/j8S4RNIEykOQ==
X-Received: by 2002:a05:6a20:191:b0:12f:c61e:7cac with SMTP id 17-20020a056a20019100b0012fc61e7cacmr16449922pzy.31.1691085716659;
        Thu, 03 Aug 2023 11:01:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 19/21] ACPI: bus: Add PLIC IRQ model
Date: Thu,  3 Aug 2023 23:29:14 +0530
Message-Id: <20230803175916.3174453-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110157_195060_A0C816EA 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the IRQ model for RISC-V PLIC so that acpi_set_irq_model
can use this for RISC-V.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index dd9d80630bf6..68b8d38ec48a 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1135,6 +1135,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_APLIC:
 		message = "APLIC";
 		break;
+	case ACPI_IRQ_MODEL_PLIC:
+		message = "PLIC";
+		break;
 	default:
 		pr_info("Unknown interrupt routing model\n");
 		return -ENODEV;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 698d120a1bd2..31f080df179d 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -96,6 +96,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
 	ACPI_IRQ_MODEL_APLIC,
+	ACPI_IRQ_MODEL_PLIC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
