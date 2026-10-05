Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E57CA5FCE
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sj7rSnjy6KCbXYnzKRRe1WTw0/zHbpDUlIIST03rfm4=; b=SGwNRGdLZiBJAB
	6DJr6+gOBNFXxKdudvnMW2OpOvW0ZuImTXpxCvSmK1qt3oFJXPiOXihToLsrHlt6HxzDwlMWabS5t
	TWz0SvKAF+pVHQNgl2LkXmXBZLxLq+rQ47KShgMyAroCYdrTgfHMgW1WVBfhVchUxR/wV+/7EeuVd
	jKtW1EchmMrwyXy6NxiEyqAUxs3t+LDtZIFVJ7NxM1vvWF2NzvTBxm1eQfwWd9hC3OhBt2qVFmpWB
	ZfQexKZbSaft/43Vf8nMcuaJNvEb83zH2Z9Uego9rnJ19wyFmMvqt/cB/00sq8xloFZOmWOOhhp3S
	sLPzKUQw8x1zufe4O0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDesY-0000000G02k-3hlE;
	Mon, 05 Oct 2026 09:21:02 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDesU-0000000G02C-23cb
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 09:21:01 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so5522775e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791192056; x=1791796856; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z40S/ylZZcXE7HA9H4ygNmMIKaIpP+LiRcjwv8oZ5J8=;
        b=mbHoIB1u4tGHdHF5EFqEYUfbQDMV0fgWWkRCSUj1j3/qw6qrlcFuGVglFcOnjFXBgP
         G0c7Facc1Uij5VrbXiSkvOBZLZoeHyWsAQ+YQnnJZ+EXgwXC6b+aKZouwe3FVdU0OwnM
         vwzPT+33hpDA2ZLZQ++55+urZob9qG3FjYh5CCylAZdgxzAOEimdyCuc5SQ79W0a4S7R
         O2ZliIZXGHjuVkjNX7kZPbFD9vK9BIoX3G6hLjNUn/kyGLrDXJ7DNDtGLZRlNqTl1XTT
         0yOwpu0DAjEUyKtohyt7cb9MRReXQVAMIQ2YGeX1KXuIot3MURj2+7WhH78YxvNzOpqa
         7y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192056; x=1791796856;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z40S/ylZZcXE7HA9H4ygNmMIKaIpP+LiRcjwv8oZ5J8=;
        b=hcGUpgzFgM4v7FLSb7OCi39aCarR7OQfz0uchaSF/hNxA0pvUG5mCLMlJHXggvTHPE
         ybrgdkk9vtBgw+ikF4FfqOc8immfvn9jgqRPjhsX43Ot8kaUNfmIscNVacpMfRj+Sfwk
         p3LM1F2ekZUPs61xqrXZgHzdeNhnFy9kXj1fAo4aHuCfGAxfDeVv4m5WdwwxFWh9qSgC
         ZW4drgLcN7xN2zwD9eYA+KADtXK8w7BqvmYEG8xsRkpl6P/mmVxyi72YtiV7twiwq947
         crumK9LfDBoOKt20hDj9AAx2VnkRfA/GJQjewSVg/bv/xh6NSdxoYWcA/mP3N5jj1OIY
         QlZg==
X-Forwarded-Encrypted: i=1; AKwUvBw46JPcGr625JT9EU62kFP1hDz0YZgyJSsC7MykFp5WjJX4HLLPTeqSoZMNwC0g9QWjU4TE5dn//rHzJA==@lists.infradead.org
X-Gm-Message-State: AFuF++n3EeYqEVVI4U2QGq26uDIcDAeG7ZHHKm0c2ETdhJAzRzc3vYAx
	BZvXDHzCOS7NJsT6cHTJmwJKcH+Gieqxd6z05kCEynpzSz/SSyr/v3WStdmUkbWAz5c=
X-Gm-Gg: AYBFou0APw/OvouysVKVwccAQ9MogsSqwWuvKqHknz59TdlC5AXKfengjEW2FhKPyBk
	hD5vk2B7R6mcY2Z4hxPCqZ/DDLvZynvnrgMHD31VHQ/1Ewc6tuaTJbzuthnlVygIG7FuUbMy6iA
	lAyJYdrJRKaMwSrAJQAkwgbNew7u+ahhgEiK/bempzachLtxi875N/Z65hpqWDlzGZyqpvjNy77
	6sNzkiVCiv5s2S6Qe9w5HZs16vhUkn2VBVC6OYyCu7MDrtxlQuJ8PVc+UKsr4pG3PKmaf2FOyHy
	uwEXu23qAWD3nrS27/1iab8TxKRERDRHV/bp/p7jVk2/tSGR7swYYexVe5keYfoU+bDlg8Zr2n/
	8whxhPxBNw8VdSDNebilCYkvVVY//ebw6DLD16TaTL6YR9ra7PLNYsFALnrmKRn1kg6qpHAtWpi
	SFHtGqqL87fKr5n8f/R9ta1IZlun6t/5vTP6uGrDZssL2GtsaN48hEh+XcjXHoSoMTi2Mhu9o0t
	0Iou+Rc01cNWks=
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr162795275e9.5.1791192056124;
        Mon, 05 Oct 2026 02:20:56 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm208756515e9.2.2026.10.05.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:20:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi
 Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
 <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock driver
In-Reply-To: <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
 <179075859479.1471718.5492634704694937513.b4-reply@b4>
 <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Mon, 05 Oct 2026 11:20:54 +0200
Message-ID: <1jh5j07bbd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_022058_851862_F2B4F4D3 
X-CRM114-Status: GOOD (  13.12  )
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

On Sat 03 Oct 2026 at 11:02, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

>> > +static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
>> > +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out",
>> jhb100_pll2_presets,
>> > +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
>> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out",
>> jhb100_pll3_presets,
>> > +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
>> > +		    CLK_IS_CRITICAL, false),
>> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
>> > +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
>> 
>> Please comment when adding CLK_IGNORE_UNUSED so people have an idea
>> why it is needed and how it can be removed
>
> OK, I understand that there is an intention to remove this flag. On our SoC, some clocks are 
> typically not referenced by any driver, but we don't want them to be turned off. We currently 
> use CLK_IGNORE_UNUSED to preserve their hardware-default enabled state. Perhaps in the 
> next version we will replace it with CLK_IS_CRITICAL.

CLK_IGNORE_UNUSED and CLK_IS_CRITICAL do not express the same thing both
equally need to be commented so a few years from now, we are not left
wondering why this was added.

You do not have a driver for this clock today. The fact you still *need*
that clock show maybe you should have one and maybe someone, someday,
will fix this.

>
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
