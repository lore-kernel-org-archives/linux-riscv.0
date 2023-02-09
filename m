Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21F6C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6laqN6GuQdnb/LVOArTHPoI3PLLH/7+1fBD7o2EazA=; b=JArYdxEUc55Ca3
	L7EC8x+eyl3fhlRkKGB05c8wnlBvHeaRddcCGxQHXULYwAI5PVgPawrLFGzmCcXIIqAegGwon+xCi
	Mfn1Xfu0Yj4HPHi5Jlo4paaKREWFyNfKPWvTw9P79nQnYblZr5jQk5X6R+RXh9wK2yjkSf9vQ8AVN
	cwD0fzEPpjRmekGKbafZUWFaP4Wd/7wZeDjI4D/bhJrDrVenAWfgfvPuDlepSJf482YyMgwLcJoaB
	MpSMwHRcfGRW/kGOHSopzGcEKj4N2unE/IJ+GSA8Pdc9sR/Rr9SndrJiEUt7XaWidN5cygY5FqDDn
	wTzBkjwRNUgaVGXdn7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4GS-0012Cm-IO; Thu, 09 Feb 2023 10:34:52 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4GQ-0012Bx-7c
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 10:34:51 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id x4so1833485ybp.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 02:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JJgX5QvJsADw9laMT79k7Un3WgY8suaKk5qie04JT20=;
        b=BDZwjoDell5uK5ikdBXTTYw7oCrWD0oBaZgYkglrpdf8lpqbEKBuyS7bjEUQBKadP0
         eEt94gNomenAEPDoHo9wboyqS3CHfeIP41yJ2O6mAbpjONw234ujUqquopeLauyLSj0u
         FPQ12wpSL3QQI1zG/+pZCh/VSjUFaPbJSaSzYWPu5naAGYszvSSXCfV4t6/V/GngRE4g
         Sf+v/wQWcw5fPAmPr10W5cD7C3ZnDrUptbBpzVzNc6GmR5h20KyE/STUz1Mye/n+YXPn
         /umOWwHXyCj9/tji/P06itCTqFLukM/CnLnnGPJDNYFVFVKE7MgbEa/QluxAbX8YjX7w
         hQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJgX5QvJsADw9laMT79k7Un3WgY8suaKk5qie04JT20=;
        b=w4kbmHPkxARsuXjsZqhIFzpm52p00YosX/jILCRIfNRowsVaD29R6n1hZaCdm4LgPX
         AJRt6fpNCPv2rJGrbw5nsLTSQGZzDPTKIXh/bWRFlIh5acknwQsRDp3OAC7IukwNykgk
         qU5wbygl+39Ac3cPdGhjgZgQPlBHC5azIlOmvitt9XDm0xHcFIPpCw3jVGkGe07mlBcC
         5mp+QBAA5qI2qdY3iw8p0CbHs7I2fV4zYa9yI1OzQOJ9B5cK+6QmY3m+C5F26BYxww++
         pGNzcqNmgPgi9ioUdPrsU8Ml5aAFXa04ugo/c8aFqPMyK5Auvz6TOOGnZkwdgBat1Z+a
         TNyA==
X-Gm-Message-State: AO0yUKWjKSghgXiddwOGQ5y5x82TZxKaw4XFDoSH24TtN3l4w6eiUn/f
	9eRTrxBhPEKfmHsIKzoTkagsnARQ0lg7s+4vtX5Dpg==
X-Google-Smtp-Source: AK7set9iONTDm/V2Uk77rB4FKHxBkm7FbdUCso7hGlDRC6qONQKfDwseGChJaZD/z1wiD4VkoLu6GPjRNy2V0/xngkE=
X-Received: by 2002:a5b:150:0:b0:88f:92ec:4292 with SMTP id
 c16-20020a5b0150000000b0088f92ec4292mr1178366ybp.460.1675938888838; Thu, 09
 Feb 2023 02:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20230203141801.59083-1-hal.feng@starfivetech.com> <87e31545-3107-1cc2-fc93-197f66712ccc@starfivetech.com>
In-Reply-To: <87e31545-3107-1cc2-fc93-197f66712ccc@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:34:37 +0100
Message-ID: <CACRpkda7ihWGjAP4=FU5uPqFMs4YxV5RLU8iwRNG7bYDeyOJ3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andreas Schwab <schwab@suse.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_023450_327756_2E666A19 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 8, 2023 at 3:31 AM Hal Feng <hal.feng@starfivetech.com> wrote:

> I have resent the patches rebased on your "devel" branch. Rob has added
> Reviewed-by tags for DT bindings, but the DT binding patches still need
> to be modified a little bit. Could you apply this series if I modify the
> DT bindings patches and resend as v5? Or it need another round of review?

No more review needed for small fixes. Just resend a v5 and include
the review tags and I will apply it. After a few revisions this is usually
fine.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
