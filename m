Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A805CC6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 05:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC572064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 05:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mdm34qlj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wp3OC5Lt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC572064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=meqKsfzZriOqIEi4/Iok2+ehPJbHInHLtMTxDBRUwP0=; b=Mdm
	34qljoxQhvMz+5qlDyDDnecShQJgou6p9pBpPyfsRKpnNsVWi03MbDWCJIcnMxeXZlKh3UpAyLGTQ
	QrtqVadJvvjyfCgRMDDPQqsSh0G6R5+GDg/AxVDKICVntCKSbsfmZ8ccJCecwhp/vXWKEVvdw7JjP
	96GszFhpCsrKL06t/hBmiXil9iVjJS3EeUv09vzNIje0JiB05eCe83KrvkAsC9qn00fBKQq5o/84X
	C6XVcSvEQn6uOmzYMjpS8G1SjUNWBlAT89I0dZjUW13V9s2Xp6SCVUGhRCHTLXiTUinGpAqXW3fZE
	anqQCwlkXuhX8PAjFG3Mhk67d+teqjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI5G2-0007vV-R9; Thu, 01 Nov 2018 05:11:02 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI5Fz-0007t2-Tm
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 05:11:01 +0000
Received: by mail-pf1-x444.google.com with SMTP id f26-v6so8725300pfn.9
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 22:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=UNjlZwzEibKT0pjzTMJaaD3o9L1rvct5mj+DCG0u1zI=;
 b=wp3OC5LtDEozgoLARjfS3jV8khWnfrYQepVydRRB17NtexCv5VCgGr05DVg766ne4u
 QrP21bD4fpWPmPRwyycMUg0npyi+9EgiXf/ujWaB5UqXeYIWfIVtQYv0SGFt9JyOjVhV
 b7o2rGPUxvxyMX9kc2X1fXtzQWQpFXOdleRC3o1iKw+rOTeUxsyySZc7bkK9VpAhCaXQ
 KrqJcEkKqqXNsPqHlXMRPSdig+Tb79k0QMOb29Mlgf+aK9TM165foD4mzTlmLZb59GcD
 QjRHg3eHQuEK3owu5FMqmSWLkLKSZzs4j62JtN4dogXhQG+Bsx/AbmUHu3H3wRIGWNwh
 bLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UNjlZwzEibKT0pjzTMJaaD3o9L1rvct5mj+DCG0u1zI=;
 b=BtFefAqZJnOIQlPIltytBpptZbpaXFOtT29Z+kq76glXlNFW8/myBYYNV76zKQxEPy
 THfpIMRwqjDrRtEDeE94MUp/9jLvBVv172uQirxF1QyTmq899vEYp+TcVMr2SdLmJxz0
 iUsM5pYmv0L5mwTieIjeucr4s9N2l5rXDC3C1k0Ia/NT8iUCAVIsHNnCXi+BJPT3EJnp
 djenXxgCM8BLiXVo9xvfPu1OTESocpMu/7rKKyzSRjTRAti87m5rDCWFPTRdjLoZLZ1a
 HvavEttsOefqjY32HHeXqo4wFglWra/FsqSY4b3gDcXL+4G9KLe5FnFzeON2atp04dOh
 ZVKg==
X-Gm-Message-State: AGRZ1gKaxhYw6at3kcKYMzrVJkbBvHcBGcgFkKFwLYJE9lgzgEuF+zsW
 ig/YhxkA24Q8Ay5XUNILFNXdjQ==
X-Google-Smtp-Source: AJdET5eGQjhXo9+RKEK+roGDOD/OGxppBe4TmuezY8XulQ7sz8nfKktMdCrIl1I+/dSD+YQBBKORzA==
X-Received: by 2002:a63:84c7:: with SMTP id k190mr5879310pgd.333.1541049048515; 
 Wed, 31 Oct 2018 22:10:48 -0700 (PDT)
Received: from anup-ubuntu64.qualcomm.com ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 d65-v6sm40439166pfm.100.2018.10.31.22.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 22:10:47 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH v2 1/2] RISC-V: refresh defconfig
Date: Thu,  1 Nov 2018 10:40:32 +0530
Message-Id: <20181101051033.10089-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_221059_964417_8991ABF4 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101051032.y-tf3pi17jJldXYqx2VF5RCLqtBwisl1_vuOU9J-zoA@z>

This patch updates defconfig using savedefconfig on Linux-4.19.

Signed-off-by: Anup Patel <anup@brainfault.org>
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
