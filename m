Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E467DC2D0A7
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B3820795
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FMrAifw9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="KWuSlcwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B3820795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WA0e7vSf85FM/VY39utK0IU7FPpX/nQLs4bhnwKmueY=; b=FMrAifw9ldB0UvE3l69O33XCj
	JoF8TLdTbvZQs0NRtgVmbB9R+MuaIbAuB0O5vuXHbxepXNcKWwjL1NTDLVDI099kThJj78dAiaML0
	MGeYRd03UYehDeUTBHr+XpddkMzejHVEbYVEMsAroBVQC4H+RRGehCy3A4akNskPxqxC0XGiYpfQA
	SqDEGOSvCIDYiobEVZRY0LEcj6kwbdya3VHW0ZCApLuUmbEVJ4YRQX8uUSgze/5uxAoUyqG9UF1eD
	RnPXlvmGFILOJFZBd/pVGx6IaNLOtnKG4L2tynpT45OSzSoAFw1MlEa4L+k4PJFo+4cG2R2G2EFGB
	5zk05vVcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEMp-0007Tw-NW; Fri, 04 Sep 2020 16:15:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEMm-0007Sx-Td
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 16:15:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id e16so7314768wrm.2
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3rhhfTC3l11VUo1+dStci1vsiRgGk779RrN04Aw6ww=;
 b=KWuSlcwlEEIgRnaQ1WlxG7B4FBZs+NwIYXlSdFTYNkwYPg1WNTwTF406wwqN20WeaF
 7JWuP1bS4LIpQBOBJOiSsNYHql3mV5FqrjzVVgvfvr4MKbFQr38KvuX/00CIZU0/NHCT
 /5oZFJrOsFfjWNVwGCv5UOzmLED/gKnV8L49ZLJiFGxKL+DFWWs7K20vOWIoDC+GEW3p
 OBjbR46qzgDYwRIx2orihI2qwHGWIKAmIbVrtNhAIcjNNOHfbUnCZUy9IToOMz5W5gvX
 gqk4lKKWBn83Lppc0LU63aKg0T/VwYeZoLpMW8UXdpBOvewdiC8iAmTmaZrgB7sLRJmw
 Xong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3rhhfTC3l11VUo1+dStci1vsiRgGk779RrN04Aw6ww=;
 b=PZcRi7s30v4mVPYCRzTQYXUDsSs41kMJapT2LViiGKN7/uBl+aI8BMpKRgO0SjKgv1
 iTMIDAmbv+F9CX05XgQWVslGI3QhIz3u1KgR7FZEtwdNPEmnvggUGGnkbM51J4LA342R
 XTVPRxrafq6rUwp7Aubc0SBZN3oTZY68HWuqsAyWdRFSmk9ZPlGA9LURHyt8PQXWyd9u
 8ARy40EzK8/o2NEhYPbwfaw2TEyW68uNsNYlkAI2jhii3swlPnWsKaaGVALM1xE8VD+R
 VkUzDJq0St7fS5QSAPnY68rfkDJ5Z7r9inAMRj3GCUh1xRt7vKMrzS7eW9xICwDPB+EA
 xoJA==
X-Gm-Message-State: AOAM5303OX0LsTW7X3xxqmVL/4cwmfJ/Ceh+JjEpXDe1LRN1ycUvpXHh
 gm+sOsONxhGr7DKCgx6+g3zeMWuCDXG1CTrVVgO5ag==
X-Google-Smtp-Source: ABdhPJyTjkbkcOYlZniTIPZKGH4vrbJxcDP6sLxfF955OpkJa9HBW167QvGRn2KnMyPnFWoHc5CUScPP/8ZhDfq0CMA=
X-Received: by 2002:adf:f552:: with SMTP id j18mr9032487wrp.128.1599236107381; 
 Fri, 04 Sep 2020 09:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
 <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
 <20200904083109.GA9182@infradead.org>
 <CAAhSdy3S8FfMAWih_VoBHw0xd-7c=urzuJ+PPdug9iX_pWyTsQ@mail.gmail.com>
 <20200904094617.GA27846@infradead.org>
 <CAAhSdy2x0ROqoTzzZRZgKCTL99WPy-8e4CQ921sf-=GQDm_gxA@mail.gmail.com>
 <f1be6ee1-0802-82ca-ffdb-4c294925cd9a@kylinos.com.cn>
 <20200904130044.GA7842@infradead.org>
 <CAAhSdy2N8L015z0-RirjXLjdzt+OrCtzzKzivsMeQXoH9Nc8Cw@mail.gmail.com>
 <20200904160335.GA23669@infradead.org>
In-Reply-To: <20200904160335.GA23669@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2020 21:44:55 +0530
Message-ID: <CAAhSdy2RqZg82Q0+ChRKV6h+Ot90q2Qea9h5s=42SEa3Px4gLg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_121509_093423_969EEF4E 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 9:33 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Sep 04, 2020 at 07:26:41PM +0530, Anup Patel wrote:
> > On Fri, Sep 4, 2020 at 6:30 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Fri, Sep 04, 2020 at 08:58:25PM +0800, Qiu Wenbo wrote:
> > > > I can confirm this patch also breaks K210 support. It seems that
> > > > csr_read(CSR_TIME) will trigger an illegal instruction exception on K210.
> > >
> > > CSR_TIME is trapped by just about every implementation I know (which is
> > > explicitly allowed by the spec).  That is why we should never use it
> > > from common M-mode code.
> >
> > Finally, I was able to replicate this issue by manually hacking QEMU to
> > not emulatie TIME CSR for virt machine.
> >
> > It seems this issue is only seen on older QEMU and Kendrtye K210.
>
> You'd also see it when running nommu on Sifivie or just about any
> hardware.  Whoever implement the TIME CSR for qemu made a mistake IMHO
> as it doesn't match how most real hardware behaves.

There are quite a few RISCV systems who implement TIME CSR in
hardware due to performance gains (10+ %).

The QEMU virt machine does not represent real-world HW so we
should emulate all possible HW optimizations in QEMU virt machine.

On other hand, the QEMU sifive_u machine correctly matches the
real-world SiFive Unleashed in-context of TIME CSR and other HW
features.

IMHO, we need nommu defconfig for SiFive Unleashed so that we
can try NoMMU kernel on both QEMU virt and QEMU sifive_u machine.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
