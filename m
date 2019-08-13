Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B29EC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 23:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F28206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 23:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AoUhZxDM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="b9Tb7LEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F28206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1/5Nb0tdZXVZC64DHNiBwZwXK+OVAXkHj76a/mwa3Q=; b=AoUhZxDMHglKxZ
	JeBOhr6mQRWRWtvnxroSoYDpGThUIvG7jlg03WaKXPozRWjpppJFIUjemxjP9APufWzuxfyYxbkKb
	mn/ld/cLdGOyJ4GfdOuckd8IiG3NtzSVx6PkQYOPSp3MfkxiTtrqQckjvGqw7lUVXWMkct1r2tJlW
	suZTnkAJEKesi1W0Ag+rJVxmRb9BuUDoJ7MwZtyutqhcKFGUtv1LSAJbLKEQzxSG2M/duX1Zk3usE
	7upuc1+zkm27CUcm+Kd/FzGJCxJkOhIZfovtL7TSBioDwkgy71kpXQGmo6nug5AvOlKHwyWVLxOVi
	7eLTQr0166hxO+/Qqw5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxgL7-0007PN-8M; Tue, 13 Aug 2019 23:36:29 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxgL2-0007Na-Rn
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 23:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1565739386; x=1597275386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hs97oi1bXDwsAKNjlRuuADCZCDyWXPRBIwJFAwfMXmw=;
 b=b9Tb7LEKqTB+cg5tb3q26MnNSP97OJmP+vMdy4zv+zLi3yUGXSeJ73qg
 e3mmd3xzG36CR8JM0lo2Q5tkhqMoR4yFJZT8uwDczOU3q7GhV2CORENSE
 pPl48Wd85tu0FaI4ybbOMEI9bfM0jOZDv1JfSy5QnoNH4t8REaWC9z8i8
 ZekB7XFQcyxd7GOPS3Nn74T1BnZb1iWPdlICVfRuHJWhOym+iwhJqaE5Q
 3RCcqsFv/RVWmc+FkUk5DROMXCyxYiiUKWeGEqZQUIJsYZzwEfO5KDgGW
 ktWfg09etpFs39UcT2iE4Xml+2yuDmjqNrfkJ5F2ro80PELd7W1GiPfMS g==;
IronPort-SDR: OjmbyYPYMtSxuNQAhTq+YR1a4ZmPSepQKvJppiVtFC2rjq3wHfo97EmWJ/JqDwkSVCkP9IuhYI
 Y0wNxKF2FvQ+Si+vY6YQU1YnUszKnaS9oudENqipR8PtV/+l8W+wnkUdz7JzINL6o5n5Y4RPUv
 8pYuV7K1fcqBjGJGMaT1wagc56pDFHXiLs/yoefIzCRjLvavJIXVbSIDtcoBrLWW6ZalC1Ct9Q
 K3xRJkWbQeutTG8ti0NiAAGGf9+AYfovev8EGuAxqJ9A2RoqiZokwNk8tasn4HSO/ql1guvq2c
 oMM=
X-IronPort-AV: E=Sophos;i="5.64,382,1559491200"; d="scan'208";a="116720846"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Aug 2019 07:36:19 +0800
IronPort-SDR: Fk4BRoMwJFMWcYNdvVwTApn6/6eCJ9Psl2ffTBUIU6tVGwY7Y+LecumRZqKCd2e37MIcwW/5R/
 4OMtm0p757Pjh5yneBpjkmb+HD/33rR639GNXgy6ALGPm17szU13TRne8Bp8zAW9JSvvcpfNle
 HGQi9OHy2kOGf4RNMpRsCwDnUhrdRvjC/84nrMXozvw/Qa1WbBr39cth4jfk5C94VzV8RGFRrH
 /3P31btHauO9iCoEatHbZH1el4cWxZn8ei3JwBP5u6iS+na24DNIY5W07vnrMzWde4kNSqOlas
 zh6dFtJa7KNs0SMqVrIPusB5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 16:33:53 -0700
IronPort-SDR: q4Durlzmo8hA1bu/t7Y4lpef2eadOlWFzAB0fDsP6ScLa6+o+Vd+rmyWPm/Rp6/PZmeH8B+hSm
 4Y/DMk8kspCtWOjCIBp2ePxOm2/iUzIyxg5sZe+TZArOGLTrVPYIFLffTpAPQ9BKJ1TqYjaR15
 1R8lRrWsl1AMpNLJnaeJGurfP0Fe7clKvYo8T//oFSmbmEBOVc+3twFBejBAchJG84kMXq5DAE
 UYnT+f1ANMpPAQ9myL06jLYosOpYfXsv+BlE/0kpP6KTgxQ2FhZRVxPJBTACmW+HputN8zDPip
 sn8=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Aug 2019 16:36:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: defconfig: Update the defconfig
Date: Tue, 13 Aug 2019 16:32:30 -0700
Message-Id: <20190813233230.21804-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813233230.21804-1-alistair.francis@wdc.com>
References: <20190813233230.21804-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_163625_010184_32BFD006 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Update the defconfig:
 - Add CONFIG_HW_RANDOM=y and CONFIG_HW_RANDOM_VIRTIO=y to enable
   VirtIORNG when running on QEMU

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 93205c0bf71d..3efff552a261 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -54,6 +54,8 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_HVC_RISCV_SBI=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
