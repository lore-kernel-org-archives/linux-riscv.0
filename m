Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EC8C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6105564F0D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6105564F0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xHYJv3n0zUTTnb2V7Tj3yIx+uPsE0bdUyR3QKJvqPTc=; b=TAZkvIwaOmlvOmvVhhZ+7Pv9J
	EFmTjKKwSXjskGQGEqns/bHZiVoxNS1ZaX/23MgfyoR0+0VZsGu6fHWQvtjn7XPSg3vCCXxnqilua
	GnP21dhkPPtVhateQxtYhNElL4i68dwIoEXLyyJY8jhua9H1n3VDDzfOAsnRgwXXIrDV3KLgmCacy
	S+ECGpbGMxkZiL08ScVRKaioJ0GrT9BUs73fWpoE773/x3BZoY/SETwWq49hhsMQI8UQhT4h07Hmm
	CU2555C0iBrIR9hBOcllLKAmvLN5mRTGcUl+Uk+L/U6+YXO/1GDW07LOcedEcTzib8HHOrv/3drfz
	8SdehYBbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcEQ-007F8M-3T; Thu, 04 Mar 2021 00:52:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXma-006MEW-7S
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vpdayutkx0rMuzdjAIPmoAiTQH0eKslfAmCx/+vyKMg=; b=J9HuUwXFhTBD37EDUdT3t5EZBS
 yLYG5T8HMYWBtb7XpMOugChka4Pl/ByhQiEqzuX6JTeZumNGrMXelmUHfFDYVHvtXZSGD1DBeqmBu
 kBx6fcqeJ8EQqevC0vRuKZsjcfBoQvYvtbvofwaEoBSsipZ0RWDWGI2xxamPL39fEILB0ulEMXjv7
 +3GHES7hi3hlpr3cSNoSf0vWstexiWrkqRUee4c52YAHK01DRFcNb7bGmwH93Kq/TZws8OtSoVWyQ
 qtcZwgmbqB1mHah4MFXe8tSXCABFRX7qSAz4oo93apPNtQXsdO/0L6GfvLvsgwQPK1UHb8cf7irJ0
 +sc2VeRw==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmY-0041Eb-A5
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802062; x=1646338062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cq6Qiw/Z67SYWe44YS0p0slZ5t+6fb9uqLYw/KGGbCY=;
 b=UaLyfZct9HwenbY/fAh9zt6h/a2p9AZ0TnCKffG5Y9ZO7zz+PdrQsYwW
 ka3laA+vK3yKupSxahFuVHyA5eReIErGFYcUiHkzClyd8dH/i9H8btgCF
 l3mbj/RQNA1KzcY5FL7tU8OaZNQf3zYp4juRgXcGjeqTyYe61LO2Wesh7
 i/2vRvVgOv6XL2dNNEj2Na5gcFJ9nJttizGjKUepbNRWnnG5m+s0benCp
 GWhEAaEqoVnAWxUmcJjBb1Pq5X6O3rvybXCY0k/rPmjRvtIMgjooIc+xb
 UwT6bsXQoHw5c+7O2ahy+7SMb2G2XrXSBG7ulBGGkAUU7rbuerpOMILy5 A==;
IronPort-SDR: va3vuQNj6mCZpYmHjMAN4i3MR5LHJf6/ZuyADe9G2xGqu99QmdUAP5rU5WZggUGvl0FyUOor/X
 ZVPaKFvGv9ImAdRiBOJ7aVu0pws7Sw7eEyiaRqyxO0Aer68IATO51h3ZNoYo0xtVBYb/1XGyzJ
 6F4KLQap7okXC+nrawim8hAWEJOcf955cY7Sp6kJf1YLqlON7uxbETCzwSAeEmy2jW614BuooK
 aA1q+ovrGe4AwmgCn8/Ek6885uLWHVzMbwboHy/ZJOlpCyj8qsE8JjN23x2YMlB7AfJrX/GKHF
 snA=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907145"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:06:57 +0800
IronPort-SDR: e2LUQUEod69x/tElK0F+HJD9/Q0cEvaw83eP1wOLERoElVQmpgVQZTKVXunHtZ0q8fCFjzzCOH
 0HwQPe4/p9Go5VCZ/Ic6oeOXvSAkraEY8tNgxmbcNUHevXKXhZblknPA2IX1ONqMP9O4O0G7op
 +D7AgISO1Xlot+ZwO+HZU0LL9ycR6dLKO9M1TzJatu/iABnJtHe46QBe2GXHteqJ1aCC2Zyfw2
 vZmSBq92wnePiApTRjUWjWJ3t7dOB9i3xvITmvvNSt9NPX1+/XM5TSZENslmNiDrvUN3hrN3gP
 PS/W/8Anlpgi3JDLTJ2Elqaa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:12 -0800
IronPort-SDR: UyakJ0SZO7XUdwUi2bQqA9gRsyIoV1MxrFz3ZohZDW3j2KqOBSYY2TacBraXG2n5oQSk6mDxLG
 SeWwZDw6y6/UYK08/r0zovxNgZ8nCTEz6XZUHgAqAqudbhuDqWWB73omgGxxeIHBMoEfUUpf12
 5497zkXoYEEjSZdx3OiuewEen7iMn+RPkAaIrvEMdZbqUMHQWvDYxJoeWEnbRdKJNPuRiDdn6B
 JpoVU7ITC2917OdiVsmzz5czL1Vz2AD5w6kZatKLSKzq8Vz9iBpW7Ruuq7C0/DolRhTnsHOSgF
 4rI=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:06:58 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 1/5] RISC-V: Add Microchip PolarFire SoC kconfig option
Date: Wed,  3 Mar 2021 12:02:49 -0800
Message-Id: <20210303200253.1827553-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200743_165152_C8C47A24 
X-CRM114-Status: UNSURE (   7.11  )
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

Add Microchip PolarFire kconfig option which selects SoC specific
and common drivers that is required for this SoC.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7efcece8896c..82b298bfd3be 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,12 @@
 menu "SoC selection"
 
+config SOC_MICROCHIP_POLARFIRE
+	bool "Microchip PolarFire SoCs"
+	select MCHP_CLK_MPFS
+	select SIFIVE_PLIC
+	help
+	  This enables support for Microchip PolarFire SoC platforms.
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
