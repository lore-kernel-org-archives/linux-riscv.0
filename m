Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKBe0ZPPM5YCUig1X1ikRAkFoNAd/Tqg+xa6HzWPYiY=; b=2Ei6cepG8eBykr
	9n015IIdU+pELd+PTxaBcPdFzjo6Q0KtOanBUS5ROlaG4swr+WP/DV8FYsL8c9RPjWzZ7JbzFFkPS
	Gxb1K9nJL1Lmk0YV5NUP8CNTB7rIvObGXykM9iQ6nhPWOn9Py8RBFL9wJdFcRXIoPqSm+ijJ0blae
	D0Krff4WO8esYy3iBo9EkfYSLrPxZkbKqoGvUla5ex8BojOSlxF6LngtfPcXkBNQgkDcfOcoQGSl6
	v7DBaNntShLQULIh3gIVM7BKWyISRYg4rNeC+M0Zs7vjw69++AT7F03i3b4C1TgQZ+h+EZsimtduE
	TQ2kOb520ukWrd382vtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mb-003Aka-Pk; Sat, 23 Apr 2022 01:41:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mZ-003AiW-3n
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B68D61368;
 Sat, 23 Apr 2022 01:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01E6C385A4;
 Sat, 23 Apr 2022 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678114;
 bh=ihPaSFuwN2TjpHaNcek0Q7kKelDbk3E90g7VQV6Eh+k=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZvPXzBLjqWioededoX7PB/3PILpKzLUO0+7M6hHReYSYMSpKRYNg5pKyRWX7FXCdc
 hg+2CtHIO/ry8wD2MLSxpji4PJggT7rzAkbmT5MZKLy10SUTWRIVAa0mLOxjofbx+s
 VjJrNlZI2DxMiXNNNefSfpRfYmG8ApdLnWoGfNRMJ1vZ0AkyPdWIxNrD7QtS/FTZ8c
 rwvzrvRuaB2V0v+ZSPR9ynhpBnIyKALv3brFVmbzVAIn2CqIQw7Wsv0RmLqJovkebG
 cSULV/g2XZYJOVYwzhDfW6zxDRBeDWW8oTacJgsScsbD5pKfVxPc7Hw0svi/59ArfK
 y3shGZNBppLvQ==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-8-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 7/9] clk: microchip: mpfs: re-parent the configurable
 clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:52 -0700
User-Agent: alot/0.10
Message-Id: <20220423014153.F01E6C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184155_215995_32986630 
X-CRM114-Status: GOOD (  12.81  )
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

Quoting Conor Dooley (2022-04-13 00:58:34)
> Currently the mpfs clock driver uses a reference clock called the
> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
> (config) clocks. The frequency of the msspll is determined by the FPGA
> bitstream & the bootloader configures the clock to match the bitstream.
> The real reference is provided by a 100 or 125 MHz off chip oscillator.
> 
> However, the msspll clock is not actually the parent of all clocks on
> the system - the reference clock for the rtc/mtimer actually has the
> off chip oscillator as its parent.
> 
> In order to fix this, add support for reading the configuration of the
> msspll & reparent the "config" clocks so that they are derived from
> this clock rather than the reference in the device tree.
> 
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
