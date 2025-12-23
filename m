Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1084E6F078
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+fDZ36fMdoxz47h9TgY46CBtszKXkh6FJv2EWkbQGg=; b=qXe/M1jmEP730N
	zm9PSN8POdfEw6W5IA6dmddiOaTpC1f2MmS7ij/VAFsWpuGPddj3/QE4774oaRnTIAV4/JTO9B+0n
	kSUTpniD3vjTfQD/UOpZOPO5ACWdMHMq0NelIsjkEzFPioT/FJ760Ia6GjcXYq1eMmLJtW2swJQZd
	mJ6Ff6QjLUdC599HST7Ti37/WLEwpbB5ElgB72PF7WH8GroeLVOorVXpV5EMJnGEAIAap12peA8Kv
	eBUM5hXtYf0fmCAvUf+S3LSB1QinOyXHkDCYq986sIO13i+tlfWN75ufCzIqRRcUNLpjPUREK5laE
	tyl9pUV2PqLlyuP9cQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyvz-0000000EmsG-3g6A;
	Tue, 23 Dec 2025 09:44:03 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyvw-0000000EmoM-23ZK
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766482965;
	bh=DqqDZK3BOFl79wvOzXLQwpubF3qPPTt9v8EL8XFacZA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Bb7EcXqQR1YhKxJJcqm+BGt02uKWp8vUfz+G55ajcW+G5d9/sinBPrM9zduKURA3t
	 qF1yyq+7Nxydwdb3LhvUOqmK7lPlUgOox93DO9cs3Uk3WxOGfx+ZY64GmaZcZxsoQi
	 RmVMwTwhHjS/arjA0AWEIm2hqVWtOXnCpMqc9Z60=
X-QQ-mid: zesmtpgz1t1766482956t78cb9070
X-QQ-Originating-IP: eCG2RGZVrV1DfjhD41RKfyJHVCITcq4ibzzDloWNSV0=
Received: from = ( [183.48.247.204])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:42:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16986777472253226495
EX-QQ-RecipientCnt: 15
Date: Tue, 23 Dec 2025 17:42:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <4D38DBB2D5EA96CC+aUpkCTp00KxEuU_Z@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251223093228-GYA1986709@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223093228-GYA1986709@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OINgIbTx4uvyFCQGksrM4IsCuLYHchiKd4s23OwRhcGVwzUd0px8WPZD
	DV8FgOFMgFtM3P7iXYpKJaYA6FZ/g0jXqM57HSr74XbqSs5Mk6IfKWrcYrkXNbQq8kJVn9Y
	hTgjpp4iRCEeynEOvP9iYWhSP++AZ/2Izy4VccA3WTk+O1tqSW8wiru2cYhrwSKNv4ap76b
	aK8zfpFV88JAK75LhMkm+WuKWqj76uFbNk7xP5HjBfkzfOsGhDoS5ikbDCJPhRx+RE4QW11
	mHsazcX5OgiwVqmJc4dO3eoXVDdMRSX5zA96CAgnODQoKg8d/E7mn+jKXkGjmPFgzF8aMH/
	1nbokR+JZsQT7VkxBShPBo2WAP7sUSE4SWSxREIp9KI+UxRVr/+B7rj6Chio2nZfNLudhhp
	RFch9vstm4gaDe0+0+OCi13u0FiJEKxYxrig/4uuqW7igDJxVK1u0YsRtpTtririgeGOUee
	oeXD4M8mWdLAaJP4LoxjPZNAajl1lJGYuptd7I6Hh7IAfm+5hGcATPshNwRjT7RS5rr0j/I
	wvi4ievAsiSiQK6Iqeih//krY0uAvjLs+M1NlZhq+NcTD7vEtJXV8qpqIHmonltmULr3CiW
	tisUseD1uVrktCBytcNnq5u4FfMFnfijQzWPBPM7q7kKn24wr9GVTmci3xVKGZ0lMFAwnbW
	gq5WqyIAMD75ZH/6jYFLRw0iehoRHEf3Yn056vPFaV/r4IRD3deBNl/0kDpWSgwtblNZpHZ
	mXm3iu7Uf4VVsPYgWoiLqfqC+xF+erNuqp8dSPYLJlfsq++3uHLo0WU6B8mr1txxJwVbbMA
	gBNM6B95LkmzgYhYizCe7Dl7KufzZVw7AC1RPuvyFFpiKGQr//9QGWqgoWJOiuvZeQert76
	yRMom7d3UHjchb7hnCOZk9FHMFojL8uockdeIAu/K6U++0VM/yybJVh/4bTVmmeaLhiFU82
	Ux2nAqZ+3kWger7g41pnW9vtQ4m/GoPtQ/DA6vx7RF/OHh9pqafPSTgfm9RngIEF3Cz9ulY
	iEkqsc+Q0gH5XE42p5yjx5O4hpFRo73gRHtllqn5nxg1VJC93Mvq7bxtgPel+vRdgjIREwv
	EWhOJ9C0JS+d4Myaoy6ZlLkOlhSi/0Z1ZKxZHM4fFX2M4B/bzzylRYmyMPisdb0/kqTIoQu
	RgeikJ1sGeIgRHk0Pm1n+j2hDlT7XBd87/kb
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_014401_077483_1A75221A 
X-CRM114-Status: GOOD (  28.35  )
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

