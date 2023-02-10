Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007BC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 02:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhlGr2YTJYLLSY2EqYV5vYtRp45owmX19w3kJwct1s8=; b=4qo8EYS6eK3qIY
	9p+PgKnHrcAZDhrw2x8trJC/H5dzfX5MszDtiogoOcb+2W8DMzuZAnQ3nsUqdbI+9wAfpqjttW6cz
	j+Ps/TO1EYER1PdHJO58hHV4UyIdBAHaW0WP5LX01kHKeIRX0xeoiEPDIEi+0ZSCznTSnzflDNtj5
	BlF9WS0zaxlSVwmGAzmuf4GDF7stiRBJ5bEc87Dx2k2yqZbvhgmWMT6edmUtkJF77YhJnS+ncewLO
	r/8q/3K1QJaH/8z36OpiPAcgXlNig3Hk8owzdsHnG3gLmB9zT07/qLhxbNddaQ//tFV3b8Whw36ii
	A5q4+zPQv+fcdi2PfyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJ01-003vOp-4b; Fri, 10 Feb 2023 02:18:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQIzy-003vO8-Cz
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 02:18:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9E36B822F0
	for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 02:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C564C433A1
	for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 02:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675995526;
	bh=f41SyKetgyTJk5AoqYDZA6qemHFr7tnVd+NQEEf/jhw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DOG5qwcJg0TujMpmdgcev0f+2tdrfCilTG2wuskQVb74UD5klnBmLZiQhz0VOe4Si
	 vvSfB9oZzkKciOBWK+etmPI7Imlh95Re1G9kGBY+jrYv0/KDPJ5cF3bNsOnH9FAA3G
	 TvqFL0Q945S/mrqFyAL1zZ80Q2dXdyQgs1m8UNzW6JRKIUVSr7HF7yv946fQAjjw8w
	 i+JrCRR675ipxNacq8+H/dmlVNKyXQjWUBmzAcxBRfC6+LFCzkyzjf2+Q37nUPaWrd
	 afJ43eLGlqHP2bmASZiNHMz/KlW6TJjq6fgmxlB1BIqv1MM6SzucGg2LPWXBEb9lsP
	 qlUvrj7xB+zAQ==
Received: by mail-ej1-f46.google.com with SMTP id gr7so12224035ejb.5
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 18:18:45 -0800 (PST)
X-Gm-Message-State: AO0yUKWHHAeCGaKMI8zcx0s2kwU48dybaXh+xxQGVj+zuvu5RU2yG7ra
	w5TOgIZDA/us6uYVKvblOW8Ro4uC7kryWQBt7Zg=
X-Google-Smtp-Source: AK7set8TcWdcPxU1RclSrshoCn2NZql4i4WcAJAAwP6sVzZJ83BCJxACCuKYPTvQ6ICKOUSbEQUk7mjOIYYvMYnd9lk=
X-Received: by 2002:a17:906:6b1a:b0:879:e5ab:94c7 with SMTP id
 q26-20020a1709066b1a00b00879e5ab94c7mr951800ejr.8.1675995524338; Thu, 09 Feb
 2023 18:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20230112090603.1295340-1-guoren@kernel.org> <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N> <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N> <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <Y+O1qY453BnhqgQZ@FVFF77S0Q05N.cambridge.arm.com> <CAJF2gTT_aMBx3mPnzWWqj6uGM75yT_62x+_wZ4HkWd7BqEzvug@mail.gmail.com>
 <90ad3009049e4d39a952b6e4c170740b@AcuMS.aculab.com>
In-Reply-To: <90ad3009049e4d39a952b6e4c170740b@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 10 Feb 2023 10:18:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTmPfjm2_ds_MU3NmA1+qPBdvW+0x9pLhio63ZEGZc3HA@mail.gmail.com>
Message-ID: <CAJF2gTTmPfjm2_ds_MU3NmA1+qPBdvW+0x9pLhio63ZEGZc3HA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230209_181850_765367_4F203251 
X-CRM114-Status: GOOD (  23.45  )
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

On Fri, Feb 10, 2023 at 6:47 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Guo Ren
> > Sent: 09 February 2023 01:31
> ...
> > > I'm a bit confused there; I thought that the `symbol(reg)` addressing mode was
> > > generating additional bits that the AUPIC didn't -- have I got that wrong?
> > >
> > > What specifies which register the JALR will write the link address to?
> >
> > According to the spec, auipc t1,0x0 should write PC + 0x0<<12 (which
> > is equal to PC) to t1 and then jalr t0, (t0)0 jumps to the address
> > stored in t0 + 0x0 and stores the return address to t0.
> >
> > That means auipc defines xxx << 12 bits, jalr defines lowest 12 bits.
>
> ...
> > What I want to point out:
> > If we keep "auipc (addr+00)" fixed, we could use the different
> > trampolines at "jalr (addr+0x4)" (All of them must be in one 2k
> > aligned area).
>
> I looked up auipc:
> "AUIPC is used to build PC-relative addresses and uses the U-type format.
> AUIPC forms a 32-bit offset from the U-immediate, filling in the lowest
> 12 bits with zeros, adds this offset to the address of the AUIPC instruction,
> then places the result in rd."
>
> So it generates 'pc + (val << 12)'.
> And the jalr then adds in a 12bit offset.
Correct!

>
> I think that means that if you have two trampolines you might need
> to change both instructions even if the two trampolines are actually
> adjacent instructions.
> It is the distance from the call site that mustn't cross a 2k
> boundary - not the absolute address of the trampoline itself.
We could have multiple adjacent trampolines, which must be kept in the
same 2k boundary area. Then we needn't change auipc part when
modifying.

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
