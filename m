Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE14DEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYz0PLnbgZudc3R2MmUQuwzSgczembvdo73Tt3dOTSA=; b=J6m4CcN1kEnCqD
	PnQ3B4bFyQFJr/UiY3fLCPhgQfE4+75PlDe2Iw3T9ADJ7h8FOkQKbVv+Ph4amNPFAUvHVwK6HzLs3
	EPUcg+FUQFgSmI8gYB+6uyNpHH1sNzmb3gSzJONu/iDKxiwIFyfIHjiEttM0pzCV9cCjArcaZbVyF
	mtLG7c4fR4RoZbMjtzSs5mG/RhkRlui1TbfAzXPi0AETLMQi5n349rv+V9er3VogjEK9AjqoD23mW
	D+a3Zol5v9pB5B8tnXmLa8AjMJf8JFq1GUllCEdzFcEtOqPGPtUugizsDf/PNglOkOBQBCYxcguww
	L3U2Op9H3AO32KG15XrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA314-00H2vk-21;
	Fri, 16 Jun 2023 06:33:02 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA312-00H2vE-0G
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 06:33:01 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39cc64e4a44so347246b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686897178; x=1689489178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEiGxc0bcdVFmhzsmXnMFSNPzbdJ2fxyVgUq2gtSOwE=;
        b=ZEUbV1U8ywhzF6zZSbsVdixkSlHUxOenMtDi96SPl0SdnGOIaDTE0g5g8UT1RY2pTq
         FB2t+uIWA58e9GImiWa095pOZ3OeSoinzAhrIW1XFiXjdvFA/ltPsi0wdnhCxeQO8/js
         izdWofuS19L3NMGgU4bK4a8VFcuFo2MELZmhoHs44Ed/LLlCPVGrWazX2HyIhFu0n2fX
         oUEaaQSVvU7ccnRynvkKu5ybdXSW9+91c4NP40V9DXfalCrxOFtERndPUcCHZry13zTq
         RonR0T31oPEfHoN3X7wIzPAeBn4MdJtd7qn7REyadamETF3JhK6oc5esOTbSI1f+Uy5H
         WNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686897178; x=1689489178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEiGxc0bcdVFmhzsmXnMFSNPzbdJ2fxyVgUq2gtSOwE=;
        b=dpxm01oWD0KXCRBLGybyZlIPWWIdjCtzliDDPdxkZcxi+og7vCx0eqHsiQJhLbEwuY
         vRZOPUaujjX4WnaQ7GkNLSSpfQM1vOYzRclvLWhQV0E2bLAuCUnJQ2BxD9derKLAoKHF
         Cm2R4l9Lm/RPBRBMChNlspUd61z3JVphEfxbZ2XwFOQibYupuePbpyCTkLhglqfh2ti6
         nN0EWQKFS5jTBFN82phhhAiAVZrvbezTvSDThspyEyNgEKeRA+1Vd6MYoavhpQdxXHNe
         XA91lrNR1O7jnfXBFv4+rAPS7X2noBLGPBlrm5KPXOMuv0/ZlAxfUBfyvrUvLXwPFOpz
         za1Q==
X-Gm-Message-State: AC+VfDxFjK67QUfoWQnV6+ftAIIxRcqFGV05SCE55+KIh1VmcO96vfZH
	TJvn9esiq77VBLXFwvT2kwQH+A==
X-Google-Smtp-Source: ACHHUZ6U4/yV5VCV2rWE460G/Hqxnl14VCk7M+s4/0nl5oxkQImHZBZU9znPhxC1siwCN2ygVbz09g==
X-Received: by 2002:a05:6808:221d:b0:39a:aa6d:b9e0 with SMTP id bd29-20020a056808221d00b0039aaa6db9e0mr1387108oib.45.1686897178071;
        Thu, 15 Jun 2023 23:32:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090a410b00b0025023726fc4sm617596pjf.26.2023.06.15.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 23:32:57 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	maz@kernel.org,
	chenhuacai@kernel.org,
	baolu.lu@linux.intel.com,
	will@kernel.org,
	kan.liang@linux.intel.com,
	nnac123@linux.ibm.com,
	pierre.gondois@arm.com,
	huangguangbin2@huawei.com,
	jgross@suse.com,
	chao.gao@intel.com,
	maobibo@loongson.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dslin1010@gmail.com
Cc: Eric Lin <eric.lin@sifive.com>
Subject: [PATCH 0/3] Add SiFive Private L2 cache and PMU driver
Date: Fri, 16 Jun 2023 14:32:07 +0800
Message-Id: <20230616063210.19063-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_233300_208842_024DEE64 
X-CRM114-Status: UNSURE (   9.48  )
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

This patch series adds the SiFive Private L2 cache controller
driver and Performance Monitoring Unit (PMU) driver.

The Private L2 cache communicates with both the upstream L1
caches and downstream L3 cache or memory, enabling a high-
performance cache subsystem. It is also responsible for managing
requests from the L1 instruction and data caches of the core.

The Private L2 Performance Monitoring Unit (PMU) consists of a
set of event-programmable counters and their event selector registers.
The registers are available to control the behavior of the counters.

Eric Lin (2):
  soc: sifive: Add SiFive private L2 cache support
  dt-bindings: riscv: sifive: Add SiFive Private L2 cache controller

Greentime Hu (1):
  soc: sifive: Add SiFive private L2 cache PMU driver

 .../bindings/riscv/sifive,pL2Cache0.yaml      |  81 +++
 drivers/soc/sifive/Kconfig                    |  17 +
 drivers/soc/sifive/Makefile                   |   2 +
 drivers/soc/sifive/sifive_pl2.h               |  45 ++
 drivers/soc/sifive/sifive_pl2_cache.c         | 218 ++++++
 drivers/soc/sifive/sifive_pl2_pmu.c           | 669 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   2 +
 7 files changed, 1034 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
 create mode 100644 drivers/soc/sifive/sifive_pl2.h
 create mode 100644 drivers/soc/sifive/sifive_pl2_cache.c
 create mode 100644 drivers/soc/sifive/sifive_pl2_pmu.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
