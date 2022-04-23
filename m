Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DE7C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irk/3fre5JThWwVBsABPh1IyYVh1GTezYWfKV2zzxEw=; b=sEFje+yysDXyUp
	/m0D/mdUjuSFLUZmWatwxuwJsotBgZOm38xu8X3Li7FybIFfzom2KoAtzgy9DxkbeWcOgS3e0W/7X
	i/mqp26V0PD10rPjAH8axpRIAqHi54/WZm+Fmup5mX/dwDbo03IyKDJWZKlIDNwTyngR0yQJd/LRS
	9AgbfOTGNPrWRBzmPR2aKhriY32ZPCG7IiI6AfdEIvOFIfZT/A2H/qy25YrYZeR7UmGE7bLXKnZWV
	+jQV+PACnIzboCL2onBr0+d8ZThU1n0bIRIWl7kCIqxiG3MnW3gp25Ap1lQ/etb1ux3qA0UpKifHW
	5cgLHIeojfq4cLQi+rzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mu-003Axf-0l; Sat, 23 Apr 2022 01:42:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mq-003Au5-HN
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:42:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32B20B83219;
 Sat, 23 Apr 2022 01:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C566CC385A4;
 Sat, 23 Apr 2022 01:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678129;
 bh=tcithC5DzEZer/G1ZlAY81222Ep4Lx6hTBgIm+kR3yg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m8nGQ2us8izwcK0E9KYE2RDKp3QUQJ8pPw/6f/CKVx+WwIo18sdW4JibVXg+hszcC
 gEYfv1/A1/zygFiQoblrcYsDTwz/8s6HCvxjInhunLk9EJUG9JVdFc3jzGcEN8I2Nt
 KzemqXxNbad+7ty+HfA/7gvDtewkWXvL4jfVUJtjmKfpG/4NKXih/oRKJ5AgjT7mMS
 s8fNWGMznevxfss27DTVmUAwbbro5qCTV3sr2/P/RfLGxgXg2u6I3N5MikoTW6YreY
 bUnS5CtjQkMLZhHN1JH4szEABZjmqm55I4tswYrxXZuAcZchU9Y6y+QNs3PcJR56j/
 56NOaVaZYAvJQ==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-10-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 9/9] riscv: dts: microchip: reparent mpfs clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:42:08 -0700
User-Agent: alot/0.10
Message-Id: <20220423014209.C566CC385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184212_763716_26629F18 
X-CRM114-Status: GOOD (  10.26  )
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

Quoting Conor Dooley (2022-04-13 00:58:36)
> The 600M clock in the fabric is not the real reference, replace it with
> a 125M clock which is the correct value for the icicle kit. Rename the
> msspllclk node to mssrefclk since this is now the input to, not the
> output of, the msspll clock. Control of the msspll clock has been moved
> into the clock configurator, so add the register range for it to the clk
> configurator. Finally, add a new output of the clock config block which
> will provide the 1M reference clock for the MTIMER and the rtc.
> 
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
