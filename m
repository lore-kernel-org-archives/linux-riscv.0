Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C723C282D1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3P27MtuVsmzdwh8IAcSgj9SOnR9Ewb+EV2KVcy1d9c=; b=YKvQEhzIDtzCss
	GK3vyaEpyZy89RFoef+1oBeZ6ACZUZ6ooUZVlrqMeNq6GEU0+4RFyv2Oo47q+i5oF8DnxR6oxZsy5
	8qECNLgpoPrIg6DwILNvfSupcV5ZoSgeCEVH+NoISVuX3I79crp51Plvz6yKWVl9Fvhe/E5uh19i1
	vMGZBKhjnpQpsxV1vd4TB1Dl1D5clFegiFXVXdj8BCACnUK0nfxKbkyG0WP5J4TbLGVNVRk3/wLbZ
	0c6XDnV0Zwf9TpfLcOvkRkcQYpWoQk2/mAG0jOmx+mVbnG5FWusivrX0rKIruNkJ4UKrrtjCcE1Tr
	P8PmHJc4reR/mp6yVTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6lk-000000016Qx-1Xys;
	Mon, 03 Mar 2025 14:27:44 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6VG-000000012GR-3GdA
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 14:10:44 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-855b2a5ad32so150352939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 06:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1741011040; x=1741615840; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrwhJR5XVjeuOKMty1HTRitd46iSfsnGbIHub1a6zjU=;
        b=wCKIOvu7WPZClh4dZB56O3DKQjwU1H4+sTPls1mGXGHvd7SwT3A1ISRWVcmyL/owyq
         +r1s2c9cUDsyxY4VYkxOqUgMvv7ebAnhuPRnCBbmUrsNDGRLB/6v16waz2MScV0/mozo
         FHIrB70Fxc/A6QzTqgV8DirmNiT5Qdo4dYNmlQPbMf1zZ2JEvZK/l9NlyOC4zSpKaebr
         UpPBaaYFcHAw6XkdyqFKf5LUvxgzADKAvz9uoxO+Sy99DWSZJG/a37Mpgr4+UsVcOpE2
         Yq1T2BmtGYFUy2sZgoC8sBp5+wz3rvEhU/4eRWdl4wB6x0UVOAEp2XxthC/7KVKbu6ZV
         QILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011040; x=1741615840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrwhJR5XVjeuOKMty1HTRitd46iSfsnGbIHub1a6zjU=;
        b=ilTHybAFAtv2/6PNT+5uVv5ePMnVIxQC21d7xilpwm/ofF618MiZDPGPAcD9A9vcF/
         kVtihig5btxJgxvlCr8BCQjGfXRO7f4MoRpSOMhdrHvgk+4z439JzNvaahkhxim57NFJ
         aOOM3i3SME701RZU+UntiJL8buNr3fTJHuoqnX7cpnNB75xR0UCkro/eq4Q5DVrPzFZe
         k58dz5Wb1snViYzL/vwDjdo1qKvQa1d0nhanxUBOna168FjByVGtqcxw/9r+gz5VSRiy
         iKIZSbEp/7zm7UKLf0QqksdW1WqS9JJpXzeSfubbrq9YUaWklGS/APqIjXlVoTwfFi8F
         kXnw==
X-Gm-Message-State: AOJu0Yx0bQAtuFekK3gTAdRmA3egziuFbOA9QGqQII39p7n8G13ZiQ/S
	HHAPZ77adq10oEd00rL1TGOZsDgMMf1Ibf0nYEfQgDaxfEtc+XSwEBEpmTEMj18=
X-Gm-Gg: ASbGnctXQ0/3hrAJ88RQHPOSWG0kAkfiNraiK2LCKz1A8KjdPeo6aZ6VLCTx59p3ZDx
	oW3XUqmSL0MUK44SWSOxR4AfG/Y4ePrEEIYIPERkthEG3ecRtP5ViCioY+SuCDBI7LhKlEJSteE
	6EXB2DJooVeTERXi32pZ3IkCoH4ZdnwO9yDoq4XfvkPs/Sri/1mupQTndyAwKceBj47YPqPc7pP
	rJ8wZcAW9FvbMq6r2qFGNGpfulQLyaRTAPB4KNm7qMj79V2Gjieg13faMYxQtSHOAPu9az68p0R
	XjPpGogxl76Ao5gFcVBu2zXSwhE6E45VMlQCFr/mN2yxpKUIySfxCFV+2NMDmK2X21KVPlJBD7m
	y6qVE2UKs
X-Google-Smtp-Source: AGHT+IGN/6Wuw5ntiwHBSo1Y/sRm+1DKl1diOGW2BTS+FWQlOXMwdhDgI7em04WI3UtWDvgvTpPB4g==
X-Received: by 2002:a05:6602:1604:b0:855:690e:ed8f with SMTP id ca18e2360f4ac-85881ff0edfmr1228718139f.12.1741011039763;
        Mon, 03 Mar 2025 06:10:39 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f09d8cb493sm382508173.75.2025.03.03.06.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:10:39 -0800 (PST)
Message-ID: <d9db0821-1cb8-43bc-81d3-d511ee164e91@riscstar.com>
Date: Mon, 3 Mar 2025 08:10:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] clk: spacemit: Add clock support for Spacemit K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-5-heylenay@4d2.org>
 <f8b30551-25e7-4626-8c03-6d8807041d8a@riscstar.com>
 <Z8V5OjQTxVeRLAOU@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z8V5OjQTxVeRLAOU@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_061043_085078_E71FD2B8 
