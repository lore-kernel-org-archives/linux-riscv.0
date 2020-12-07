Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22212C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 22:58:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D08239EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 22:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D08239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vm7AsUxXfGD/d4+ByBuUOiBKvJy7c8+5f7RnGcs8elw=; b=wIJ7pBAHErnyW/be4meFsWSYa
	ZUr0STPZaQ/gFniaHJ7agxGsABe55mAKpAdaseFoiw8I/W1shQ4A/rWSyrsBserMR4OhQrMYnpQpc
	RdLPJG4/WX3vlSxqp8XaLEmNRlRzc8AofeWQGUysfR6Ff0rbnckkIZanP6E8OKGawNGhQcqOVoyed
	X5EMcsqf6s67P2L32CPob0JkYXholGrMwDtqyMnR6Ve/JXCMMDvD8B2FMo4HLjyRzqrWXGJZPIGJO
	iY1yH5F7XKRy9akKpgAbIaA15SB37EHAuPgO8Zp9SYO+cOPHvtx7Lschh9AGibw0t9lMVq6+AKU1O
	A8p28Q2Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPSL-0007di-Fx; Mon, 07 Dec 2020 22:58:09 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPSJ-0007cg-2Z
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 22:58:07 +0000
Received: by mail-qk1-x741.google.com with SMTP id h20so14406343qkk.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 14:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I6zOyly/VbctqZjifVWoiBMTs4M8CD/SiJU9q3QLjeQ=;
 b=MkFGs90IiqWPrV8EBavbyv2dCQScGbizflrfYY5ExfWiqGQmTwp9ea9vmo1YvDJY4A
 2c+ImuDV/6lN+vyeJgXblAX6e7QAmtNCVcSMBefMCUH9dOrWbyrp7j85uhXWRcbnfaLb
 9H4yXgA5nK98kFAjAOFSCZ0YNlaGFs3onLdQMk2hykLpeZYD9DR/cLEo3HFI9n/ylKYM
 SP1it4yp+9+2q2oaZOAwLTprqKWZ84kYdCrte0W4USF8/zEjT0BLCWmfJ6hZZqRaFqwk
 7zfwnz5mLxRS4u7Ju+3CJIPOhbhWa8Fhl+Z1pjv7olTCIXHnnIiFUJlhu2JwHoyBn3bl
 Albg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I6zOyly/VbctqZjifVWoiBMTs4M8CD/SiJU9q3QLjeQ=;
 b=KwA3ks4hG775R5MKwWgLJbii0RcTongp/L4Kk9YPSa+CzvwGnPuwfixx0LEfNMSGnw
 RDxaKFLEZwlbLTVrOxV3YdfB2/sIPlBtcBF3hLtbwxLN/hUIaZKkGwJffeJ+K6B5sH6q
 DF71chKpJkRSvbu5ImE2in+dd+VswmHXsm9BzFcP2NGpFRfAUs/Mt3fhhhyk0OB80F8D
 /hDk8BFn3x8krrRQpKIAPCKDKGZe62zdzp8sL5jV7p9rK++slCrsaBaI1vMbbkj5KCXU
 78Kaj+KrXS3uG64020UiVrEQhpK4kNp+A9cEYpRnTjy9zIokf98hPA9e5oA3tUXad/UH
 Fu/Q==
X-Gm-Message-State: AOAM530XclcolpL0h9yU9Kvi2OBB+dEP+sskjd8smQh/YzKE/uqqfsqN
 cPrSQMxTP+SY0/+82eMt/SAJvIkisdTLKA==
