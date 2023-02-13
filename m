Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FED6C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 01:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wD+SblL45qm5YIl5AC4QQMMmZk9stY1554PTtwT2uak=; b=MK/NMZSFLhlcyg
	mrCLAcoVCgYx1dWAFDMFCQ1skPZYTKyZXlLdfjvTdR+BrDNOWrQNNOimQG0u2NUeqZm+yzElVURhL
	eL2H4vwfFEl4NFNp3xdxGNtMId+rGixPdWRrgd3Jp0Z2BOnolP4FF/XawyltQ3dY5OpO0ywOEQYUs
	s25/Zt/osFVSx10+SVOYNCYzhQ0QNfMXak0Qjy2uXMWD5CeUs2DH5YKjEu4hL5EGDbnk1IOHe3IVG
	siLiVN8zBhZfSNuLW4fwm6PKayBCG1DSYvO7XZDed5gcRX009o5tCTbc1rVDx/G4eQFUmYfQi7nVv
	wTvyQZ0Cfjk0vCmTcldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNZZ-00CkkE-Hb; Mon, 13 Feb 2023 01:24:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNZU-00CkjW-Os
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 01:23:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B33160DF8
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B97CC433EF
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676251435;
	bh=aiIT7U/MKZcAF6L/AJ9KYL+F8aqoN0dEGv5IBpK+ADA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EPBdAoYWjHUIiVEZk5OxLOz8f/J1vrW5QFVmyAWZOirF2ORDUlJiGb+/+L2gfSfET
	 Or8Dk+QJGWiGPbU2/quk05cF27Ir9SvzjvzziOklr6tFhLXkTPD523jN5u6KFExV6G
	 fed1EHXxRYICEq+d78Glqcj9eXZxTrE/gj2t9ZmlFOml2pixpxPqwiAjGH0bZMEshL
	 9dkA38gKSFv6WEe0QZyVrVywS+5fsKcdboFX5d2o0dodpAC8Yf5sbWZiONtmiT5MUN
	 G353XlnyzD1+3iTqIAIpR1XYjnwLF4N8DJdJXMjTuwmZYEkErhaRWoGqZ3qZksVUbR
	 Tc+61TPQB48Bg==
Received: by mail-ed1-f50.google.com with SMTP id d40so9671394eda.8
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 17:23:55 -0800 (PST)
X-Gm-Message-State: AO0yUKVQa6o9Phk9zWQTpnZxH2J1beehG8C7fbb5tWCeXBLEWTJWd4s9
	zQueiuEr3nBRLfOllikfXnk5oPDEz3mZNqeyFkU=
X-Google-Smtp-Source: AK7set8nxOhviNNQgEy7OIE+k9XOzNRgZaPGXNLi3iT4pMmOctJehGJkwVup1YR6i3+rpE+FrOgOTfarXYrMXfDDlYE=
X-Received: by 2002:a50:99c3:0:b0:49d:ec5d:28b1 with SMTP id
 n3-20020a5099c3000000b0049dec5d28b1mr6150941edb.7.1676251432248; Sun, 12 Feb
 2023 17:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20230212021534.59121-1-samuel@sholland.org>
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Feb 2023 09:23:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS1RHyy09ZMP4zX3bKmt9e=WLTiKy+cMyw60RPaZMpdXQ@mail.gmail.com>
Message-ID: <CAJF2gTS1RHyy09ZMP4zX3bKmt9e=WLTiKy+cMyw60RPaZMpdXQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Fix alternatives issues on for-next
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Christoph Muellner <christoph.muellner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_172356_866310_78CAC6BE 
X-CRM114-Status: GOOD (  13.55  )
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

On Sun, Feb 12, 2023 at 10:15 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Several people have reported that D1 fails to boot on linux-next.
> Patch 1 fixes a bug where early alternative patching used the wrong
> address. Patch 2 fixes a separate issue where the Zbb alternatives
> are incorrectly applied based on the 'C' extension instead of Zbb.
Great Job! Thx for fixup.

>
>
> Samuel Holland (2):
>   riscv: Fix early alternative patching
>   riscv: Fix Zbb alternative IDs
>
>  arch/riscv/errata/thead/errata.c     | 4 +---
>  arch/riscv/include/asm/errata_list.h | 5 -----
>  arch/riscv/lib/strcmp.S              | 2 +-
>  arch/riscv/lib/strlen.S              | 2 +-
>  arch/riscv/lib/strncmp.S             | 2 +-
>  5 files changed, 4 insertions(+), 11 deletions(-)
>
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
