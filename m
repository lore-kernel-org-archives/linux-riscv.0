Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B8FE77180
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Th1qh9isYjI+4NvfNiUNex962D5pMaH0H+lv9w83woI=; b=JRvLZNQRXfl5A6
	+cgsYnQDwWT/TG4ghglQvevQ7XnGroS9hNApK+ZyRgJenaMKSi0Ty3KMCLUf0PjANVaD6XP+KoiLI
	tuJugqYtrwAikgJiKtdvKDTb8sztgQG4kn7cYaXaTXF7pGqby5bJ+ZV/k5W3/o+cUPjvEGe+hG8rA
	p4cifZqkOZi6w8jEptlSXcYKADy8bAzo32/5tlDfw4pkSmFxqzAf1yg6fs5I7lv3B0D0HDgTUbjFw
	Kf5ziuicpvx47SWNyF75FITSWACtRFVC7k7Ir413NB55+TDff5Lzv8EELhKAgNHBLf75FQLgi4ZAy
	zakZjXZ8rLHs+N1IBrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44F-00000003bm7-2S0K;
	Fri, 13 Dec 2024 11:42:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44D-00000003bju-0RRp
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:42:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216728b1836so14170915ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734090161; x=1734694961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTsjvIwHw8YHk0rJJ//aPZPqn72/a9IGLI3RpxKSRN4=;
        b=ea142H135uxJdbiFm2YnwK6dWzwKV2+1v7qrsrfTm5vChX5Jp7QMFpX/X3PkYtCDkn
         pea5Ek2BxE2DsOx5c0JGQEBpWaS7d/rUPnp2YQGoeOIk7bI920tskGJ0hiE6vKc8b/MR
         DapRw+E/CSKCMVKx5ECgktt8+GD0QPUoXAQYXH6LiFrz9txIQauLfAGDaeLPUId4/ufW
         uaYKpBX+TrEWwgJrjsyZkorLxIOX0Cbnqt8Yojf+2iOThmUfKAtOESzezuvGz3ki9ZYk
         NZZN04o5KZiAOlJFPUo5CEZMdRqNCN/2OSpwYQyQTxuMv40dhXO8KgfdWnxb5+vCOQox
         317A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090161; x=1734694961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTsjvIwHw8YHk0rJJ//aPZPqn72/a9IGLI3RpxKSRN4=;
        b=C4UXdb0pLUEeLfIbJPlMemR1OcmzEl9umYLNc3MqD8E8Q3lh45f68TmykIe0q/h8Bu
         H+hao4OIJvKP5lMq/oCO6vEQOQR01huZFF5o7tDLsfX0WbbF434w6Du1noxPG785OKNC
         QgIgqLEoVvMKPBrDJtuTVFa+5ZMKAzrEhau2zrMUFkv66rRK4OCzQt+Mz/1fo3+1S0bb
         3dfrpYXW617cHfSKosVB61FB5Mbmw933rXStSs7IkOxwDFvzOreS+2geo6pbqisGj7Xr
         BanE4WmF6di3a3t4q31ckuJFe6f4P8FttXRBfMnXkpi0cW6f+ALtcH9CHSroCbBhOd0g
         W7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUBhmIcW3JTaOnKi4WhT0zo4XhpRe+JJzV4Y7XQhM8e98NzpXPa/ozJHRgk0TI3ttReWVBXo4WEF6C4qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5IAmVJ/RrnLqnatZGiOrfIms6Gf96Dkx/eON0s8M5pmxZC5YX
	a/gd3dLztLxtXTvYo8yE9aVrIGkybzejWkAgJwAemqiuuxY5mhfY1iURikWvbyM=
X-Gm-Gg: ASbGnct2x7ETuVWT4ICeWqfW61j8KgMwJe5xjuy9981fIPAnL8d4OlA4XWyFxYdFGTG
	emX4o0CZ8d2NFXX5qOePO3cDsSTFPKBIvhDXwia4RfLryp2oXVpnCP0EQb9+/7IScG091b21Fvz
	GOr/+avuKr8B0tkUDkk7mhf3xrDlG1mcL0ToYzXA3vPHilubbq4eeDHle7luJZ/bbQuaRvEVDtG
	wT4ro3VK+7gvDeKMrkNCzSpNYtsLpJIyqVbAnrkdFhhIF5nrtxzUy+aqkd5OIY65F8oBP5jkrxv
	JSqSE5Dk7+4zeFK8ZGMcUW/IPub8KnDXsidJdFk=
X-Google-Smtp-Source: AGHT+IGbpctVM14irO1lM9PmxoUUNCWOSEpSnriOkZv8Xxax6HeGkuyn5mnc4XYJ3M/M2cPQ7OWasw==
X-Received: by 2002:a17:902:f549:b0:216:36ff:ba33 with SMTP id d9443c01a7336-218929fd4a7mr34607725ad.26.1734090161177;
        Fri, 13 Dec 2024 03:42:41 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd4b961f1asm8666340a12.30.2024.12.13.03.42.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Dec 2024 03:42:40 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 0/2] riscv: iommu: Add shutdown callback for kexec
Date: Fri, 13 Dec 2024 19:42:31 +0800
Message-Id: <20241213114233.12388-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034245_146156_364EEFEC 
X-CRM114-Status: UNSURE (   6.18  )
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

After kexec, the newly booted kernel can not initialize iommu driver
successfully as no one resets iommu state before kexec.

This patch series supplies shutdown callback for iommu pmu driver. The
shutdown callback resets necessary registers so that newly booted kernel
can pass riscv_iommu_init_check() after kexec.

Xu Lu (2):
  iommu/riscv: Empty iommu queue before enabling it
  iommu/riscv: Add shutdown function for iommu driver

 drivers/iommu/riscv/iommu-pci.c      |  8 ++++++++
 drivers/iommu/riscv/iommu-platform.c |  6 ++++++
 drivers/iommu/riscv/iommu.c          | 12 ++++++++++--
 drivers/iommu/riscv/iommu.h          |  1 +
 4 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
