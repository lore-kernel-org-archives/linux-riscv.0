Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F6DC3F6B0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uON80Ochs8yRfIdG0TwKEAQCJk70AxDNXAgPRtTu5SY=; b=OBNegM7k9rLsf/
	RZuN+dAZTa3UF8CWpxbEky55wgTFCNaf5Am0SE0sPma9bUDGQLT42QNsNHIq3d8HK/aBG5Pv8MEUV
	yk+4/psWDI7gy801UNbHynjsSXLO7HtkAbiWOPy3caMJ1AfHogjl8WibVD7h8ee5jKkhsKMMEYO+6
	lWCfGdLrkEj5MSeyrDK10IQfR2ZS2q1JUdtzHGBIZ5mvzOHXpRKUe5wEz/tZ6x4u3YV5Urp+NIRoV
	PVvhGk6LDCQFZqEfwuIHk6Stftuiz9H8E0ZB5ARsPJFz+qW1xIMGWUhdXsOKsB9iHJe380LzdoZMe
	K5N+8t0WG/0wF5LBFwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJW2h-004Nir-Sd; Thu, 04 Aug 2022 08:17:19 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJW2e-004NNa-Gf
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 08:17:17 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mm9NA-1nbPq11r7Y-00iEbb for <linux-riscv@lists.infradead.org>; Thu, 04 Aug
 2022 10:16:37 +0200
Received: by mail-ej1-f48.google.com with SMTP id kb8so20926797ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 04 Aug 2022 01:16:34 -0700 (PDT)
X-Gm-Message-State: ACgBeo3D3828g6dqmuqxThzQWsAK9aVruNwzg234Gkzwq08OasmpMQML
	hQWK/K2pMeaydIuZUEDqrFJDvqUYt6a6TPeG89k=
X-Google-Smtp-Source: AA6agR6Jg653+yBBOUyAYrjW3VBIXsaHZRBgf5YvZt1uhUezA9TFx1DbJkqof0fuLkHWcFEb9AVXoO4ROyCCP0sW+j0=
X-Received: by 2002:a17:907:7395:b0:730:b636:2c89 with SMTP id
 er21-20020a170907739500b00730b6362c89mr572107ejc.547.1659600994444; Thu, 04
 Aug 2022 01:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220706231536.2041855-5-heiko@sntech.de> <mhng-d90c67dc-ace1-4413-9010-f9f26c60d3da@palmer-ri-x1c9>
In-Reply-To: <mhng-d90c67dc-ace1-4413-9010-f9f26c60d3da@palmer-ri-x1c9>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Aug 2022 10:16:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1kE0FAbeUoO-JwzHKPsDVyTT7GGCsLoow=V2zKdSr0_Q@mail.gmail.com>
Message-ID: <CAK8P3a1kE0FAbeUoO-JwzHKPsDVyTT7GGCsLoow=V2zKdSr0_Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] riscv: implement cache-management errata for
 T-Head SoCs
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Guo Ren <guoren@kernel.org>, Christoph Muellner <cmuellner@linux.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, 
	Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, 
	Randy Dunlap <rdunlap@infradead.org>
X-Provags-ID: V03:K1:YU4Fh8N4eZQoW64uUeeENnWxwORatzBw1vHWzSrnLE9kOkJnpEk
 2Qnc58q6Ecez0Is3KDGlUAQeSHI0vgLMLD8BzKz5O8MNMfH2lJUgZ1EU/4h/kpRi6MnvRV/
 KzuIBrFbmb13L+ZNH1Dhdgq25NZR6u03iliF3YvtgkP7kCDiubGwZ+eZ6I0cpfnWzuzcELW
 Dfn7e8A8bIh0WIUx6Wa/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sq3kvwTD+uo=:N8C/qmiJbsemJ6Oero6Ha/
 aFp2602dp7Ye6AdKyXVARRpGYYj0jzmQg3Gmft2LG+FEF7uMVBKl3ok2L6304Up3/8XWgj2Th
 o+SAw6onkNFVU12FY4Aikh6cUqpKrb/KkJ8VZSd7va+fAx1+dYVrixX87Jad4iXJDSwR8JuAK
 PeTQQrznjOlHpdSWbwDz/acy/S2XPr06vh7HteQD8Nv29SbgFDut4DjjJoiHlcNw0dtJLI9xn
 b/F33LtK6DgYYTVRyQjOjX161hxR2Y1/c+BbFyWnjrFI0cxAEyPn/J7TSWiFfPEOQPCakIfwf
 fPsAZeFHjdI5Brcz7eclqToRo8OIMEqGQB8/uVK9oBhp/auDLOvxNgJPBINx8ECpf57FTAlCQ
 YRweRYGom+ltsbulco+tDWVZSXUu6whtUByM+KsBDXARAhhnjbqvNd0DY+Oio5h70PfVkXyiO
 r6lrVVpL3ntr5X5pY5zMZM0M++p/E/xQ/8/T9MHKKPDXjYpfGqFsJYNn5ogwUjxi37BfJczkD
 4UVMOS3egLfG55T1uo154JTtwpx13Cu0D08YTc/ht6skqcqo3ez1JHeNe96CKAkHbftiyaD1w
 hqZw+kNUuQEzsr7dCaatFrlQRDT1oRZKh/VmAuRrORqmiabwsTfWvpA1DmYhSKnRzCBthHsDc
 FNlk0b6iss2E7fitjdz8S/hWqqvPzzGcsA69mBm42XhPn2AKzOGJUWfHTKlQz8tRoEWShViRv
 TARj2wPdFW9GsFBTCR6eZyhincrJzOwMhtCH3F/sIsOI6tZZwQjLk4bMkqUDRy7BLT/lSrMIN
 /troDJ7d/883+RTcKSotOZmYHtE1mooqG9ufizaMl3KI8jWns93cs6FT16839EoFRDW2jVdom
 CnW2R+i4h07HVgGgCN9g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_011716_853731_B1671701 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, Aug 4, 2022 at 2:28 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:

> I know I said I really don't want the executable .long stuff for this,
> and IIRC that's a pretty common sentiment.  I'm not sure if I'm just fed
> up with all the craziness, but I'm kind of inclined to just merge this
> as-is -- at least that way we can get the hardware working.

There is usually not much choice here if you want to allow building
with older toolchains. You might want to add a comment for each one
of those to reference the (projected) binutils version that adds support
so it can be cleaned up after you raise the minimum toolchain
requirements, but that takes years.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
