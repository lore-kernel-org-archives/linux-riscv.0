Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BA8C388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:31:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCEE206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xC/+5A+z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSEmRkLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCEE206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frXHL83O+lPUowmnAcc0BGCi+CA77WnOfrDQfUvIIjc=; b=xC/+5A+zYElOGtxfRaeuEILemB
	KhNnzcuzkePD3hxD/mMh7z2ccAjfS52LNgdbtLRFhEnk4GUNJ5KG13ohCiO58pRuj+n6/jAhc3xnq
	gj9zKkhtTXi5R4ojWD1wTVQgkqaEHkMVVJ9lfMZc2mxzVKROGBm+LQfWcR83NmMjgbgf+SxxSTscH
	akhXp44cxVY+pGeyl+Ho96aKu7rs+YbzAoCl19AqScGviLoUvcPCcnP0MItRVo9YUDKcOfCqGtpTv
	u1JePCROzu3/LbPzfGkoCSXWj443ylpewI32HNCQq6nDJU5O68Y98GbUzSSTq1vrjeqnR1qEl8MJp
	im9EkQ1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOJU-0003YB-4O; Sat, 07 Nov 2020 13:31:28 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOJR-0003Xi-Cd
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:31:26 +0000
Received: by mail-qt1-x844.google.com with SMTP id j31so2812677qtb.8
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9TDrtZnW4jo1TeqMQCFxvIkdEGTptcp2h1cSMWL7ZOs=;
 b=OSEmRkLMwxQ2Gv3EtxFongMvXrd+KlowjuYwWtzrG5cURuZVSAhA4c2s6Yy3rc8bkY
 jOROKTZAEY4MvgAXqF2Z70l1P62fqYjrwNlE1HYLatU9dbiZXbDMA1eI0f6HC2+55NdL
 2OiSTbw0kULdCC06fGuly22Gr+Ok9Ajrqo4cspDckY+Y/evRyxdy/n4Vg3HtZolku6/E
 l8eD2ea5brBnlzVQ19+xacwokGIgRJb59cRatPvAkVUHngNH//IXago7iSEQalIBEFBR
 Y8igevhxFcwzu7EIHaSWs2TTLOMOIdKwYnwrHGJCYEExSQgJiZonIzqIrnR7OVwcwRW/
 bgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9TDrtZnW4jo1TeqMQCFxvIkdEGTptcp2h1cSMWL7ZOs=;
 b=JNFU/eRfIzmR5YcyVd4U7m64nXRjt3MTsMUbEM926jDv/XMXaqSRrx7ilxUk8KPhwk
 1ASB8VLSbXQv/PbQxNiNpYKegVcchqwG9pfIJdrRlWEgMGS8E5w6NTAtVjyMf96z9bef
 O1Hts82AJhLrVi0Eu1QfIeQ1qNUyMQxDfY/lKlKuVB/3qjw32p/+UO3T8jQIte0hvGWc
 T59WrfansugHIi3HljQxvTd+FJi+nJOJ//U6mcmE6aFaMG2MKZcY1gE+kqxnro7C3L1f
 hMCTDyPCACao5zEERsibiWn3/c0hly9D/NWK2QGw+XCreYzfnKvO0nB2rc1o0LVvdzR9
 aVng==
X-Gm-Message-State: AOAM532IUQtK99gPCoZMyH8VZ5WC2huq6RNKmUPD8omDyX9fcStYdu+p
 BfqeQqP/ZJqd2BOOGJpU688=
X-Google-Smtp-Source: ABdhPJzUCiPw92igZX6MiiIzBVtQxqlpGyp5xkP+RKxTVI+n3YKb3+ZvO1v+OEQuJq1SNLYmhCaMSw==
X-Received: by 2002:ac8:7408:: with SMTP id p8mr5632831qtq.320.1604755883839; 
 Sat, 07 Nov 2020 05:31:23 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id r55sm2480878qte.8.2020.11.07.05.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:31:23 -0800 (PST)
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <53859725-ca0b-5f57-9147-10346707b3cb@gmail.com>
Date: Sat, 7 Nov 2020 08:31:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-7-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_083125_448516_407C6D0D 
X-CRM114-Status: GOOD (  21.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 11/7/20 3:13 AM, Damien Le Moal wrote:
> The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
> ctrlr0 register format. This SoC is also quite slow and gets significant
> SD card performance improvements from using no-delay polled transfers.
> Add the dw_spi_k210_init() function tied to the
> "canaan,kendryte-k210-spi" compatible string to set the
> DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
> for this SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-mmio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 3f1bc384cb45..a00def6c5b39 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int dw_spi_k210_init(struct platform_device *pdev,
> +			    struct dw_spi_mmio *dwsmmio)
> +{
> +	dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;

Can't you do runtime detection of DFS_32 in probe?

--Sean

> +
> +	return 0;
> +}
> +
>  static int dw_spi_mmio_probe(struct platform_device *pdev)
>  {
>  	int (*init_func)(struct platform_device *pdev,
> @@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
>  	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
>  	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
>  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> +	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
>  	{ /* end of table */}
>  };
>  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
