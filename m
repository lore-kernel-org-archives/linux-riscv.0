Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DFCC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzdMMQqXns/NwbbYC1qo/Qn+a0nvZi1pTTlsqbjLsb4=; b=sT89ZtbT/1AKax
	b54l30y1JA1guQgcr9VtXT1wXCRuAC7252E+4Y8l+L0rYvt9vdsDeCcv7sRjhLM67kVvify1EST92
	bDJeQuhCfWcC5LvWVMRzlRsp5wn3OYA8GqU8FgQ9E+mSdmGsLHjADmmSVz2Db12smcL2KalnlPG8A
	URbIINVhLeU1yqHvG7gbXbpF8aoRSFa9spx3rHJKO3w2wRj9yjkonnC6hToyIarGcaq4ALSUOoYP3
	zKdLkYApM1X9MSyocgUZw7GG2cVAPLSXghrR60DYAW4uBL41zVbEUOqfglNNIqJIzn/WuCRSZofnm
	6hay5q4LRDSO5XsgWlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThx-00000000dBi-1jA2;
	Thu, 16 Jul 2026 21:33:29 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThv-00000000d9w-1BHW
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=rjik6rfJr6jtR7tbaeLnY3KgLa11p29zALJ1ileAtbo=; b=vlINY/9o1BKc2JUgxurQtRekV6
	K31YSd4AJV5fiOjPpecRvrkKf40C5Rd/J0c1zYVEpGVmXzcO7IyiMOa+Bn2yN+HIUAiC2lYwlcDeI
	N4lod96Aqz2qn0TIlhvPu6YJrDWMA0WNjsT4CVReKng977NEHG48I1sWBj2NH+07A/kX77fgcBffl
	F3fzEaC68wuucEouSK5w1bSFVTZrsqamJQFBWEgpZjePfo9R6/0iWKB4N8ss/CEjU9u8USy4KlJEo
	xffsCVOBybinoqk//2ewefGNMas8ZwuT3WHH1F2I044cThlwO+UZ/QX58ia9bE0zIRLsSLmsvh8w+
	7knTmXdQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThs-00000003GYb-35bo;
	Thu, 16 Jul 2026 23:33:24 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH 1/4] riscv: defconfig: enable RFKILL and RFKILL_GPIO
Date: Thu, 16 Jul 2026 23:19:01 +0200
Message-ID: <20260716213314.3027969-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
References: <20260716213314.3027969-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143327_336421_1C07BCD2 
X-CRM114-Status: UNSURE (   6.64  )
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

The SpacemiT K3 Pico-ITX requires RFKILL_GPIO to enable Bluetooth and
WLAN.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511b..ed6b854065c0f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -100,6 +100,8 @@ CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
 CONFIG_CAN=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
