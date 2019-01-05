Return-Path: <SRS0=tJfH=PN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0066C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Jan 2019 01:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA412173B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Jan 2019 01:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n771mKJJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wKUjabnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA412173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gqe21rko0Hr4GkN6swFdgguvMhLE6jqZU+tC7UwBGjw=; b=n771mKJJsdePpS
	pGhfLvhGWXpm1AYPPyaU4naV4SEJEJG6EYWIMLCjJKYp/5mb9NwQm+mXsHs2yFtrx/aAmkTKXvpdg
	zpsTHaRNHz4qOY4oMmTH283FIpzH0eustCvSO3hypbi/qBsyEYJIscm/pcfi1e6B41ZO1CWneTWvN
	cVBEEinX3zK9V49wUsDMB0Yx/z+bqy3dPnriZJ7U8v/uSqoq+jGu93l6Bx4n58SOIJzeTeP9qLPY/
	k7nu5fappIxDAOcUuvMbQnZJmqacIuQqwd83hpIOIV8ATkF+oLbcgzT/oHen2J//wKhdZO+Sitqw9
	HB5/W0BThkABgTlQxAgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfaTm-0001iU-6u; Sat, 05 Jan 2019 01:10:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfaTi-0001hi-G7
 for linux-riscv@lists.infradead.org; Sat, 05 Jan 2019 01:10:20 +0000
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A2E7218E2
 for <linux-riscv@lists.infradead.org>; Sat,  5 Jan 2019 01:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546650617;
 bh=izqCTOdMtM2Q4k4QJclyd2lx3suw6mEz/I9wnXl1lI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wKUjabnnUaYNqbBdb8BvEbsUEOHOtgZfL6//PYG152G8VNgJGZFofVwdCHY6M0Ixk
 AO424sV6TfBoiGGMAiJirdQo+5x5Ute0XwVF7TpI+BWOxaEmpUHlYv1yXvZocDu9TX
 xpd6fQxtsT+Np+ht9goCueLK1nOD/B7GJ5J35GZw=
Received: by mail-qt1-f175.google.com with SMTP id k12so42285689qtf.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jan 2019 17:10:17 -0800 (PST)
X-Gm-Message-State: AA+aEWZ9U1LNL4nz9f0xdQKrrCKrNP+xm9FGQrrf268KcSrNPKmw4enm
 hcv97rCvYu+1Ep/oXncOv8Ef1cPUA+5/uY3XxA==
X-Google-Smtp-Source: AFSGD/XGVGSj9p+Ls1/9D55m9I/CN1kaUL2qQfZQM/84hVp5JSvi6I5zKDA5gSuoz81xa+Kf5xtTAN2MGMGBosCpD14=
X-Received: by 2002:ac8:6b18:: with SMTP id w24mr52668314qts.144.1546650616425; 
 Fri, 04 Jan 2019 17:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20181220210141.GA17198@bogus>
 <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
In-Reply-To: <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Jan 2019 19:10:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL_M-_L3LdiE9htSCsQt40pXNYMBN+BCKpqB8L-5TDrNg@mail.gmail.com>
Message-ID: <CAL_JsqL_M-_L3LdiE9htSCsQt40pXNYMBN+BCKpqB8L-5TDrNg@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list
 of documented CPUs
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_171018_601042_3FBC8D72 
X-CRM114-Status: GOOD (  19.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 4, 2019 at 4:46 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 20 Dec 2018 13:01:41 PST (-0800), robh@kernel.org wrote:
> > On Fri, Dec 14, 2018 at 09:21:50PM -0800, Paul Walmsley wrote:
> >> Add compatible strings for the SiFive E51 family of CPU cores to the
> >> RISC-V CPU compatible string documentation.  The E51 CPU core is
> >> described in:
> >>
> >> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> >>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Palmer Dabbelt <palmer@sifive.com>
> >> Cc: Albert Ou <aou@eecs.berkeley.edu>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: linux-riscv@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> >> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> >> index adf7b7af5dc3..fb9d4f86f41f 100644
> >> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> >> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> >> @@ -68,8 +68,9 @@ described below.
> >>          - compatible:
> >>                  Usage: required
> >>                  Value type: <stringlist>
> >> -                Definition: must contain "riscv", may contain one of
> >> -                            "sifive,rocket0"
> >> +                Definition: must contain "riscv", may contain one or
> >> +                        more of "sifive,rocket0", "sifive,e51",
> >> +                        "sifive,e5"
> >
> > I can't really tell what are valid combinations from this. It reads that
> > I could list every string here and that would be valid. It is basically
> > 'riscv' plus any other combinations of strings.
>
> I think that's actually the correct interpretation: if it's a RISC-V CPU then
> it must have "riscv" listed in compatible, but it can also be anything else.

But is '"sifive,rocket0", "sifive,e51", "sifive,e5", "riscv"' valid?
What about '"sifive,rocket0", "sifive,e5", "riscv"'?

If they are, is there really any value in specifying all of them or
different variations? I'd suggest keeping things simple because
writing a json-schema gets messy when there's arbitrary combinations
of compatible values.

> There's some concrete examples here (a "sifive,e51" is a type of "riscv"), but
> I don't think it's realistic to count on us being able to enumerate all RISC-V
> implementations here.

I think you'll find that "riscv" will become pointless as it is not
specific enough to mean anything. It would be like having "arm" as a
compatible on Arm based systems.

OTOH, you only really need to enumerate what you can't discover. For
example, how are optional features (SIMD inst a common example)
discovered? On Arm, we generally just have the CPU model in the
compatible, but it's generally not even used because that, cpu
revision, instruction set features, etc. are all discoverable.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
