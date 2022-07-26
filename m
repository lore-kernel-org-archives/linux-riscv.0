Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB60BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9skazMjyv1AJG+a8GhFQbcga5S5k3e1tlIXNSDlOdA=; b=SbAG8RSiumJa4T
	Q85EhFtA/cw1v8XowraW8vw3mUKblez0nENHg6UyXii7TAScTsvgRk44sesDrPR34AK4ndTch1hO3
	7hvzu6JLJm2bC9KPXtZqGW7NqwU3oaGO4XuwZ9PsjiPNdYrQcplo5fIwEQefH0NwImylf4zyr6vsO
	RWT3krlx6VvlMP4fLDiO6OouzqJMl/RJmNsV2ZWYCciw6hpYj16CmFGCmT55XepGBXhBAmTFP/H3t
	/sj6FMH7qvbPH/G3Hn37DjCl6w7Xav9RrCwD5zW5xwiO1f/JEacOiPlTJ1Iq1EGBEYbXjBq/Tt9bU
	3lnPSTHrstH0tcp4VYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFhe-009zIj-OV; Tue, 26 Jul 2022 08:14:06 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFgI-009y5W-KH
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 08:12:44 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31f434f2884so20917387b3.6
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCX2ALCWALFGybcMGwSCyXmdfN3GI/+m4dDqSmPpw10=;
        b=s0G272QfIh9/l63hjHAAeg/H9EPmVwACwS37tb+LwxjryHa4mlQWqrwvINvSIIEoW/
         Z5YvAD93ZwX3PpzFcVYHu2JNnjVTJEbu9Utqrz3Y4iFYljnNLzmhkxMNWfU/cW+IHO08
         BtMqsqCC7Au9eyjhgIOU+Pk7NDXHMOQRmVzOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCX2ALCWALFGybcMGwSCyXmdfN3GI/+m4dDqSmPpw10=;
        b=VL3SOHXAlKRQpFwzQc0GaW6jnSU2GTDyFbIPUJV2uC9KHYuhAgIWOFzNONV4kKlahY
         fhtZiD/DN8A/8QIzJYrQTdAowWTWX1tlahIy7+o3SxDyMM3wmM666phOW03k/2JkOrZY
         9KQSLR6sILAmrA+tmCtzdhAxQvvInDGcbCillr+j1Qe3qkd4AX8Sg0B0Fw7S5CSkgkxo
         qeaYY5Pl5sDOfpubhBAP9wV5tNUQfMhekz0mNBElUuKJGMNTF13XQ6CYxb/PuRx2Ec1e
         KD7UhYia4WfTbqLzHWoPaVAghIios3YatyJxzzyZN2Zk8s8vgQKC6r7LXhQdQYu3QtEh
         sHDw==
X-Gm-Message-State: AJIora/CmGr/uJ8MVAnUtUf45gh/HWuw13tykWAynGtU6GgUIudcLTDJ
	SyS+R16evBg46zhifYZPzaUPtND2YSbDZT+BwVbJnUvIyQ==
X-Google-Smtp-Source: AGRyM1s8Apd3hvFA44J5aJBKOXCo+fbuaspIcsLZraEzhnuLtGz3y8ZMjuWlDz61tH0RApEnIjJf8dPeiNTkr3bt800=
X-Received: by 2002:a0d:ebc8:0:b0:31f:4f08:63aa with SMTP id
 u191-20020a0debc8000000b0031f4f0863aamr352109ywe.145.1658823159618; Tue, 26
 Jul 2022 01:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220715175155.3567243-1-mail@conchuod.ie> <96972ad8-d146-3bc2-0e49-ffe88580bbee@microchip.com>
 <20220725091346.GA20370@willie-the-truck> <28e38506-8fce-9000-c211-199a7aa69910@microchip.com>
In-Reply-To: <28e38506-8fce-9000-c211-199a7aa69910@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 01:12:28 -0700
Message-ID: <CAOnJCUJh0vU8-tK31-A44h+VNHZA2_R6GayNjFg-7Daa6efbag@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: "will@kernel.org" <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sudeep Holla <sudeep.holla@arm.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daire McNamara <Daire.McNamara@microchip.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Zong Li <zong.li@sifive.com>, 
	Emil Renner Berhing <kernel@esmil.dk>, Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Rob Herring <robh@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brice Goglin <Brice.Goglin@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_011242_694590_D3F7AFA9 
X-CRM114-Status: GOOD (  26.47  )
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

On Mon, Jul 25, 2022 at 2:20 AM <Conor.Dooley@microchip.com> wrote:
>
> On 25/07/2022 10:13, Will Deacon wrote:
> > On Sat, Jul 23, 2022 at 11:22:01AM +0000, Conor.Dooley@microchip.com wrote:
> >> On 15/07/2022 18:51, Conor Dooley wrote:
> >>
> >> Hey,
> >>
> >> Not got any feedback on the smpboot changes from the RISC-V side.
> >> I tested it on polarfire, the d1 (with both SMP & !SMP set iirc)
> >> & on the u540. It all looked good to me.
> >>
> >> I'd like to have this fixed for v5.20, but there isn't too much
> >> time left before the mw. Not too sure about the cross-tree changes,
> >> does it need an immutable branch or could it go through driver-core?
> >> Catalin suggested removing the CC stable from patch 1/2 & adding it
> >> as a dependency for the 2/2 patch - but obviously that's up to the
> >> committer to sort out.
> >
> > I'm finalising the arm64 queue today, so I don't really want to pull in
> > additional changes beyond critical fixes at this point, I'm afraid. I was
> > half-expecting a pull request from the riscv side last week but I didn't
> > see anything.
>
> Yeah, that's fair. It's late in the game for cross-tree messing.
> I know Palmer has been p busy recently.
>
> > FWIW, if there's still no movement by -rc1, then I'm happy to queue all
> > of this on its own branch in the arm64 tree for 5.21.
>
> Hopefully someone on the riscv side will have confirmed what I am doing
> is sane by then.
>
> >
> > Let me know.
>
> I will, thanks!

Sorry for the delayed response here. I was planning to test the series
last week itself
but got dragged into something else and a qemu bug for NUMA.

Thanks for the fixes. I have tested this on Qemu(removing the topology
node) for the following configurations.
SMP, !SMP, NUMA (2 sockets)

FWIW,
Tested-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
