Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882ACC25B0C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEL2bW5buEecU9hVntVw1AeVP/7eSwAu2dZmoCaoTTE=; b=lcCSW2CmUlU74u
	Lolb9qqFG/p5kB12m1RF+vcEBSNE5L/OJXd3b38sgn/tEkN84K00B4Yd0kTpuypTHmmzYI9P4X9ay
	9fYTMNDrS0Jaa1ZJ2y6QlOFOySbGEVf+yD1Jjwo7BIdLmHcEt6JIi2i/XzI1MQ2O8NSPdvPp88RPf
	wR3poNLvKV5TYb/n1/0Ag7HetKIlpo1w1WTyk6ccJFHgH51qxzlu1f4WvTtHFK+0oC2XP44/ZMQuu
	XoLiCOInGIBWoTMbxwwuI4m/PwaSFnUEXAJ5I1lnwUDgX0r+zIecyY6MeFLE5qRkETiXcR25vIQVg
	GbWvLJgEEtHqyi3VvGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqil-00Dr8P-4P; Wed, 10 Aug 2022 18:46:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqih-00Dr5j-2V
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 18:46:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id z12so18728172wrs.9
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=LxSeMItdX80JUjkCqXJgBhLVTwmp50MmNGKVChYDIkyimBCZggvVswojH2xaylxdrl
         GqF64fQ3rYkS8TgZapgQSQ1ChYk+cpE5OMLLYfHahXpuypIqzE5Ozrj51yCqRstntxCR
         XBwYtD/FhG+6iAAP4Gp12XgbPvkBiblJXb3IQf+Zpb2WcllJxn6cxa5likf6q9upV1Hh
         bbMFgMLxfjkk4lvnviYPyDt1chW4aK6QfinXZYmYrbSWwLmznOVfWMcUFc6LttE+8P9I
         VqHauCCK7uKPdbhguExtlE9NNoH6ReIcZ6+EN33AG/9K0zSdzrvwCgmMmUqOlHl5Gqz5
         CUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=T1px9SEGT6uQ31gtIbSqFzI5J1qD+bmCeH2NMwWe895L0gd4w1oSPO85c+ZAowJvgA
         igXL2A1jbw82cmUX//V/MJH6d20zcRmt7fzQGE2NZWAsnoVTBZnWWGg3kqVA52R2ChAv
         LBUBj3u8tWLREJj5lgKcwxHuV/9uklZvSUAe1DcM/Z6Kp0zBtc4HORspo3ReL+faZ023
         82wczBCbNGucQuoE2d2ugWYeLj5WU4AKtrqGYpp97uGqJ+jp1994lbZAzgUCRgCzF/Z0
         gwnSV5iL8O+8UnusDTI5I1TqOnW/0GVvzXIx7llmkBp+/26gUX8Cl2wBONKvSAaxcWPf
         SSSg==
X-Gm-Message-State: ACgBeo2O7pE4MuGxPBlb7Z22PF7j6KtsA6uGs82g3USN2/q8cjbWo5y1
	JbmMwkWFjmhmGzTRVnaesxY5eA==
X-Google-Smtp-Source: AA6agR5cEsZTkeIM60/maHEsT+mjTmhiJMFDBRHpKpDsKgto5han/ZWpbkiQUCdEYeIR/fPfWekWiA==
X-Received: by 2002:a5d:5887:0:b0:220:81c9:8ab7 with SMTP id n7-20020a5d5887000000b0022081c98ab7mr17748783wrf.702.1660157176721;
        Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
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
Subject: [PATCH v3 1/4] hw/riscv: virt: fix uart node name
Date: Wed, 10 Aug 2022 19:46:09 +0100
Message-Id: <20220810184612.157317-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_114619_165935_FE0484CD 
X-CRM114-Status: GOOD (  10.17  )
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
