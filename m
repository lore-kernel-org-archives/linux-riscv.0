Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E89C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPb6KXTmxg6dmETrvK3l/UEDwB518A0Q9e/n+/VmbNk=; b=PUKItk7aUA/r3D
	37a3U24srCwP7EUVnm2u0WYgMbT8Oikk6Ays1FSsc0XzfW3NMP/Sj+cE0LX3xLq1mpc4mapNnq/Hv
	4jWlstbAWULRmADMNYm2lUnF5r1uF4trmdCzoArijnYZDqYEbG61R4zilJoMjCIPjHoEPgOrlj+yb
	l7oPXL6Fqd/V60wuGu/K9OpoCYg9Qeb6NQQDXJuTyU2QQALy4GcrReKjQsudDQlE+M+sovNdqOrcx
	HO1YF425ZwZDVAP1j8qdW7mZhBlLRhnbt8tFIGkZs323ovfS6rK4WAnQCZMIvIHVAUArildZPUlqu
	ARQvBVPPOop77Mzs7XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfhg-005Y81-6a; Thu, 03 Mar 2022 07:16:48 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfhd-005Y7G-AX
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 07:16:47 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dbd8777564so45484137b3.0
 for <linux-riscv@lists.infradead.org>; Wed, 02 Mar 2022 23:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4j6pMq4nvuL8QlNEp88xKoahHKSlWeCDRwJ5cNBO9JY=;
 b=OGg//uzagqDU7CZwuWNdWi5llP7io9PIxlue7Lbgq/wg4t61N9Da+nQtgyxKTEIVCN
 CUECY7q0jkCvQnU1wK1BSd58Pi9LV2FVZinJf0Ld4VKpXASZj2T4jZKYSYSvAvE7Bh4s
 uxojADT3WuzVni6DrTq9p7ChG39C79UycEcnDy7APPITP4RSqdQWsOCOTVGOyaNWh8zT
 e6f82fGLpoPYzjWE9CalSX51LfNQX67ZiH58jtB8ZU6GklHBMuzpGdHUJYvmB5p8pmjo
 CrqOKsFp9ecQMqNcwJNbPkUHUI9RcPf18Uz2IavQ9UeMK5g0a0jOCbBzh7cgoxg4EGdD
 XU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4j6pMq4nvuL8QlNEp88xKoahHKSlWeCDRwJ5cNBO9JY=;
 b=dIzvAJUS3fDBCatoP8dJ6SPDiprT/zLkxOcOZJH2p1TAZXbsFP2rjgoEDqrpZOg+KG
 wkjisUD464OY+ScU8WdG/Z1K2o9iVj9QvPjcE3yeGr7k7jPNrVOxf1tXp8ppolvh/qdJ
 6orflpz1tXGbH9Ndgm+PZvg41QPyyPNBGZVdMLyowAqIPg6+dUr1pUXhOr/oV0zZ3MB8
 PEsluAeZy6xwnYZwr/1ay3KxwkwIg11e609J+E50aVIGbvqgM1tuCa54VPVFax9VzarY
 hOYQR9S46QchSNok9UoSFBdgpw9POb4bxIEGDjwwVcAZspEK8KJJSlUAOo1wTuEFp92D
 1YFg==
X-Gm-Message-State: AOAM531HFcD/lHfnIHOdBK2oRnUGw2/+VA848Hf0q5fP4RhA5TdQXpLp
 lXJSW04CQwy9xoq/YiI9/cczIsW1qojIOwdy58wsDw==
X-Google-Smtp-Source: ABdhPJx/VvZncC7AWq+MASNzB9R5bDHgjyS5KsLmgvhom2XEGXolcvEBb3tgXCzaKPUp5ueutmBWf+NYkw12M4vZv/M=
X-Received: by 2002:a81:5d02:0:b0:2d1:41bb:38b1 with SMTP id
 r2-20020a815d02000000b002d141bb38b1mr34475612ywb.5.1646291804243; Wed, 02 Mar
 2022 23:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
 <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
In-Reply-To: <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 3 Mar 2022 15:16:33 +0800
Message-ID: <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_231645_459374_E2FAC7E8 
X-CRM114-Status: GOOD (  28.54  )
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