On Tue, Dec 23, 2025 at 05:32:28PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 17:11 Tue 23 Dec     , Troy Mitchell wrote:
> > IO domain power control registers are used to configure the operating
> > voltage of dual-voltage GPIO banks. By default, these registers are
> > configured for 3.3V operation. As a result, even when a GPIO bank is
> > externally supplied with 1.8V, the internal logic continues to
> > operate in the 3.3V domain, which may lead to functional failures.
> > 
> > This patch adds support for programming the IO domain power control
> > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > for 1.8V operation when required.
> > 
> > Care must be taken when configuring these registers. If a GPIO bank is
> > externally supplied with 3.3V while the corresponding IO power domain
> > is configured for 1.8V, external current injection (back-powering)
> > may occur, potentially causing damage to the GPIO pin.
> > 
> > Due to these hardware constraints and safety considerations, the IO
> > domain power control registers are implemented as secure registers.
> > Access to these registers requires unlocking via the AIB Secure Access
> > Register (ASAR) in the APBC block before a single read or write
> > operation can be performed.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 131 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> dtsi should go as separated patch, then route to SoC tree
OH I forgot that. Thanks.
> 
> > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> >  
> >  		pinctrl: pinctrl@d401e000 {
> >  			compatible = "spacemit,k1-pinctrl";
> > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > +			      <0x0 0xd401e800 0x0 0x34>;
> >  			clocks = <&syscon_apbc CLK_AIB>,
> >  				 <&syscon_apbc CLK_AIB_BUS>;
> >  			clock-names = "func", "bus";
> > +			spacemit,apbc = <&syscon_apbc 0x50>;
> >  		};
> >  static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  {
> > +	struct device_node *np = pdev->dev.of_node;
> >  	struct device *dev = &pdev->dev;
> >  	struct spacemit_pinctrl *pctrl;
> >  	struct clk *func_clk, *bus_clk;
> > @@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pctrl->regs))
> >  		return PTR_ERR(pctrl->regs);
> >  
> > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(pctrl->io_pd_reg))
> > +		return PTR_ERR(pctrl->io_pd_reg);
> > +
> > +	pctrl->regmap_apbc =
> > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > +						     &pctrl->regmap_apbc_offset);
> Can you simply use syscon_regmap_lookup_by_phandle(), then define 
> #define APBC_ASFAR		0x50
> #define APBC_ASSAR		0x54
I think it just a minor issue. I will keep it.
But if anyone else thinks the same way as Yixun, please let me know.

                      - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
