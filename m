Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22645CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 00:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rSxLLwKzPQBLoAkL1XQUSt/G6Vo/2gz9El49xDghw0=; b=A9UfcDSbs0SCtI
	kjIbYcco6oDfP0SAH+IQiKX8JjFG0V+k6GJap2qTWmlUuV7ZCf9AtuQRZ0bpVwOyxtuEwPhhf7odT
	d9u2RmFD/wvWA9rlyG5VRe2uYnsKmesWU3QK303t6f2KFS35uNaOvLfgfyLoC4DcmJfaIEoKH9Jvk
	Wiqxc4zBPmA6/0E+moXkXeD4FjJqbchC7x5aHjXbvSoK2SFPstU+IVJbEga4PWVa6esTyBriKqDhA
	4tcmRe9CrRTubs3zmny/TSRZFoV0VJJxfI2oW0emkrKEB0gj/bzobfuJS7GEu5AOhKwAg9n6sUbhj
	WXnsYoRpNoJI4EaN11aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhzR-00000000qZ1-3b3S;
	Fri, 15 Aug 2025 00:08:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgmZ-00000000ixF-0w1l;
	Thu, 14 Aug 2025 22:50:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-323267adb81so1949080a91.1;
        Thu, 14 Aug 2025 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755211850; x=1755816650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVawUElbuEdpT/L0IVDdSj9wdhwbVEtke7BFQtXU6aA=;
        b=UkYJAmtGMB4LSXdLWxuuPEOs64eceUG8Kpf+vuKl4UhIkSKBFsGLtabObkPrRPqsm8
         wfcxptrMlZt7DObXCuLXs/95nNDWvmbTZLdNXLUigvv6TA9pnhhs6lfgv+3bY1TrzpkL
         f3/TpDqrYYD+qjeQOnJfryvyfZQVIu+F8PZaQ+hsoN5enzOr675CHc3vRZbq/26znIGI
         vPFFuGK9lmvwqAmahiHBC4+OIaL5+ZpRQbEBQZOqjIoS6RpceDK5mETbZA4WB2NmOB/s
         dBmtHB7QSOLC15wfBa3oWB0Q+48LLOSJAUxhkqu0OXF3E0se4LSQb4SzupuXwPomPuNv
         BC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755211850; x=1755816650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVawUElbuEdpT/L0IVDdSj9wdhwbVEtke7BFQtXU6aA=;
        b=XVecoCqn48uNXHzWgn08xyJiRmZQArccmk2ba6vNspD7LlbbmiPdtmhACEY5NQvrVc
         1RKCXrkrA8IdK3Krx03eRT/XbiC7IMCWkjo/42uwWXJntJvTQ4xu8eICl+qDvG58P3uv
         XSgOQ0T0nJCjvY6moXSOzB8fggdvUNsIcspH9qSA0GVHykVevmuP8/NbTvdfoB+pMffY
         30n4yx/tNyMIjQnz9bFDwazB3OXK0LyFXUhkcl6CsqB1msiuTxjIlgx38kFigCAVRVDx
         DqRxVAxxniFHlEVczSPPJcrqvJRo/PhPIis9KrXuxvynZjj1SOtIyuNnFMHrvC0poewt
         oneg==
X-Forwarded-Encrypted: i=1; AJvYcCUWyCeFOklXMTVGL8/4qLQABBZQwOVUlXAUIyKIl46QmaqJTtGHsll3o75lj9+I6lJLCexHQmITVJsfdO8=@lists.infradead.org, AJvYcCUeIcDagkXlCbOMTb9xSK2/3ORerH1aCOvlbVyhCzV0tUwsT629qLSkDFNekW5LqWluDBafTr94k+I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvyfv56KEipcpUtssQA0czC8Mfh/sZaKRolSaGf8Dk/d2l3ByT
	IAOP9lO/9HjdbFnq53eUAL2oFvox3TbzG5pfuG+83rC74bRVsUK3MATx
X-Gm-Gg: ASbGncth4gqi7CmOQlhnGI/YzWG0aI7xamD7q4kL6Se/Q4gjTn7Va/EmEPEbBW/KQsP
	FJpZyGOYYUBpBCQ0NIqhSQ/fM2KoD2dHcs9ETKmfMGeL+cdM69jGHMt+bqrpRwCDwLEDODTWj+8
	F9IN5Ok4YOyzFNJMiOX85WyzaZBI19NSiRxxbBe99WNba6FBIlYBEXORIPCyeCrPOMCeY9yQuzr
	+6og05aTzj60EIR+XjPeaVwH5OjIfCc/mqpUKwjsRt3jTzheUHb3FA2mtG7uA3SgUnrWMhZWY9P
	7O3LPrrKCeNEumHHgLall+lc8nXpVKFAtHGMG2HVxdI9lvleyhLJYHJHK1WbM7ie8lzHlzyuyqz
	VSCaE27uISfUUJCRy2WqZbp7vOta1Zeto
