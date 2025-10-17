Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFEECCD19F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ld8+ecRu2ll/oJygzeK8KFI/ngIBWI2yr3TmrRufOKY=; b=fu1/oITwGkFvFtWlxJtjiOKsot
	pSi97iO0W8LiyMyb6PF7ZLa8G/WpQX2SJMMtALqIGPNPUC2pW3Ab/QFsjT9rGWiNbFzPucjgU4gO3
	8vz2nuIJxI81o/tm9Sl0qSAEFfYjSuQ2+0tNFd+7gCUMnGGD7C6Q0WtjjG0ndvUTf5QqpJmFeX9Hj
	BeiX+UtyXYLeXQIMEYiFZwOKLvd/m57tKY3nQfgLNOSLlfmnm1SKHTVtlrJ0FMEWhXhs+EB2vCMpI
	VdC8dWYl1ydezVAYuSbDcH8hZDlv4Z6haR2ICyn72DydWFSd5ZlNHVaSzx1Nfn+GYhX5Wi8vZthl5
	XbbeZryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCV-00000008QBW-03Jc;
	Fri, 17 Oct 2025 16:21:07 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCS-00000008Q8z-089P
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:21:05 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-430b621ec08so18129295ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718063; x=1761322863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V5OPF9MQYXuFed4Nr/kXKcbfQ5kgh8+dek3Kx0+shzI=;
        b=MzYDug7R31ngJJfESYtOji4gY0yzt0gh5kdDZGynTZcQxqR+YO46y35ESdgqnK1oiX
         UfsM5Qn4BaVN5QtLxcfge8uk/G/+CU9YN0ti7jfstztAyiOxcZtQKRPL7/xDXW2KF8RU
         tm1M9B/xwoIg5EAcMvXH0/Ir3V9+9/DiCrewT1bzqOfrdqfZhijt0OHAaLLafVAdflm5
         N7P0T4oQGyKmdGkM8q9dVpVsoI4C5xBj4fdayYobvkRbge9NP6e6AnU3KL0HAKlAAjEc
         y4ApVsaCmUpOvSbbHhd/vYIKCcHuZ5hC1x0Z+C2ZnBzuJmuIJs6Gaia689T5NWNFUTeC
         iyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718063; x=1761322863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5OPF9MQYXuFed4Nr/kXKcbfQ5kgh8+dek3Kx0+shzI=;
        b=vjnJ4hS19J/KUtN7QfYGdBzFuPYbSgdbTwUi6ZUsKoSBWxWn74J9/0zRxfJ9qbUqxG
         lBiChhpYVXBnjZsy0+sLYn4EitI8N/jySP1KNSisUje7CzyvqdEGu5pIPqRNQPDI62FS
         gZ0zFS3wsdW5CUJ1Ev8YJv8rYwwVJlznBa/Pjy1EJJl3rvUGOpr/pa8s1EOQGjEe3cNo
         gonNJbvRUAzK6q9kja0cNP+AU2WCjW3U+4i8725jsdRCpE/egVonhmodBFSLmikrrTLU
         eAXOdzGig1b97lRvDSa4kA3ZqfR+qN82DmQR7eERmOz6tQWJx0y0OSHq78s5dkoo7JeM
         ZjMw==
X-Forwarded-Encrypted: i=1; AJvYcCVStYDzFQNFWkgZeFeW9ocXLulDSfHGs037nkaSTzBVRemsFXhOQZBsGyzy7g1/HeF1Qeb+fI8n/Y0aqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy80D9JZCzx1c8+ADcmIh9hBtGMkCEvZU3Q1RfVsbvgBXLmVyCl
	doLqyxMY2MVfCno9gwBHVVzOg/FOIRQzygWQ4pGiP/57j3yKIPEvs39aGh2yiKs9MWY=
