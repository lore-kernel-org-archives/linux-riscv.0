Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F8C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 04:40:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9121D2064C
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 04:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkxOXUAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXIw+f9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9121D2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6YcVaeWqLllVqk9VouqrCfm+uB/JjeUDwIu8VabXs/A=; b=EkxOXUAomt/Y+VOYRSa1kOeaP/
	ms+TLPTR1jZPvFDshNw6hngorkcn0jolT2v+9eY1sl7EDTGnQEWzWh5xByEtskwonvmkVEsMZMPE2
	uiXBdkkiuuKIhtpK+OTkpwPnfZJLfUsIw0d+IzWF+x1KOI/Ro8Hsh2XIB9pqPPEEhy2OOdoET8qwv
	6KAvfC4CD3BTLuNx7Ej7CAhAGTXhjyHHamAyDT529lNBSXnkf8/Rzx2YS99JGfoAckGFuLEqQB6a4
	zOoz/4xoBwgq+GlmPc5hgkgMTR6m+LXf+sR+v2tLd2kEhYs8nwZA/L14IKcZkLlZikDP6435OPLxG
	i4kWrhaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvvhD-0003rx-JM; Thu, 16 Jul 2020 04:40:35 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvvhA-0003rN-SE
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 04:40:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id k4so3317150pld.12
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2J4i4t4AqqHg8abobY7AVKVmdgd1ErGb3bLZRvuatJQ=;
 b=iXIw+f9F23HBSI+lrEcHMW0xaCByLYrJC4gl3jyk9ewL3WkDsfNlc3soJHus17C5ZO
 cePbmDbQ11W3tENXDJreVqYu5bEB+KO0l8P0BgVGR59xAIf2aOvRhoc7I4JRuT9aypnL
 0mCwqsWLTJGjHu/lS3xuloMnFhnxBLUa+zm4xOENxf6r/j+uuYZvZKKqLmUMZExcwTK7
 7Q/OoK8/uzt78mPteJP0TAvH9+562n7SDVxBz1iPiPkcQQjah43/BIgzfksJxz9e/8DP
 +v7WKuj1f1INvyJglQGKaKY/SyFHUN9nfX9GXNpeyfrxBFU7bOS8rb26aqStqD8FckRp
 QQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2J4i4t4AqqHg8abobY7AVKVmdgd1ErGb3bLZRvuatJQ=;
 b=akz/zflM7rSWh5I7CtVTuJ+nInllM+TfFIANumi18J9YThVqlA4kkiPrgdwL8JlqLZ
 3XEUQcfST4kP7A5FDb7Q4mFbB9OekWMBt8xcxRRrweh8M5H9KqhswNg7tSmkNExV2s7V
 Y409YNu1E2lyV9v2iVOqIjgdTPtrShRWSkeFDRSmSPk8ett8dDVZCCQFXuMo2tTZvaq1
 wG8K79Lc8Gg9TEq8wkqlMHtYC13kKMcF4XKPJ2IJhO5KWd1JiSZTU87/LwvczsMrxYfq
 lmlHZj6IrnAKseuI7f5EHa/n/IQ20bDcK42KV+buSfqC7nASGYTlb4FHNqF6u9ag2+nF
 Vwig==
X-Gm-Message-State: AOAM533b3InT58ex+P3+XDnqrm24Y/bJ/xqzA347PVH/NVdSaeTiydgJ
 AdxJrngRxhhStduCSl68txoATaEJ
X-Google-Smtp-Source: ABdhPJynOeq6/gRIL7IyeVExIdv2EzkZDYGBv1lKgCDzwe4LF3f+PHCiALHXEEAygcqASaVOziGdZA==
X-Received: by 2002:a17:90b:94f:: with SMTP id
 dw15mr3050901pjb.199.1594874429284; 
 Wed, 15 Jul 2020 21:40:29 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v15sm3548603pgo.15.2020.07.15.21.40.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 15 Jul 2020 21:40:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
Date: Wed, 15 Jul 2020 21:39:53 -0700
Message-Id: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_004032_929396_D802FC01 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Bin Meng <bin.meng@windriver.com>

This adds SiFive drivers to rv32_defconfig, to keep in sync with the
64-bit config. This is useful when testing 32-bit kernel with QEMU
'sifive_u' 32-bit machine.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/configs/rv32_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 05bbf52..8759501 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -14,6 +14,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
@@ -61,6 +62,8 @@ CONFIG_HVC_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_SPI=y
+CONFIG_SPI_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_POWER_RESET=y
 CONFIG_DRM=y
@@ -76,6 +79,8 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_MMC=y
+CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
