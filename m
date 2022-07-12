Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14446C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLdlZPlw7Fho+s4xD/eFqxCvYEp8X97C5Ox8wb11TQg=; b=CaT1IkW5w09732
	b7QnZ7bY2Kj2f/coeqKwq5AuhDaDH0RCGbgQuZTNnxxKB1tuAQPKQMJaT5fLUlrUsq126XA+S50fT
	HMiYCkE9IPzTXIbAFEv4sEigPozTgO5glYy5WYA2askltIjCJrk8XEbnGtsuNejfavu0SIK7ZDJOF
	NuganeKDdJiqZ4eLBLD412I/4mBl4IATS1SOp+NfCYs8J5X5sropeW8XfR23rkG9nDDLmguqkq5e/
	qdzjjQIj+t8tW5pfQUww1ykVTy6BVcgObtgJQxRdZR34T/BSlPRmrKZaGYqWPfpV0NQpLBNW6A9mu
	7Rx/KqZ/Q41f/EyIn4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGq4-00BhEc-9j; Tue, 12 Jul 2022 14:26:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGpy-00BhBv-N0
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 14:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657635966; x=1689171966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kfIGPvcZH8e51YL7+dp1o1wepCSIA0xgTOM+PfQaX7k=;
  b=Qkh/Fdjdk3OZjrM4MsOi2uVXEOR8CR2hd9piOAlW1jzgVsfxirRw4Cfy
   dzfstfGh7qG3GTWAKRjXDwBJq/QVtgqATrYF2J9s0bYDpSCUzfJlLqQu6
   xgQqmNUBftgoQ3Xf+rViRMeI24crwO8fdngHWRHrQM4YGXecqqu//9LtA
   UIJwwZ+zRRwfIWoYEGAXKmDCqKYNDfzONQDKQWLx0vfMe287xLBHufSHV
   JiWnVH6HiqvzB6GvVCOSzPzRXmZsOzu2OOXPyycuZyKCeZOWUkeb8m97Q
   dCE8CsMaUiYUsZ7t8utj6PlvSvJV2HvIcgmREOoPkytIFbBkAAnzGl5P0
   g==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="172054798"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 07:26:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 07:26:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 07:26:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v6 0/4] Microchip soft ip corePWM driver
Date: Tue, 12 Jul 2022 15:25:53 +0100
Message-ID: <20220712142557.1773075-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_072606_773561_F70787B3 
X-CRM114-Status: GOOD (  19.66  )
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

Hey Uwe, all,

Added some extra patches so I have a cover letter this time.
You pointed out that I was overriding npwmcells in the driver and I 
realised that the dt & binding were not correct so I have added two
simple patches to deal with that. The dts patch I will take in my tree
once the binding is applied.

For the maintainers entry, I mentioned before that I have several
changes in-flight for it. We are late(ish) in the cycle so I doubt
you'll be applying this for v5.20, but in the off chance you do - I
would be happy to send it (with your Ack) alongside an i2c addition
that is "deferred". I rebased it today on top of an additional change
so it may not apply for you.

In your review of v3, you had a lot of comments about the period and
duty cycle calculations, so I have had another run at them. I converted
the period calculation to "search" from the bottom up for the suitable
prescale value. The duty cycle calculation has been fixed - the problem
was exactly what I suspected in my replies to your review. I had to block
the use of a 0xFF period_steps register value (which I think should be
covered by the updated comment and limitation #2).

Beyond that, I have rebased on -next and converted to the devm_ stuff
in probe that was recently added & dropped remove() - as requested.
I added locking to protect the period racing, changed the #defines and
switched to returning -EINVAL when the period is locked to a value
greater than that requested.

Thanks,
Conor.

Changes from v5:
- switched to a mutex b/c we must sleep with the lock taken
- simplified the locking in apply() and added locking to get_state()
- reworked apply() as requested
- removed the loop in the period calculation (thanks Uwe!)
- add a copy of the enable registers in the driver to save on reads.
- remove the second (useless) write to sync_update
- added some missing rounding in get_state()
- couple other minor cleanups as requested in:
https://lore.kernel.org/linux-riscv/20220709160206.cw5luo7kxdshoiua@pengutronix.de/

Changes from v4:
- dropped some accidentally added files

Conor Dooley (4):
  dt-bindings: pwm: fix microchip corePWM's pwm-cells
  riscv: dts: fix the icicle's #pwm-cells
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 .../bindings/pwm/microchip,corepwm.yaml       |   4 +-
 MAINTAINERS                                   |   1 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-microchip-core.c              | 370 ++++++++++++++++++
 6 files changed, 386 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 734339e5c1c46e3af041b4c288c213e045e34354
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
