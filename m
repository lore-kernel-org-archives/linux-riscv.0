Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E882C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 09:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D1361A13
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D1361A13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EcD8s7sbeY6wpIxm9n6mLoxjIJAGj9eZZ+kfa2GTF8E=; b=ol3iMQB62zSBRdpNLxlu2su7o
	+N7x5fD9DWJy1lbQDg0j0Ej2lYqlut9L9VzF6Fgo3FYrIGRQHqDI+mU/I72aEjQlh1Ogo3wxJk9R2
	H0fMdl+UkR7unw4z8t/mGVsetXaW8oOgqaTJUt5zlSpaStOKZ9i1ufJIbpguCSKCzZ+Cl0iMC6iWs
	wLWyxePRh9bwpInFYSqbk7ICRCm9ulqnj6owXdBRVpk1Corbjgdv6c6Q8Wnh4QEqyoI5MWAOfjBGo
	1u1+1MOnRE5XAsvUJcukFtAkeVHsWxhUGIEmn1mMAk9ILdMMXqOr4wh1tjFHGJ/keCQDvTYkW5fhq
	TxNLSvIXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPMMO-0016RS-KQ; Thu, 25 Mar 2021 09:33:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPMHF-0015CO-8A
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 09:27:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id f26so2217990ljp.8
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsHdTvG/QnL/RMsV0A6gUhCQmyonTHg1LR33V9IaQI0=;
 b=hnSnZtQTEM48kP52tFUl98D3BvVRhgU+MU+zZy0+v5+cLblLERQsxgffOKscuDuk3m
 0Olwlf6QAEJgAgmNI9vqkN6ZmW4k52se0TtUIyCNlQiR06axgKo8KrRN06ogsVz9yfGo
 vErqgGYdxq3ToQ/mnevJUK2wgkY/AQOiKYbh4/k2EtHxX0/kTORXR/YqvQs1C9J6xusO
 9Z9PYmAFK2nM50gF+mkQyZXUp8APc7f5AcyGt0wGAxa8fBew7cpPxKHNA6rynpToGkag
 muZy2GHLB50nZ9TVpuOPOxloKLVCLGqcsBoggfGm6fDCke5Qc1d/k62mEqw8Q3mqVXPS
 t0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsHdTvG/QnL/RMsV0A6gUhCQmyonTHg1LR33V9IaQI0=;
 b=Nq9H+qmFgSHSXbXAupaDyfVKA32PNl8ZeUivI0bpPg6FBgchQGnz6/CwED7yw4XdN0
 S/xUcF4//KgLh7+cYxglw0rEifk+kDE4OQroP7UyC8cMzineHSuguP5EIpwl6X9U0Ajl
 TLye4WvJKE3EkSPLQul9pdl9RNuLvc3l/nzLWn5uLQaZYZRRKaStTOgWkRpGk5RymAZF
 O0lMtl4qBWhI4w2yG/ZA0eJ53HG9GU8l1DwM0iGAMRcE20XhdRn0VoH+/bbkDmkzHSQu
 WHJCUYtpsf96AozDQH8Hq2/7m0teAskkdLG01DpXe40OVAS/l413j3Bqhn3zBIGH5Ejp
 CQXQ==
X-Gm-Message-State: AOAM5318BCqWEeTytKCtqptifmBHukgkxnkolr/dTYzZSEL9T4L4GvBv
 YZSlOOYIZEX5XImBjgfxcAh8R/bo97ruIZGsuBu+Eg==
X-Google-Smtp-Source: ABdhPJxa8BhcHz0FA2PXr6I2mYN+MNsgGHXLC5Ew+Y/aWPtsb3Ri0CK0CzggWptQnMrGEMid2pK+Ky60HOeRIbawnLc=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr4931647ljc.200.1616664460376; 
 Thu, 25 Mar 2021 02:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210323013727.135571-1-wanjiabing@vivo.com>
In-Reply-To: <20210323013727.135571-1-wanjiabing@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Mar 2021 10:27:29 +0100
Message-ID: <CACRpkdaMpSDQduyTHPGvyo4NC07uvfTBcmhPiodOsJ929QxMfg@mail.gmail.com>
Subject: Re: [PATCH] drivers: pinctrl: Remove duplicate include of io.h
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kael_w@yeah.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_092742_924321_55B58C53 
X-CRM114-Status: UNSURE (   7.49  )
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

On Tue, Mar 23, 2021 at 2:37 AM Wan Jiabing <wanjiabing@vivo.com> wrote:

> linux/io.h has been included at line 6, so remove the
> duplicate include at line 18.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
