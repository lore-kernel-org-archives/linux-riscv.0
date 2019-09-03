Return-Path: <SRS0=vaJP=W6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5EBC3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 23:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B80822CED
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 23:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JtHQxTFm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B80822CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U8Sirm7d04RhUs/98fHpPPeJVpD9wZvPqlvo74mDe3o=; b=JtHQxTFmUM4CVM
	3DRRSchx+4z+O7couURxgEIq/K8QfNQftfTwrHPVAvbYpa2ooYnjlXTjDgUjVgS8bru3ExtBujxCa
	gYbzg0QWMn2JI5D3tz6AVjjaaMdiJMMBdI8ECnrzKCMDfO85Z0xlTVPSHJ3JNy9vUIbwhFpDj3vC/
	Yc98P01utH4wBQ0qMkvuSewEI4u61RZ3FUDHK6W544djKj2CrYoaNliUqxT5iDik8QDYPO/ExnQKQ
	WAPMe9xfRpXUkOVXxs6ngZsZ+gDcUq93U054Tyb5V1BfAP4bS+/uI1BLjFO5isjQSrY7Ao2LaxB+L
	tilDsHFmfwCDzSnRPKug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5ILW-0002j9-G5; Tue, 03 Sep 2019 23:36:22 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5ILT-0002iV-Ey
 for linux-riscv@lists.infradead.org; Tue, 03 Sep 2019 23:36:20 +0000
Received: by mail-pf1-f196.google.com with SMTP id y9so11922704pfl.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2019 16:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VTVfOizTRSDhAR0ftvZ5XR/ALeURLSbukVJWeeIGIQ4=;
 b=dMKoIkZBTSPGGF/JBWprzQEFKxywdOQUDTw0pmW1H70pooXkBl8lOP12AS4Id6sjxs
 vMa7uRaVXCDgER8HVjVoC2NY4ftkM1jdYKnW0Bse5+978HUm8Fs2uhir78sdBtbOGe+R
 uKtkGkcvz6TkodtTu4SM1M+JXHCOismLWszXLZMKcQBBqUrxUzCrkrCZzwlRBJ7cJ4TV
 32EZAYGTbWEEzsYwPTzmKgS0ho/UI+VJ+HCigtIpk4B80O5uiaEQE9ASy/KkzR/wmyWK
 MOCXEkfZUGrWvFyFnNj6mnB+WnRsl3ROWaSGv/FYFHt2CBMZdKFW0zGrfl7LoORqEndD
 VNIg==
X-Gm-Message-State: APjAAAUHjJBqScXkIlKhnJnNb1cC0WSU8cuN5dHNGjDk+VK+uv8zyVMR
 cVivaqe/p/+QqVh4/E5yZTSw9ylQw+s=
X-Google-Smtp-Source: APXvYqwE0UYLOqp0Oj4x7qF5BBzrBWk5mcZ8VWUKyGEJozqrgtDMW1pLlD49KNG2NXHPa0sUUoHJrA==
X-Received: by 2002:a62:8204:: with SMTP id w4mr28496930pfd.30.1567553778357; 
 Tue, 03 Sep 2019 16:36:18 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v184sm19722336pgd.34.2019.09.03.16.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 16:36:17 -0700 (PDT)
Subject: [PATCH] RISC-V: Add Plan 9 support to the defconfigs
Date: Tue,  3 Sep 2019 16:35:10 -0700
Message-Id: <20190903233510.9846-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_163619_501240_9B5A830D 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

QEMU contains facilities for sharing directory trees between a guest and
host that are based on plan 9's network filesystem.  This patch adds the
relevant entries to our defconfigs to enable these, the most interesting
of which is probably CONFIG_VIRTIO_PCI.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig      | 4 ++++
 arch/riscv/configs/rv32_defconfig | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3efff552a261..79ae1f932b2e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,8 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETLINK_DIAG=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
@@ -73,6 +75,7 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_MMC=y
 CONFIG_MMC_SPI=y
+CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
@@ -86,6 +89,7 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
+CONFIG_9P_FS=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 7da93e494445..5bf9e919900a 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -29,6 +29,8 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETLINK_DIAG=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
@@ -69,6 +71,7 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_SIFIVE_PLIC=y
 CONFIG_EXT4_FS=y
@@ -83,6 +86,7 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
+CONFIG_9P_FS=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
