Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EDEE67A60
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbnX+3dnH99qocGFDQVfdqsVjigpkgU8sAKg4l6hUY0=; b=jBn3szkoD13oGw
	0BFBSqG6CkXHCf6J2swV+MhAhXeEzppTchkqoWWlu3Y+kWeFl1V8hBaYNJZhl+wTsVmKhW6kQqLmr
	FGP3BaUqRBLnu9CFDqF7IQVq4sMYpvBFVY+NduvsXyBhIlcYtBPT4DAQBReUvqkPM+RbHizO9vqkt
	hZaJqgDGHoM1B9cu8LrsdSIA2WfWTAfLF6l0wZ6nZFdNnzo8iHPZPNOUrfIOVtqCVaHKpdEPUyhrI
	1nBMXV5tSZrIgwUdMjpQpUBAmRj4pPcFK1trldf3XmbzVrfSuTDMG1GwRu5ykSeVOrbx6K9qUIIve
	qfWQggpjxeDatPo5gx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxH6o-0000000EURG-0eCc;
	Tue, 03 Mar 2026 04:11:46 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxH6l-0000000EUQr-3cyx
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 04:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772511082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nwd9ijqe9wv6K0c1fJjpp7BhOomKu43HENZ9U+A9NHlJQLFetbov2b9WEO6CM5rM6YD3r63aH8daaiHXRVxuolzadDSBBWFMCyIUdQB4l07TUxSKJ5iAmTBBeDHBUuAIC8n543oqABQcjz1nF3Vr+MbpNW7oblg/8SxHjk/ArIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772511082; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K+eU4GhIMfoBUPBn8WXtEEB/bAz12IYbwXDw+L/CKZ0=; 
	b=Pv8JAHYoaATi8tchKflcyt62D6M0I4CfPrhuXV6LCvZ3rjyQVkqrtW5PmJv7hZ7WaAfEHJwkOh0cgVZSvWaqtuK2uJYosiFMDT8vqH2xUMPE2vdqwc+iuZZ+pqXoM2NGAyFcLI0mgwJhgyoeygVHmNAm1LzamVLjpvCTHpZtUqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772511082;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=K+eU4GhIMfoBUPBn8WXtEEB/bAz12IYbwXDw+L/CKZ0=;
	b=IxM0//KWXKzn7VPRtt3fLDCmqrjs+oVOtA7heOxoAFjKb3ew4et/slXb0VPKG+Up
	ZTIP83KQnCKyzRA2e42uPfdE00GCUGts3lkunclkCdESsp6ZCgOLAtJksDREV6xxsWC
	nQm3KpwXHj80F70EznVrR6MdEAQvlq3F2DEc7F/k=
Received: by mx.zohomail.com with SMTPS id 1772511080557943.3150450884574;
	Mon, 2 Mar 2026 20:11:20 -0800 (PST)
Date: Tue, 3 Mar 2026 04:11:01 +0000
From: Yao Zi <me@ziyao.cc>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
Message-ID: <aaZfVZoCe3AxTzAf@pie>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_201144_038984_106A3891 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Mar 02, 2026 at 04:13:24PM +0100, Iker Pedrosa wrote:
> Add regulator framework support for voltage switching operations. This
> enables proper PMIC control for UHS voltage switching between 3.3V and
> 1.8V signaling levels.
> 
> - Add regulator supply parsing
> - Implement voltage switching callback
> - Enable mmc regulator framework integration
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

It seems PATCH 4 should be squashed into this one, or the functionality
of voltage switching isn't really complete.

> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index b703b78282ed8d89183c816477c149c0a565618a..c260cb89704ae7a25bec0f07831d495553405bbd 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c

...

> @@ -291,6 +297,12 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>  
>  	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
> +	ret = mmc_regulator_get_supply(host->mmc);
> +	if (ret)
> +		dev_warn(dev, "Failed to get regulators: %d\n", ret);
> +
> +	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;

Why not assign start_signal_voltage_switch in the declaration of
spacemit_sdhci_ops?

>  	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
>  	if (ret)
>  		goto err_pltfm;
> 
> -- 
> 2.53.0

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
