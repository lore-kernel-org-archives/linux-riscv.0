Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB68C678D6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 05:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXtuEqnHDSVXQk94pqKM750IVd3tl8R7WuC9M0Yrims=; b=dYcYe9wLC7bk0/
	TdrcTf0fTNPcczQjf2GKCnI1LNV1ubMi2gWdAzokEXhZSNQNlzIRmwEqgldvvwhGO5OT7QTL7LpG3
	uUln2foGBpNhrhDOTuNImtvzjEUTfSpyKirVie3evHQQnDgcuIXx9nbFYW8Y7xFpvGJIphHCx4TYi
	OTb7zLMh6JjB6TYcF68DHIYfiUdVLLDmEEgmUBWdZD8qsTtq3cZ6Agth2WyEVnf8ovClc3tkVXW71
	SlqtUbqCBqqj9SVWC9B1P8ucOR/B0X4s6BgZw3VtRwN912LCuItIbftz2PP7Ose95xc5f4aaJH2BA
	UDsIABeZzXfsEGYTUXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRt-003fXZ-Ly; Thu, 19 Jan 2023 05:26:53 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRp-003fVY-V0
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 05:26:51 +0000
Received: by mail-qt1-x835.google.com with SMTP id jr10so794917qtb.7
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 21:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvWquSrWDihZ0acdWJU0hmpgtyP5vfxrh4ZjBtKv7GY=;
        b=oVvCL60ecUhBG09j4Y1NsZFRHxe3MVE2V7Cmffled1FjHBdZnUskAjCtHgy3YWfu9c
         mPMCAS/8DS8ty4ksFnckwt9R5MQbofpmZKC9r3eABUzFFt5TyTBYFx7uZ+P/Zdbioale
         bl4TS6vHA+e5Qv3zYovsIblT1K7LkfBVCKo1JXwn3Ahsi6t/LHVKw1ACCe11Q4X67zxd
         c+gyi8m2S6r71GEvmT7nJnEdhSw8VfVIi16DuQO5iIdupZGa5/jbKLaa4OHl5k6nvItT
         oD405HVs8KDChN261QLu685xaE7UIWO/4Av1yps2ekHeYo9F8YEcszeHdaPZemxAMPcD
         gVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvWquSrWDihZ0acdWJU0hmpgtyP5vfxrh4ZjBtKv7GY=;
        b=yFVBZ/UcN+MFhkfpfKkUVXw35+R/R5yJM+bT6yyTqOMaq64WLnrWj5Hn22hJzLWEdf
         CIIwFcX25diFw8LCTZzfMvutaARAL4Ptht2LhigUMLeCjXUmryOvlDD3hhUDT/+T7x/v
         n48bQpo7fE1jpdbcdFvgu+KGhYKXiazOu52vuWAXr6IEplMVP6X7oumvtPYmiKx91YF0
         6rTawse9D6eXT9LRTC531d/o4p2a6K2eLNkcUPegaLc2WNc9ZR98xJU4bJEuAIrolFNd
         EWhN+EyVGdtp5VkN/eFfdIPbvkgeMfACfbjECEPSNMJCxJhzrMb4tfN7EvRC4I5sSMem
         M1sQ==
X-Gm-Message-State: AFqh2kpSTEtLfAHQMMB9nIy00QNNamopIarbPWhxCvsM8hjdc0YowOMg
	WWdi6LmAW4D2Y68Ew1p0wRLxMq6vLrrwCg==
X-Google-Smtp-Source: AMrXdXsjJu8KZfUuO0V9UN0rraw3kxggjI/UB7RLpcZFW/B0GdZEoVmL4URNPATKL/WkMQXZDTfqrA==
X-Received: by 2002:a05:622a:598b:b0:3a9:8f6c:2d7c with SMTP id gb11-20020a05622a598b00b003a98f6c2d7cmr14850392qtb.52.1674106006392;
        Wed, 18 Jan 2023 21:26:46 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id v21-20020ac87295000000b003a5430ee366sm507330qto.60.2023.01.18.21.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:26:46 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v1 2/2] riscv: configs: Add nommu decfconfig for RV32
Date: Thu, 19 Jan 2023 00:26:42 -0500
Message-Id: <20230119052642.1112171-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_212650_011622_82A18264 
X-CRM114-Status: GOOD (  11.17  )
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

32bit risc-v can be configured to run without MMU. This patch adds
an example configuration for RV32 nommu virtual machine.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Yimin Gu <ustcymgu@gmail.com>
---
 arch/riscv/configs/rv32_nommu_virt_defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 arch/riscv/configs/rv32_nommu_virt_defconfig

diff --git a/arch/riscv/configs/rv32_nommu_virt_defconfig b/arch/riscv/configs/rv32_nommu_virt_defconfig
new file mode 100644
index 000000000000..460907253a80
--- /dev/null
+++ b/arch/riscv/configs/rv32_nommu_virt_defconfig
@@ -0,0 +1,16 @@
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_MMU is not set
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
+CONFIG_ARCH_RV32I=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SLOB=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT2_FS=y
+CONFIG_PRINTK_TIME=y
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
