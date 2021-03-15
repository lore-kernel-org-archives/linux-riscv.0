Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890ECC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 08:29:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63C764E89
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D63C764E89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4Cv29TMlsy91PlET5MVd+bgO53P3OBr5YFnxw1TiYA=; b=c54ABTWfu5tFGt314rRrrwzQf
	6VoAN9MKV6afnf6nrgv0gTRBIURo5gtavn4bL1jgPwxkgaGdkiuNWBsR//zF0A7ajbA8/yxxqNxzH
	1n8u3OnXpv83qqf7YqV5USi3HpISWe7Rh8CxEo5yqEOGYo/O2lA9dOY3r0aCk+6mMJajBLJkidiYo
	pLe4RCLYzAJywMRxoQvc533HoDxEn8KmcwSZScHIhAHdG0NYYOkBCtNgPglAzOkX9h4c55wOxzMs/
	3F9EfkjCf81++gPB7WrfhhCOGlOQHBEVlufOX3xaFbD6bDNIAkQAmNjt1Qj+6OUE6drogZ+lJlfEd
	VMzAWpGCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLibd-00FE72-0H; Mon, 15 Mar 2021 08:29:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLibT-00FE5Y-VV
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 08:29:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id 30so10364773ple.4
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDzDjgfqeSZhIwH2i62SY5pTg1wDj9T0yHNqScZAFFY=;
 b=UboG+CFjDIwsF9x6Pb68945hgy9PMMemHeNBqLv28JblZGlMumgi45vv4dwlWumWzj
 qp4xRCoZJK3Yse/1+1z4pLbHqF007Da+OPBDEpcUyH2flZQGFD6jeMWB4r5MXcNly0fm
 2UjG4JHs8nL+ahJDbHW/ua5WMAjYWFoYmq5foNN4pT6g7X9Gk9WEW8+WGXzgJCo6itD9
 qgFDUdexUj8oryv/Yh3ofc/B5076CU5zEZhIJgA0z4Akt6GdKCvrOBqnhi82ZM/uFxOM
 e0EmCxhCBthcThxbnIQaGUMd2HQBHlwlpivjq3hs6/FFx7bcC3Lrg8ZbVfKIMwNdigcg
 NgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDzDjgfqeSZhIwH2i62SY5pTg1wDj9T0yHNqScZAFFY=;
 b=izTbzYcJPZlkl+etqMPKes1J9HX53YN+01a1ZsHIaZAGDyFaj4XdkwZB57uJXKdsA3
 DniUTnkg+KixNKXkZUMapQqbWQ5ZDMq26N/cDnV0aZG5IYcsGMI7rT0D9MLnwu0H49oi
 5ewzLF8koEiaKYG+FtxnvmLRk8Cev64a+CqlEv9uQqk3JB6k8Mm8ARXOtXAbH4GSHZiK
 7bX1B5j/QS45zNHLz3jPrKjrO7BUpo6fQX+KdxiT3/AeI2rloIKXA/r3kDrQp8iTXxhr
 l+zPkesmGLFqeI5UM+h2BbvGP62x30zaEOMza9rHhggzipX2f65l1JqjlsN6wS3biXEc
 oeng==
X-Gm-Message-State: AOAM532pmp/VOlthC8y8rZKnP38J1xOlaJfkhoKd7JoECBLckJfwwRE3
 xjqjnu+zvXnsR8wJt5abvAO1FJbLKoPqN1GkKIVpK/vU4tJrQAEF
X-Google-Smtp-Source: ABdhPJyVroQLdlQE58S0tG+MweBirK5ZD/5l0pKBy4Oe4txzOk+9ecQiNT/f2gy73ZK/m8bMQp2op89TKVpUnpaQ03Q=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr11630737pjp.166.1615796968544; 
 Mon, 15 Mar 2021 01:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210311034707.GA7334@APC301.andestech.com>
 <CABvJ_xghwbPJPKnd+ksSzAq5N0PkjhGMKKz88pT5smgqKz6-JA@mail.gmail.com>
 <ab1931d5-2a50-4263-fc46-35999f803740@andestech.com>
In-Reply-To: <ab1931d5-2a50-4263-fc46-35999f803740@andestech.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 15 Mar 2021 16:29:17 +0800
Message-ID: <CABvJ_xgAbsewUX_Ze+4MaT3x-EfG+r8soW6WDRjELS5nn0-qRQ@mail.gmail.com>
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_082933_244802_F710DB1C 
X-CRM114-Status: GOOD (  29.86  )
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

On Mon, Mar 15, 2021 at 12:46 PM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi Vincent,
>
> > However, if all vendors are willing to suffer the performance impact
> > from other vendor's errata, I can change the framework to "#ifdef"
> > scheme. After all, it may need to take a lot of time to accumulate a
> > lot of errata to make the performance impact obvious.
> I'm not sure if I'm interpreting the alternative framework right, yet I have
> doubts about the performance arguments.
> Just as the example (CONFIG_QCOM_FALKOR_ERRATUM_E1041) I quoted in the
> previous
> mail, in their final decision, the `#ifdef` simply toggles the code in
> _compile time_ [1].
>
> I don't know why they chose to enable it by default [2], yet ideally, for
> irrelevant processors/SoCs, people should be able to turn the option off
> without issues.
>
> Somehow, to my best acknowledgment and as you mentioned, in ARM's ecosystem
> (more specifically, the distros), alternative-based errata fixes are all
> enabl-
> ed by default, so all the errata workarounds will be generated and gathered
> into a special section. This will cause the size of Linux image which
> distros
> shipped to become larger and larger.
>
> For ARM, that might not be a problem since most of the IC vendors
> nowadays are
> licensing from ARM and few of them are making their microarchitectures.
> So mi errata es su errata. (My errata is your errata.)
>
> Yet for RISC-V, we have plenty of players who make their home-grown cores on
> the field.
> This leads to a dilemma: either to enable all the workarounds by default
> so the
> distros could just build one general image which will become bloated or
> specially crafted images will be provided lead to a fractured experience for
> end-users.
>
> My 2 cents on this issue is that maybe we need to establish a principle
> (probably not in a written-down manner) on deciding what goes to alternative
> and what shall just be an option disabled by default.
>
> Cordially yours,
> Ruinland
>

Hi Ruinland,
I can understand and agree with what you worry about the image size.
However, I have a different idea to resolve this issue.

I prefer the RISC-V default configuration to enable all errata
KCONFIG. It can ensure that the default image can run on all vendors'
platforms without any known hardware issue. For general users, it is
more friendly because they do not need to worry whether missing the
required errata or not. For advanced users such as distros, given the
targeted platforms, they can use Kconfig to disable unneeded errata to
shrink the kernel image. Therefore, they do not ship a bloated kernel
image to their customers.

Back to the current alternative framework, it can support the above
case. Users can only enable particular CONFIG_ERRATA_XXX to generate a
customized image for a specified platform. Because the kernel patches
errata at runtime, it also allows users to enable multiple
CONFIG_ERRATA_XXX at the same time to generate a uniform image run on
multiple RISC-V platforms. Therefore, it reserves the flexibility for
distros or vendors to customize the kernel image.

In contrast to the alternative framework, if we only use "ifdef" to
patch errata at compile-time, one image can run on specified
platforms. In this case, not only distros but also vendors will have
kernel image fragmentation issues. It may increase the maintenance
effort.

Based on the above reason, I do not prefer to use "ifdef" to patch
errata at compile time.

Best regards,
Vincent

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
