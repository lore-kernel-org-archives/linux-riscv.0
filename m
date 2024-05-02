Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B88C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92jPB0vCZ5NtKNsKkLwcOYGcsi6If34hRmsGz6WvxGE=; b=si3raCpzwFdZQi
	zaFcMo+LzNy/tAaNUxT+2l5vCGxg6ZSKJ1/jGKHtpx1RHs3WFdsevxl9ibhmcoGtj3Q4xE6OQ8bwj
	bsVeBIhtIHR9ei2hMHwBIOW/ftaig3OV+bFpTXWy3xu/JqiFAaFQsL94FzATCldsqTzSw3qTyNDBT
	zR8kb1t4QmxKAH5x7rUUKva5f88eN4gnU85s8UyXR4EdfwUl+B4hqjBr6sbq+q9arXBp1B3oKS2VY
	C/8GSPkcyQ4Cy+bLN/tYtBHOu5hFp3RgucDiBIdj5QDjTqgofihbCgKw5B8WL1oOyZGiZFGMlH5d8
	lijlkoJfGLXEV7qyx/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAT-0000000BrHj-1aSH;
	Thu, 02 May 2024 07:47:49 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2RAP-0000000BrF3-0vsE
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 07:47:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C012CFF802;
	Thu,  2 May 2024 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714636060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl4f2gTcxSpdt9aNsQkLAMEx3yFNLiblqv3A5NbuTPQ=;
	b=V/ZI+t0OamjlUxNgd7Hs9zCPwvWCm5aoomKRH11nPihuCcrPMHbe8LaZbuzs4GTx+ComAm
	wRIJgZnO+2vY8iARc7N3BjCIa3Q9ciTeJtPtnIBx8pPTENzJHKE4qYO5SxowU5IBW7WeVJ
	by7tfYEkcesU17vpJzPxSTgMPpwMIfdjA7nYm8Fhu1ErEIH3Pakp8BrA8q9XZEdhLH0Iqj
	RGTL2M68bCza7EYNLpq/rt2sjaoTOT00iR/LcLcsTsMz5cMFF4iHdPWagzKARFwfFqWhPf
	xHLgd5/YBlvxNEyJfOsN0xOBUCauJKDivRUiBNW60NRg88d0pJci6Wo8Oludfg==
Message-ID: <588fb903-e5ca-43af-9258-c14aaab6c732@bootlin.com>
Date: Thu, 2 May 2024 09:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/4] clk: thead: Add support for TH1520 AP_SUBSYS
 clock controller
To: Drew Fustini <dfustini@tenstorrent.com>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_004745_581815_60D56497 
X-CRM114-Status: GOOD (  21.67  )
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



On 4/27/24 2:10 AM, Drew Fustini wrote:
> This series adds support for the AP sub-system clock controller in the
> T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> 2023 [2]. Jisheng made additional improvements and then passed on the
> work in progress to me.
> 
> Changes I made from the original series:
>   - corrected the npu_clk enable bit
>   - deduplicated CLK_NPU and CLK_NPU_AXI number in header
>   - fixed c910_i0_clk reg typo
>   - fixed checkpatch and dt_binding_check warnings
>   - rebased on v6.9-rc5
>   - revised commit descriptions
> 
> Changes since my RFC v1 [4]:
>   - squash the header file patch into the DT schema patch
>   - describe the changes I made to original series in the cover letter
>     instead of the individual patches
>   - fix my typo in my email address
> 
> TODO:
> I am again marking this as an RFC because there is feedback from v1 that
> I have not yet addressed. I am posting what I currently have as other
> patch series like the TH1520 I2C driver [4] could use the clk driver.
> 
> Emil commented that the input predivider is not handled correctly in
> ccu_mdiv_recalc_rate(). The PLL multiplies the input frequency and
> outputs "Foutvco". This is followed by a post divider to produce
> "Foutpostdiv". However, some clocks derive directly from the "Foutvco"
> Emil suggested this should really be modeled as two different clocks.
> 
> Emil aslo suggested that the rest of the clocks in this driver seem to
> be generic gate and mux implementations that should probably be replaced
> with devm_clk_hw_register_gate*() and devm_clk_hw_register_mux*().
> 
> I'll look to address the above issues in the next revision.
> 
> Thank you,
> Drew
> 
> [1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> [2] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
> [3] https://lore.kernel.org/lkml/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
> [4] https://lore.kernel.org/linux-riscv/20240425082138.374445-1-thomas.bonnefille@bootlin.com/

Thank you ! It works on the Beagle-V Ahead :)

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
