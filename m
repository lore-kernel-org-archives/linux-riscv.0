Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A865C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=axDP1LOS67GKTqltqWKmH8U3+pGdcdU4nCAaRTN6gZk=; b=FULixkFaJX0BpL
	918zIAUosy9IFUItuEz/0q1LQhXGhh5KQNuqHgPLOxz4anMPpWDPs8VsCRX4xgMQBmqXTwmRvHT8+
	SU9vSKPHKVmd7KSYMpc/G4dhBEiT7ZFsOjNGZJ+9/lfBPoXhpEOYATh0pmEpQh000oxEA/+SApyQr
	9nSoLiFGei8pKwuJ0ZiUCW/SLxuqpVTtfsf6qBup0lK7y/48NM9o1IJmeLJJ7Wiv1QPQNwi4Qwlg2
	JopyPx2zT44P6AlOmn911LPBkBVdYIukzcZJM7J43LZZJUll1eT7I5xSKII8EZXVE96oR0vTdaVqc
	9PYEnYSNGnv523vxzi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUNE-00D5X3-3P; Thu, 21 Apr 2022 10:49:20 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUNB-00D5UQ-FN
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 10:49:19 +0000
Received: by mail-yb1-xb30.google.com with SMTP id g14so4674785ybj.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BQ0CLsTXT42vFbYOeRl03igvGnE16091WeuDyL+jVf4=;
 b=LTvf19NnKXJimjRK01dVNnocqskdXFhHxxWcuUhM+Pm4NKHJj4m49ZCfwZGqk6RxnD
 Rj9ZtBzTzaj6mKrxS0UGtbSJJ4YPT/AlQZcOlOdP4gIXhh9kqHNWNkKVTkOnkvJmxmGa
 BUTCfaDtQXfwOFBTN7Kb1hkJidhkZIbF7gSDIeNZjVZ8LdIysJCS69c5giEmws4XD1Ak
 F0SnlJJtIb5WnXG6a7fYOG6mNOyBDMSf/VaUPYTy2owrQwI7QzMoFXoVHues9TIuEcFu
 V9GdVCiUDUGu4sBQdH5P4PoU0WYNxqih5SmzNwGyBX6k8BK8Fgul6OQvh/7a8JJ2b4aa
 Y7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BQ0CLsTXT42vFbYOeRl03igvGnE16091WeuDyL+jVf4=;
 b=5bIO1I3tPJSLuuLBn/sRo++9Kpr42uwTvP/mIzrjlXnuoscNXEiNVjXM+NjYKaLTZ5
 t079bZ4i4J0WFaYn54lHRq0XNm/SknYagvZ3CydVOf1YnHHGrAbUuTno20kLaZH1sfiL
 fERcsg2HcWybgk7yoY5M381AVWnMpHdTPBpxHTjVLkuXF3qlWQ9V1d1imbto1ZWN1x13
 C2t54KvuzEhjYu+T/cV8Q+l5ewifDZ+ZYqHyrzAjfbWoIV4m19ZMxGQWp/sgl9RGbZsH
 +XrBjCRh5NcQ1CQNoNdmi01C2fFO8YRw1aQyA6NCeWhGW62YGh+EjLbx+GBNW4gbsdbt
 8dwg==
X-Gm-Message-State: AOAM530WVzerTvqoOSJWJOkpiuBaawI2f3xG+xgPN8MguqAUX29J/OWI
 CMmxqzjGXwO+jKCPhMRhqk7kV663j61bichDUgOQuQ==
X-Google-Smtp-Source: ABdhPJzJtPgo/lx5O03SPinhaB+c3NAb+x84sJgadXvgRzJK9w5kOO3zpF7r9W2DbkCbFipkU3OPlEs4awZRZsxCAbs=
X-Received: by 2002:a25:dd02:0:b0:645:76bb:e38d with SMTP id
 u2-20020a25dd02000000b0064576bbe38dmr1529379ybg.88.1650538155724; Thu, 21 Apr
 2022 03:49:15 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Apr 2022 16:19:04 +0530
Message-ID: <CA+G9fYvnf3Ys+ptCJf1fNOc1rjTiSEEY9Gxbc49eOrx227xOoQ@mail.gmail.com>
Subject: [next] riscv: sifive/fu540-c000.dtsi:171.4-42: ERROR
 (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property
 name
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034917_548724_1BA72BCF 
X-CRM114-Status: UNSURE (   5.09  )
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

Linux next-20220421 riscv defconfig builds failed [1].

Regressions found on riscv:

   - riscv-clang-13-defconfig
   - riscv-clang-12-defconfig
   - riscv-gcc-10-defconfig
   - riscv-clang-nightly-defconfig
   - riscv-clang-11-defconfig
   - riscv-gcc-8-defconfig
   - riscv-clang-14-defconfig
   - riscv-gcc-9-defconfig
   - riscv-gcc-11-defconfig

arch/riscv/boot/dts/sifive/fu540-c000.dtsi:171.4-42: ERROR
(duplicate_property_names): /soc/dma@3000000:compatible: Duplicate
property name
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.lib:376:
arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb] Error 2

drivers/pci/pci-driver.c:533:12: warning:
'pci_restore_standard_config' defined but not used [-Wunused-function]
  533 | static int pci_restore_standard_config(struct pci_dev *pci_dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The recent patch on this file.
I will run my bisect script and get back to you.
---
riscv: dts: Add dma-channels property and modify compatible


Add dma-channels property, then we can determine how many channels there
by device tree, in addition, we add the pdma versioning scheme for
compatible.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/2868anlKwTP8aavo19LT6KRIq1T/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
