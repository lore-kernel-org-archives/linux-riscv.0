Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC4C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVbPH1CjghJEFtIotfSxet1mlRk1CxWSAnrvKXP6GR0=; b=qwOhnX++cvLNPC
	k6Bpq3EUCUw1Y01iYYFtRvz5V1fU0GkG0XZazOStH4lb+TojO4fCTfggc+GboK0PfG8qTdHvi3IJ1
	LZuZS3jqWuFwyetsvBmmih+pMXKFhyUlpPrk1V26BK6tPKjSyKvte+7MuM8ZE688S1uUDZaWJnC0v
	m6z9PbsCLWjbnUfauYHCnx2+5XkUz81IjUgdmeOPtWxfIxNoWgpmJ7ZY1hBnWtNkYX+bQdetOl0Rp
	ADL29v02hHFfT8x2he5ih/aow5KeSkdoTPffumFGVrzi6QZ78ZdH8fWTmxQ8it3ocXw3lmdyMMlzV
	zawgehVrKp6yZtZAnJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvg0y-00CdwQ-16;
	Wed, 25 Oct 2023 15:41:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvg0u-00Cdva-2U
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 15:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9C5B62202;
	Wed, 25 Oct 2023 15:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C50CC433C8;
	Wed, 25 Oct 2023 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698248503;
	bh=PzjgKpSa57giPfmrowGoMAs62Cov+6nezTmGkieIMeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lI4Q9GwoRePYdEq52N3c61EeIRpMkDTqi5iRFrMExTJTacyDIyN9YPfehym+0288I
	 QYIJ6qIdPhPbIp3fNIKVMoZf7yx8kdD6htozlwjc0THS4jEU3HFGUivXVYCuRRBmz7
	 5lcLSeXaK9Jrfz9JBYeXauXCbAgNO9kq9obW3jJdOBtxOH2GJ+Q6PxsUxMtF8NinKT
	 PjojuRheRm6QfWUoTeUtl8wFLWHfvEIFhe/XISifpZfKoTsuf0FTBvplwLdSCE/fMs
	 N97EJD4KeRscOI/Em55RnBO+fPYO+KFd58sQ/W+Zt8az7zQHWfYR/RUY5gpruGryMf
	 BxZTSRD41fw+g==
Date: Wed, 25 Oct 2023 23:29:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v3 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
Message-ID: <ZTk0VcFd3FcXIABW@xhacker>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
 <20231023-th1520-mmc-v3-2-abc5e7491166@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-th1520-mmc-v3-2-abc5e7491166@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_084144_894134_24FD7F16 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23, 2023 at 02:07:03PM -0700, Drew Fustini wrote:
> Expose __sdhci_execute_tuning() so that it can be called from the
> mmc host controller drivers.
> 
> In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
> platform_execute_tuning to th1520_execute_tuning(). That function has

Hi Drew,

Just FYI, my th1520 version patch in my local repo overrides the
mmc_host_ops.execute_tuning as the following:

host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;

In dwcmshc_execute_tuning(), I will do some necessary setting then
call sdhci_execute_tuning();

So I don't need to export __sdhci_execute_tuning(). The main reason
is that the __abc symbol is expected to be used internally. However,
I have no big preference. I would leave the decision be made by
mmc maintainers @Ulf @Adrian, can you please comment?

Thanks

> to manipulate phy registers before tuning can be performed. To avoid
> copying the code verbatim from __sdhci_execute_tuning() into
> th1520_execute_tuning(), make it possible for __sdhci_execute_tuning()
> to be called from sdhci-of-dwcmshc.
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  drivers/mmc/host/sdhci.c | 3 ++-
>  drivers/mmc/host/sdhci.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index ff41aa56564e..c79f73459915 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2841,7 +2841,7 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode)
>  }
>  EXPORT_SYMBOL_GPL(sdhci_send_tuning);
>  
> -static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> +int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
>  {
>  	int i;
>  
> @@ -2879,6 +2879,7 @@ static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
>  	sdhci_reset_tuning(host);
>  	return -EAGAIN;
>  }
> +EXPORT_SYMBOL_GPL(__sdhci_execute_tuning);
>  
>  int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index f219bdea8f28..a20864fc0641 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -793,6 +793,7 @@ void sdhci_set_bus_width(struct sdhci_host *host, int width);
>  void sdhci_reset(struct sdhci_host *host, u8 mask);
>  void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
>  int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
> +int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
>  int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>  				      struct mmc_ios *ios);
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
