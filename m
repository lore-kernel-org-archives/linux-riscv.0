Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160F4C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d+1fuGkNbqmwCMx9UKCE2tFQFavGib5Dis3exJ03QA4=; b=cVk/GzrReltVhGmok2Z+X2R7Ho
	3zjCVzCQqw9eTshDIBwT9tqz7PWcZH8MTV6HpiyLVbDJd26yfXp9oOGwJhBPc9xkd8h5AZFqQwq6E
	2OcxuqgfXnwGzLbdP2CZuJqwTEi/WqaxmgF+d4SsGEF1Puq5DWrTWn48ii3jszD7CtihZjgdyR0qF
	MmtKZ/cYgtdvmo0pXvK5VTUr6348WrnNE4NS0kvyZWK9K5eM36PpL6hflBPhUuzW96X6GJBGrr+VS
	Bs025F0QxXlc86ger2UEzb8KYQ1CZ9WhH6aFuidKgLCbKNeYuCKT5wElVArpVZPHX2x9UNCkV8yS1
	apY6Yuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNOJ-00000009UkI-1f0m;
	Fri, 07 Feb 2025 12:23:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNOH-00000009UiZ-1wRQ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 12:23:26 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 876D93F16B
	for <linux-riscv@lists.infradead.org>; Fri,  7 Feb 2025 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738931003;
	bh=smgbTMbeu8icVrnu9cfoEB2Q5GHev6Hr1t62+cNN3e0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QwYHL8/g/4Lo+inwBAQU5XKas6zRFoIXETME2s2lLIEOrKxJsyI2UBiVSwfWmvOys
	 2/IT6SM1kAhoNLsOD9cLL+UaWPjp7fLcV/xiLvXPLBTV0iZEF5EqYlFC5NdWcJsOgn
	 uS1ChoWvlovysITB1VXpXUvkVmc0eFmvKzGTzepE/LZOgzxNzbk/wu6Yka39ho4O7p
	 dqryVqpABEXh26a9GOBbe1V9ICuHZb9Q/0JChx27upqRnypjAHCq34uID3ym/fczXp
	 6DrEz/PlzimbXeYA8CNx7UG3S0GQsUxUNlKga+plUDnuAc4KM3KNSf5IJNPzavM3vr
	 5upWqYkIgILjw==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3eb9c1ce675so1811681b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 04:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931002; x=1739535802;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smgbTMbeu8icVrnu9cfoEB2Q5GHev6Hr1t62+cNN3e0=;
        b=BkS4KNca6HNJGVfiGxyn0/LmIVwWGtYsvh6LJK7DkM7D+0J5srDGMmmmfliHls600s
         iQg00jqNwzb1bDJMd0C4/ZZjynUw5AJJ44o1hU/C1INuN33m13gtFjxWpz89p+MD3Njc
         3xFK3+Tegj25iZEf/Hon8Rjvk+2QdkF5fURoly8+15rlcjZ4cqHeLrZQC3K+BJoHsbJN
         QvNc6N2ua8CiRKoOFtdDA3yBX0wQvUOeLG11t/zOlyUxVvWqDEqO+eyoXAr9zwsB+7qn
         21GEt+tBiKNhBR0w1mDLZnwkX7c2badrabacwV3El7TyijlsZRu2vQwkoEU8CW30wqbh
         +r8g==
X-Forwarded-Encrypted: i=1; AJvYcCWneAJ4MK7nxbvhijI3mk1ZfIVcBgIrzTpzxpAhHnW1fs9OFbzb6KcNO7NSnDZMDJnby4pmwx8mSC6x4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhF2gTWadRlvzsGVT+wb6PzrZw1f+6h6guJybw1HK6BNOj1gfM
	NuTjceNY7nv95I5Pj5HXGuS+IbcTg0WD8pV8ks7XKT58JkemWwaEeeVF944wCce9oh3S5Oi44Uy
	b+2BKp5tL9opOyUTXLOCPDdTAX1IsBk89OoNVAy2KawkjTCdh24WGLu96DwmLJQRSlNjzU6BSHA
	oEV9EHt6iAvDxIS5uP/0lcMC0g1TbWVv1D1u35KSoUH6gHZfEtnDNLGjU4cYzOl+Nv
