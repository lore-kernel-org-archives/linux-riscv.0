Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90351E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+cL7juJY7xv9mfvwhpmaRAv4sI20uF9wsDdHrfwJScs=; b=MQNdngxgAwZIxt
	fOj++hT5x8VQgU0UKF84Af2DVBcFtph57OqczphswIlSDmEssAYPfWbvlq7ZiHmfqHvI/i02APfTr
	zhcy/40vSY5QbuyaIdjZnrtDPuC2sr4bW8jHMIFU9kNrM+qYfhxeQg3Hus+zwSArjUl5ieebzr8tA
	WEI4mAkUuaDEIDIWRUuckNw1PB9EtduDZIDP0VwdpEIfn64n4WpZRyOZpEOA9sA19pgGtPHQFfb05
	mE/0NS31XfNEZ7NM2Ivi+lZ5fyatCsYTyDGBOZIBVBdEtJ5dPQD5S07u8w2XR2CY95vc3G18D4ciB
	xa0UD8Mp3T3xHdhwufhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsqX-0000000GXsR-3oV7;
	Wed, 18 Dec 2024 12:08:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsqT-0000000GXrV-3UY3
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 12:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C693CA42628;
	Wed, 18 Dec 2024 12:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC6BC4CECE;
	Wed, 18 Dec 2024 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523684;
	bh=Z+2yFPrzaSadXkNEy1r9XKtC+SX+xEW56p81WI9GCYA=;
	h=From:To:Cc:Subject:Date:From;
	b=QG6Mx5Ip0q7Cl9ui5q/C0OOu/YS1AjzbrOlrS0gxz6Au4+Tr2Ng1uRdLtcdT8kWei
	 UNnvN4rdSYCYQSZxsD/dXYDtTihQcB/WyXekC4UUnDgYUlBNu42Cc7/GMSpyvDzN+v
	 sD9uRJzLE3R6+pZH0urcVaY6St+rCVRggmaqQN8gkBL/Hba64/RZQ3ZLgl38X5h1RV
	 1IrgItnrHfsEPSDpNXKqQcJH4Zr/BLnM4BK1fNK0ngkNDDMdKQOS5XSQTR/t9pV7Eu
	 U2FsBHw4wCKgrL9gP6m6mgXHXJ8enn7o0J6+X3lXxV6bxicDD+JoMdB2+46rUR3M7E
	 V29zIost150Nw==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Date: Wed, 18 Dec 2024 12:07:39 +0000
Message-ID: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GkdzysDT6A8rvdwD6ioxMopMwV7YP24rQ6Q26+goPsE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlJu7lfrWnI/tZ5Ie4LU9ARvkKxOV+qZ0//f2gRkxHLo hlbZUuPd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAioWGMDHtOGBZVCN2Lnvu+ ssxOQf/Z5gVxgpuy/Uq9Fe/ZzGTY3crIMCfKbjJHxTnnPWf8lopXBbn1NBSVXz8gt5Vl4Tan83s 3sgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_040805_929817_8A7B87C6 
X-CRM114-Status: UNSURE (   7.70  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

Here's a v2 with one of the minor items pointed out by Andi resolved and
a new patch for an issue fixed in the months since v1, plus some minor
checkpatch things that I seem to have missed on v1. On v1 there was
unresolved discussion with Wolfram, but it has been two months without a
response so I am sending this v2 in an attempt to make progress.

Cheers,
Conor.

v2:
- remove extra () Andi pointed out
- fix some {} use that defied the coding style
- new patch for "ghost detections"

v1: https://lore.kernel.org/linux-i2c/20240930-uneasy-dorsal-1acda9227b0d@spud/

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  i2c: microchip-core: actually use repeated sends
  i2c: microchip-core: fix "ghost" detections

 drivers/i2c/busses/i2c-microchip-corei2c.c | 126 ++++++++++++++++-----
 1 file changed, 96 insertions(+), 30 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
