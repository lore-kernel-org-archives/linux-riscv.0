Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FEFCD4F43
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqYv7GvV2Hc6ZPzSETcm3BDZeAqO7voqW3vL+0TEJLc=; b=IilO5Vlw1m3uOb
	MFzIoaPLHVGZEECfCLXX/18O3do7RtxSdG90CdEfYkRdL+SbdopLEaIqUcT8RH1uY6Jtn97R57s43
	RSx2ayy243anDICdnJm7Wn/Nj2zbVztceXZaGHZR5t1Tlc6S2uLT3IpGzn7FrU6PGDIuKl2tFg4TD
	PSYatqz/Cj2omuvfm35y0qY/grms6Fi7KXA46Z4UM3nQ9Wg8AHQtPGsCpuVfDVvuHPl+bD0zuTCxs
	IQm4wxYhHOmD8BrOo1NCdnQ44IshZBeZR3rMlJ2mt4wwCPCiFvRjBG8PdJ7J1Ga3tk4pnMe/EUQmd
	Hc4epli+1mcc7waOEhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcfD-008bw7-3B;
	Fri, 22 Sep 2023 09:41:31 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcfB-008bti-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lu0ragu9njIWkwjYInfzfJMShGYH9itXl0arckB59I4=; b=AVK3i7Gnj8vrP3ODfaNSbz2/iT
	5N97Ep3ypZjTKYMj/YOuCPzp1aR+ZtoydUkZ2cBWb9tG34RjTfBlDjMeNV1odS1j6F2GEkQ+VpcS7
	WG7iunBRr5njaBq1AG069VWZtFakknKyAZUTzDghq9xkxcN37LDKioxDSBdENkiQhTKsJvbj4F0ty
	8rwaVproLUfX+QCmlY3/2NUIgEYPJV77ZHnsftrsnUK39FUzOoQxYEyntAimHYTluJXWwX2sk5BlL
	r1qFnUOX4vW9zdKS4zw3As2kyabk2A7mY7KHtaWjMVplRsG7Gcp6NQStaKOSHnnA+WV45VVbNeKE7
	joMqH99A==;
Received: from [134.238.52.102] (helo=[10.8.4.124])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qjcep-00CYxl-Di; Fri, 22 Sep 2023 10:41:07 +0100
Message-ID: <bcdc4623-a37e-455b-8f10-c539e2b04554@codethink.co.uk>
Date: Fri, 22 Sep 2023 10:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
Content-Language: en-GB
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_024129_478647_6AF40B27 
X-CRM114-Status: GOOD (  14.88  )
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

On 20/09/2023 07:40, Chen Wang wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add quirk to skip setting the input clock rate for the uarts on the
> Sophgo SG2042 SoC similar to the StarFive JH7100.

I'd love an actual explanation of why this is necessary here.

> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>   drivers/tty/serial/8250/8250_dw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index f4cafca1a7da..6c344877a07f 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
>   	.quirks = DW_UART_QUIRK_IS_DMA_FC,
>   };
>   
> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
>   	.usr_reg = DW_UART_USR,
>   	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
>   };
> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
>   	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>   	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>   	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
>   	{ /* Sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, dw8250_of_match);

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