X-Gm-Gg: ASbGncvCuRnifiA0FVgEArQtZdTRRkue2iM4Z3azxy1sN1Pl9b9cbV162tZZh/VGneC
	eS0RwhbkmLLO+p/ABkWia85d88AwykYVsO2OqrcO8hTLxMsAG156HwJzKo1dXFpy1Ad9vXcYzMt
	DjCkewr6ky5EFv83zjxPEYBKJZFSl2MJ2O8/Rc0CzV/YLYmuHQ/06Y/1TSeyIggRQO1ey61Zzoa
	CkBVQKy2n5789fHBpa9MOZmLOR+8Ujy/RwziD9jHKcm459f+lLntT1X+IBRQLiXxOHx+6IozJuC
	lvUID55VE9wF1o6XH9J2LlcbVGEa72Cvj6BNNGqIN8m9TCLGdHn4j1jLhXG75iAgUnoO61wn9iB
	cYAJW3cQswU/t5UBpsrieMe1Cu3tAf9pLIgB6L/zPHc4JwJEjdL+DHbZrUkSotuHYvhSGwVvK6A
	GPXkmdRpICOeiXa9yUBj8yQm00c/ZZNayPpyKOEd5Ncwq4y8koHQ==
X-Google-Smtp-Source: AGHT+IG3DZtIVoWgPN5tvCgGkBUTeqvd5qyoLhI1JrzlxbkjqqPI7UAzBrwCEOdwr214b+XxIHv5wA==
X-Received: by 2002:a05:6e02:1a82:b0:430:cf19:e682 with SMTP id e9e14a558f8ab-430cf19e837mr15167475ab.13.1760718062603;
        Fri, 17 Oct 2025 09:21:02 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a962f04fsm22836173.21.2025.10.17.09.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:21:02 -0700 (PDT)
