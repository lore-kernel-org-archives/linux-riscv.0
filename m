Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E0C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYlOxuiq54aUTrjpowyrQZMPIQ8Qkaov3COmKkEMnp8=; b=olwTmgQvN+CZLV
	OIipiIEkLmvuZcuCjQ63ttr5YIw3JZnk9YfMk63ib0SCrx2WeOiMLRmxzlbK7xyBeg9ftrL7XFBkM
	d5kq/yYtkEQGLQsdA8MZOKY8EfE2GcJkNog7vMYjclzWVCLYk3nKyEihSfwdxMTFiGN2uYq+Fhrjb
	OWJvkpsD5EbF6458LqG57Ldsm0e+r4JInNUmlbQybL3DB3BACscRCdILGGxhRq9IOLxK9iv6Owm1o
	CVF/neZ4f0VoohmrI/IE+x0E7+v7S5w5UUaK2YlmpvqhWVlnrcdVGshLqbMdIkt7ufLIVdgsOBTIZ
	CLA6d07EjP2oT/WZO1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zF-00G4jk-6a; Mon, 08 Aug 2022 21:08:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zA-00G4dc-BT
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:08:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id n4so10454896wrp.10
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
        b=XaYbCDvok/GvxFa0f5R6nAc+lfRixiYd9G7yozDXN/kSc7eZH9qvkEGMaxHGlYAnyF
         Dkp8ApN+dMiEubPdhMLBOAH/sZZX/7kq1lqi6+4BVy0AsLt5H62S7NvF/s+inzuYAz48
         uE+NTLBwmcDmvjPCNz+VqkzXreiVpewG1s1gbmJvp05B6Y2ZUBIFWeOcQO7irHyvh6Ui
         UniFy+OX97ziDqcSI0loms89zlnCRIMA4QdeVlcmh9tlXwrL1Qu4SEPA/Esu/5h8dany
         CzOBksHoYoIr5g4mygXSVF5FJ4ACFNWAcRLN2B3CaPGHiy/lm5nwnvq4y3mYIR3XBJ2a
         rdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
        b=3JuNQ5O+pmhthQS7y9hMEcuHDFeztNRuqkdXFI29UvaRe0VNO9WCQdneSd8QcQs8Z+
         OTptfPlU5p6Oj34ZL+WRWrFqCnvXKL4KcdIGLbT8zPi5JGSLs0MsNB2ZsnBG25N6NyuI
         c+i90EVezz7GFdOzhMxFfCyYJ9W58Ue7crkln5N+ZXpIhXJsEO36LH6OgWSlZrp7fBLC
         B7CXFDVcz3Ix9Et+xj8+muOnus7wcnmxtcwpPd0plgQDI7x04jFakoaLUBxqypsNKZXY
         hQYox+m9hsF4ZlZO72E4EOFsLEetJp5NZtPM869MfMVxtiXuITX53JrYuHeJ80VE2bcL
         0SrQ==
X-Gm-Message-State: ACgBeo1Da139inN0tw7qZVgVjUeGRUbw5tHMVFswM/pehVs4gEVxe+GP
	AgCcPBiElQdDMzf4IZd76oRmSCjThv1+WTUe
X-Google-Smtp-Source: AA6agR7pnInZsNd3ZsPBnPPgDBz/r5knM7XTF8qQgzFc4K+jCnSOxE+F5iQ58xcJVE5RYKbsiUkpzw==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id 11-20020a056000156b00b00222c789cb2dmr5262920wrz.197.1659992902355;
        Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/4] hw/riscv: virt: Fix the plic's address cells
Date: Mon,  8 Aug 2022 22:06:42 +0100
Message-Id: <20220808210643.2192602-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_140828_449492_ADF32A2D 
X-CRM114-Status: GOOD (  10.30  )
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

When optional AIA PLIC support was added the to the virt machine, the
address cells property was removed leading the issues with dt-validate
on a dump from the virt machine:
/stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
        From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
Add back the property to suppress the warning.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c61a406c4..8b2978076e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -465,6 +465,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     qemu_fdt_add_subnode(mc->fdt, plic_name);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
                                   (char **)&plic_compat,
                                   ARRAY_SIZE(plic_compat));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 984e55c77f..be4ab8fe7f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -111,6 +111,7 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
 #define FDT_IMSIC_INT_CELLS   0
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
