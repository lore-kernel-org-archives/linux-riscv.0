Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE06C07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 03:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9581360E0C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 03:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9581360E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gUTqxzN+KVUt/8cZ3x1UO7VKdPQMh6cKlSwqNJaadoU=; b=vund6YEvqvu4AA
	5n5ClT7IR02JyfSxx90YywdWZ+hJhjhnnjf7tAH20Vb8BbTws4588OegnTsQnBt1sC7d6eLQTFoj1
	/4JOeGju+BpPbj5k1flXHeJxB2Jm2CipnTV7PhBiOc6Z3U+/MnznF3upbETEmsFr51Ywi6LWR16xY
	TAb0JHIdhpe9F7ZeeDhIibb7e9ZPhtmzqteLwf8o0rB2AOYUmR0ZKHJFR+By9ho8YROc/4y181eQW
	+cyWKG5sIYeKlCd6x9gcuLBRVVpNTtURrL8lbAlXPjUopGPMGN+6qMHtCvThOyJg4ozSV7mkezidW
	NYlZp89HaA//VL94Fx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m634t-00EPAe-5R; Wed, 21 Jul 2021 03:39:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m634p-00EPAK-LQ
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 03:39:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id m83so1255548pfd.0
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 20:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Angp4bCEKP4cgVmU44JkEQ57AHq9jYVme9mNnOm6/+w=;
 b=QeC2S6bOpZk/WfkRE0Wt7dqgRkXq51W6EywqHTmUjQJ1cfCVipM5I3p+JXItgqZ9SO
 5x96mT+K93wU1mQ8w1l/a4ced5rAQuq1MA7bHKrVWIwTnGrIkyMcAa3BOrGzPwFRYI7Y
 I9d5gtZ4dcwo92Hy7hv0+cJN9UB+HuEsVngp0iLaPgQS245t8MFBOMbQvFWPpT8Lf0Fa
 OK/8WZjeQPKGA2vr1Ia24nyBxNjMG+uJecQkhl8Gq5HCdTYxcKH9OCnipbzs4rmYw4OT
 nRe40IJFGNrZtZ/7mTcMgP67qS1oHPXf5PKo9KlzvawNluHJz4xFVWNxFQn3aUcEXNq4
 M5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Angp4bCEKP4cgVmU44JkEQ57AHq9jYVme9mNnOm6/+w=;
 b=NRq1Jg4iHwgfqkUsqTg1vU2RnpGQyWphhPm5Jg0uE4HZ24MQl1l0PScThsWuQe9Deb
 RAjPYKa19syNCP46svF+C4HKcvLFLcLYtSjwz+abjJSAHF6mi6XS9rGNJ9k4JapIno5/
 VzqyrI+kO9paQ8GiErzFQCttgs0W9Xr/sCD8O4c0VtpE/sujTKHgkb3vWhKUotc/cgRt
 yvl0G1YzglbY6PBRe7tTNOJpjj4ufxM+ZVwdHZrz75igGw1MXXQuNX2MHkAoL653XQyF
 gzN+mvP4vwCA5Xxa5NzPVeDwTFK2Qt3Rw0OHThW/oCrh1HezxzzB4QsvQbi78BAbeB2Y
 Fnpw==
X-Gm-Message-State: AOAM531ir/AQibCKTZScIPO4/njK/9bAS0xtK4IpqofKbjuUXJ6M3YyZ
 12EF8Hhm7u9gg64DdOoXj1msfLvaZnT+Og==
X-Google-Smtp-Source: ABdhPJz5y2/TNVVkkwyuBlTFZfYfz4sAV6+7c8Gi/RsD/3FitI/a8X3Y+YG76Izk4E+gk14vuZNM5Q==
X-Received: by 2002:aa7:9626:0:b029:32a:f13b:7ab3 with SMTP id
 r6-20020aa796260000b029032af13b7ab3mr34685878pfg.43.1626838756743; 
 Tue, 20 Jul 2021 20:39:16 -0700 (PDT)
Received: from localhost.localdomain (36-227-235-179.dynamic-ip.hinet.net.
 [36.227.235.179])
 by smtp.gmail.com with ESMTPSA id 198sm25635151pfw.21.2021.07.20.20.39.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Jul 2021 20:39:16 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vincent.chen@sifive.com
Subject: [PATCH v2] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI is
 enabled
Date: Wed, 21 Jul 2021 11:39:12 +0800
Message-Id: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_203919_753454_01B8615D 
X-CRM114-Status: GOOD (  18.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
enables a device to generate an interrupt using an inbound Memory Write
on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
needs support from the PCI controller or generic interrupt controller and
the corresponding software driver.

The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
may not have any function to deal with the MSI from PCI devices. When this
case happens, it leads to the following warning message displayed in
booting a v5.10~v5.12 kernel.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at include/linux/msi.h:219 __pci_enable_msix_range+0x4b6/0x50e
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.34 #76
epc: ffffffe0004fa1e0 ra : ffffffe0004fa02e sp : ffffffe07fea7920
 gp : ffffffe0010e25c0 tp : ffffffe07fea8000 t0 : ffffffe0808c3180
 t1 : ffffffd000239000 t2 : 0000000000000400 s0 : ffffffe07fea79e0
 s1 : ffffffe080803000 a0 : 0000000000000000 a1 : ffffffe080803210
 a2 : ffffffe0808c30c0 a3 : 0000000000000101 a4 : ffffffe0808c30c0
 a5 : 0000000000000010 a6 : ffffffe0004dcf98 a7 : ffffffe07fe0f010
 s2 : 0000000000000002 s3 : 0000000000000014 s4 : 0000000000000000
 s5 : ffffffe080803210 s6 : 0000000000000000 s7 : ffffffe0808c3120
 s8 : ffffffe0808c30c0 s9 : 0000000000000000 s10: 0000000000000002
 s11: ffffffe0808030b0 t3 : 0000000000001000 t4 : 0000000000001000
 t5 : ffffffd040239000 t6 : ffffffe07ff8b2c0
status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003

A simple reproduce way is to use defconfig to configure the 64-bit riscv
v5.10 ~ v5.12 kernel but disable CONFIG_PCIE_XILINX, and then booting this
kernel on the QEMU virt platform with virtio-mouse-pci.

ARM's implementation may be a good sample for this case. Its Kconfig file
does not select CONFIG_PCI_MSI. Instead, It makes the selection of
CONFIG_PCI_MSI depends on the capability of the interrupt controller. This
way seems to be more straightforward. Therefore, this patch follows the
same way to remove the dependency between CONFIG_PCI and CONFIG_PCI_MSI
from Kconfig, which allows users to enable or disable CONFIG_PCI_MSI
according to the capabilities of the platform.

Fixes: eb01d42a7778 ("PCI: consolidate PCI config entry in drivers/pci")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 469a70bd8da6..563d550cb682 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -97,7 +97,6 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
-	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SPARSE_IRQ
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
