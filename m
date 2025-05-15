Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C14C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 21:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZnVLTBMt08yC+/sM3I0cLHpCF9xUqi7c3LxE1dYUb8=; b=UkY5X/NJVPB5H7
	S7TjmPy2yx79rBYkaydDGr7FX+i9zdIH66uPljtnIsCya0RE2TJiI6i60I2vrUT88g9DBSA8vjjUi
	ORFAHsIWbJCDq00Bea+nDg2dFyS5f2LOEdARQT64FGpF+hb5nb509K4/uo7LXR8jYh0BEYAP342f9
	Jo2byDC0mZm/wpzxOl2GXOYIZbl+5iEePYy62sVnu+pmT3qLPfQp7V6w7UWhVFoEdashnVnR0suu7
	22GZiIr4HTXQdNWW8St+DCvoYf8/oH1hc09NrnJBUuuBkpxxcrjiZoY9mDscwpWm1geunVd7pFCQc
	Ms/4M+rNrAmWpZM1LVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoJ-00000001rAF-48ZL;
	Thu, 15 May 2025 21:08:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoH-00000001r9p-1ous
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 21:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 547315C06BE;
	Thu, 15 May 2025 21:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E239C4CEE7;
	Thu, 15 May 2025 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343288;
	bh=clLFMoksIZjNzvckYS4V6zrVwO38O0rMAgR70yMkijA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Clmeb4uTuUoYuH0AbeKx01O7wbV7atelt5sPUVLtMQlmZNY9fWKflAUDChDEj15jo
	 OdUwbrCu9AcLRAmlTEvkiYub/mlV1jA3h+PuHuXKffbtm9ntxcVUvzRw1tOYFM4caf
	 pwqD/DCBc0ctZ3NBledLEFEKy1ouu0abfrmNNBUthyW2xQcZau3/ZOUuwhyZfCRmVC
	 A3ww5zeM4/8oqNLfps7CbAJ+Z+ER2PLY767qcIE0rVv7NqLEyJJgmzh0m6maT6hNlQ
	 tFIM+s18wCrE3PMdAdHdtk36XZNUglbdwuoAC1OdJn/pApYiJcbcRzH1svbfTIN66x
	 XDNiLU16AAWLQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Thu, 15 May 2025 22:08:00 +0100
Message-ID: <20250515-stretch-posted-2327312fa5fd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=29OFmuara6JO+ssHbYgrp1f7OLZ7r4ICupGKHqCK92g=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4Ru7p73/cGeVMB/nzDmigYb9AqcdLhesvTEji/nn5 V2bLslFdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAilgcY/uc4MDIG769ZxKKe WvTJrMtNTUVS4h4TK4+fTfil3HUx/owMC9nPuDLtrFok0ZHjZ/N6/S6230ntc0IUWF3ePHL2OVn JDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_140809_518218_C3B0E015 
X-CRM114-Status: UNSURE (   6.44  )
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

On Fri, 02 May 2025 03:30:40 -0700, E Shattow wrote:
> U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
> with StarFive VisionFive2 board target (and related JH7110 common boards).
> Sync the minimum changes from jh7110-common.dtsi needed for boot so these
> can be dropped from U-Boot.
> 
> Changes since v2:
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/4] riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to syscrg
      https://git.kernel.org/conor/c/724a6718ce21
[2/4] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
      https://git.kernel.org/conor/c/59404dceb303
[3/4] riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
      https://git.kernel.org/conor/c/635918111453
[4/4] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader
      https://git.kernel.org/conor/c/d50108706a63

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
