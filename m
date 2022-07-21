Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pB9jAmNzdnttY04lpZtd1burcNX3uP5fVNr5ENfqfvc=; b=X3r+asTipFkAfV
	q+af5gDw4QageJw+B7/ZKynAlNLZB7yUy6IQxSl/1+w9UYBZKQ8aPbad/2AWifIOBbTz4GZk1fEfn
	kBKhBDqAWJVp7usalFKHAxtsldSEP+PZW2EDSluLJds+cgPYnR7bn8HozDIVQR7kPOPitIkzV0pv+
	Ljm/qTvoEp9Jt7qJ4y4TMo71tl4YVi30W3VTzutwEx/cOmiP2VCCGouBzARP7rqcHK7A3wiKeMKdI
	8r3JCipmOllrLezSOJA+d5dZCnF4uNj9nAhu2RAcdALv55d1qoRhukVw5MZMQGcDOgp2riHt34kbo
	GuD8YTjc5i1EtKUpuzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrh-00Ag8e-Tz; Thu, 21 Jul 2022 17:21:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrc-00AfsW-WE
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 17:21:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a5so3191040wrx.12
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmRxLVY9HuAG01Hu57i7xdSoJXhylPjj1q4eOpHaFLo=;
        b=bTWUL7ViGNTVsC1FoDdx7RIkNJcFCZWlEiGsHbnuE+6RcUfQUpWssDkNFN/E4Dx2wc
         S4QXVjfjyFqP9+KLSIg5alE48GBHoasHbTMPJJ0c97khOC+DXmIWPq2rA3KGqSRTo7p4
         n8mLzpupa6zIRkP3mXzEPKc7oNuUDwZQS6IeeCevOwLeEEHk0HGihjt1E4h2e/ZsCPSr
         OFWfOIOnC57+2bM9UB5fjBwRAyLdAL0Ufmt8j/AnA31QIl/1DKwDTY+jF3XJm5y3dAaT
         MGToqoriWdQxlLDA6F/h5BRFAtA7/i6u7VNrC/qJ30AmrwL441/sKzUFEs3LtvjdWtel
         zT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmRxLVY9HuAG01Hu57i7xdSoJXhylPjj1q4eOpHaFLo=;
        b=WwG9Fad+qghcm1fOD1+nE301Eon8q6m3UAE+BMlEm0oOOoc2ZMRqbEMdyy+D6AgRAm
         kWyADHb7EXxuxWOiy4XKovQD19Qa32J3NBDvMBxQQz5/g2E8kfkOHgiO8QaZlDd63j3q
         vw34QYNZliLN+bge1H1B7Atm6yjKFCQL7NS7xz4ffkoL2qm6BU7wpGBPIIXIu48Ld1Hh
         qiLHNGdqqNZSfEiA2LQ1rWml3Oj+w/4wFf9+waECxtanfJioSSym7YETqj5M00LaApF8
         PG+ppr4BhzC+5F00o6qkIG05Il/+XHJIUNwIIVfXBWKe1ZJs6mW8U+Rjz7Dl7WbssJh/
         kVPQ==
X-Gm-Message-State: AJIora/4R7eHLI028bf3APVJneS+uixsZjIWUhPwycbbl9GAg6jKemKE
	5n7d9ngYEMNhMzVosRfIcb+XjQ==
X-Google-Smtp-Source: AGRyM1teRPSq/gbNJAmKT5r8AGTamBTGc9+ZMkZBVbSD6pG2a1PnAJYJzQxDdZRMi/sHSn+IxunABg==
X-Received: by 2002:a05:6000:719:b0:21e:4530:c558 with SMTP id bs25-20020a056000071900b0021e4530c558mr8808003wrb.243.1658424081913;
        Thu, 21 Jul 2022 10:21:21 -0700 (PDT)
Received: from henark71.. ([109.76.125.251])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003a2cf1535aasm2455697wme.17.2022.07.21.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:21:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: u.kleine-koenig@pengutronix.de
Cc: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v7 0/4] Microchip soft ip corePWM driver
Date: Thu, 21 Jul 2022 18:21:06 +0100
Message-Id: <20220721172109.941900-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102129_081593_F92020D2 
X-CRM114-Status: GOOD (  21.20  )
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

Hey Uwe, all,

(~same cover as v5)

Added some extra patches so I have a cover letter this time.
You pointed out that I was overriding npwmcells in the driver and I
realised that the dt & binding were not correct so I have added two
simple patches to deal with that. The dts patch I will take in my tree
once the binding is applied.

For the maintainers entry, I mentioned before that I have several
changes in-flight for it. We are late~(ish)~ in the cycle so I doubt
you'll be applying this for v5.20, but in the off chance you do - I
would be happy to send it (with your Ack) alongside an i2c addition
that is "deferred". I rebased it ~today~ on top of an additional change
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

I'll take the dts change myself once the rest is merged.

Thanks,
Conor.

Changes from v6:
- Dropped an unused variable that I'd missed
- Actually check the return values of the mutex lock()s
- Re-rebased on -next for the MAINTAINERS patch (again...)

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
 drivers/pwm/pwm-microchip-core.c              | 371 ++++++++++++++++++
 6 files changed, 387 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: a3fd3ca134d9485a0f9a7bdcffd7f8bae27f79d3
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
