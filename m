Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3CEC10DCE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AKaa1r6Gon6l+FjHshHdoqdDfpmf66pVaFyVeoepUNA=; b=DIlmhWuHxB612C
	oLZ6W8dqm71UMligMUZclPSkZoPor1chj1k0DAvJ82tGRZqMS7Xq7xON2lIErdiurtMtSoept0pN3
	i9DIzDi6P9OgfpG4UnMoW7SwP36lqtTxoGc8kKrQfLeqUYPI4zX0wAS0rFXJhEtFq0yJFsxs+3CLb
	rBUWKuIN8erSNkJaIOO2mndTYHOwJ8g+obHcUESOadurgkhGIOy6pmvtHgwwXdlcm5NL81mZxi0hC
	2pndMtYyKSiJ1tcEsuRT1K8+kOzjeOVYeDAA0tmnOGTkiKtPREISu6qfJYVC0jU1E+1XF2mUzq6ik
	AM3aBxdC+zz12FgJw5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAplG-009sF1-2Y;
	Wed, 06 Dec 2023 11:08:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAplE-009sDH-0I
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:08:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54d712c254aso963747a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 03:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701860889; x=1702465689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zdfk8U3+Lqv6fCWbMT89olgDw1zPbS7JH3yC11O4mzM=;
        b=dm6/NikMXazprTHtqagN++oM+93TXHJHIZObh3UqPpnxAOV3VcjtdisLockpN2O7tJ
         lPGkQC0OF8e/aKPnrSFN0JGtSw+BaaLEPUpQficADvjArCG6M2GPb3clh9STf+gTjcd0
         XKaVD01PptT8amjJkUHxmtDyH3BLG//tTjxTTExc223cE2pkcUasGISayUWNyLh0FBtn
         A2ucM31Jsx3f6hsh4kctXYOe1VnaYWFAYqDmbSoVmUBDaIqlzF+hwMP8dT5fzf1BLSTw
         c7xjfvYK6VC5CQD3u7iyo92JzHDMXheOlFlIfQlvYLcIU5y93fEr4ESUW9agK2z9YJyo
         fyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860889; x=1702465689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zdfk8U3+Lqv6fCWbMT89olgDw1zPbS7JH3yC11O4mzM=;
        b=ONdX6iSeFatrM5NzOfMvhDIWh5pGpnHUvb7grVmjeEwN3ke+l8WszhyszGlmdOiCz4
         Oi7s5Sn0veuEvdfLRa5fhIisvSFLIdgM7ihiau40qaxNStCOcjHnBUZIlKRtlwk4YLxd
         JtNWu8BnXK9vXugKwVmAZcEKCHV8p50sJD06njnQjH0G4T+RT1A2Dhdzuc9r9DMWFTde
         AAjaAPA78qaumpHRuPy/CMh3vHibckBE1XxBNA3iasp8JOlYsGr3jk5eTURZbDkWg6p8
         rL1+dE9rPQ6li54w66lYxEs/0qx40tTqJNnRrBCCFF+UFtYQxxQQ3BUXTDk5QPszvWTx
         OeGA==
X-Gm-Message-State: AOJu0YziibKBEWP3jVPNurN48FhwDkLD71O+XTY+IH3GBgmNv15+jNKE
	ShzjtGPsRxLBP6poYyG2aBmCBjMVWlsh7SOMqKM=
X-Google-Smtp-Source: AGHT+IFhRY8ooFCarzv03EvsshtmZx5Ts0CVmb4hLFmSluYCyuZEmph2b72lHRG4I06YUj7GsQvHqg==
X-Received: by 2002:a17:906:3f04:b0:a18:e2b8:ff1b with SMTP id c4-20020a1709063f0400b00a18e2b8ff1bmr493642ejj.1.1701860889164;
        Wed, 06 Dec 2023 03:08:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709064c8e00b009fc42f37970sm8184394eju.171.2023.12.06.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:08:08 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	samuel.holland@sifive.com,
	songshuaishuai@tinylab.org
Subject: [PATCH v3 0/1] riscv: Introduce system suspend support
Date: Wed,  6 Dec 2023 12:08:08 +0100
Message-ID: <20231206110807.35882-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_030812_134392_076ECBCC 
X-CRM114-Status: GOOD (  11.76  )
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

Changes for v3:
  - Drop the redundant ARCH_SUSPEND_POSSIBLE addition [Samuel]
    (v1 changed the def_bool to RISCV_SBI, but now it's 'y'
     again. This should be fine since an S-mode Linux will always
     have RISCV_SBI and an M-mode might actually be able to use
     s2idle.)

Changes for v2:
  - Rebase on v6.7-rc1
  - Added check for SBI spec version 2.0, which is the first ratified
    spec version with SUSP [Conor, Anup]
  - Picked up t-b from Samuel

Changes for v1:
  - Rebase on v6.6-rc1 -- only minor Kconfig change needed

Changes for RFC-v2:
  - RISCV_SBI dependency [Conor]
  - Rename SBI_EXT_SUSP_SUSPEND to SBI_EXT_SUSP_SYSTEM_SUSPEND and
    SBI_SUSP_SLEEP_TYPE_SUSPEND to SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM [Ley Foon]


Andrew Jones (1):
  riscv: sbi: Introduce system suspend support

 arch/riscv/Kconfig           |  2 +-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
