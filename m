Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C1C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6DY/TvtKIw+hIK2HrGJClw9Qfs8OqYrPsOZP1uzbmI=; b=eH9Xzuw3SDPucW
	uAzEiKSEmsBWDfnXiVvgqUBFkmZ2NxRIWlyeAxWPlKsU7hhlNyfz3esHO5UdJ2M4e9XP/tQFVso5m
	qtEkPm3N2fneJ2kIcIT1mlpDUt1uPgQM3PHh9p+9eMDi8iuQ3gIkzQqxtlOtLqVD6DC3NmvQo40h0
	lvUAUxE9V5eEgyCm+tVr+KrlvI9Q8Nm3MH3Fr0e1yQTSgb8v0qTdQmaVh6LShkiOvTJVaTJQooaGs
	vVzm4yYjZcAp7+D9EvbJCzn4FQJmI6yf3vYUh4p63/D3XxMULiATaY14WWhJPS5PyFfpWOnvYU/dA
	RCjvfY+pwyQTF3jnv3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uuV-004IpO-Hs; Wed, 07 Dec 2022 13:56:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uuR-004Imf-NL
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:56:29 +0000
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 31BCD44345
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670421386;
	bh=AN5JF4JjPpOJkZ/tkyQphRahAoTXPLdfhR7No5Nhr94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jei3mGbblDEH/5cUMoQs+XxsOWdroGAdN8MOzYk/4MmToDd/v3XpTjLw36WVwO55G
	 0sSfVTsv7nubsXdxEBXlwjey81B5Z5ZoMLpbXQt5Lpkfyt4laVdSkNVCl22i8TgJ7F
	 ClM8wjpm0U0h99oceRXr1OHwcyTIV8C7NSL1kpoR1rUth1O6SBBwQWTh3U//FQJ3IH
	 PWWlAKikhhk2yi+8WXi7Fgg8AfnQi8k+ile9dCG1kmsSYnsdpcmO96c3TW296gJvO+
	 oblcufOjGuqPnAPlczDq8vmV2aAQLx+LcJCt0E1W2cGQpQ9S0sYDcB3uUZjBuOIwYM
	 9HXixBwxZlwyA==
Received: by mail-io1-f71.google.com with SMTP id p3-20020a6bfa03000000b006df8582e11cso13750461ioh.22
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 05:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN5JF4JjPpOJkZ/tkyQphRahAoTXPLdfhR7No5Nhr94=;
        b=BVH185X325Zc+zmbHyIxWU6Kum1Ny3KxLqY7a6e9mewtnkQ2UALXolq3fz5fM/O0sP
         dJUUUbMKE2ndwzxNYt5eUjVfhffbarNC1ccbaPfs6DNUSNPesEc8KHvGkTQI7lb4xfoj
         5HVklsOuoHpZlTb7KAKbnnFySmWBvM5FvpCRNCtCpq4Xo+kDFkdGVeTfS7cyICYFXK6r
         fvop6K4/E6MBUce1Fp9zgISKWV8RkUoO3D/vTTtPVd/xs/0Jdc9k/kfKxupFc2dSLuGH
         kSPuRzIYaxlv9zdhcs6xjtN1Swmnu1K2VUI11chwmz+4Dj9OiBmg8Vgzb8a1sfpQWh6n
         dKKw==
X-Gm-Message-State: ANoB5pn6nvhZLciWLutVBOrk7aqQxDEBNUQRmUhM0iLXVl/bJ4sghTkw
	T4uY8cPvnKUTkrCmwyCqeXBX+eclcU0cLOFvNf+5ilri5lGTfMKeeIqTw1PDeyZDbkZGaLcHHl1
	MnYg2jpY5lOp+WytFb/HfWJL2lZ5yXocqGnUbT8Mnpu1/0vuP2QtaauCnqWgefw==
X-Received: by 2002:a92:cd43:0:b0:303:2fd2:f612 with SMTP id v3-20020a92cd43000000b003032fd2f612mr15125917ilq.144.1670421384613;
        Wed, 07 Dec 2022 05:56:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68T1FZSxevGnNf72rEE0f+xwVzoSCPSjB0SLRGWkB37LRAqopLc6DAcKKSJpFo/ZWVkn24R+SZbWzdDyZVHaY=
X-Received: by 2002:a92:cd43:0:b0:303:2fd2:f612 with SMTP id
 v3-20020a92cd43000000b003032fd2f612mr15125908ilq.144.1670421384463; Wed, 07
 Dec 2022 05:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-2-yanhong.wang@starfivetech.com> <277f9665-e691-b0ad-e6ef-e11acddc2006@linaro.org>
 <22123903-ee95-a82e-d792-01417ceb63b1@starfivetech.com> <3a9ef360-73c3-cf26-3eca-4903b9a04ea3@linaro.org>
In-Reply-To: <3a9ef360-73c3-cf26-3eca-4903b9a04ea3@linaro.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 7 Dec 2022 14:56:07 +0100
Message-ID: <CAJM55Z-iLy1fZmoyk3FU7oDQcKBk6APYf-cbamKr7Gjx+NaoTQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: net: snps,dwmac: Add compatible
 string for dwmac-5.20 version.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: yanhong wang <yanhong.wang@starfivetech.com>, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055627_932944_2ECC1B6A 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, 2 Dec 2022 at 09:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/12/2022 03:53, yanhong wang wrote:
> >
> >
> > On 2022/12/2 0:18, Krzysztof Kozlowski wrote:
> >> On 01/12/2022 10:02, Yanhong Wang wrote:
> >>> Add dwmac-5.20 version to snps.dwmac.yaml
> >>
> >> Drop full stop from subject and add it here instead.
> >>
> >
> > Will update in the next version.
> >
> >>>
> >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> >>
> >> Two people contributed this one single line?
> >>
> >
> > Emil made this patch and I submitted it.
>
> If Emil made this patch, then your From field is incorrect.

Yes, please don't change the author of the commits you cherry-picked
from my tree.

But now I'm curious. Did you check with your colleagues that the dwmac
IP on the SoC is in fact version 5.20?
This was just an educated guess from my side.

/Emil

> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
