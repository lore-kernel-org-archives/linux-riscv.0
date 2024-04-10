Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E7BCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/kJ0R9jg35I5V9tAOHA0oiPJAGJi9xWvcDzzHcSFXPQ=; b=xCGdWxtRE83gkn
	cBq4qUdhOXLLNX0fH4ThT+2LdI2WA5IvKH/CIwnSQbUnBgOMTKcSsJgKWCw3uWIkO385B7QN3Pl3+
	Hde+UZFrup2OogAhkaR+lHv4sb0sKEQt8VHHEZY/wtuzJ9Rt5+GKbqF4HqRkTKx1jyZ7/koB17aVy
	QuLIOF39DBOvqgrh00En8gMjzvFCyD4WAYpU+v5JG8lCUv96bBzaDkRYDl/LG3bRb1WtaRzeP8wbX
	fdgfj2oFxLGs8Ekb7nSV5Yl506/fsS3WKED08x5BwHh2NRvmkx7sNvbixpCrPZx0J3DcY9u5fkgmm
	GocaTWYm1Vc4yFVRScig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbI-00000006leC-0aVS;
	Wed, 10 Apr 2024 11:58:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbE-00000006lcC-2RAP
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F4DECE1D78;
	Wed, 10 Apr 2024 11:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37D8C433C7;
	Wed, 10 Apr 2024 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750321;
	bh=D6g7kz9v1lvnZv12s+hhXRD9WFjxJ0VoV/zFfH1fEXs=;
	h=From:To:Cc:Subject:Date:From;
	b=gN7ADNtA9kOKv2MBmNcwFJ/WzdRIS0TQAnQmZRekIvRoK4RXM8MDzMQDES/aZSlKC
	 jGTaD9/j0HULprQI97rZlsidLO/7Ge/jsyXD6gysWa6J6jtKnRmx0ZD1d/a4qJjxaS
	 lLXYscXxFXkAR8solCU0KiWRUlscBlsNQA8kO6iXXC9XIAEQrJTi0KH4nkLciva9HT
	 TlO99wjcHBxfA+ZkR6r/id4hs80xJok9mNGTXO1p2KucPo7uDoOR3PUeWJ/yCqLHI1
	 AmTkDfEybvtIwKh1BoiskVeKg5VIbWjyNwugTy1mAku5n2ckemEP1eEZm7ZvnqQfka
	 AZGENFyRd+owg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] PolarFire SoC Auto Update design info support
Date: Wed, 10 Apr 2024 12:58:03 +0100
Message-ID: <20240410-opulently-epic-8654bdac3422@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DKDUkLAPHTrXR9D8TwtwSjtryroUcX4bNpjv3LfEM94=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlidVd4t133aY1wWKDPGzFHuFFLRKArpXzVun1mrUvKE 3xfKVl0lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCLOXgx/RRPyY+KPpZREXF3f uHdT7oGvXGw7DQwObDqf2HNUfdnfGwz/0xkv3f7wdYH8lT1SE4IO/JQTPKzI3HT9tVfpPPEZ2fI sfAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045844_827525_5F4E365B 
X-CRM114-Status: UNSURE (   9.04  )
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

There's a document that is internally available that the author of the
design info/overlay format stuff wrote about how it is composed and I
need to go read it and make a version of it publicly available before
this can be merged.

While implementing the design info support, I found a few opportunities
for cleaning up the code and fixed a bug that had been mentioned
internally about failure cases printing success. The scope based cleanup
stuff in particular is rather helpful for the drivers using the system
services mailbox, so I'll roll that out to the other users soonTM.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Cyril Jean <cyril.jean@microchip.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (5):
  firmware: microchip: support writing bitstream info to flash
  firmware: microchip: don't unconditionally print validation success
  firmware: microchip: clarify that sizes and addresses are in hex
  firmware: microchip: move buffer allocation into
    mpfs_auto_update_set_image_address()
  firmware: microchip: use scope-based cleanup where possible

 drivers/firmware/microchip/mpfs-auto-update.c | 140 +++++++++---------
 1 file changed, 70 insertions(+), 70 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
