Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6FAC369BC
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fq65RrlDIzet+kDKpLc8Fx3dztDkC6N3tXMbdD5wHsA=; b=j0ndCnhi3PCvJw
	IFjdKxGLVCdCqeftRMADsHvem7tMYVmrEdD10MxMilL8UzqukYMNWgecsS4D1MatESHn0MijSNo3V
	aqbt8aVzz3hNG1EdlIOUrfY+ctNa9+/nvcR41Njdg/b4RRFMHjueLDB/wFXTgTOcFL9YsOj1x5Vc+
	fwDQtD9JEFZTyDpXMMrkc5u0Fuo0dwWX2ZCgPtojN7/gK1qhG2u/ebV1ibgfwDufRAebSLloJJUIr
	tIrJh85vq0GTqAdEBkgasnx1AZcyqehv0HXnJthMmCE+2VHiRL7je/cN8B/X+5gEYnShfE0Tkaejk
	hK+Lhm8mtk583I4KIygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fW4-00000005lXy-403C;
	Tue, 15 Apr 2025 12:35:52 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ezD-00000005eIW-0A5N
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:01:56 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-60245c7309bso1270942eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744718514; x=1745323314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=1SUpKGC18S4su1MiWRAaLbkrfFZ82JwH2H2T4DB/agaR8MAJwpNPQe5HjhgAkKu9pG
         HtUiYmMP/VXpCw+DrrnJ3KyD8i7XQzYyqIi054deQqfXtnpGp1DSQFFThqTbZwqmAMHN
         GFPhLdTgVqbC1dgxvLIOUJ6ewZXYET5BOFTMt7Pr3zDq/YHoDwMDOEU0vlSm6/IfAV7+
         AdWjFZbFUVrbzpy7w+7pacFyPKruFmRVvslUV3LK5CnGuSHa9edgViGFLpO+qPcyqSD8
         6jHv+mDZ3QQXP6qjMfTUnTeYyJOU6FzFIDpkEUCkT9gXRdcteKQlbL+hcrITEsf58Uem
         FwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718514; x=1745323314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=TX0oknYKjJKGmfagwvXQkC1PmL86dffCO9weVB3Ij5r8nVF/wZL1QzvIBjuexKCTRd
         imL40jB9aCc6MhjTOoIZKIne25+X3sZKHP0aJQjsxq2ihy80OeRUMQPGOb+tEdXhx+ii
         7UxET3v38pPkZikoNiyzRcdy7pqs/XxoM9S+ocL/crkAnqSZ2CiyIQ7vWM694Ap0w+RO
         emHJ/nnzNwg9Tjf62bXxUhLceYumulStZQsmeXvJ9d3u/SbhCW2IYYQo/Uj+YJ1rYYuN
         opw+D6cRXfbAoKhf92/06prwWM8wD5OZ8S0O6f6A8j1LtrjdBLzdtUzmrHG06ejK4Zwv
         PBLA==
X-Forwarded-Encrypted: i=1; AJvYcCVV3akAn1EIU5qXmq4UzsYMRKXz5jzBDgRB9UUiVHE6aA3k9pDeQeEOrfBQmzDYZMKdZSZcDa69xJYAmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxke+hMmuYaA8RBSZCmJZ6wwjR6BuC7BsacmoDb9Glt7CUiqsg
	wC932jIg5uNsScqur1pos2ld5xxuFzJqVpiF/kLgIMI2/FMwuJHYboF30cuwTNc=
X-Gm-Gg: ASbGncs+q/XiJHi0AYjtjTJzHan5aIXjUFJ9mLTA83sFdF4Z+ZZIgZ2HsvZZs3WXo+7
	OORK7rWJEPLZuq+BUgzECdNOZRFO3nn+vi+4vfV6bz1NU1ZltEfnxc9Oc6a4lkRjukH0YSo4fUH
	TrATDksiENGqpPxZfV7iDpMyKNi5wmGJxLUlPwbdOiaJYoGmVyHDyDn+CN8vvcL1rkDD89pcBJY
	D1f8yLzC+TbsmCmrFZ9ihGOOx2DS43/xs6Jhc55tLHrzRQIR5+Mc+TTY97DlnERhqzuEdNicuYE
	qaEBQTUYmK3+DWtUbwX1c0WZhserOUfsf6a4KaCZbw/uGAkBcCKSLztSzLIZ+xigSlHeEI+WBy6
	ljClpB+Pcpq4dVrs=
X-Google-Smtp-Source: AGHT+IG1ZefJtDz6AYlU+I6NKPPOmbM1gYq5/4K9M9+cYhFx0WPocorybtDxzIDHpDEm4xA8K20OCQ==
X-Received: by 2002:a05:6820:1392:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6046f59b8a9mr8979670eaf.5.1744718513333;
        Tue, 15 Apr 2025 05:01:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522cfdsm2299991eaf.9.2025.04.15.05.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:01:52 -0700 (PDT)
Message-ID: <f856f692-03c6-4064-bc7c-ad565fed6d2f@riscstar.com>
Date: Tue, 15 Apr 2025 07:01:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_050155_080697_182F73C7 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/15/25 3:22 AM, Philipp Zabel wrote:
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> Superfluous parentheses.

Wow, this is something I don't normally do.  I had to check to see if
I managed to drop "BIT" or something (I did not).  Anyway, I'll fix
this in the next revision.  Thanks.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