X-Google-Smtp-Source: ABdhPJwzoS7/Ky0MntBp9qZ4NtSaiEihqd7hWuFpYR1luKx1MHX5eR4sPN13hH1/FdJIG0eMFSB0nQ==
X-Received: by 2002:a37:d2c4:: with SMTP id
 f187mr26900594qkj.286.1607381882673; 
 Mon, 07 Dec 2020 14:58:02 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id r14sm12733046qtu.25.2020.12.07.14.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:58:01 -0800 (PST)
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
 <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
 <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdUVfaWSY1Ohn-_VtOzG1VeQrDCfhHTtkahXy8HsGOTS1Q@mail.gmail.com>
 <CH2PR04MB65224960F89E4EB1CE253743E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <f6b54c11-adf8-328e-e1d5-c759ac5ee2e2@gmail.com>
Date: Mon, 7 Dec 2020 17:58:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB65224960F89E4EB1CE253743E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_175807_153188_5AE01769 
X-CRM114-Status: GOOD (  24.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/7/20 5:14 AM, Damien Le Moal wrote:
> On 2020/12/07 19:06, Geert Uytterhoeven wrote:
>> Hi Damien,
>>
>> On Mon, Dec 7, 2020 at 10:55 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>> On 2020/12/07 17:44, Geert Uytterhoeven wrote:
>>>> On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>> I prepared a v5 series addressing your comments (and other comments).
>>>>> I will post that later today after some more tests.
>>>>
>>>> Thanks, already looking at k210-sysctl-v18...
>>>>
>>>>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/clk/clk-k210.c
>>>>
>>>>>>> +       in0_clk = of_clk_get(np, 0);
>>>>>>> +       if (IS_ERR(in0_clk)) {
>>>>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>>>>>> +               hws[K210_CLK_IN0] =
>>>>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>>>>>> +                                                  0, K210_IN0_RATE);
>>>>>>> +       } else {
>>>>>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
>>>>>>> +       }
>>>>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>>>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>>>>>> +               goto err;
>>>>>>> +       }
>>>>>>> +
>>>>>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
>>>>>>> +       aclk_parents[0] = in0;
>>>>>>> +       pll_parents[0] = in0;
>>>>>>> +       mux_parents[0] = in0;
>>>>>>
>>>>>> Can we use the new way of specifying clk parents so that we don't have
>>>>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>>>>>> the core can handl that all instead of this driver.
>>>>>
>>>>> I removed all this by adding:
>>>>>
>>>>> clock-output-names = "in0";
>>>>>
>>>>> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
>>>>> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
>>>>> the parents clock names arrays do not need run-time update.
>>>>
>>>> "clock-output-names" is deprecated for clocks with a single output:
>>>> the clock name will be taken from the node name.
>>>
>>> Arg. I missed that.
>>>
>>>> However, relying on a clock name like this is fragile.
>>>> Instead, your driver should use the phandle from the clocks property,
>>>> using of_clk_get_by_name() or of_clk_get().
>>>
>>> That is what all versions before V5 used. But Stephen mentioned that the driver
>>> should not, if possible, use of_clk_get()/__clk_get_name(). Hence the change.
>>> Easy to revert back.
>>>
>>>> Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?
>>>
>>> Another solution to this would be to simply remove the fixed-rate clock node
>>> from the DT and have the k210 clock driver unconditionally create that clock
>>> (that is one line !). That actually may be even more simple than the previous
>>> version, albeit at the cost of having the DT not being a perfect description of
>>> the hardware. I am fine with that though.
>>>
>>> Thoughts ?
>>
>> If there's an external crystal, DT should describe it.
>> Does the K210 support different crystal frequencies?
> 
> I am not 100% sure if this oscillator is part of the SoC or if it is an external
> input to it. Probably not. Hard to tell by just looking at the boards.

It's an external crystal. For example, it is U6 on the maix bit. This is
why I put it as a separate clock instead of including it with the rest.

--Sean

> I have
> the boards drawings though, so  I will check. The frequency seems to be fixed by
> hardware: frequencies of the PLLs can be changed to change the CPU frequency,
> but the Kendryte SDK does not point to any way allowing changing the base
> frequency of the oscillator> 
>> Anyway, I'm very interested in what the (new) proper way of handling this
>> is...
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
