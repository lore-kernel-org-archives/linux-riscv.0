Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF21C021B6
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=auRwbKpt9E3FpjKr9GQAgtkIAX9k1aj9Z2x0tIjD37A=; b=VJKl5rea65bEh0
	2hQIuxDPumol1LIqdxkVY2s6dCFgaHX5OmBPdQVic3oe/NHEWfR59AONiayZtRgPKk+ofzfi2P4C0
	LnBrWIj9P0oFlsU/zJfGa7XrCCxoT/E9nwYlFFiQofvwTxVGh2LP9nHYBP5iUAwuGC6osAwZ+Vz+I
	eyMGuYeGUa1bEVCNXXU6DqiryAabAl/GH0DnijxahLY3ENBvN+fqjIJFZXTGGAEbPqKSb37aSv4b9
	Vn8Iy1s4GxxnA6spYW2XyrsAF3ELORJlyTiB4fYDPOcQe2fbqaRaO0zB2a4PPPtMZ48MQA+JSs7s7
	a6uDIpxjxTeHo1qpAD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeG-000000085Vp-0tQz;
	Sat, 22 Feb 2025 13:34:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeD-000000085Uz-3ep6
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 13:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95BA35C4BE3;
	Sat, 22 Feb 2025 13:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2806AC4CED1;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231264;
	bh=H4tUwQx9kES2MajEfXKp73q3XQ8Ce/GEw2CwrT3eRLI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=se1oLYqnmIf2Nu0e9gtRB/WJE5/v1ZTFQMe+fsmIZ/kHUFw2ohNOyVk7kk5WMtCP5
	 YsM4bcVVWQKxtCYS0AzJmwui6/Eon43YZK/KChPZuxEO9FUusbRGJS3ARFEmE+sBM7
	 dhsoodqDuxrw24GYMriL+64sXwZpGaF/RwbP2cODUBZCueY6jrg7DvjgRjAa4IHo1j
	 amfC/LmIG03HWETW4u5x8/1NY42Uj9d1+pLXUnPCtXCfWFIo32gkY9kzDiR+crqhAg
	 7eGrKpya4s8Tr5TwBDoplxhHX0wPyHG1CewDhLeI3SfFlUtcIjEEoM8Nc1HZg4Xk1s
	 obdJCUasJVcmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BDBC021B2;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v2 0/2] riscv: dts: starfive: jh7110: increase eMMC bus
 speed
Date: Sat, 22 Feb 2025 14:34:14 +0100
Message-Id: <20250222-fml13v01_emmc_speed-v2-0-3ffc5b1f5663@hotmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFbSuWcC/32NQQ6CMBBFr0JmbU1nAEVX3sMQAnSQSSglLWk0h
 LtbOYDL95L//gaBvXCAe7aB5yhB3JyAThn0Yzu/WIlJDKSp1ISlGuyEedTYsLV9ExZmoy7XCqk
 zt67QBaTl4nmQ91F91olHCavzn+Mk4s/+70VUqDjvDFHRsubqMbrVtjKde2eh3vf9Cxahi4m4A
 AAA
X-Change-ID: 20250215-fml13v01_emmc_speed-67812bd9b404
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740231263; l=1048;
 i=maud_spierings@hotmail.com; s=20250222; h=from:subject:message-id;
 bh=H4tUwQx9kES2MajEfXKp73q3XQ8Ce/GEw2CwrT3eRLI=;
 b=AKDOcG4/fMadkNRP0txy87XkPD7kQ0hQednAf1KSYpBbTV8P4jL3Ix2rrQUFz2EQo2GXT32kU
 zYr1qxlZp8ID1p+0GI8Vt88E2EzaXlaGc38fx7tPZF1slc3bJXvwH+n
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=Z2m97WkDS9Sm3JnKpIpH4JwQtLm2Yw8oFCNw6uMBqb8=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20250222
 with auth_id=346
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_053425_989799_02DD53BB 
X-CRM114-Status: UNSURE (   6.61  )
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
Reply-To: maud_spierings@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The deepcomputing fml13v01 eMMC memory slot is currently limited in
speed by the common definition, increase the common max-frequency
parameter and specifically increase the clock on the fml13v01 board.

This achieves a x2~ speed increase in seq read/write performance.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Changes in v2:
- Move max-frequency increase to jh7110-common
- Link to v1: https://lore.kernel.org/r/20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com

---
Maud Spierings (2):
      riscv: dts: starfive: jh7110-common: increase mmc0 max-frequency
      riscv: dts: starfive: fml13v01: increase eMMC bus speed

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi                | 2 +-
 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 0bc08ec1ff5a32449d2b04704173dbf3ebd6b014
change-id: 20250215-fml13v01_emmc_speed-67812bd9b404

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
