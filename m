Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C27C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f07NfGIjwvkcUMAVma7GkWIbuTW4BOGW+k96d1sYy9g=; b=3uDp6cNtNt3nHN
	Q8xM+Ar1TtW6bcQdpZpXpmFfmITG3D5RYOervDaQxHPB/zYINO8EA5QNmcG/XwLNu2geGoAK5qKln
	kyDMHIlFQOqql13p4qMAquUkd35g+71gwZRypbrH5UK5a84kW+T4EJPFPla/7PtGdVpJhooG7BTCO
	ytQIBQVgyOVS1vcKfTuFS82BDbgOkJPAAi59cIqXeUCisVLiR+yXdOLsLh1WkHMluWbNhohlng9Nb
	ShDqZVNq10TjeAJaGO5WvK6St97GL2oUAwmv0v2W51Cq76PTOP++Wo5Ic20/+9lth/l+GCRiu8wOY
	limwzNcp2Qnx0YI7Gllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rH-0023kA-2f; Wed, 19 Oct 2022 13:11:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rD-0023hM-Rf
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:11:41 +0000
Received: by mail-pj1-x102f.google.com with SMTP id gf8so16844125pjb.5
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWjBfacUm2GoxWBQ/vmD99Tjjb4/op+CT9vp/T4pxWI=;
        b=eIBMtWthlAeYDvmoJsyh0OIJsFoA/+tcZn16Z1W42D7671Bz3D98zZi+I48MNGYIO2
         sfIU8cb8fbF3zDc7KhsQNfO4LsmP58uygqFUsC6j4lC5pA192KzRUTeSmPARUhtVwF4Q
         /Mm/cSJ5T384ozqK9Qef+ooZOKzLQR0nKFGlFv25hmkbCkyowuP2IjD2AiMNnn3Q6Ft/
         OK4vNMLwKT9o/5QsjEaJ/yn6aL3aQS6DnLbo3+A+Yp18fkUf/4pvD67SmnP8mwR/IUGG
         OsM/VnbtmtOLL+oiU45LFjoAdXh8scIoYryq+6XQ1dqjlFb9A/AdN+kCngeiUIqiqhco
         HKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWjBfacUm2GoxWBQ/vmD99Tjjb4/op+CT9vp/T4pxWI=;
        b=tM3RNMO8uSzmBwEgDtK/BkBqsosoYn2OTRJL+Nt5H4YkGEruL8l67AUg2sgWJREK64
         XIty3CV7XggqFkBmwkqeOqL/4xHNvpcrTooOly069W17kY+T0W80M0d2aRVqiOgrIs+G
         0KFeOiG0zh+JPGJ86KrZ//wHTiinbI6jI5pbvWemqq1KlFgvcVU6MS2FC0h7s8fwqyLp
         4hXfkAKlBVGH61NlcmL/IudbxTJxG12CJ/9Am9FJsULZjnRapvQy8H22NMtNzptT8Qxc
         mUfG12biLAeeMXveLI8zB4TKuVqPs80ZmGygsDafr3Xx4RIA0p5h1BLlg56VUdylqIF6
         Wkig==
X-Gm-Message-State: ACrzQf07QKnw5wLKTEjGUnmpYfTcFgDxnF77EVETvASmk9rDn7sNfW78
	9kNHUUSOw+Bb0hHET4ko+nBaGAn8FRs7cA==
X-Google-Smtp-Source: AMsMyM6yOBDpeWz5bKxvbDSGQeEIk4lLHBWXPdRB1MHshgvJm/FiLJyi8uMbRoqc1Gm5c01k23U39A==
X-Received: by 2002:a17:90b:3a86:b0:20d:616f:4bb6 with SMTP id om6-20020a17090b3a8600b0020d616f4bb6mr45991309pjb.238.1666185097752;
        Wed, 19 Oct 2022 06:11:37 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b00172897952a0sm10934478plc.283.2022.10.19.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:11:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/4] Add PMEM support for RISC-V
Date: Wed, 19 Oct 2022 18:41:24 +0530
Message-Id: <20221019131128.237026-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061139_912338_88DDA9D8 
X-CRM114-Status: GOOD (  11.46  )
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

The Linux NVDIMM PEM drivers require arch support to map and access the
persistent memory device. This series adds RISC-V PMEM support using
recently added Svpbmt and Zicbom support.

First two patches are fixes and remaining two patches add the required
PMEM support for Linux RISC-V.

These patches can also be found in riscv_pmem_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Pickup correct version of Drew's patch as PATCH1

Changes since v2:
 - Rebased on Linux-6.1-rc1
 - Replaced PATCH1 with the patch proposed by Drew

Changes since v1:
 - Fix error reported by test bot
   https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/

Andrew Jones (1):
  RISC-V: Fix compilation without RISCV_ISA_ZICBOM

Anup Patel (3):
  RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
  RISC-V: Implement arch specific PMEM APIs
  RISC-V: Enable PMEM drivers

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/configs/defconfig        |  1 +
 arch/riscv/include/asm/cacheflush.h |  8 ------
 arch/riscv/include/asm/io.h         | 10 +++++++
 arch/riscv/include/asm/pgtable.h    |  2 ++
 arch/riscv/mm/Makefile              |  1 +
 arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
 arch/riscv/mm/pmem.c                | 21 +++++++++++++++
 9 files changed, 74 insertions(+), 49 deletions(-)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