X-Google-Smtp-Source: AGHT+IEJqNeT1yM7BjiHaonVA76lx9wIv7oauipmGKTTR2d3Fa2Yg6FGWlZUCw2T0pv6BwK2DA17bw==
X-Received: by 2002:a17:90b:1810:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-32327a4f242mr8445796a91.18.1755211850284;
        Thu, 14 Aug 2025 15:50:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b471519d8bcsm2721398a12.61.2025.08.14.15.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:50:50 -0700 (PDT)
Date: Fri, 15 Aug 2025 06:49:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de, 
	johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de, 
	mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	fan.ni@samsung.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH 4/6] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <mj5e6afmbqo2tpt3zjuebcfif3flvgqq663erv3xuvbg72nd6g@bapy44nobzyw>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-5-elder@riscstar.com>
 <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
 <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_155051_261509_BE5E4D05 
X-CRM114-Status: GOOD (  37.29  )
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

On Thu, Aug 14, 2025 at 07:15:43AM -0500, Alex Elder wrote:
> On 8/13/25 6:42 PM, Inochi Amaoto wrote:
> > On Wed, Aug 13, 2025 at 01:46:58PM -0500, Alex Elder wrote:
> > > Introduce a driver that supports three PHYs found on the SpacemiT
> > > K1 SoC.  The first PHY is a combo PHY that can be configured for
> > > use for either USB 3 or PCIe.  The other two PHYs support PCIe
> > > only.
> > > 
> > > All three PHYs must be programmed with an 8 bit receiver termination
> > > value, which must be determined dynamically; only the combo PHY is
> > > able to determine this value.  The combo PHY performs a special
> > > calibration step at probe time to discover this, and that value is
> > > used to program each PHY that operates in PCIe mode.  The combo
> > > PHY must therefore be probed--first--if either of the PCIe-only
> > > PHYs will be used.
> > > 
> > > During normal operation, the USB or PCIe driver using the PHY must
> > > ensure clocks and resets are set up properly.  However clocks are
> > > enabled and resets are de-asserted temporarily by this driver to
> > > perform the calibration step on the combo PHY.
> > > 
> > > Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/phy/Kconfig                |  11 +
> > >   drivers/phy/Makefile               |   1 +
> > >   drivers/phy/phy-spacemit-k1-pcie.c | 639 +++++++++++++++++++++++++++++
> > >   3 files changed, 651 insertions(+)
> > >   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c
> 
> . . .
> 
> > > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > > index c670a8dac4680..20f0078e543c7 100644
> > > --- a/drivers/phy/Makefile
> > > +++ b/drivers/phy/Makefile
> 
> . . .
> 
> > > +static int k1_pcie_pll_lock(struct k1_pcie_phy *k1_phy, bool pcie)
> > > +{
> > > +	u32 val = pcie ? CFG_FORCE_RCV_RETRY : 0;
> > > +	void __iomem *virt;
> > > +
> > > +	writel(val, k1_phy->regs + PCIE_RC_DONE_STATUS);
> > > +
> > > +	/*
> > > +	 * Wait for indication the PHY PLL is locked.  Lanes for ports
> > > +	 * B and C share a PLL, so it's enough to sample just lane 0.
> > > +	 */
> > > +	virt = k1_phy->regs + PCIE_PU_ADDR_CLK_CFG;	/* Lane 0 */
> > > +
> > > +	return readl_poll_timeout(virt, val, val & PLL_READY,
> > > +				  POLL_DELAY, PLL_TIMEOUT);
> > > +}
> > > +
> > 
> > Can we use standard clk_ops and clk_mux to normalize this process?
> 
> I understand you're suggesting that we represent this as a clock.
> 
> Can you be more specific about how you suggest I do that?
> 
> For example, are you suggesting I create a separate clock driver
> for this one PLL (in each PCIe register space)?
> 
> Or do you mean use clock structures and callbacks within this
> driver to represent this?
> 

I think using clock structures and registering them is just fine, 
there are many phy drivers already do this.

> I'm just not sure what you have in mind, and the two options I
> mention seem a lot more complicated than this one function.
> 

Yes, it is more complex than just adding one function, but it 
make the code clean and easy to understand as the clock looks
complex. Also, register this clock allow us to know the state
of internal clock by looking clk_summary.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