Message-ID: <cff71664-6f61-4cfc-9542-20781a559ef4@riscstar.com>
Date: Fri, 17 Oct 2025 11:21:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] phy: spacemit: introduce PCIe/combo PHY
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-5-elder@riscstar.com> <aPAXRiGA8aTZCNTm@aurel32.net>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPAXRiGA8aTZCNTm@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092104_080948_805F61A6 
X-CRM114-Status: GOOD (  42.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/15/25 4:51 PM, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-13 10:35, Alex Elder wrote:
>> Introduce a driver that supports three PHYs found on the SpacemiT
>> K1 SoC.  The first PHY is a combo PHY that can be configured for
>> use for either USB 3 or PCIe.  The other two PHYs support PCIe
>> only.
>>
>> All three PHYs must be programmed with an 8 bit receiver termination
>> value, which must be determined dynamically.  Only the combo PHY is
>> able to determine this value.  The combo PHY performs a special
>> calibration step at probe time to discover this, and that value is
>> used to program each PHY that operates in PCIe mode.  The combo
>> PHY must therefore be probed before either of the PCIe-only PHYs
>> will be used.
>>
>> Each PHY has an internal PLL driven from an external oscillator.
>> This PLL started when the PHY is first initialized, and stays
>> on thereafter.
>>
>> During normal operation, the USB or PCIe driver using the PHY must
>> ensure (other) clocks and resets are set up properly.
>>
>> However PCIe mode clocks are enabled and resets are de-asserted
>> temporarily by this driver to perform the calibration step on the
>> combo PHY.
>>
>> Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
> 
> Thanks for this new version. I have tried it on top of v6.18-rc1 +
> spacemit DTS commits from next on a BPI-F3, and it fails calibrating the
> PHY with:

I don't see this on my BPI-F3, but I now understand why.

> [    2.748405] spacemit-k1-pcie-phy c0b10000.phy: error -ENOENT: calibration failed
> [    2.755300] spacemit-k1-pcie-phy c0b10000.phy: error -ENOENT: error probing combo phy
> [    2.763088] spacemit-k1-pcie-phy c0b10000.phy: probe with driver spacemit-k1-pcie-phy failed with error -2
> [   14.309031] platform c0d10000.phy: deferred probe pending: (reason unknown)
> [   14.313426] platform c0c10000.phy: deferred probe pending: (reason unknown)
> [   14.320347] platform ca400000.pcie: deferred probe pending: platform: supplier c0c10000.phy not ready
> [   14.329542] platform ca800000.pcie: deferred probe pending: platform: supplier c0d10000.phy not ready
> 
> Note that version 1 was working fine on the same board.
> 
> [ snip ]
> 
>> diff --git a/drivers/phy/phy-spacemit-k1-pcie.c b/drivers/phy/phy-spacemit-k1-pcie.c
>> new file mode 100644
>> index 0000000000000..81bc05823d080
>> --- /dev/null
>> +++ b/drivers/phy/phy-spacemit-k1-pcie.c
> 
> [ snip ]
> 
>> +static int k1_pcie_combo_phy_calibrate(struct k1_pcie_phy *k1_phy)
>> +{
>> +	struct reset_control_bulk_data resets[] = {
>> +		{ .id = "dbi", },
>> +		{ .id = "mstr", },
>> +		{ .id = "slv", },
>> +	};
>> +	struct clk_bulk_data clocks[] = {
>> +		{ .id = "dbi", },
>> +		{ .id = "mstr", },
>> +		{ .id = "slv", },
>> +	};
>> +	struct device *dev = k1_phy->dev;
>> +	struct reset_control *phy_reset;
>> +	int ret = 0;
>> +	int val;
>> +
>> +	/* Nothing to do if we already set the receiver termination value */
>> +	if (k1_phy_rterm_valid())
>> +		return 0;
>> +
>> +	/* De-assert the PHY (global) reset and leave it that way for USB */
>> +	phy_reset = devm_reset_control_get_exclusive_deasserted(dev, "phy");
>> +	if (IS_ERR(phy_reset))
>> +		return PTR_ERR(phy_reset);
>> +
>> +	/*
>> +	 * We also guarantee the APP_HOLD_PHY_RESET bit is clear.  We can
>> +	 * leave this bit clear even if an error happens below.
>> +	 */
>> +	regmap_assign_bits(k1_phy->pmu, PCIE_CLK_RES_CTRL,
>> +			   PCIE_APP_HOLD_PHY_RST, false);
>> +
>> +	/* If the calibration already completed (e.g. by U-Boot), we're done */
>> +	val = readl(k1_phy->regs + PCIE_RCAL_RESULT);
>> +	if (val & R_TUNE_DONE)
>> +		goto out_tune_done;
I refer to the above three lines, below.

>> +	/* Put the PHY into PCIe mode */
>> +	k1_combo_phy_sel(k1_phy, false);
>> +
>> +	/* Get and enable the PCIe app clocks */
>> +	ret = clk_bulk_get(dev, ARRAY_SIZE(clocks), clocks);
>> +	if (ret <= 0) {
>> +		if (!ret)
>> +			ret = -ENOENT;
>> +		goto out_tune_done;
>> +	}
> 
> This part doesn't look correct. The documentation says this function
> "returns 0 if all clocks specified in clk_bulk_data table are obtained
> successfully, or valid IS_ERR() condition containing errno."
> 
> To me, it seems the code should only be:
> 
> 	ret = clk_bulk_get(dev, ARRAY_SIZE(clocks), clocks);
> 	if (ret)
> 		goto out_tune_done;

OK I understand the problem here.

On v1 of the series, this used clk_bulk_get_all(), and I changed
that to clk_bulk_get().  There is now an additional reference
clock defined, used by the PLL clock.  So here we only want to
get three clocks, not that new one.

The return value from clk_bulk_get_all() is the number of clocks,
and 0 means "not found".  So I guess I neglected to change the
handling of the return value here when I changed the function.

The reason I didn't see this is that calibration only ever has
to happen once (per boot).  In the lines I noted earlier, the
PCIE_RCAL_RESULT register is read, and if the R_TUNE_DONE bit
is already set, calibration is complete (probably done by the
boot loader).

In my case, calibration was already done, so I never had to get
the clock or resets, etc.  In your case, this driver had to do
the calibration, so you (successfully) got the clocks, and
that (erroneously) resulted in an error.

I reproduced the problem(s) you observed by forcing the
calibration on my machine.

Thank you very much for reporting this.  Your fix is correct,
and I will include it in v3 of the series.

> [snip]
> 
>> +out_put_clocks:
>> +	clk_bulk_put_all(ARRAY_SIZE(clocks), clocks);
> 
> When fixing the above bug, this then crashes with:
> 
> [    2.776109] Unable to handle kernel paging request at virtual address ffffffc41a0110c8
> [    2.783958] Current kworker/u36:0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000022a7000
> [    2.792302] [ffffffc41a0110c8] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [    2.800980] Oops [#1]
> [    2.803217] Modules linked in:
> [    2.806261] CPU: 3 UID: 0 PID: 58 Comm: kworker/u36:0 Not tainted 6.18.0-rc1+ #4 PREEMPTLAZY
> [    2.814763] Hardware name: Banana Pi BPI-F3 (DT)
> [    2.819366] Workqueue: events_unbound deferred_probe_work_func
> [    2.825180] epc : virt_to_folio+0x5e/0xb8
> [    2.829172]  ra : kfree+0x3a/0x528
> [    2.832558] epc : ffffffff8034e12e ra : ffffffff8035557a sp : ffffffc600243980
> [    2.839762]  gp : ffffffff82074258 tp : ffffffd700994d80 t0 : ffffffff80021540
> [    2.846967]  t1 : 0000000000000018 t2 : 2d74696d65636170 s0 : ffffffc600243990
> [    2.854172]  s1 : ffffffc600243ab8 a0 : 03ffffc41a0110c0 a1 : ffffffff82123bd0
> [    2.861377]  a2 : 7c137c69131cec36 a3 : ffffffff816606d8 a4 : 0000000000000000
> [    2.868583]  a5 : ffffffc500000000 a6 : 0000000000000004 a7 : 0000000000000004
> [    2.875787]  s2 : ffffffd700b98410 s3 : ffffffc600243ab8 s4 : 0000000000000000
> [    2.882991]  s5 : ffffffff80828f1c s6 : 0000000000008437 s7 : ffffffd700b98410
> [    2.890197]  s8 : ffffffd700b98410 s9 : ffffffd700900240 s10: ffffffff81fc4100
> [    2.897401]  s11: ffffffd700987400 t3 : 0000000000000004 t4 : 0000000000000001
> [    2.904607]  t5 : 000000000000001f t6 : 0000000000000003
> [    2.909902] status: 0000000200000120 badaddr: ffffffc41a0110c8 cause: 000000000000000d
> [    2.917802] [<ffffffff8034e12e>] virt_to_folio+0x5e/0xb8
> [    2.923097] [<ffffffff8035557a>] kfree+0x3a/0x528
> [    2.927784] [<ffffffff80828f1c>] clk_bulk_put_all+0x64/0x78
> [    2.933340] [<ffffffff807249d6>] k1_pcie_phy_probe+0x4ee/0x618
> [    2.939155] [<ffffffff808e35e6>] platform_probe+0x56/0x98
> [    2.944538] [<ffffffff808e0328>] really_probe+0xa0/0x348
> [    2.949832] [<ffffffff808e064c>] __driver_probe_device+0x7c/0x140
> [    2.955909] [<ffffffff808e07f8>] driver_probe_device+0x38/0xd0
> [    2.961724] [<ffffffff808e0912>] __device_attach_driver+0x82/0xf0
> [    2.967801] [<ffffffff808dde6a>] bus_for_each_drv+0x72/0xd0
> [    2.973356] [<ffffffff808e0cac>] __device_attach+0x94/0x198
> [    2.978912] [<ffffffff808e0fca>] device_initial_probe+0x1a/0x30
> [    2.984815] [<ffffffff808defee>] bus_probe_device+0x96/0xa0
> [    2.990370] [<ffffffff808dff0e>] deferred_probe_work_func+0xa6/0x110
> [    2.996707] [<ffffffff8005cb66>] process_one_work+0x15e/0x340
> [    3.002436] [<ffffffff8005d58c>] worker_thread+0x22c/0x348
> [    3.007905] [<ffffffff80066b7c>] kthread+0x10c/0x208
> [    3.012853] [<ffffffff80014de0>] ret_from_fork_kernel+0x18/0x1c0
> [    3.018843] [<ffffffff80c917d6>] ret_from_fork_kernel_asm+0x16/0x18
> [    3.025098] Code: 7a98 8d19 2717 0131 3703 5fa7 8131 8d19 051a 953e (651c) f713
> [    3.032497] ---[ end trace 0000000000000000 ]---
> 
> It seems that we want clk_bulk_put() and not clk_bulk_put_all(). The
> latter free the clocks, while they have been allocated on the stack.

Yes, you are correct.  This too is an artifact of me doing a bad job
switching to the clk_bulk_get() interface.

Thanks again for your message.  Reviews are awesome, but someone
actually testing it is a good way to find problems like this.

					-Alex

> 
> Regards,
> Aurelien
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
