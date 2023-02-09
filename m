Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A47C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeloqptLkF5UOv1w3YoO0X70wiPPPMY/eiQaR/5URJE=; b=yx4GFFyW/5aWz5
	OV/xBKz6p9ssMzgFIbM0FlA6TZERg/nWftLzk/jFRYmAjqDih5LlxQTaT2/SXhCN9a2klhNA7MdqD
	cBRuWzt+rHvw2stzGwDj5FKO0o1H0dmI2X9Y0RO5PILvAK5g8DNJevY3+b/AGjNGIAvFeJo/gg6f/
	NBmldw6REbXvdKl6Xe+XHB2NP11g1By+ELSEYqiKRoagt8sziPM9FVY51g0fjlkOGEWORqKdH/R7p
	mCAOzsg+cvh2AdfhiNmw6dGa/nXZ5kqB+CPVt2ry5R9MMp/eedFCa2Ei8s3Q9KFKRb9YHuZN5rFOv
	39W8wvTtNUu3KTPjo/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2y7-000gnP-DU; Thu, 09 Feb 2023 09:11:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2xw-000gib-Or
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:11:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3E7CBB82033
	for <linux-riscv@lists.infradead.org>; Thu,  9 Feb 2023 09:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F6C433A1
	for <linux-riscv@lists.infradead.org>; Thu,  9 Feb 2023 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675933897;
	bh=rUqnl2yhgg/wSh6GmALm2a+1dBTMU8RKuIViEGLb7cg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rjXcILcrjp8XTkk6APFP6VS9zYkrvh5Zyu1rMTYhweavvwRYgaQkAOBzjLPmn8DJX
	 pIWwXN2OSkeR7R33hzjvtKOqw/kKKEpRf2JTXkEojhFJ1iG6CLw6nOCy5YnmSPBevK
	 +XsDcAm+Xw1U3wa7WnQ/u8GGL6fAiJ3KHrHw+gVNm0QMoHrE+K7EoDWqx7Ard1jKqk
	 ab4CqeDFPYghFbIqv9t3rblWBYQf2h+7IlLisATFxh8EuwkGjAfcjiHaGv/K/JglrW
	 vcVDBf+1W90zIqwhAZDgQJCae1axNi4GAU+o9BCZmQzBzQsgQZpYAaFfn/2laHWTzJ
	 lsE4XIcBixwnA==
Received: by mail-ed1-f49.google.com with SMTP id da9so1495309edb.12
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 01:11:37 -0800 (PST)
X-Gm-Message-State: AO0yUKVQOJZY1zkPLSpB6MdVs8tt/nBmFp9y58KyGjlLr0kRUA0tW6Gb
	jajOSyR7UsiV7TbTFrosAdi1yXJLXFfdmL+0c2Q=
X-Google-Smtp-Source: AK7set+2zd+izyEqpj97HFiy856DccBJtPH7FTm1sSwGv31V2vQsWyM66vU6jjahWs1vauH5/qlsb6uSqOnq3gA7zik=
X-Received: by 2002:a50:99c3:0:b0:49d:ec5d:28b1 with SMTP id
 n3-20020a5099c3000000b0049dec5d28b1mr2400808edb.7.1675933896149; Thu, 09 Feb
 2023 01:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20230112090603.1295340-1-guoren@kernel.org> <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N> <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N> <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com> <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
 <f00256bcbe114669acca1b0105cefb99@AcuMS.aculab.com>
In-Reply-To: <f00256bcbe114669acca1b0105cefb99@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Feb 2023 17:11:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQuEiBMg=2KQXb3UZNaH_AdwCHNyNe07dbPd7JDGGExzg@mail.gmail.com>
Message-ID: <CAJF2gTQuEiBMg=2KQXb3UZNaH_AdwCHNyNe07dbPd7JDGGExzg@mail.gmail.com>
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
To: David Laight <David.Laight@aculab.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
	"suagrfillet@gmail.com" <suagrfillet@gmail.com>, "andy.chiu@sifive.com" <andy.chiu@sifive.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"jolsa@redhat.com" <jolsa@redhat.com>, "bp@suse.de" <bp@suse.de>, 
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "linux@yadro.com" <linux@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011141_162867_E04A1BD1 
X-CRM114-Status: GOOD (  14.27  )
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

On Thu, Feb 9, 2023 at 5:00 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Guo Ren
> > Sent: 09 February 2023 01:51
> ...
> > Yours cost one more instruction, right?
> >          addr-12  auipc
> >          addr-8    jalr
> >          addr-4    // Literal (32-bits)
> >          addr+0   nop or jmp addr-n // one more?
> >          addr+4   function_code
>
> Yes, it is 4 bytes larger but there is one less
> instruction executed (only one nop) when ftrace is disabled.
> That probably matters more than anything in the ftrace
> 'prologue' code.
I've got your point, thx. I would consider your advice and make the tradeoff.

>
> I also suspect that you can use a 32bit integer as
> a table index in 64bit mode to save a word there.
Yes, good idea. I've asked Mark Rutland. Let's wait for his feedback.
It also helps arm64.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
