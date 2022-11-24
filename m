Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC9AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CMK9cj0Lea6WTjzZdIveHdK9kvZqeDcZ2MWKt62wWiU=; b=BOKs7r3iT0W35b
	jdWgookxa2nbMFu6L74vv1DSnMExi+EBrbZQ3d92QkS6iNiYCtgQ4rJPghn/e4nAS0voXmvyvZWl7
	eIMCVNMBrfrWSAk4jS7iVG7T02B9Y5xiXRkY/r+0sshBndB4MIS1nus8ybGpyGW5bf2bkg3/ihOHc
	X3j21MrWndjmkJfJm0ELAbozNaU+TslLN/IcIN/p5wa9k/Hv5wdHZzY635dXqA3ubrNYMMi31bgBA
	mkBb9ms3+EB8IIMNZbDaJOSJ7Owi9bJ6VHJHIz+GPkzij2tPQKJmdQp3l0pFqxd0qeGcs3/5aDdV/
	SrUzaq5S4yWitDVwvrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC8G-008hBS-Sv; Thu, 24 Nov 2022 13:19:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBvY-008bEf-Rs
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 13:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669295165; x=1700831165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dvTX+Ug67Rydtz7WIYzbSx40KvDV6tXZ/nyLRF8t6Ng=;
  b=D/r5ZRQjZjocOvXFr0qkAThnDW28AK7GHIT+SbnjWSWBVyp1SviIUujl
   GzBDyo2won8dH2nKmlIyPxCVC3lMLEA+49u/s3xsq3Cd055dj5PGTEJ7p
   TKT5r4g1RVPhcfNu1ZiKlegj56CMV4dvesCH3jPk3cJFtUFFZ8YPmp32B
   3E3fGh1W9bJu4mcpjsmmSkmgSFCZPe/9tx4P1biglHEuJfN5bLZP/9EWS
   vC92437O+m5aMtcvJEIDu8Noftb+2AAwsw0NZeqyJLPknjxeAx4Cdj+G1
   ZHqryeKKRg2gofJLBOf9rg7A/K8zFyjPyGrAFf+2szAfuZcAOn6FDOz2h
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="185029281"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 06:05:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:05:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:05:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Andrew Jones
	<ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] riscv,isa fixups
Date: Thu, 24 Nov 2022 13:04:39 +0000
Message-ID: <20221124130440.306771-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_050605_013218_25827249 
X-CRM114-Status: UNSURE (   8.02  )
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

I noticed today while looking at the isa manual that I had not accounted
for another couple of edge cases with my regex. As before, I think
attempting to validate the canonical order for multiletter stuff makes
no sense - but we should totally try to avoid false-positives for
combinations that are known to be valid.

Thanks,
Conor.

CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Guo Ren <guoren@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  dt-bindings: riscv: fix underscore requirement for addtional standard
    extensions
  dt-bindings: riscv: fix single letter canonical order

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
