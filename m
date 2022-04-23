Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89C8C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/A1At5088dZbSiNR760FnEPlAhLFinqgoZMC7jYJAY=; b=VE0gBccnGWOxwS
	UclKBHLjyYVp8/GXuEqNB6EJ6GZuXTEaD8zDRRk0zlDXczf7+DspwZ60jGikhmWOqCkmXjlhILYB1
	+WrJuVMFOYWt8uQGB0qSaA22kXXupHuP9+iiA87RvmKJB9tVWTsENeB58CxFXG9xHzCB3nCVJmI51
	g3xOtznPgNXwkqLO5g7PDuFin4jEMGJAoghFlvLL4+Hh50+uveNoYfYdByKLaikebN1XNs3UT06LW
	SXUITgLyjG8aQLzfoHUAcK5seYrRNGDiSd75JbtAq34jr89O4As+HklWo7B8EF53m9xWQtT2xvbni
	QJ30FZq85Lt5/O4aO72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4ly-003API-S5; Sat, 23 Apr 2022 01:41:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4lv-003AOc-Ij
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F220EB831BC;
 Sat, 23 Apr 2022 01:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56BFC385A0;
 Sat, 23 Apr 2022 01:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678071;
 bh=qrzYzxe8RPq/FTFvyHvEQiLMHVcoU2W9jDATI7yqDs4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=poTLwV7Fn6eVR3x528X6sZX8AfskaAnoyD8sY4EXsXurxN+orGD10wRNQ4tROykQf
 rr77fmDf/rPv7dlOxcgPYX5KrxZgFFDMskwj0WiG9E4jetllWLzEYJTmNxzCiQttXa
 wVRCSRtHEYigTh6bc+rONd1QLAAEy0ynCHYmf7wHs2t5voAQpHajFI6o6uwFq6m1II
 HrKmPTJBL5og0tD4HDDLwuQceFV+hPErLO2ygY5LGbBVXaVSS0uNyILXorha7/8X3q
 Q0OakPmgJ0N40WJyaFqJnuF/tGmepYqy0KdgrxSTcqv5Un9nhQkEClnWLWsN4Ep0Qt
 poVxeL4j0hcEw==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-3-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:09 -0700
User-Agent: alot/0.10
Message-Id: <20220423014111.B56BFC385A0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184115_795337_B75BCB57 
X-CRM114-Status: UNSURE (   6.95  )
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

Quoting Conor Dooley (2022-04-13 00:58:29)
> CLK_ATHENA is another fabric interconnect and should be marked as critical
> as with FIC0-3, since disabling it will cause part of the fabric to go
> into reset.
> 
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
