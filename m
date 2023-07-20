Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7707EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wlj5EAh/7reX4bdKcIXrl9RT7nJzanJF6eRfRiiLJIk=; b=BWOQan9Pq0o+XL
	zukBviUYlkxhp2pG5wowIJz1va4huRHbNMR9inLUS9ZnnFVg6GC7d2oLw7rGTrNxAu6KaK+b41lOL
	t3AfIf8mDEQv/HqjrgCTD81Fx6UBp2crAPFg/JAvMYVbuYSGJEY1C+e5do5U5P99BzL1D8vSTnilL
	GzH2ZHYU3JWXxYeHlimDpJm0XYhGGq/DLynL1udqbLflSmpsXJFIW+CdLcVtzBMnlcKxS2xzlk4J4
	AZdyNELwXfN+Ip2ut9Tp84GTDgTRzJ6ABmuz3au6MXBjba5knCG/Fg+OLmRntA18ZrFnmOhcKFdhA
	y804qPnrpt9qTJKPccWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMU4T-00BIB7-0d;
	Thu, 20 Jul 2023 13:51:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMU4Q-00BIAC-0W
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 13:51:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-668704a5b5bso709438b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689861110; x=1690465910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXSLhAf39ywnScbmnhUoNCy7kFUzY0ELotpofi8TE5U=;
        b=D3+J1Yn1+oN7iuHEQFcdEwrOcaGE9JOdjW/Hxv4MDNhJcvvM5sYZkkTba3DnvsqtU8
         cqVc0jFG+k0/ItS+PfskCaXWDZtoualQxOQlD1pshPlpJdThRy7Vxgar+Qptw+PdK7TU
         uiHHnIXyolAVg1qQTAyZp9MO5Weaf2pyOB+m0aBZTEg2o/zRIC+hyUG6kXztXgVzCv4M
         nKxfLo+XAX8mqtBm33vPfiU8+28JUKCqq8l+D8FIXpyn4hIdX0SSBgnxiSudYTd4iisz
         xaGl8/9nmExGOS56wNW85e8qGWyYsAKTDUxtaQHRy1ZZxgPs97BbJe2XIJ+LU1Oiz8xd
         VEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689861110; x=1690465910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXSLhAf39ywnScbmnhUoNCy7kFUzY0ELotpofi8TE5U=;
        b=WUph5ChLQ9laTXhCSE/IHsre5ccS3F8JrjTpTBL1M0HvoSQ2Me0n+AIakkp0fGuaYJ
         fkcv0b+g7PcoD2m4oktVp9xfIkoeyePkIJohzskP+FKhxltLf9iCL6mnAgqxJs3iwHZC
         THTcdvml6ND2a0iQhqDLn1me1whHeBSt6Yb8GX+g/W3sOsjQ/sZd6UtwH7p9Wfp4RYs3
         i/aZIy7WH0aS7IWRh9CdY0X26d0S8xLELrZQ/kuLnUdIhiNM2supxsMpKMNnvLgUAUIG
         kvFsGvLCVZnccplRqV1Yhpdp3tyN+FlEEDIxqgxyEugIgs00S613yr3r4sVd9GCwy03x
         JIhA==
X-Gm-Message-State: ABy/qLauOzQSaPbqDNZOaVb91rQqhzIEN4cSYwkB6A3O8o1HUeOuhHIB
	FnN/rTGKyrAInNS81/u94oAhJg==
X-Google-Smtp-Source: APBJJlE/slAz3uyMZ8L7/7wp/jRvf4X8awMBqdrGa+1oT4Y+YdCDFXF2MFPhc2ilfywHh7n6Sxnihg==
X-Received: by 2002:a05:6a20:12cf:b0:137:8036:ab93 with SMTP id v15-20020a056a2012cf00b001378036ab93mr4425186pzg.40.1689861110312;
        Thu, 20 Jul 2023 06:51:50 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j18-20020aa78d12000000b00679fef56287sm1197529pfe.147.2023.07.20.06.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 06:51:49 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	will@kernel.org,
	mark.rutland@arm.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH v2 0/3] Add SiFive Private L2 cache and PMU driver
Date: Thu, 20 Jul 2023 21:51:18 +0800
Message-Id: <20230720135125.21240-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_065154_238837_B879C94C 
X-CRM114-Status: GOOD (  14.04  )
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

Changes since v1:
 - Rebased on Linux-6.5-rc2
 - Change pl2 cache compatible string to lowercase
 - Add cpuhp_remove_state() after pl2 cache driver probe fail
 - Return 0 instead of return ret at the end of sifive_pl2_cache_init()
 - Cut down the pl2 cache config log lines in pl2_config_read()
 - Sorting the variable by types in sifive_pl2_cache_dev_probe()
 - Change the error message when failing to find the CPU node
 - Add pl2 PMU driver to support per-task profile
 - Move the pl2 PMU driver implementation to the drivers/perf folder
 - Keep only one pl2 cache compatible string suggested by Krzysztof and Conor
 - Addressed Krzysztof's and Conor's comments on DT binding

Eric Lin (2):
  dt-bindings: riscv: sifive: Add SiFive Private L2 cache controller
  soc: sifive: Add SiFive private L2 cache driver

Greentime Hu (1):
  soc: sifive: Add SiFive private L2 cache PMU driver

 .../bindings/cache/sifive,pl2cache.yaml       |  62 ++
 drivers/perf/Kconfig                          |  10 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/sifive_pl2_pmu.c                 | 602 ++++++++++++++++++
 drivers/soc/sifive/Kconfig                    |   8 +
 drivers/soc/sifive/Makefile                   |   1 +
 drivers/soc/sifive/sifive_pl2.h               |  29 +
 drivers/soc/sifive/sifive_pl2_cache.c         | 202 ++++++
 include/linux/cpuhotplug.h                    |   1 +
 9 files changed, 916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
 create mode 100644 drivers/perf/sifive_pl2_pmu.c
 create mode 100644 drivers/soc/sifive/sifive_pl2.h
 create mode 100644 drivers/soc/sifive/sifive_pl2_cache.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
