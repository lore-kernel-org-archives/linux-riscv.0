Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F2AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 21:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSM6cXjD+xB4a8cc5gFEHFOyjD+IbgzsFhdjSt5Ghrw=; b=YG0eZ59HuiL7us
	PHEQCbEt+q3Ctw5oKcmEqr5v7lquJpD5w7A3KDF6iJdA9avmpmJBPA/6Wq0ppU0hf6hG90dqHYI4F
	3qccNEDzyF0muPpL6MnBRYNo3qm4/kU6amH3xUtmtoXBSX/M2DX9ci8FG/rhdNqT0OAobfwOPlY9b
	G/a6lci/cc9PfJDzjCBJy2YbzCZjNnCarOURgb2M9AdWHy2rpbvwHOF+YJvKzMwPJ0kGhrttzJsZx
	PreTZBRnwxsi2a7kCCNGOOSF5gORBGx7fbc6+VoTj3jtJDWASABsaqUvB1GP95NYCPo7R4OxXJsqB
	tz2WneFrKJ9FZD6ELdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5w7a-002tMX-VL; Mon, 27 Jun 2022 21:18:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5w7X-002tLk-UT
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 21:18:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k22so14795428wrd.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7fqf134knRgs1GXmfgOSjMnBIhN/vd4XYE5cKns7XrQ=;
        b=HXbtK2wb/8k7BKwx03O3vJd+frVE8kbRJOxAidgzWU3+M46idUPj4JY/ji2or61qN6
         iFQfdI2q9HbabuCUzIKyuCuZZP+svfWOurR7utrBBG8lxHgf64RUya9tYBYoq/IZnb3/
         vASCFCOveG3OPw4M9ElkzqOYoiWkSkXpjjzjUUkhiJcB7Uovli7STe8/BYj4orSkm5AF
         LTlyYI4wyNCu+hgP9xZwpFMXRxL0suMMMq/Wud/F2UCWdoxIQljh+9HLdF+xzDphLUPc
         JhfNdVvIWSYHIRmsF16qeXPK1XW0ExS6lCFXaFznUtqNyynV9EM41UOdeXzlroAzAzkv
         hWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7fqf134knRgs1GXmfgOSjMnBIhN/vd4XYE5cKns7XrQ=;
        b=kWoIwKUYD3xs3g/mKOl25QMXS+Wx6xOlxGItZPrBZr+cJtX0dkbilEmJKi9gIcP5dJ
         LdLLnvAg2LS9khQHzSqyLoBLHkegpx0CEkmaWtK/zPZnbp5Fs5IxmEPuOCEPTY7P+I4R
         IZJn5pC2y1G4lrTUKPBQvs0UXt42jqdaE9UndWe1uvkQ/4A+AVrgfssg1Gnul8ko74S6
         EwVdxx1KROL3UeeykMhqTmpLtrvYEo7y4dxcA/qPRf0w6h/LjBiyEnuTrHL7OmqUrQS1
         phEWX8BXvyhYfUdfz0NHPJPdzt5p+zB5exDSmU4kcnBNXKC+DJGNF91Ssb7Zi6uIWBKD
         6zyA==
X-Gm-Message-State: AJIora9nNLWXxP+TAsn4oFsrQI7eM+8JhpsZmuNXUG9nA4I1MPirGDDa
	5a/krQuvMhlqy+hZxqSg37m/1g==
X-Google-Smtp-Source: AGRyM1v3rnjEGEokBmIwXs+uwnFrAQV1ikK8BVpbbLHWxG5jXedwQJfIfb9jsTWa7DY6Tagub7QPEA==
X-Received: by 2002:adf:d1ed:0:b0:21b:c74b:594 with SMTP id g13-20020adfd1ed000000b0021bc74b0594mr8958606wrd.221.1656364689777;
        Mon, 27 Jun 2022 14:18:09 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az14-20020a05600c600e00b003a04c74efd1sm3048630wmb.21.2022.06.27.14.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 14:18:09 -0700 (PDT)
Message-ID: <ed893417-2c5e-c019-04c6-c7c7ee138ef1@conchuod.ie>
Date: Mon, 27 Jun 2022 22:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>,
 Heng Sia <jee.heng.sia@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-7-mail@conchuod.ie>
 <20220627211314.dc2hempelyl5ayjg@mobilestation>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220627211314.dc2hempelyl5ayjg@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_141812_048839_AAC920FF 
X-CRM114-Status: GOOD (  19.83  )
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

On 27/06/2022 22:13, Serge Semin wrote:
> On Mon, Jun 27, 2022 at 08:39:54PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware timer but
>> according to the documentation & devicetree it has 2 interrupts rather
>> than the standard one. Add a custom compatible that supports the 2
>> interrupt configuration and falls back to the standard binding (which
>> is currently the one in use in the devicetree entry).
>>
> 
>> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> 
> Firstly, it's page 51 in the framework of the document pages
> enumeration.

Ah yes, sorry about that.

> 
> Judging by the comment in the document above and what the HW reference
> manual says regarding the IRQ signals, what you really have on K210 is
> the DW APB Timer IP-cores each configured with two embedded timers.
> It's done by the IP-core synthesize parameter NUM_TIMERS={1..8}, which
> in your case equals to 2. A similar situation is on our SoC and, for
> instance, here:
> 
> arch/arm/boot/dts/berlin2q.dtsi
> arch/arm/boot/dts/berlin2.dtsi
> arch/arm/boot/dts/berlin2cd.dtsi
> (Though the Berlin2 APB Timer have been configured with 8 timers.)
> 
> So the correct modification would be:
> 1. Split up the nodes into two ones with one IRQ per each node.
> 2. Make sure I was right by testing the new dts out.
> 3. Update the DT-node only and leave the DT-bindings as is.

Hmm, sounds good. Will give that a whirl tomorrow.
Thanks for the info/suggestions Sergey.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
