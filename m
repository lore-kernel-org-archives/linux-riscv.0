Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CCD5B16E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bYsiwW80VggYxGsnNBiyPzhybLDxR8tKyM0A3y9Bvg=; b=jhTsh07qsDioqs
	vuYtWnWntkCI8VxhX6sD5dGvFneYS/M75/gpDYf7FeMIAvVM42/iFdHFyDtGxtboT8IMzNVxwsN+v
	fNGM5gKxzY1aCw+zkMZhUNqHg2IOTtnUdKDWfp6tfVqAk+3jMk1DZ39GO7Fml4AAFzgpgQSEeenKQ
	w1zhKJvtKY/lUO7hkwfYtXp+3Av3EPJlbSd0KSqexOwM61LFJjjnQjp0IeTDU/LDf2lAA13GL+MUl
	0weNLnT1KF7kOMvfKKPp8UbepVY+VF9u0xV3z+btmAMsJLyREXdavNQX1WYNXpAnN/s3e61s+xyDz
	Yh1Taw4v3cN2my5kDigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7yN-00000003eNK-1XIe;
	Mon, 15 Dec 2025 12:46:43 +0000
Received: from mail64.out.titan.email ([44.205.83.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7yL-00000003eMs-1ioW
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 12:46:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVKZ42WQ9z9ryp;
	Mon, 15 Dec 2025 12:46:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=26gKZ8cHJQyg3tsQnLKxfy/czi/WwVFDnMPNQEmK7DE=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=message-id:mime-version:to:cc:subject:in-reply-to:date:from:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765802796; v=1;
	b=Ce2/7dv/i4glBqnOluWyICUzbXC9PY0zJek9gZOj5/Gq0rOXsZGlvQ/qXY1FBrXoSsn6OQoe
	ysTC1SneZ/ijWRuV6tTgWTsaC9nlb6BmkGFN2Bh4wi9H0WeDD6knni0Qw9W0NEDlIJsZJIoQNSo
	eoNHiK8wEola+IhHXLgFtF2Y=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVKZ04nK2z9s1F;
	Mon, 15 Dec 2025 12:46:32 +0000 (UTC)
Date: Mon, 15 Dec 2025 12:46:19 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
Message-ID: <aUADG5c8r0GEN6iP@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765802796147399430.21635.5162492382395939498@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=6940032c
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=9nqrEZDV118k6e1QdI8A:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_044641_555873_78791740 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> This introduces a new sdhci0 node and enables it
> for the BananaPI F3 and OrangePi RV2 boards.
> 
> Note that card detect is marked as broken in the driver
> (SDHCI_QUIRK_BROKEN_CARD_DETECTION quirk), therefore removing the card
> while the system is running won't have any effect.

This description looks suspicious: SDHCI_QUIRK_BROKEN_CARD_DETECTION
doesn't break hotplug. It only informs sdhci core to actively poll for
card status, instead of relying on interrupts for status change.

...

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6..a5b7d7c8c066 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -987,6 +987,16 @@ emmc: mmc@d4281000 {
>  				interrupts = <101>;
>  				status = "disabled";
>  			};
> +
> +			sdhci0: mmc@d4280000 {
> +				compatible = "spacemit,k1-sdhci";
> +				reg = <0x0 0xd4280000 0x0 0x200>;
> +				clocks = <&syscon_apmu CLK_SDH_AXI>,
> +					 <&syscon_apmu CLK_SDH0>;
> +				clock-names = "core", "io";
> +				interrupts = <99>;
> +				status = "disabled";
> +			};

This node should be probably put before the emmc node, since it comes
with lower address.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
