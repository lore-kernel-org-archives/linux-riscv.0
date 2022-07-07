Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2C7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOdR6+y4s7xU7yH9dJ1RN8y85VIEs5MVziwQuFxhE68=; b=JxHEQ9QxGQ4oWL
	uVizFpyOfBEOzceWWRA9n54+f7563Y0yJLHop+eq1XYPWesi60Qt4EvLs7ueI5f977vm18JbGWL4G
	rQHO0RaySJbsEwgJRS6Mzb8PRPsCthsJRUq9qzun+/nEM1MNjoVp3/J4dfo0vBgB7L8OKeBXz/wyD
	Ji+xr41wYijJFGXu94jFeGfhNbEuv59mXzGXvimqc9ON4dASEEbNbkvQgeomeFKQ96GgVUp70hymh
	0NfQYL5CI8p/4E8CNRzr/BLa0qpB555ZteuxTzroF0W5rtlTzTNp0L1gsRgkzKM5bsWsrwZriD4jB
	4zjfcGRa5r+VlW47h3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SXW-00GUW2-CE; Thu, 07 Jul 2022 14:31:34 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SXT-00GUUe-DI
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:31:33 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJV5K-1ntz183OGW-00Jqcb for <linux-riscv@lists.infradead.org>; Thu, 07
 Jul 2022 16:31:23 +0200
Received: by mail-ua1-f47.google.com with SMTP id l7so7081909ual.9
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:31:22 -0700 (PDT)
X-Gm-Message-State: AJIora9KKLRgP50qNcge+xiR7Ekr9eVupq8vQS5zgRRJ8uDm38J4nQQC
	1uNA9XOZDXHYODKpRMgyzQ0/HnXmQPK/Hzgvq8s=
X-Google-Smtp-Source: AGRyM1sHO0vLH5lK7prAzcvvwHxD+arEX2LzrQE6vcetrOrIovZ6/GAY1MqKVLA47Mf3l6xqB5z1R2OI4jP17F1EQlE=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr19094869ywp.347.1657201076632; Thu, 07
 Jul 2022 06:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220622225822.2166305-1-mail@conchuod.ie> <a39bad24-d2bb-ef3e-d57a-2ac4fa1156ef@microchip.com>
In-Reply-To: <a39bad24-d2bb-ef3e-d57a-2ac4fa1156ef@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Jul 2022 15:37:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04WLx4Me_=hm9v+Kpq31i3ZCDfPiDhT64RyE_pZZPDVg@mail.gmail.com>
Message-ID: <CAK8P3a04WLx4Me_=hm9v+Kpq31i3ZCDfPiDhT64RyE_pZZPDVg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4] MAINTAINERS: add polarfire rng, pci and clock drivers
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cyril.Jean@microchip.com, 
	Daire McNamara <Daire.McNamara@microchip.com>, Lewis Hanly <Lewis.Hanly@microchip.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, gregkh <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa@kernel.org>
X-Provags-ID: V03:K1:Sp/hFU+iPnDpdSak21ZWW9dLoTPdnmJOObG5tTNuwd1T1ETyhU/
 RQJisC+SKRkWObTMjVwKhQVkG7f0I3a06D7Yw6QXHIKf6x2hcxgdN/1v+EzITGS3uEQaP1A
 MD589KkyIYBUB2xfklLDfJ+edlh0rrr3PseH3ESye2OCJao/zd9V1nhmEw5wiPk1xxsgHSX
 gIdP9daKIqEBJ3hh5Misw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDraKSHdvS8=:VJPqk0MlcitOssmBF6z5ZU
 icrCaJ8m4RhUu+t4NiQ2hnwIgebFwlH6O8avU+mUV7RhUPwJ96CuSV8ZmzrtAYaQOd2nkIBF2
 8SM5/oVjFKxhWkS1RAY7vDRJiOrPIdORrbVW3QVT8FCYj1mJ1duBiAZst4V9tBEYvgUeIqU95
 9RL2tEPeHTx4fzguGvt744bVsNN9nSlSlohBDTtu7S6fyRRwFy8nLg1NxZpe/Vwt+tA1q+V9J
 RvHD5PNwOTX2k5AZC7VeQEEg6b4IMdUx+2+Glf6xULz6otcrMvExfaIQ9QqccdQAj74Bmt68d
 QYIojj/tIij0eYO/LuA2avg+zFI9L1++uvWovOz/vWR6OAk2+3AyLsU5sVkO90qan0+KR1zEt
 8EAHQmdqiLs6+weRWTBJ5X/c2Dff2Xx3l0RmtZ2eHONl6d/dGkuhmed/MRijPlxNF/JVY2ROW
 3qK/6CBzT9M2rAit8JMVCeDqSGjh1YeRa3Qkk4IxkAXxnqiusWENVq1m82G3DpQUX+xRHKCmW
 oj//Fieksixk9wZaUQSBTuu+7nNsEE8lNCZMg84huuWMcpPP0lSevINpmOb/UcKpHI8HLSMfv
 X+Onz5G0EAxTFt77tg2wsVW3C4kbVfos1c2fAN/lY8sTYu+KF2EAIXFi7yfyukLQFYVU2xpS4
 NE6EjE5vp6hkYxJ2YN8RW2aIYfNSRj7rCiYPLZBAINaDicUjAQnRwKLQr1WbQcz1BkjDMbFuZ
 kNRjIZe9q05ygJCFBUw6SokNvnVaHxviiBSmEKRhqd3m9NPIwvaiz48O6ZXK5A5cDpDpxsvxK
 Il9IadFriINz9x7z3F7fzn4/PRPtElt0nQDreXV5GC09Y3f18x2llM9Fo8TgXVUBMOonYIQF0
 pdmncnYCHvbx0wbER43w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_073131_778902_D2EEDBD0 
X-CRM114-Status: GOOD (  25.67  )
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

On Thu, Jul 7, 2022 at 3:30 PM <Conor.Dooley@microchip.com> wrote:
>
> On 22/06/2022 23:58, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Hardware random, PCI and clock drivers for the PolarFire SoC have been
> > upstreamed but are not covered by the MAINTAINERS entry, so add them.
> > Daire is the author of the clock & PCI drivers, so add him as a
> > maintainer in place of Lewis.
> >
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Arnd, Palmer:
> Does the SoC tree make more sense for this patch?
> I am missing an ack from Herbert (but I don't think that's blocking
> for a MAINTAINERS update to my own entry?).
>
> If SoC is the better option, should I resend this to soc@kernel.org?
> Unfortunately, since I originally sent this patch there have been
> other changes to this entry that will conflict in -next (all are
> additions so easily resolved...).
>
> I was hoping to get this patch applied to v5.19-rc(foo) since we
> never added maintainers entries for these drivers rather than wait
> for v5.20.
>
> If you (plural) would rather wait for v5.20, I can resubmit this patch
> after v5.20-mw1 with an additional i2c entry (if the driver is applied)
> that already has an ack from Wolfram.

I tend to take MAINTAINERS updates as bugfixes in the soc tre
(for 5.19), and I can pick it up if you send it to soc@kernel.org.

There should never be a need to wait for the merge window
with these updates, it's either a bugfix (for 5.19) or for the current
-next cycle (5.20).

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
