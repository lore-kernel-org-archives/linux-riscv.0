Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87511CFB449
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4YahAAIe512PrhKKBpcXJPb/bngVbHk3y8Jfzd8FSE=; b=i2u8jqX7nTDloS
	pC0lY1BmApi1Ry9YHRLhfy5q8Gg4Z7sLrEkeNLAor1Xl/X7wj32n5w8DMQUnlzty5bipRBBcbcDdA
	3nUUBZfH4ILVlgOkRlWE6bVj6m4FZFkuRBX+xrNx/poeoCBooe0JQjkTOr6sreoWzDIeqblCmXq9v
	6niokADpIQMKTzZ988PAVIPNUM2pX6qFFNT1epkyNTSnBpQim9HxaKDja/9Siuc79tJGe0AZd0mJK
	3xmWFrKasGDDxYlFR1KkGx39uAGun2J1EvANznsjHxPRpBFU7K2WFG7GqZYH6Oth6Lu3Fxbd1plTS
	JLZskeh8+YnjfksO48LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqLD-000000036ab-3VQY;
	Mon, 07 Oct 2024 16:12:11 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqJ7-000000035tc-3ncZ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728317401; x=1759853401;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0ckgttVVxx/A8mJwmIbK5+m1JqwAMDJpayDNo47JfVE=;
  b=Eo6yFVDOfI1Do9+pyo6xucsznYiacNml9e/kEvhVC/Mkl2cqPOjRKt8G
   KkH5+T4VQl4rKxbgYtKP+cwr0URZwZ+Hy5fsKFi0bNglncwHpGX3tVyyK
   BQkKAeW5jrMLc7nMUy8DvtyjeRnZjRVgQ+/duV5ZFZHhSR8WdmpTucYlG
   heJ+GOEOb1lEN7jn54NJQ5BOL1U12LG+wzJEWci6sjpO4RYwQoOWdv7fe
   Qd+QTa4lTRKa74teqHYwIyX37N+3Evv3jyayBG4aEXA+ruAdA+kQGVPZw
   tsJR5Y5T/vOPuYUTBEQh1+EDVDzW5ajI5ok8p8ohOEflEZ0wirPpOqoLK
   g==;
X-CSE-ConnectionGUID: 8Dyf7TzgRwiYqKAu6Gg6TA==
X-CSE-MsgGUID: Ef5kznrlSBKHLG5UgX9ODw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27601953"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27601953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 09:10:00 -0700
X-CSE-ConnectionGUID: wdpEStqeSjSYOgDBfzvrQA==
X-CSE-MsgGUID: WKnje6DdSwyOpBOrQ8e+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75478775"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.89.141])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 09:09:55 -0700
Message-ID: <51b6cee1-d23f-475e-bfe0-979e96e687c6@intel.com>
Date: Mon, 7 Oct 2024 19:09:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mmc: sdhci: Prevent stale command and data interrupt
 handling
To: Michal Wilczynski <m.wilczynski@samsung.com>, ulf.hansson@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 m.szyprowski@samsung.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <CGME20241003161012eucas1p2ab704a8771869e142b024cc95d5ecb5d@eucas1p2.samsung.com>
 <20241003161007.3485810-1-m.wilczynski@samsung.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241003161007.3485810-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_091002_576524_74712890 
X-CRM114-Status: GOOD (  23.74  )
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

