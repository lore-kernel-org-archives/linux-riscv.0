Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326C3F44873
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WD+gxOaygRBS3F1dWPSLGqZbtT3TBCth2f383B5GZFc=; b=wxK98Y1Q7MQihg
	qnRvc5pNS1alqM2sGgaJKyfGgJ9dQIWf0c7i9N44eMe1CEVF+bisY/u3j4JjKM48+RxAQxgY3HWWc
	+3GfXp5hxurJI/k4N5I5dKP5W29PdlJgZ4z2zvkhKzhEI6IQKkuWmO507/zxlN3BXCaEkS0mtb+Lu
	qYZwOGNYtyA7h4E5dCavmoxBBHWBqXqc46gyQDCnGiII3O8uA343e4L0OORt1j+pS92rzWzLn23+s
	njgmytQBRlWsv7o24kwzMHXOlSFMnrj5YfUyyJ5dADFSA+n8MWat1Y1Dmi6CdRDxBz1E9wiPM3HpX
	V4t/PyANvRVg4JKEG8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCu1-0000000CO8D-0eNh;
	Fri, 10 Apr 2026 14:32:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCu0-0000000CO85-1Cyr
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Apr 2026 14:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ySI8d8y036ORHtABeS6u8UzWRJy2qBPy8C/MLYGEwB8=; b=E3CxdRGmevQRSQqu5onVSHxHcz
	LrLbG3QSi1l+XXcPDPxBxCCzykpWQNHb/HwE5rEE/vaIZXjNZURpRnBBq6UDoznKVgm/upvzES6Sm
	2X0oGbLG1AupXa3FRRpX8+F5mOlAkOcv2HHII5pvr98mJxgUUPB6XRPXNn0Su80jYz/1L+5/Gh9Gq
	VzYU3nRAihLHAVg+xTnCLWCMWnWe8S1JA5vlY1vc2ebZF36Zry7poFKnelrLCk66HRwTzaNzdlC1v
	ktb2zckUqwwGu8yXpjZ/aICymVqPWy81/zxIjCdiOecfTaUwdM0NOF26tucqW2LwiZVw/Id6lOJ2I
	X+RF22fA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCtx-0000000Dfcl-1Slq
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 14:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9578408B5;
	Fri, 10 Apr 2026 14:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA419C2BC87;
	Fri, 10 Apr 2026 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831523;
	bh=25xPWzxiGr4LHVrhwE7A6wdqd8RHpKmiF28MPO0r6nE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tqGN2qePD9xAh3Pj3AGoPKMZhuIq5LHCILZITbTkgSeoYaOubddRaNn55X/LJ11lk
	 QmJAx0/SG/k9UE2DrIOYC+Na+Y3k7QmSpEo5zLExPRO0OOE6czkClBkwwlcRjYOOB1
	 AK8cK+rg6AKZt+Hh223VAYbYopaIbHmtt7oeDNoU3OH9tRh4ixIM698eT5PcPx6m9A
	 EIq5SQkX26V9rxhPipdu5CctuRM195kmo29QW8uwqLnmSAyAfjxxBg9+z3WUZ2qWsd
	 MpfbWAGNzKcTm+H313Ah+ogX/bDyCwHC5MZUtAAalRhf6Kn3x9SZzWXyXwOL+XLCLa
	 58hOvhP84Xt3g==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
In-Reply-To: <20260410090106.622781-4-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:32:00 +0200
Message-ID: <87a4va28f3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_153205_653203_D72B03D6 
X-CRM114-Status: UNSURE (   5.56  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:
> -	irqc->base = of_iomap(intc, 0);
> +	irqc->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (!irqc->base) {
> -		pr_err("Unable to map registers\n");
> +		dev_err(&pdev->dev, "unable to map registers\n");
>  		ret = -ENXIO;
>  		goto err_free;

You can eliminate err_free as well by doing:

    struct startfive_irq_chip *irqc __free(kfree) = kzalloc_obj(*irqc);

    ....
    dev_info(..);

    retain_and_null_ptr(irqc);
    return 0;

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
