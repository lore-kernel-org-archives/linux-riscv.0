Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F45C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hsjOvgTknwSNgp6giQHzn0uS9B4IKAvOC6D4zcFdYTM=; b=CO0UOhtLvWuM9Z
	wj8pjByJ/g+bm2hNPmidFZYClDVT9oY2k8YCB8jOy1LQTPRmYrgN45esw6pY1lZrIrr9td9VTp9Cj
	WTQttLxjNwxRX8CjOX3LOfPyjUYqdSFIF3iczAnP3oDj2TUaIgFDmXlQlITfcwDwLd4eQX8agDhkZ
	VaKXWCMFPHSAjNiY++VSy3rGGgIYHljdomnGekK/+T0Fh4ybqBYd9L4Wn6hXjDvsqT3ac1lsaSx3U
	dDPA6NfXRTZ3bNtYl/cUHUm4+nkezx5yE2oMOPn3nJegM6uCACKjsCS6akaNAUYptdY6N22rcX9wt
	0IVBEMpttxhj79CDtYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myIIw-00Bzo9-Jj; Fri, 17 Dec 2021 18:50:06 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myI5C-00BtKA-IR
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 18:35:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 200so2943136pgg.3
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 10:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=YaNxns1s+TGyCVBsFW30ZbL2hW+Yb5XnvuO0hRitp/o=;
 b=DyPBpxf4wGnF7oC2LDeND0KeUEx99zwWf2C204q18+fYZZpsAwENdGXuwz0c1Yo4cV
 pQFUp1Ld7r7lqO0ggydhW5a8jQ1lQXnu/HKD9fVGnS7a83PT7pFTELipkxN0misTegGC
 eKzY2GtxnGOaXfABt3OgLrcGnDljdyl6ygr78lUExq+MjXWuCYroOiu7kUHjJt3hGNTq
 Oz2Q7Cesptbxfe4sTVqP6ZpHrjc/By95VJhoRYuvARM2DU7N0f7Pzm3Ks9OPc+7jyrG+
 2c8ksBOwsBPCnXAo1ShNfFxyIygHCWayj+DgudzOpcmXrPrKyEs5v0CzlHiKcgMt8D6d
 FQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=YaNxns1s+TGyCVBsFW30ZbL2hW+Yb5XnvuO0hRitp/o=;
 b=2Vg4VdrUd3OrS7KuOpx4LjW0PI4TtYeQl62Yhmkph0oA7BR0tH76zSzWtbrG17j/Pi
 UftI8ytWmIKs/SmsFnC4wcK03cdq3G3xCynRlmfOXJ8BbbMrEtEdz8vkHPRNAvvSBw/x
 87DnKlko8demBPCdWW65HK86mPXCaz6ceI3fozK0CLyD+K9jqnMmbSlehKqMItR2/SA7
 56JJJzJVeZdgsQr5jQlzt9nRQdq45cDyL6NO0TUAsBQTWzClfOwt0+hu5CqetBSeTPko
 LF+X9e2JcmK6KEIXy7VWPsgZuTgufxjNmywP2cL6RiHeScRzgA5hFxT9OgwPwQTL78HL
 zWYw==
X-Gm-Message-State: AOAM530JF7/k0ko0Bgpar5A4BdFw+BVafhIAorf+90gr5hBVOdGLEpLW
 /Fx4nNkGRrmMpzwJ++3lNFvNJ5/ulR7SlQ==
X-Google-Smtp-Source: ABdhPJyjYm/Bau5+PTPtAe1IyAqGABNPgFtGfulvfHKU2dMaHXAmglvAUAPrF+XB5onIgHMvNLPTBw==
X-Received: by 2002:aa7:8545:0:b0:4ba:7163:7dfd with SMTP id
 y5-20020aa78545000000b004ba71637dfdmr4204093pfn.61.1639766152335; 
 Fri, 17 Dec 2021 10:35:52 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id gf4sm8877475pjb.56.2021.12.17.10.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 10:35:51 -0800 (PST)
Date: Fri, 17 Dec 2021 10:35:51 -0800 (PST)
X-Google-Original-Date: Fri, 17 Dec 2021 10:18:21 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.16-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e635e7d2-fa3c-4c47-8a6b-989873263b30@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_103554_729132_BCF99BD8 
X-CRM114-Status: UNSURE (   6.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 5a19c7e06236a9c55dfc001bb4d1a8f1950d23e7:

  riscv: fix building external modules (2021-11-18 23:06:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc6

for you to fetch changes up to f6f7fbb89bf8dc9132fde55cfe67483138eea880:

  riscv: dts: sifive unmatched: Link the tmp451 with its power supply (2021-12-16 21:27:45 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.16-rc6

* A handful of DT updates for the SiFive HiFive Unmatched, that fix the
  regulator handling.  These should stop some warning spew.
* A pair of fixes for both the SiFive Hifive Unleashed and Unmatched,
  that correctly hook up the MMC card detect signal.

----------------------------------------------------------------
Bin Meng (2):
      riscv: dts: unleashed: Add gpio card detect to mmc-spi-slot
      riscv: dts: unmatched: Add gpio card detect to mmc-spi-slot

Vincent Pelletier (5):
      riscv: dts: sifive unmatched: Name gpio lines
      riscv: dts: sifive unmatched: Expose the board ID eeprom
      riscv: dts: sifive unmatched: Expose the PMIC sub-functions
      riscv: dts: sifive unmatched: Fix regulator for board rev3
      riscv: dts: sifive unmatched: Link the tmp451 with its power supply

 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |   1 +
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 113 ++++++++++-----------
 2 files changed, 54 insertions(+), 60 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
