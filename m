Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9877FCA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZLM5o4biofUG9PPv5uzLmgyVCuPtvoNC97KYU1gmaY=; b=cb1aZ5IybbbOOM
	AJ2A7uU58PaRu9SZVdXceQcZX1nugdhF2Sf0VvZxRl69Ac71xBH9F2JzfbWCUrUMrWDDX/fUIO+D7
	jPH2G8+LuqptlS2N8jOTCeYW2CddDMdbhAXs7IMZ3e1cuYD8sxSqQAFyWBfXk2f6jXvqAQE+RIyXY
	g6S2LPvcfIibkCotUP65+WFwBT+K8h+zvw1H/p6HhHx/xNaKTtsJXTQw2ElMNjZIoF1tRHt75F1kv
	jofYKe29PRjNdMAgAzva52OF3EasuqbkO65dmyQek8dNPw4HI/OjYQQ7c7GNYkkvj/bcLbjCpIiHn
	36vahL2jCSKkCChTwa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOr-00000000beG-21eT;
	Thu, 18 Sep 2025 16:22:25 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHOo-00000000bcE-0CGP
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 16:22:24 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-423fe622487so12556865ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758212541; x=1758817341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AU2OV7gY++1HQBPAJUTGEHGKnym698Yje6WiyRPMWQ8=;
        b=xSfaE8SAT8rfz+GO92fv3uCaBuX3fcNV4ivUMC9K6FpWayRGlr1a+8NCpuP8981eMv
         eR+RaW5ndVu3on0zevT9iqvV3v7C8oBf8o+IgitRXAe9Dq+b6MZ6D2mN6WQvlCuPyb6W
         viahylp7B0+cjhoGGVIr1xiSr7k4iBSFpQv/XXffKkrnQrhulf3ZScO/qkBK8zI6pJvA
         q3gmSTPZjqhE0KpLOmuxRkAgrElS8qv8udNDQS35OWudzPhwK3VgFwEctloMgJ7/FIJR
         3/5wDRAhWNHzS4+PsK7vDOja/5EeZ18cxQd+uLRXmZ2JG6djuUSp/iSfP6uMBPGy7ilo
         a/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212541; x=1758817341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AU2OV7gY++1HQBPAJUTGEHGKnym698Yje6WiyRPMWQ8=;
        b=fJaMeoN58l5yP9CN7pOefsjV4RmspoaNVTqG2uOx5otitY5TFy273pmzMWni5fFUl0
         xXRb0nTUkh73GHg7kxV24I0S2OAVeV99Ac4eVwTiCUK476J8MJkDWciuQbsgp7D3z/7Q
         Xe8+24DmaxTWpmGSGqnWqBdx0762CYNNWOhZBZw25UOZJpJMlspiGzhaJd3LGaKGzVJY
         slzweNxp7TQEPhC85tPShi6CbM3Wb1VXmvjjInDlfmAefk7dhKGzU/lxK47owiW4EGwt
         w1W/x0z9wk2GTQE7nwhNn8iaeqoCjY55uExgmO2SppW9Pc5N7WaEPEF2KMPZsW/L/5lf
         34qw==
X-Forwarded-Encrypted: i=1; AJvYcCW3hD2N2+p5jTFzxygD09rLUsUGGTNdHGSA7oqdrGqNwGqr7VHc0nz1TNenDdbPKzzgs0jgDi8YDci+zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiAFCuQ430WqkgZrMI41/OPtGcuWQsB38pClJK7fCwPSaJFVgc
	P14dB6iXSlEDXNLtSDcxLHKIp/V5oRzepYrosbpsgA2JEByGFXz6WSmA6ycdvPGiNF0=
