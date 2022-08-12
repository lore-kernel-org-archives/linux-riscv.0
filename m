Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBAC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+hcooXaGC//PTyFq3YDD7LlVcegHxidBBLI5feUNNo=; b=Iz6+XKw6ajlG6K
	IyUGbMpeqRzkQtRsohOWelRH48Y5T8xgMXyjft+/F8LrncYjw+t50yjb0sBn/f/n9ZxbC7RF1t9SI
	46slcWht/ugYPbugZZceJZ8IdVt7AOfaPvG2dFU57szKrdZy9QXuJHXUrDy83MuOAN2QIpVydoPdo
	J7WqMXeLRSqe2qXnKcaaIQBkEcP34YBD9dlon+YoxPiKdkcIIXEBQzzBrgeG9Tm49LBgifjxBUWAk
	DqzglgdfmFDRTy+DQPmSrOm+FQ7TZIdaKZnaC6DKQG8d4XX4r+dn98oo996kyRNlQmVXJQnAQvC+8
	YbiSLagTOLY658B6r4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMay6-00CrPb-6t; Fri, 12 Aug 2022 20:09:18 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMay3-00CrLc-74
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 20:09:16 +0000
Received: from workstation5.fritz.box (ip-062-143-094-109.um16.pools.vodafone-ip.de [62.143.94.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 3B9743F4C2;
	Fri, 12 Aug 2022 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660334947;
	bh=1BTNGPLXVytY7MPrEFoGsJ4XchIM8uVLAazWA/Ntebk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=NgGrVPro1+n1XVgShsoVKBVhf/wiqRIJt6AmkfYiGUEZrQGHmC3DpVMaG8UN/zf03
	 liQp6u6on6/gY2cB1uoK84+M9OiG6Te410KFs+5oQHobeGHTiZ3b+BSTSMOcyjx6f5
	 23JO/ye1ZxuDhbRk3YJsyjGq86lVCo/TWAW0uikqc1F118O1RwIJuasPMbwOia3IZD
	 ZdotSdQQGPyc5PqBJWYNdDPxbqsHf1E9SKbAmDmZTrgkwC2aSuBUIn14gdp/nCiTRu
	 WXAoPSQrU++yjaIHTUWjp85bD4ZPQZ1qlBS6GaGOcK3b97LBr/8X4caCrueB8sjDre
	 oK6k5J/+jAqBw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: enable CD-ROM file systems in defconfig
Date: Fri, 12 Aug 2022 22:08:53 +0200
Message-Id: <20220812200853.311474-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_130915_687961_0FABE4D3 
X-CRM114-Status: UNSURE (   7.40  )
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

CD-ROM images are still commonly used for installer images and other
data exchange.

These file systems should be supported on RISC-V by default
like they are on x86_64.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..05fd5fcf24f9 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -166,6 +166,9 @@ CONFIG_BTRFS_FS=m
 CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_OVERLAY_FS=m
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
