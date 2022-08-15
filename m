Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3DBC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyLDzVZl8lSLyWVPj0HaJ0LRQOv9ht+YSTIwEMCz0io=; b=BTKOfEdYKdf1yU
	f0StGQvNnHyXL7wpMHLv1KHUQDFBDopcjeHMj4A/tswldNfjxW0kNB16C7cgtpAImvs4sef3asCkK
	Kxdnl+CKomeaLahoC8givazz8dQZwMDne8uGT7BKikaoAlO70IFOpJccNHkjuKnNoVn9YynKN5rkQ
	JYd/TxGjnMh5DtZ4Awe1aK/wuNfKD8DGpmjJBfuNLEMZB3X+EP/yZVIiDwIHDkRJKx/nSc1SlWerD
	RaFRcDUgTYeRxxSCS1oHl0wBhg1D9pRoNc1hbvMlZYUyujs74zYxPYX8KU+QGCr/NUP9hefZhW1l4
	7GhP2Or0W8by7H8epTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNhtp-0066U9-Jy; Mon, 15 Aug 2022 21:45:29 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNhtM-0065uM-U7
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 21:45:02 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-32868f43dd6so105586417b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2afX6yrDcfpZBnmChjBnMJ+7mJFMLqevj8PH4SkpX9I=;
        b=oSf3U64JTh1LWoO7F/1/3gk8zZHxArf7adTgKyoI9Ad3nVgVM7RU6UbdANx2U25TUQ
         3amX/TDD5FEIheeSUZ6EuRjIAJbzip+oZADiJZ+Nb3P8hiM0BbcIUPS17Lhf79uryKkE
         yh4xms4uwPu42LcyQrnSqYsIIKqLIcCfiaqv376RT78KMqDubqL5V+WAORKrdXWZTCfz
         qZBulNpsOBBGkkBlYFArHHp0P/fG5cpbiUXmQFW2Bfa7h2wecNh8tm1zA4/m8InBDwWb
         LA+uCNfeAe+F1VTqXrWmd6mbdK5skTqw/TfybgH02G7V62DE4hRxixu3bat5jiZd5Isa
         RKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2afX6yrDcfpZBnmChjBnMJ+7mJFMLqevj8PH4SkpX9I=;
        b=xuCQoNY9xcVuGY0dVD42MXNyRLTPXaWv9KsjRINW+bSe/HpAbZ6N4F0vWIzcdAUxQO
         PjKXuzgK77bmdUf/cOY2hyKAaxyEQX89Ccgv9wuRm7ety5+CaHE47X6cjsUozcIbLSMu
         70KuH3TWbCC+pFEACji/mOWEqcpO+mQ0iuQOQL9a5rkdCE2/orMKFSHFzAl20koM461z
         z2M6+doggTE1nH1JUpZRf9/thBdA3PHVDOUkF8iPCo3/Akx7UqUTux49nNI/bqs1Q1pZ
         XJ3RbDS5YYaoTPCuuQ58aHZoLA/CAMBUibbpgiHzljoJmN43kV05ndsiZaEum2aob+Mt
         vvuA==
X-Gm-Message-State: ACgBeo3D2x86+Ir1PLyFI9kD5s9fYrJIN6vNEkeDTYAqGbHDzDK4OiCv
	Pm03tAnDo17DACl6BaiqrJ4qN/t/WuTGqgnbsm0=
X-Google-Smtp-Source: AA6agR4nBE/BsnGk7VaQ6Go1ssUjkUMWQ0gHOg5lC40UYQBbJv2HOmOOGs00Z28oIGh+7ulu3gg++WK8aq4GrjMjZUo=
X-Received: by 2002:a0d:f282:0:b0:329:7da1:90e8 with SMTP id
 b124-20020a0df282000000b003297da190e8mr14589755ywf.519.1660599899361; Mon, 15
 Aug 2022 14:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <d9d0deef-92e1-05b4-a195-d2ca03801129@microchip.com> <CA+V-a8utT6UE=rc62LPE=UoU0DTJ2dDt7KO9UJ1vAG9r80E2pg@mail.gmail.com>
 <cb3eb397-cc27-c8f2-4194-5c401f6dd690@microchip.com>
In-Reply-To: <cb3eb397-cc27-c8f2-4194-5c401f6dd690@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Aug 2022 22:44:32 +0100
Message-ID: <CA+V-a8s_t4ipLgcioB-YHOv7D8KQhWe4G0zmL=57594eWt-y6g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_144501_126637_08038676 
X-CRM114-Status: GOOD (  33.44  )
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

Hi Conor,

On Mon, Aug 15, 2022 at 9:05 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/08/2022 20:57, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > Thank you for the review.
> >
> > On Mon, Aug 15, 2022 at 8:10 PM <Conor.Dooley@microchip.com> wrote:
> >>
> >> On 15/08/2022 16:14, Lad Prabhakar wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> >>> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> >>> of the Renesas drivers depend on this config option.
> >>
> >> Hey Lad,
> >>
> >> I think I said something similar on v1, but I said it again
> >> to Samuel today so I may as well repost here too:
> >> "I think this and patch 12/12 with the defconfig changes should be
> > patch 8/8.
>
> It was a direct copy paste, hence the quotes ;)
:)
> Your patch 8/8 lines up with the current symbols while Samuel's
> doesn't.
>
> >
> >
> >> deferred until post LPC (which still leaves plenty of time for
> >> making the 6.1 merge window). We already have like 4 different
> >> approaches between the existing SOC_FOO symbols & two more when
> >> D1 stuff and the Renesas stuff is considered.
> >>
> >> Plan is to decide at LPC on one approach for what to do with
> >> Kconfig.socs & to me it seems like a good idea to do what's being
> >> done here - it's likely that further arm vendors will move and
> >> keeping the common symbols makes a lot of sense to me..."
> >>
> > Sure not a problem. But delaying patch 4 and 8 will make RZ/Five SoC
> > not buildable. Is that OK?
>
> No no, I prob just did a bad job of explaining. I meant more
> along the lines of "I don't think this is the right approach
> but I will defer reviewing until after LPC, when we have picked
> one approach to use for everyone". I'm sorry, poor choice of
> words maybe. I didn't mean drop these patches so that it does
> not build, keeping it buildable until then so that we can all
> test/review is the way to go. Not your fault we've done 4 different
> things so far!
>
> Hopefully that makes a bit more sense?
>
Yep, that makes sense.

> >
> >> Also, for the sake of my OCD could you pick either riscv or
> >> RISC-V and use it for the whole series? Pedantic I guess, but
> >> /shrug
> >>
> > Sorry did you mean I add riscv/RISC-V in the subject?
>
> You have some patches with RISC-V and some with riscv.
> What I meant was use one of the two for the whole series.

I followed the previous subjects for that file which were previously
accepted. But not a problem I'll change them to riscv instead.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
