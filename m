Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40199C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 15:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6FA615A0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 15:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF6FA615A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJPimGtrgnLuoFBjJVH2he4lZIfEDXxOAYOSySNJAyA=; b=5GmaabcplVaTww
	8j8pO+aqsuFR0zGallA6ok4lxOBsMOMX/SDEQHKLzkHTjrwiFJFRS83pD/a41lHRUU6zMzlYPkbZ4
	68OKeUYct0HHWqp3/VX7M4X8nBm85kmFvhIa1UamqkFfBea0yvGtRkjiZBMfne9bJenX+EjUB/aWV
	XBpEyHsYV9WwNrTmKIyNd089/4V+WA2QL7tuLhTVaT72HAB7k/V1rtL8yTyqCAR3xAdAewC5WdK4o
	X2i2x4ht6BYMJsbJcF6PGillcoVMWT/joVK1Q9UAPvoNq9r07OMl6Zmkr743C2Eq3J++PwLYoPutz
	52mrYBAmoen3AojkeT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9BZ-000CLO-AV; Tue, 15 Jun 2021 13:32:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Ak-000ByJ-7o
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uvjvHvAC/emezf1TT8TfW7bzk39CSLbZo6cMbFR9jDI=; b=IKLK0V3GVtMw4VRsq5tIHgKnjC
 7+Eyt6jKSuegddDZfZC1RSRge+X+lR24D6gkSpV70UnNm3/B9faYVeR4ANGgInm/PVuYBXfzs2mXc
 XjwopCWcbAyYAyEFL+I4ZXzyJE07PUFbIYd+q3EokvJW73zz3ECwyJJ77NdvZXKjNU8tVAveW900t
 xa/fZkD5wqFXG87gmXiOPhPTPw0bDPegr0Dz98wBal9Pd8xeIraQX8l8buXex7gtzKGNSXyvigBxO
 3B5oK2OFClGREHSbB5XpmESw09vYU3A8+pBZcNkGCuxCLw5T+VRuTbaiCtvEzM4NNJqJLM132JxhZ
 fbAMDwfQ==;
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt97n-007vuj-60
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:29:11 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id f84so20573432ybg.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uvjvHvAC/emezf1TT8TfW7bzk39CSLbZo6cMbFR9jDI=;
 b=mVr3XPLyY1LqPXdMCn+rHB4K8fx6/BnrIVCx2eaNBm8ttnquM5GKIKMDL8I4L1+DGZ
 nE/4JYSDg5sNcbsUiX3jbBg+7BjhVuX0Twjc3ZP4bRZs7AB/dLiE7LcKQuC8Af5eKh+Z
 5u2Q0RmpcAG7Ol0Ih7HWYOsCohHR3JwtfF71oNU2Sq/EW3PvvtOQVGcwlHhUzkeV2d0E
 r27zrbmgCIVajOI8HXEQSXeKgtDaZfW4qtYhe2S/sVDDvEGwqIMNAFy4CbJrywaG3tVs
 iUbJrFcERWaSjyDGYzSQ9y8s2Jjsh9pAKDj17sLmwMJJdFQRrfw2W3AFmMCudsZ0+hFb
 P5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uvjvHvAC/emezf1TT8TfW7bzk39CSLbZo6cMbFR9jDI=;
 b=FGiSpOcePSl4Kmk7/GEkqzAdq21vXpizW141EefPRzqzu10k8OiJwpEPlJuDzGsoaN
 2lPx5e5qXgneUFHJCB8WGvp/r3gyhUji37kEgZM2lO22O3ma7yLsQ6TOSPB1gbpu7e10
 JjLS4OeIQQSN8csxR1cupWQCUDmcorIZ0rBx+Ax3RVQQTxQo2/E6VaFFN8+yJAM6icZ4
 hWvk9NrCrOAPqKSkjr+gp4aqhh1M9U7cs2uLy9TOwpouKua39o1aJwrbdWhBFryEIsL6
 +ORHqc4ndiociRyyqKa4U2e9berpzjls4PI4MykpheBDkbaVWm5YaWft6VRKDIH28S+j
 Pklw==
X-Gm-Message-State: AOAM530hLscZBtgicwi5lLnyIrNQNM93A9bIXgT67K206Otma9UaRnpJ
 cHk6YZjsyFECtdsX0k+IXDqvODurMaNDE6W3iOg=
X-Google-Smtp-Source: ABdhPJyyKHVrbq5KlrhfgrkkDasvvPgFn72PU15jH6AkKfoZVVyCAspKXNCIcJy7sG/A62WQlhBQF10CHMnzLvFUJWI=
X-Received: by 2002:a25:389:: with SMTP id 131mr33218309ybd.306.1623763748567; 
 Tue, 15 Jun 2021 06:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
In-Reply-To: <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 21:28:57 +0800
Message-ID: <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>, Gary Guo <gary@garyguo.net>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_142910_067031_D98CCF15 
X-CRM114-Status: GOOD (  18.57  )
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

On Tue, Jun 15, 2021 at 9:18 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Bin Meng
> > Sent: 15 June 2021 14:09
> >
> > On Tue, Jun 15, 2021 at 4:57 PM David Laight <David.Laight@aculab.com> wrote:
> > >
> ...
> > > I'm surprised that the C loop:
> > >
> > > > +             for (; count >= bytes_long; count -= bytes_long)
> > > > +                     *d.ulong++ = *s.ulong++;
> > >
> > > ends up being faster than the ASM 'read lots' - 'write lots' loop.
> >
> > I believe that's because the assembly version has some unaligned
> > access cases, which end up being trap-n-emulated in the OpenSBI
> > firmware, and that is a big overhead.
>
> Ah, that would make sense since the asm user copy code
> was broken for misaligned copies.
> I suspect memcpy() was broken the same way.
>

Yes, Gary Guo sent one patch long time ago against the broken assembly
version, but that patch was still not applied as of today.
https://patchwork.kernel.org/project/linux-riscv/patch/20210216225555.4976-1-gary@garyguo.net/

I suggest Matteo re-test using Gary's version.

> I'm surprised IP_NET_ALIGN isn't set to 2 to try to
> avoid all these misaligned copies in the network stack.
> Although avoiding 8n+4 aligned data is rather harder.
>
> Misaligned copies are just best avoided - really even on x86.
> The 'real fun' is when the access crosses TLB boundaries.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
