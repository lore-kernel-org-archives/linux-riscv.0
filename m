Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N/JNtck6HiA8Ef+sCGuvOCEAmOvCVIxl+D4XCvCvVm0=; b=pmgKP7EHshaiew
	20nggeUQZ0Rr+/GLNaRgxbGh091nBby/xlXVGYSgQVuENmQRuM2RRINKpYHRFUyz2ZP9RJIKF2t19
	kGgPUa2hepJXfMN9kgfcRXM5Gc2fBbfqOqD3KSjOhe2chACNizd8ZtyOF2TAN1C+Whu6wVcurfAc0
	UywD9X8ACD72BQEypJwoFXoD9PEKLTTke5GvJa7Vw4CFYAnI4r+6x0gMHnf68CqhpF+oIGnX9/if7
	PnYlW0qB00tNV4XhabE23zdQicWT3RyLMhwjiMmLfRf+5psN6YE03+GVSPtmCnGSW4O4+tOCdpxct
	HB52jAkl6yj20OXDW4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCP9p-009AdZ-7W; Fri, 15 Jul 2022 17:31:17 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCP9m-009AcS-5x
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:31:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id w185so5213401pfb.4
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:cc:from:to:message-id;
        bh=Zz8Y77yoAGNRfrRZsS32slqkoRu0n2tXilRPTny1hNk=;
        b=U+HKY/vtJgiL6UI2Gho2wjd2mWjcGrbj6+j9CQ1oTRQk7ptpDKp2u9+Ki0ZW+sBIbf
         NxJRSvvPdkdiN0sT2Ccz44VD0NxFZL1r2gSvczreME+0oiZezv8MU4Qjwj2Qn4w1xAWy
         U42bC7no0E91NFnaMDU8Qpu5WV27GOFrrjemuxwmAaLnNBPRUY6gvsJG9B/yzwGSpgR2
         uUYKCLXaiBgOGrZVk2ODbC4d9foXbk/I2L++BxvaesgQjVTOUTQLiJLSntB1nSZz1SM1
         7Hi7MyoXiIjS5wzsrti3LKGJaYeG80gqMS9gJ4Ay27kdYMgYGlIm8R5Xi6LpRqcZUIz0
         YNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:cc:from:to:message-id;
        bh=Zz8Y77yoAGNRfrRZsS32slqkoRu0n2tXilRPTny1hNk=;
        b=0r+1DpUKotj89zPrUaPqyOl3zHx8YGBfeRe/NweucUY3Kx8Vl3Kaya2Y/8rg6EUvv1
         eElFP3RLVXGJoC9+oCcSs05G2waK3EgodCDHNqnHoQIw2d+ls3p4iDip8EoKRSVVthSc
         20EkLQiC0N1+MDqtdNx6ouMUH3PlZoeloPl64vdggoMmFuI7q0AmA41wDV2AjBYK1SQS
         Fwy9f09UzKuXrUG39h+1I2LOClRv0ZeOwoSZDL6kh1n0zPfpnvG4TJxl5O7EgvOE6UM2
         VeKAxtxdIv9YeoANbMkcgCaRbBj857vtxfV4rLvPKARtQ+cRINY8FGAWuV67am/KSP08
         fNhA==
X-Gm-Message-State: AJIora9R++ApUdDIkhdw3bTjr1JaeVoTWjr/kvtYHGKdRktQMiKU+z1i
	cCW9zE5kg7P7ni6MevceJlH6KktEgrL8PQ==
X-Google-Smtp-Source: AGRyM1uK6H62+1FI7CSjQPix+i5ysBrKbtH/rgd1suwn/D7CP71+5XnCnfYwW5dIr5nQ5w5uqvJE+A==
X-Received: by 2002:a05:6a00:1908:b0:525:5dad:cb1c with SMTP id y8-20020a056a00190800b005255dadcb1cmr15080303pfi.47.1657906270704;
        Fri, 15 Jul 2022 10:31:10 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id 125-20020a620483000000b00528c4c770c5sm4134320pfe.77.2022.07.15.10.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:31:09 -0700 (PDT)
Date: Fri, 15 Jul 2022 10:31:09 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Jul 2022 10:31:01 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.19-rc7
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-077c44de-b969-4894-9547-066c73040835@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_103114_432265_43797B5C 
X-CRM114-Status: UNSURE (   6.94  )
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

The following changes since commit e83031564137cf37e07c2d10ad468046ff48a0cf:

  riscv: Fix ALT_THEAD_PMA's asm parameters (2022-06-17 06:16:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc7

for you to fetch changes up to 7fccd723912702acfc2d75e8f0596982534f7f24:

  Merge tag 'dt-fixes-for-palmer-5.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into fixes (2022-07-13 10:44:22 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.19-rc7

* A fix to avoid printing a warning when modules do not exercise any
  errata-dependent behavior and the SiFive errata are enabled.
* A fix to the Microchip PFSOC to attach the L2 cache to the CPU nodes.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: hook up the mpfs' l2cache

Heiko Stuebner (1):
      riscv: don't warn for sifive erratas in modules

Palmer Dabbelt (1):
      Merge tag 'dt-fixes-for-palmer-5.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into fixes

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
 arch/riscv/errata/sifive/errata.c       | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
