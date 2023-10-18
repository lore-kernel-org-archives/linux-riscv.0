Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF2CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 05:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/M2cWJAe6ZhnlcuBTHHlEN8T+7d88ey3w1LynIK9rRU=; b=Gw0YPB1f4o8hGc
	Y8X4QLhPcGmrerlxHXW/MI5KKpDFQuSgnteBSRG2qQcEGnvwGi8j4mvvgS6vlbcFG64YtiwLCxBPj
	P97exIWc4kytZ1aQEtT5npfN0WXAMnXCTC4ELAGreRodvrkw3V+LbkbulhMWJUiO7CzWBhSzEfzZP
	VH2vgvix/5IFZ4WH/8HFb8gwHM/M/sEdHMNLEndXK9lsL+Q7Y3ktKwXer7X4rcQaZbREcvrjOeox6
	3/aDQQdTFSJo1PeAa5otuuK3xNtOzUIqyWPSVpP+fFCh9cabx5rDwf2NbdW/2crQmmuw2Xxe50ISa
	fYTh4mGCEYatTy6tKWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz5C-00Dp3f-0L;
	Wed, 18 Oct 2023 05:27:02 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz57-00Dp2u-0t;
	Wed, 18 Oct 2023 05:26:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: fix a few RISC-V / renesas Kconfig dependencies v2
Date: Wed, 18 Oct 2023 07:26:51 +0200
Message-Id: <20231018052654.50074-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

this small series sorts out a few Kconfig dependency issue for the
rich set of RISC-V non-coherent DMA support.

Geert suggested for it to go into the soc tree, which is fine with me
if I get a stable branch for it as it is required for further dma-mapping
work.

Changes since v1:
 - select DMA_DIRECT_REMAP from ERRATA_THEAD_CMO

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
