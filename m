Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C55C25B08
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eG+Nm9SBk84c0bpyxJEd4UoUwHJ6r+uceHksnrRgTcI=; b=vPU4lVzjo4HBlw
	JP+ZJ5COs0D4/FjgyWJjOzDH0LmeHfnoynpj6jqXMAmLXit/l04cQuoJGMOiXspyvy9oR8QfbUWnW
	GG0FZUD5g62DT7DxVz+KeEPMtWWCLMMPYA7+ImTosO/q78ow/MpPAZWeifUtQXaGdtuZEGLSwB+XQ
	0BFuZ6RKal0DT+RXScIKF8WN3M1bjWiN+ZqqudpqFz27RFJ45s8SPCSou9BpO7JMpGOMXb/WUX8xN
	QUumPfp6csgVZI8fFxUALZNikeQBTtKMvk3Z677nfyjbA0jRVHOAwwEvOqOWTc7gZE4x4RWR46U4v
	KaSn6S+aSAF8ukIF9frQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzlO-00GXgX-UE; Fri, 05 Aug 2022 16:01:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeY-00GTc6-HG
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id q30so3671871wra.11
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=O6y0NlSqnXVJ4lrjU7vrgT2qdp78DF3F9tEIqiy3GoU=;
        b=RnJNQynZy/A06iwT22HM4tecWfO4iuM7Nhctff7HuBsLlnR8ZCg8REs8I5nrGuvWzd
         +87NlGx21/Dud8dJCt8z2gUgZvj/3nPueCStmbL1pdu0tnO6s2V73f7lvtnVghRyfrki
         0sa+3AEpjYfgT/ZPknm5dmy2WXvmprpgowCRtSo9Olw4fY4T9xoXXYhAG26AeYsgQDlj
         wNFarxk9iq4vb2BkAQ61sSwpGfGouPFBjhteD4GatJQKX29e1BspvbjJPpfDD1YK67mQ
         9UL5nUKbJbGX+W8xEh0D/fo3BzV0Qu3b9mzg6+Zb9K1dsTbk3oG9MiWq+yyZT8y2fOlq
         DfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=O6y0NlSqnXVJ4lrjU7vrgT2qdp78DF3F9tEIqiy3GoU=;
        b=fh22cp3HtqWGNGflzrdQWwBZs4gI8pbWq4pZ8TB4OUteszlzpM5PZT1r1+plj4q737
         sheT1dzE24E1UfHZpVfSvKtouZDt6RD9mJYh4klclo62p8jO2Nvdqd9ypERKc23rLbzx
         pRBvFezY2KyVKLFUkSfc/cNaspggtNpjskz+CY2KfNW/ukgV3aiWDgQaNBegzF31Jh1L
         GgyU4LdWdaMmTtYHvdst46BnOfdGYVh+2+42qWOFdxvFfDEZv/YrotkdiYAtnjk9GNUk
         g3Azwqxxj7UnO0J99fJk4ICzAs/R5b0J0wNmAlFskl/CLVnDw5rt+/QPYzsVsqXM+6zk
         g8nQ==
X-Gm-Message-State: ACgBeo33ksTH4CzisHiCY3PbPGcZrcciPeagA105N4f4VFUdu4aKUpit
	LKiduCOhx0XYqpHtZzyU86mWVg==
X-Google-Smtp-Source: AA6agR5rYULNQ86qE7XGB5LfgnZor9j132PHMA9QXxeVKpnEoAwIGilzQFeArkbVp3gWr/p8Hqes4A==
X-Received: by 2002:a05:6000:144f:b0:21d:a3cc:a6fa with SMTP id v15-20020a056000144f00b0021da3cca6famr4684061wrx.191.1659714860908;
        Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/5] hw/riscv: virt: fix syscon subnode paths
Date: Fri,  5 Aug 2022 16:54:04 +0100
Message-Id: <20220805155405.1504081-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085422_620397_27CC7851 
X-CRM114-Status: GOOD (  10.23  )
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

The subnodes of the syscon have been added to the incorrect paths.
Rather than add them as subnodes, they were originally added to "/foo"
and a later patch moved them to "/soc/foo". Both are incorrect & they
should have been added as "/soc/test@###/foo" as "/soc/test" is the
syscon node. Fix both the reboot and poweroff subnodes to avoid errors
such as:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..a98b054545 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/soc/test@%lx/reboot",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/soc/test@%lx/poweroff",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
