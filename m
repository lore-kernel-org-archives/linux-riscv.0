Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3815C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGOXWlZXPjK9eyUaPGV0pX7MvFsLmjPBuhaiARSYrxA=; b=qed+DQCWmGjTO8
	tpHNmmoSMVCPZCoDzlaPTgexflSk3KwYPPwvNqZN8OFavUJHUeHXvnYhN4H/WK7NRP4END+EN7jIG
	zmJTcgcdHniuid49mk5zpJwK5Tz53JpxX6ainHTq3h+gMQWHwPAMCGYiNS1JnNm1OOsfmf7OZuvMB
	IdrjYRFaPPveOAUoOmema9mnxGX3OVNIou+cE3NiSPfP0Uhfxpiq6WzEnmvNFXyypB0OHa+61CSOF
	LQERRF/qf554P9RI9GQoR00jB2jwzm60Ikktc69eBvZqmWbJKog6uHJm322BvhYUi09EDZbm25X8S
	9b6Io7G27AIbrF2dFusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbhod-000ta4-Pg; Tue, 05 Apr 2022 11:57:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbhoa-000tYq-UN
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 11:57:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23584hp2001248;
 Tue, 5 Apr 2022 13:57:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RGZkwUJKEThI2ThqlcBsOIy4O4YxLaZE8yQWY5cVZSw=;
 b=5uqJEvk6QoTVRVQRBREnBXOC0lX62r5raYfwqm7TO2RLNuK3wQC4csM0O8RB39gjFP5M
 E6KGtfFjvPujmy+o1Pyu20Cb5b/Mn+TDIaadYNOsxUBdD969m+cOAoqg+5Dwmv44wsNM
 OywrI6+urdm72ONWXlBdL1ld6BfHB1uU/vjiCxHDkIhUuTL7oVX0k5Zy5XioL8e8/7xV
 199C6WZCaSL0E5QgaMwx0sir+hbh5T56x1d5WkfjzJONa6iNuaL+dkS9ItBC4bz5j/QX
 go1pdP8SVkcr/1UgxKT+7ZTINWKnvboG1bObo59BAznW8heYeu3PfhrRW8Lx346vCuCK pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du0ptsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Apr 2022 13:57:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DB0310002A;
 Tue,  5 Apr 2022 13:57:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58CF720FA4D;
 Tue,  5 Apr 2022 13:57:34 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 5 Apr 2022 13:57:34
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <arnaud.pouliquen@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, Anup Patel <anup@brainfault.org>
Subject: [PATCH v2] RISC-V: configs: Configs that had RPMSG_CHAR now get
 RPMSG_CTRL
Date: Tue, 5 Apr 2022 13:57:29 +0200
Message-ID: <20220405115729.1020889-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-05_02,2022-04-05_01,2022-02-23_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_045741_311729_31C6E11A 
X-CRM114-Status: GOOD (  13.77  )
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

In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---

This patch is extracted from the series [1] that has been partially
integrated in the Linux Kernel 5.18-rc1.

Update vs previous version:
- remove "Fixes:" tag in commit, requested by Mathieu Poirier in [2]

[1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
[2]https://lore.kernel.org/linux-arm-kernel/CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com/T/
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 30e3017f22bc..0cc17db8aaba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -101,6 +101,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 7e5efdc3829d..6cd9d84d3e13 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -93,6 +93,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
