Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D624C38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIp1wgBkmT4xhLN7nQMYisKDyjj2M3ZuBuJ6IcebHVs=; b=uAA2rx5eZceg/Q
	Z0rf3vV8C3OUbIzAF93MyxL1lRP5PfUH29XK/T4Segv6sZdIPcFwgpsyYOZL0tAlLvwdKJn8cov4c
	OWmUOMg2CciQ0Ih3ePkuheL6rQPBt11yM5MtvRtnTlncwPWExeUpy69/6dQhqBJOjtW07mS1sQ1z4
	BplVFIx6cVJVbU5nUeo7yIKJvFv3T3iKM7B+ZdVOw00/m97cmJFoLgazuam62YL1neMRdOvbsGuT9
	DcYWOyHuS/+4NyPZ9eo3d8yHMqbziSVxXAC6uJL2EyX2ARe90lXPvqxQtue7IhKu1kzUfBNC78bz/
	JOGgP/GEo/GNyFYJtVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4EQ-00BEer-IZ; Wed, 07 Sep 2022 23:13:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4EM-00BEbG-MF
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 23:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C586B81E8D
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 23:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0445AC433D6
	for <linux-riscv@lists.infradead.org>; Wed,  7 Sep 2022 23:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662592392;
	bh=G3Kwfw6T/4eq7w7+tSEG/rt/8cNRggabZvdgJ8K8jVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IaEKHEJ4Y/H/AQUlpUWV4ze842sN+hC6Gsu6NTdTUQguAPNr3tCuFTwt3+baSAIft
	 v61lR+XSlU4uRNQKinOam8faVgET/UrnzhiCV8wz4FoCzDm+gZ7aSP0cbLCwL6Dk5q
	 h9r2QsUMJDasfcs/nfT0GOnkMbWULzBau7aqv13VsgngXkZci/jjb3a0w+/EBhfCYh
	 OSDFVSpQjmE3ufwaBHBdsxayhJ9o2zFOB5qkYkmU3izMuHl4M9m6182sWwbfeVzLB2
	 l4fV3W0jZDm1Nh6u/9NxE6rJozm3OrxEUUm9/h7Xu/wo/uGAiQbq0i9Hc465f/roGF
	 v/rXHVGhLa0NQ==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1280590722dso6391015fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 16:13:11 -0700 (PDT)
X-Gm-Message-State: ACgBeo0+bOY8ggltFWusdBAerwS5ez5qWBMoZvrL4ZLGzta+zhQR1bEG
	tYse7iQ4YBml9JBTyKoZbQ9ERUJvP7hvzSfPhI8=
X-Google-Smtp-Source: AA6agR6EUvI484CIZrlEo84tOagm6hHSjYZeWoaJRcu++RhG5L5/01Uq0OQUqqUYMmTw0LqxMpSyj9Bp5oVeiMRlJHs=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr405514oab.112.1662592391107; Wed, 07
 Sep 2022 16:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220905111027.2463297-1-heiko@sntech.de> <20220905111027.2463297-5-heiko@sntech.de>
 <CAOnJCUJ9hC2xhoxuBPCNHEEZACeWckEL-Tc7xS6ECWrfx5KXhg@mail.gmail.com>
In-Reply-To: <CAOnJCUJ9hC2xhoxuBPCNHEEZACeWckEL-Tc7xS6ECWrfx5KXhg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Sep 2022 07:12:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTbfdUQEGDnosKaZrFLh58UVdnDRQUXc-N5p+11aLPT7w@mail.gmail.com>
Message-ID: <CAJF2gTTbfdUQEGDnosKaZrFLh58UVdnDRQUXc-N5p+11aLPT7w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
To: Atish Patra <atishp@atishpatra.org>
Cc: Heiko Stuebner <heiko@sntech.de>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_161315_034702_C96D8C07 
X-CRM114-Status: GOOD (  15.94  )
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

On Thu, Sep 8, 2022 at 6:50 AM Atish Patra <atishp@atishpatra.org> wrote:
>
>
>
> On Mon, Sep 5, 2022 at 7:15 AM Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> Using the appropriate BIT macro makes the code better readable.
>>
>> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>  arch/riscv/kernel/cpufeature.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 729f7a218093..08f7445985dc 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -289,10 +289,10 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>>         u32 cpu_req_feature = 0;
>>
>>         if (cpufeature_probe_svpbmt(stage))
>> -               cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
>> +               cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
>>
>>         if (cpufeature_probe_zicbom(stage))
>> -               cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
>> +               cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
>>
>>         return cpu_req_feature;
>>  }
>> --
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
