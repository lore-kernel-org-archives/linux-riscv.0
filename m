Return-Path: <SRS0=+Vgc=7E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A204C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 May 2020 06:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E0E20776
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 May 2020 06:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNaxbzL6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ycKBEsXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E0E20776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mp6z6BeKUJ4Z3j+pwMrXanCl98jvhdKIr7OaOufzROo=; b=TNaxbzL6bMsSp4SjySt7o/bS2
	vvGUjH3VPoKMYKreeGGWOsoZicQGmaqb5J6bXIvVwPOVtBN8oU2B6NtyqrYU+XaDvSJTFEvlk++UG
	Wq+P6luIQiODKG9YzXcCbJ4cGof4jD6D4L1D2TlTYMSABoDoSP9kljurJP8X4lAsTK7pqnABpLCWA
	itcnuA5c9X2/00g53MHAfxRUoGw1SXU0mgNg6Q87VNLZRRSIw10iuM1QzwRr832q9CAFEF2cq4b3r
	JbqkN+KwF9Jk8ZhwF3y3hDcD5IciB7FcHMfA22S8V5YuvTziQx6sdlx/vWJBp9c7eGwCfZBTDLZAp
	AzSscSe2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc1I7-0001ne-E5; Fri, 22 May 2020 06:36:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc1I4-0001nH-St
 for linux-riscv@lists.infradead.org; Fri, 22 May 2020 06:36:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id u188so8747671wmu.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 May 2020 23:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mp6z6BeKUJ4Z3j+pwMrXanCl98jvhdKIr7OaOufzROo=;
 b=ycKBEsXTb+BxsF1E77LY/R04LkIWlGVEDVXwR0PFQnoFMwnAQaK1qonVfAKXfGUqVV
 go4okfKzet3y0osi2r+mpOXkYNvUk9iU/3t/pD+GtTVo62YDChDlZDEgRc6ugYkl9UlI
 pA5HIPu0U89oj1XLXQfYyNul4tVsV00fQ9ZfhDgbAFbXHLYOKf7KUnmvPyMbA4/f8CYD
 n1qtH4pfLvrCK2LLVEfHE7Xzro2vu/torO/auE+bF69LPORosxZRLVriwoGuvLwRxQDW
 MVSCz9JTf8ZlhIECQr8ji2+NvFf2YPmqWrGZNKDi3A1gowqwFci315M9B6ejoPUM5/ma
 ATEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mp6z6BeKUJ4Z3j+pwMrXanCl98jvhdKIr7OaOufzROo=;
 b=pvu5uH8N+z2RtorvH7PgLEax01AaGjDSeHOFFhtQN/uCxRl0my4TUFxIiHsaKLw4xU
 BCpsJUO4viQvhZZcg+TvpKLuXBrMN8YoNSoy1pElgW5cG+EEQcKVWoxZDI5UvXTITyA3
 CdMcbsXDI4C3CYnmgqojx/mgpDMy49mz/4O7H9ZKG3JXqFaz+nWONbsEymFpa1/gaGVQ
 8KgcIQlxcWmnxduG3Nx1CvmbBn8olDag7kyRydcGxQz1K8VYhPKDlRqRIpdji4Fi1+Yd
 EeuKD16kteqN5okQ+U2gOMsQ4ghLTrqYCj7UL8rt/z4lsvcpzsMd6Go1n2cT9duA5JG6
 gKJw==
X-Gm-Message-State: AOAM532Kr49h3JLmlMhiQzLr6bfNYlR6IO7beIUCJGL/1czQBKJA0oDc
 mUw1THr1PrEr+LK+lRpKXh+WT6xmrKPP8sMERT3raw==
X-Google-Smtp-Source: ABdhPJykCpEJOH6fDySj/9KTQUVlXV7NLYQkkTeYIL3vQp6QzdI5zeWjcL1/7ZOhIw9nOY0uY1U3fi2R3XWSJ7hyhmg=
X-Received: by 2002:a1c:7410:: with SMTP id p16mr12579344wmc.134.1590129379212; 
 Thu, 21 May 2020 23:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200521134544.816918-1-anup.patel@wdc.com>
 <20200521134544.816918-6-anup.patel@wdc.com>
 <2aec08b7-7197-4b60-89d9-c3b0d5a8a258@gmail.com>
 <CAAhSdy0OuxCwMVPBrvPpYMfVrhUuY3pONysk75yognOM5-0U+g@mail.gmail.com>
 <c0e9e625-daf8-b72f-2237-06018ff5d8a0@gmail.com>
In-Reply-To: <c0e9e625-daf8-b72f-2237-06018ff5d8a0@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 May 2020 12:06:07 +0530
Message-ID: <CAAhSdy3_D9S0X1gHoPjHpfcpeEpVWdUa_HE_KYV3eXbB3eVhdw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: timer: Add CLINT bindings
To: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_233620_932538_EA2589C3 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 11:59 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 5/22/20 1:54 AM, Anup Patel wrote:
> > On Fri, May 22, 2020 at 1:35 AM Sean Anderson <seanga2@gmail.com> wrote:
> >>
> >> On 5/21/20 9:45 AM, Anup Patel wrote:
> >>> +Required properties:
> >>> +- compatible : "sifive,clint-1.0.0" and a string identifying the actual
> >>> +  detailed implementation in case that specific bugs need to be worked around.
> >>
> >> Should the "riscv,clint0" compatible string be documented here? This
> >
> > Yes, I forgot to add this compatible string. I will add in v2.
> >
> >> peripheral is not really specific to sifive, as it is present in most
> >> rocket-chip cores.
> >
> > I agree that CLINT is present in a lot of non-SiFive RISC-V SOCs and
> > FPGAs but this IP is only documented as part of SiFive FU540 SOC.
> > (Refer, https://static.dev.sifive.com/FU540-C000-v1.0.pdf)
> >
> > The RISC-V foundation should host the CLINT spec independently
> > under https://github.com/riscv and make CLINT spec totally open.
> >
> > For now, I have documented it just like PLIC DT bindings found at:
> > Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
>
> The PLIC seems to have its own RISC-V-sponsored documentation [1] which
> was split off from the older privileged specs. By your logic above,
> should it be renamed to riscv,plic0.txt (with a corresponding change in
> the documented compatible strings)?
>
> [1] https://github.com/riscv/riscv-plic-spec

For PLIC bindings, we can certainly do the renaming because now
we have PLIC v1 specification hosted on RISC-V Foundation Github.

Regards,
Anup

