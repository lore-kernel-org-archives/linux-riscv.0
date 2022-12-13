Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F411C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 02:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kDBI9W2xMf7rRnkLbWfFilrtn4PYKTW+WoH04OmKJQ=; b=A6KyTUBFi2RWvM
	i++uNOxlcbQRHImCAtQLBORhmy+EJR+PaV8l0VE4fbECKYsNJxyz3Q0+rsh6M//USWvGdRrXhFSpg
	JXEeCwgvQSy+u2T0n00EJWL/wHa3rh7sqer1pol69oARI8minz4cXBfjNZnlSElaSUIvuSkHQWbFY
	MgEnACW56/NaoznQnWy5c/hrqHWwT/fHuREdROGF9H0jbd5dNh4XK5abwDLRt9uIIp3hjRm8rRsni
	FA1PFGiJgopWawjx23GkkMY3XXOvgKbvu8PyODnbNiuwm+ylmrzgiwwMNZ6RvMHDCYYJHduLio169
	GvMk11uFy9/U7UU0kgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uyb-009eTU-O1; Tue, 13 Dec 2022 02:25:01 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uyY-009eRn-Gr
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 02:25:00 +0000
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 9E6AA2020F;
	Tue, 13 Dec 2022 10:24:43 +0800 (CST)
Message-ID: <faea4932-add6-fc51-836d-b113e8c9a194@rock-chips.com>
Date: Tue, 13 Dec 2022 10:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Cc: shawn.lin@rock-chips.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
Content-Language: en-GB
To: William Qiu <william.qiu@starfivetech.com>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20221207131731.1291517-3-william.qiu@starfivetech.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTENCVh5DHUgdTRlCHUMdQ1UTARMWGhIXJB
	QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46Shw*Vj0vAk4OGTgeIiw5
	LUsaCzRVSlVKTUxLQ0JDSUNPSElIVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlCQ0g3Bg++
X-HM-Tid: 0a85094c758b2eb6kusn9e6aa2020f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_182458_744574_83DD6E21 
X-CRM114-Status: GOOD (  10.76  )
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

Hi

On 2022/12/7 21:17, William Qiu wrote:
> Add sdio/emmc driver support for StarFive JH7110 soc.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>   MAINTAINERS                        |   6 +
>   drivers/mmc/host/Kconfig           |  10 ++
>   drivers/mmc/host/Makefile          |   1 +
>   drivers/mmc/host/dw_mmc-starfive.c | 197 +++++++++++++++++++++++++++++
>   4 files changed, 214 insertions(+)
>   create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> 

...

> +
> +static unsigned long dw_mci_starfive_caps[] = {
> +	MMC_CAP_CMD23,
> +	MMC_CAP_CMD23,
> +	MMC_CAP_CMD23
> +};
> +

....

> +	host->priv = priv;
> +
> +	return 0;
> +}
> +
> +static const struct dw_mci_drv_data starfive_data = {
> +	.caps = dw_mci_starfive_caps,
> +	.num_caps = ARRAY_SIZE(dw_mci_starfive_caps),

use ".common_caps = MMC_CAP_CMD23" instead.

> +	.set_ios = dw_mci_starfive_set_ios,
> +	.parse_dt = dw_mci_starfive_parse_dt,
> +	.execute_tuning = dw_mci_starfive_execute_tuning,
> +};
> +
> +static const struct of_device_id dw_mci_starfive_match[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