X-Gm-Gg: ASbGnct/DAVWnNdhCNYpuTiqdN/dr4kbWA/jQxNy6PpTN3wMAeT3Dog4XIleiaVuXXP
	SOcXk8nYvyAyPAaMbpruYhTqSu8kEtECHhhpDIlKQMcnPigMoyzf7EssZ0snRj2N9spRv40HblH
	ciGsL8ao+f0Kt1eCXCwOlMo3UwgO2MgkK1Hyme5BGGine6zJkSjXjeAfrJM1u4BVnr5kQnd27P5
	gP5ILy7hTQkNlhuk97XUJkj/cfPtvS7KVixrPf0sai5+ytCTg2C7i9oImClmc8QX/UbgA1elxDS
	sNYMOfY32+mu/fl/P258+bKPqJgvmMG/qPm1OQDZTBZU4JgX7M6fPswzrbZvIArEVyaDIIe5tD8
	TadmAsgoR6jJ43NX/IP9Dk6op82UxyTw5kulGHlnQ5URG0uVik4I6zFVa7IUCXJa3yAAUPosysH
	r6MS/xeA==
X-Google-Smtp-Source: AGHT+IEJA379jBFlrQdMuZZ7GAQYUyd69Hmjw5o+yqSb0aHO7CoUDX+AkO4upDsCoz0J8wxrQujxtw==
X-Received: by 2002:a05:6e02:1b05:b0:418:aefa:bb83 with SMTP id e9e14a558f8ab-4248190b442mr2732905ab.5.1758212541014;
        Thu, 18 Sep 2025 09:22:21 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e3373f6sm1110059173.29.2025.09.18.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:22:20 -0700 (PDT)
Message-ID: <5a8364e4-3160-4459-9db4-c9d877ba8c6e@riscstar.com>
Date: Thu, 18 Sep 2025 11:22:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092222_510320_DCEA9C63 
X-CRM114-Status: GOOD (  20.38  )
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

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	ret = of_property_read_u32(np, "spi-max-frequency", &host->max_speed_hz);
>>>> +	if (ret < 0) {
>>>> +		if (ret != -EINVAL)
>>>> +			dev_warn(dev, "bad spi-max-frequency, using %u\n",
>>>> +				 K1_SPI_MAX_SPEED_HZ);
>>> the err msg does't really usefull..
>> You mean there should be no error message, or that it
>> should say something else?
>>
>>>> +		host->max_speed_hz = K1_SPI_MAX_SPEED_HZ;
>>>> +	}
>>> so in any case, there will be an assignment, I'd rather simplify it as
>>>
>>> 	if (of_property_read_u32(np, "spi-max-frequency", &host->max_speed_hz);
>>> 		host->max_speed_hz = K1_SPI_MAX_SPEED_HZ;
>> I add the warning so it's clear we're using something different
>> than is specified in the DT.
>>
> I personally do not really care about the msg as long as there is a known good value,
> but you could weigh this..
> 
> further I feel the warning message isn't accurate, if spi-max-frequency is
> "bad", why not let user fix it? does "bad" means invalid or overflow?

The reality is that this is a property in the DTB, so it can't
be "fixed" by the user.  It defines the *maximum* frequency
that this particular controller (on this board, or possibly
limited by what the SoC is capable of) will implement.

Stating that it's "bad" seems enough, given it normally can't
be changed--and we will use a sane default instead.

It might helpful to indicate what the bad value is, but that
complicates the code ("bad" could mean the property was
specified without a value too).

> I don't want to have bikeshedding on this, feel free to pick my suggestion
> or keep yours, there is no much real difference

I plan to keep the code as-is.

I don't actually know whether the limitation is on the SoC
or the board (or even whether it truly is the upper bound).
I'll ask SpacemiT about that.

The default value is expected to work on all platforms.  If
If it's specified at all, it should be done in the board
file (so it won't be in "k1.dtsi").

If I don't learn of specific constraints, I'll omit it in
the DTS file (it's currently unused).

However I *will* add some new code that verifies that the
value (if specified) is within the SoC-supported range,
which is 6.25 Kbps-51.2Mbps.

> thanks for your efforts to work on this

And thank you for your review feedback.

					-Alex>
> -- Yixun Lan (dlan)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
