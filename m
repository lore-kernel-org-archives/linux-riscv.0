Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E18E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWWEdM115UyeImuWLgaWj2Bi2SCM6iW+fa/5UWVxYaM=; b=XGhTlxhwTTnw1U
	xwaDK/pXaNoS3Yw534X61naQgFHb+R7CV5fcCOmvwaPRnu4IsW1Kf3oDAfbuDB4bV2eUleIsW0F5f
	g1r1EiCh7LHDHWNHJp1zAMZBwTNxmYHeotrDjeZ+/Y31wHclJcW8rW24qE/xY7GiRyDQz2E47PHLc
	wuW4lmx9twX9CFxcw1mATolRbXpwqHQVpMeACltrg7ZiPtMTRy2+AJ2m2L46jV3vxHglAOyRryxAH
	CDP7WaxamE9aDb2AZmx74T8u/wDA2kU1JQFK+1mi0Zihg03LvNUJ5YuhxSiFZCVaBBb7Gprc7JpaP
	0n9Ta1XFotQkhOIriNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsqx-0000000GY0D-0pj4;
	Wed, 18 Dec 2024 12:08:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsqu-0000000GXzH-2Knm
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 12:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34962A4261C;
	Wed, 18 Dec 2024 12:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02D4C4CED7;
	Wed, 18 Dec 2024 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523711;
	bh=Aki9cR5hgIlgmZZzFSZjatM8ttFH9PdwQjT6VXm94Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUINo1ISnQ7uJtkW9Z3SEBYlPgd/cSynL7tilEY/JlgoQ0jkgPUhUc8F/Uk++7Wfn
	 S2eQMOr81PSoeWg3qnJnWQmQ8+PfiFXfyEGkD0ZswbRYtWuBzSDAYnuIam/ZHyPup5
	 6iu59KbOihwTo7onx89nLjFY6kxP+RlwFsI6sqGV47NdMxwf9Ty7HJY6SKSX50mUxf
	 ZhLeR0yeqofZMjR8OFTjzPXhdtJp2iVvCYEKqKN/Z1I9/mZikIjCpKArgQROSRQOhu
	 2poZcIFMPYoHoAHscdPnIVc6gaiG3p3nj3KV2qNPWpIAKI3CBXrtVkqaOTeLyDjK+1
	 cqVqWEzqHhzzw==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: microchip-core: fix "ghost" detections
Date: Wed, 18 Dec 2024 12:07:42 +0000
Message-ID: <20241218-outbid-encounter-b2e78b1cc707@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+vHaPH1a1woczZ/LXoIUBZOD/s4yRKT5BR6VDjl0RiM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlJu7lvLYmacUjr4G2Drd0Xi1/fSprJ4Lep2PKAXOzF+ bqP7P2lOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARPXZGhu8FjIt9p7x5+1D3 1u4jnI8Duh9uuCO6LXa5pbe9/doM88mMDFt/ffCdH/jSs4fJva3U5f3/SR3WhUXnP3PzPV6r8ea 8JQsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_040832_729123_2C96317A 
X-CRM114-Status: GOOD (  15.10  )
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

Running i2c-detect currently produces an output akin to:
    0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         08 -- 0a -- 0c -- 0e --
10: 10 -- 12 -- 14 -- 16 -- UU 19 -- 1b -- 1d -- 1f
20: -- 21 -- 23 -- 25 -- 27 -- 29 -- 2b -- 2d -- 2f
30: -- -- -- -- -- -- -- -- 38 -- 3a -- 3c -- 3e --
40: 40 -- 42 -- 44 -- 46 -- 48 -- 4a -- 4c -- 4e --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: 60 -- 62 -- 64 -- 66 -- 68 -- 6a -- 6c -- 6e --
70: 70 -- 72 -- 74 -- 76 --

This happens because for an i2c_msg with a len of 0 the driver will
mark the transmission of the message as a success once the START has
been sent, without waiting for the devices on the bus to respond with an
ACK/NAK. Since i2cdetect seems to run in a tight loop over all addresses
the NAK is treated as part of the next test for the next address.

Delete the fast path that marks a message as complete when idev->msg_len
is zero after sending a START/RESTART since this isn't a valid scenario.

CC: stable@vger.kernel.org
Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
My original tests with KASAN/UBSAN/PREEMPT_RT enabled saw far fewer of
these "ghost" detections and the skip caused by the occupied address at
0x18 on this bus is part of my attribution of the problem. Unless I'm
mistaken there's no scenario that you consider a message complete after
sending a START/RESTART without waiting for the ACK/NAK and this code
path I deleted is useless? Looking out of tree, it predates my involvement
with the code so I don't know where it came from, nor is there anything
like it in the bare-metal driver the linux one was based on.
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index e5af38dfaa81..b0a51695138a 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -287,8 +287,6 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		ctrl &= ~CTRL_STA;
 		writeb(idev->addr, idev->base + CORE_I2C_DATA);
 		writeb(ctrl, idev->base + CORE_I2C_CTRL);
-		if (idev->msg_len == 0)
-			finished = true;
 		break;
 	case STATUS_M_ARB_LOST:
 		idev->msg_err = -EAGAIN;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
