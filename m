Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1676CECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/46hmc++gE88tBia/3Fnt4fPucbT+Y2NW53eWTdD924=; b=BBivMgVUYmjeKp
	39xP19RwMtqeDxaNgbc16XkxcNhpA1ZdpqkvBEosvYCwanr5TBD4vUwKCZcyxg5wStvgX3ZJV5gta
	Xkk48pkGRI9KKWS/t0YNAA/4k1tk3z3zcCOiFjLAkmfigRg68x26ohsZyw0cnKa6u0JoXkx867BAl
	0gIdz35LGK03Htz8CSJ6tPK+7s5mpN/yD0NXvyxbJ1tPArMrCfes7husi3XolBQg6F4Kp9lAvNiaj
	sX4Jg/kstDcFLjwlCnVaDaHpbbN8M6EhjJ2ZTVZ6D+8ukY7QVHhfE1qAoN1QCO0NYBTeLpr6laBCQ
	/o1hIBowJhP3LVZlCDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv8d-00GNgb-AE; Fri, 02 Sep 2022 01:06:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv8b-00GNdT-Ba
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 01:06:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 56F38CE29B7
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD287C433D6
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662080777;
	bh=Prz6huqpGc3sAjiqIyxG23zXRVYhVNAPIq+MFkac75s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usGfjgRfCP5QtD04dEK0BvZ/Rzto8p8E3Yi5lsxT5snV5ib1pFvEkTaFJrSXzDHAV
	 vwgW77mUDWFrbpz/kOQt4HaSizRbPYqDle0p6jTPysOP7Ey/gHfrP6xWRYoQDmOSXU
	 Fle+WOhd7FSGyp+L/QH2SsNzgjG6n2tvD+eoUavMI3ZOPz/VVdjAxNm9HzuzjRXSqX
	 5IitQGhIbxu7rYYPNy1EM7Z3dmhN2pyZ3KuzJ9shpWTj9+vCr+uq12HbQIJ7KCH5Gn
	 Xu3H+nnjeLr6B5tW6VT81y7+JEwKFhhdH1VQZyzHeL9t3JuC0btl7BsSMFLpCOgT0G
	 sahDWMa9Q8Exg==
Received: by mail-oo1-f43.google.com with SMTP id q6-20020a4aa886000000b0044b06d0c453so137300oom.11
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 18:06:17 -0700 (PDT)
X-Gm-Message-State: ACgBeo0eOe7DEJakoHHcPUaLl6UJ78INPqjN0nnj6uzgnqJUv92iXqv/
	stf0up1ZS2qy5lwxV9YV7FpHO9Jx2yn1TzAAUzc=
X-Google-Smtp-Source: AA6agR5NqMItBdtvXB9BAykCDEdumC+b8gYuo70Xd3IgiIerOP5apbw/FOpVDrXRHQxS/id91QvEzMzE/nUYZor5uQ8=
X-Received: by 2002:a4a:dc93:0:b0:44b:6d0:c4a8 with SMTP id
 g19-20020a4adc93000000b0044b06d0c4a8mr11496804oou.48.1662080776979; Thu, 01
 Sep 2022 18:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220901222744.2210215-1-heiko@sntech.de> <20220901222744.2210215-3-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-3-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 2 Sep 2022 09:06:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTYFWk0T7kbiURaMc_QO4O=sjdFFjOxnaxGApuMYsopZw@mail.gmail.com>
Message-ID: <CAJF2gTTYFWk0T7kbiURaMc_QO4O=sjdFFjOxnaxGApuMYsopZw@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: use BIT macros in t-head errata init
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_180625_580567_D445C054 
X-CRM114-Status: GOOD (  16.08  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Using the appropriate BIT macro makes the code better readable.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index bffa711aaf64..a6f4bd8ccf3f 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -49,10 +49,10 @@ static u32 thead_errata_probe(unsigned int stage,
>         u32 cpu_req_errata = 0;
>
>         if (errata_probe_pbmt(stage, archid, impid))
> -               cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
> +               cpu_req_errata |= BIT(ERRATA_THEAD_PBMT);
>
>         if (errata_probe_cmo(stage, archid, impid))
> -               cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
> +               cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
>
>         return cpu_req_errata;
>  }
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