X-Gm-Gg: ASbGncs9TLKGnNz9PB983xlpSxUgKOH4eD7f8OI+ywN1HdgQegx3C3+mCbIOSGUQDWC
	ncfzshXUvEqASz0D7LAN4f+CYD5IfviEeC0VaHr5ZlJnlcMugI/0XN2mL2Tqp5Q==
X-Received: by 2002:a05:6808:158d:b0:3e8:1f5d:b804 with SMTP id 5614622812f47-3f392227aa1mr2106144b6e.15.1738931001834;
        Fri, 07 Feb 2025 04:23:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoWtq8QvHTFwUXCNlAOzdK6vr0/WNVnEmu1/clVLO6yPv833r20851aMa64CXNcis26sE03zc6C9b//9W3WHY=
X-Received: by 2002:a05:6808:158d:b0:3e8:1f5d:b804 with SMTP id
 5614622812f47-3f392227aa1mr2106085b6e.15.1738930999827; Fri, 07 Feb 2025
 04:23:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 07:23:19 -0500
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 07:23:19 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-3-e@freeshell.de>
 <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com> <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 07:23:19 -0500
X-Gm-Features: AWEUYZmFMLw_yZeW-AzXd8sVPQD1bUtN_FeA79ISlCbVkryjsD8gUyr6HkVDrCs
Message-ID: <CAJM55Z-fvjUiKEnOAnT_HLt0JHYooSgDWW+MpSq0nCTFoxPv3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042325_627141_C089EC35 
X-CRM114-Status: GOOD (  24.68  )
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

E Shattow wrote:
> Hi Emil,
>
> On 2/5/25 02:18, Emil Renner Berthing wrote:
> > E Shattow wrote:
> >> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
> >> better compatibility with operating system and downstream boot loader SPL
> >> secondary program loader.
> >
> > Here you should be explaining why these values better describe the hardware. To
> > me this just reads as "u-boot does this, so let's do the same" whith doesn't
> > really explain anything.
> >
> > /Emil
> >
> >>
> >> Signed-off-by: E Shattow <e@freeshell.de>
> >> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> index a5661b677687..8a59c3001339 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> @@ -317,8 +317,8 @@ &qspi {
> >>  	nor_flash: flash@0 {
> >>  		compatible = "jedec,spi-nor";
> >>  		reg = <0>;
> >> -		cdns,read-delay = <5>;
> >> -		spi-max-frequency = <12000000>;
> >> +		cdns,read-delay = <2>;
> >> +		spi-max-frequency = <100000000>;
> >>  		cdns,tshsl-ns = <1>;
> >>  		cdns,tsd2d-ns = <1>;
> >>  		cdns,tchsh-ns = <1>;
> >> --
> >> 2.47.2
> >>
>
> That is true, there's not much to explain. It works at delay 2 and
> 100MHz max. I tried many delay values with the pre-existing 12MHz max,
> they did not work. I don't have more information than that except what I
> wrote about on the U-Boot mailing list [1]
>
> [1]
> https://lore.kernel.org/u-boot/ZQ2PR01MB13072E932737DD9D65E3A250E637A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
>
> The parameter training code in U-Boot when given max 100MHz has this at
> somewhere between delay 2 and delay 3, where delay 3 almost appears to
> work but there's data corruption, and delay 1 is totally non-functional.
> With all testing so far the delay 2 and max frequency 100MHz is reliable
> and also is a common occurrence in the Linux code base for similar qspi
> access.
>
> My testing methodology was pretty extensive and I wrote about the result
> on the U-Boot mailing list, however here we're taking the success of
> that in U-Boot and literally just applying it to Linux where it also
> happens to align with some common similar assignments for other boards
> in the devicetree code base. It works and there's no deeper insight here.

This explanation is fine, but it should be in the commit message so we can go
back and check why those numbers were chosen.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
