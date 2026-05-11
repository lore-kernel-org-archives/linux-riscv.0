Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7EDCD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/UQo1jylQSY9rcB/F0YgsEhAEu7ISrrhsHsqnhD9MU=; b=fDe4kcbFJLVAQG
	iR0OKykDnaKyXOeA0cy9cZL7p2jxDZkkFt2DhnKaN8HSEyJFujKsCh6A3Nv1e8A6KjKdqhGRijTR0
	EUezgCVEZOKwYGQP5k+QZlLgLbUpq+Nj5DU0rGMcCs7fyNyjQu09r5bpaLBRnGq6jM4Y1PjPUMwzj
	2tC1A0TzHENZlt4SH9C0ca/W5FcIyPXtAF8ZNpU5cKeYi92Qh3nSJTqHp4JbNjaGghc5TCg6V6j7f
	e9JNV/ra/sqogfkXO6df/3M9KbkiIJyhsuZ3rkJjvWxYg87MluaxfDxVEXdmCfPlUceaLAcJA8NrO
	mfhuXEAXuDY0cUlMLb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJtf-0000000CSd3-0RtK;
	Mon, 11 May 2026 06:13:43 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJtb-0000000CScN-0as0
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=7GzYADyAvoPjA/SmP0gQ9bvXyEvY4ldv6
	QUkQ5iFUhg=; b=LgCeoHJvMlnsbhfWWwoSARFsnStQT+lgiyHzJ31gTTjq1Zmni
	ixo6m94NHE18Z7ul6CfIZ88O41CAKaSguiAseCthCy4ox20BebfDbAIY6qbZSDP7
	jqEKt/hUuUkZ0tS7Bjx8X2HM9RHOHDY002BRYDtSz9tDZjiZCJzdTS9www=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOFcwFqKf4DAA--.3544S2;
	Mon, 11 May 2026 14:13:25 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root
 Complex driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260427-ultrarisc-pcie-v4-3-98935f6cdfb5@ultrarisc.com>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
 <20260427-ultrarisc-pcie-v4-3-98935f6cdfb5@ultrarisc.com>
Date: Mon, 11 May 2026 14:12:43 +0800
Message-Id: <177847996346.3934882.9098618466749392519.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778479963; l=9852;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=GfcBItbzyybH1YaNl19S68Nh/5j3PYRsyCScPTxaEu4=;
 b=BhT8z1r5jP9SJbdRpme/+NSFgxpNJCZlt5ckjzIzClCP8LMJ39I5TaSuqQj/vEyQq2MHAxPKm
 0jWTmfVWkpjAl2eY1nQcHgo8gt7eBX1nfrU+wzuh091j5uwBjQN2QaF
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkOFcwFqKf4DAA--.3544S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFWUurWDCFy5Jr4xGry8Krg_yoWDJry5pa
	y5GFWSyFWUJF45Ww4ay3Z8AF1aq3ZxCrWUWanFgw1293ZxZryUWFyvg34YyFn7GF4qgrWY
	kw1Ykay7GanIgwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQATEWn6usEAHQAfsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_231340_011293_63AA62FA 
X-CRM114-Status: GOOD (  30.72  )
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

