Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986A5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv9sCbX2+nKJbbHCST+oFMwBOe/yzy6PVmtWak+e9cU=; b=2x25pSOUZ4uvHP
	SaJweuj+lfM+Gcne5pEhWotMHRAXEGBY7BUIEN6/16rZLmxUAOsL4Z8OdKSJaL6F70DKtFksYid9Z
	9qEw7CE3P247GnHEkafNb0rPZ7zBQzcNavjUHe63LZ0qEcwhyV4ofqS/wtRkmi/GlErBqmcqM2Fd2
	1v9X3SMBa12nfSm6E2FRUp49g7G4pgzfE3vZb1JL8xgb5mODJD/G6AKFy6pg5xhpa/6FdHzU1+NP+
	scknji2eqPejamEEqvIe8y5cm6tO2chnvWhTEQhgUvNlzMop2FsSGedEaPKvqhRp+un2Z3E/zxleu
	ESF33433DGmtjzJ5MV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqoQL-00BYAd-BL; Tue, 17 May 2022 04:03:05 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqoQH-00BYA2-Kv
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 04:03:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id h29so29183784lfj.2
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 21:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLuh6iim4/H/XbPkV7FBYvTzbDgx426YXgEZpo+wCs8=;
 b=h/uB1SJQjYPxqpCmzRGCV2+SA9pB9F6Y0DBV8COwWi5dC//eegFBMmdUp31Vzeg5rx
 qbj6Ndes5JT36T5eDBKKlnwqTcLujVuy6MUsE0UiR8HvIgcJoy4vOrnohnSlUiLSUCek
 0CCOEfoVUuQpGA0bNr5nufd18cgI8ucnw1ywLq3hK0bR/J9sMNmHEoxkq6Vdvj8gCUAa
 gIJVbCwWfslgMs9YsTz8mYUMp1IjbSaertxKqsWJkGEZ+LcROg0eJ3s9HKZgicdeWqgG
 RlfMjmrGCN7+YytXWVX0Njm0vRnLllUZjGVOutuR8kkKjM1EU0IBixCA8ETedpIKxrJA
 FLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLuh6iim4/H/XbPkV7FBYvTzbDgx426YXgEZpo+wCs8=;
 b=DekEeZ7O0lr4i1nhcz1iuQymft0vV5bKwV9aWIVa+079PWYm38Xi+oXoEwjqfQrjcn
 7twDhx9dC+e8xfDbikD8jdnx329f3qZHihLsFzbJL6YJKHPDoaTT+AhNKO8Bsmb44AZl
 iN69FfNuCCAFhRDiDwGdypOnuQE/0WYDMwroVbexWpdDJx2oPxD53ceMAyyicFPQ08Q1
 7+G/58soegaQ1l41RGTAjoVbggQsV/HwgSSnmc0J2k3QnQ2w2Xwa1U+XbLn9O6AeWBQG
 At83v7Va7aiBfwMBMO6S0PwhYdNN9CLKP9iXZDe3drfcAOU4gvIopkyhxSjp6UU1vtka
 TiIQ==
X-Gm-Message-State: AOAM531xbmQlL666/PdHwHJs3ToIqacbnivb8486fm4GttJI/WfKMa6S
 5N6fTbZYbJtPc3fOcNCtv81hoow9usDDJgnMRbOAsQ==
X-Google-Smtp-Source: ABdhPJzDGKq4CvrYRIjO/1+pCqdoDGroAy2iSOeVL+38mDlDjSUyOGj/dvqYTcf7drbGhM4n16FSkfgysnhBO474F6Y=
X-Received: by 2002:a05:6512:309:b0:477:a8c7:96d8 with SMTP id
 t9-20020a056512030900b00477a8c796d8mr142603lfp.41.1652760179523; Mon, 16 May
 2022 21:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220508160749.984-1-jszhang@kernel.org>
 <20220508160749.984-3-jszhang@kernel.org>
 <CAK9=C2Xinc6Y9ue+3ZOvKOOgru7wvJNcEPLvO4aZGuQqETXi2w@mail.gmail.com>
 <YnkoKxaPbrTnZPQv@xhacker>
 <CAOnJCU+XR5mtqKBQLMj3JgsTPgvAQdO_jj2FWqcu7f9MezNCKA@mail.gmail.com>
 <YoCollqhS93NJZjL@xhacker>
 <CAAhSdy3_av5H-V_d5ynwgfeZYsCnCSd5pFSEKCzDSDBbD+pGLA@mail.gmail.com>
 <YoKIv2ATRdQfYbBf@xhacker>
In-Reply-To: <YoKIv2ATRdQfYbBf@xhacker>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 17 May 2022 09:31:50 +0530
Message-ID: <CAK9=C2VJ-+bu20+QOfKrq6cEBE93Yi21U=zU9AKOSQi1GGHWiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: introduce unified static key mechanism for
 CPU features
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_210301_736333_21B7FDFF 
X-CRM114-Status: GOOD (  53.62  )
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

