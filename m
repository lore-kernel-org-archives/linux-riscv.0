Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGyOCm/7HUBcim0JW2xssqRIafIHowCQZuE8i8jBnI0=; b=Ls4InCI3XLMUVm
	GEi2P3LJn3OJws/X6Ss658BgY1m68Du8pYKMmxNd7PooVP+8LwaTqFJ39G6n4tXLrIF2GLd3Y4jrs
	7s54WWW92l3FW6t1ic76Ax9yWGqAY5epJTCdVl83R3lMkEH7a71p6C/d6DoOzlxX+ygOQ0QY32abT
	S2yFOBZWyGO5OEONeyXuq2LeljvRxvBbDgLKk3vWNjfugfR+km2TmCS/XTeCk9F8Nmc8uP/6MsM2H
	+hUklAtyS/L5uKTRgetNde1x5wvwZbBY7LnbcmlD+Ff06rz2UnTMzlVjp8CsXtMAzfq6QCzyomeP+
	+fnMrmNthEOhSkrxR7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03vC-00000009k2F-165H;
	Thu, 25 Apr 2024 18:34:14 +0000
Received: from forward102a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03v8-00000009k1I-1hGk
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 18:34:13 +0000
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:5408:0:640:72fa:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id DBAFE60B59;
	Thu, 25 Apr 2024 21:33:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id sXRDEK0m5mI0-jm83D1zP;
	Thu, 25 Apr 2024 21:33:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
	t=1714070037; bh=pt7zXw+VM0FjK7sS/SShMwgvNUfzk6AwbcgerfZYJd4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=XqrmH6aVeQjwhId2DnW5q0w0p/2zFpqNodeK04ukC+gVUDhFkyhDrravQAWUxUx59
	 Z0KOCXoJCts5VxQLgFU9dX3iw6m2a47/9aoz/+qWO0zscdc9awA3wnF/wBGXztYvpy
	 H9lkvgL4Bf2FHZ8ey5u6Qk06+coHLfx80/k7esQQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@ya.ru
From: Konstantin Pugin <rilian.la.te@ya.ru>
To: 
Cc: krzk@kernel.org,
	conor@kernel.org,
	lkp@intel.com,
	vz@mleia.com,
	robh@kernel.org,
	jcmvbkbc@gmail.com,
	nicolas.ferre@microchip.com,
	manikanta.guntupalli@amd.com,
	corbet@lwn.net,
	ychuang3@nuvoton.com,
	u.kleine-koenig@pengutronix.de,
	Maarten.Brock@sttls.nl,
	Konstantin Pugin <rilian.la.te@ya.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lech Perczak <lech.perczak@camlingroup.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Konstantin Pugin <ria.freelander@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/3] add support for EXAR XR20M1172 UART
Date: Thu, 25 Apr 2024 21:32:32 +0300
Message-ID: <20240425183251.174412-1-rilian.la.te@ya.ru>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_113411_004240_0F4B92D8 
X-CRM114-Status: GOOD (  14.50  )
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

EXAR XR20M1172 UART is mostly SC16IS762-compatible, but
it has additional register which can change UART multiplier
to 4x and 8x, similar to UPF_MAGIC_MULTIPLIER does. So, I used this
flag to guard access to its specific DLD register. It seems than
other EXAR SPI UART modules also have this register, but I tested
only XR20M1172.
Yes, in datasheet this register is called "DLD - Divisor Fractional"
or "DLD - Divisor Fractional Register", calling depends on datasheet
version.

I am sorry about too many submissions and top post reply. About second -
I do not know how to reply properly to this ML from GMail phone app. About first - I just
get very good feedback from Andy Shevchenko, and want to fix his review picks ASAP.

Hugo, I am sorry, I fixes a bug, but forgot to amend a fix(

Log from v9 compilation:
```
  CC [M]  drivers/tty/serial/omap-serial.o
  CC [M]  drivers/tty/serial/owl-uart.o
  CC [M]  drivers/tty/serial/pch_uart.o
  CC [M]  drivers/tty/serial/qcom_geni_serial.o
  CC [M]  drivers/tty/serial/ucc_uart.o
  CC [M]  drivers/tty/serial/rp2.o
  CC [M]  drivers/tty/serial/samsung_tty.o
  CC [M]  drivers/tty/serial/sccnxp.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  drivers/tty/serial/sh-sci.o
  CC [M]  drivers/tty/serial/sifive.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC [M]  drivers/tty/serial/st-asc.o
  CC [M]  drivers/tty/serial/stm32-usart.o
```

Changes in v2:
  - use full name in git authorship

Changes in v3:
  - change formatting of commit messages to unify width
  - rework commit messages according to code review
  - add XR20M117X namespace for EXAR-specific register
  - do not use UPF_MAGIC_MULTIPLIER for checking EXAR chip,
    use s->devtype directly
  - replace while loop to fls function and expanded check
  - sort compatibles
  - reformat multiline comment.

Changes in v4:
  - rebase onto tty-next branch
  - added Kconfig mention of the chip
  - used rounddown_power_of_two instead of fls and manual shift
  - used FIELD_PREP instead of custom macro
  - removed has_dld bit from common struct, replaced by check function,
    which checks directly by s->devtype
  - fixed tab count
  - properly apply Vladimir Zapolskiy's tag to patch 2 only

Changes in v5:
  - fixes for tty-next branch
  - address a new code review picks
  - send properly to all participants
  - added Ack tag

Changes in v6:
  - KConfig fixes
  - New code review fixes

Changes in v7:
  - Added missed tag
  - Added missed v5 fixes

Changes in v8:
  - Fixed semicolon
  - Added missed tags
  - Fixed commit messages

Changes in v9:
  - Really fixed compilation (checked by git reset --hard && make allmodconfig && make)
  - Implemented Hugo and Andy's messages

Konstantin Pugin (3):
  serial: sc16is7xx: announce support of SER_RS485_RTS_ON_SEND
  dt-bindings: sc16is7xx: Add compatible line for XR20M1172 UART
  serial: sc16is7xx: add support for EXAR XR20M1172 UART

 .../bindings/serial/nxp,sc16is7xx.yaml        |  1 +
 drivers/tty/serial/Kconfig                    |  3 +-
 drivers/tty/serial/sc16is7xx.c                | 63 +++++++++++++++++--
 drivers/tty/serial/sc16is7xx.h                |  1 +
 drivers/tty/serial/sc16is7xx_i2c.c            |  1 +
 drivers/tty/serial/sc16is7xx_spi.c            |  1 +
 6 files changed, 64 insertions(+), 6 deletions(-)


base-commit: 660a708098569a66a47d0abdad998e29e1259de6
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
