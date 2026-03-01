Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8A3FD0062
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b67saz+/6z7kiiqm9ipxWFbdwdhLAtxgho1i1fCswiw=; b=a1ryfvxBxu6y8H
	zwXhTjnjE9+v5vk7kiG7/Jga5GypOg6b9X62V9E4kGUZTtBPS76H6JnTzQ8WbKWcYyN/ik4vrXy8i
	uM/N8RiPrUeYyqFcEJvwZXFqPD5fqbmftbuq8n4WvE4OqnCQVMjU/zEvMi2O049RVfDDWZHFQINuY
	W0bZbdejj1WSvWHyKHQBUnsopncGyg7+RDV+bwayzdxcV9yX1ooa1emGsfQCJl9XsCmHE9zZO6Uwp
	U/W0HVEGT9WALRJrGRsfMq30mdycseRxyqh+lHwBuyOJLsUGHIbNZPK8WjUWF0v1DuicRER6Z/uP+
	gFLoWqL3hoo1wY9w8lXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlHZ-0000000Blpi-1k4k;
	Sun, 01 Mar 2026 18:12:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlHV-0000000BlpM-43Kw
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 18:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52C7343D73;
	Sun,  1 Mar 2026 18:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A8C116C6;
	Sun,  1 Mar 2026 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772388761;
	bh=2tBYxDnTTDmwYplUfxuZm8q55vkRHX1ktadnQoNR0rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEMndagJnw30yQE+6GEDfRZo6V64zCPvYR6jfCNLWmxRqLfBWlrQhzu1QVZVoOPb/
	 Ddvcdhs9LVG1JSilSt0TYdu6UVJj7lX+nm65zYRwKnNdKL0A1AMIyQiLa0dgLXU4VE
	 XhsDLjsDlQYrkYKVw0fOW+ojc+aE5tNbS93bZXDvIxYgOmSNClDOrSoJyk11oSsFgR
	 zD87GosuvuycJ6n4lUYNeoXgnxVBkMd4YnXJ1TSOfQpytje26ch8QmxzHdhAto+Dnj
	 fJ3emgzcGlTLPn3SjTH9ai16xRuLTbSmBtfRsiwg+ekJiFajw5MieEGQSeFVrx01/h
	 KHr32JdamrivA==
Date: Sun, 1 Mar 2026 18:12:33 +0000
From: Simon Horman <horms@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v2 5/8] net: macb: timer adjust mode is not
 supported
Message-ID: <aaSBkVkhNTbQHkmI@horms.kernel.org>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
 <20260226-dollop-maturing-9e3c83192ee5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226-dollop-maturing-9e3c83192ee5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_101242_046978_0D74E7EF 
X-CRM114-Status: GOOD (  21.93  )
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

On Thu, Feb 26, 2026 at 11:03:20AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The ptp portion of this driver controls the tsu's timer using the
> controls for "increment mode", which is not compatible with the hardware
> trying to control it via the gem_tsu_inc_ctrl and gem_tsu_ms inputs in
> "timer adjust mode". Abort probe if the property signalling that the
> relevant signals have been wired up is present.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index ddbb0c327b303..fa55e6e7036f2 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5535,6 +5535,12 @@ static int macb_probe(struct platform_device *pdev)
>  
>  	bp->usrio = macb_config->usrio;
>  
> +	if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
> +			IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
> +		dev_err(&pdev->dev, "Timer adjust mode is not supported\n");

Hi Conor,

Assuming this is an error condition I think that err should
be set to an negative error value here. Else the function will return 0.

Flagged by Smatch.

> +		goto err_out_free_netdev;
> +	}
> +
>  	/* By default we set to partial store and forward mode for zynqmp.
>  	 * Disable if not set in devicetree.
>  	 */
> -- 
> 2.51.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
