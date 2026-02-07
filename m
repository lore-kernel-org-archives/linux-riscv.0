Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3CEE6B76
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpts2hALVEGjkZE4KTeBkWnpjB8Ko5SBj2XE68d2EnI=; b=H2lRXcm8KHLr20
	dsar7gHbVcZL1NTwto3V6Y+PwHCQjuqBYSnfoManBlnUhd6HIvDUQ9QfWL6DLpSg5EzmmovRrN2/l
	elQgn9cT+A1O251rBwN4hFiuOm9ki8vxuWCIl/puAr5tEScxOaUCmwOrvwpbRBwl4t+xcF7orqZjJ
	TOp8vsiY8PAlvtAqSH5bprPceM40HKQDm5hCRXrGYYJV4ILLy1T2JdrSounRHMLHCWvc2OSg9P70n
	ko9WmMDFXd4PqtGuNXYPZYzwy0UhWw7PbR7BTnpTbTniwvXkgZufDlOxhLUXclrk981grLUi4l4Bw
	wyXuoGozCJP3ze//WwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodwc-0000000CFZ8-1MAu;
	Sat, 07 Feb 2026 08:45:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodwY-0000000CFYl-1VQi
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 08:45:33 +0000
Received: from duge-virtual-machine (unknown [112.53.146.143])
	by APP-01 (Coremail) with SMTP id qwCowACnUm6b+4ZpnYJXBw--.38548S2;
	Sat, 07 Feb 2026 16:45:16 +0800 (CST)
Date: Sat, 7 Feb 2026 16:45:15 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, ulf.hansson@linaro.org,
	adrian.hunter@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 2/3] mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC
 controller support
Message-ID: <aYb7m+ioAmqXFhWX@duge-virtual-machine>
References: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204082908.27501-3-jiayu.riscv@isrc.iscas.ac.cn>
 <e06bd9ca-11bb-4d87-9db5-87139731f181@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e06bd9ca-11bb-4d87-9db5-87139731f181@kernel.org>
X-CM-TRANSID: qwCowACnUm6b+4ZpnYJXBw--.38548S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryDKw18Zr1UJF4UXr47Arb_yoW8uF1fpF
	ykJFW5tFy8JF1Sgw1ktF4kCa4ayw1DGF4aqw4ft34UKwnFyryxWF40gryY9as5AFW5CF4Y
	v3yjqr9rCanrGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [112.53.146.143]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_004530_801860_CAC33AF2 
X-CRM114-Status: GOOD (  14.58  )
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

On Fri, Feb 06, 2026 at 02:26:40PM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2026 09:29, Jiayu Du wrote:
> > +static int dwcmshc_k230_init(struct device *dev, struct sdhci_host *host,
> > +			     struct dwcmshc_priv *dwc_priv)
> > +{
> > +	static const char * const clk_ids[] = {"base", "timer", "ahb"};
> > +	struct device_node *usb_phy_node;
> > +	struct k230_priv *k230_priv;
> > +	u32 data;
> > +	int ret;
> > +
> > +	k230_priv = devm_kzalloc(dev, sizeof(struct k230_priv), GFP_KERNEL);
> > +	if (!k230_priv)
> > +		return -ENOMEM;
> > +	dwc_priv->priv = k230_priv;
> > +
> > +	usb_phy_node = of_find_compatible_node(NULL, NULL, "canaan,k230-usb-phy");
> 
> Hm? You should use phandles, not look for various nodes.

Only one usbphy node has the canaan, k230-usb-phy compatibility.
So in this situation, is it ok to continue using of_find_compatible_node?

> > +	if (!usb_phy_node) {
> 
> Please follow Linux coding style.

I will fix it in next version.

> > +		return dev_err_probe(dev, -ENODEV,
> > +				     "Failed to find k230-usb-phy node\n");
> > +	}
> > +
> > +	k230_priv->hi_sys_regmap = device_node_to_regmap(usb_phy_node);
> > +	of_node_put(usb_phy_node);
> > +	if (IS_ERR(k230_priv->hi_sys_regmap)) {
> > +		return dev_err_probe(dev, PTR_ERR(k230_priv->hi_sys_regmap),
> > +				     "Failed to get k230-usb-phy regmap\n");
> > +	}
> > +
> > +	ret = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> > +					    ARRAY_SIZE(clk_ids), clk_ids);
> > +	if (ret) {
> > +		return dev_err_probe(dev, ret,
> > +				     "Failed to get/enable k230 mmc other clocks\n");
> > +	}
> > +
> > +	if (of_device_is_compatible(dev->of_node, "canaan,k230-sdio")) {
> 
> Driver match data is for this.

What you mean is that I shouldn't use of_find_compatible_node, but I can
use device_get_match_data instead? Then I can continue to distinguish
between SDIO and eMMC to do parameter configuration

Or do you mean that I should put the parameters to be adjusted into the
pdata structure? But currently, the dwcmshc structure is not suitable for
containing vendor-specific properties.

Regards,
Jiayu Du
> 
> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
