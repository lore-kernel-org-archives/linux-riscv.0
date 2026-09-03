Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA5AC624D6
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 03:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoH8t3AXUqEQPJTC49Cx9ydPiO7rkBCrUWmQZeFj1Qo=; b=KgooPcYdfOwAGS
	+0mg6+ueTBsUZ84i/e42VBdJOasg4YqIZUkq9LBLXlqzCdx2DeTYbsUH/1JaECJ8Duvdq/uPP6uyj
	z1QBBpzBYW45aMvEwbzc2KyQPJNR9zoszWTBCWNSkMT/UmLidASqxRgF+a5BxuIDNuBqhpcIn7/me
	lT+hRtiHGEO3DtQINV6Rc3nvE5en1/+IffMQczoXinzx/IKKzQJAwhILIOPBR9J8a9lUS6StBE4Dm
	xf2zrh9DcUwA1F1L0rbGndrgzlcX+l+UrSXrtTsebRw382+MWBwNrG1XSnGwYJvDDK4MZsdlCSiME
	GFcwECXbPw/3VKafXkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y7Q-0000000GHI7-0oB7;
	Thu, 03 Sep 2026 03:28:04 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y7N-0000000GHHF-0MSj
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 03:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788406039;
	bh=CU9yYjTzKY1VsHC9/0QdF7bv7zZl0qEhUjyz4zc3BfQ=;
	h=Date:Message-Id:Subject:From:To:Mime-Version;
	b=WyN8/eV2o7skOneHbj5eaxXVPwHt4viAiJXc0YrOTiDOroGkxyXR19s1iF8kdKsTK
	 T/WBRhZXeMns9+sRbTzTdPdgVOthFjBAW52vHt13VxG5e9MJuRIK+fbKgqvtiXxVGC
	 ydFSOArUnViplmp3KxQq7AZjNvJWlSOQ3AoK9Pac=
X-QQ-mid: zesmtpsz3t1788406037tf5a349cd
X-QQ-Originating-IP: 5N9PseJ/ksZBYF+OSvPGGOF2iNG6oUp2CyC6AZbzup8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 11:27:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18144085702036501475
EX-QQ-RecipientCnt: 13
Date: Thu, 03 Sep 2026 11:27:14 +0800
Message-Id: <DL5D12BKMIWN.QUCX18JF8GDU@linux.spacemit.com>
Subject: Re: [PATCH 4/4] mmc: sdhci-of-k1: Add TX tuning parameter
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Ulf Hansson" <ulfh@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Adrian Hunter"
 <adrian.hunter@intel.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Long Wan" <long.wan@linux.spacemit.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-4-4e7909cf4233@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-4-4e7909cf4233@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MoO5eirna1idr75/lUCkT7rarmRcy6YB1/ULFRzvZuYrkQ3Wsl40jQmd
	xJV+AB4qutJKNPSSrf3TPUwzz6xDchQXYaxvZNDXTqZ1wRZcijQxSNgxAtx1FCjbSGNzyt1
	tnCX3+kNAX1z6MpoN/4EXawF5m4vhjOgFHTMGBKTdeG6hH2VjlhnGeK86xIcsWI1/53rPDW
	BMQy8bNIP3dqJxW2QIXrEDsXezV+R7RS9RLFpgd8ffYSGQt9IgrakNDPqs05tikPxm9TeD6
	bQx+oR3YAljDLSmHJRRn942/+OMncvkYc7jPimNSatGLhHFOceyfCD3roDXiizniWTQhHWM
	ye9JQeIGGsUgwAQQCOzUrFesGzhBEskFhcZ9pzTkSRgFR3pCoLbQI1PXwvwhYccM+rnc/Sw
	yGNf8arZpjNilujm9jpdQnQl12jmO99r0sVFuyKJobmlnKR1C24hla/hbDUJeAy3NFD75Ga
	tl2k9STn7ZqYcQo7lh6v2lDy7R750jmpq7kU9ElxNol25kMEvoDEyfgCltWIfgpu1WoedUa
	DTeOTf6zSu78oLJSE6rVz+4rg+DEMluchHwrwDZyyDFcO/yADuVs5lYgg1GhYGkuX5rJmRU
	O7HGt71Q5u+S9CxCfLBRzH26NziYNzHVNNbVZmM86fkbIZthyqVQrIkP0VjKWQHKPOZuXgN
	+z/3CjQOd+yvp6JUo40fcdoWn2mOR2nN313Y8drCadKFh4vxCXbC0UNpNttktP/1rrhCMtz
	imbEBtlVh9e8xSyOzUGnxeNeaFsUQU2GnFKzw4hdKgcnDTGgp//3tW7bJNJJ1rDrhEb8r6Y
	oGEXg4Bd3ZeQKoB436KjXLqiHtMcvxnE2n+xsynHV62YX7IQ/9WEmX16bTnj56fIRhifN6d
	lz4GzkykeGKPUR/NKnq1OJ+pwHuJLYKPkJS3HRh6b/zKQ1N2cGALJVqSrJqfxVy7AL7i6hw
	Vu0gK39Gvc4Og1eb42Pp4UmaGxWS+wOY8QiY+o/AU6pf8Vc1cjmBQhiFQxpu1vo8LFvlKKQ
	4WqLXXcRwf9O7/PA8nZF9Z8wInYzfK0/7SGlbttWFAj1kYThkKADPA1HZmJbYaofAlC6arI
	uiEXREG6eKPqrN1Xqi/r0j0aU4mqub8qwN/SVJZP2p+FlpXOUC+rtYcXbuS5oAIhfYTv/D4
	L3EzsTea9VoJSerWB4oZtOiOoQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_202801_968107_8D1C2182 
