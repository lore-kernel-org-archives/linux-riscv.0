Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=boDvKBG/U6WORtORHxMQSVBQCnIZz7kbQQsZ4n5IP7Y=; b=y3e/Mx4l+Ua+JK
	oaP9MBdgECfHCJVBY/xbzxbh5hJkLymFK8ZH4Lr2X1fLPNLi1KTjRi+taKf7CvWvMOa5aZWtcclFo
	FTfnJNKB6cmMgBriAhiU1JywttquHSPh1VzfjDHDR8GX7GfKj3+8RXxO4wx8c8IRQ4DsvbLn2xyV+
	8yU8bSl4hgp+80NYzFbxetu00ASQX4X6qArDRqdKcYESh98OhGaVx31ipky8zeUfXi2kQeZDmtRGn
	1Ye9V+1uFN6IdzVZZuS9/6Zk3RNHdn8IgZt1Ajlm9fDUgM2vwS5H3aBw7k1V5PT2Tjgi6KNwTQNv2
	0KLukW7A1IEZk1RERbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXer-00Cdw8-5C; Fri, 29 Apr 2022 20:56:09 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXPY-00CYTn-4h
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 20:40:22 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 4C33192009C; Fri, 29 Apr 2022 22:40:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 44D6692009B;
 Fri, 29 Apr 2022 21:40:13 +0100 (BST)
Date: Fri, 29 Apr 2022 21:40:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] serial: sifive: Correct/improve baud base handling
Message-ID: <alpine.DEB.2.21.2204281344190.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_134020_405021_104C471F 
X-CRM114-Status: UNSURE (   7.21  )
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

Hi,

 While fiddling with other serial port devices with the use of my HiFive
Unmatched board I have noticed we do not correctly report the baud base 
value for the SiFive FU740-C000 SOC's on-chip UARTs.  This small patch 
set fixes the initialisation of the baud base value and then simplifies 
handling by removing now redundant duplicate port parameter.

 See individual change descriptions for details.  This patch set has been 
verified with the HiFive Unmatched board.  Please apply.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
