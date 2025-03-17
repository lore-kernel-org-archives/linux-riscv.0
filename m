Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F56C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2jFuXLShu/YyS6C5TFj73QSLkfVgjccHNAOApXSSQQ=; b=vJqIErh0Bvbu4a
	RlhRwtKJfUdD7LE03n4K1iXro/KHp4eX4U6MMOTwBdQK+CFbZXhV97eT7UuNZp48w+BsF/zwh1hVk
	y/nMdRKz2dA0pNLToedDfM3zsNAj8AdWR2yE95ynReWP6Rpd1Yke8l6n5EFWvVEsmdbLsK1iwpY/I
	e4ZDirpMejiFFBoAuymAKCWacuLhhbKywTaqZLyI4HeyxdZPJRY21v/94Tgraa3jf9KAe80x14use
	tsgHcX1ZAAM74m5s0SK2kOr3qQUppkES/O9S9ZWj7EvOdxmkOTZ9FfoLu7+RxMyq4ckS6SnsZ1tnL
	dkSZ9eGbiGFAFDehucyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Kz-00000002Ww8-2sUB;
	Mon, 17 Mar 2025 12:12:57 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9JK-00000002WT7-4BN5
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:11:17 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d445a722b9so24098275ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742213473; x=1742818273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=FyoQuFR54NyhsMs9a2uS7lanJYPM9jBgpl5hOvJ/naTpe/ZafWfRkjNtdMH4jRLBJ4
         l3mNfAGXEKx+w61v/0xlydY/fNoXjvcK1ndPles03rkEHsvmq+AlPmzjzVE4i1KhP80+
         JmS+18+G1y35G25ph9bhSrlee824peWcNa1PFHX89zDHP4f9fiLt1acqJWoaLwqDxGBZ
         cu9+CTb/oOvdQyH3BIJ9YS8jT3lTqs90I9CMJj/M8MwFRvLgc7mQIsL2yDR2etT4m9ie
         TNSx02iHeu/lq0MLxQS4YmGS2i6TzLOQZIdp+tiKNSxPIli3BmeK/F2bCoG2sSp2eGAn
         4YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213473; x=1742818273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=QjH3uSagiMWvUj3ndlZaQJkiKWxlGT97z8oU12EpxKcGaQpiuK4svkT4e0rd6Wtk16
         +GFhZxKNBvQy1o0ijZLFPxWwld0d1qu4FOFA/+3jXIHcrlg/BprOh//7JG3YPJli8XQw
         QXPF9XFTOuiVI9ooKspmrqyg2SBNIDyA0QsrQ4nQCVC/Gk9CaRBfogym2s4XYqkTttyf
         Wgbv79LdAq/LduynXRd6VhV5zc+M2TxKrPSlsv8M4TxPkUXJnPUs51dqVkK06TN/ILnO
         f0F0RLSRJkF+8K3q6uzMhZ56YWegO0To4NjpFZOswfW66g3uQVgPeTNxAIK2JfqTB1Gg
         wGuA==
X-Forwarded-Encrypted: i=1; AJvYcCUhWK/klbgkYDM6PRm5PdKcc6lwHq338SaCThpw4EJK9Le1ASKAzBoUBLjFk29hSTOQ/uhU29BLewnh7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI14nq5gHVK0ZtP9UTPli5YHqDlOrXULJAt7i2cgWoZLrI/lRQ
	GnfvWnJVWYnyPkh+u0yxN0oygg1ZxBpUKx1Lfz2vU2Z2AtaMZLyjV3A+M8Ap+xw=
X-Gm-Gg: ASbGncvZqqWfgQ0XcSnUj/kOWJSJJYKhifsGO+5WBI6m9/sX7b06GyZvvYaz6ypK3au
	HPIA+hipBvLq3Xkk5UvK10KD+YY0Y1ug8VZdB1AHwS9lLT5g8+8FpQ6OIDUGYI4MVYjdkf+xwjQ
	Lv+M3YHipX9+qfE+yT25ROlOox+cHQjjd6oQn7bbhn6ttaiySNbSAjdwwoO8MWyF3eMi4/hOLlQ
	d8+7XG4hYJpB6m9rgJ7PJSHO1JGUnFxQPGefIvx0oo5v53g2PRP8BOOI745x3Ce5Pnsx25GKXpc
	ziAy981DDOt1QL88YTkm4WmXDRAB1MEKYeUVvSqa8AJABYs5ctgMqzBidCihPHDn7rvYMzKw2XU
	q1glCogJ+
X-Google-Smtp-Source: AGHT+IHihbZvdnYYDfqQYS9Hgz8z5Z3z4PweP7imJlwjMD1yaS93kmhWHJcx0wBiJ8Y5JrB0JR4bZA==
X-Received: by 2002:a05:6e02:3041:b0:3d4:6dd2:3989 with SMTP id e9e14a558f8ab-3d483a88a3emr151134105ab.20.1742213473560;
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a666583sm26051995ab.16.2025.03.17.05.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Message-ID: <26f931a0-602b-45a9-a533-b297033655ae@riscstar.com>
Date: Mon, 17 Mar 2025 07:11:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Geert Uytterhoeven <geert@linux-m68k.org>, Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_051116_124128_2F4A9456 
X-CRM114-Status: GOOD (  20.08  )
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

On 3/17/25 3:18 AM, Geert Uytterhoeven wrote:
> Hi Yixun,
> 
> Thanks for your patch, which is now commit 7ff4faba63571c51
> ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> 
> On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
>> Pinctrl is an essential driver for SpacemiT's SoC,
>> The uart driver requires it, same as sd card driver,
>> so let's enable it by default for this SoC.
>>
>> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
>> 'make defconfig' to select kernel configuration options.
>> This result in a broken uart driver where fail at probe()
>> stage due to no pins found.
> 
> Perhaps this is an issue with the uart driver?
> I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> few Renesas platforms where the pin control driver is not enabled by
> default, for saving memory), and the system booted fine into a Debian
> nfsroot.  Probe order of some devices did change, and "Trying to
> probe devices needed for running init" was printed.
> 
>> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
>> Reported-by: Alex Elder <elder@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
>> --- a/drivers/pinctrl/spacemit/Kconfig
>> +++ b/drivers/pinctrl/spacemit/Kconfig
>> @@ -4,9 +4,10 @@
>>   #
>>
>>   config PINCTRL_SPACEMIT_K1
>> -       tristate "SpacemiT K1 SoC Pinctrl driver"
>> +       bool "SpacemiT K1 SoC Pinctrl driver"
>>          depends on ARCH_SPACEMIT || COMPILE_TEST
>>          depends on OF
>> +       default y
> 
> Ouch, fix sent...
> "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> y unconditionally"
> https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

This is interesting; what you say was what was proposed in v1
of the patch series.

I did not understand COMPILE_TEST to be used the way you say,
but I think that just means you understood it better than I do.

I think the rule is that "depends on FOO || COMPILE_TEST" alone
is fine.  But if you are going to specify a default, it should
be "default FOO" and not "default y".

Thanks for pointing this out.  I'll go respond to your patch.

					-Alex

>>          select GENERIC_PINCTRL_GROUPS
>>          select GENERIC_PINMUX_FUNCTIONS
>>          select GENERIC_PINCONF
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
