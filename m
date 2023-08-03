Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7173DEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 05:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw4R2dg51yTt+Hm8XQ3EDUCrwjuWpwnRo/jhfUkz1KM=; b=oVEH723aHTgAa1
	RXhr1r5mGrEsV8ALiCQrlK2EEcmG54NTjzpNatFowQdR7sMP2QPjFYNyJmAfsz0vVkZNoLmQ92khp
	2Cf5pWEc0BgQhFVzLaKPPyWWKIajKsfB426KmGF1tVY1CgkJGlAA0r1KuJjkEn+J8S1s5/qnT0qH2
	V/4e5aHNx1nuCh3buF3IKQvjcXAM+Xx9OaMlmkGmkZ1+D7dWSQoT/e3tyauAwlsNMjtk+E/dPwIHP
	uXVfXkP3TxVkGBpRcUVldvlRt/2qn20ALqFXV66X1TVm4je2xJztTCP4/egu4wo3kAEbMt0L5MJf2
	AtnTLYwK9QhSavIWSxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQhG-006fhQ-1V;
	Thu, 03 Aug 2023 05:16:26 +0000
Received: from smtpng3.i.mail.ru ([94.100.177.149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQhB-006ffu-0p
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 05:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=7SF+07K71ohh0WDQNef5po3x/ysEktiM4oUVhWKFpQ4=;
	t=1691039781;x=1691129781; 
	b=CsJcovHvX2ALYvKeRzKtusUctZHJgZBKSzqL/ZQ18naNSItW0g/sD5vHQ8ED/nGWL+gilVm8FNnxmagsSywcW8s+sXgEjkpMTzTPBhgW9UrBxviV+MEWzmYmFfTClSp70D1m8O0M2g2e40jscEV2bDAIvZOvKOtHe+5dPSnAq3AMiNYQpFs+5K/uUHUOnY+LbBdhSg7CSSJnpST6jmKc6gFglywoGzdbb52TZqtuJTeABITYu5dn5wN8Tr2W6Jr5Fzh3yxYkm2U+LDRRTXFZD5/2jUyJdKNBMj7j4WNqmkg5GWcGzyiYyg/5nYOsgNk1mEg5Y0CKWPyT/7EEW0wNyg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1qRQgx-0003YR-Rj; Thu, 03 Aug 2023 08:16:09 +0300
Message-ID: <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
Date: Thu, 3 Aug 2023 08:16:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-4-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230802084301.134122-4-xingyu.wu@starfivetech.com>
Authentication-Results: smtpng3.m.smailru.net; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD93761F2630DFFAF419FF9F36511838303579425D3053CF375182A05F538085040A43AEB9EE471BF590BA4D0903507B565CF94DF8359E0D3D1F5C007C0E5B44D8E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BBC4AF2A01A27A06EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371E4BC0E00C009995EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA926EDEA9C8C4A220F6A49BED6FC8378E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947C7AE820D2C17D0E56F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637990DCC27F6719F98389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73557739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A568B3C69D00CF7EA59AFF425838D6083DF6F5AD3B11D1C70CF87CCE6106E1FC07E67D4AC08A07B9B0AD0E433DBF1FBFA3CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF047F6813025EDDE9D08033DDC88F3ED78B8B6229CDE5AA3EA12E2341A1FE79787D7FE2FA29F577878553022043D0BC9A5D4881C73C9D659B10E80BB90F46987DE4EB81C25D25832B4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojcir52QaMQ83GZmVOKMR6Fw==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BABA8A15A10676D7D60F49567370C77E298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_221621_932036_3652BBCB 
X-CRM114-Status: GOOD (  15.60  )
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



On 02.08.2023 11:42, Xingyu Wu wrote:

> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index c076090a9864..4dfbd8ddbcf5 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -16,6 +16,7 @@
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/reset.h>
>   #include <linux/slab.h>
> @@ -198,7 +199,7 @@ static void i2s_start(struct dw_i2s_dev *dev,
>   	else
>   		i2s_write_reg(dev->i2s_base, IRER, 1);
>   
> -	if (dev->use_pio)
> +	if (dev->use_pio || dev->is_jh7110)
>   		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
>   	else
>   		i2s_enable_dma(dev, substream->stream);
> @@ -216,7 +217,7 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>   	else
>   		i2s_write_reg(dev->i2s_base, IRER, 0);
>   
> -	if (dev->use_pio)
> +	if (dev->use_pio || dev->is_jh7110)
>   		i2s_disable_irqs(dev, substream->stream, 8);
>   	else
>   		i2s_disable_dma(dev, substream->stream);

Why do we need to enable interrupts for DMA mode?

> @@ -227,6 +228,21 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>   	}
>   }
>   
> +static int dw_i2s_startup(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *cpu_dai)
> +{
> +	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	if (dev->is_jh7110) {
> +		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +		struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +
> +		dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
> +	}
> +
> +	return 0;
> +}
> +
>   static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
>   {
>   	u32 ch_reg;
> @@ -267,6 +283,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
>   		config->data_width = 16;
>   		dev->ccr = 0x00;
>   		dev->xfer_resolution = 0x02;
> +		/* Set DMA buswidth on JH7110 */
> +		if (dev->is_jh7110) {
> +			dev->play_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +			dev->capture_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +		}

Not needed.
See: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20230802&id=6f80197f40515853814d0f22e5209d53f899ab91
Proper bus width calculations is performed by 
snd_hwparams_to_dma_slave_config()

>   		break;
>   
>   	case SNDRV_PCM_FORMAT_S24_LE:
> @@ -279,6 +300,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
>   		config->data_width = 32;
>   		dev->ccr = 0x10;
>   		dev->xfer_resolution = 0x05;
> +		/* Set DMA buswidth on JH7110 */
> +		if (dev->is_jh7110) {
> +			dev->play_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +			dev->capture_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		}

Not needed.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
