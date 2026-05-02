Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09281CD3423
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OUggnxwcs9GjxsnWS9l3XKPDrvurcScS4PglPWef1qg=; b=2UfmSC1Breq7ED
	636u/Q6+Pi+Hxd7TYk7ZWyAdz2ogReDOJbp51nualgnHGxwjmbzMCtX4egYc4bbVkPQIBgauHJbMU
	+9pbCJXKsdGLwXoY1CVtCxKZ7qx0MkoC6qz1dupzEcEgMcrSpUOO0jXn4K9ebi74jh7ms1JFkbj4j
	eLvJvnwoxdOzXPXdxbJvQQOjnZgdJkGy5dkTjVB67Yq0l+Vce6wZvb0KCeVJ1Cfr+gNC6rHrEqRW4
	jWVLmLfwWk70qE8N/Af3TXcUnSYA37ipjjXPK0k31XnzDN2rwP3dBElsg1/UuRZ+gwHStO+vFmlzr
	Ny39GtZi11MD7slkH5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJCoC-00000009HoP-2FgP;
	Sat, 02 May 2026 16:03:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJCoA-00000009Ho0-22EQ
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 16:03:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so2173480f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777737788; x=1778342588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RnnlpxRAAVenGzRkq3KQrqAZUEgtZiX35l3RHofXdX8=;
        b=F26xXNAhfEEsuXJlEvdtyk/RwqB04y5Mv6q+0NUgsgUD11cPl85uwqVL8Q/AjtgwPM
         3d45+D3jmYBcP08NeUT3jlxcEZd4hwJ8wYUSM9KAXHvr42gdDmUZsjX4hrbT9co43SLJ
         NFsoMESx0u8Qau/3DomkGLpphfmTXy5k8wbayttxKPu0tahEbExHUUGlvJf3Kqs2XBEL
         P48YczyUWpm1/zKaa9eiTTyP8kL6OKmfc7zGZFScdTV9F0DW3T0Z1W5tQW2uPWOsVlyV
         mcxRY7HIF1q4GF4cp138Jbn7boD2rAVW7k4RD4FpDbvjjYKadFGFDh15TaMBJg9BEVaq
         StFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777737788; x=1778342588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnnlpxRAAVenGzRkq3KQrqAZUEgtZiX35l3RHofXdX8=;
        b=fY4I/F0fdOIhhjAqVmm7Mdf1zTgV5NPvxbstDaPx/fx6wNQLasmXhk6oTZ/YVsoSBO
         lX8AatWhu8LEKnQEByO5LeVKQh3gC3mic3vnBhCxqj/lujkFBjFsciyTakAHOoC1xZVY
         2dQpTQFitR8+zmLDOvtwVf9qb3nvd5Qx/S8WkziAGPuWEqGd3me5ttauz50NlsqR5JZR
         66t8ehzcw1OsiULGkY+mpRtQI6o9hoQyf3h9H7SLslVEjynS3CXkXc3Ocn1k5eK3qacT
         8NWBGxci8JWCkydAK8bNeya1zb61nT2S4yhmaKYyoSffAlOnNPM/LX6YCcJVYSAhWxnt
         NdqQ==
X-Gm-Message-State: AOJu0YzB/q8XRntKiH6ZU461mCaUrRhOoUUl4mrfzZF3emTWFapW1xwu
	TckuXaZMtxDOjWXLI2A975UfFDcffKeAi5cy9//Oj/kYwnqfycFCgOGd
X-Gm-Gg: AeBDietoH+dJGmRj4paZLMYbxmq4kr7tEHmN1tZ6SNnyUtU3FjA7QhTt1QqyDJhXg5S
	iwpAKNGBV+kyuCA/ZjpV1+A722qr9UAZW3SSInl6E8fezZRyKQBcIFwfag1K2uAfGTDJexwTp5L
	kQ+o6/8FnEJ36ORTD1e6DQc5pUjDW13mvXHvVrklkuzJwhJciS5D7YwvGaRfPSKA7LtgFP/kfAU
	EUL5sFaclMmClIfSNUn0ypPCBMdAGU6wkxAIMuiyzUxY+d6ZTJCBPcZAODh94sF0Rh1+suDAiTS
	xGk06J7r97oewjvEDIfxoAqUbhzkp87ouPjLV5XWfqWGXym/KJwXvF8nB/AoeLkelBa46mD8QXP
	UiO3nWDEVOEqLt+5/2idPNqkrE79fVFkg0/nCNV/9lw7mi7iLppp01hOAfL0WWHwc4YknFTf7oA
	wpjjXJ+wBa8OmgP49OzdwaI8luh8X1xcqeYhSg6Su79USgoiTRLaVXB+8w2X6tWnynZn8LcYGs
X-Received: by 2002:a05:6000:4287:b0:447:55b5:d532 with SMTP id ffacd0b85a97d-44bb6ab10c1mr5689376f8f.37.1777737787879;
        Sat, 02 May 2026 09:03:07 -0700 (PDT)
Received: from ST.. ([196.221.137.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef45sm13189611f8f.32.2026.05.02.09.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:03:07 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] riscv: cpuinfo: Fix NULL dereference and inconsistent error code
Date: Sat,  2 May 2026 19:02:57 +0300
Message-Id: <20260502160301.453029-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_090310_540768_61F5620F 
X-CRM114-Status: GOOD (  11.26  )
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

Fix a potential NULL pointer dereference in c_show() by ensuring
the device tree node returned by of_get_cpu_node() is checked before use.

Also replace a non-standard return value (-1) in
riscv_of_parent_hartid() with -ENODEV to follow Linux kernel
conventions for "not found" error returns.

Both issues improve robustness and consistency with existing RISC-V CPU info handling code.
---
 arch/riscv/kernel/cpu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..e0bc7526861f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -135,7 +135,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 		}
 	}
 
-	return -1;
+	return -ENODEV;
 }
 
 unsigned long __init riscv_get_marchid(void)
@@ -348,12 +348,13 @@ static int c_show(struct seq_file *m, void *v)
 
 	if (acpi_disabled) {
 		node = of_get_cpu_node(cpu_id, NULL);
+		if (node) {
+			if (!of_property_read_string(node, "compatible", &compat) &&
+				strcmp(compat, "riscv"))
+				seq_printf(m, "uarch\t\t: %s\n", compat);
 
-		if (!of_property_read_string(node, "compatible", &compat) &&
-		    strcmp(compat, "riscv"))
-			seq_printf(m, "uarch\t\t: %s\n", compat);
-
-		of_node_put(node);
+			of_node_put(node);
+		}
 	}
 
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
