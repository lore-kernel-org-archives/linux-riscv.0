Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32851CAC5BD
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 02:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrpzBXYjKOJwsCsjCKNW7C/kDPZ+hVKq1rYX2r2IGDw=; b=ypntM4kRtox8ei
	m7pSWyYSRIRDoB15gzlBinx7rpMmMS/7idbTjifnCnloyFbOp7+uwM8JqYqal8ZePTKgjo7if6VuL
	lTZGVtqg0Tjxe8owd19rxmYZ119At+wT60L1fwbGSy36U+LJdrQU+/4EhmgFGYIu9duU1vs5yfG9Z
	7+S6BJPeN15VhUwbp6rjzgkrMHRevd0hyVIbppNBoM1RaG5Ie+euCeCypACnqB1CTji5fw6GYoDr7
	8pYZ7QWh7leHFOQCBRzxyg7UC38LJWgapUxr9mi/REaXLTpxcYe71L6uRG2dzzZpR2hW7e0ujy+xb
	UAzSoS4aJbnIHwkoOXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gtb-0000000DHXo-48ML;
	Sun, 28 Sep 2025 02:12:15 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2gtY-0000000DHUR-1dn0
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 02:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759025455;
	bh=eY0bpTnzgWUlPNePnN5gj3Yr6PlpWRkAzkaXahzV1o8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=WqBsKfKloEWSMEIV6IqJ0Lcslxjz4POAEHPuUoXJMH4lAvbG+6hqCsBKi1QotAege
	 AcpLWicvYd9ZXO/79fkAGWofk+ci3vyyTmSt1+PPVZZndQdtWpL8RgVCmaakGMa4Df
	 ut6Yn8k2guEEWfIyPy6VWKjV0QL3LrtmYj8zWpyE=
X-QQ-mid: zesmtpgz9t1759025446tf4c98f6b
X-QQ-Originating-IP: RtsBnZ4ihVU9CHOc9np/4YECKvEAil73OOUAMK5O8B8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 10:10:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11079297919091120086
EX-QQ-RecipientCnt: 13
Date: Sun, 28 Sep 2025 10:10:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <97073301A892F7D5+aNiZJbY2_WqSZR76@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-2-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927220824.1267318-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MRw/zKT/0BpPfcSMtKC3fChJ++zZnxyqvO/A8aqARujyNIIEqVNlosPT
	RPm00bV6Ul5C9qVFu/mQW31wF1IJwPZcvKZU0GbPqg1YFwatDNw2gsQ1P2h6VNfV4uoios9
	tsiZzMGVQokvN2ExrY+0ibVMUEWeoBDOMl2xyK5i+lYUyNCBr+D6k9PuA3O2wDglLNEgoBr
	Uk3ejpn8cJNYwOQM5ZJ6rZiOuzY1E0FN6bKbj9HSu32KWQUXlTpKI/8KrOAN3E9hJLxxrlZ
	UmZ0T2lCZGpYa0i58E3wb+4lcjg0n/yP3NribUYtuBuX4e6E6/zcnVipH2EUaGy1fTCqicj
	brd7FCsD9vXjQ7Qear0rjMAxB8pqfU73SFdIvAtVzebeEGfFP718Eg6BaQb/Zi6aCuP5/lA
	Wfl75FMognxwIvxWanktT4GP6Bvx6P9uPnx63bLyKr/n55zmFCQ9jbupRy/1xDdLQ3ITpYq
	bWhQAcP6UGEbwznBN6CvWH6kB5wjEBqxDrlyqI0Ulik8GFj+e+Weejd0Sizy5kXpt/dCuzO
	9cU+mRKYZMNXCgmbYhPYWEoIs3JYVr8sgdihZbM3K9ZapzqB+GmlRjuE3rtb2iU913YsgwT
	Fq9klMoZuTT67RQHgUlWfw/eMopXwIWb9ZcalxDraOKdV+0S63OP5BqGPietBPBOcm00yTP
	kaG5des2/JMvFwoPqObziKxncSIn0flA9U+OkaxpPUbAncSH4Neps0c0tT6i5wJsdw61RIv
	rd+1r9guJtP/Njn3bzctzbU/aqZUVVTHj5OtueG7EyVZgsEo96KO3qbQFItE+ctfzpep4OD
	cDXESCDnjkVeUu6LSI8IFB+u911xqHBrUWwAlu/dy0xTyIzBAz00jtSSvrDgMqD3S0TdQW5
	s7pP4OhgGqMKZ6Dtzb+XwwdeLFn7VZDBDKRM1GLHH6laG5X7JdNLBVigR/kdIuHaASc3K3i
	gk5nRK/RRttAz5pCPSthIdbnpPknWVXezKD2LCBvYoB6PqskJ7pXrd3k+4lQYCEhFVwzHme
	TYOt24Xnyo7uS/RmksxH/AdvjiFMaVP07Y5Nf5DPSX33R53yEBbGsT+3K0eo6uA1um0QhTI
	ApNc9dY9fAZcD7PczMluZMO1pXgNkAkaboYb4Ixz95E
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_191213_321744_5035FC24 
X-CRM114-Status: GOOD (  22.39  )
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

On Sun, Sep 28, 2025 at 12:07:40AM +0200, Aurelien Jarno wrote:
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
> 
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/power/reset/Kconfig              |  9 +++
>  drivers/power/reset/Makefile             |  1 +
>  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> 
[...]
> +static int spacemit_p1_reboot_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler, regmap);
> +	if (ret) {
> +		dev_err(dev, "Failed to register power off handler: %d\n", ret);
> +		return ret;
> +	}
With fixing what Yixun said, LGTM.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler, regmap);
> +	if (ret) {
> +		dev_err(dev, "Failed to register restart handler: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
> +	{ "spacemit-p1-reboot", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
> +
> +static struct platform_driver spacemit_p1_reboot_driver = {
> +	.driver = {
> +		.name = "spacemit-p1-reboot",
> +	},
> +	.probe = spacemit_p1_reboot_probe,
> +	.id_table = spacemit_p1_reboot_id_table,
> +};
> +module_platform_driver(spacemit_p1_reboot_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