On Mon, May 16, 2022 at 11:02 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Sun, May 15, 2022 at 08:19:37PM +0530, Anup Patel wrote:
> > On Sun, May 15, 2022 at 12:54 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > On Wed, May 11, 2022 at 11:29:32PM -0700, Atish Patra wrote:
> > > > On Mon, May 9, 2022 at 7:50 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > > >
> > > > > On Mon, May 09, 2022 at 09:17:10AM +0530, Anup Patel wrote:
> > > > > > On Sun, May 8, 2022 at 9:47 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > > > > >
> > > > > > > Currently, riscv has several features why may not be supported on all
> > > > > > > riscv platforms, for example, FPU, SV48 and so on. To support unified
> > > > > > > kernel Image style, we need to check whether the feature is suportted
> > > > > > > or not. If the check sits at hot code path, then performance will be
> > > > > > > impacted a lot. static key can be used to solve the issue. In the past
> > > > > > > FPU support has been converted to use static key mechanism. I believe
> > > > > > > we will have similar cases in the future.
> > > > > >
> > > > > > It's not just FPU and Sv48. There are several others such as Svinval,
> > > > > > Vector, Svnapot, Svpbmt, and many many others.
> > > > > >
> > > > > > Overall, I agree with the approach of using static key array but I
> > > > > > disagree with the semantics and the duplicate stuff being added.
> > > > > >
> > > > > > Please see more comments below ..
> > > > > >
> > > > > > >
> > > > > > > Similar as arm64 does(in fact, some code is borrowed from arm64), this
> > > > > > > patch tries to add an unified mechanism to use static keys for all
> > > > > > > the cpu features by implementing an array of default-false static keys
> > > > > > > and enabling them when detected. The cpus_have_*_cap() check uses the
> > > > > > > static keys if riscv_const_caps_ready is finalized, otherwise the
> > > > > > > compiler generates the bitmap test.
> > > > > >
> > > > > > First of all, we should stop calling this a feature (like ARM does). Rather,
> > > > > > we should call these as isa extensions ("isaext") to align with the RISC-V
> > > > > > priv spec and RISC-V profiles spec. For all the ISA optionalities which do
> > > > > > not have distinct extension name, the RISC-V profiles spec is assigning
> > > > > > names to all such optionalities.
> > > > >
> > > > > Same as the reply a few minutes ago, the key problem here is do all
> > > > > CPU features belong to *ISA* extensions? For example, SV48, SV57 etc.
> > > > > I agree with Atish's comments here:
> > > > >
> > > > > "I think the cpu feature is a superset of the ISA extension.
> > > > > cpu feature != ISA extension"
> > > > >
> > > >
> > > > It seems to be accurate at that point in time. However, the latest
> > > > profile spec seems to
> > > > define everything as an extension including sv48.
> > > >
> > > > https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#623-rva22s64-supported-optional-extensions
> > > >
> > > > It may be a redundant effort and confusing to create two sets i.e.
> > > > feature and extension in this case.
> > > > But this specification is not frozen yet and may change in the future.
> > > > We at least know that that is the current intention.
> > > >
> > > > Array of static keys is definitely useful and should be used for all
> > > > well defined ISA extensions by the ratified priv spec.
> > > > This will simplify this patch as well. For any feature/extensions
> > > > (i.e. sv48/sv57) which was never defined as an extension
> > > > in the priv spec but profile seems to define it now, I would leave it
> > > > alone for the time being. Converting the existing code
> > > > to static key probably has value but please do not include it in the
> > > > static key array setup.
> > > >
> > > > Once the profile spec is frozen, we can decide which direction the
> > > > Linux kernel should go.
> > > >
> > >
> > > Hi Atish, Anup,
> > >
> > > I see your points and thanks for the information of the profile
> > > spec. Now, I have other two points about isa VS features:
> > >
> > > 1. Not all isa extenstions need static key mechanism, so if we
> > > make a static key array with 1:1 riscv_isa <-> static key relationship
> > > there may be waste.
> > >
> > > For example, the 'a', 'c', 'i', 'm' and so on don't have static
> > > key usage.
> >
> > Not all isa extensions but a large number of them will need a static
> > key. It's better to always have one static key per ISA extension
> > defined in cpufeatures.c
>
> Currently, RISCV_ISA_EXT_MAX equals to 64 while the base ID is 26.
> In those 26 base IDs, only F/D and V need static key, it means
> we waste at least 24 static keys.

If you want to save space of unused static keys then there are other
ways.

For example, you can create a small static key array which has
many-to-one relation with the ISA extension numbers. For ISA extension
which are always ON or always OFF, we can use fixed FALSE and
TRUE keys. Something like below.

enum riscv_isa_ext_key {
    RISCV_ISA_EXT_KEY_FALSE = 0,
    RISCV_ISA_EXT_KEY_TRUE,
    RISCV_ISA_EXT_KEY_FLOAD, /* For 'F' and 'D' */
    RISCV_ISA_EXT_KEY_VECTOR, /* For all vector extensions */
    RISCV_ISA_EXT_KEY_SVINVAL,
    RISCV_ISA_EXT_KEY_SSCOFPMT,
    RISCV_ISA_EXT_KEY_MAX,
};

extern unsigned char __riscv_isa_ext_id2key[RISCV_ISA_EXT_ID_MAX];
extern struct static_key_false __riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];

static __always_inline bool __riscv_isa_extension_keycheck(unsigned int ext)
{
    if (RISCV_ISA_EXT_ID_MAX <= ext)
        return false;
    return static_branch_unlikely(&__riscv_isa_ext_keys[__riscv_isa_ext_id2key[ext]]);
}
#define riscv_isa_extension_keycheck(ext)    \
    __riscv_isa_extension_keycheck(RISCV_ISA_EXT_##ext)

>
> >
> > For example, F, D, V, Sstc, Svinval, Ssofpmt, Zb*, AIA, etc.
> >
> > >
> > > 2.We may need riscv architecture static keys for non-isa, this is
> > > usually related with the linux os itself, for example
> > > a static key for "unmap kernelspace at userspace".
> > > static keys for "spectre CVE mitigations"
> > > etc.
> >
> > These things look more like errata or workarounds so better
> > to use that framework instead of ISA extensions (or features).
>
> Currently, the errata workarounds are implemented with ALTERNATIVEs
> but I believe sometime we may need static key to implement the
> workarounds. However this can be checked later. Now I worried about
> the static key waste above.

That's a separate topic and for now what we need is a simple
and extensible approach to have static keys for ISA extensions.

Regards,
Anup

>
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
