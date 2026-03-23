Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E6F4613C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOmKfjwNM11ZbtybZyC5LwmMLMgbvwuttfrF6BzHUBM=; b=NoynTstSRQ5ZTS
	oKOpC1ItZ2iPGQHLVfb4qjtnYu7jSrVSapiDlX3AaONh2fFdx8cOC6/BM0lLHNK+sClUJvB2bB4ax
	urIKsVjAHQcES6UE8vOwFIJEsi7Wvfic1KQrySdKAY43vv9LaS3wpFsRIalsC30EUmNlxPGORq1Au
	xXELzghqJ6vQEyT5sWwFSDBLdHB987wibamuqqVTlIrZJnSZwS0Izx6ZHRT9wxQedCqb9RQMg6DPY
	uZYT6v5MrXaVedHK48zFlUwrIycplFWhQu4J+xukn4M3sffLksJu+F0dOfMWrUbSrsQz2R5cimhkO
	m/9K8vvGyPrnZ/66rEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h4c-0000000H1KC-1Yhs;
	Mon, 23 Mar 2026 15:20:10 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h4Z-0000000H1JI-3Zgm
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 15:20:09 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so3370545e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 08:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279206; cv=none;
        d=google.com; s=arc-20240605;
        b=Hhoxc8PfhvjwRVg8fzhpGm84/sjb0BhKH1elaBGh4+uvYflKb/ZNec9OF0WqdFOsJB
         ChjPWPLJBzRqp5nwZ3Kv57iX3IIQHnFPc023HsnzHl5AI6k5bbWMnmGj716svpwv8LB9
         FlZ2Wq7pfI8133sRf54jxHCkmMyS5b0vIvWzzuG8tNqRXzFi7N5fE5c6GJAA0s5jonG1
         TXPEMiKul3bBIKpTT3EoCAoLsXBJAv0CC6htc3XF51U+Z0y6YTTlKV7I3aiO5VFp+sUZ
         WY/YInNN2SbSxFoOlAMl+E4vqX6pU/v0EctbejCym5fy0dcTGTUZ9ErRxK7v0ecbwhDW
         ug6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        fh=imHuTeQsNdWJJIMEaXmn5goGYwRnOx+VhpEkAf323Us=;
        b=MICWGH+YJce+JwGbFNhHrvROBHiJwQhxUqylJ1zwSV6FoAin/ttOZuOHszbd2yFzoe
         8e9xOxOiJA4QV7XhEJAO6tfEWg//FE0xzCZnUa+eoZ+fH0GxfY3TMgXXJvfc/2WGTrKM
         cD3IZc1E42G+2kojCdj1rt6UurZ594uWBV1XakYBlXxc9UYlRYdnvzRa0ydxGO/Nfj5M
         UbvkVO9hLXYDCTseAahzwqOKSOUqRz2TSWccqu+rXU6/bv3BPfmtvm8bu4NT6s4oH4RO
         174sZLeKabEh+zHMu1esguPIGHZ6tKHwD2XL3R604qpgDhYnsEM1cdEEGt1PXh38LpYv
         sRpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279206; x=1774884006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        b=y4AKQlRnJ8QHEUfV0syIh4h/fOgdf/NyuLmN9pPa7vMJGz1cOU5VGVEsl02ENIE9Zs
         y20OuBm66lT77Wc0VaTCDa67N+Xm1tqFp/e2dD30osn8dqXFgYWYUjFAkfX47a7Bai1b
         a/rNm+Bv6CuPAa/jBLrcJQAgGmfVBVlp6tZDS9QeFe77+21cGaG4l0RYfUBOAPKo+9Iq
         +ODDf9wG4jNYh1Y89Pl98NfOyI560uYpew+EcC6GqD0Gde4jecm7Y+FlQKpDELkhE4/x
         CrbmHtaD/R/QlrEK9J7k1pcKcLBtJjOYy4er4wKZS/0RkXjJSgWwaOMG+1aozO4+VDcJ
         pDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279206; x=1774884006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFEoClYNIUTw25SNi2mfbHdMYgsaJ4yJesVezbduu2c=;
        b=Uycp62eFCEGxrPq6fU4d1nJVGXlXYfl6TvbffWqRlDxUT8kIyC/r9hGdvS6JMD3hoe
         6gR9L0Q6+cc8UoIo3d+QQWPevGO4+av6JNOO3LHAEvUx7P9z7y5TvsJmOfD0iYFlXllk
         JB9Ru6TD9nZ03wvMkD7cPjd2rTpmc3FAQZHxzxVTijAXshfURz0Z5uU8yetOL1Bps5Z1
         6xFqvRdJPuJWvHvtrsocjnHWaEcapaTO4mgzoHwaOfv9FVVMU8RFdgNsbevjgT+HAQG8
         0eqH3x8V6qOKLIQjtYa4IZQpHK5VWjeZm8rbmncVdvb13f9HUoUGt4rC/UeEBJnh9GmP
         hueg==
