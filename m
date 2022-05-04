Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C47C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BRE91/1jEe5yfYuSpXshrbbfjmnQi38W8xJuMKAlFI=; b=1+qYlafD4v8zoP
	ELcKmQnlNORsUsFgqFzsOxT+8gwtK73OhMdrmMfzPGOaewG6VN1KLSMO86/iFBAPgBzkxF6pVTkPq
	ytV8TtyBPjrB6kKNd4Iz+KNYYOF+0niGr1IvSg19CcsYOxvEnSam9eUDzLvbzghuv92HS44hVsJk8
	bNAG5tjVM9s38Z8zuvspLRfWCgXdKsmBRj0PymDlmyjkvKULDz3Y8Vr4Nse7PVHfd4Ra1MR7gXuXa
	Irsj5Wv5KIcOeR019+9NQYh6xrZwr+tVMuwdvTz6Gu3z3CaGy/I21pg6RMqEoxg+pKGH3+HT58vnT
	YZRHh2sk2iOU5DRYq2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmHhL-00BcQY-SC; Wed, 04 May 2022 16:17:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmHhI-00BcLo-N9
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 16:17:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id k2so2712920wrd.5
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q1QS1h63jdwlMuyWNP8xmEDpzxKjGMK4DEb1a7HY6v8=;
 b=B5/wgTRM47Tl6PkYtUKKGOHAofL12q1D1XeQV2au8EsqDuKXxnhiEQ1NxmJNWAzdP2
 3x4xdSeMWZUJQ+cV0ZMU+IeYQqTjTKcy168mCV6zySdGCVFpO5pgWlWaC5G3JLOGOmms
 vBeH+yOKH0ArVlnht8uegF3WR1oh1AfRINI8z2Iy/QvIl4OMwngm41/ddl3h18Ga+Zm/
 Pe5WXPQ25sM2RmJwQqg/8XprcUfWZtCcvwPuUVHQLVeCXkpEM6GNMbteVBkz0N1d6BY1
 ec9Ls/wwmM1dRLKpVWHS1mVSPryPH9WniYE24/zlS9edV9v3RgFvDj/us7VuKziCRZgn
 eC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q1QS1h63jdwlMuyWNP8xmEDpzxKjGMK4DEb1a7HY6v8=;
 b=5Gt7gkRhANntL5yJ5ucfilbxcQYBI7m8Fk37AGdHpQ705YjqQumrSl7TQnyoVhEVBR
 t3k2wlvg4riQVBTdtyjNMFTyhQfycVQVow3+aKrtKtmJ3lcV0P1R2wbT/Bd4fvV15NnC
 qEW4hjpi7C3neL5LyDj3487juR04pWcCf2RDRMInhudmTlTsvjWBLFKhFJdg/IaTLl52
 L6ybmMzcZun/xWtkgDCJEY6JA3OnzqDy02MyMYMk6F48O272+ew60/yLiqMtPbwga3zv
 eHWjAggNyRu4QFZE7ykvvPnDqZ2VKQdiNvso5GY9BHzzaTUQ7MpLJtiECiWRWi3FUvsH
 Skkw==
X-Gm-Message-State: AOAM533DusDwV/Jzznd67HGzqYPcACV5eg7DO/+35lVbt6AyiwdKurpS
 395aC3IorLpDbc+C5AFq1p1p2A==
X-Google-Smtp-Source: ABdhPJwuSiqhD1Cyjq81kfirw20i4hiDQULPYQWg/PuvNNeMNt1Vngp/iBTK7LXsBJS82EKqd4hhDg==
X-Received: by 2002:a5d:474f:0:b0:20a:cb5c:bbd7 with SMTP id
 o15-20020a5d474f000000b0020acb5cbbd7mr16610323wrs.21.1651681065007; 
 Wed, 04 May 2022 09:17:45 -0700 (PDT)
Received: from [192.168.2.222] ([109.77.36.132])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a7bcc94000000b003942a244f38sm4153161wma.17.2022.05.04.09.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:17:44 -0700 (PDT)
Message-ID: <1e6de466-eefc-c5f7-5db7-6a87ff1608ed@conchuod.ie>
Date: Wed, 4 May 2022 17:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Content-Language: en-US
To: Conor.Dooley@microchip.com, wsa@kernel.org, linux-i2c@vger.kernel.org
Cc: ben.dooks@codethink.co.uk, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Daire.McNamara@microchip.com,
 geert@linux-m68k.org
References: <20220321125855.3227057-1-conor.dooley@microchip.com>
 <cad04bc5-ce7b-d7db-f967-8b2bb67897ae@microchip.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <cad04bc5-ce7b-d7db-f967-8b2bb67897ae@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_091752_800853_A47325EF 
X-CRM114-Status: GOOD (  12.17  )
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

On 04/05/2022 09:40, Conor.Dooley@microchip.com wrote:
> On 21/03/2022 12:58, Conor Dooley wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Add Microchip CoreI2C i2c controller support. This driver supports the
>> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
>> set for "soft" i2c controller implemtations in the FPGA fabric.
>>
>> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Changes from v1:
>> - Use byte write and read functions
> 
> So it turns out that how I made this change, which worked in my
> test app, has issues.
> I will rework and send a v3.
> 

Welp, as it turns out we can chalk the issues up to user error,
aka me entirely forgetting what the correct i2cdetect options
were - d'oh.

Apologies for the noise & unless something else changes, don't
expect a V3.

Sorry,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
