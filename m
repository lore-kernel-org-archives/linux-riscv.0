Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8C3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE3F61381
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CE3F61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO+zTh/zC0ZxobtWB1xCknm0XG2v9G2jgElK2LJNzt4=; b=pStlfgDTyHGg2+
	XNA5o9OJIxrI7mScWJ3l6gdKqnSvZvBsZidwa1Yo1LM/qeHuHbC7+xpBK6VSz0K7rRIStme+fxO53
	iFTYgU7cOkOiurIC0fwMZGOwPM/geFvWGiuoJv/Ycb7bUTSsNCust/ZkPAfIHBnQqz6tGQfQ281RD
	mQpZhFx0yHYO6SVhvOdqzmeT6ceBpPbm7HkktojGrgYyHGaXBW0v3+QE2HphginVU+SiahShNxPfw
	2me78rEUiob2A5mktjEE+apu49iGhho0w/s+UzW26SBNf20MJZu6v2PU5UmR3wW53+qSVpxwFTOLe
	qPBgcDp0j19cfpFnpuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb62-00BSmV-Uv; Wed, 29 Sep 2021 15:02:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb5i-00BSZw-W0
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 15:01:52 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2C9A940264
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927709;
 bh=ZHeeeZbiilEHhtw/jMIzJY6AU5jy7F+74b86hE2E++U=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=rfqJGFmkfNS3ZpZYQMuDIHCpXyI/BlSP+DyqdQkvdGUUeZ7VtNvD6rbKQSEroH2bZ
 qST16xcQtM5R0QvL0Dp8Tq1NbtLuMhnESEL3nZYn9juEMHDsu348HdjI5hZqJxvFuD
 fjD7fbAzxga3mENYOdaRwr/mXSZZFBn3jfNUTHCb/IkGjxjSLyIoMRfY9HGAFXrnxw
 jmQkENNrs6CHZEccSD5WB0QZ0ZC0NJyp7va4uji3xle7/vOP0Mk27Q5D5AxKhVt9g3
 dlvWv8kef6yAfIi/qVJm1j9nD3I1/zGGtJMC+R+rbd6HEC6YfvBHer9A5zheOdprr2
 ajkolqGoVbZvg==
Received: by mail-wm1-f70.google.com with SMTP id
 y76-20020a1c7d4f000000b0030cf1eaf5cbso18558wmc.0
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 08:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZHeeeZbiilEHhtw/jMIzJY6AU5jy7F+74b86hE2E++U=;
 b=d9JYwYKVLv1VKQ+cQij/889GdhgYAHm729qRX2YxiLVoTYrOiK+MXZHKuY6VJkXTVD
 iXS6fcjPw2Pcb9kdT4S8M6gL8FP/mMbyH5Z6hNd/YYzPBpwJloAUaBl0cB0yF0NCJ1OY
 mfAxnaDcoZcY5heaQbFBzm5rH/Z4WEeKZrWLyVKOSXUVOBwz0joFkIJ+fgp21mGeB56F
 8UUvqbyG5Sew18lspq5C6Elnmx09lTtf61vbcX9eRa2xZdy9BVnng258KgTEpl7vskMK
 opMkyjyHw2rRD6cyrL1e5Bvls4dO/mU0yZS0WcLzprMQnkxVrCQrilCpQWEyi9AlQ8bU
 vzsg==
X-Gm-Message-State: AOAM5338HhHTGmy8qoUH/UQ46tX6MQm19NufBUDjJifJ17AwB0PCq8KF
 igZLelL0Un+PY6u5STc3Bp4ILznXF2xOSMcuI6UzsP5lHOeOz20m6+9jjzdP4iDVoRnKhrA68h+
 zv23qJtSzVe1gOS387fYSD/sHbEB+r7W5DNn5klth8pEU5w==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr377152wry.292.1632927708050; 
 Wed, 29 Sep 2021 08:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9V/fnO21N7p3bEFVhHIvHS/0Ily74/OnTsvsnaHKo/n2patag3dfQoebfGKaZ+3ZNnDo6Og==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr377109wry.292.1632927707834; 
 Wed, 29 Sep 2021 08:01:47 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id h18sm133008wrs.75.2021.09.29.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 08:01:47 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 10/10] riscv: Allow user to downgrade to sv39 when hw
 supports sv48
Date: Wed, 29 Sep 2021 16:51:13 +0200
Message-Id: <20210929145113.1935778-11-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_080151_274439_70CBF43D 
X-CRM114-Status: GOOD (  17.38  )
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

This is made possible by using the mmu-type property of the cpu node of
the device tree.

By default, the kernel will boot with 4-level page table if the hw supports
it but it can be interesting for the user to select 3-level page table as
it is less memory consuming and faster since it requires less memory
accesses in case of a TLB miss.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a304f2b3c178..676635f5d98a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -641,10 +641,31 @@ static void __init disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-static __init void set_satp_mode(void)
+static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd;
+	int cpus_node;
+
+	/* Check if the user asked for sv39 explicitly in the device tree */
+	cpus_node = fdt_path_offset((void *)dtb_pa, "/cpus");
+	if (cpus_node >= 0) {
+		int node;
+
+		fdt_for_each_subnode(node, (void *)dtb_pa, cpus_node) {
+			const char *mmu_type = fdt_getprop((void *)dtb_pa, node,
+					"mmu-type", NULL);
+			if (!mmu_type)
+				continue;
+
+			if (!strcmp(mmu_type, "riscv,sv39")) {
+				disable_pgtable_l4();
+				return;
+			}
+
+			break;
+		}
+	}
 
 	set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	create_pgd_mapping(early_pg_dir,
@@ -802,7 +823,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
-	set_satp_mode();
+	set_satp_mode(dtb_pa);
 #endif
 
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
