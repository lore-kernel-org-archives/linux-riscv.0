Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7D3CAC5AE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 00:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fia9NisoIujdUkWbOnYNc31quB9tsLi1fqRnlmUiYzU=; b=0msXwd6TBbJYZX
	LbV0lzxFWRvwoabTNV+Q1pkmsDCAdQnG2r6EfWttDotwsRqKd1lSO/VwW57Jbz2olMaluzz8Em2XL
	tZAb5znftGASVoKdOVLZYPRmLUsw+Mbe9LP0AjxJvBpjSXzTAIgFpx/XnehRRkW0Vl2iJD8Z7ebSJ
	HA+2ikufJLcMa2wqyDkh/RvvYCCslKbDGcBHhYb1H+PqdHyDcxM/x5d5PLQ4YDsDZpmhqgzdJsUoG
	F8Pyh5vGOYIbN5KVoVm8PayPif3DfdpS7sbP5CDfRmdCQDo6aqheHkvw3/+QvzDeSS5/BE2mOx+Nq
	s5T1OWeX0EnYvpayoUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZpI-000000056Xh-1KAR;
	Thu, 25 Sep 2025 00:27:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZpH-000000056XX-01Ya
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 00:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E244601EB;
	Thu, 25 Sep 2025 00:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5326BC4CEE7;
	Thu, 25 Sep 2025 00:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758760029;
	bh=SCbE9/zMp7eylZtDStOIb2RUlKH9zJzpcDZgJG8aLCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BJwcg9bFpip0s5gqGKUUrRxODmLmubuYf+e39NgHOTqHatgAs3Axi/hHiOJ1cgR+U
	 TukKw2OBmRP2e4AlipJlkzhvkoy8s7zQjuWSqykxMLRMQly55uLdR/TNQWppIzrOkt
	 7laYo/gcAjrgWZBHLmLIa0z4bPcKOxprprqYy4bwXNNVagF4uy6YRqxAwF5rsYux4p
	 VfJB4KXrYkOF2XEtTrPY4ugIo9WLfHfzpzNEjvpJTdjOXeAGG7sPT7o4n4NnYilXiY
	 E3cYFayZuOeBV2Kb9s7dEpfhJHolXIIsc09jPVp9pXQ0YAgmM7OARc7JsrnCKE563k
	 Zo7mTdPWZAH5g==
Date: Wed, 24 Sep 2025 18:27:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
cc: Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <ukleinek@kernel.org>, 
    devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
    Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
    Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
    Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
    Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, 
    Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v10 07/24] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
In-Reply-To: <20250818040920.272664-8-apatel@ventanamicro.com>
Message-ID: <405a78ce-de03-382b-cab9-bb086e28505b@kernel.org>
References: <20250818040920.272664-1-apatel@ventanamicro.com> <20250818040920.272664-8-apatel@ventanamicro.com>
MIME-Version: 1.0
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

On Mon, 18 Aug 2025, Anup Patel wrote:

> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.
> ---
>  drivers/mailbox/Kconfig               |  11 +
>  drivers/mailbox/Makefile              |   2 +
>  drivers/mailbox/riscv-sbi-mpxy-mbox.c | 994 ++++++++++++++++++++++++++
>  3 files changed, 1007 insertions(+)
>  create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
> 
> diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> new file mode 100644
> index 000000000000..21404baa6df0
> --- /dev/null
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c

[ ... ]

> +
> +static int mpxy_mbox_populate_channels(struct mpxy_mbox *mbox)
> +{
> +	u32 i, *channel_ids __free(kfree) = NULL;
> +	struct mpxy_mbox_channel *mchan;
> +	int rc;
> +
> +	/* Find-out of number of channels */
> +	rc = mpxy_get_channel_count(&mbox->channel_count);
> +	if (rc)
> +		return dev_err_probe(mbox->dev, rc, "failed to get number of MPXY channels\n");
> +	if (!mbox->channel_count)
> +		return dev_err_probe(mbox->dev, -ENODEV, "no MPXY channels available\n");
> +
> +	/* Allocate and fetch all channel IDs */
> +	channel_ids = kcalloc(mbox->channel_count, sizeof(*channel_ids), GFP_KERNEL);

Should this be devm_kcalloc() ?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
