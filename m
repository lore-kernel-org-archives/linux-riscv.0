Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D010D14AD
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMnvU4CaEkSZqZ71mtT8kXymBs9S4t3ND9LXZtn8Hkk=; b=GVRcK4eTg80YRZ
	4AhCvb97zmG0I9U65eNsliWqteVVgRWmCaplZZ+Z2Zbqa/v2r2weSpuHakiMMRY2SFA3mjGrOvzal
	78ssoZmTPF+EbhM/mmQF/moAU5A6TWjFAVuiQ5t9PI/yaJaDZc6ZpwJHPPUefsAO73Z+LbbrgTS+f
	Xpeq7TfWtnYn6mN4BHD3ki0zTVbNune63xOenE61Y5PcVEjOYYRwiN7PAIeyQiETTUeHnWNt52sY/
	QBsEOjmMdm3Jy8awXPl18pkQUgXaC2LnYUFTp0Jn2WV83dXj4A9SDuIgzZ32NEYkHQzdb3qrC8HcE
	ZJMUQ61uYVBLxVZab7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CH2-0000000BJKI-0y72;
	Mon, 30 Mar 2026 13:03:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CH0-0000000BJJp-2gnp
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 13:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/olVqTWG50vKfg4BySu0yrzwQXPEUAF5N02G0NIlKaU=; b=NwRCCa2M1insrnI99MhmC8Rq3Q
	cGZyo6x/vKM/XtZ5kOZBeqe8fqSxYlhwT8TaVJwUVHhQgo7mJo6awq1t0txM2EoxMmgVR193vT1OL
	UqmFjBS5mDqGNI2T/uwl0cq0QH5wAbDWvma3V5620Be8/7aRGDLm6IJkIOrXo3deKFMSO6YJVOlVH
	JXL7M5gtzU0mzbhq16Sg2we78+d1DLfLdheLV2G1y/xXsDit8nHq/+jELW9KHqMKlPUirGvHyr5KK
	MPfGYrfi3ZMw2QeDt3fK8KQZJ6bsiHlMm4i1LXib5eG/f46/Tu7buB1X8EVCT1IXgJoP1PKZIFp58
	8Ew0XFGw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CGw-0000000DtDJ-0nH6
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 13:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC7FC401CA;
	Mon, 30 Mar 2026 13:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AB6C4CEF7;
	Mon, 30 Mar 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774875791;
	bh=buW5ym+8RQaRtIvbELFiYVgvwj/WNdl9xTYdSHbICn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l+4o+hVuGg84UyWGcBU55bHC2VHtto/ovSeHge18YcY8YOfWEE1tXApIxUf2UMXn1
	 yBOE7OGxVVpLwtGD9/zVyHvMpd/eRhUEg128J/DxUabhGRpDGxi9dBMmad6U3NVEUd
	 bcolMqNTf93CApKIX6xkgFq+yjDJ6EAppmrEWBFnUC4y+7YbJxtizp0k8pFxIAQCXE
	 I2yFy0FXt4ZbtYMvwMDn/hqif4T0JxiyzM6/Nm9p0g1d2+JOSKttuZU3yJEsTL8920
	 Ha+BcbWEW54C7l8gzgCWQ4OISWV+0izOHCegtKLGrhHH0bnDb7TFVEG7NWJ2rIzFWf
	 QhtrHxrrvD+Gg==
Message-ID: <bef394b6-00a6-4cab-be39-437a5d39bde5@kernel.org>
Date: Mon, 30 Mar 2026 15:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] dts: riscv: update cache compatible strings to LLC
To: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
 magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jonathan.cameron@huawei.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-7-minachou@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260330102724.1012470-7-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_140314_864121_3BE3E1C2 
X-CRM114-Status: GOOD (  13.09  )
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

On 30/03/2026 12:27, Hui Min Mina Chou wrote:
> Update the cache driver compatible strings from ax45mp-cache to llcache

Driver? DTS is for hardware.

> for both Qilai and RZ/Five platforms.
> This follows the Andes cache driver refactoring to use more generic

Nope, driver changes cannot be the reason to change DTS.

> Last Level Cache (LLC) naming.
> 
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  arch/riscv/boot/dts/andes/qilai.dtsi        | 4 ++--
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
> index de3de32f8c39..a7436cbf6f69 100644
> --- a/arch/riscv/boot/dts/andes/qilai.dtsi
> +++ b/arch/riscv/boot/dts/andes/qilai.dtsi
> @@ -137,8 +137,8 @@ plmt: timer@100000 {
>  		};
>  
>  		l2_cache: cache-controller@200000 {
> -			compatible = "andestech,qilai-ax45mp-cache",
> -				     "andestech,ax45mp-cache", "cache";
> +			compatible = "andestech,qilai-llcache",
> +				     "andestech,llcache", "cache";

NAK, actual impact on users.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
