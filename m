Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DFCDB46B
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7cM99oQ4qMN+FKE3dr+GMnCxGIYUKsjljVriOp8UOFQ=; b=onmTfSoUpL+O/S
	RCWfFzSaHgH9pQ+brsGUA93kr1B6bzpsaTLM3/VWAbGQcQqvsHjt/cyPKwyPO8s0W4i1/Pm4PDoUu
	aWvfIwrX/Gh3pX0gqJ2vwtntbHxYtuTL4nledzOOQWy/GCZfttes9TPU9l25XiDGN0BUbqLaJu9Oy
	9pDaArgNpjfVmqwufbO/crr2qBwIUVPrCMK814sWKLSgooMnTQstZIhHv7O+0DZdrn7LTt/rxFCUj
	8vsK327WVkjlz6lsyxkU+c2sW/zGH60btfG0ftryS8BI6qyvcDkEADFFRUCPsKExfUH9FIvDtbgZc
	nFSe+cAjLZS+YH4pMvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6g-00000003CAE-0zIi;
	Sat, 20 Jun 2026 06:23:06 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6b-00000003C7l-17Ki
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=XIdL+BJQ2jNkAZTpAx/T9YMOki3iaRJKj0STU1kPQPs=; b=XZhSZjvfzJTI9s7NHrtmudqHsE
	i4A+j2mlUAoDcaQOpbcsTi/KdvEhYUuhwfjWFpT11I+oNIk3MZhPrmwf7vckHQnU4BqodDVCNBt1Q
	jZFNC/dKtrn+01jqOx8r/6SJM0rMOXASFah1lAggTHDz9HhFl3QNqD5ao3oRWlvLG7mKaWVwfPmGt
	b31X7B0NRV8nDZGm6vvUziwYgrhDTotmgLbjoSp85m+hDX2kp62UX5IfELAsRWBokP33Yh/p4e/Du
	vETd3lJo3eDGW+b5e462sHyUg9NIy9w9VZM5jrlvT/s6yRT4GWssO0dG2krBH3kBSeEzyw3h24yk6
	XTV3Pcgw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6P-000000006dC-3mPM;
	Sat, 20 Jun 2026 08:22:49 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/5] riscv: dts: spacemit: serial/i2c/ethernet improvements for the K3 Pico-ITX board 
Date: Sat, 20 Jun 2026 08:22:01 +0200
Message-ID: <20260620062238.3199108-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232301_309544_8D977022 
X-CRM114-Status: UNSURE (   5.85  )
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

This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
the RTL8211F PHY.

Aurelien Jarno (5):
  riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
  riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
  riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
  riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
  riscv: dts: spacemit: improve RTL8211F PHY configuration on K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 42 +++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++
 2 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
