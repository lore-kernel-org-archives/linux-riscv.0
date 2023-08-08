Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF31C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N3EOkIgt9rM2h/W525EewjuRBmZmQiNmG2+kXAgn4g=; b=vJ2QvMCxeYwNmdRgLleydfpKpB
	WvOHKAhw0lMxNF/7L28h9Fnu9RYgrGNzWU+SIKu6yGJfbdzaSFP5emJcr33o54O71LZ5GFNTnW+Sx
	Yuw1DtAT3P5r+cZIDds41do+6v83aFCpFr8CfTdxe1MwbWhDd8oiO9qmzyohFPuqr9i5ClB2IS+Wf
	O7Sg18h/+YyAl+5U/Mmrk15ajTDSeDLVD2WpI/Sl2DDmA2nZSsLGwBwJzrU/zUNsP9e2ViHOTFtHH
	MP9avEbSTwR//4L1PXYwRFbPjQF7szOHrJ2sW1TpWhlL4Zb/eqM5txkD2j8MshJ6L/X847AG3uSbx
	mEt6FDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTINu-0024tH-2z;
	Tue, 08 Aug 2023 08:48:10 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTINr-0024ry-0s
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 08:48:09 +0000
Received: from [134.238.52.102] (helo=[10.8.4.157])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qTINg-00CjDa-Lk; Tue, 08 Aug 2023 09:47:56 +0100
Message-ID: <12c1e981-b664-b80c-d0df-7e7a098e32b1@codethink.co.uk>
Date: Tue, 8 Aug 2023 09:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/2] serial: sifive: Add suspend and resume operations
Content-Language: en-GB
To: Nick Hu <nick.hu@sifive.com>, zong.li@sifive.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230808072625.2109564-1-nick.hu@sifive.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230808072625.2109564-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_014807_331129_36F2CB57 
X-CRM114-Status: GOOD (  23.40  )
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

On 08/08/2023 08:26, Nick Hu wrote:
> If the Sifive Uart is not used as the wake up source, suspend the uart
> before the system enter the suspend state to prevent it woken up by
> unexpected uart interrupt. Resume the uart once the system woken up.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

^ This should be Reviewed-by, as I did review on this earlier.

> ---
>   drivers/tty/serial/sifive.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index a19db49327e2..87994cb69007 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -1022,6 +1022,31 @@ static int sifive_serial_remove(struct platform_device *dev)
>   	return 0;
>   }
>   
> +static int sifive_serial_suspend(struct device *dev)
> +{
> +	int ret = 0;
> +	struct sifive_serial_port *ssp = dev_get_drvdata(dev);

Minor annyonance is ordering of ssp and ret, I think the showrter one
last is the nicest looking.

> +	if (ssp && ssp->port.type != PORT_UNKNOWN)
> +		ret = uart_suspend_port(&sifive_serial_uart_driver, &ssp->port);

Do we really need a test for ssp being valid if the device is bound.
Not sure if the port.type is also useful?

> +	return ret;
> +}
> +
> +static int sifive_serial_resume(struct device *dev)
> +{
> +	int ret = 0;
> +	struct sifive_serial_port *ssp = dev_get_drvdata(dev);
> +
> +	if (ssp && ssp->port.type != PORT_UNKNOWN)
> +		ret = uart_resume_port(&sifive_serial_uart_driver, &ssp->port);
> +
> +	return ret;
> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
> +			 sifive_serial_resume);
> +
>   static const struct of_device_id sifive_serial_of_match[] = {
>   	{ .compatible = "sifive,fu540-c000-uart0" },
>   	{ .compatible = "sifive,uart0" },
> @@ -1034,6 +1059,7 @@ static struct platform_driver sifive_serial_platform_driver = {
>   	.remove		= sifive_serial_remove,
>   	.driver		= {
>   		.name	= SIFIVE_SERIAL_NAME,
> +		.pm = pm_sleep_ptr(&sifive_uart_pm_ops),
>   		.of_match_table = of_match_ptr(sifive_serial_of_match),
>   	},
>   };

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
