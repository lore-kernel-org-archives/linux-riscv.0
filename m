Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C39C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908072184C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+VDGtde";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="S1HlryuN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908072184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWW9EjzyxNkZhPXKlP73B9DJBONPvPe/tAqtd/FqviQ=; b=m+VDGtdevJPiWc
	H6lehQaQN9t7qUdIz/E6GWiyjfO0GerfgVgqDjKNvFOREfj4nUDHnWmwtOFzpgv+1yjW0Mtgn0LpO
	5PDqY7Jz9nSIuZ9fCfUiUE23dqGwgzE0bVa/B5srfoejhwV58oxpFovvTCHCx/Su0IMBjma0hRlse
	o1LPBqd69XDQ772e6ajg8t/utnBIh9PLOpaNwdSwHrYZkn8NZHMHhErvzwATQN8t4pgVndnGWNhXf
	MDKp5/5ySibVZcn0KcRVyO7c6Re7T21LyJ2HFTLOowJIsncmio88CHe1IlE7x25F1wlYT17oFajc5
	F7I22Pe+QV/pJ8N1LT1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmRM2-0003gV-Or; Wed, 23 Jan 2019 22:50:42 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmRLy-0003dW-Oc
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 22:50:40 +0000
Received: by mail-pl1-x644.google.com with SMTP id g9so1903407plo.3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=kYviiIN09TVE/zNT5e+5SoWfv5PX9ek3L4Nasi3SggU=;
 b=S1HlryuNFdKzO50w6n4YO2DV9Vifw6QB/AMClk2PmgGYcttEC8wDVtv8mXlKeD9pbu
 PaGJWs9xsNS+seZBKj4wzFfJRPDkYtPZPCKyj0yZSjGxl22/MfPhAK5CMK+a8sSiPu01
 JHDS6gJd2yLhIr5lm0DTFytxirY9+uMwLIBLYAnVOI+SI+RrRCBEdv62S8BBDxNbmit3
 LCQhXx+w4tmW3fESFK5fZFzYqf8KMEINn9wlMY9PI9Cu9bcEtiCGXrBjBPjFQjKnAL3S
 HKUFi4rJHuKCvMn3SdsrjBSCF/qWp5FB4R4n2LOwuesMmmA1CvJTXXS1XgtsTHo5DmfA
 voGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=kYviiIN09TVE/zNT5e+5SoWfv5PX9ek3L4Nasi3SggU=;
 b=GilhFGkd+aBUhK+GgnmvLkwzcNdlFDJ9HQYgAGasL3rXrrmO+FROUd5Ei3pzwFLqfx
 J6W1nH1FxNEOkSC5XtFh3sbUQOGhXBATHr4MaeqFbcgF7YeOiZR3aLGJWqjZpR48wF3s
 4yxLL7Rl8M9S7TUG8+wGlei3ZXSY/LYOPE1VrA3RiV6qO0Mrc5zvbETyvgVBXYT7senZ
 MtP8Be5ZglPppLgX5vkSUH5Wd232dnGx/+7/l5dSmnRMWq+1nxNqCUzOtL3Gdgwpn80o
 NMXXsoNNCR+se5axmuJb+QftM1srtHpzMoSVnHBW1nGY9zHMQCTras7IF+VK0Pf8KAjC
 L2Vg==
X-Gm-Message-State: AJcUukeORF67tQlYPcWUuVNrXNgIjgczX4s20N9gqCbyM6InA/sYjz8k
 pvqhrCHh8veRU/iXlvySUqRd/g==
X-Google-Smtp-Source: ALg8bN7Aley5V/fVN9QLNtH6oqX8yOOH0wCqSvWpS0k7pxeeVboKJqVJ9hHhS/EOJcrr+e9dRCt7hg==
X-Received: by 2002:a17:902:28aa:: with SMTP id
 f39mr4153366plb.297.1548283838099; 
 Wed, 23 Jan 2019 14:50:38 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j21sm26320192pfn.175.2019.01.23.14.50.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 14:50:37 -0800 (PST)
Subject: [PATCH 2/3] RISC-V: defconfig: Enable Generic PCIE by default
Date: Wed, 23 Jan 2019 14:50:24 -0800
Message-Id: <20190123225025.32052-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190123225025.32052-1-palmer@sifive.com>
References: <20190123225025.32052-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_145038_794149_FAD93B66 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alistair Francis <Alistair.Francis@wdc.com>

Enable generic PCIe by default in the RISC-V defconfig, this allows us
to use QEMU's PCIe support out of the box.  CONFIG_RAS=y is
automatically selected by generic PCIe, so it has been dropped from
the defconfig.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Palmer: Split out PCIE_XILINX and CRYPTO_DEV_VIRTIO]
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 658be23fa2c6..01fe50707d98 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,6 +27,8 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETLINK_DIAG=y
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
 CONFIG_DEVTMPFS=y
 CONFIG_BLK_DEV_LOOP=y
@@ -63,7 +65,6 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_SIFIVE_PLIC=y
-CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
