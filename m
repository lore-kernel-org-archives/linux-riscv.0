Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0843CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DUrk+L5hiIsmWX0Xn51/UgPM+RjyfPZ0y4G3wIQcl8=; b=gfxlHICPIESR0n
	FsdmQHvOpUq0Hn1zxxF5WARv1YwRAaMOlsokFj1kxS3X7VUtU3+LEaKiPSS2ughdnIY2nNyxuItiA
	cPqboZ2wfuLrNK26Lpn783mcPwr3bbN74FFACuJBuLwDzr0jvyauc9trZvxlof0y8VnkJTh5SR98w
	p9zxuzxspPJqcKfrdCnqh/pMNUUrWP6RUklKFxxHDoPCeTaT+0TsNLG8il7OdiCKWga7ljsHib+Ue
	pkgEzo0mQbfkjl1nj8hn47EzanKw5I2fVvnCFVIrGxpSnCodDKoTWAbEHF2MocnidxZ1jgInjVKPD
	ATBPZ7k5wXhi0onBPF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXzn-0000000H35x-3IPe;
	Thu, 14 Aug 2025 13:27:55 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWry-0000000GpWK-3Bju
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 12:15:48 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e57010c2bbso5224895ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755173746; x=1755778546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jH/A5TldJIt0r8HRzTTERB8tMOGIsMMgINBB+z4/hxw=;
        b=DHi/J1L2PnzXrYIwsFsEJzSCMhDXHjOJ3euEKDxVIoKtZWsqn9KBVWPBUqEgF/1Ktr
         6IFMVjUEupOjGFjBDYuXL+w/PqxR9NzBu0nl5wXa+iL34Z4Ei7wwsH9rci1Xuk20r73D
         kUS3Ex+PMD1pvjHT4Z73tb0hMupOQb8b0B7Xaw5mgzo1DfBP4Fvz/ilIvq/GRpq0ot/+
         gt4n53y/oPZs6jDo0PwLH5MWGDw1ucCnmC0t9nAmpQ+5d67/K2cntohLsUw1DPA4lvSh
         K1Xc7yFUAaAUFvSfDkugRSrDXZwIlHaLODpVvnBTUOActYCEeYfwgw5CzBRHkmcVYh6/
         75kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173746; x=1755778546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jH/A5TldJIt0r8HRzTTERB8tMOGIsMMgINBB+z4/hxw=;
        b=ExL+N8mQPvn4bVfRZBZk4DinbxSRsQ5RM5NetrI65Pv0QVMLBLuOx+qUx6/WvAkfWk
         RKa1pQjZtVPgv6TUemz9xlvMk//iE2EJOWhx19XJ/v3yfEBorpP7h/AZ1o5tJwcsbOO9
         nqqdUPHaDHVRn2yxRTuT1V5dauGe9KsVnVRUUtVwytZydpPdn+jsTAGYurOFmzYdv+P6
         epEp5CUv//FKmtpYeVAJkjy41kHeClnOOlpbzmDirQkZdWy/+I9R459xn9cYPy2UBvfm
         Ya++vm9VbHdTtOO2GWP2q+0aOGMfDaOK3Fz94QYQT5GKdsbmd7Vb3YBujE6IUTte6j4i
         mQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIeOuYxmeB8ZEbIx8mPj5Dhs5U8oknglegbZokBpyyTSG5GjvtGSK/NV++SbOhL9HWcsND61efjeJ1Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL7h/v+ySOWpqGz+GYMBkWJTMecYzocvk5TXj3ex6+0e2CyNVV
	CNiVOpw6UL7QcUPOwl+95q0nrb4PcuT6xdVXKnNbK2cvsMsqUYTyN2mTG9HOB4R5mh8=
