Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E74CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=W3XEQbEkQtBJHFqBJG+RZ+m5JjIGoIoQa+rdihl3rA4=; b=der0F7APYOemcm
	eBVVWyF+8rIJ5vakVGSlIzA19QT0zZNFChNCpfdvyLPnAu3QMnu1d02ndwD2KsDZrYhUbDAk5/pvq
	ij1FetTQNGuBF2GIdtsyX3ukRatYxmHcu5BoLZ9F11/tq/c/TWkQOXqc4mPgq1UX0M4aGKvziaWb8
	7euFvR5LJ1Lk8tagzMnmSpQElY/sbSC5IeNSsL4CqegT9jjHLsUYbI8fDVsUATV91fuXwemLw5Czg
	Aa/JuD7Iap2Jq+2GSFegx1MHWcybWNGopp5VihN5sEFiUao3Ud2PekEOuhsxTzHKFZX0OFoMz5Snr
	PBFmBDrFyM6wminMhSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5KP-00000001oCt-1ea9;
	Wed, 13 May 2026 08:52:29 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5KN-00000001oBS-1UFd
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:52:28 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFnK54BJkz8Xs6q;
	Wed, 13 May 2026 16:52:25 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 64D8qMgL084414;
	Wed, 13 May 2026 16:52:22 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Message-Id: <202605130852.64D8qMgL084414@mse-fl1.zte.com.cn>
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl1.zte.com.cn with SMTP id 64D8keOm073495;
	Wed, 13 May 2026 16:46:40 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 13 May 2026 16:46:42 +0800 (CST)
X-Zmail-TransId: 2afb6a043a72b45-f9ca4
X-Mailer: Zmail v1.0
References: 20260512182743109yj_vhS7Rf-VNB9fdL1f8Z@zte.com.cn
Date: Wed, 13 May 2026 16:46:42 +0800 (CST)
Mime-Version: 1.0
From: <liu.qingtao2@zte.com.cn>
To: <krzk@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <marex@nabladev.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <rdunlap@infradead.org>,
        <geert+renesas@glider.be>, <quic_zongjian@quicinc.com>,
        <arturs.artamonovs@analog.com>, <robert.marko@sartura.hr>,
        <hvilleneuve@dimonoff.com>, <thierry.bultel.yh@bp.renesas.com>,
        <julianbraha@gmail.com>, <flavra@baylibre.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <liu.wenhong35@zte.com.cn>, <liu.fei16@zte.com.cn>,
        <dai.hualiang@zte.com.cn>, <deng.weixian@zte.com.cn>,
        <jia.yunxiang@zte.com.cn>, <he.yilin@zte.com.cn>, <bai.lu5@zte.com.cn>,
        <yang.susheng@zte.com.cn>, <shen.lin1@zte.com.cn>,
        <zuo.jiang@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <gao.rui@zte.com.cn>, <tan.hu@zte.com.cn>, <liu.qingtao2@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvMl0gQWRkIFpURSBMUlggVUFSVCBkcml2ZXI=?=
X-MAIL: mse-fl1.zte.com.cn 64D8qMgL084414
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.qingtao2@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Wed, 13 May 2026 16:52:25 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A043BC9.000/4gFnK54BJkz8Xs6q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015227_551762_FFB6D484 
X-CRM114-Status: UNSURE (   8.65  )
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

From 9eba3be2e9b4d5c77956258e3c5db95049c3a895 Mon Sep 17 00:00:00 2001
From: Wenhong Liu
Date: Mon, 12 May 2026 10:15:55 +0800
Subject: [PATCH v2 0/2] Add ZTE LRX UART driver

This patch series adds support for the ZTE LRX UART controller.

Patch 1: Devicetree binding documentation
Patch 2: UART driver implementation

Key features:
- FIFO mode (16-byte depth)
- Baud rate configuration
- Hardware flow control (RTS/CTS)
- DMA support
- Multiple interrupt mechanisms

Wenhong Liu (2):
dt-bindings: serial: Add zte,lrx-uart
tty: serial: Add LRX UART driver

Co-developed-by: Qingtao Liu
Signed-off-by: Qingtao Liu
Signed-off-by: Wenhong Liu

../bindings/serial/zte,lrx-uart.yaml         |   51 +
MAINTAINERS                                   |    8 +
drivers/tty/serial/Kconfig                    |   33 +
drivers/tty/serial/Makefile                   |    1 +
drivers/tty/serial/lrx_uart.c                 | 2822 +++++++++++++++++
5 files changed, 2915 insertions(+)
create mode 100644 Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
create mode 100644 drivers/tty/serial/lrx_uart.c

--
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
