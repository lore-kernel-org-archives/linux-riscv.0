Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A2EC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EBqEFJy62fF/nm5/mH8/dL+yafE3qYq9iQP7xwSee4=; b=ZSTObHDdAhrnMh
	0txmA7y/srlgCt0hIyCm664/erMbo7MJldIxl3qk3gl1eCmO9kEj+5ug6i8dS2ANVv2WvVTjHcIG7
	0MklNohASTcgICQ5GM7kqr9zoYIXTH6/t6xbQzJefY9Y1L0bwsVxiLFLlzp9m9zLO18bedTFog13y
	H17j2HptcZxwaiXX74k+MTB8e+p0OoX66t0H3MV1DwRxDNVFu4IGuquv9QUzrtV9SG7H2lJa6sqZy
	nK6KP6CR1SQv1ezQtTfVk/9AEpvmwsXdhNhY8LcQB0W5ORBexljb/ERBrMUPrjiKxceynwFynPbN/
	luM3S7aZEFoPqeShIYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0OY-005a7q-0B;
	Wed, 19 Jul 2023 06:10:42 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ON-005a01-1u
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XZczJwJaHhAN1q5dP5DFqCOA0C3ss8tzv+iR4zhKwiw=; b=Asxxj1IBXJgbx3wCQ5Pnm1SKG7
	EJyVqQDporqQWlK7NMIcV20ezq31lG93Info+oP16cuNGEdvkVmKOFDUuogT/vc6VZNcTHh+mJvk9
	6FbZJlEXDcwfh7Y6WM0+uSTK5oMkA9G4ToYij8GSl6a3NIlkxFpADmoXAyWankGEjY+SgTph9d1fb
	+YtIr6cgogkUwGreosM+SCodMPsgccnSgzKiyT7UoP6c0LwgSNmYl/Gpt6Rtq+KSv4SU35b7lAHlG
	Sa9Mf8YoOwd42Ul17nrbnB5qtLi543+dmYb5sr0pJ2ciP9kMbzIR6Cm16rTQiu8vagL99GXcmDPFt
	dGq3RF1Q==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLbk7-009zZe-1g
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 03:51:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A0E3724E1C6;
	Tue, 18 Jul 2023 11:49:40 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:40 +0800
Received: from ubuntu.localdomain (113.72.147.86) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:39 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] MAINTAINERS: Add Hal as a maintainer of SFCTEMP HWMON DRIVER
Date: Tue, 18 Jul 2023 11:49:37 +0800
Message-ID: <20230718034937.92999-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718034937.92999-1-hal.feng@starfivetech.com>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_045125_151200_D1988D7C 
X-CRM114-Status: UNSURE (   9.23  )
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

As he is the submitter of this driver, add his mail so he can
maintain the driver and easily reply in the mailing list.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aee340630eca..5056079ade77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19256,6 +19256,7 @@ F:	drivers/net/ethernet/sfc/
 
 SFCTEMP HWMON DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@starfivetech.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
