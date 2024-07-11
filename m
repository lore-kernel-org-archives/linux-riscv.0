Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF37C3271E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 06:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv2BqhyB1IRFYa/9fO/Hv+pAO+wRzoKoPaq6MbOqjb8=; b=l4sqSrdqiE/iah
	Ibxkd1Cc+LGQnqqznJb58uJYJsRclcWiUANfO2fANTIDu1LS84zpn8Tb1JGug7AC6mOP2GCsQxxrq
	6emvvLDaOBU2/pOitskaoSBHX0m7YUvVPbxNpDgnYER/T8wR7pITnXBJ98LkmTW0NoBrvRsfcjm3V
	SlHRg/i12PN9OHhm4QhZwE83sr4MidjIWWNFhC54suXpbXvREpSlfZK3g0xLjT6MvJ1L3U1dktxaT
	SEXF6kcwT58oWoc56LtyS0hwZx7chZRCbO5x7mnbj4a/puQtfmxiAaer91hBR47mWnGSo/9I8kIXC
	WwNh6M45HtLmsJhQMdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRniT-0000000Cx4g-3Fr7;
	Thu, 11 Jul 2024 06:55:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRniQ-0000000Cx3f-2TWy
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 06:55:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fa55dbf2e7so3071535ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720680941; x=1721285741; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qj5fKPvxGvM7Ufw7p7EXOjC4sCCpwaohueruAgBqnWk=;
        b=HE6t5n5mZPNUuAFxVqah9ghJVrLrz8md5bEklsIMQB7v8LMqt/n2yHc262alfr4EdE
         sZ9XZUMKXlJzEpxWxWA+Y6GreuzS6dz3iA6oDdV3CNZ+AqdL0xjibb3ckvPI1MDoWxyV
         +1EzCe6t9yHQfSZtcFb0G76kyiFykafe+fxrAYcFWvPl9dxgghBHKLpdAILJUA0Ox3rp
         uJpC+cWfBXFTRc5Mh+b90BzUq2n3WNVTUFBWnhh9LSjTYP0jasb6+dWy9WK+iIfiGYu2
         Hce/UGyXrHPioMrkw5VVFP+mAa0LRcc4xJmrfqZEYR9ZhZ5N/dn/P172CPdxS8mlox5a
         Xorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720680941; x=1721285741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj5fKPvxGvM7Ufw7p7EXOjC4sCCpwaohueruAgBqnWk=;
        b=efagH3vwimZZCTZBQnY711BA6+EY2Tq+CFAGxT2CPAAF0WgWUI1MKvjAonugcKTE9w
         5MUfmyeXheqJPF/1aRndxcCB1i6YxDjG4i6ygc3h7fxKKUHJslUElRCsi1WPZz96iUpk
         cq1QdjNOu2ewKycs6MR0i1OQ7aOgfUcTP9Lrpu++e2MrkX3x0sqM5F/2AvK3PTozwGTv
         igtoYjamntEEIk6yWTVEZs2zieHrJqFzQynjWlAmNMONCptEKvEyNcaqU4HWUyICtNMW
         73+YLaaKQekhS2cAUkixX9udbtcffnIrjkeJgNMsR/HSjHVJzkwp94q4sggn1mVA/nWY
         sw+A==
X-Forwarded-Encrypted: i=1; AJvYcCWH3vcjvQhzVwW8ZkqiGSs4O/LxCyZl5Ln68Ci0hgleEDNihLbFh8Hp3+Oc+lJ0ExoDk3yn1dRjEaZanVP9plcSzx46UAyOkEktUDZUmlRJ
X-Gm-Message-State: AOJu0YzuDbSqXGJwxq/Vo8FXAtqkrxwyTZoHr22m/ztxwQo2xHk/M3yZ
	KL7xB7PdHC43FbGiUXE5f0vs4fbYKdnD67K/Yi+9jBkNw8j6bZkrW2eEgm6Fbzw=
X-Google-Smtp-Source: AGHT+IGb4ybc/OK3k0d6iCqvD55Ro9+I1kKUFnh6M3hL2RGrJ7WIIrCEMAeRoySTG0NPFBmMi9Af/g==
X-Received: by 2002:a17:902:e2c5:b0:1fb:64da:b13a with SMTP id d9443c01a7336-1fbb6ec5f62mr49719405ad.59.1720680941493;
        Wed, 10 Jul 2024 23:55:41 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a11a4csm43497305ad.15.2024.07.10.23.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 23:55:41 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:55:39 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] clk: thead: Add support for T-Head TH1520
 AP_SUBSYS clocks
