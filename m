Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A815DECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNxTfJ4HJX2IkgESVJLV49/TVp2NmtvAWmWCSb9g2DI=; b=AALZM1aHkSE4T8
	b1Chyz5JbGHV0ZV5O0bVm04TswJyFvFxmRlPU5PeX6UXzdiWnAEytPKHqR8gG3tSWK7KiwS4jQs/F
	IZC6kSTqSoCp9SrlhIxkMlipgAC5unPjl5ytZ/hPKxkqfg/kPpMr4H0hubzrOsNhJBxyiKUtIGfYK
	xgfczXWGBkETqje1Zvk6dsE8Uh3XXN19oCm/QLjvWj/G0oC3YhJwWbrSJ5XEEx/BOKHQOh0gFYoen
	cobms4NauK+H0VVfrpTolO4yXMzXt3WMFUDfqg8r+ul9ivrkHkMJ9uUZgj74hqOv8Rqtz2iGHfK8n
	tvs/gBGGzdctfkUq06Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv95-00GNyb-FN; Fri, 02 Sep 2022 01:06:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv93-00GNx1-IC
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 01:06:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EBDF5B828C8
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C4BC433D6
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662080810;
	bh=G+foTZzT5RWnrPBOckb1rqSN5DWVDDelGqvcOVRSIqg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jNsPI19q+QvWykkoUx5PxFYUfgsgSz4vQYP3jAfkz7LORKVnkNxod2kBsqcbk5e1B
	 yHutRgDmiyU5kpWk7L1Ak4VbvOWtt09itG2gaN44vRJa4f6SbHNZltbYsC4boJWGIv
	 7VNY34ibfeiHiyy2F/W+X7qMIUGLGsJuiT7MGAxEaKe4YEqoFwW+t6nV/noOCLfOqY
	 27HAU5kE/5VhBl/MQwf7mXefI17AqeyRrsnJYLh5DnaxNg5yMTD569aayCudIYZUY1
	 U2fla4esMHqO0iVbHb1wkmydIc7Wq9BTch8ucj24M839g5u7LwpB1cwhF87DS4HxGq
	 sFj1QBoAI/qBA==
Received: by mail-ot1-f43.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso499406otb.6
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 18:06:50 -0700 (PDT)
X-Gm-Message-State: ACgBeo3jWAMrwiUS3rW5CSRLSOMfuulvS8BVJ5QKwwFi5mB4YFjUYmwr
	8kFcHrddvO4r+Yo3U+xLe0mys9OZbTbnzmOKHlE=
X-Google-Smtp-Source: AA6agR44Cj/JO76hEKeM9LNLPEJOtlwqxquNV83WJgiqhEaHfCY7qxg9sevAiryJmQzhjxEG5kL9o5LfAWGxcWxb1uI=
X-Received: by 2002:a05:6830:3482:b0:638:92b7:f09b with SMTP id
 c2-20020a056830348200b0063892b7f09bmr13288675otu.140.1662080809806; Thu, 01
 Sep 2022 18:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220901222744.2210215-1-heiko@sntech.de> <20220901222744.2210215-4-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-4-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 2 Sep 2022 09:06:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQsXMB+igwMiya-sqyku+3iQPop1JJuHwXtTToj163h-A@mail.gmail.com>
Message-ID: <CAJF2gTQsXMB+igwMiya-sqyku+3iQPop1JJuHwXtTToj163h-A@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: check for kernel config option in t-head
 memory types errata
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_180653_761956_A1B44154 
X-CRM114-Status: GOOD (  18.43  )
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

Is it a Fixes?

On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The t-head variant of page-based memory types should also check first
> for the enabled kernel config option.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index a6f4bd8ccf3f..902e12452821 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -17,6 +17,9 @@
>  static bool errata_probe_pbmt(unsigned int stage,
>                               unsigned long arch_id, unsigned long impid)
>  {
> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
> +               return false;
> +
>         if (arch_id != 0 || impid != 0)
>                 return false;
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
