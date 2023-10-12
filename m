Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D1CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oq3itXZQcr+1mo4lUrMt92QOBEqO7Srer5+2ovqqVZg=; b=ElenYFSHPfc0gy
	cDCrZlinJBaUa0YTEKL952PTpJPUhXRmSHHQzfaT2HHK9mdnUqgStAIGaQtSuStIORWtoltdUuqub
	vSKwyugJXbMe3bchi3LMO9eyVUiFiYOoPhFJHRcsfgjCjKAlji7IznlWR86j3g7fw2PAHHjt00ZKF
	LcjCWJib1t5HdhwQB4zgrv65AO4fI/nfI5CGTburCcTu23OmB6spPDmT+gSqQBYIUyEH2beunae6a
	bHYaGns+t329fmXT0T3KVAb5ZZicrhLRq3lmncPI6jPuPRA2KGsSVT09cGd1n8euTmdCNkRwHCe7a
	qD9cWoFOwULh3FiNW/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqq1C-0002QO-0Q;
	Thu, 12 Oct 2023 07:22:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqq19-0002Oz-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 07:22:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9b974955474so95657666b.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697095315; x=1697700115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNR22MNTy9GUiTOoCQrFn0Gk1B8RN+IVgSZ+weiCTb0=;
        b=g6wD+aSsTro30w02ZY9fJhMOAF6KpfLJ19d8ATfV+MaUKWZSAqalaCXd7fh14ZBfn3
         pgSrs606+OKNxsHcpVA/8So6bK9buVSj4YWSwDgvKFi14l4zUSF9QvPRiGstkMGBl1ws
         7OjrvTejeFUiEZr8uWz/OHFVElDUKHYo5VQipyV0Y2QuXePkKe4BQIWm+D2HF0hUgfFe
         l//703iAZQdQsUZ+d8hf5Wm6zSwNLJCfcrigeHQumz2qs1ASOfUdOuxTtUzatjXo4V2I
         R8CJYDD7ZvqwjviPF2Z7e/hijlXkLZZpA1WUpuqNE84WvBelXfoUBJ+EAg6JQ9rGfF4W
         I8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697095315; x=1697700115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNR22MNTy9GUiTOoCQrFn0Gk1B8RN+IVgSZ+weiCTb0=;
        b=hjoOWBSsSNgfef8u9Bjs3jyvbeKvb69hOc5J9eBrBS3Lf1wEoa/k8KwoMXMbeXjJpZ
         V+GHhrIW6zvGd9mMTMPrhm1OCLk3DbWrcpe/Zls7L+EuWGjf2Ww/YmgPFsJwp94VNOHx
         psA3SlV29kyxTlNoYFk2zRdamqei8kz7f4JmX1PhdR6qoGN/63n+sFd6+thjXs8CDnJ7
         uC+sMBZc497w/F8VdlnA49F7qxDTmgm1UqLA0NwK+TjnmVmXcSJzZ6tsBLkRpk1BcwKu
         pNRK+h5g3fetml+T19uHQazwSeWXLC6f4pS+iVKMcJj/wrThH1eqJr6TxIslg9rg8QLV
         2irw==
X-Gm-Message-State: AOJu0YzM4nj9D7aTGxhxa2j6XsEf0tAEUqiSADcX43KrS0k4Z/9BLUpZ
	WMYyg660SARkMTsVlq8B5R307L5vs2yGJ5C1M40=
X-Google-Smtp-Source: AGHT+IHPV576pMVKhIHLywSDt3A0TWh4uQs7uRALCNrThBfs09j51feRKtEmpIJe4LsOBiKMxTlfbw==
X-Received: by 2002:a17:907:7711:b0:9b2:a96c:9290 with SMTP id kw17-20020a170907771100b009b2a96c9290mr20626195ejc.33.1697095314683;
        Thu, 12 Oct 2023 00:21:54 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id qq25-20020a17090720d900b00977cad140a8sm10745085ejb.218.2023.10.12.00.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 00:21:54 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v1 0/1] riscv: Introduce system suspend support
Date: Thu, 12 Oct 2023 09:21:49 +0200
Message-ID: <20231012072148.7010-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_002159_217129_DF19044C 
X-CRM114-Status: GOOD (  10.50  )
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

OpenSBI v1.3 and later supports the SUSP SBI extension which has recently
been frozen with the freezing of SBI 2.0. This one patch series adds
system suspend support to Linux, which implements "suspend-to-RAM". To
use it, build the kernel with CONFIG_SUSPEND, boot on a platform which
supports system suspend, and then issue 'echo mem > /sys/power/state'.
It's also possible to test this Linux support on a platform without
system suspend by using OpenSBI's system suspend test support. To enable
test support add

      opensbi-domains {
          compatible = "opensbi,domain,config";
          system-suspend-test;
      };

to the chosen node of the device tree. With the test node present,
OpenSBI will wait 5 seconds on a suspend and then kick a resume.

Note: Resume may fail without the fix for probing misaligned access
speed[1]. It's best to apply that fix before attempting system suspend.

[1] https://lore.kernel.org/all/20230920193801.3035093-1-evan@rivosinc.com/

Changes for v1:
  - Rebase on v6.6-rc1 -- only minor Kconfig change needed

Changes for RFC-v2:
  - RISCV_SBI dependency [Conor]
  - Rename SBI_EXT_SUSP_SUSPEND to SBI_EXT_SUSP_SYSTEM_SUSPEND and
    SBI_SUSP_SLEEP_TYPE_SUSPEND to SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM [Ley Foon]

Andrew Jones (1):
  riscv: sbi: Introduce system suspend support

 arch/riscv/Kconfig           |  5 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
