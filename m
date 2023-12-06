Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94E8C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xyFL8IqLA51UPpyRu/DeCvIi0Sd5KT82S1RKEHRf1t4=; b=rTlY7FpvWldYNDnlzvV4h6V/aG
	FBU7pzDCqOa6qPMGuBskHCNs+HAilW9XAGFL8yNcER/JzXutRugYfHhvy/i5OigE57CsVdHnFu6p4
	KWMTWoJTXNP/UPx1BS+odDwRzhsBqW/H7fr7EbOZ/a1zvdinLNe5Qvlvko2aapoDP/8jOcpLXY8we
	Jo8Tgj2fCwlqbrH/20sWsrDlDdV9dbF9tup40wi7MSMG+vG/culfTq+CVlDMVDqtQs/YD/mCCJAld
	ZMK7XsttzNgxQIIeZ4oGpUmghtElXuTyhBOZZVbuGiQ4Aj0WB85Fw5KyFMrguvY4LuxAqphwbIhnH
	p+HJgf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp5N-009jXz-1l;
	Wed, 06 Dec 2023 10:24:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp5K-009jWZ-0V
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 10:24:56 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3A2093FAE8
	for <linux-riscv@lists.infradead.org>; Wed,  6 Dec 2023 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701858288;
	bh=LIKhW4ss/YSZZ/5dNTu3+bUFxFWLLuAd/satadt/iyM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cD+d5TB5FjLMIaJ+4CDCRRuCO8TyFw4N4NW/vFZnSxdkQDjdWvA61c1Q2mBI96hLE
	 0FFT+mpSbBLUQHAJh76m4ps1rFHMfqZbqYDhAoDvB4yIj4lI2gb5MP9/QjT7YhqDda
	 cbhR4wyZs46ehGhiC71/cnjYx5rmolvHc5QDX87sdgWaNH7FwxO2wC7Uasl9xrl0o4
	 ofWJgdtbcbUvc5QSELsS8Y9d+B7wF/N0FaEFHxU1/p4LuVAtVU2fQH5Fydjl3L+N3Q
	 dDi42H6jjQfLqjo4RWvWB0134gR9/ot8eVuctfFCj6gv/kDqgaba96hoWnLUaIiF84
	 c88L5TZalnnSg==
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ca06829ad2so4384581fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 02:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858287; x=1702463087;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIKhW4ss/YSZZ/5dNTu3+bUFxFWLLuAd/satadt/iyM=;
        b=iR/8VM/ZUEblwdGgqQ3fkqSVdK8WFAC1W/WKnbHAAgn4nQqB3c+fYgRhPC4lGC2ysZ
         BSXcPwGl0/XCC5NhkJyrJTqi2lso/TrTkAxIJFbEyPZfYp4CymZCAwy8BfBdY6HkYFA5
         +KQ7aJ73Jl20HA5vDfWt5SbbPXUZkQuRKpKI/pNPdIobR+NOBCoOpHFNBlrekrBRQniu
         4nDy/UmtA5XOlSFoLTlAS65Q7exeRQBihvkrSVF6jhdlK7gCrUxOnLGeTURvFchaZT+K
         kI0wvDRXVJlwSqL9TcbKwLU8GtD8lA3CWRyrnraRHaycl8jVCX74U7nLb3pw2a3sTDJ5
         DuKQ==
X-Gm-Message-State: AOJu0Yz2KPb+3QWRCJJ+iO+f2Yva+LyYaYNMsxxnhuvPmSxcdm2Q3Di8
	w6THAYKTVwsX4zduCxc5Jc1XmCvKM5V/isVbRZ41N/SwiWNy1GX/aJRut8l63DJ4ahvp6K9cMNw
	YvGR/ZENcKfxPh9GrbYs3j29h7nA3N/yDmIunzmr+vRGIhzBo3veKt8mq6mTRpg==
X-Received: by 2002:a2e:a30d:0:b0:2c9:f59d:36b8 with SMTP id l13-20020a2ea30d000000b002c9f59d36b8mr512526lje.8.1701858287655;
        Wed, 06 Dec 2023 02:24:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCeINFJy0uhVhrZBDH15wYnuutrQXQWc7tS3R3VsQ92NNxf1Fzl+nhQI6LO6WIc+v6/wFypP12KWEtfWYx+EA=
X-Received: by 2002:a2e:a30d:0:b0:2c9:f59d:36b8 with SMTP id
 l13-20020a2ea30d000000b002c9f59d36b8mr512512lje.8.1701858287360; Wed, 06 Dec
 2023 02:24:47 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:24:46 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB49532959D6D95B0D9D5E6A4ABB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <MA0P287MB03329157B1914F38A3485402FE84A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49532959D6D95B0D9D5E6A4ABB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:24:46 -0600
Message-ID: <CAJM55Z9CCH3n5g4_cRid-inr0SU_Kk39AhbrCavGJKhOoz=asw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: sophgo: Add CV1800 series clock controller driver
To: Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_022454_589327_F20643E6 
X-CRM114-Status: GOOD (  24.83  )
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

Inochi Amaoto wrote:
> >
> >On 2023/12/5 19:55, Inochi Amaoto wrote:
> >> Add driver for CV1800 series clock controller.
> >Add more clarification on your changes. Seems you add several files with different names for different products, what's your design idea, please add some brief introduction.
>
> In fact, it just adds the driver for the whole CV18XX series. I do not
> think its clock controller has something different for different product.
> The CV181X does have more clock, but it shares the same driver code of
> CV180X. All the things just follow the manual and are for the hardware
> design. Anyway, I will have a try.
>
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV180X-Clock-v1.xlsx
> >> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> >> ---
> >> ......
> >> diff --git a/drivers/clk/sophgo/Kconfig b/drivers/clk/sophgo/Kconfig
> >> new file mode 100644
> >> index 000000000000..243d58a30117
> >> --- /dev/null
> >> +++ b/drivers/clk/sophgo/Kconfig
> >> @@ -0,0 +1,7 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +# common clock support for SOPHGO SoC family.
> >Drop this comment line, moving forward, this Kconfig file will be re-used for more different sophgo products.
>
> Why? I do not think this have some impact on reuse.
>
> >> +
> >> +config CLK_SOPHGO_CV1800
> >> +    tristate "Support for the Sophgo CV1800 series SoCs clock controller"
> >> +    default y
> >> +    depends on ARCH_SOPHGO || COMPILE_TEST
> >Suggest to add some help words for this config item.
> >
>
> There is no extra information other than this title.
> In fact, I think the description title is enough to describe this. Add
> a duplicate help is useless.

I'd also like to see some more information here. Eg. what are examples of SoC's
in the CV1800 series. checkpatch also complains:

WARNING: please write a help paragraph that fully describes the config symbol
#337: FILE: drivers/clk/sophgo/Kconfig:4:
+config CLK_SOPHGO_CV1800
+	tristate "Support for the Sophgo CV1800 series SoCs clock controller"
+	default y
+	depends on ARCH_SOPHGO || COMPILE_TEST


Also the driver says "tristate" here, but defaults to built-in. If it works as
a module it should be default m to not waste memory on systems not needing this.
If it can't work properly as a module then tristate should be bool and the
driver should be updated for that.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
