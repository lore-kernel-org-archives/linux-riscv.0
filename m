Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF5CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 22:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xd4g6Wf7gkI10M5NWrvyPvCfmMZ0+lApf/4+klkzZww=; b=qBLcAMxTx7c1YU
	lsavXw6w07CtHxGIRLt9f0kNGpC1oClKtPJjGZ7yIDcmgyx7I9+WZoDrwywZ7vxPXFk/w2M5jpYCA
	UdNqlCb/EdfWTGM39y6F47SXJdPai+49VR0csIcUjI6STbVOWDDUOeMndZBD869KQMx0Vh+ZT0IPw
	ns2IdFad12GxwDwgijY4lBWktWAQ+tfvJuKgB371gIoT+Kvt3iHkhxEe9zkIygL3HxdUlGpA3XcYp
	hX7Yom+CiOoXXW8LdJp3kTFB8KmAa37kqzghlw0T/u+4+eaTCEcFm8CJ6jRXsf/+LZucja7D7hw3q
	uvBJirJTqvz2q4rVj9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2d6A-0000000Ct6f-2TL6;
	Sat, 27 Sep 2025 22:08:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2d67-0000000Ct3x-194j
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 22:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=84aM7CktnZL1OAlY+LiDjqwMzwvEjNLoxkt5Qla/7JE=; b=FYreAEkbXqbsAmdNRnjvQGLSnS
	kXMXYbCntqdV3Gf8qpiTxeNL5GgE6CJkZ97Pq7ZUq4QXW8Qs3xcAJ2aVARr2qAaKNsO40S0aRGoNX
	2K1agCVcSpRo+fIzsnFBL4XtdsbRIbAJKh4MnxqBseYRh2YIn+usWK0SYddXRdmb7eEsT6RNDYEuV
	Zu8IakpicCJDVqx3qTq13MN2QKM9suP8EbRTW29tJMvIsYrXPyjpD3Zb4TD/tLtb7gJLSwACzRtta
	CgMuF79Bbsyb826QHZUQVdOyXqOB4Rvqsjoav7wUtY6IJudyo+sq1jH5PdC3TpLjRxDl+Dp0Lbsaw
	h3mSt4zg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v2d5n-000QX4-2k;
	Sun, 28 Sep 2025 00:08:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: driver: reset: spacemit-p1: add driver for poweroff/reboot
Date: Sun, 28 Sep 2025 00:07:39 +0200
Message-ID: <20250927220824.1267318-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_150855_746752_31D67FBE 
X-CRM114-Status: UNSURE (   7.59  )
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

This adds poweroff/reboot support for the SpacemiT P1 PMIC chip, which is
commonly paired with the SpacemiT K1 SoC.

Note: For reliable operation, this driver depends on a separate patch series
that adds atomic transfer support to the SpacemiT I2C controller driver:
https://lore.kernel.org/spacemit/48B175EBF0F1A347+aNXwqlO1mD-7BGtE@kernel.org/T/#t
The two fixes mentioned there are also required:
https://lore.kernel.org/spacemit/aNbDkn9AC4FFx-Zc@aurel32.net/

Aurelien Jarno (2):
  driver: reset: spacemit-p1: add driver for poweroff/reboot
  mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip

 drivers/mfd/simple-mfd-i2c.c             |  1 +
 drivers/power/reset/Kconfig              |  9 +++
 drivers/power/reset/Makefile             |  1 +
 drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 drivers/power/reset/spacemit-p1-reboot.c

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