X-CRM114-Status: GOOD (  31.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/3/25 3:41 AM, Haylen Chu wrote:
> On Thu, Feb 13, 2025 at 10:04:10PM -0600, Alex Elder wrote:
>> On 1/3/25 3:56 PM, Haylen Chu wrote:
>>> The clock tree of K1 SoC contains three main types of clock hardware
>>> (PLL/DDN/MIX) and is managed by several independent controllers in
>>> different SoC parts (APBC, APBS and etc.), thus different compatible
>>> strings are added to distinguish them.
>>>
>>> Some controllers may share IO region with reset controller and other low
>>> speed peripherals like watchdog, so all register operations are done
>>> through regmap to avoid competition.
>>>
>>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
>>
>> This is a really big patch (over 3000 lines), and a fairly large
>> amount of code to review.  But I've given it a really thorough
>> read and I have a *lot* of review comments for you to consider.
>>
>> First, a few top-level comments.
>> - This driver is very comprehensive.  It represents essentially
>>    *all* of the clocks in the tree diagram shown here:
>> https://developer.spacemit.com/resource/file/images?fileName=DkWGb4ed7oAziVxE6PIcbjTLnpd.png
>>    (I can tell you what's missing but I don't think it matters.)
>> - In almost all cases, the names of the clocks match the names
>>    shown in that diagram, which is very helpful.
>> - All of the clocks are implemented using "custom" clock
>>    implementations.  I'm fairly certain that almost all of
>>    them can use standard clock framework types instead
>>    (fixed-rate, fixed-factor, fractional-divider, mux, and
>>    composite).  But for now I think there are other things
>>    more important to improve.
>> - A great deal of my commentary below is simply saying that the
>>    code is more complex than necessary.  Some simple (though
>>    widespread) refactoring would improve things a lot.  And
>>    some of the definitions can be done without having to
>>    specify nearly so many values.
>> - Much of what might be considered generality in the
>>    implementation actually isn't needed, because it isn't used.
>>    This is especially true given that there are essentially no
>>    clocks left unspecified for the K1 SoC.
>> - Once the refactoring I suggest has been done, I expect
>>    that more opportunities for simplification and cleanup will
>>    become obvious; we'll see.
>> - I suggest these changes because the resulting simplicity
>>    will make the code much more understandable and maintainable
>>    in the long term.  And if it's simpler to understand, it
>>    should be easier for a maintainer to accept.
>>
>> I'm not going to comment on the things related to Device Tree
>> that have already been mentioned, nor on the Makefile or Kconfig,
>> etc.  I'm focusing just on the code.
>>
>>> ---
>>>    drivers/clk/Kconfig               |    1 +
>>>    drivers/clk/Makefile              |    1 +
>>>    drivers/clk/spacemit/Kconfig      |   20 +
>>>    drivers/clk/spacemit/Makefile     |    5 +
>>>    drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
>>>    drivers/clk/spacemit/ccu_common.h |   51 +
>>>    drivers/clk/spacemit/ccu_ddn.c    |  140 +++
>>>    drivers/clk/spacemit/ccu_ddn.h    |   84 ++
>>>    drivers/clk/spacemit/ccu_mix.c    |  304 +++++
>>>    drivers/clk/spacemit/ccu_mix.h    |  309 +++++
>>>    drivers/clk/spacemit/ccu_pll.c    |  189 ++++
>>>    drivers/clk/spacemit/ccu_pll.h    |   80 ++
>>>    12 files changed, 2931 insertions(+)
>>>    create mode 100644 drivers/clk/spacemit/Kconfig
>>>    create mode 100644 drivers/clk/spacemit/Makefile
>>>    create mode 100644 drivers/clk/spacemit/ccu-k1.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_common.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_mix.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_mix.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_pll.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_pll.h
>>>
> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>>> new file mode 100644
>>> index 000000000000..6fb0a12ec261
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> The next set of clocks differ from essentially all others, in that
>> they don't encode their frequency in the name.  I.e., I would expect
>> the first one to be named pll1_d2_1228p8.
> 
> I found this change may not be possible: with the frequency appended,
> their names conflict with another set of MPMU gates.

OK, that's fine, and perhaps is why it was done this way.  Thanks
for checking.   I look forward to the next version of the series.

					-Alex

> 
>>
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d2, "pll1_d2", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(1), BIT(1), 0, 2, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d3, "pll1_d3", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(2), BIT(2), 0, 3, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d4, "pll1_d4", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(3), BIT(3), 0, 4, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d5, "pll1_d5", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(4), BIT(4), 0, 5, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d6, "pll1_d6", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(5), BIT(5), 0, 6, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d7, "pll1_d7", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(6), BIT(6), 0, 7, 1, 0);
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d8, "pll1_d8", CCU_PARENT_HW(pll1),
>>> +			      APB_SPARE2_REG,
>>> +			      BIT(7), BIT(7), 0, 8, 1, 0);
>>> +
> 
> ...
> 
>>> +/*	MPMU clocks start	*/
> 
> ...
> 
>>> +static CCU_GATE_DEFINE(pll1_d3_819p2, "pll1_d3_819p2", CCU_PARENT_HW(pll1_d3),
>>> +		       MPMU_ACGR,
>>> +		       BIT(14), BIT(14), 0, 0);
>>> +
>>> +static CCU_GATE_DEFINE(pll1_d2_1228p8, "pll1_d2_1228p8", CCU_PARENT_HW(pll1_d2),
>>> +		       MPMU_ACGR,
>>> +		       BIT(16), BIT(16), 0, 0);
> 
> Here're the conflicts.
> 
> Although they don't happen on all the clocks, I prefer to keep the clock
> names as is for now to keep the consistency.
> 
> Thanks,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
