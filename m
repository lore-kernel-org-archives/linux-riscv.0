Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BD4C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A692081B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piYzF2af";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NXFsniEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95A692081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwByyHGD61tOTRabJoM6pKQX+vf0QTJVYuTg7vIX8wE=; b=piYzF2afPGn1Uw
	9vj13INf5fHLXcWXi6vEIG/eSWiHnMstsGjmjriBtmJbIUAAwpA79MQqT1yIqH+t0FnJlSklVuch2
	eonNRANbXLUL7mQZJLwwZKUkw51pikzeCucSMRJzibBi8KzNr1knEX+eKGienLbC7p2LEqOtNbkJK
	eU9m67gJrZZ8+ymNKm4kiB6CQVAYdBmnGQc13cUbcsTMrL4tnzsEcpdVcERL7uR/B4T/4YXeYC5cw
	QtoLf9PvygdF6ZHBNBUU25iLgw2aMlyv+6k/GwPlgTgOAKIf8GrY7L3mC/ACJ3nBNVOPYcr/ebL+v
	IR5gx7lex/HnGfWLXnCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIFZ3-00024T-OG; Thu, 01 Nov 2018 16:11:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIFYz-000226-CM
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 16:11:19 +0000
Received: by mail-pf1-x443.google.com with SMTP id z2-v6so6982957pfe.2
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=Bl7FGTKOeE36Bt9MD8JEY+4V43Ta0TmVw7QEaryQ0H0=;
 b=NXFsniEo6m4s/xz4EXQwM9C6ecBYeGtbkeYWsfsLolkuJFWW4I3KE5h9R3zraCOJcQ
 LAcN154PcUXP7f1iOxldb1LtOSWOd9BU+bWY4jACbN1zfJvAmBFZcJ+VrOdG7dxKnwIQ
 F3RwS5WX66MVhqfqwRDXZOLflwqHBA1t0PPQFABshKmcKswNlvpdYhOHjGSiUrbPuH3m
 hD2pSbkG08JISSV55vFBKYULgEsVp1GUcz+qerL/XPBYaKk/wc1Fnz1/e0ZWEeIWHXIY
 /F1CKBTeYb/7E2onz1PdoQ0SVK/4b/xG/JuHYeUh2DqdQhA9GcY6bBtrBhFA/eYR1g87
 A7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=Bl7FGTKOeE36Bt9MD8JEY+4V43Ta0TmVw7QEaryQ0H0=;
 b=rPWKJfavaKdPzNttY4c7UzvcN/OD/ll0fP7WPQimKADig9zEQcaOf7hd3XxpWZquHv
 pKX9CKza1eL1m2c6oymZ1Mt1fhAJJB0qYpDrOmiolJJxkt9vw7I3351BrYuEqFdz+gqy
 EiYOnWjjd95/Dnvn1SbeGNnZkN8mcOH3nqVyZZ4lctEhkGWVLEPVB/bP4GOmnyc/9hG+
 Wz2X082G16z9905kK0yEPLX4R+vWxLA0wpHUPvGK3vA7l4u7XpOJTVpTETSIZlT4emJC
 DVojU8bKuNmFu/0ybuieRnZBpfuG6zN5WlGVKiVeElEQe6gz2XGqqVChlfgaZ7sB/P9r
 Wcow==
X-Gm-Message-State: AGRZ1gJ746aiGnlzsdI5eg1qjtQC8bNOTH3TS/z+5DR0kZmFk8rmFNM+
 4G0jUt7ygCWByTVaNZ+AKMcuBIYAQEI=
X-Google-Smtp-Source: AJdET5fY4cN88j1ZSTx9yMGapQfs5uati6f4C0pZVJ2gMkKt7ZHtpQzvAxRGjGVfziCDhmVhgU/82g==
X-Received: by 2002:a63:a001:: with SMTP id r1mr7764571pge.268.1541088666555; 
 Thu, 01 Nov 2018 09:11:06 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a19-v6sm14381154pfi.138.2018.11.01.09.11.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 09:11:05 -0700 (PDT)
Subject: [PATCH] RISC-V: Regenerate defconfig
Date: Thu,  1 Nov 2018 09:10:41 -0700
Message-Id: <20181101161041.3250-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181101161041.3250-1-palmer@sifive.com>
References: <20181101161041.3250-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_091117_416312_B9980021 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101161041.6NkZ_cPD1jaW9qEpEX1r-IS6B0NMYFLEGM3Zn6d5rBE@z>

This patch is intended to be a non-functional change: I've simply
replaced our defconfig with the output of savedefconfig.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 36473d7dbaac..07fa9ea75fea 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -1,6 +1,3 @@
-CONFIG_SMP=y
-CONFIG_PCI=y
-CONFIG_PCIE_XILINX=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_IKCONFIG=y
@@ -11,10 +8,15 @@ CONFIG_CFS_BANDWIDTH=y
 CONFIG_CGROUP_BPF=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_SMP=y
+CONFIG_PCI=y
+CONFIG_PCIE_XILINX=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -59,6 +61,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_SIFIVE_PLIC=y
 CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
@@ -72,8 +75,5 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_TRACE is not set
 CONFIG_CRYPTO_USER_API_HASH=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SIFIVE_PLIC=y
+# CONFIG_RCU_TRACE is not set
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
