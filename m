Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8376AD10DCF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6neCPrIGEKIh1567mO+FmY1ngNGlIfcTH3FosrC8YRg=; b=dk0HQRF0KQqEyT
	Y/l5aqUXigI2Gfw4MQVPxngmggDpBxn7wjRxwiFIH1YIeYQye3XYWNAveD7pMh7oT5HCcOZihpvqu
	R1TQQCIEk0ieIZ15XIAS5S7vlTAcGgAMe4GJ7V0SioUkDHwl9DL077ePSAyR7qpzsHwJj41T8ttV4
	E2bh9qq166H6Fa8kI2duModsvqBmehboAYTt21INKfv8QLK9ixJeZSizzB4uSKhu+iIyQQSCZq5JZ
	pfKQahyQXV8ywTacSmp8lkXjtRRkQBcZsjVVMPGsTpRAv11o00yoyHMepyNbXPOKVi7re2rdm7dul
	YlrTtl0T8vprhAbP6spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2m8-00000005ZyI-0ll7;
	Mon, 02 Dec 2024 09:31:28 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2m4-00000005Zuw-2RVA
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 09:31:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241202093119euoutp0200b2e3261170dac314832809622b1bd5~NUkMJPckh1720617206euoutp02q
	for <linux-riscv@lists.infradead.org>; Mon,  2 Dec 2024 09:31:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241202093119euoutp0200b2e3261170dac314832809622b1bd5~NUkMJPckh1720617206euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733131879;
	bh=bNLCIvm+oM39D/4v5xSquqtfCBDIka5GUXMW3ab8YE8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bP9QtALFsYvKT8G2e0oTRFB+f6QQNkuKUwQIMox3RhDDbbs4GW8TPMvjzCsZOuCRF
	 ILAqAaOk46YRrCoHuvMqCyiI4ffilK84J2rELA7gQv2VCGO/YO+9vNeuP8UV1Ws5fp
	 4tLUMpXjcc94BZKeEwBdJ/afqizssuIkhW8G0fN0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241202093119eucas1p2ff26482687ca1648e9faf9e0327d0c87~NUkMCbzCQ2770627706eucas1p2P;
	Mon,  2 Dec 2024 09:31:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 43.20.20397.76E7D476; Mon,  2
	Dec 2024 09:31:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241202093119eucas1p1b14d09e2f688812cafb71c1fba5ebaa0~NUkLuHU2W2786627866eucas1p1k;
	Mon,  2 Dec 2024 09:31:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241202093119eusmtrp1449739753e480deb07af0e5ec7592f07~NUkLthy512968429684eusmtrp1u;
	Mon,  2 Dec 2024 09:31:19 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-40-674d7e67ac12
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 8B.DB.19920.66E7D476; Mon,  2
	Dec 2024 09:31:18 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241202093118eusmtip1c9c3819652fa5a9227c7491196233cb9~NUkLOnZ0v1680416804eusmtip1g;
	Mon,  2 Dec 2024 09:31:18 +0000 (GMT)
