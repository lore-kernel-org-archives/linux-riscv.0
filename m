Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E6C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNZHCyLR31r2o5Jvf9ilHREMd15FrJiPlQpPteh6P0s=; b=Hnqg7g+DlvUbQc
	zFiA1fvZScdoFdIzop/9nFb0A5s+8EdHmjEtSR05F2wgag09uHyz57E4SnPTmIgiB4k/7ywdhT/bs
	VJZ2Wk+2YOu00AVUwkoXtmhq6Vj3MmL5Y8SB/frIkKiyAXvEB0HuZB5rXytn++4ehpwaEzYZBSgB7
	VYSOHNpES7gOk/QF+q2y0LPLr8AGIpMv7g4X2fOXKeCsSrq7gL1p3+nNik1ziEFdDQpv3lT4lCQfH
	JaTUwDdrxQtSoJBxfNJ01eG1oCG9D10VYABd58u6BggMtxMGdQDMddfaayyRCNCFwheAYSYbTb+m8
	r6Oc1tsH4FhrWKBvtPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRC-00D33p-0t;
	Wed, 25 Oct 2023 20:25:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQs-00D2n9-2W
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:52 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68fb85afef4so140868b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265489; x=1698870289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bjA2IFkbvQ+cjwZ90V9r6vmNOzBSbezE1qJqMO1A+c=;
        b=i+W23NRdmSfj8GRMU0+gqpM+b8UprXw2ZBgby03jq+RfupkKT3iwdAHlrkqEnp3Kv0
         BO//6hJgYkFZkIENT3Ep+XGCB4mGpS3oTJZcVllfcQ36MUdbSOh5DEDHnZgfIBDj8O5b
         og07QMacmAnXLPxj8GqKIifOaYRxgRavP8ghAYVx3uKxjbjyKyERHqxw5eJdu1EcE2LH
         hqPpa3kvwjdj1evHYmzLvk2Jan4NR9p/4ZTQptkxCiBh/bdMUUqTUeFHfOAckhZYZviC
         Qn2P9t8Vo0/61ouUYREuNhBguzgDwYKvKBzwR5bZjrRjNepB3ugfllf6g/qFvW3+84Ro
         zTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265489; x=1698870289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bjA2IFkbvQ+cjwZ90V9r6vmNOzBSbezE1qJqMO1A+c=;
        b=cJY3g+bOduOATMt9rI5WOl4kCF3XT+N0POcjV3++T5XFOIgfgCoyI99Atjp6J3nffU
         Fc7STVOUjfu4xFG9o6RM1Mc4IetO2EPA8tN9Z2da59DXDSsMN6Egwa/RsBZoG84pPrxS
         SGavzbTiW6WoQZ+E2YOYPh10ojVSL2C5wTi4TfDY7LLuYgzPrauYpcTbNeEEY93rAY40
         v5LvKbGHOExGRhbE+xWFJQGpiRhz5vhNg7Crh1wNfglogYMbyDNYmQw+AZxm1TRpDPJi
         RLL+SWo1UeiM6uu6GvvqrWns1/CwAoxucyospgI37j8NrdHJO7HzcVh+0V2Dq6RBoMnL
         COwg==
X-Gm-Message-State: AOJu0Yyhreo7FXGvrj2QF1hAe+JyqYZD26NZLPE5i0UkinoRKqgdqoYk
	rhHr2tDNtVwzejtO81yhRYKo5g==
X-Google-Smtp-Source: AGHT+IG0SpgdyiZkoMurZXPLkoY/g9K3mifAR/RprvidWByJ+cvRjgFm+eLWR/dX/aORh+7WvaUdiA==
X-Received: by 2002:a05:6a21:33a4:b0:17b:3cd6:b1bc with SMTP id yy36-20020a056a2133a400b0017b3cd6b1bcmr8121322pzb.14.1698265489371;
        Wed, 25 Oct 2023 13:24:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:48 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 07/21] serial: 8250_pnp: Add support for deferred probe
Date: Thu, 26 Oct 2023 01:53:30 +0530
Message-Id: <20231025202344.581132-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132450_823762_797FDD5E 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With pnp_irq() able to return error code, enhance the serial pnp driver
to support deferred probing. Return -EPROBE_DEFER when pnp_irq() returns
the same so that the driver probe is deferred.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/tty/serial/8250/8250_pnp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_pnp.c b/drivers/tty/serial/8250/8250_pnp.c
index 1974bbadc975..dcb3daf7c816 100644
--- a/drivers/tty/serial/8250/8250_pnp.c
+++ b/drivers/tty/serial/8250/8250_pnp.c
@@ -8,6 +8,7 @@
  *
  *  Ported to the Linux PnP Layer - (C) Adam Belay.
  */
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pnp.h>
@@ -443,8 +444,21 @@ serial_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *dev_id)
 	}
 
 	memset(&uart, 0, sizeof(uart));
-	if (pnp_irq_valid(dev, 0))
-		uart.port.irq = pnp_irq(dev, 0);
+	if (pnp_irq_valid(dev, 0)) {
+		ret = pnp_irq(dev, 0);
+		if (ret == -EPROBE_DEFER) {
+			struct resource r;
+
+			ret = acpi_irq_get(ACPI_HANDLE(&dev->dev), 0, &r);
+			if (!ret)
+				uart.port.irq = r.start;
+			else
+				return ret;
+		} else {
+			uart.port.irq = ret;
+		}
+	}
+
 	if ((flags & CIR_PORT) && pnp_port_valid(dev, 2)) {
 		uart.port.iobase = pnp_port_start(dev, 2);
 		uart.port.iotype = UPIO_PORT;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
