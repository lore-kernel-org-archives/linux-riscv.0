Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A1DC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEL2bW5buEecU9hVntVw1AeVP/7eSwAu2dZmoCaoTTE=; b=uo/T3ZXb+FiMSv
	+Ukm94isbsVoC0E1fxVR6oOrNVV4ofgYQKKU2eYTlTfCUWgud7KTSbkb9UosFBq0tfJFuXitmlduB
	5a+RVbPwSiNiLn1Fr8PM4QioiE3qdRbKint6r2FJaINMzpWKdnDoDvESTKctzWsfo9KVoN+laTFHG
	xQAuclK2hxl5S0kOTxV1VxHVw3KPzmwq+6WtR95rdmEPquMXQpdxE5J1HcqnfjWCeMiQIpBOXNJwD
	gLSuTOPqNo5JxmBWGIdRF1zQwInWAnlM+q9PROZ1CQjqI5weZqQ/RXCUTz8l9eZ14IQi85zTEmUDB
	C4OJKgmthU2181iPCdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zC-00G4j4-Q8; Mon, 08 Aug 2022 21:08:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9z9-00G4dD-6x
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:08:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q30so12180046wra.11
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=XK4wHIwZI1VIgmfh4aS4nuMCqHus/q6qeAh93CvJuKLLBPDj+zCi/bsntDY3EFjQbh
         3D/x/fnF40VpSYbtsW08BZUJLdIvsQXcDevW1TQudOYbRVKJjWiI9YlfMBGZGUg4FJcG
         e/Wr0FGwOTEFatMiN9f449TLEuz10NB13BQiW683VKgNryHQFgHEQhTNH9zlhq8I+Mtu
         LpOvp8Iu+/NRDrXZ7VPfKOc19TxmLoOSb6JOEQURjoconCTnQqRDZQnEfUPp9YcbruVl
         G3YrNnTG4i3uOzKpijtFdrZH5hnAMNW4Z2FPq4YExIWyKs6FLqDCzJx5dkKGJsXPIzGg
         RVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=GA/wxf19++PF6ZCF7Zp6vFPy/YGMxh82JOu2VeIUL7S/5VG6fsnbIlHaOHxRBbH9Np
         wPKD1jux1qfgNRYLYFp8HKdoa6hTN8txOjJfg4CEWDmTma8xzDSCongzmJAWWXH5WjpN
         EFbB0n9AXYEt7dJrAIuuPis/gRFFidhTyuFgcnihyJd+3V4mpjuqTC2xioaOAKMKeui0
         F0sYVhbbLX1fZPsDrb/wAWq9IcwH6VdSALJ8E0VpsjKSk2bH8w/fvbvafq87XNWNq/9T
         8lDvZQ8OaINX4rh2t1JenFw5WBnj1U1RVFHWiFrXn1RAxIxIxgW9Dtr6QGwPaWx3zw7L
         7oPA==
X-Gm-Message-State: ACgBeo1IyYeJKzU5ZTui9rPCLEq+PFeJvdwL7QZbpPK37JPSdexbXenn
	7NXDtcfqLqw8C3SUQWEz6XikjQ==
X-Google-Smtp-Source: AA6agR7z6uM/3AoQrwZic1UwZS/GsB1rbuTP3rAL8ggDxUp68YD0jOskdhjlF6fIheITRBHxIzEp8w==
X-Received: by 2002:a5d:6609:0:b0:21f:ff6:9090 with SMTP id n9-20020a5d6609000000b0021f0ff69090mr13240982wru.30.1659992901275;
        Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 14:08:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/4] hw/riscv: virt: fix uart node name
Date: Mon,  8 Aug 2022 22:06:41 +0100
Message-Id: <20220808210643.2192602-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_140827_276375_12FC0232 
X-CRM114-Status: GOOD (  10.31  )
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

From: Conor Dooley <conor.dooley@microchip.com>

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..6c61a406c4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
