Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F1C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQrHXhNTX4nqmXtTTs3f6MmCpFk+n2KwlceNqSJaFs8=; b=wckXa+JmBE6NM8
	6wSLfsl9OzTezV0zqdlLaXboYJngIKIjzSfyh9Uj06Ku8cuee8yV1yo4jnn2VjVMWv1Ys/yEyAYu6
	yPfGRkHXUIGXfJMQ5jwrnsC/bNHkP31OhG1voSMYkCQP3k15sq0rQQn2XqUBb+0cSeeKgfRsj8Qxf
	RqSeHg63GCawE3AUogFh4NgfpUWLpTy4y1NSjsU3hIN60ymgoolrj3JF2749makXZd4ZfEmqdnsS+
	9E0xHbP7XZOp4qUMKafbGmYNxhuZUynR3ZR8t2wyY5vfMg7+9bcM0T0tqWz6lBJBBI6w4nAn7PhVr
	OfEYQpCh7man1OLvtTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqiq-00DrBb-F3; Wed, 10 Aug 2022 18:46:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqii-00Dr6B-OF
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 18:46:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z12so18728256wrs.9
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Ojga+9p3SQfxSYMJSQhI2VTXIlpadm2PoIsQ+roVjwc=;
        b=MSfjm0YokPiaDmHPuaROaUDsZ8/pUXA831Er++GvzGGxnCIqEJOn6huU50l20IVB7y
         KDdDZEYvddfyEURgxkW13YIlSBRLXztdKfkHj2rM2ei9HuD82EDKcbaKcfwTsR3/Msce
         +sLfW4SRSgi+Ys0qanx+nQB/mb7kSQI22B9oG9bWhwJriwGv7rwO4M2QkF/uAKkeKFl4
         2OqWSv3yOBdvgIl5pP7I4Fq9eH+nUrtU5lOAdkivbG0P7di/+SXRojEOLrF4SIg6OHOx
         WnPPPK30FKq0rmP87iqw2i7Hk9+yptClFFzVMG7NWSeHIAVutG1aSYQ6yE8isfrzYB2W
         TIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Ojga+9p3SQfxSYMJSQhI2VTXIlpadm2PoIsQ+roVjwc=;
        b=wZkZybQQAq5beatP21KXyqTjbUmEpIL8XB3PWCYltefWZVit3vxxzLaa8pB7gr9W3S
         KoOcx4O/l5C+/HmoWrPlKjnlTMafKzzBHwDtdevIZallDZKjNhKXCfBv3hfDfMD9mHPt
         Crxz9/PPgvwcyPp/Cxdqo4kkxrjkZdk52FhKIxh0H69Kpgia7itbdgq0TfxgXOIs/Bc2
         /yA5/t4JbDSgxgFX8WcHqitCVqcmPFxSdDKcDr0aVZbgVhnFLDZHG/pPE3kRExUQlZ4l
         Y597zil5XQ6EbuYWdNbSXGdewb5hZzxQ3WL109H+shZ+WOok0KHOtc0ym0+fhxuaIimN
         leUA==
X-Gm-Message-State: ACgBeo2aqt3lRt/V8pFQ9Z3K11V5t1B7jitlenv6MgfNWWfwk2w+tI7W
	eyZ6xmYTQwY7YK/KnjyPU5WUMg==
X-Google-Smtp-Source: AA6agR71WL7BgpoL3L1/xyAz8IdT4PwLSy4E4iNNtOayTtRuJyqphjx/a+4BmrBYBtsJ6UBt+HxBOg==
X-Received: by 2002:a5d:61c4:0:b0:21e:e00c:f8b4 with SMTP id q4-20020a5d61c4000000b0021ee00cf8b4mr17221628wrv.145.1660157178461;
        Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
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
Subject: [PATCH v3 3/4] hw/riscv: virt: fix syscon subnode paths
Date: Wed, 10 Aug 2022 19:46:11 +0100
Message-Id: <20220810184612.157317-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_114620_819048_B417F621 
X-CRM114-Status: GOOD (  11.10  )
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

The reset and poweroff features of the syscon were originally added to
top level, which is a valid path for a syscon subnode. Subsequently a
reorganisation was carried out while implementing NUMA in which the
subnodes were moved into the /soc node. As /soc is a "simple-bus", this
path is invalid, and so dt-validate produces the following warnings:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Move the syscon subnodes back to the top level and silence the warnings.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I dropped your R-b Alistair intentionally.
Tested both Linux and FreeBSD:
[    0.073406] device: 'poweroff': device_add
[    0.073441] bus: 'platform': add device poweroff
[    0.502347] bus: 'platform': add driver syscon-poweroff
[    0.502379] bus: 'platform': __driver_probe_device: matched device poweroff with driver syscon-poweroff
[    0.502397] bus: 'platform': really_probe: probing driver syscon-poweroff with device poweroff
[    0.502423] syscon-poweroff poweroff: no pinctrl handle
[    0.502681] syscon-poweroff poweroff: pm_power_off already claimed for sbi_srst_power_off
[    0.503333] syscon-poweroff: probe of poweroff failed with error -16
[    0.073629] device: 'reboot': device_add
[    0.073664] bus: 'platform': add device reboot
[    0.500640] bus: 'platform': add driver syscon-reboot
[    0.500673] bus: 'platform': __driver_probe_device: matched device reboot with driver syscon-reboot
[    0.500694] bus: 'platform': really_probe: probing driver syscon-reboot with device reboot
[    0.500725] syscon-reboot reboot: no pinctrl handle
[    0.502168] driver: 'syscon-reboot': driver_bound: bound to device 'reboot'
[    0.502242] bus: 'platform': really_probe: bound device reboot to driver syscon-reboot

syscon_power0: <Syscon poweroff> on ofwbus0
syscon_power1: <Syscon reboot> on ofwbus0
---
 hw/riscv/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..6f0fd1541b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/reboot");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +904,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/poweroff");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
