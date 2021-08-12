Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C05AC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7CE260EB2
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7CE260EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WCBqhXPVXXWcj3sjjnXk26wD4TJUuwBKrFfGBuSZGM=; b=hB92XonmM2AK1Y
	ZjeuOXBPx5wToXfE8yxt0wxu2tf6hFkicKnfttlCZ/JW9G0qH7siKfT0qyxp6ABa7zHZGfRwkul4Q
	Z2m/HO0TtKTR5V26Y/xYE/thdKl+Iroi53IMX5b4s2u5TVkccEwVN47KgayxlctgulDThQ6gGSYdu
	vSGfXt6vqWLAPxBWOg/s2T3i9O7BcP94dEe9OpWB1QAfykQLV5bEnPbFOu3deFT54ZneYdtVGQt3j
	P7UdF5zw4x5rY2W+wl+pgHxJsPAh6UnkMi3HRnSWldm+rW6WbJjj2HcNquwPuOA7mOHjUDg6YjNSt
	akgv46pPzDqBoj1gnIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5un-0096hF-KS; Thu, 12 Aug 2021 08:18:13 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5na-0093zN-OZ
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 08:10:50 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B51E740658; 
 Thu, 12 Aug 2021 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755839;
 bh=LbYBvz/IK4bQV1YLy48n6bzetxCj5Y5EuS3PD38la+g=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=q4DzlCk4kT0xgT7rT104hSP5qcdnzcs7TtyjZbD6GNzIjkpayA3BtK2hcTzzCGNeJ
 GN/iZ8nMrvKEsWN0xMsRbXxgj5m4tp59ccUBbQp/xlAs90+kp6A9XOl1d0Lg6Z1dXm
 I8QOJ9KK3oVQ9uAHMPhLDIDHpVJx/lHOx0XsIQYDSC87TBfLqc3340Um98aQJ6xHE7
 hB1SuAX7yIosccRyqtWikYCM75zOmv7HrvZIRKiy3uIJ7BenLejpjpMI+lyoMtqQ7o
 gcqk9nm3HCxH49Dqshibbc56ehgwGCGR5B1DAJwACoAuVTN7seknQ3ym5o1fq3H0L3
 PGeoOXkCh+blw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ard Biesheuvel <ardb@kernel.org>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 2/2] riscv: defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1
Date: Thu, 12 Aug 2021 10:10:27 +0200
Message-Id: <20210812081027.9242-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210812081027.9242-1-heinrich.schuchardt@canonical.com>
References: <20210812081027.9242-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_011046_971412_73DAAA63 
X-CRM114-Status: UNSURE (   8.48  )
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

The EFI system partition uses the FAT file system. Many distributions add
an entry in /etc/fstab for the ESP. We must ensure that mounting does not
fail.

The default code page for FAT is 437 (cf. CONFIG_FAT_DEFAULT_CODEPAGE).
The default IO character set is "iso8859-1" (cf. CONFIG_NLS_ISO8859_1).

So let's enable NLS_CODEPAGE_437 and NLS_ISO8859_1 in defconfig.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
resent on Palmer's request due to non-matching e-mail addresses
cf. https://lore.kernel.org/linux-riscv/20210726112647.78561-1-xypron.glpk@gmx.de/
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 393bf3843e5c..1a3170d5f203 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -110,6 +110,8 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