Message-ID: <90d4515c-835f-4aaa-8c9f-263f23bdfdb2@samsung.com>
Date: Mon, 2 Dec 2024 10:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: th1520: Fix a NULL vs IS_ERR() bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7rpdb7pBh0PBC0+zGtlt7h3aQuT
	xYu9jSwW11bMZbfYekva4vKuOWwW2z63sFm07J/C4sDhsXPWXXaPTas62TzuXNvD5rF5Sb1H
	y9pjTB7v911l8/i8SS6APYrLJiU1J7MstUjfLoEr487h+ewFJzgqjtx/wN7A2M7excjJISFg
	IrH//kEgm4tDSGAFo8S/o7NZIZwvjBJTdx9mgXA+M0ps2PeOGabl24rZTBCJ5YwSz54fg3Le
	Mko0/N7PBlLFK2An8W9dAwuIzSKgInHmyxMWiLigxMmZELaogLzE/VszgJZzcAgLOEisWFIK
	EhYR0JH493cy2GZmgSeMEp23joJtZhYQl7j1ZD4TiM0mYCTxYPl8VhCbU8BF4mnfTDaIGnmJ
	7W/nQF36hUNixvEQkPkSQDWrvrpBhIUlXh3fAvW/jMTpyT0sEHa+xIOtn6BaayR29hyHsq0l
	7pz7xQYyhllAU2L9Ln2IsKPEkvczWSCm80nceCsIcQCfxKRt05khwrwSHW1CENVqElN7euGW
	nluxjWkCo9IspCCZheTFWUhemYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzA
	xHT63/GvOxhXvPqod4iRiYPxEKMEB7OSCO/y9d7pQrwpiZVVqUX58UWlOanFhxilOViUxHlV
	U+RThQTSE0tSs1NTC1KLYLJMHJxSDUx5b2akvQgr0+zUsapbu+bX2XN7AkN1BTwXSdwrUYqc
	Krvho9VVdz77O7dVKyNn/HyZ98Y48oK5XjbfofoJiS8blryZlbI/64mmdFVXzTSmLasVRA6s
	YN00dV+J/subD864+BcI9O3/aRF9dO6Bipab57PvMm123X+n4ZuM1sckSZE+hjqbCsHjX35L
	ND8pku5hizxfcnbt1V9Z13O7fB/d2r/vq/RNwa+7pmxOFV2dJmByt9xX+GVZp1wXX4/G8b3r
	mR015q6c88Y7XtVOX0pb70X2562OzYe8d696z1i6d2voKb1YpomR2mrPIlZoJCQZt6vv2OcX
	eP2R4JQfdXZX52+O9uU7HmXzfEmlUYMSS3FGoqEWc1FxIgAwr73WuwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xu7ppdb7pBt3HLS0+zGtlt7h3aQuT
	xYu9jSwW11bMZbfYekva4vKuOWwW2z63sFm07J/C4sDhsXPWXXaPTas62TzuXNvD5rF5Sb1H
	y9pjTB7v911l8/i8SS6APUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEv487h+ewFJzgqjtx/wN7A2M7excjJISFgIvFtxWwmEFtIYCmjxNTL+hBx
	GYlr3S9ZIGxhiT/Xuti6GLmAal4zSnzYMAcswStgJ/FvXQOYzSKgInHmyxOouKDEyZkQtqiA
	vMT9WzOAlnFwCAs4SKxYUgoSFhHQkfj3dzILyExmgSeMEg+bmlggFkxnlLg87ykzSBWzgLjE
	rSfzwa5jEzCSeLB8PiuIzSngIvG0byYbyFBmAXWJ9fOEIMrlJba/ncM8gVFoFpIzZiGZNAuh
	YxaSjgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECY3HbsZ+bdzDOe/VR7xAjEwfjIUYJ
	DmYlEd7l673ThXhTEiurUovy44tKc1KLDzGaAoNiIrOUaHI+MBnklcQbmhmYGpqYWRqYWpoZ
	K4nzul0+nyYkkJ5YkpqdmlqQWgTTx8TBKdXANHe/7T/HiP1uLzcWnQhpXBYkoXT2SviTdie2
	aSv+OH8VSryitfLKrDkX4057vC+qTnd+tMWJt8Q38+1how+KX8/lFvZeyJaSmJ5yQczRZFL3
	47zlKyUKPbJK2cw8gvQn3ru3c/5RzXOFh/4ITjqov+LHsn/i67/phi8ymLs/3PDVl4JpKzon
	fy+cL9tjZ5Mv457z5m7wzAsJq5llFJkFY7zjpzr96mz5tfDFz79f0j3/5nxokHP9UK23Menn
	KbE92r+UhfezmTUmbJr5omzdQ50D2VJV26vXzhSbs/pL4dYrQWnWZocY1pycs3k+j6BG9smg
	kJMlhifSAjfsTFkq8kSrWuVCt/d2h2UbLN4buiqxFGckGmoxFxUnAgDocfa9TgMAAA==
X-CMS-MailID: 20241202093119eucas1p1b14d09e2f688812cafb71c1fba5ebaa0
X-Msg-Generator: CA
X-RootMTR: 20241130100751eucas1p25283ed89679b086be2863092149236b8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241130100751eucas1p25283ed89679b086be2863092149236b8
References: <CGME20241130100751eucas1p25283ed89679b086be2863092149236b8@eucas1p2.samsung.com>
	<bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_013125_118249_6236D770 
X-CRM114-Status: GOOD (  15.00  )
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



On 11/30/24 11:07, Dan Carpenter wrote:
> The devm_ioremap() function doesn't return error pointers, it returns
> NULL.  Update the error checking to match.
> 
> Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mailbox/mailbox-th1520.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
> index 4e84640ac3b8..e16e7c85ee3c 100644
> --- a/drivers/mailbox/mailbox-th1520.c
> +++ b/drivers/mailbox/mailbox-th1520.c
> @@ -387,8 +387,10 @@ static void __iomem *th1520_map_mmio(struct platform_device *pdev,
>  
>  	mapped = devm_ioremap(&pdev->dev, res->start + offset,
>  			      resource_size(res) - offset);
> -	if (IS_ERR(mapped))
> +	if (!mapped) {
>  		dev_err(&pdev->dev, "Failed to map resource: %s\n", res_name);
> +		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	return mapped;
>  }


Looks good, thanks !
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
