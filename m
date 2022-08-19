Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7537C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH7dhesV7p0YAReXkRrk+oR6Zla4EAd15N1Vpw1WaDY=; b=ERQAPlinnJSxNQ
	Xw8f3vjJjBb1nMHrpeYcEP7eNas1RHYaN5bzmRWJqdkgJcv0bXkNDtvJTzZEW0xggnJ1ud3q5Me6r
	37wYBnJOk/2oboBfYg2Wvy9XwMuOhg7xcfQXxXtUmWFfg1Wqm0s1gpbt/oMZzg/nmYtJrfruPR6n6
	MIpHET3VatSPtkfUVBJKr1xuAetY3BPF5EDcTCS7v5Iir0c/shO9AlUaDoSEZ4zl4FJpGQZD0B3vP
	q9osFQLhg3fSQANq4HD//E30LRr3NXevGrDhS5v4sMC0+fsRM2FG6rMEpWZUNJ8Osr27icrfP27Zq
	eTCTdmaLR5Z25zoWu8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP23K-008p4J-C2; Fri, 19 Aug 2022 13:28:46 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP23H-008om2-9j
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 13:28:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id x19so6115819lfq.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=dP94wt5jHiSTgYi6J94tIJEwZ2nFwZSjrOFlQEqy3Jo=;
        b=tQL0p9TlZIZHpUyp5n0TdCgLom+rIFjCY8pfenGQq1i5z8DPqE3DEvdkvtkmngn5UB
         oXVrWU04KLVWV02GJBFIkfP8MjHg+j2C1H0uvUztWMSWLcl1ddnD+92noIrgqu6kBRtr
         gae/QRIh4uPRnFuAiHfavmYZH1AgdbK4xGqhNsmqsdc+/QHZQFgRnuELIz29ws7/Z526
         P4evt7hgUVNdMG3UMa8U5ZmvX4NSQ4ATp/7RFWf70AIyDgfhUfrZDTuiAHEvBv6vrCYq
         bQSXsekwDNUkEsWzjxdO56uz8GY+EibdrpxR5w0o6hTFIuSygU97V7JUJBvR8Tp5420j
         AmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dP94wt5jHiSTgYi6J94tIJEwZ2nFwZSjrOFlQEqy3Jo=;
        b=P1Qem6X4BJjYNKGe+MNKQ8yt5/KrBBB6UX7TJZ+Wk47Fd+8S2z4ChKBVVZOa/9TSiV
         hqWjCk0llUvVVAs6QVRuhQOgB0E7zbjPLrSmZ8jjybkw9Fz2+MkKnBYTix7eWJEy1Qtx
         c/IiBd9MzAuDoCqPLKvyp2ID6FKsvpWQUlqBWweYv/uK+WC8ZtQ015GpiBjewONGCCA3
         O+vzKNItizIW7l53qJ5QfHNXYa6Z96298ubOuo4m/x8ZdURHVVzeQwHvVb2t/3B+Q0RC
         p51JFiRPBOx/WhNVEhD1Jf4rqfEIBFXGlFQWS6NRxbrtJbp+6DzKwZ6Oq9GiOpOL/Kag
         OsWg==
X-Gm-Message-State: ACgBeo3sUeAIecgSdIvZUMlArlWzMPqsYo47Axevs6pTMMCCsnL5Rmm5
	8zTST/l1wy9dlPRantPz7hjbWQ==
X-Google-Smtp-Source: AA6agR7+CjcoCzyQ0iEw8Zkc6jGXpE2KbHigR1mTCV62ktVNoaG2Wdly8C1vmhjPVwAVmjaNJp1ppw==
X-Received: by 2002:a05:6512:1399:b0:486:2ae5:be71 with SMTP id p25-20020a056512139900b004862ae5be71mr2393901lfa.246.1660915720766;
        Fri, 19 Aug 2022 06:28:40 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id s8-20020a197708000000b0048a891e4d88sm638853lfc.193.2022.08.19.06.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 06:28:40 -0700 (PDT)
Message-ID: <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
Date: Fri, 19 Aug 2022 16:28:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To: Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 Daire.McNamara@microchip.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_062843_428935_57148311 
X-CRM114-Status: GOOD (  23.21  )
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

On 19/08/2022 16:15, Conor.Dooley@microchip.com wrote:
>>>
>>> +             ccc_se: cccseclk@38010000 {
>>
>> Although you call it "Clock Conditioning Circuitry", but the role of
>> this device is a clock-controller, isn't it? If so, node names should be
>> generic, so "clock-controller".
> 
> Thanks for the prompt reply Krzysztof!
> I suspected that this is what I was going to hear back. The reason I
> had used the non-generic node name is that I wanted to use it for the
> "name" of the clocks in the clock framework. As you can see, there are
> four instances of the same clock, and I am using the of_node's name to
> generate the unique names the clock framework requires, like so:
> 
> # cat clk_summary
>     clock
> -------------------------
>   cccrefclk
>      cccnwclk_pll1
>         cccnwclk_pll1_out3
>         cccnwclk_pll1_out2
>         cccnwclk_pll1_out1
>         cccnwclk_pll1_out0
>      cccnwclk_pll0
>         cccnwclk_pll0_out3
>         cccnwclk_pll0_out2
>         cccnwclk_pll0_out1
>         cccnwclk_pll0_out0
>      cccswclk_pll1
>         cccswclk_pll1_out3
>         cccswclk_pll1_out2
>         cccswclk_pll1_out1
>         cccswclk_pll1_out0
>      cccnsclk_pll0
>         cccswclk_pll0_out3
>         cccswclk_pll0_out2
>         cccswclk_pll0_out1
>         cccswclk_pll0_out0
> 
> Maybe that is me exploiting the "should", but I was not sure how to
> include the location in the devicetree.

Neither node names nor clock names are considered an ABI, but some
pieces like to rely on them. Now you created such dependency so imagine
someone prepares a DTSI/DTS with "clock-controller" names for all four
blocks. How you driver would behave?

The DTS would be perfectly valid but driver would not accept it
(conflicting names) or behave incorrect.

I think what you need is the clock-output-names property. The core
schema dtschema/schemas/clock/clock.yaml recommends unified
interpretation of it - list of names for all the clocks - but accepts
other uses, e.g. as a prefix.

> 
> I had experimented with a "microchip,ordinal" or "microchip,location"
> string property to do the same thing but I thought you/Rob might not
> like that - is location/placement on the chip a relevant property of the
> hardware? I'd argue that for an FPGA, where the user is the one deciding
> what clocks what, it could be relevant to some degree.
> 
> Knowing if a CCC is the north-west one has some extra benefits as it
> is co-located with the PLLs for the processor & has a reduced input
> mux range.
> 
> Any suggestions would be appreciated, even if it is just a NAK to all of
> the above!


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
