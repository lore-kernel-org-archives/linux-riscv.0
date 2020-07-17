Return-Path: <SRS0=PiI0=A4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10176C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:14:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9002071A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iM9asoxA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9i5IFRu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9002071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RTu5LR2fJsE2+3GHWiO0/9QNMC13+n1nR+e43GHhAyw=; b=iM9asoxAMBfp4qwci79z8G9Cs
	e4klx0ODPDhm1rrxCs0NNdwADNjjTwYJc+suThhCKE1Y6WPEgSKoFnicIvmUSTxdu3ozfRRiZtYQD
	lIPt6kQTQeSTqkPq6DxDRciPs2ZzQEQM/F5e4tsyyAbxDwfakMlWaVSKvE9XO5cdifxNxnTUM7YQ1
	d7ncxJb8UMK+QvuF2U1L7aSwgyrX5lU46cfCQzMDGdbtUFTIrQ8BiS6wns2gyIHmzMMYf+UkEYjgP
	4yi11rgSVVJVev9hmelZo4nLllgEH6ER3QoFk73pYWn3mZOaUQNxqijyxIEr74/vFtWjqBJNd2I+J
	x1OgFokfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwJde-0007Qs-K8; Fri, 17 Jul 2020 06:14:30 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwJdc-0007QJ-1A
 for linux-riscv@lists.infradead.org; Fri, 17 Jul 2020 06:14:28 +0000
Received: by mail-qt1-x842.google.com with SMTP id o38so6850569qtf.6
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nfj8rMAWAFU9d44rM/3pdGHL97s6NnqytEecpom44wo=;
 b=Z9i5IFRut7Llslth1BW7UF3HehlzSruG/2CUNWnTMBSbKRQndPYwEUxHfRFlm1GBi8
 6LOx4OGaUXDm1ZP9WPfRXu5n2p3emRcL8YEy92cRAtT2DiM8aDunaDsY3CXfbYx+Skx/
 RpK5qdH+hdZKMgf4/mFOOPFZTZk6xBz/S+0+d0ya4nYjjHP3b4zaTSIEI1l9i4V163cb
 PxbVsIngzOUSb3eL+ZCNY6QU9zMVDLHx7fhepuyjF9Sd0Ecjr83iiiHOvIGnGBd31IG1
 og/+c3hRTIJOfW7LSU6ZxznJkR13Uo2IvA5b2mGl68SDg89EVrKuJO+8BbTFamiaNADJ
 64GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nfj8rMAWAFU9d44rM/3pdGHL97s6NnqytEecpom44wo=;
 b=C4EUje0U/JWHXZgPAcisYT1ACsz+e0m60cq7mrHSLMwWTMO+c28CfCD3on2LcGWUYs
 s6k/5azcC3km4TKJeHuRxwEQyO8CzZitR1yIyN2ufFOXwTdhLax54OKJd/abvq7KtYgk
 J3dKRkE3QZJPhDtmPwr+L7nyBjKekEZn9gJANzr8y8ZEKvZOvfdxFNMpExObgs3F5lB5
 6m1cpCGsau6+E2vfWm9WzuwFT4agWrfiaylOp20FsO5ma08TAs/kXSHGC/+4vBe0Aioy
 6rAnDvG8Vq+DoX7ndJTTVSaMsDelfAVa4ajDrg+BSBI5k/6TPDJ41Gj99PJjlgaerp+n
 dtxQ==
X-Gm-Message-State: AOAM53280/3ZckyQ8ycc3iwKfYCfprp1ETlKEitZSthkdemlk21k5A0r
 6iM9MWxuvR5T4OdCEL5hytIaV0jfzncUNzr8yHA=
X-Google-Smtp-Source: ABdhPJwRSc5fzccYUVLTG6YM9Hl20O6ksMeLjp8/R3UnmiJSyVIWq3I7LFT7BswNBHs3NQa4z/Mlm8+i50UX6XrmwEc=
X-Received: by 2002:ac8:4b5b:: with SMTP id e27mr8271854qts.96.1594966466634; 
 Thu, 16 Jul 2020 23:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200715053340.576300-1-penberg@gmail.com>
 <alpine.DEB.2.23.453.2007151035130.2788464@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.23.453.2007151035130.2788464@chino.kir.corp.google.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Fri, 17 Jul 2020 09:14:10 +0300
Message-ID: <CAOJsxLGm0B15nsyRNTCOYWUXLbjRSc-CTtv-Mv-OLq2k3ZjMvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: pgtable: Make generic pgprot_* macros
 available for no-MMU
To: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_021428_177290_6F6600E9 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020, Pekka Enberg wrote:
> > From: Pekka Enberg <penberg@kernel.org>
> >
> > The <linux/pgtable.h> header defines some generic pgprot_*
> > implementations, but they are only available when CONFIG_MMU is enabled.
> > The RISC-V architecture, for example, therefore defines some of these
> > pgprot_* macros for !NOMMU.
> >
> > Let's make the pgprot_* generic available even for !NOMMU so we can
> > remove the RISC-V specific definitions.
> >
> > Compile-tested with x86 defconfig, and riscv defconfig and !MMU defconfig.
> >
> > Suggested-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > Signed-off-by: Pekka Enberg <penberg@kernel.org>

On Wed, Jul 15, 2020 at 8:39 PM David Rientjes <rientjes@google.com> wrote:
> Acked-by: David Rientjes <rientjes@google.com>

Palmer, will you pick up these patches in the riscv tree, or should I
ask Andrew to queue them in -mm?

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
