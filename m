Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF971C10F1E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wE6gUMec/QDtAq3Sw3/3YnwMNBZs9H6O8sIKsCYS9RM=; b=J+JO1GO+gtqZ32
	vziJHtQTTL6MEVuv7FOi6FnxSzQiVQWUZ2TTawJsC33zzcZSp1zYPsLyJne4NmA7hKwyYXPIxKCcs
	5+rrm+HOTFBel5ONFyyvFrJ6p0zMlv+OKmnPtnceVw1e7gJuUucw1K/r7hZxSjG6MZ7zRX1CohMW1
	VNZiYBKQ3tLA7h3/P8ELF8hg126VZ50Fx7UcATT+Neii8+B9nzgmUfZMrKUycyDl6QqaNTXn/2/t3
	SM6z7o7XoxNcMyTCM/YvtjFzbh33IY4h83ActM+1pZM5BZK82poqSYzBCaGEPkyVLtrtDx8kQPb5d
	hSAKw7NuWLA1aB/WQowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ewM-008nPu-Qq; Fri, 09 Dec 2022 15:05:30 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ew0-008n6L-7E; Fri, 09 Dec 2022 15:05:11 +0000
X-QQ-mid: bizesmtp89t1670598279tf8ekbj4
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Dec 2022 23:04:37 +0800 (CST)
X-QQ-SSF: 01200000002000B0C000B00A0000000
X-QQ-FEAT: 7bD38UErqBMse/wQvkTTMEyob1uRl85oGpxpBEZmiEMslPZLCL+kkKP6NtbX2
	gPc0PSkUeyw56O8ET95uXwx6vMo+BhrnioINwoXo4H2tTnglrQ/7WRNrtlQxK7ZQxSzw4ba
	ZeYLrpHEC9pG4k7/gbKQgezfWTytqnhFV+jA16UgOb0XV+eGbyAAhyEZQ7gB/3fFm0ivwFx
	bdP+CFTqDOLadz2kycFslFhdoxQFI4FDYuWQVzMVw3ReGwgKnFOt8f3+eihWRjuFqXfIje2
	KdVb9RsMmhoL4ikneZlRSDmfernerWgzDol1vR6cutPf4eSN8cTqRMCFNRjhWwlE0OvFo4z
	hbLJM6xeg60PoRG+FB96PPSALEiAg==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon semihost driver
Date: Fri,  9 Dec 2022 23:04:34 +0800
Message-Id: <20221209150437.795918-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_070508_587027_8FB13651 
X-CRM114-Status: UNSURE (   9.33  )
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


RISC-V semihosting spec [1] is built on top of the existing Arm one;
we can add RISC-V earlycon semihost driver easily.

This series refactors the existing driver a little bit, to move smh_putc()
variants in respective arch's semihost.h, then we can implement RISC-V's
version in the riscv arch directory.

Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]

Changes in v3:
- add #ifdef in the header to prevent from multiple inclusion
- add forward-declare struct uart_port
- add a Link tag in the commit message

Changes in v2:
- new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"
- Move the RISC-V implementation to semihost.h

Bin Meng (3):
  serial: earlycon-arm-semihost: Move smh_putc() variants in respective
    arch's semihost.h
  riscv: Implement semihost.h for earlycon semihost driver
  serial: Rename earlycon semihost driver

 arch/arm/include/asm/semihost.h               | 30 +++++++++++++++++++
 arch/arm64/include/asm/semihost.h             | 24 +++++++++++++++
 arch/riscv/include/asm/semihost.h             | 26 ++++++++++++++++
 drivers/tty/serial/Kconfig                    | 14 ++++-----
 drivers/tty/serial/Makefile                   |  2 +-
 ...con-arm-semihost.c => earlycon-semihost.c} | 25 +---------------
 6 files changed, 89 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/include/asm/semihost.h
 create mode 100644 arch/arm64/include/asm/semihost.h
 create mode 100644 arch/riscv/include/asm/semihost.h
 rename drivers/tty/serial/{earlycon-arm-semihost.c => earlycon-semihost.c} (57%)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