X-Gm-Gg: ASbGncvKdWYg4ftViTGnq+a5jT4JdHYHQvdhC/+Tux93yukdeIy3plXCNWvjMEHkptE
	QNWK271zGTo1kunfGENjXZckPtF0BFlHIHNnINswZiob05P4/bTNaZVyz/8N2NSWpIj+gXD2+rC
	yubldwGroMAnDBlwodfQWX23p7CE3YZW7lDfTPyMVnnXbOmOFc6VZrRHMhzzhTWM8QOnIrGS+0a
	aMGaXJWU7DVwhdQQsO/XUzsBlQgLKJjsWuvLgj+g9ISBkW3V+kVdUQn47cEEbZxQn58s/8fkij5
	KJzaAMPe2CU3k+BOoFCpUaLTOwkz1+mrZcqEH/juXoqhNj8dDTwzMEtbE/jt9I7a43EmVq301V7
	WzQKBKGZmeNehjlY5gUpPIW5+n8rW1aAL6d/1cZvH7NM1iNshThR+E5Ez91zRDg==
X-Google-Smtp-Source: AGHT+IEk5Gf6e1UB1FErhDDdp2cqW5OM5qB7djdZQAW5/M0csvkRq5HHXBwlwGdJnT74jfJk+RYeIA==
X-Received: by 2002:a05:6e02:3bc7:b0:3e5:4631:54a5 with SMTP id e9e14a558f8ab-3e5709835e8mr60618705ab.18.1755173745691;
        Thu, 14 Aug 2025 05:15:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e55b077b34sm27683845ab.51.2025.08.14.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 05:15:45 -0700 (PDT)
Message-ID: <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
Date: Thu, 14 Aug 2025 07:15:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] phy: spacemit: introduce PCIe/combo PHY
To: Inochi Amaoto <inochiama@gmail.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 tglx@linutronix.de, johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
 namcao@linutronix.de, mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-5-elder@riscstar.com>
 <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_051546_811969_C47C23A4 
X-CRM114-Status: GOOD (  21.33  )
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

On 8/13/25 6:42 PM, Inochi Amaoto wrote:
> On Wed, Aug 13, 2025 at 01:46:58PM -0500, Alex Elder wrote:
>> Introduce a driver that supports three PHYs found on the SpacemiT
>> K1 SoC.  The first PHY is a combo PHY that can be configured for
>> use for either USB 3 or PCIe.  The other two PHYs support PCIe
>> only.
>>
>> All three PHYs must be programmed with an 8 bit receiver termination
>> value, which must be determined dynamically; only the combo PHY is
>> able to determine this value.  The combo PHY performs a special
>> calibration step at probe time to discover this, and that value is
>> used to program each PHY that operates in PCIe mode.  The combo
>> PHY must therefore be probed--first--if either of the PCIe-only
>> PHYs will be used.
>>
>> During normal operation, the USB or PCIe driver using the PHY must
>> ensure clocks and resets are set up properly.  However clocks are
>> enabled and resets are de-asserted temporarily by this driver to
>> perform the calibration step on the combo PHY.
>>
>> Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/phy/Kconfig                |  11 +
>>   drivers/phy/Makefile               |   1 +
>>   drivers/phy/phy-spacemit-k1-pcie.c | 639 +++++++++++++++++++++++++++++
>>   3 files changed, 651 insertions(+)
>>   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c

. . .

>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index c670a8dac4680..20f0078e543c7 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile

. . .

>> +static int k1_pcie_pll_lock(struct k1_pcie_phy *k1_phy, bool pcie)
>> +{
>> +	u32 val = pcie ? CFG_FORCE_RCV_RETRY : 0;
>> +	void __iomem *virt;
>> +
>> +	writel(val, k1_phy->regs + PCIE_RC_DONE_STATUS);
>> +
>> +	/*
>> +	 * Wait for indication the PHY PLL is locked.  Lanes for ports
>> +	 * B and C share a PLL, so it's enough to sample just lane 0.
>> +	 */
>> +	virt = k1_phy->regs + PCIE_PU_ADDR_CLK_CFG;	/* Lane 0 */
>> +
>> +	return readl_poll_timeout(virt, val, val & PLL_READY,
>> +				  POLL_DELAY, PLL_TIMEOUT);
>> +}
>> +
> 
> Can we use standard clk_ops and clk_mux to normalize this process?

I understand you're suggesting that we represent this as a clock.

Can you be more specific about how you suggest I do that?

For example, are you suggesting I create a separate clock driver
for this one PLL (in each PCIe register space)?

Or do you mean use clock structures and callbacks within this
driver to represent this?

I'm just not sure what you have in mind, and the two options I
mention seem a lot more complicated than this one function.

Thanks.

					-Alex

> Regards,
> Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
