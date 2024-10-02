Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BF4CF6D21
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJd9ElgGHy58Qxi8DUwqhhmACLFMWRqCIX06zSZwE7U=; b=fyuyt6kX2J03IH
	X5/Fg9pmNM2a1WxwhIr3lLE4chaEoq+jbeYKk6WSpF8yxJ1Uzzs7CQZYvsLkhJ6mR9XS33Ptlmfct
	PPpm4aUPp+66apQpYLxXSFccXg2ROyDemU2hkfC40MvvFx+TrWsb9V6U+bf34OJKuuFnHhKVdqlyA
	U7PV2CvrhCh5rmZxvBeUmfsW4Yxo/NIMew8zWn4HQuiTqvjFvRJeXwSmcTbugER2jZOcWZpHJJV4h
	84laBK00J+2hszuwTiyNsxeKXt4PrDYDU0Nrv+E/HmHRmsKD4B9pPM7tSdElOSejOywpzw35FVy84
	fhzcx9gjQqK4APXw2zTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svzJV-000000066LH-3uBR;
	Wed, 02 Oct 2024 13:22:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svzI7-000000065yT-1RPY
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 13:21:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37ccc600466so3026049f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727875277; x=1728480077; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFcpWszJZ1PatGkbcS9TyyzC+Vcri7WA2fnl3Lvu/mU=;
        b=14/7jBQ1eMmPJMykKeIQUxlyABWQFCS/3T0uaoiV+LE06ii+v0/7A8T5uDs1fJbaQu
         v2bWYdC8xCya+u9duO5r184NcHEDaZSWgse3T1o25uKZYnK7sdy3I+QnKB/c0KHugZhq
         x7+YRt7yQWH+ziLTyUyyL/bk1WoWcjdgQS+6Qmm7nRrLYacyVw60LO4gaYrSYpfMMtWE
         sJUtfYBh0CmoWC96KybItCBqEer/3sYMgHM7xxLXb/dcElxufvXREZk8IL5jf5YzVQpU
         vlblxJ7vfZmA3QGqO/TvixP9xfSB7O5EeC86txGiUP429db5E/KsnDUTOaZyXNYbdpKv
         +iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875277; x=1728480077;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFcpWszJZ1PatGkbcS9TyyzC+Vcri7WA2fnl3Lvu/mU=;
        b=ibaFjHXs+Ptu++CDvf4siayleO4pxyNmz8nV6+KIMosEeZUKNd/jvA+qt/jT/USC8S
         Ojv4a3MNNf4mEhEuq2AJa3BZW6++3sl29XXyPuS6zQBX8ExYvs5YAM4uGI+szc2hrxjv
         mTtAhRUrhH4bdzBWU0ugCRW3wPUZFW19khI64ECyA7A0Vvcqmf7v8UKgcwOzsTtvRULr
         g9AKSEPUYCqfwtldYBijrl9lUnwEkWIZhWGW2jOO6AB9miDRaGSisE5rgV+t474iM7Ex
         1+w/VXcnDPFXoyI/eOVYUEMoJZ0QWRgsAj6Mnq+CsuOPj7oDbax4j84BxvIAlYmMXBPq
         b4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCViG1Rki3y7WzDMc5x6g2UpQ4HncpmxYfH9GmTdgCnu6yxAggiaOUjw9xbJRgI/jsVFTu5Wz81wUXk5CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbbY8ecCf0zRImCmPQs9pWv8Gx3di/VBn2dvAk+5XfD2cTGivu
	SSBtK7Vye5TpfQsFeD7pV0fG0zBqlOTtoERennR0Kv4Ppar8u1uRTvzRFrfsupk=
X-Google-Smtp-Source: AGHT+IGtesUnwfGBBqJcevG7GXZS5uKes3Sg3LCKiml2f2atNex2ZhNMu7Ko3bo7Z2LB1PvLr1K3nw==
X-Received: by 2002:a05:6000:e4e:b0:37c:c9b5:5573 with SMTP id ffacd0b85a97d-37cfb8b57d6mr1834260f8f.17.1727875277309;
        Wed, 02 Oct 2024 06:21:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:eced:891a:c2b9:3db5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575de73sm13842727f8f.115.2024.10.02.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:21:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,  linux-kernel@vger.kernel.org,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  pierre-henry.moussay@microchip.com,
  valentina.fernandezalanis@microchip.com,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Jassi Brar
 <jassisinghbrar@gmail.com>,  Lee Jones <lee@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  linux-riscv@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