On 3/10/24 19:10, Michal Wilczynski wrote:
> While working with the T-Head 1520 LicheePi4A SoC, certain conditions
> arose that allowed me to reproduce a race issue in the sdhci code.
> 
> To reproduce the bug, you need to enable the sdio1 controller in the
> device tree file
> `arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi` as follows:
> 
> &sdio1 {
> 	bus-width = <4>;
> 	max-frequency = <100000000>;
> 	no-sd;
> 	no-mmc;
> 	broken-cd;
> 	cap-sd-highspeed;
> 	post-power-on-delay-ms = <50>;
> 	status = "okay";
> 	wakeup-source;
> 	keep-power-in-suspend;
> };
> 
> When resetting the SoC using the reset button, the following messages
> appear in the dmesg log:
> 
> [    8.164898] mmc2: Got command interrupt 0x00000001 even though no
> command operation was in progress.
> [    8.174054] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
> [    8.180503] mmc2: sdhci: Sys addr:  0x00000000 | Version:  0x00000005
> [    8.186950] mmc2: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
> [    8.193395] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
> [    8.199841] mmc2: sdhci: Present:   0x03da0000 | Host ctl: 0x00000000
> [    8.206287] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [    8.212733] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x0000decf
> [    8.219178] mmc2: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
> [    8.225622] mmc2: sdhci: Int enab:  0x00ff1003 | Sig enab: 0x00ff1003
> [    8.232068] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [    8.238513] mmc2: sdhci: Caps:      0x3f69c881 | Caps_1:   0x08008177
> [    8.244959] mmc2: sdhci: Cmd:       0x00000502 | Max curr: 0x00191919
> [    8.254115] mmc2: sdhci: Resp[0]:   0x00001009 | Resp[1]:  0x00000000
> [    8.260561] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
> [    8.267005] mmc2: sdhci: Host ctl2: 0x00001000
> [    8.271453] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr:
> 0x0000000000000000
> [    8.278594] mmc2: sdhci: ============================================
> 
> I also enabled some traces to better understand the problem:
> 
>      kworker/3:1-62      [003] .....     8.163538: mmc_request_start:
> mmc2: start struct mmc_request[000000000d30cc0c]: cmd_opcode=5
> cmd_arg=0x0 cmd_flags=0x2e1 cmd_retries=0 stop_opcode=0 stop_arg=0x0
> stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0
> sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0
> can_retune=0 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1
> retune_period=0
>           <idle>-0       [000] d.h2.     8.164816: sdhci_cmd_irq:
> hw_name=ffe70a0000.mmc quirks=0x2008008 quirks2=0x8 intmask=0x10000
> intmask_p=0x18000
>      irq/24-mmc2-96      [000] .....     8.164840: sdhci_thread_irq:
> msg=
>      irq/24-mmc2-96      [000] d.h2.     8.164896: sdhci_cmd_irq:
> hw_name=ffe70a0000.mmc quirks=0x2008008 quirks2=0x8 intmask=0x1
> intmask_p=0x1
>      irq/24-mmc2-96      [000] .....     8.285142: mmc_request_done:
> mmc2: end struct mmc_request[000000000d30cc0c]: cmd_opcode=5
> cmd_err=-110 cmd_resp=0x0 0x0 0x0 0x0 cmd_retries=0 stop_opcode=0
> stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0
> sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0
> data_err=0 tag=0 can_retune=0 doing_retune=0 retune_now=0 need_retune=0
> hold_retune=1 retune_period=0
> 
> Here's what happens: the __mmc_start_request function is called with
> opcode 5. Since the power to the Wi-Fi card, which resides on this SDIO
> bus, is initially off after the reset, an interrupt SDHCI_INT_TIMEOUT is
> triggered. Immediately after that, a second interrupt SDHCI_INT_RESPONSE
> is triggered. Depending on the exact timing, these conditions can
> trigger the following race problem:
> 
> 1) The sdhci_cmd_irq top half handles the command as an error. It sets
>    host->cmd to NULL and host->pending_reset to true.
> 2) The sdhci_thread_irq bottom half is scheduled next and executes faster
>    than the second interrupt handler for SDHCI_INT_RESPONSE. It clears
>    host->pending_reset before the SDHCI_INT_RESPONSE handler runs.
> 3) The pending interrupt SDHCI_INT_RESPONSE handler gets called, triggering
>    a code path that prints: "mmc2: Got command interrupt 0x00000001 even
>    though no command operation was in progress."
> 
> To solve this issue, we need to clear pending interrupts when resetting
> host->pending_reset. This ensures that after sdhci_threaded_irq restores
> interrupts, there are no pending stale interrupts.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/mmc/host/sdhci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 4b91c9e96635..b91a6076c332 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3098,6 +3098,10 @@ static bool sdhci_request_done(struct sdhci_host *host)
>  		sdhci_reset_for(host, REQUEST_ERROR);
>  
>  		host->pending_reset = false;
> +
> +		/* Clear any pending interrupts after reset */
> +		sdhci_writel(host, SDHCI_INT_CMD_MASK | SDHCI_INT_DATA_MASK,
> +			     SDHCI_INT_STATUS);

According to SDHCI spec, "Software Reset For CMD Line" clears
"Command Complete" in "Normal Interrupt Status register", so the
interrupt status should not need to be cleared again.

Which SDHCI driver is it?

>  	}
>  
>  	/*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
