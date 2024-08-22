Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EEEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbsQunLvR4kw/f9hDHKq/J1CBjjeclk8QVyBVwD9QHo=; b=LVR689kK+TwruA
	SY8TtCrWfMOjqd0YU1d9f+l0NZV+UpkQqYFyrdYvcdWKD0UHJExrnu4MAxpu6x5AXcbT02TA25QXu
	VEYJbtxQL77DavpZ2iI/QUilqhOoQEQtv8BNcfLPiUFYJAYNgrKfvXVpWLAvsajTo7qhW655rJk7r
	7DkAt2oAFQTaAjFhKMiC205j8Y/NSSKtMzmgSRoTF2jkMNsRMBr5DjJbAzSk9JXeMY6hHhVv8IdW2
	GiUWJA8sfN2aDWpDs0P+aVl6oIifnhB7aX+xzjsCKI/zbu5kzhwa5MKFBZdglDkf2hU6sYKQs7hBt
	cf1iAiQCUb37a5YO+i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shD3K-0000000E1ip-3mkM;
	Thu, 22 Aug 2024 19:00:58 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBqa-0000000DpiH-4BrJ;
	Thu, 22 Aug 2024 17:43:46 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-713eeb4e4a9so922077b3a.0;
        Thu, 22 Aug 2024 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348624; x=1724953424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=NBswCElMZU3VJYDj2/G1Hs9Dfrc+hclgXFdobft0+QrvevXKMWGEJXOfOdYRSzVxe+
         hVVWwFznlAGPiEoP1W6NfrlwlL2fJR1IdssRSKP8sF7ZOVHEqvxjGVYohycv/KHYNnjV
         HMY4/bluZczMIPaSdpHcFDhwbApW33rcx/A/b79JEe6EhmZ3ZzrW999e10wZgw5NzdMM
         ZDTA7sui1SOF6p7LTHkIhv3HTrDV4hB/7yW/d+tUoKO10VRGRTNW7PkNo2id/OoIgUWh
         aoPbZ6sSoPY9Iv9UGq0fMK4zcRNHEcQia8ve+sqmBr8mb+27I+Z5QBGIrnpVrJWjo+6D
         WwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348624; x=1724953424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=MvTKYfIY7wFxhP7Np9Q2YaZyGPLfdTR9YB/KQOzTHzv0AuvE1KOQasaxwHWSSONeiP
         3J+MMSaiO7y7r5dOauW3As/V55KuP3glNMNdGabZFaiUBWDqGRkVvVAQ5PYI7tGZzU+E
         Y2gnckP3zdOjBPA5YtTqya9kW/34wYrQZ9BpRWxKeM6uDiq/FxmV0C08pGfnlzOKNXFl
         5/MYWESAMJOKgrd+AfYnTKlLjH5Wb+4RpAL4Q9/znyAVcHpBbAh6L1/ikx71TqfiXaKN
         IL8k8qlcxGD7R7njSnpVaYsa2+q36RYz1yjf30IwdOKJ0nSSjBCORLrOV3pQPz+lSsmm
         IMNg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqRFUYEqxrDiB79U6iWU85m3QJxZJA1WWuuDQe9WASK19JLsvOQpQ2T5RnIj9Qlcfpb+1vf06ANyXEDa2jXnrTg==@lists.infradead.org, AJvYcCVcNBKJgL2WSxZb4TL3vT5XEbWwM/UoNAxqhfiLwKksvynFMvTNLwRBXouFmPTkNMb90+RoeyuvIzS+FAU=@lists.infradead.org, AJvYcCVldm83KPiGNmyYDy4N98gxxU2f3hAVLr7/8AZgNvCz/8bfYr+fJHN3aLu+WepWDUAIIXPqWelxiUwwdGErzV/q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5D4FG4UwK5xgoMm9HeJh98SIEsE7zAJQYOQuc1ZYk1qbHIGMR
	7mBrhz42r0krbfXc7kp2qk0ZsRVFBA6P+5TwPLp953jWB466EHV0
X-Google-Smtp-Source: AGHT+IFGkELVvNa0lI1frVFe6EWSijWeT2NndQtVRkhY3tXIvi6/Nr7KdOgUntuymQnVsLZZV1NHsQ==
X-Received: by 2002:a05:6a20:cfa4:b0:1c4:9c27:77a5 with SMTP id adf61e73a8af0-1cad7fb3fd0mr7479354637.31.1724348623824;
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434af17ebsm1583180b3a.3.2024.08.22.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:29 +0800
Subject: [PATCH v2 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-4-e4dbae24f7e1@gmail.com>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
In-Reply-To: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=NFJyZNClpVUHx0Z3NXNiq6kpWDX+CueV3L4clx5uBrg=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDivyM1yYePqvmKhQXbdc0o4/M99VH9rqbjfrd
 C2704FIwfKOUhYGMS4GWTFFFrGdT18vK330YRmvyQyYOaxMIEMYuDgF4CKcjAwdc84dWeL8XvrP
 oXWq2Tvq7x9Qlrtz8PpheXWhu2maxd+PMfyvY/2cPcnsqtDXK2v61hZlLJVe4rPDPnSvlHrjhGk
 +FpHMAC41TKg=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_104345_102234_3154D665 
X-CRM114-Status: GOOD (  11.66  )
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

Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
with systemd") said it's because of recommendation from systemd. But
systemd changed their recommendation later.[1]

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.

[1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700

Tested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig   | 1 -
 arch/arm/configs/omap2plus_defconfig | 1 -
 arch/arm/configs/tegra_defconfig     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b5f0bd8dd536..27dc3bf6b124 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..9cb265c8d414 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -13,7 +13,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360c..3a9bda2bf422 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y

-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
