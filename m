Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C308C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 14:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F42861076
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F42861076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6cwcuq9ZAY/jLTwbXtSrnJO1qu0bWPYpG5qQKCsAMk=; b=P4ycq86PgEpc39
	siujFg/Dvq64XGX4ycnZM4skOfbfHLR6AMWxLTSdJRm1LjinwXrApMIuggjJhCglt2I6YjC0gAeZY
	UQEYkxpF3M5JfjYi+L9tavpi+sqI6tdMkshiISVF5beK/mlUIlHS/YDmZK2phai4mwuVrx5UQxEQQ
	4My2W4IopsytpjN3G67v3Kbc9rJk+sAoHTxedgg28f0gsw07gxYoSWyV9FEClIH5i6LhYndwRksxA
	U4XrDuSpRuawcaATUdEuw+CyDetEeutRRBgvMO0VygDVYWUTki1QiHlf3sJQVP7XSgrzuAYnrFK2Z
	c9NCH2dDRBAkE2cCS/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk5S9-00Gbm1-OW; Mon, 08 Nov 2021 14:16:53 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk5Rw-00Gbfo-Q4
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 14:16:42 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DQ0aC021026
 for <linux-riscv@lists.infradead.org>; Mon, 8 Nov 2021 15:16:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=G71bZgL+omdARXJsxJ7Rn9d3usObUVkXEy7Tf8cjO4k=;
 b=kxOhd4g56BgxzvisXWf7NZfeVLzDgyoAJeQOdV+pXWMn7VZluq+jeJIzCMeOobu1PhQU
 lex0yIn3fISpGLDQKYRt+HTlWHQeiSC9DZ2mk3X4r3tLPDOUSW5M4fd64WN5000SEBVK
 2rHA4Fim/J2GZN0sdRRcEKC2SnI00lC6MfnhjeGv0n3r71vswWTHf5W8yPZZoN4TvT2P
 ioAZHbnWylOkbNDAXUqO0070elboW+N497DH7CEvS2njLrSQAuGpGd5RhDjHSAhyLtpG
 Ff8BwfHrNy+fvocuECj6vs2gQLXXa/M+e5mckYWIFPs+ZmXYQNoq8cWsZNEOMYBE6QQH Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c709q29h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 15:16:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40AB510002A
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 15:16:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1D0722F7DA
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 15:16:31 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:16:31
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: <arnaud.pouliquen@foss.st.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [PATCH v7 05/12] RISCV: configs: Configs that had RPMSG_CHAR now gets
 RPMSG_CTRL
Date: Mon, 8 Nov 2021 15:15:46 +0100
Message-ID: <20211108141553.12708-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141553.12708-1-arnaud.pouliquen@foss.st.com>
References: <20211108141553.12708-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_061641_246140_C1F73054 
X-CRM114-Status: GOOD (  14.29  )
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

In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
to rpmsg_ctrl", we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
cc: linux-riscv@lists.infradead.org

---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4ebc80315f01..96344d7d4e3f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -96,6 +96,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 434ef5b64599..99eabad7ca0f 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -89,6 +89,7 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
