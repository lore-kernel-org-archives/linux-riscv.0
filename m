Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64C8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B13D6108F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B13D6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwrIdqrbLcZVaHyoz1mQmFrVZD6P7pYgGKidHaFYoos=; b=eZrm6VXu2YtxNZ
	kYbvCb38PKfoF2fqi8A/NkhtwRy3GNMvywqm39VFYBgq+2o/qhGdwTlKa4nLWkuYy/s1B4uJeFOYV
	HmfV4tvL5g2O6I5MXcqZE/pYYt8waY/l9PhSnWi/bsGHPQpy2/0EJCsBQ3+IaCJmhtRSEAw6qErLU
	qL5Ft6AAldj4NRbAFtVuATItR6vYpzNs/xD+sFK+qOlILMYyabqtBLuQr9duhfo/AaSaLffTc+D5D
	64A1wJqv5GxFYyD4ra7AK3Q649mJs9uUfxh44DUeV0OKq7jOP6+bDSIZMKubZLw6qWW8CCjnkxfQ1
	uCsxdykW+M7POF6jBJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVaxp-00BPQO-G1; Wed, 29 Sep 2021 14:53:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVaxm-00BPOQ-8E
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:53:39 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E702D402D9
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927216;
 bh=omlMO8oiSqY28NQ++6IIM/VRVI4+XjHYuKkKGp3z8ks=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=FtVKLjI4WMtGMy7Nfr8j09l+Ji3V2lbcISQ/pmyIjwRXwtI2Jt3852vpnP2BHXJi3
 qW1pOlpn4Uz7DWzcwWPgCBmjMD/Zu72X/WFc1YfVTpyJbo+1MmWE8Rqf9aZeuTNndn
 ZsDHDyPrF5VkIKajkqoykB7kxN4Pi8onYI9Xik+o5+6B+wsMO7w47MvaBphQeNptJb
 Ve23/ZqZIhAYnT8icGDhwMjhnsV3ST5tQ97k3XH0iMQ0OB0Sfj6x1GzR5tNBzEAqXw
 TbnyHgstVUJMtDIWRktRCjdcPkwlwU1h5pFV3x6ZFpsc1JUIa+uq7D7xS+qB4/Sh7x
 HgWkP57tWIdJw==
Received: by mail-wr1-f72.google.com with SMTP id
 p12-20020a5d4e0c000000b001605e330b62so697402wrt.5
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omlMO8oiSqY28NQ++6IIM/VRVI4+XjHYuKkKGp3z8ks=;
 b=Ayg/8kxCsdJ4s17CYHu3gZJTiOI38b1aN3pTCIEPmBqYr62a1nRGyXO4uMReid9lNO
 MeaLHghZyqkMVN5O/plEMJ/SHnwlWFeb+gZ4HfDZy1IG/ew4UTDe8LgLmaU279XK3+6b
 RooBs89JuJ1saDFiuOkmKf5/B9teCqsRw+dsEhptvzEQ9NE+MX5Gyp96J3Ed3h49uotc
 KNvz5ZKrPhL72eCCl/tkAqoXCgCBt4Zb4LL0fCWEycH6HmgUPgh3Izgbv+ZTydz7+gIx
 znLYIddO60XLWG0h0gsGiZ2lWmvcantEdui1mRgqZXgaeuo7lErRq8UQmvt+Egwvb+lx
 tYsw==
X-Gm-Message-State: AOAM530pEz7GN7wp/Cujz5tbQ+b51h0vmSaCwCjRkjsWsH0GRtI2ZUEQ
 B3fv8tgWsLcZ0ycyR1oB95bk7cajAGluuXELC1ajlRtCqr5N7FmOwmOkpm8bV9gZO2jBk51bHHF
 XExrg/yjj70JOBe7igEtQc7A/Zb95o5EvJxhguWoOqCurXA==
X-Received: by 2002:a1c:7e48:: with SMTP id z69mr6608690wmc.95.1632927216592; 
 Wed, 29 Sep 2021 07:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBhGuwR2gfKW7D8wbmoyhXANv5cqBb/OGcSoZL3FS07cfNAhL/0WXAeYKVFArK/uWwhbyh2g==
X-Received: by 2002:a1c:7e48:: with SMTP id z69mr6608661wmc.95.1632927216369; 
 Wed, 29 Sep 2021 07:53:36 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id g1sm2428205wmk.2.2021.09.29.07.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:53:36 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 02/10] riscv: Get rid of MAXPHYSMEM configs
Date: Wed, 29 Sep 2021 16:51:05 +0200
Message-Id: <20210929145113.1935778-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075338_455522_B289D73E 
X-CRM114-Status: GOOD (  15.02  )
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

CONFIG_MAXPHYSMEM_* were actually never used, even the nommu defconfigs
selecting the MAXPHYSMEM_2GB had no effects on PAGE_OFFSET since it was
preempted by !MMU case right before.

In addition, I suspect that commit 2bfc6cd81bd1 ("riscv: Move kernel
mapping outside of linear mapping") which moved the kernel to
0xffffffff80000000 broke the MAXPHYSMEM_2GB config which defined
PAGE_OFFSET at the same address.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/Kconfig                            | 23 ++-----------------
 arch/riscv/configs/nommu_k210_defconfig       |  1 -
 .../riscv/configs/nommu_k210_sdcard_defconfig |  1 -
 arch/riscv/configs/nommu_virt_defconfig       |  1 -
 4 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee61ecae3ae0..13e9c4298fbc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -147,10 +147,9 @@ config MMU
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
+	default 0xC0000000 if 32BIT
 	default 0x80000000 if 64BIT && !MMU
-	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
-	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+	default 0xffffffe000000000 if 64BIT
 
 config ARCH_FLATMEM_ENABLE
 	def_bool !NUMA
@@ -256,24 +255,6 @@ config MODULE_SECTIONS
 	bool
 	select HAVE_MOD_ARCH_SPECIFIC
 
-choice
-	prompt "Maximum Physical Memory"
-	default MAXPHYSMEM_1GB if 32BIT
-	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
-	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
-
-	config MAXPHYSMEM_1GB
-		depends on 32BIT
-		bool "1GiB"
-	config MAXPHYSMEM_2GB
-		depends on 64BIT && CMODEL_MEDLOW
-		bool "2GiB"
-	config MAXPHYSMEM_128GB
-		depends on 64BIT && CMODEL_MEDANY
-		bool "128GiB"
-endchoice
-
-
 config SMP
 	bool "Symmetric Multi-Processing"
 	help
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index b16a2a12c82a..dae9179984cc 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -30,7 +30,6 @@ CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
 CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 61f887f65419..03f91525a059 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -22,7 +22,6 @@ CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
 CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index e046a0babde4..f224be697785 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -27,7 +27,6 @@ CONFIG_SLOB=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_VIRT=y
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
 CONFIG_CMDLINE_FORCE=y
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
