Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32351C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O22T9C5fhvwyOKk+A9/gw7UnNt1uVYLzupe9amSfkxs=; b=yEJ6Y84ECZCbV2
	CMXThjrWs0sAh94XlI1SOXdnO/a2N3kSsBP5EPE6S1mT4fs+3k5DER/uN3edzNqJDf28EqvX3waTa
	u4qRM5IP5/4/z97Qjzh6vQZVmNjVsk9UukqTQLOjvq2pSgRKgPWLmJyAiHH2sSG7JPFZE7l7oVZI9
	BljRQwPPvHXhMVSL660kulW8b/nRMKCxhZKCxLlFD+u+FWTv32MrNFVznwanhuaGpLm9nIGPk9f/c
	ghd/fqxWu4pej4/axkDT1Im98f0B2wTLnz9/JXDj1twtShTIsI6/5qZqhBc47sxZSs2COPRm2YbyJ
	1ihJfhs93zb+906nAH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSC-00C0p0-Rw; Thu, 20 Oct 2022 07:59:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSA-00C0lw-Pn
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:59:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id h13so19566888pfr.7
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btCTic98t1YLcf0biOQlX60g2ym+aQBextAw5Z0lMQI=;
        b=WP2LfURmJyrrwGBfyjAvVGryktBs5nbOUpVEiVkl2z+GjizmUMXi4YulnzbowoEDH1
         k8jNv7jdbwrjzZJYAYlToDltr3Lfji9Ex3HqaOdrDB+VUJenstDasSBNo7aBmqXMNIwV
         qW2FMI6UIFgnug3vxkbt7Wvkj3JmqL8q+CA+5CfryIMuHdGcW9oEMluFmGkFRh5Ccni3
         1TIJzWetNlbFW2UudoPqZ7zRwA63gCfiW66ZN4VXlFS9o6MBH+wZOKzURU5BGpbvTvO2
         k+vDXHuNEDg/RRcAKs2u58de499p71nqQp4r3XsZuLE+o6FSTIspXkKWxu1jCQCTdZuI
         B5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btCTic98t1YLcf0biOQlX60g2ym+aQBextAw5Z0lMQI=;
        b=iMaqMSlatJEVLRiXa0GjWzb6fUMHK77JUIm9PzDwrWw5Mj1L/gkHalZS8LbYai0dzE
         ye/hdNWVmPpl/cZJuPSHdlCVib7NlaFuXdX/Iyerlt61M33joG+crt0lqdmx5K3hLZyf
         mhODZAOEIqdVCsedtdyYLG3vF4ZqehFuiZUasU0FjJZ2Ahcl0jiJ9gOHs6y1uvJIVgfb
         gNIBkwWhszjn1YSByu4bPoJIHYXiPamP7fIxjKf5AWBhD7pZg0ep5YRdikKQJZx+wGnQ
         yrnFp03Fu1lpED/J33/XcTTGITBSS/A/Fvc7EXKTx1BfIW5dcyVqFxWaI/xhm1pv9D8w
         rXfA==
X-Gm-Message-State: ACrzQf1v7qFAIWujNIN9JDmlJRYaOQMvwbyVnEd/4dWWAhIKqPsustSv
	nsjFIorKlhtpf/AxPy8DYE3RMM7/tmwwbg==
X-Google-Smtp-Source: AMsMyM5fHSIer/wcJYaOMK/yvrfB4UfLK02PnkKnVWsKkPds2h9u0G1U/jwaGe0a1wKkF18A/ybG4w==
X-Received: by 2002:a63:cf48:0:b0:439:7d1c:fedc with SMTP id b8-20020a63cf48000000b004397d1cfedcmr10905620pgj.281.1666252735493;
        Thu, 20 Oct 2022 00:58:55 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.23])
        by smtp.gmail.com with ESMTPSA id h30-20020aa79f5e000000b0052dfe83e19csm13206438pfr.16.2022.10.20.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:58:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 0/4] Add PMEM support for RISC-V
Date: Thu, 20 Oct 2022 13:28:42 +0530
Message-Id: <20221020075846.305576-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_005858_862447_54A6A4EF 
X-CRM114-Status: GOOD (  10.73  )
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

These patches can also be found in riscv_pmem_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Simplify PATCH2 by implementing RISC-V specific arch_memremap_wb()

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
  RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
  RISC-V: Implement arch specific PMEM APIs
  RISC-V: Enable PMEM drivers

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/configs/defconfig        |  1 +
 arch/riscv/include/asm/cacheflush.h |  8 ------
 arch/riscv/include/asm/io.h         |  5 ++++
 arch/riscv/mm/Makefile              |  1 +
 arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
 arch/riscv/mm/pmem.c                | 21 +++++++++++++++
 8 files changed, 67 insertions(+), 49 deletions(-)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