In-Reply-To: <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org> (Neil
	Armstrong's message of "Wed, 2 Oct 2024 13:20:44 +0200")
References: <20241002-private-unequal-33cfa6101338@spud>
	<20241002-hula-unwashed-1c4ddbadbec2@spud>
	<2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
Date: Wed, 02 Oct 2024 15:21:16 +0200
Message-ID: <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_062119_540692_B431C3B2 
X-CRM114-Status: GOOD (  19.37  )
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

On Wed 02 Oct 2024 at 13:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 02/10/2024 12:48, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> I like this one better than qualcomms and wish to use it for the
>> PolarFire SoC clock drivers.
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/clk/Kconfig                           |  4 ++
>>   drivers/clk/Makefile                          |  1 +
>>   drivers/clk/{meson => }/clk-regmap.c          |  2 +-
>>   drivers/clk/meson/Kconfig                     | 46 +++++++++----------
>>   drivers/clk/meson/Makefile                    |  1 -
>>   drivers/clk/meson/a1-peripherals.c            |  2 +-
>>   drivers/clk/meson/a1-pll.c                    |  2 +-
>>   drivers/clk/meson/axg-aoclk.c                 |  2 +-
>>   drivers/clk/meson/axg-audio.c                 |  2 +-
>>   drivers/clk/meson/axg.c                       |  2 +-
>>   drivers/clk/meson/c3-peripherals.c            |  2 +-
>>   drivers/clk/meson/c3-pll.c                    |  2 +-
>>   drivers/clk/meson/clk-cpu-dyndiv.c            |  2 +-
>>   drivers/clk/meson/clk-dualdiv.c               |  2 +-
>>   drivers/clk/meson/clk-mpll.c                  |  2 +-
>>   drivers/clk/meson/clk-phase.c                 |  2 +-
>>   drivers/clk/meson/clk-pll.c                   |  2 +-
>>   drivers/clk/meson/g12a-aoclk.c                |  2 +-
>>   drivers/clk/meson/g12a.c                      |  2 +-
>>   drivers/clk/meson/gxbb-aoclk.c                |  2 +-
>>   drivers/clk/meson/gxbb.c                      |  2 +-
>>   drivers/clk/meson/meson-aoclk.h               |  2 +-
>>   drivers/clk/meson/meson-eeclk.c               |  2 +-
>>   drivers/clk/meson/meson-eeclk.h               |  2 +-
>>   drivers/clk/meson/meson8-ddr.c                |  2 +-
>>   drivers/clk/meson/meson8b.c                   |  2 +-
>>   drivers/clk/meson/s4-peripherals.c            |  2 +-
>>   drivers/clk/meson/s4-pll.c                    |  2 +-
>>   drivers/clk/meson/sclk-div.c                  |  2 +-
>>   drivers/clk/meson/vclk.h                      |  2 +-
>>   drivers/clk/meson/vid-pll-div.c               |  2 +-
>>   .../meson => include/linux/clk}/clk-regmap.h  |  0
>>   32 files changed, 53 insertions(+), 53 deletions(-)
>>   rename drivers/clk/{meson => }/clk-regmap.c (99%)
>>   rename {drivers/clk/meson => include/linux/clk}/clk-regmap.h (100%)
>> 
> <snip>
>
> I don't have objections, but I think Stephen didn't like the idea
> a few years ago, but perhaps it has changed...
>
> Anyway, take my:
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

We had a similar discussion 3y ago indeed:
https://lore.kernel.org/linux-clk/162734682512.2368309.12015873010777083014@swboyd.mtv.corp.google.com/

There are needs for a common regmap backed clocks indeed, but allowing
meson flavored regmap clocks to spread in the kernel was not really the
prefered way to do it. 

IIRC, Stephen's idea was more the bring regmap support in clk-gate.c,
clk-mux, etc ... I'm not quite sure how make iomem and regmap co-exist
in a manageable/maintainable way within those drivers (without adding yet
another level of abstraction I mean) ? Silently creating a regmap maybe
? but that's probably a bit heavy. I did not really had time to dig more
on this, I guess no one did.

I don't really have a preference one way or the other but if it is going
to be exposed in 'include/linux', we need to be sure that's how we want
to do it. With clocks poping in many driver subsystems, it will
difficult to change afterward. 

>
> Thanks,
> Neil

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
