Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B860EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SP7/XBPNzhVpydtJTv3JyKiaSenbDnSmhsPw4gLBC0g=; b=Bgbwk3D//WNSfY
	kWLDjgQ37KtwqP9SBvtRrhTLX8PKAXhFLhggZtoagDZVy5sMS9f7xh0hov5XMuH/Ixk0OcG5hooar
	hEoyYrFlOkW3OXBSjlZxDE8I7f78RhG4EbstCPbkgYKxrdqd/hoa8JQvI4UQ8RZqPp3Pisjcl1siR
	Z+Mrj0Suy2w5imE9SKWDfNIxEhWSp3U1GBz36uLbiwga7pkU+jpfVWUXV1VEwYmkPbxw+VBtl+H2D
	CsbZ3xNNSe6RQ4Xs6FZR6PX1eSsvvBxb6w7m+lY1awDGFo2TBsgMdntJI+c6tjVwGrTNJ5GQh9oDF
	lQLc+nBZuOHtVJr6il0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyC40-007dwY-01;
	Wed, 01 Nov 2023 14:19:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyC3u-007dw6-0I
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 14:19:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so560061f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698848349; x=1699453149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7sUY012ol+tpFBYhNx0IAVwQvzfBB5k8/icUigIF3M=;
        b=l8jqGE8R6NTzz6rde+v/7EbbBol/WrMonW9RF9j3NWg5vkHjD2ruCGrSCg1/T65ae8
         1KWeY2P5wEX+Ik7Iwn8m8BGOG8rOc7wrBzvsM2fwQzJ3u+tbIwQ12EoGwlaDOgPOjv2p
         q8VLLqt+eRCzKxlyGonmmK5RwVFuDx2ceU5T/p2TvZOYICieiiK17fXP333U+mQRUVG7
         ITszJukdnAU7XCl2waf6Qm1nbOYIDsD9VHAAcDrkC2Gn49So8xPY7CUYd++A0gguPo7H
         n+3Ib4f7L5kajREsn8TqXawffdOmdbbRajeuKTJdsCWY2clRdvr+LPpyU+044rnTbHK8
         rhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698848349; x=1699453149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7sUY012ol+tpFBYhNx0IAVwQvzfBB5k8/icUigIF3M=;
        b=TkWv0T1ydcidSk4OoWDAr7SEkPqTU5Rg2iU3N5AaOzFzmo28mOAwAKarJW7un7xkD6
         NRBUKCTftx+H3F2Da2DZMDxbq318/N1oUshdr0fXjRBkfAHknS5N7WfZSmuWnP4ZGLT7
         CsMNTpZRfIFO9u53LwOp/XRfwT5rVIYyr0NI88x2VUQ1IvEMlFni6fPUTD83np/4agxZ
         5YhnVPuiOAWVcM4AM8+b5P71xCYk3HRwmp4vtSDk/86j43ZMc5+qtODAacgbyIPuAAF2
         hQaIfxVmUXhy8PVea4zOfKOG5UBLkyhzOgcRaE77khXtcfZUxzBkekAy4DhWjsj8wbD4
         RJhg==
X-Gm-Message-State: AOJu0YzFOsOjoNhZ9UycWfqslIv785QIZPf4COychIrjS9r6pw2TmJ7b
	+aJLWo7E1eblbbxpN/Q1qCkrB3LiQFML87LsEkc=
X-Google-Smtp-Source: AGHT+IEk8Gf8aOFnzbuQNUsYsOIbSdHjmgM0OJELLFxdcxaaVUQzglcby5rqNqqp7YikkFMs5tbqHg==
X-Received: by 2002:adf:da43:0:b0:32f:88f9:ba44 with SMTP id r3-20020adfda43000000b0032f88f9ba44mr2471272wrl.25.1698848349459;
        Wed, 01 Nov 2023 07:19:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hj19-20020a05600c529300b00407460234f9sm1657518wmb.21.2023.11.01.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:19:09 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	Anup Patel <apatel@ventanamicro.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] RISC-V: hwprobe: Always use u64 for extension bits
Date: Wed,  1 Nov 2023 15:19:09 +0100
Message-ID: <20231101141908.192198-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_071914_155995_258B08B4 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Extensions are getting added quickly and their hwprobe bits will soon
exceed 31 (which pair values accommodate, since they're of type u64).
However, in one tree, where a bunch of extensions got merged prior to
zicboz, zicboz already got pushed to bit 32. Pushing it exposed a
32-bit compilation bug, since unsigned long was used instead of u64.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310311801.hxduISrr-lkp@intel.com/
Fixes: 9c7646d5ffd2 ("RISC-V: hwprobe: Expose Zicboz extension and its block size")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/sys_riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index c712037dbe10..a2ca5b7756a5 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -169,7 +169,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
