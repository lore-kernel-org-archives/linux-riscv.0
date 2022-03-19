Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30FDC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=joO0f/Xc6d7UbXwejxE56tegRBdASOYniZlzgjkBekI=; b=jKMIAQR+RSS7pS
	hHBY2UL4KTGYi/dhv85npAxOBXfbTJl7NrUlkY8MuUA7KQlhMiCMo/jH7Rc2ydc1p2k1Rq6EK902h
	msyRANvEsfRBk+awPszZEm0o2YxbDqgZArtb4nOi6Bbh0O/Yt7HO2i+5Gcvrsq/TOXI17Go6pXFBF
	ejbfVJ14P4qus8YS2YVoQbL779V0WXHT17L1F5FJ6FMDDopr9aDWlcOpvsIISxuMMEo5NdPZ/J7EW
	BDRrrKr6+JOCoacpHmO0hbLSVXLa0fUrsgQ0TWaeTdaKuckpUbDb2WkJjbkCcpCqPKNk1CE2DBglm
	W68+lUgHLbeYPvCSeZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVXwR-003l4O-7K; Sat, 19 Mar 2022 12:12:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVXwO-003l3g-9G
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 12:12:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id 6so6945748pgg.0
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3X2tV+keGbsYSbHq09ZXywcQX5PSv7w44lhkAPv5lw=;
 b=BjHsw0mvLUvarLSC8WSX/z2bDCV9Ys0dIKCBECBHrwoAVRHgDqcB4hewr0fxb5bc4Z
 k7AbAL00hQGqtFXBm9ksabyMIl0CPtsIbnMbIcyte5tX7UaHxOtIFokBg5apXwHwgiM6
 YJoCjviQg4zD4Bsc3CkauV9irEFh+UQ5PhUrqYdYWD3PHIKN7JvKypD7/6N3aqw4F1yC
 VSsFZAHkxWoWxx/fca2/k6sc0RAm1DL3LFmTm+7crrE8GicKOq6/oAsO3Lcp/k+KHEzW
 yCi93exj3LdJWp50theehgjfx3XuksAcwpjoXXRclHe3khT/D0toBbXjtbln26pUSZgI
 mj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3X2tV+keGbsYSbHq09ZXywcQX5PSv7w44lhkAPv5lw=;
 b=WD4i9CgivACmj3GVG6NIB1RBkKakqcatG2vALIA14Oaytbw0wsmhPHO6FIAE2o45XN
 0iRgrAqlQWbosKOeuTZM+pmD+JBKGBWSq9y6DYwuubV96WzOmvezkwtztK5cuun9skqy
 A9chpykNgw1tNF9Ine2LjaEMCd5G3JYBT2p5mIcDHvmwdo3KTEkxKLBV3FHfUjh4KCCm
 kTJN2YzF02sgjW7JlEqs+qXOkrh40MZi2fm6mzGKGc2t0UCO3xV/nWGWz00xKijjeI0i
 DRprz29362qSB7n0KnWSQAPez+K/XLNCnjepqnfvw50RqBwwwtkpB4C06Xz08QhmCYzS
 GB/Q==
X-Gm-Message-State: AOAM533afQjWBOFKsAG9lBY+44fvsMHGduWFr8RmhqPFjpZYi+dp8607
 D3BcwXYqWWkbYfFRTB4Lo6l8jw==
X-Google-Smtp-Source: ABdhPJypAFKeWc4pTz3U+RtY8y8FZ46cOZnnU3lPnAP+NuKamOo8h3FNBLpurSzehAOlyuDfISU3cQ==
X-Received: by 2002:a05:6a00:815:b0:4f6:ee04:30af with SMTP id
 m21-20020a056a00081500b004f6ee0430afmr14593413pfk.15.1647691935126; 
 Sat, 19 Mar 2022 05:12:15 -0700 (PDT)
Received: from localhost.localdomain ([122.167.7.108])
 by smtp.gmail.com with ESMTPSA id
 pg5-20020a17090b1e0500b001bf48f8904fsm16192254pjb.49.2022.03.19.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 05:12:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
Date: Sat, 19 Mar 2022 17:42:06 +0530
Message-Id: <20220319121206.95919-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_051216_366515_C44CA459 
X-CRM114-Status: GOOD (  10.05  )
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

Currently, the range and default value of NR_CPUS is too restrictive
for high-end RISC-V systems with large number of HARTs. The latest
QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
restrictive for QEMU as well. Other major architectures (such as
ARM64, x86_64, MIPS, etc) have a much higher range and default
value of NR_CPUS.

This patch increases NR_CPUS range to 2-512 and default value to
XLEN (i.e. 32 for RV32 and 64 for RV64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v1:
 - Updated NR_CPUS range to 2-512 which reflects maximum number of
   CPUs supported by QEMU virt machine.
---
 arch/riscv/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..423ac17f598c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -274,10 +274,11 @@ config SMP
 	  If you don't know what to do here, say N.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-32)"
-	range 2 32
+	int "Maximum number of CPUs (2-512)"
+	range 2 512
 	depends on SMP
-	default "8"
+	default "32" if 32BIT
+	default "64" if 64BIT
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
