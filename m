Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6175AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PV5iOk9AlgQ65jp0RYLf+uC8+rjeyKPDn0l57oM8vbQ=; b=AlUE3//EyXPPZ8
	x2AswYEvtE3PW7Vl+umUEeedSJ6LObbZjJq6L1lC2sCTSZPrMTBSi0KpT1fDMP4pD7F10eTlgjrkh
	OPtHOs3Nq9Z8zkSut/f/4stsGC/WudxDsTxbfMOD+obXiQ1EUfO0BaX4eE10/8U8846D97pE/11OF
	NjgVzs4Yd86RiTnxAfiiIjD+YXwr3YgEhYyznQLsJgeaInxkgleOdMPZkd7MPAVX0y5LS12hcYxEt
	HN3QGSCoWV/N7zWVJ/vaOt0llAN24TMp6kNHP7M9ABOndampJIR659DY/vbgGEYPU+NnG8nS5ypv7
	DuLPCisykbALvtykCTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUi-00H6rl-65; Mon, 14 Nov 2022 09:11:08 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPo-00H3b1-Pt
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:06:10 +0000
Received: by mail-ot1-x331.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so6296243otl.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKw1kYqmjYasEn7Y3COewOUZsq0MAu8mFPfBLKwkoSc=;
        b=O9JaNmH2blWNsRYkIQF/AKIekwf42J2n7+hgMUvgMgw6SHjgjwEDFQJj1w/l/keZD8
         +W6MJqzZDlgwdFEKkUb4eIiglnhy0mZbiCltCvR/idsnixQUFq1MFOHxVinExoHjaPYR
         OvZ0I0xj1vuBQG3zMHvLGWQIpnxwHLA54d74P96ijpomxVbppmZxnIzX2FhcptuQcYtz
         xjB5GyV/ZS2RI9W7aP7hRm2y84K+X6Fb6Ru/wm6UQaqd3oSgyCDq2KrEzVaJpeWiCT7H
         P9epcA2se9ZJ4vCBl1/9/PtBcRC87R8FtfZwospjb34v8N3Eb1zIJmf5r/Biz980Lm7G
         AjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKw1kYqmjYasEn7Y3COewOUZsq0MAu8mFPfBLKwkoSc=;
        b=L4ETI93M2BkZdqgEkfplWpuGzhuzhwJ5EPDzRXarhqom4FOLXO1944J9fwaXgBADUy
         QwYtKTnZO0z7T8FbuZBJ4YPbHvmub53AuhSmDMVdDAGxqS9HG1s5/smV8pz/gYWmOOj6
         55xXBbkS5VKcmSKNOLEm9Qsk4N1VP3uP9LEHkwoqJ6AV2b5vZfvs56BcweUButTIJgJT
         kTM4BZbTkwQkNvy2/9wiD4EAeFOp1GM3v755UfL7dNNO062eYCWmWLC/p1/Hq5pPhiLb
         pUxH5NzGYb2vnRHFyJC7atGRj8ApF36LHAbapNn9BJGglcBjRntXKlfWzCrEyifa4a+m
         TwYg==
X-Gm-Message-State: ANoB5pkl0Hk7EyGptoCdxwNDelN1N5pZaK7U+6/Ai3P1VR/F9me2xzwv
	GySW8Sot/GTkxvhSyEoccWbkCw==
X-Google-Smtp-Source: AA0mqf4hsNss0/ZP2F7hDgRFMVLQAV1D2MFi3QBya1k67HNn04mBI2V7miEgbFgtUa5MsT7XD4wfbQ==
X-Received: by 2002:a05:6830:2812:b0:637:1464:cebf with SMTP id w18-20020a056830281200b006371464cebfmr5924869otu.100.1668416762681;
        Mon, 14 Nov 2022 01:06:02 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020aca2402000000b00354948e04e4sm3432939oic.2.2022.11.14.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:06:02 -0800 (PST)
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
Subject: [PATCH v6 0/3] Add PMEM support for RISC-V
Date: Mon, 14 Nov 2022 14:35:33 +0530
Message-Id: <20221114090536.1662624-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010604_913042_7627B79E 
X-CRM114-Status: GOOD (  11.64  )
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

These patches can also be found in riscv_pmem_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased on Linux-6.1-rc5
 - Directly add pmem.o in obj-y of PATCH3
 - Dropped PATCH1 since this is already merged.

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

Anup Patel (3):
  RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
  RISC-V: Implement arch specific PMEM APIs
  RISC-V: Enable PMEM drivers

 arch/riscv/Kconfig           |  1 +
 arch/riscv/configs/defconfig |  1 +
 arch/riscv/include/asm/io.h  |  5 +++++
 arch/riscv/mm/Makefile       |  1 +
 arch/riscv/mm/pmem.c         | 21 +++++++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/mm/pmem.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
