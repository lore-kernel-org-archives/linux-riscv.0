Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA44AC77B75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAjj6rR1FRHdVW7MCHEukN+iKIbpXrdV7o60IaaHkcw=; b=Bs0zcHhU6v12YI
	YXn2D9k8oXTfZxj1yxWSfD/5A44UfBz1lQdj9CVKkS2uT/SiWN+GSuCXtzlGi+daowYmeT8KASkmy
	/Ue5oJXnBZH3V91Y3AIDPfEbHpUIMJ9b3v0XYk97z4Tt0H8tOcvgnNq2xSfusEuzMcQpaVJXDbLyH
	CU039VKYREMgSGfwrBm3d91O/H2w20GaTgUJdS9DjknKqGWgXtYZ4cvoz/vyPLvC0nFeJZwTiRwGW
	6o+y7BpsmlaH5b0OmvtxD733uZCnNEDw0VnYhJMECehv+VQ/Mga+IOfWXAHzvcFRZPgdKHwDTGM49
	272CgR1HBKzSHb83ioyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvgB-00B0rp-2A;
	Fri, 05 May 2023 13:40:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvg9-00B0qq-19;
	Fri, 05 May 2023 13:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pJVTeItn3/q+rs4Fp3PPs4uhLe3EOiwtZ3p5vx2OZsc=; b=W0pAE2fmWnMDf6ldl7oxkXrQ4N
	jZvedsxSqWV6bOY9OYQhFO4hNe5zQskalRNk7spT3vK5kV/oD/xVwRAfQskwdxzbWTnJbB6Ie0j0R
	G2VKtRCcDc0dkqDBPYtFanfK/5Poi+oEHUlRoxQid7CKFulpDvZE25ofUNSrmU2H3ei7KJ05QN2My
	EJAduXGJzbq5bFscPB3H2x7PSrsqThuJ1wZRcwog27qi04ZzrgsxRTd4GMoJPaZ9+jyxylSUv2h3B
	wrtQLfEb45AO6zrUtX/uUAjDj5QtPWxFircodL/LTozeI4akCm/tXTr/yvFv0Elm0leNhbvr/BnDV
	CcF3srQg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvSz-003GDU-38;
	Fri, 05 May 2023 13:27:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so3403178a12.0;
        Fri, 05 May 2023 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683293239; x=1685885239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJVTeItn3/q+rs4Fp3PPs4uhLe3EOiwtZ3p5vx2OZsc=;
        b=pW1eSFQtUOf4qd5Tqc4nNA0Lxc0orupxla+piV27edUUubj0zCl0YBkqsHBTbF1tz/
         shZdBzRzJe/A/ESNBMVAqzGsJu/AzM2GR7Vme5pGfkRQ33GFyXbqkfr05hDtF3lluygb
         ob7DwNWNnLG1srjhhp2cOse/kn/5/0QBVA/eFLxiMKNFwzbiJYDT+3WpcqvXcBxuTODL
         m01ijHjxSezLk8GFHifw9arl0IJDzEWpb1C+SCMXboqI3V4VctTKfd4WAkkgPn+4ipKV
         FHoUO3GseDFID+qZdDBuoxD78K+IAzlmeAvEnGsCIzaBUyzFyLSG884H+VKhqF8UIylS
         LQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293239; x=1685885239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJVTeItn3/q+rs4Fp3PPs4uhLe3EOiwtZ3p5vx2OZsc=;
        b=DgVHIhvuVZqQi6sMt36xBQUHxAPTn1TUCCiyjr22w6Pldj0WKHR1Mw25wVKRwqRdv6
         orquB3iNzQtHYH1y+o5G+aCY2zU1daP1BmNR8/6KrBhIX+0U9exovMQwY7Ac3lQD7zB6
         vK16IxV8pZ/S60i/zmwQfvQ5RZb61p1Pcp792h/gcKhdtjvpJ+2+PekTka8YpkoKa03v
         y40TjF3aJiFboY5UziKRt/BVNTYkitIRVGVoM8yGl9UtROB3cxn3bOpMKbxfzNZQFHNH
         5a0AD8n2yF2/XTyl9U58nvus0f2lrU4SPQpdnW6r5mihAGyPLFR1ew9QYV3V/odxb8kH
         8kcw==
X-Gm-Message-State: AC+VfDxIZBGH3Y9XJh8iFWOlLLMHkiwLOFhuQJ+yr8Z3HLj3W9aR8KqY
	dngw+0b8i5/6GpRoiFKVTH74EiSyYG0mxq1XpZexy1KRvZl61g==
X-Google-Smtp-Source: ACHHUZ4j4o+3ks7gqO0Cc3az7qvWANuOL9pmgjp9OgEvccsoElcFtMR8UppD8ccMx0iGR4Z540YQjU8jVHujZAMcF4c=
X-Received: by 2002:a17:907:3e05:b0:94e:988d:acc5 with SMTP id
 hp5-20020a1709073e0500b0094e988dacc5mr1256436ejc.46.1683293238964; Fri, 05
 May 2023 06:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230505074701.1030980-1-bigunclemax@gmail.com> <20230505105805.548d1a1b@donnerap.cambridge.arm.com>
In-Reply-To: <20230505105805.548d1a1b@donnerap.cambridge.arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Fri, 5 May 2023 17:27:07 +0400
Message-ID: <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_142722_060574_68396174 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Andre,

> From a quick glance at the manuals, it
> looks like there are not quite the same, though: the D1/R528/T113s
> mentions a SPI_SAMP_DL register @0x28, whereas the older IP has a SPI_CCR
> register @0x24 - which is not mentioned in the newer manuals. The driver
> relies on that clock control register, so it wouldn't really work
> reliably, if that register is not there.

Thank you for pointing this out. I missed this difference.
I actually have a board with T113 SoC, and it looks like writing to
SPI_CCR@0x24 does nothing.
And it doesn't affect access to connected SPI NOR flash (read\write
operations are fine).
But I completely agree with you that this difference should be handled
by the spi driver.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
