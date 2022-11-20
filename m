Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36929C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cO/BF++9vGx5tcQHdKPfNL3/4DRpzfeZsXAf3/jH8GY=; b=KleqOMu5MsQNXR
	HPAw9UCJcAmzm3IS/X8T9Xxa2oCcu52ItWjfIHBmmY8iCbgDV0+++nh9e47hn6+t7W2RuPT+8u0Wr
	5vGSS+C8drsk73j8neKTBPT5li5K2fTWhSQG5fU3cTlFd3JFj6Sg74wbIDa4WFg8Y5xu1rz2v0kTq
	2CN7g3nAuYDurYQZJ5GV6e1MxwUx1AIpGmNsu+uLxYpCSKMpIPzoq+SMOq5YXBUsYIGfCDwykogGV
	tFnawpS7DPZ8BXqma4MEmcFMaXzj9XNw7JF81br3PCQUimciXHSoYydAW3CDUDnv686dr+gV0TZHQ
	45tJMTxHz0bzUf85qoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjQ-0031Dj-7L; Sun, 20 Nov 2022 08:31:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjO-0031Bd-BG
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F29E5601CE;
	Sun, 20 Nov 2022 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92241C433D6;
	Sun, 20 Nov 2022 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668933064;
	bh=d1nQsTvqVNRfsr2uUYzaSLywza3QLKAC/5j5ALiH8bQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cLw5+DQ+9ToprmmNHwUhprUPQ1qDgUgRmOQ/XwBXlinXnERWlkwGkbo6Nf3wiUID2
	 j99nQXmhf/Sw6QQf6fDa2s4rm/PtikR3EuxyMrEbhB0o12QGIjXLy7SkGFZzvIt+kf
	 zk6q3HF61/TVa99KZms1DW3PQbD5eVF9Y1Gx/tOmOV/McxM4qNn1XQ7yIMwZtzdPqg
	 nKREtt+C/pjNbbEhWw3bk1a9GgOqTamGjBXxV6Q4gWTPY7BbD5xuhkbKGP/RwnN5z8
	 wwOC3KBxCRt71Y8CLvA+ELcIroIjnz5IrKl5oJozbvWDwKroTVHbgPubhZppmweIrt
	 fmjgylK19oghQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/7] riscv: add Bouffalolab bl808 support
Date: Sun, 20 Nov 2022 16:21:07 +0800
Message-Id: <20221120082114.3030-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_003114_446174_F2E16065 
X-CRM114-Status: GOOD (  10.94  )
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

This series adds Bouffalolab uart driver and basic devicetrees for
Bouffalolab bl808 SoC and Sipeed M1S dock board.

It's too late for v6.2-rc1, but I hope I can catch up the v6.3-rc1
window.

Jisheng Zhang (7):
  dt-bindings: serial: add bindings doc for Bouffalolab
  serial: bflb_uart: add Bouffalolab UART Driver
  MAINTAINERS: add myself as a reviewer for Bouffalolab uart driver
  riscv: add the Bouffalolab SoC family Kconfig option
  riscv: dts: bouffalolab: add the bl808 SoC base device tree
  riscv: dts: bouffalolab: add Sipeed M1S dock devicetree
  MAINTAINERS: add myself as Bouffalolab SoC entry maintainer

 .../bindings/serial/bouffalolab,uart.yaml     |  50 ++
 MAINTAINERS                                   |  12 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/bouffalolab/Makefile      |   2 +
 .../boot/dts/bouffalolab/bl808-sipeed-m1s.dts |  30 +
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi    |  74 ++
 drivers/tty/serial/Kconfig                    |  18 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/bflb_uart.c                | 659 ++++++++++++++++++
 include/uapi/linux/serial_core.h              |   3 +
 11 files changed, 856 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
 create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
 create mode 100644 drivers/tty/serial/bflb_uart.c

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
