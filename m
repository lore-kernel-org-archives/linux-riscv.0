Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF9AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WbBJ2eOQHVfWAzO16vn3Unf+Nj/32DU2h09HOKTh038=; b=zLgJWvV5ojosbT
	Y0yLA7sB2ftMkJvQeFki4qjN2swZgM4TDOSUscWOiVuaqx29LwAd5uZnS/Joh/wnaYxVLddGfi4X/
	wnU1vbvf16DmO3PkvvvyPeQqf1T1Of+OWlmfRo66yq/59y5aWog7XSWwfqlTcxttxQPKSXg9p5XTI
	c3Kngt4nmi7GQz1ezMNGx3uEvi32j7ZXthOxof5BKB1qzOm2BG7RUWwuZg6kqLWYQ0at6Zm8v0DKP
	mt58XfWVFyIuomudJjFTj3nuPdyePXS8JLcP2Z2xuTXSP6/eennNRGR/qkIRMSuE4hoPQdKMfRMuS
	eio1oaSeiFTERAmdrNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol81l-001NUA-W4; Wed, 19 Oct 2022 12:18:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol81i-001NKG-7z
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:18:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id h2so9721500plb.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llwNEBSWfDR2F4LeCd9ZXwYAAh5P7iVgSJnKoSyLXKI=;
        b=YLmP0/KBj9Q2FCXfeclwl/X/y8N/avRXarErHiKhsmHKs8OUzXXtB3/6YI0k/hfDjo
         pObxpRk4EqBvcfMTKQXuNs3albxd4v8jsrF0IX/quotd9+CwAgXT0rtFHD2TeqfFDEhi
         2R+azEJW7z2721AlV1g3cvfsDy+P87TPBMk97Tw5PiH01xnfThwKQHDFHrx2WGiUAxI2
         j+BYN7ilaORt/IHeTSTo5xEwu36ef87s71VFYwjLIQxIg/KZGbh8HTfQd19KleDGhTJS
         ui7cRbRZ3EiA8kaJlmAiRYPjONjwQ/8nMFF3WWl36ONscRtwT8PuoVuHrP3yTFrtBK5T
         qKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llwNEBSWfDR2F4LeCd9ZXwYAAh5P7iVgSJnKoSyLXKI=;
        b=jkLHT7/WAKSeJJWcx9CVKUXDSSxfvnySPfkejqoJfkAIGYEFrPCh7h7ZwS4NjQmlcX
         j7fNOQlwZ5SeBaJD3G1hkraml31vvJgzr8Z7Anz3XT7N+rTov4Q8PdV+sNbb4go4gPJp
         6TmtWAJmJ3X6O3YtY5upIQurCtwDSJvJxgltGU9itW+cDPFMOuYqHfpROjP2v5WfPcFL
         CTzSd8XPUF1K4b9yZe5szQtLjTAKZ3b6DEoeQSEQke2y2fk9SzuGgCB1vOqAJ1pDv5xL
         MLIClnvlrvSjoK1gS3SmPFZKIHnL8GKYIeCOGWq28Dh98Ge5WXtxJCb6EjobU7QJLKtM
         xGYw==
X-Gm-Message-State: ACrzQf1VvrAmqJ0aTrqfVQzRi94lO577ZMGRaN51FDfAxZsUnRhQeicC
	P/4+XtM8fOJQXGwn4zRFxZtZz45kfKs5kA==
X-Google-Smtp-Source: AMsMyM62HomAhFnG0yZwJ0nc3YwJPIAXboVv2EvWDhNAclvdiPK4S0zmuUuXsI7d4EkH0rnjg3IKbA==
X-Received: by 2002:a17:903:1105:b0:178:ae31:aad with SMTP id n5-20020a170903110500b00178ae310aadmr8114123plh.3.1666181804916;
        Wed, 19 Oct 2022 05:16:44 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017e93c158d7sm10529824pla.214.2022.10.19.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:16:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/4] Add PMEM support for RISC-V
Date: Wed, 19 Oct 2022 17:46:18 +0530
Message-Id: <20221019121622.179024-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_051826_300373_A7DF41AA 
X-CRM114-Status: GOOD (  11.12  )
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

These patches can also be found in riscv_pmem_v3 branch at:
https://github.com/avpatel/linux.git

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

 arch/riscv/Kconfig               |  1 +
 arch/riscv/configs/defconfig     |  1 +
 arch/riscv/include/asm/io.h      | 10 ++++++++
 arch/riscv/include/asm/pgtable.h |  2 ++
 arch/riscv/mm/Makefile           |  1 +
 arch/riscv/mm/cacheflush.c       | 41 ++++++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c  | 41 --------------------------------
 arch/riscv/mm/pmem.c             | 21 ++++++++++++++++
 8 files changed, 77 insertions(+), 41 deletions(-)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
