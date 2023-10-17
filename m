Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9316CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QuQbyO2pcA6VHPwZvfs+bx5J8fq8EBpf+KF0gmBPukQ=; b=QbR0+2heuOb0lZ
	S88OhwcawDyyUk1ZynCBTmYlx+ddsAjs5NO3/QXKUnuRDa26lSu9zq4Do2ysKC8s4t9yB9Tx1fu8H
	c2yhxXfNZFGwiCqlpGUB9HOnF48Oxz8Te5Wll5wFH+m8yG6PqsMEn9Q4M4UMAn2LXbiKwhzEHjBXr
	VIml0xqo2wYUe0BO6iy+6L+6hAZBYaPezcGgKiMfeByIHYDNrabLyJwDvNoH192WI0ji3V88VQ/8E
	5UMjdxUaXqEhtW9i2Bm36llDyULsJTfgThtzEM/MgvwAb8skIiopeyxJ7HKdciIbBO7e1TkXVfRF1
	rLtoy06fL+mnUF2Aodww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbf-00CTWp-0G;
	Tue, 17 Oct 2023 13:59:35 +0000
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbb-00CTWK-0I;
	Tue, 17 Oct 2023 13:59:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Subject: fix a few RISC-V / renesas Kconfig dependencies
Date: Tue, 17 Oct 2023 15:59:23 +0200
Message-Id: <20231017135926.1240101-1-hch@lst.de>
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
