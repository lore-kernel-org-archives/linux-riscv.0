Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0588BC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYlOxuiq54aUTrjpowyrQZMPIQ8Qkaov3COmKkEMnp8=; b=stsNO+bNiGRYkp
	1cw92fsqPdmy6IaX5dVkqFK+8W4qcj38av/zXQ+mjAqkWFdBJEAFqI3TaU2yLOOFrXRGRFGnw+YBb
	cc61jqOs28mSmemQOXZf2zhF0o9QGNct5c8JziMak5kADFkPAUpY69GP4qsO4I1lnFSNTikc6Q5Vi
	4HjWqRvlnBGd9sIhmq5dsTSaC2b5PRVZ/YlpSB+YYti0/sZDOrn8CG96flwb9iG/DCl3MQHmu3II8
	dRGJ9QYPzsYxwsnHWl+9kr879i+cI9XxA+pOucrJOkPfZZcb1DTn1P9MmxXB4LwIz1RjL1t0N5ozS
	OseCza8WEAiu23nrOROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqin-00Dr9b-Gq; Wed, 10 Aug 2022 18:46:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqih-00Dr5r-Su
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 18:46:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j7so18769851wrh.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
        b=LwclNXS3OtdfnUYY7/XEqH3QMGEwOBmCk6j07Dg0+DMwWWbXp3sKMPR2hwRy+2uMBN
         uTTmpntQzMQvdLbNKmKIGUhGzMKKLvTciuz5i9GRmyrrz6Vcxgk+PrPUwhYbwBr6v2i4
         Z9UE6iAP1d0HtWb/LiFRv7mnOpYo6yd2u02vGeI0swrc2govs7Y58h++JzA8Lpn8F9No
         ZwAzk726aO8mqASESvtVlzc/vtZFV1Nbt6ZH137UcEIHGKQVVypCUy0LNsbvyf+vyjAv
         LCtoobHRROjjEeecGveyUy0DB9218HTinfL9EXrzmrjJzfqmCF9KC0TciZSoeO0hOaNU
         LZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
        b=H2fSn+F7MOFqrGz/ATRf4vjqKtQXjY0qAE3qo4XJa+qKWP0stfJac3tYxmzYJts2FB
         G61nJPoJbm59FuJmXmW/bx0iAVcF7byRFdVleRifV6NYqttSJdCKSw3j1/zp5xoM+Nd1
         clbA1CU5dAFDp8Kn62MTbMxEZtVI2lS2hxnJbC7akbi54iSZU6/J7kPmuiR8qv7BmKi4
         4zl++ycrTh7XynYUI8bR1tyxLmKnyFa/q8nCZ1ufHudlQp2uLrsFRHFGRR/6ZToR87Oj
         of/F4MqhVzq4u83g0oNC7yrhdxn9XM5Z7GKYEUVB3YKLh35VfQI7QnYwDAMZqnnkmIkx
         Lbtw==
X-Gm-Message-State: ACgBeo1v0/6TOKINt0v/kEjhRIMr3JN+tHLNf+nTn5efheT8z+lx1tk9
	2RjXefW8YCYY4nEqVS1TfGks9Q==
X-Google-Smtp-Source: AA6agR5tVzHoU3HEslnVDxq5DUWCV6UhWq3gNelSTKqOZL7bDA0FNbQdn61C9alcviGq+b7WvPOknw==
X-Received: by 2002:a5d:4852:0:b0:21f:17e:bffd with SMTP id n18-20020a5d4852000000b0021f017ebffdmr17581187wrs.542.1660157177597;
        Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/4] hw/riscv: virt: fix the plic's address cells
Date: Wed, 10 Aug 2022 19:46:10 +0100
Message-Id: <20220810184612.157317-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_114619_956152_5F5A8AA9 
X-CRM114-Status: GOOD (  10.25  )
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