X-CRM114-Status: GOOD (  18.94  )
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

On Wed Sep 2, 2026 at 3:03 PM +08, Yixun Lan wrote:
> From: Long Wan <long.wan@linux.spacemit.com>
>
> Instead of setting the TX delay code via hardcoded parameter, configuring
> it via device tree property, which make it able to adapt according to
> board specific tuning requirement.
>
> Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index e6ab40c9a555..6cab06332747 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -97,6 +97,7 @@ struct spacemit_sdhci_host {
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pinctrl_default;
>  	struct pinctrl_state *pinctrl_uhs;
> +	u8 tx_delaycode;
>  };
>  
>  /* All helper functions will update clr/set while preserve rest bits */
> @@ -263,6 +264,7 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
>  	int max_pass_len = 0, max_pass_start = 0;
>  	struct mmc_host *mmc = host->mmc;
>  	struct mmc_ios ios = mmc->ios;
> +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(sdhci_priv(host));
This is only a minor style suggestion, not a requirement. Would it be
clearer to make `sdhst` the first local declaration? That would make the
declaration block easier to scan.
>  	u8 final_delay;
>  	int ret = 0;
>  	int i;
> @@ -279,11 +281,11 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
>  
>  	if (mmc->caps2 & MMC_CAP2_NO_MMC) {
>  		spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
> -		spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
> +		spacemit_sdhci_set_tx_delay(host, sdhst->tx_delaycode);
>  		spacemit_sdhci_tx_tuning_prepare(host);
>  
>  		dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
> -			SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
> +			SPACEMIT_TX_TUNING_DLINE_REG, sdhst->tx_delaycode);
>  	}
>  
>  	spacemit_sdhci_prepare_tuning(host);
> @@ -496,6 +498,23 @@ static inline void spacemit_sdhci_get_pins(struct device *dev,
>  		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
>  }
>  
> +static void spacemit_sdhci_get_tuning_params(struct device *dev,
> +					     struct sdhci_pltfm_host *pltfm_host)
> +{
> +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
> +	u32 val;
> +
> +	sdhst->tx_delaycode = SPACEMIT_TX_TUNING_DELAYCODE;
> +
> +	/* Override from DT property */
> +	if (!device_property_read_u32(dev, "spacemit,tx-delay", &val)) {
> +		if (val <= U8_MAX)
> +			sdhst->tx_delaycode = val;
> +		else
> +			dev_warn(dev, "ignoring invalid tx delay: %u\n", val);
Should this warning also report the default delay code that will be used
instead?

                                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