On Thu, Mar 3, 2022 at 12:38 AM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Mar 1, 2022, at 9:30 PM, Vincent Chen vincent.chen@sifive.com wrote:
>
> > Add support for RISC-V in the rseq selftests, which covers both
> > 64-bit and 32-bit ISA with little endian mode.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>
> If you also ran those tests on riscv, can you state so with a "Tested-by" ?
>
Yes, I ran all the tests under the selftests/rseq folder. Maybe I can
ask my colleagues to give it a test as well and give me a "Tested-by".

> Small nits below,
>
> > ---
> > tools/testing/selftests/rseq/param_test.c |  23 +
> > tools/testing/selftests/rseq/rseq-riscv.h | 676 ++++++++++++++++++++++
> > tools/testing/selftests/rseq/rseq.h       |   2 +
> > 3 files changed, 701 insertions(+)
> > create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h
> >
> > diff --git a/tools/testing/selftests/rseq/param_test.c
> > b/tools/testing/selftests/rseq/param_test.c
> > index 699ad5f93c34..0a6b8eafd444 100644
> > --- a/tools/testing/selftests/rseq/param_test.c
> > +++ b/tools/testing/selftests/rseq/param_test.c
> > @@ -207,6 +207,29 @@ unsigned int yield_mod_cnt, nr_abort;
> >       "addiu " INJECT_ASM_REG ", -1\n\t" \
> >       "bnez " INJECT_ASM_REG ", 222b\n\t" \
> >       "333:\n\t"
> > +#elif defined(__riscv)
> > +
> > +#define RSEQ_INJECT_INPUT \
> > +     , [loop_cnt_1]"m"(loop_cnt[1]) \
> > +     , [loop_cnt_2]"m"(loop_cnt[2]) \
> > +     , [loop_cnt_3]"m"(loop_cnt[3]) \
> > +     , [loop_cnt_4]"m"(loop_cnt[4]) \
> > +     , [loop_cnt_5]"m"(loop_cnt[5]) \
> > +     , [loop_cnt_6]"m"(loop_cnt[6])
> > +
> > +#define INJECT_ASM_REG       "t1"
> > +
> > +#define RSEQ_INJECT_CLOBBER \
> > +     , INJECT_ASM_REG
> > +
> > +#define RSEQ_INJECT_ASM(n)                                   \
> > +     "lw " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"         \
> > +     "beqz " INJECT_ASM_REG ", 333f\n\t"                     \
> > +     "222:\n\t"                                              \
> > +     "addi  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"   \
> > +     "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
> > +     "333:\n\t"
> > +
> >
> > #else
> > #error unsupported target
> > diff --git a/tools/testing/selftests/rseq/rseq-riscv.h
> > b/tools/testing/selftests/rseq/rseq-riscv.h
> > new file mode 100644
> > index 000000000000..845ec7d0f2ed
> > --- /dev/null
> > +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> > @@ -0,0 +1,676 @@
> > +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> > +/*
> > + * Select the instruction "csrw mhartid, x0" as the RSEQ_SIG. Unlike
> > + * other architecture, the ebreak instruction has no immediate field for
>
> architecture -> architectures

Thanks. I will correct it in my next version patch.
>
> > + * distinguishing purposes. Hence, ebreak is not suitable as RSEQ_SIG.
> > + * "csrw mhartid, x0" can also satisfy the RSEQ requirement because it
> > + * is an uncommon instruction and will raise an illegal instruction
> > + * exception when executed in all modes.
> > + */
> > +
> > +#if __ORDER_LITTLE_ENDIAN__ == 1234
>
> I think we'll want to standardize on this for endianness checking (same as
> the updated uapi rseq.h):
>
> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>
> We may have to change rseq-mips.h in the rseq selftests to do the same as well rather than
> using "# ifdef __BIG_ENDIAN".
>

OK, I can follow it. However, I found the endianness checking in
include/uapi/linux/rseq.h is
#if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) ||
defined(__BIG_ENDIAN)

It is a little different than what you mentioned early. Should I
follow the format in include/uapi/linux/rseq.h? or both formats are
OK?

Thanks,
Vincent

> > +#define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> > +#else
> > +#error "Currently, RSEQ only supports Little-Endian version"
> > +#endif
> > +
>
> [...]
>
> Thanks,
>
> Mathieu
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