Message-ID: <Zo+B6yzFwRwSkPpH@x1>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-2-ad8d6432d9fb@tenstorrent.com>
 <d36ff27b56b3e9c8ef490bfd9d24761d.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d36ff27b56b3e9c8ef490bfd9d24761d.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_235542_668468_4BC5C903 
X-CRM114-Status: GOOD (  25.50  )
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

On Wed, Jul 10, 2024 at 04:17:12PM -0700, Stephen Boyd wrote:
> Quoting Drew Fustini (2024-06-23 19:12:32)
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > new file mode 100644
> > index 000000000000..982d4d40f783
> > --- /dev/null
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -0,0 +1,1086 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> > + *  Authors: Yangtao Li <frank.li@vivo.com>
> > + */
> > +
> > +#include <dt-bindings/clock/thead,th1520-clk-ap.h>
> 
> Preferably include dt-bindings after linux includes.

Okay, I will move it.

> 
> > +#include <linux/bitfield.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
> > +#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
> > +#define TH1520_PLL_FBDIV       GENMASK(19, 8)
> > +#define TH1520_PLL_REFDIV      GENMASK(5, 0)
> > +#define TH1520_PLL_BYPASS      BIT(30)
> > +#define TH1520_PLL_DSMPD       BIT(24)
> > +#define TH1520_PLL_FRAC                GENMASK(23, 0)
> > +#define TH1520_PLL_FRAC_BITS    24
> [...]
> > +
> > +static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
> > +                                               unsigned long parent_rate)
> > +{
> > +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > +       unsigned long div, mul, frac, rate = parent_rate;
> > +       unsigned int cfg0, cfg1;
> > +
> > +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> > +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> > +
> > +       mul = FIELD_GET(TH1520_PLL_FBDIV, cfg0);
> > +       div = FIELD_GET(TH1520_PLL_REFDIV, cfg0);
> > +       if (!(cfg1 & TH1520_PLL_DSMPD)) {
> > +               mul <<= TH1520_PLL_FRAC_BITS;
> > +               frac = FIELD_GET(TH1520_PLL_FRAC, cfg1);
> > +               mul += frac;
> > +               div <<= TH1520_PLL_FRAC_BITS;
> > +       }
> > +       rate = parent_rate * mul;
> > +       do_div(rate, div);
> 
> 'rate' is only unsigned long, so do_div() isn't needed here. Perhaps if
> 'parent_rate * mul' can overflow 32-bits then 'rate' should be
> u64.

Thanks for pointing that out. I will make 'rate' u64 as I believe
'parent_rate * mul' could overflow:

The ref clock for all the PLLs on this SoC is intended to be 24 MHz
(section 4.3.2 PLL Resources [1]). Thus it is expected that parent_rate
will use 24 bits.

'mul' is set to TH1520_PLL_FBDIV which is 12 bits. In DSMPD mode, 'mul'
gets shifted left by TH1520_PLL_FRAC_BITS which is 24 bits.

> > +       return rate;
> > +}
> > +
> > +static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
> > +                                                   unsigned long parent_rate)
> > +{
> > +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > +       unsigned long rate = parent_rate;
> > +       unsigned int cfg0, cfg1;
> > +
> > +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> > +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> > +
> > +       if (cfg1 & TH1520_PLL_BYPASS)
> > +               return rate;
> > +
> > +       do_div(rate, FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
> 
> Same, 'rate' is unsigned long. Did you get some compilation error
> without this? How big is the divisor going to be? The fields are only
> 3-bits wide, so the multiplication would fit into a u32 just fine. Given
> that 'rate' is unsigned long though I think you can just put the
> multiplication result into a local variable that's also unsigned long
> and then just write the divide with unsigned longs
> 
> 	div = FIELD_GET(...) * FIELD_GET(...);
> 
> 	return rate / div;

I didn't get any compiler errors. I had copied do_div() from another
driver that I was looking at.

You are right that TH1520_PLL_POSTDIV1 and TH1520_PLL_POSTDIV2 are both
just 3 bits each. Thus I think the maximum divisor is 64. I'll change
to the simpler "rate / div" that you suggest.

> > +                    FIELD_GET(TH1520_PLL_POSTDIV2, cfg0));
> > +
> > +       return rate;
> > +}
> > +
> > +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> > +                                        unsigned long parent_rate)
> > +{
> > +       unsigned long rate = parent_rate;
> > +
> > +       rate = th1520_pll_vco_recalc_rate(hw, rate);
> > +       rate = th1520_pll_postdiv_recalc_rate(hw, rate);
> > +
> > +       return rate;
> > +}
> 
> Please fold this in

Will do.

Thanks for the review,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
