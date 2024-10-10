Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEACF11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzairfCpb0cVO59iCbJHYiAn283AlLbBVipFZqWmc2Q=; b=i9JnhofMBAlX6R
	ZFnSojfS56FW3hq18qSj2eRE3PiAhR2i7o4IwpBTEG2obxiM51hWn/YIOUvV14N0C9zVP8D066lKr
	2qpHE3sWbscAw519c5QujHtuCeRzOn2qNHOQeNzjIFl1InkvHMO6bYj/t3p+9HO2lNWIvwqLnlN+Z
	Cuxe0NhhyAb3e/lsLu5j74Qnu9Yp867ZuLiMDHCkHC8JKhScxK6+zQKqAQu7ATvqfEktQdJTLcOVX
	gUaxROLhdzK2JdNVWGcwbdmJWLrJge9nrMTGRDc/vvinqHDUd24QLgXlmJy7hwO3D+hTEYFmSBG0t
	dJAR/th2F9sZxR9LJMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sys67-0000000CgAn-1oRI;
	Thu, 10 Oct 2024 12:16:51 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syrVD-0000000CZba-1e4M
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 11:38:50 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e026a2238d8so663432276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728560322; x=1729165122; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oWKAy3syWeqfyDajdP61GxAc3COo467zM9mfdJaAXd8=;
        b=OzlDKSAfhOzpUs0nF5sJ6kB7AxnDx04LreDbExjTESKHrY7/nxe2qMnLLAVlSWq6gP
         JMvfTuxPGETRbFgSBnxcqL9vFMi5fAo2Qd+UHF486QfDid8tsw9PiL2dXVwoC3aQdQMq
         kzN9ogqmQqMDiQBnzYPEkSSbEIyb7WUTLXbIyeR28NwbLIWHcPkxH81J0x8Rm0aEVIND
         aFyCTzhYj0i0Rddl5e++wb8DoVaACzGd3EY4Fx/Z6G3kJQvVQf0/xoqkeoKo46WPEKtV
         FZ3kSUYTyVZPDrMz5ywF8aOPlCXTQuVoUgqGV2HfhzwlsKx3XKXF0qhKsubrHUdvcgIS
         Lk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560322; x=1729165122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWKAy3syWeqfyDajdP61GxAc3COo467zM9mfdJaAXd8=;
        b=avF0pLkeC6djCND7LwYj4rhew8daCr8hENR5kyI3Exr79Lv1RuytCHMIXpRdHA/vh1
         jy9QjaBTtLKsGp00864dXfHJhtv8b7QW68bgCxpEJKHF037wvCIk+g/HFMnS7Q9QslRq
         XEi4ScUxSmEh1egZolPq4J6ILGqXal60FWk2KsSqeOmCB9xHRI3ZDS09BuuNwmFbjLpZ
         NqU7SWaz0QBjlWYBiqhstPU+LSo5Gydwucp0P0yesjWHr/hcq7H3fM/P5M/2WYPkn0Ev
         r2/VILkqgoI4wiRUBD3OFGpSiP7qOaGczYpbXqZZMm3QHZmzi8kZxGUwIhWDPombYJI3
         3x/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqSyKSTwIqeYxa78pV7WnuKO9gBaku2xqNog3GYsk/JHgnVLlbOYp2wSENpoWltPqvmb/gwl5nCuo2GA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ATRthJHDXg/NZ6ynXw2SfRDEmxzjupHiWmAdaXNfp5y+Gy9h
	wir1LTQettxNOv4+ISuav1DdNy/+hKRPzaYlLH24QylcYYg83h7JcO/Nlm/tOAyEleBy5lrJPYX
	2TDarpx+yY6pz4OjIgXuromMO4Ujz5w+ycabwKg==
X-Google-Smtp-Source: AGHT+IGsDOFFVam6JAIJEMARKuCkSZlVAWXosNzehP9/3intrl55jugGbN70+7bRrhPtvnHvy1Ow9aegOnplHDlyGNg=
X-Received: by 2002:a05:6902:c03:b0:e1d:44e9:a8fa with SMTP id
 3f1490d57ef6-e28fe40ff41mr5210305276.46.1728560322138; Thu, 10 Oct 2024
 04:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20241008100332eucas1p12e84a156c835e719e6916331762c74b0@eucas1p1.samsung.com>
 <20241008100327.4108895-1-m.wilczynski@samsung.com>
In-Reply-To: <20241008100327.4108895-1-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Oct 2024 13:38:05 +0200
Message-ID: <CAPDyKFodeBUaZwAguAS-=t1tgmo=_mbm+v4JkGOXRON+hDuTVQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-dwcmshc: Prevent stale command interrupt handling
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: adrian.hunter@intel.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_043843_477403_7A8F839F 
X-CRM114-Status: GOOD (  29.56  )
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

On Tue, 8 Oct 2024 at 12:03, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
> While working with the T-Head 1520 LicheePi4A SoC, certain conditions
> arose that allowed me to reproduce a race issue in the sdhci code.
>
> To reproduce the bug, you need to enable the sdio1 controller in the
> device tree file
> `arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi` as follows:
>
> &sdio1 {
>         bus-width = <4>;
>         max-frequency = <100000000>;
>         no-sd;
>         no-mmc;
>         broken-cd;
>         cap-sd-highspeed;
>         post-power-on-delay-ms = <50>;
>         status = "okay";
>         wakeup-source;
>         keep-power-in-suspend;
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
> The behavior observed here is non-compliant with the SDHCI standard.
> Place the code in the sdhci-of-dwcmshc driver to account for a
> hardware-specific quirk instead of the core SDHCI code.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Applied for fixes and by adding a stable+fixes tag, thanks!

Kind regards
Uffe


> ---
> v2:
>  - instead of modifying SDHCI core code, only modify th1520 specific
>    reset
>
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 8999b97263af..8fd80dac11bf 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -852,6 +852,14 @@ static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
>
>         sdhci_reset(host, mask);
>
> +       /* The T-Head 1520 SoC does not comply with the SDHCI specification
> +        * regarding the "Software Reset for CMD line should clear 'Command
> +        * Complete' in the Normal Interrupt Status Register." Clear the bit
> +        * here to compensate for this quirk.
> +        */
> +       if (mask & SDHCI_RESET_CMD)
> +               sdhci_writel(host, SDHCI_INT_RESPONSE, SDHCI_INT_STATUS);
> +
>         if (priv->flags & FLAG_IO_FIXED_1V8) {
>                 ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
>                 if (!(ctrl_2 & SDHCI_CTRL_VDD_180)) {
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
