Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BBAC5CFDB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fbp9sKwVcu9sLDYMcSsGzg0JtcBZk3q/SfRjjh+CjoE=; b=u35/NTTuwSfak2
	/N0sY+y5K7kwUSFpGt73c/nALOSTWcQH19s3aycG3a9ij13K56ba+xYhiEvCBpdd9dkRzfGx5Wvqy
	zn7llY7OPN9aYXhs2TbDytpek718UcdcdxrPFsiMcQWpYJDwkkNcWIyjhDRUcIyFsTdNPgJuGzkZl
	lV8tYC/BEA8jEPM8ABDcUh4Rs57s7thEF/TMaS4S/9Ob0ScQgxb0TYSq+yBUQqetseXdFRQ/VSf+o
	yPlzX231ZUAFg5FwpbJKH1YUi2vuYBdFbFi186/VMDRSiD3gJaege2zmSc+TKBCxaGwFvA1IVi/6g
	J4F8w4CaMxkR8hsfXMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS4D-00000000N17-2UUU;
	Thu, 13 Aug 2026 09:49:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuS4C-00000000N0h-0HCv
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 09:49:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A373600AF;
	Thu, 13 Aug 2026 09:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523CF1F000E9;
	Thu, 13 Aug 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614578;
	bh=TTABNkzRnvKcALm2Uzahbsigca8Jvi3+YV2m2C/7ack=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BIwrsoCl7tY9BhRCIm744CBabclvQfR64hEKjewDzXcajooO63rgrJfG5dth5CubV
	 OIdixsawiVZ++RlKe/uNmNNa1kjrVUwYT+haQHzm6bIb/8tLatLLQO4+AT+/EIzu3b
	 e8PaxrIgkBw7cbEXLu2YvjTqU99J2lG6vBQT7UIy5QkBdpKcAhjY93KuZG5FfdFfp9
	 j0yh9cdU/BMBhWwrTPdAND2ddmLNJO4J/sA59JdPAJdko4MmzjsA5jKZJVGYN0qG4Y
	 nTfS3IZKSMLNgbxJkCfndpCJHpkc3+pWfMssBe3YWrn+t9QieEOah1UAovhXnJ58zG
	 g84ay/MA0xIfA==
Date: Thu, 13 Aug 2026 02:49:37 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/6] usb: chipidea: usb2: add SpacemiT K1 support
Message-ID: <an2TMSqHTVh-XYdX@hu-petche-lv.qualcomm.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-3-f28cf29e522b@linux.spacemit.com>
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

On 26-08-12 17:26:14, Junzhong Pan wrote:
> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 00d575cd2955..70c5ce750519 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pdata = {
>  	.flags		= CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
>  };
>  
> +static const struct ci_hdrc_platform_data ci_k1_pdata = {
> +	.capoffset	= DEF_CAPOFFSET,
> +	.flags		= CI_HDRC_DISABLE_STREAMING |
> +			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
> +			  CI_HDRC_DUAL_ROLE_NOT_OTG,
> +};
> +
>  static const struct of_device_id ci_hdrc_usb2_of_match[] = {
>  	{ .compatible = "chipidea,usb2" },
>  	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
>  	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
> +	{ .compatible = "spacemit,k1-usb2", .data = &ci_k1_pdata },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
> 
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
