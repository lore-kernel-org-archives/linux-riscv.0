Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E19AC25B07
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSSx7MqWfitwOutLNHK0H8FnmUxEw2TIkAWVz5yP39o=; b=X0zJQf5ppwd7VR
	T12bhwOgn4QBhMW9tiPtDqpHT73eRhFNADaJl0zk5rjOaQVTAiB2U2QQ8CbWSUiB/vfAUlLOEowkg
	BCc9RwCXeNOqDztUHIcSb+0yCpDyGwnwjCOKvLz2bKLuudvQTcS0XA6g/GjHXLLQk60PMECBPClB4
	SwMWgB4mfrl2cT2X0tuTOGGtsPAkgTSrwIWL5tEQbtrnTep7Fb66G18olnrsGTKdU5kxbxqGIsxNf
	Nj3aceEllUP/qrB48HyNEfjJvfPn9OAYIr4p+Xdz8y0Pb4q7D/fE3yl4mfIJU/1jkxt0h2aO31uyY
	3iox8s6gPAKiVz8qxhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqis-00DrD7-QY; Wed, 10 Aug 2022 18:46:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLqij-00Dr6b-NU
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 18:46:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id z17so18724970wrq.4
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
        b=JCziDnpU8rCiA8ClzY/qKpkzwNSWGcUrRt8hBWMXdKyFhGK2L0StNyBrEujci74qL2
         0nW44P7962pD7aiCmXLxKgF0Y17J/doJaV1eFIlWyufOIdrqEGGVl94W9BbZO0kwQXRY
         LjdXlJKRmQZat78f15w4ni+6mcdd7NGoByc4ij86QBARZPGaG4N3Tou3Y1nBCaR3/Ejw
         sWmFKisjiPAP4SFIJvlFkZeIXzbCFCh/13miY5D6s611Asz41glRIYYAZf3yjNqm1QwV
         5sS1wIvdTJAVr6T8NaA053f76PwfV9gj6sMc1GhOsCLQdMZrkLn2Wwb1YodCLL1zB+re
         R5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
        b=JBsPrq3VdHP96YMExksCzpSNVJciGg5nF7i+MyweCfR+jie1QOPFnh39NCI9+CBswq
         8tKCV/wqwf+CZ5JRhcXKTeNbvvt7RDW9UbU4oE1utSFOWjvebtMl9DYPw3N9WVmIZlHS
         tMBvaot73QqEu3nX8kCDyDmkd1Nr9EK4vKP4Md2A7Mlr7gjT4twf2dIFTPLngBLmFLrO
         Em02zcrqY2nLCWdHCoAq5AHxnEzJPKxkLUjgKyACAhI07wkgDQJM3HEZTquhBm3Bw7sl
         29hm2yJSkkymLWZ09geV+T/dgLCLrBZ5Oe9dm3qCJiTYpDT+mXSVNi+FuB3kZXuYXygr
         eJjg==
X-Gm-Message-State: ACgBeo36UmNGS44JgMaHfpo+9koAHH/nuw+m++09SvQM2E4oUEmVjxLW
	VDOGfnUixN417SpbRFFuX6+bSw==
X-Google-Smtp-Source: AA6agR7TAaQQe6nfKejnLpfRfrSOf3iJHZk7un51nw1xco6YVF1eMQV4AjOpJBkFg0N8+VJaIdPvNQ==
X-Received: by 2002:a5d:504b:0:b0:220:7ae9:d7df with SMTP id h11-20020a5d504b000000b002207ae9d7dfmr17470381wrt.465.1660157179375;
        Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
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
Subject: [PATCH v3 4/4] hw/core: fix platform bus node name
Date: Wed, 10 Aug 2022 19:46:12 +0100
Message-Id: <20220810184612.157317-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_114621_789205_D449EE34 
X-CRM114-Status: GOOD (  10.99  )
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

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