X-Forwarded-Encrypted: i=1; AJvYcCWSlSdrCPRFO4PHOQSJMGuq06DBjY30cH9PFj+PIOSX/B6DvnIYHioLa1JWrjTE+6KvxlgNnAxe/xd2xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsgpUmZi/oTEluPttg+7XPjo9mwyCrSQluwkRunqJh6y000Nxc
	OUmXmbSl8VJ5v4gq120OMjdGkDNueNkxQD8nPLG2Dwkxz91ZtuT2quRU6V7f3F+t2q6eIl0o2Tm
	LH++H3BLHcRg24Sv8CCyAgEkQ7O8zz31an6Zfnhtojw==
X-Gm-Gg: ATEYQzxS+ZG3t9YBTvh+Ur6ude8y0vkNJFzTVxuWBD9Vi93zZWeKS1vNRb71eNslxhD
	MTtk7FPpvrgCX2iaKU2EmW5ipj/YWekkBGbxHw8VbXEKymk/jfvPC4wtuylIdiA6d6UHvpJ9mM1
	oGCP62lGrv9UCCWtVCQqEUvWELo9nSqlTK4VT0HhuoWNTk5e/ZpU3bzpetlAQhzfWBTw9RGZc4d
	kZhF02ITg8s0jg1UOpHsB7M+UqRzlizgRPkgJXDozzxycsGpfVbShhKXjSvpcrh1weEn+V3Pbe0
	txD9q3Mf
X-Received: by 2002:a05:6512:318f:b0:5a2:844b:d47e with SMTP id
 2adb3069b0e04-5a285aef82amr3653607e87.1.1774279205615; Mon, 23 Mar 2026
 08:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260319140705.123502-1-jiayu.riscv@isrc.iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:19:29 +0100
X-Gm-Features: AQROBzCxqxYpN265mvRUOBDK4WaVcKkSk3vYCZgRowThX_rFJS728bgruXKnriM
Message-ID: <CAPDyKFpBRjfS3QuUhLxwBAJfwg1dyraPpR6+L2RDOKj554Ytgw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add SDHCI support for Canaan K230 SoC
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: krzk@kernel.org, adrian.hunter@intel.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	gaohan@iscas.ac.cn, me@ziyao.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_082007_913502_AA74EDC7 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu, 19 Mar 2026 at 15:07, Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn> wrote:
>
> This series is based on the k230 usbphy series[1].
>
> This patch series adds SDHCI support for the Canaan K230 SoC,
> which uses Synopsys DWCMSHC SDHCI controllers, include MMC0 and MMC1.
> The hardware designs of these two controllers are different.
> The MMC0 supports eMMC, while MMC1 only supports SDIO. Detailed
> information can be found in the vendor's manual[2].
>
> From the vendor's K230 manual:
>  - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
>  - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
>    clearly says it can't handle eMMC because of pin count and limits.
>
> Therefore, there are two separate compatibles and the driver treats them
> differently.
>
> Link: https://lore.kernel.org/all/20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230_Hardware_Design_Guide.md#mmc-circuit [2]
>
> Changes in v5:
> - Drop the unnecessary line wrapping.
> - Drop k230_priv->k230_pdata.
> - Make a macro to uses container_of for pointer type conversion.
> - Add the tested-by tag.
> - Link to v4: https://lore.kernel.org/all/20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn/
>

Patch 1 and patch2 applied for next, thanks!

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
