Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33F3C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:30:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90825206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="te2W6Ag6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAYpZIFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90825206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNgcxXhIidZKGfIm38ClumRuFG/7eprUe5NtytRXaTc=; b=te2W6Ag66BYu8y9/atmCC/b2eC
	2ZpNCkR+hOA0jqltjMagp6229sEnaxirI+XRfInzacdQfX1ZjuWAt+Hr1O+RN3LK4p911tRe3987L
	lseyv3TpMsHGNYyuYQ2x349mJIi8ifJMG/4kVqauVqom2WEUo+83U+pzqNcv7/3Lc8H82dlrTu3Ec
	8G5V5g1NQLOQ7uZ+zfVSUMBaZzPEXQcNtDx+UI2mGBO+qkD3nQB1uO634nanO/9JE8/8daYpGY6qh
	e/nLPu+9406BJJIrxbL1yUGhQZSdGggJ1qRKpUSjyBwbEomSh+7PCIBZS+jMJAiLNBD9eGGpixRO2
	bVIPQEkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOIU-0003V0-Fp; Sat, 07 Nov 2020 13:30:26 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOIS-0003Ud-7r
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:30:24 +0000
Received: by mail-qk1-x741.google.com with SMTP id k9so3756425qki.6
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aH9ahL2m2DlHuwZs2NqTSjAIDujecJY29VfTCOj5jeU=;
 b=VAYpZIFpKxEuxOQAeStWmuFaDWxD6BnD9LnhR6Qw0B4UuSTVaJGuga2JpzdGAXoZZX
 iEr8M06RRg/pr7SEvHg6iIKsqGR3sI8Kq1kpshcuOXgZfZMiFE9GTs5rmrHnyA0UwDxs
 YI2c0S2Xwaa9EVrHZg/37eafdSe/L5L1WAvQXHlGHcLH6kT/xF8rNWTBAo5GUFwb1lKp
 OMFYu3ZhQQCzZe9lXhD0KEsuJEu0pCxDgN50qziRUqGfb3DzmxX721vIwSVV5TzxNnO2
 y56yKdGr/RWw1DUiie76feZXnE4YEK8q6SXLO6gOzgfMsVo7xXCUOa4QJpv1H5enubQq
 AKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aH9ahL2m2DlHuwZs2NqTSjAIDujecJY29VfTCOj5jeU=;
 b=NTJ44iHVFKxJZA/F5ryIA+CLwQU8LPrUaDrTI/wKjHk5i4rGO67U2oc1upfyZ2Spmz
 KwPMNayfpRD9+D4SDsskwsCVhdQBG5A9h9mJRcYzEFeePQiT9+oFjXa+1fCGDDu67pJY
 CI/gLIpiL2tD0y1LiNpAGWcVY8D8VdGkPYR6n/Qk9NBEy4lb9UN9KlKE+g8fjtwBeu1/
 8ySn6e6Vk3GX9MquY03jA0vHrf3rLQTfljBCFA8ndRgCmYQtOIaEbDG1XCnplV3JsN74
 zIR41yyw3fHxDzZo20M30m/nK9w/5hbqfqHHhcEyIk2aY3KK6yuiZ0hkpd9VdO0mPyve
 QIlw==
X-Gm-Message-State: AOAM530bfCRjcb1ypP6AEABqcqRSY+YXZsZZTRoXdsrhtsvMSgmMCYYv
 14EPkhvA+aUcX4DtVr7VhUM=
X-Google-Smtp-Source: ABdhPJxOT/pYuXPyEgZh5TmoJxgfExJ8PLvUKy/bvI3d5LIGOh4LPdRHV+esMbz8yiqk6VeaczLyXg==
X-Received: by 2002:a37:41d2:: with SMTP id o201mr5819416qka.425.1604755822578; 
 Sat, 07 Nov 2020 05:30:22 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id k15sm2513306qtk.64.2020.11.07.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:30:22 -0800 (PST)
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
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
Message-ID: <2f2acc07-aa00-5d21-e8f6-d99407bf9590@gmail.com>
Date: Sat, 7 Nov 2020 08:30:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-4-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_083024_365998_7CC4D0F3 
X-CRM114-Status: GOOD (  22.98  )
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
> Fix for the Synopsis DesignWare SPI mmio driver taken from the work
> by Sean Anderson for the U-Boot project. Sean comments:
> 
> The resting state of MOSI is high when nothing is driving it. If we
> drive it low while recieving, it looks like we are transmitting 0x00
> instead of transmitting nothing. This can confuse slaves (like SD cards)
> which allow new commands to be sent over MOSI while they are returning
> data over MISO. The return of MOSI from 0 to 1 at the end of recieving
> a byte can look like a start bit and a transmission bit to an SD card.
> This will cause the card to become out-of-sync with the SPI device, as
> it thinks the device has already started transmitting two bytes of a new
> command. The mmc-spi driver will not detect the R1 response from the SD
> card, since it is sent too early, and offset by two bits. This patch
> fixes transfer errors when using SD cards with dw spi.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 841c85247f01..c2ef1d8d46d5 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -137,7 +137,7 @@ static inline u32 rx_max(struct dw_spi *dws)
>  static void dw_writer(struct dw_spi *dws)
>  {
>  	u32 max = tx_max(dws);
> -	u16 txw = 0;
> +	u16 txw = 0xffff;
>  
>  	while (max--) {
>  		if (dws->tx) {
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
