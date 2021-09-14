Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A29C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 06:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A1A6112D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 06:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38A1A6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMYw5w1P++1haTLlgBDLRw9uG0kz+6FNuPxEQif21Ro=; b=nV+LTTMEaYeH+pOfRovsF/lape
	Y8MMBPHsgfbmkii4un9/d2BxDXUjVTAyvSU5vCKPFNESvVKxoKDS86MNJSHuGvgDNUS5yMpKKnHOX
	VWuR+xw6d6qzCuTpivTI04hud26N0GvY+vCVVn/mWMamG0PY7AmtTQvBa/BpuA215ZpPGFGxEDHTl
	H235VGzs7Xi39U+4MCPVTatzBeQ8GgvW4HjvjKdd7hSBBIxj7wTiaBTMExhLUaSgJiHY2VpvzE/eY
	HAYw+SHtkyiQXUZ6BIgwk+y0n4rbv/c80IS8ZpnRauW8SJ2Lao3mC3jaS2qJEzzy4OKlf3QxLS/kH
	L0iWfOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ1xQ-004HN0-Ec; Tue, 14 Sep 2021 06:30:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ1xM-004HLh-P0
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 06:30:15 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CAE34017B
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631601006;
 bh=mGyLy4lM5okQDmHALZVjk94Ha/DQjAy4TbWZ9Q6x1pw=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=dab3kxgn8aTjAzUDiwBy6Fs7tWZJthSo2WvtKu4+4OpTlDUk8jS4e7+iG8rMd+K2C
 ad8mX/ilGascPhQV7T+gsQH5r/ZnFzJf40ZSczqUMXuUZMK4owJEOlGJNvUtJ1mYy8
 KN6HLoAeCkfROWg/kEUxYgE0wznYmMCGN+Kg2MaU6G9SF4Ow8sDOS/OK9gihEevqtp
 ppkPRBc8NZgHiEQDKpsy76HbVvzFwuEJ0uVQT2TUY0J5fp2vmcpKtGwIy2pbxTVaNF
 yF7S2dDIf8oL9U9ZvHixu8OoWUxW3i/6n3EkEWO1uOkk0Umot0HpWyq+nDFlUhQqvg
 sdfP/zdi9D8Kw==
Received: by mail-wm1-f72.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so6001747wmd.5
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 23:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mGyLy4lM5okQDmHALZVjk94Ha/DQjAy4TbWZ9Q6x1pw=;
 b=tgwnz+GLjPb6Qdm384F5QeoBRVKr4hUlvaM0IyIcuUQs5oH+wXcDMNPeEwzkdRBYqk
 KDXKntmT79IAiMqfty8EUBB+YXc03ZxZiU+g5NzpJ5GMHu0dPh/GeFEy1NPv1mw83zsQ
 hbICO/ZgW7Lzl8DCc0ImBQPNxfg0hSWNZDO3HnMiS9mYK9zgv4P+hJMtiqioghn5p5tA
 JAPrapBMzGfTto6VCrtRR1BUa74GItw4Lti1pRcnPjermiPDkPlHltDVij2a/XpFcHXy
 Qtx1djUtH1Ql5JwT1vfIygD/LNeE7+P0hNNrlHmsJsjplZi3RSIupSUZIUXWd0gP1+SZ
 H7jA==
X-Gm-Message-State: AOAM531nCxC4r0SLA7ryA911T67ZUMYqEbC0Zedml/WyoaBC0WKwG0b9
 mjRC4y2b+9HjpyQuKCppF4JJ2uXvVhJrfYiECAMuj7bR8yvpmOUFqfRH0pYidk4zDg1U6Qz2vFf
 4yRSmzQ7+fIL0RHZrncHJwzRp5rVIj0DOOoS4jdKPOxzaVw==
X-Received: by 2002:a1c:46:: with SMTP id 67mr281426wma.29.1631601006117;
 Mon, 13 Sep 2021 23:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyoWwYhUPQD2O/E5bqOQvwgFgn3xJyU4lqo4GZBhWWfuNE3Yxbbaofe70nMKnO2KpYYR1x0w==
X-Received: by 2002:a1c:46:: with SMTP id 67mr281401wma.29.1631601005871;
 Mon, 13 Sep 2021 23:30:05 -0700 (PDT)
Received: from [192.168.178.189] ([46.253.247.67])
 by smtp.gmail.com with ESMTPSA id q201sm182015wme.2.2021.09.13.23.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:30:05 -0700 (PDT)
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Samuel Holland <samuel@sholland.org>, guoren@kernel.org,
 Liu Shaohua <liush@allwinnertech.com>, wefu@redhat.com
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 lazyparser@gmail.com, drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
 <9cd8db15-7431-dfec-6e48-dcf6b30d4f6c@sholland.org>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-ID: <b6ea6e53-cb38-3b4c-c8a1-241e48e123ea@canonical.com>
Date: Tue, 14 Sep 2021 08:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9cd8db15-7431-dfec-6e48-dcf6b30d4f6c@sholland.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_233013_476558_F6C38BFF 
X-CRM114-Status: GOOD (  25.71  )
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



On 9/14/21 7:16 AM, Samuel Holland wrote:
> On 9/13/21 10:49 PM, Heinrich Schuchardt wrote:
>> Calling a Kconfig menu item "Allwinner SoCs" which includes all
>> future Allwinner SoCs irritates me. How about CONFIG_SOC_SUNXI_D1
>> instead?
> 
> Would you want to have a separate option for each new SoC? That seems
> like the only way to split things up, if you want to be more specific
> than than "sunxi" (or equivalently "sun20i", which is the codename for
> the RISC-V series).
> 
> Except at the very beginning (sun4i-sun7i), there have not been clear
> generational boundaries between the various sunxi SoCs, so most of the
> 32-bit ones already get lumped into a single symbol (MACH_SUN8I). And
> there is a single Kconfig symbol, ARCH_SUNXI, for all 64-bit Allwinner SoCs.

On arm64 we have avoided SoC specific Kconfig symbols and left it to the 
defconfig to select all SoC specific drivers. Generally the tendency of 
the defconfigs is to provide a multiarch kernel. So this should be ok on 
RISC-V too.

I was just concerned about the 8250 driver assigned to something called 
"Allwinner SoCs" which didn't seem future proof.

> 
> There is enough overlap in peripherals that you need a common symbol for
> the peripheral drivers anyway. How about... ARCH_SUNXI? There are 90+
> uses of this symbol throughout drivers/ and sound/, and I have found
> that more than half of them apply to the D1 (see e.g. this commit[1] and
> some of its ancestors).

Looking at the current use of ARCH_SUNXI in drivers reusing the same 
name on RISC-V makes sense.

Best regards

Heinrich

> 
> RISC-V has so far adopted a CONFIG_SOC_xxx naming scheme, which is
> different from arm/arm64's CONFIG_ARCH_xxx pattern. But now we have a
> case where a SoC family is split between the two architectures. I'm all
> for consistency with the names of other RISC-V platform symbols, but it
> seems that reusing the existing ARCH_SUNXI symbol would be better than
> cluttering up the driver Kconfig files with a duplicate.
> 
> Regards,
> Samuel
> 
> [1]: https://github.com/smaeul/linux/commit/7841e5c32366
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
