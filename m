Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685C9FA3753
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368FE214C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tlc5U2fA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OXLiLX2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368FE214C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VoIp/rQ9v+k0fSofb/r2LYlyCQra12Di26PTTCJCy4k=; b=Tlc
	5U2fA2w+qX9i+CUu7/GvjGnnn6am9K3HothLKRiMER1OHa19gsulxArj2qrjQRa9Bor2LMDPdJUcx
	/eWjpUDSMevUyiKEy9S69DuakJczu0wic21tZfRDMJJSJCF7OxzHFqFknhqKH/fTVIWpidEz7qrkW
	znzy4Ma1SZ3EOoEr0YC2m+yYQiy2BLbFYWnolMs3WuJNMML0ay8SOvlo2H5PPcU6guzVoTRSsCljq
	UV6weRGNsqviPiht4v/vpooMDdx86C3x8an4M+EMuO54wWe8MIT34sAmJCPVbL1ZN7F+hg6GIY1Ig
	TYhBCKCLTGDYQV7Z5onFUF2jNJe5pmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9x6c-0000Gd-Pd; Tue, 09 Oct 2018 18:51:42 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9x6X-0000Da-2D
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 18:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539111097; x=1570647097;
 h=from:to:cc:subject:date:message-id;
 bh=QbO4SRoV4FLbe735YZxFuxe+2rYyhQSJagMIlJj9fzw=;
 b=OXLiLX2vf99FolU6XIn4Y7pT43g1OTKZzo5Et2Dkc+fEtoWnCLUh8map
 kQyLDNgXeE2OkBHjofRtTf/xvz44p/KwhE5RJxM0jCg4LEgwy6xLCXoDp
 A+ABU38v9yDi2PRCwrsxSd8gJqv9dOCJii2/gLyxq/9tNNAyG2CSxEEvq
 ahDqndbWjm7dCjRh3wy5QogfCkUqEAa75Qx5ApPwZdBfEQlG0SFssLiBX
 ELCQ3dzpeVbKtzOMzj+PWZUcIpQBcXuMbpk7oR6QHQ1DlzPxH5kN6VFYY
 i+yRbzJNUNR/iu8xAXdKaLHoStFmV7HuBnX46jzLDvHzEwweGBy36TUqq g==;
X-IronPort-AV: E=Sophos;i="5.54,361,1534780800"; d="scan'208";a="92668394"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2018 02:51:26 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 09 Oct 2018 11:36:52 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Oct 2018 11:51:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: palmer@sifive.com, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC 0/4] GPIO & PWM support for HiFive Unleashed 
Date: Tue,  9 Oct 2018 11:51:21 -0700
Message-Id: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_115137_230167_BB080D01 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, hch@infradead.org, atish.patra@wdc.com,
 robh+dt@kernel.org, thierry.reding@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009185121.LgPqUB6JXwDce81iHjTZpW6O2pVK7yAcBdS4fFUcudw@z>

This patch series adds GPIO & PWM drivers and DT documentation
for HiFive Unleashed board. The patches are mostly based on
Wesley's patch.

Wesley W. Terpstra (4):
  pwm: sifive: Add DT documentation for SiFive PWM Controller.
  pwm: sifive: Add a driver for SiFive SoC PWM
  gpio: sifive: Add DT documentation for SiFive GPIO.
  gpio: sifive: Add GPIO driver for SiFive SoCs

 .../devicetree/bindings/gpio/gpio-sifive.txt       |  28 ++
 .../devicetree/bindings/pwm/pwm-sifive.txt         |  32 ++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sifive.c                         | 326 +++++++++++++++++++++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 240 +++++++++++++++
 8 files changed, 645 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/gpio/gpio-sifive.c
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