On 2026-04-27 09:32 +0800, Jia Wang wrote:
> From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> 
> Add DP1000 SoC PCIe Root Complex driver.
> 
> The controller only supports 32-bit aligned configuration space accesses.
> 
> Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS                                  |   1 +
>  drivers/pci/controller/dwc/Kconfig           |  12 ++
>  drivers/pci/controller/dwc/Makefile          |   1 +
>  drivers/pci/controller/dwc/pcie-designware.h |  22 ++++
>  drivers/pci/controller/dwc/pcie-ultrarisc.c  | 175 +++++++++++++++++++++++++++
>  5 files changed, 211 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 818685933541..16203b804c16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20589,6 +20589,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> +F:	drivers/pci/controller/dwc/pcie-ultrarisc.c
>  
>  PCIE ENDPOINT DRIVER FOR QUALCOMM
>  M:	Manivannan Sadhasivam <mani@kernel.org>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d0aa031397fa..06f7d98259cd 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -548,4 +548,16 @@ config PCIE_VISCONTI_HOST
>  	  Say Y here if you want PCIe controller support on Toshiba Visconti SoC.
>  	  This driver supports TMPV7708 SoC.
>  
> +config PCIE_ULTRARISC
> +	tristate "UltraRISC PCIe host controller"
> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	select PCI_MSI
> +	default y if ARCH_ULTRARISC
> +	help
> +	  Enables support for the PCIe controller in the UltraRISC SoC.
> +	  This driver supports UR-DP1000 SoC.
> +	  By default, this symbol is enabled when ARCH_ULTRARISC is active,
> +	  requiring no further configuration on that platform.
> +
>  endmenu
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index 67ba59c02038..884c46b78e01 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
>  obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
>  obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
>  obj-$(CONFIG_PCIE_STM32_EP) += pcie-stm32-ep.o
> +obj-$(CONFIG_PCIE_ULTRARISC) += pcie-ultrarisc.o
>  
>  # The following drivers are for devices that use the generic ACPI
>  # pci_root.c driver but don't support standard ECAM config access.
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ae6389dd9caa..88dcb0e7943a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -69,6 +69,8 @@
>  
>  /* Synopsys-specific PCIe configuration registers */
>  #define PCIE_PORT_FORCE			0x708
> +/* Bit[7:0] LINK_NUM: Link Number. Not used for endpoint */
> +#define PORT_LINK_NUM_MASK		GENMASK(7, 0)
>  #define PORT_FORCE_DO_DESKEW_FOR_SRIS	BIT(23)
>  
>  #define PCIE_PORT_AFR			0x70C
> @@ -96,6 +98,26 @@
>  #define PCIE_PORT_LANE_SKEW		0x714
>  #define PORT_LANE_SKEW_INSERT_MASK	GENMASK(23, 0)
>  
> +/*
> + * PCIE_TIMER_CTRL_MAX_FUNC_NUM: Timer Control and Max Function Number
> + * Register.
> + * This register holds the ack frequency, latency, replay, fast link
> + * scaling timers, and max function number values.
> + * Bit[30:29] FAST_LINK_SCALING_FACTOR: Fast Link Timer Scaling Factor.
> + *   0x0 (SF_1024):Scaling Factor is 1024 (1ms is 1us).
> + *     When the LTSSM is in Config or L12 Entry State, 1ms
> + *     timer is 2us, 2ms timer is 4us and 3ms timer is 6us.
> + *   0x1 (SF_256): Scaling Factor is 256 (1ms is 4us)
> + *   0x2 (SF_64): Scaling Factor is 64 (1ms is 16us)
> + *   0x3 (SF_16): Scaling Factor is 16 (1ms is 64us)
> + */
> +#define PCIE_TIMER_CTRL_MAX_FUNC_NUM	0x718
> +#define PORT_FLT_SF_MASK	GENMASK(30, 29)
> +#define PORT_FLT_SF_VAL_1024	0x0
> +#define PORT_FLT_SF_VAL_256	0x1
> +#define PORT_FLT_SF_VAL_64	0x2
> +#define PORT_FLT_SF_VAL_16	0x3
> +
>  #define PCIE_PORT_DEBUG0		0x728
>  #define PORT_LOGIC_LTSSM_STATE_MASK	0x3f
>  #define PORT_LOGIC_LTSSM_STATE_L0	0x11
> diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
> new file mode 100644
> index 000000000000..7326bd446590
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DWC PCIe RC driver for UltraRISC SoCs
> + *
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/resource.h>
> +
> +#include "pcie-designware.h"
> +
> +#define PCIE_CUS_CORE          0x400000
> +
> +#define LTSSM_ENABLE           BIT(7)
> +#define FAST_LINK_MODE         BIT(12)
> +#define HOLD_PHY_RST           BIT(14)
> +#define L1SUB_DISABLE          BIT(15)
> +
> +#define ULTRARISC_PCIE_COMP_TIMEOUT_65_210MS	0x6
> +
> +static struct pci_ops ultrarisc_pci_ops = {
> +	.map_bus = dw_pcie_own_conf_map_bus,
> +	.read = pci_generic_config_read32,
> +	.write = pci_generic_config_write32,
> +};
> +
> +static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct pci_host_bridge *bridge = pp->bridge;
> +	u8 cap_exp;
> +	u32 val;
> +
> +	bridge->ops = &ultrarisc_pci_ops;
> +
> +	if (dw_pcie_link_up(pci))
> +		return 0;
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_CUS_CORE);
> +	val &= ~FAST_LINK_MODE;
> +	dw_pcie_writel_dbi(pci, PCIE_CUS_CORE, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM);
> +	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
> +	dw_pcie_writel_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM, val);
> +
> +	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
> +	FIELD_MODIFY(PCI_EXP_LNKCTL2_TLS, &val, PCI_EXP_LNKCTL2_TLS_16_0GT);
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> +	FIELD_MODIFY(PORT_LINK_NUM_MASK, &val, 0);
> +	dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> +
> +	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_DEVCTL2);
> +	FIELD_MODIFY(PCI_EXP_DEVCTL2_COMP_TIMEOUT, &val,
> +		     ULTRARISC_PCIE_COMP_TIMEOUT_65_210MS);
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_DEVCTL2, val);
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_CUS_CORE);
> +	val &= ~(HOLD_PHY_RST | L1SUB_DISABLE);
> +	dw_pcie_writel_dbi(pci, PCIE_CUS_CORE, val);
> +
> +	return 0;
> +}
> +
> +static void ultrarisc_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> +{
> +	/*
> +	 * DP1000 does not support sending PME_Turn_Off from the RC.
> +	 * Keep this callback empty to skip the generic MSG TLP path.
> +	 */
> +}
> +
> +static const struct dw_pcie_host_ops ultrarisc_pcie_host_ops = {
> +	.init = ultrarisc_pcie_host_init,
> +	.pme_turn_off = ultrarisc_pcie_pme_turn_off,
> +};
> +
> +static int ultrarisc_pcie_start_link(struct dw_pcie *pci)
> +{
> +	u32 val;
> +
> +	val = dw_pcie_readl_dbi(pci, PCIE_CUS_CORE);
> +	val |= LTSSM_ENABLE;
> +	dw_pcie_writel_dbi(pci, PCIE_CUS_CORE, val);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = ultrarisc_pcie_start_link,
> +};
> +
> +static int ultrarisc_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_pcie_rp *pp;
> +	struct dw_pcie *pci;
> +	int ret;
> +
> +	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
> +	if (!pci)
> +		return -ENOMEM;
> +
> +	pci->dev = dev;
> +	pci->ops = &dw_pcie_ops;
> +
> +	/* Set a default value suitable for at most 16 in and 16 out windows */
> +	pci->atu_size = SZ_8K;
> +
> +	pp = &pci->pp;
> +
> +	platform_set_drvdata(pdev, pci);
> +
> +	pp->num_vectors = MAX_MSI_IRQS;
> +	/* No L2/L3 Ready indication is available on this platform. */
> +	pp->skip_l23_ready = true;
> +	pp->ops = &ultrarisc_pcie_host_ops;
> +
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct dw_pcie *pci = dev_get_drvdata(dev);
> +
> +	return dw_pcie_suspend_noirq(pci);
> +}
> +
> +static int ultrarisc_pcie_resume_noirq(struct device *dev)
> +{
> +	struct dw_pcie *pci = dev_get_drvdata(dev);
> +
> +	return dw_pcie_resume_noirq(pci);
> +}
> +
> +static const struct dev_pm_ops ultrarisc_pcie_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(ultrarisc_pcie_suspend_noirq,
> +				  ultrarisc_pcie_resume_noirq)
> +};
> +
> +static const struct of_device_id ultrarisc_pcie_of_match[] = {
> +	{
> +		.compatible = "ultrarisc,dp1000-pcie",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ultrarisc_pcie_of_match);
> +
> +static struct platform_driver ultrarisc_pcie_driver = {
> +	.driver = {
> +		.name	= "ultrarisc-pcie",
> +		.of_match_table = ultrarisc_pcie_of_match,
> +		.suppress_bind_attrs = true,
> +		.pm = &ultrarisc_pcie_pm_ops,
> +	},
> +	.probe = ultrarisc_pcie_probe,
> +};
> +module_platform_driver(ultrarisc_pcie_driver);
> +
> +MODULE_DESCRIPTION("UltraRISC DP1000 DWC PCIe host controller");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
>

Gentle ping.

Best Regards,
Jia Wang 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
