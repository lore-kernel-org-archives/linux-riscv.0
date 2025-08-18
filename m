Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BE0CA0EEB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mr3BfSz7NnYZfiBSrLt6+ZAHpaLEPaEuxIw0eGB3Pcc=; b=G1x9O4WyJdYZwN
	BC1OH0MOMEmjl0A8pkFR4GBiJajTCXHiLZy1Plh8HNTVNgZJmJZulPMVkg/Cp+0fPkxkJlEXfnpQ2
	emh1sE2Sjr40jmHW/llYv9njHDiQFowlaewkrO45Yv2dv2/o8CZbdHWcWI8F0lhjb/2GTuGIXpcuQ
	3dYdbgeCXUSYRDDLdp6xI+Dy4x32rwt0Yx5X9bsjN4LfnXCc8GXgTtJKRODq9MqW5SS2mrl41J7qF
	CIxv04xw8YKEFIAllv++FBx+edyMJTkIJuOnweufJcYYIInGKnrGo40CWJgd7j2tbc8Qeg4fnIpsK
	YdsxORAU/K3gH56iItYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07A-00000007aN1-3OGS;
	Mon, 18 Aug 2025 13:41:32 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwcD-000000076eu-3P0z
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 09:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755510950;
	bh=VHlf81wL+CZcIODTXXenYL/631OM0f2P2rYjTCgiBzI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dh3Ms24noMVX0d0R4rb74bOsVJysl/xbMi3jgGfApBh8u2HttRx0pFdtlHfp5dhO0
	 0AiU1syyqnoVswW7qoAt5n7L6IkDBH3vO/VsR83W02QD5Fl417uUEMcRrQlz5JGCRx
	 02snq4DqaSbTsaTbxsd/hdVuFtOd2e32C7ZsL8GU=
X-QQ-mid: esmtpgz14t1755510939t95958824
X-QQ-Originating-IP: I8GjGI20rjvRSpDEOuPZgNyL2YsWJO/bsOAUmI2b5HI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 17:55:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8607044835764841759
EX-QQ-RecipientCnt: 13
Date: Mon, 18 Aug 2025 17:55:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/2] pmdomain: thead: create auxiliary device for
 rebooting
Message-ID: <492D2D5B0A6B3E27+aKL4mqMhxQ3lWDTa@LT-Guozexi>
References: <20250818074906.2907277-1-uwu@icenowy.me>
 <20250818074906.2907277-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818074906.2907277-3-uwu@icenowy.me>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M5fvx+1r+K0Q02BwQ21oxZ3G8dPZXTEFJQdRjoyFKzvRsKpczOawVYwt
	JYDqtf59NOhc2HOsA2I9Rrd07CKOwVDbRM601ZJJHvK4ZTcBeWZOIKpo8cTE9i8t8bFomwM
	c08Duy2FXBo0/1HTPnt5vABnuEdURytuXlWNbZ04Z27LvYc4TGPGTuRlBcK90B7g9R1Iweb
	7Uh81zz7wmGWphPLiP5NjzFtV9CkzcgkYL3tTGmeBng1PH913GYe4YqnhJNF/2HnTQRshsy
	8OLmhV6+2bh0qXFnigR1efXMbq4JSmW5ObGs3K4NzpDA9lYBeIvDZfLdkrHMgqqT0KF9hoz
	ncPbrCbOqkxlALTB3+7iM8VfvEvFRowtifx8+BD3mLeP7oO8HqWGoWeCJWD1DiQVponzAIp
	0WcR718pwG823S+eU/e8fB6bxohn3KC4dytBiPjvrVGDOqApUCpvtvob6CeK8HWQVugRn4d
	E38+76tyEVtVdtqArYZWI3gBGGnlbjBmrqRXCApcry9n3McwGR5cxodlbQ/QCaKXOFbhK2E
	lSW4V37oGNUFnf0uqT4qn7awTY1jtlbVSKyPwiu81ASApWhudmD5h4FMwvJ3CBypt4/0YsI
	XlORmjHtW7aZtkezt1yZOrIl2RizJNoftGTErvNYCsJFP6Yqazz9GNz2RcX7abqWAbbScWi
	xW6DpWFvC3f4nH3ucKzl8nqxAVIRdAJTgi9H2yPhVBXyrrEf7ON1zaTn9uVFf2Mj1e96yZJ
	jvx8DjkaxTxhonRGMLB3GYZZtsKScPsPMhO0ClYHsIiyp5U6dpnHqxWYNaNMDaMVmrx80r6
	M/hzMCF2gLtTsor4eviQip0zjemoiWw2UimZqFuCqk/ThtVCuG5ddQz/NIQi5w3a4E3DB68
	mZL8CExQkjFJO4zCGB7dLKxT+9lEd8uojyS53poTCwuoTysuKl/dPu+CsU3a6+AkT+97/tF
	J4kXMRs5Je8Y8gRb7DlcRi6yB9+TeYVjqFrWO/dmepW4H5LXUkLa0zJ/tlY5vaBH4mFDDlO
	6VYfUdh8i8YMKQ+wITtOo0l8hnuLwsn8fO7K8T0CCf45jbjLcu3wjB/wvJbg2Mjg/cm6c6z
	RZ1g3YsYiYS
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_025722_710311_0DE1A4A0 
X-CRM114-Status: GOOD (  23.08  )
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

On Mon, Aug 18, 2025 at 03:49:06PM +0800, Icenowy Zheng wrote:
> The reboot / power off operations require communication with the AON
> firmware too.
> 
> As the driver is already present, create an auxiliary device with name
> "reboot" to match that driver, and pass the AON channel by using
> platform_data.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best regards,
Troy
> ---
>  drivers/pmdomain/thead/th1520-pm-domains.c | 35 ++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index 9040b698e7f7f..8285f552897b0 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -129,12 +129,39 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
>  	}
>  }
>  
> -static void th1520_pd_pwrseq_unregister_adev(void *adev)
> +static void th1520_pd_unregister_adev(void *adev)
>  {
>  	auxiliary_device_delete(adev);
>  	auxiliary_device_uninit(adev);
>  }
>  
> +static int th1520_pd_reboot_init(struct device *dev, struct th1520_aon_chan *aon_chan)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name = "reboot";
> +	adev->dev.parent = dev;
> +	adev->dev.platform_data = aon_chan;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
> +					adev);
> +}
> +
>  static int th1520_pd_pwrseq_gpu_init(struct device *dev)
>  {
>  	struct auxiliary_device *adev;
> @@ -169,7 +196,7 @@ static int th1520_pd_pwrseq_gpu_init(struct device *dev)
>  		return ret;
>  	}
>  
> -	return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
> +	return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
>  					adev);
>  }
>  
> @@ -235,6 +262,10 @@ static int th1520_pd_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clean_provider;
>  
> +	ret = th1520_pd_reboot_init(dev, aon_chan);
> +	if (ret)
> +		goto err_clean_provider;
> +
>  	return 0;
>  
>  err_clean_provider:
> -- 
> 2.50.1
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
