Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3198BC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:47:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B4061260
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 15:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B4061260
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6e6ZYvKhjvRAMSr/98Y4l8t93PDjmf46rBZrC/L1hNk=; b=VU2cTKMqQFQlGn7046E+mIfGVW
	Stp5EfWV4jh6tC8LG3cvz+xEO/VN1l60657Emr579eiN+fuNlgwU4GXk6yb3K3M9ASd3/CiQTygwq
	OX+3Mb2Oo7tA1taMpCIKwd6CprN0h+qFMzH0J2/V+4326gDhOZS2+eNlsIRJYhoznMCQQYgPrp+Qv
	+Jb8mEDZSsAbGP4lcAKxJvPYxh9fm0JaeBmsceMbdG72jlrjo3s43yn/+QDOdZkUXqAXdG/1R0VLi
	fq93AzTt3PSJPNGkM3o6QUzIYKISabkvWYF5whDhHVRmJJxvufoGfbeJ3D9GSUzjHfSRWab0EtJsD
	6NZFX6sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgUav-000dwL-NW; Tue, 11 May 2021 15:46:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUat-000dw4-B6
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 15:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=J5J64PHzL2oDapIhvjuJs5+Ku143FJlS733gtsYTsps=; b=zVyZ33bCBvelvDIeRxOw9Ka9oB
 TY75r/Vpqakq5PKQTBS3n3vh9MpT6wTTFOzTOOi6FcF0DpVa9uCcMzn1++R7IauDCbb12MTmam028
 gTYToR7ztaeJRplb3o4ofZyhBTy2rl3xyEilROyQmB20VwgnaSQtlAdRNMfydnJjvbPIkGChJ2fBa
 /mMdQznABFInhpEC32CszEHWnp770tiMUZSOhfOstD3hJGj5v6C4CfT0s6iK3psnNZt9C/ws5x+b0
 YTnsAPOwOsebc3f2dWs9354ICWFVgJoIrf779UPfKYiWuqLnAFmibI8LZb41oEMK0gbhd25UKZqqm
 CG6u+8Bg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgUaq-009jGD-UB
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 15:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620748005; x=1652284005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2wFNoG8f366htGhQt8VAHF5ZyPpaUVl2/KxdsBD2KTY=;
 b=fAX2fUftE0e3WSJwlVg2mSsaDYRTdarhgPLbvh8uNDy026wJeR1H9KT1
 YA0wPqq8j8ViIN3Qq0jIC8hKUmf66lhn/qPt0vvh+f0R9yhF0A1H0peWM
 WMwF3r82JYbm0P1AANmEhN0HYB7bSLZwfPjuvGZN9TzgsRiPNFL1lz6qC
 h7ZP+7tKScBCfqW9Deqh2wUPQciHhzv9Vw/ZaFrJmIpwEaKVGxr7LA7ip
 QTiI7DSnX+rCkOyaWvIfDEMz+ChZE0hp9agK0zLViKq9FB08fBf7k4N0W
 6l5SH/gAfMO0mv4Cs7RybZDvTox9UeOR5TOOiPwFDX8WrN29UdYX4zab3 g==;
IronPort-SDR: 7VPdf6u1uldYlANmAUTf8Cs9wmc1Ja/pJAmKHvFRoVADALlJPQFQHYVm6ULh7yL5tyNfznn7OA
 Cr87ifwt3TW08bknBl+fs8kxmuTlRsfq2WocO9faRGtn6o+iJsZb+gahRcf7RpwqEte0UBg1CI
 aPj1pUJngeVg4aT00lvdl5UqIxz/i/qmZTmKPJc5GXyZLv/EmHJkJt7QMijpzxBQ1HS5w2yQy2
 8U7JzMFBVKzUajznsvtkpfdFSduXnOWJhZe4zT6MEeawYe8NCDcE8ZOo3XbTFGdPP4/j6Ca0Pf
 MKs=
X-IronPort-AV: E=Sophos;i="5.82,291,1613458800"; d="scan'208";a="120688921"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 08:46:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 08:46:43 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 11 May 2021 08:46:41 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 5/5] MAINTAINERS: add entry for polarfire soc mailbox
Date: Tue, 11 May 2021 16:46:40 +0100
Message-ID: <20210511154640.6831-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_084644_998192_FDF93C98 
X-CRM114-Status: UNSURE (   5.33  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add Lewis Hanly as a maintainer for the Microchip SoC
directory and the system services mailbox driver

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..c3ec9407ce2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15693,6 +15693,14 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
