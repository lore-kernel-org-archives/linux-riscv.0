Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B382BC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 03:15:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F47320724
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 03:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dm9u3xbX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="esVvOIdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F47320724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+4cs/KnggfbNC8YAjOTopsuxfejgVXOD4RsM7I/NJxQ=; b=dm9u3xbXHb0ZlPGUicU0ok3rX
	sRWrXruRSrcEucFk0Qutm0a218uLzMiZUqyYRaQDn5KyL22KIrWe/ks9pgp6q49M2ftm3PLUkxidj
	hWe7Ga0HsrzlscjeItHrnuWSeJv7uDEzQ86zU6JKS2X6j4dgJyucLubGGuaBUmzVPu9dtRCHLy9gY
	7MjZIvk9ru7LKLbMteFxZxgKPfYOakrXjFifk5WgL5ITr4jwqdM+rcIvnRWdVMNG/LrEeptp309Ix
	uJHc1YcNPZRwBor+8WC6NsYd0yf4zDpl0tCG3YchxIE+mQ96NjTq/qGKsDpmRBMlYKeysG7UZRTNC
	Z97tF/beA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqTDu-0005P8-3A; Wed, 01 Jul 2020 03:15:46 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqTDq-0005OO-Li
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 03:15:44 +0000
Received: by mail-oo1-xc43.google.com with SMTP id q10so1034077ooo.11
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 20:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhIONqvZCTF3iyPrr2drjV1A2XHVI9zDCmmbHDm6tcY=;
 b=esVvOIdf08p+EN2H0zy9FxKEg12r9ylYGuJpvPG6L+w2A5Ew2ZcvXa1/qkDU80ivJ1
 PuFcRRswiR3EGrZIMPBowaUCHJuGR7U2jZDEIytObShnwAMivPI/68sQsU9BtB/6XhLe
 6Cg+jtUxIii/YeSb1jAzctbmamNsAefGWjqaa6mPdB8gimz3lD5iNP61338s/swuVUjz
 Sw3ern5amffQyFFj8e7huvzCGoi31CZnCJezS5RpPm04E7pTAs5ZZPHIisX3Y+bCsCiT
 X1q6WE40hbXuAD3QaRCV0KrqAMCsCDLxbdB6IdIX13bOGxdb+kKkqUl1uZTiyzJuofKY
 3oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhIONqvZCTF3iyPrr2drjV1A2XHVI9zDCmmbHDm6tcY=;
 b=RWKh8/8MNlfQqKJPJ4hP8AGJo8lOIMr17AULIJmxXoPZxfSoNRWgr7Ztd/C52CGFv3
 avljubnQnB2AzXvc8H9ZVYEpTUGGwTHwaZR4eudYJYSzz/F+3T/v6RadY0y16t2gd14+
 OG5M52lPkd/2whW9pW6HkOwtHGHb74IheK5MIX/qoFYMOrgNkrEnew086qJ8Ta9z7xLV
 0FD/jSC7leyGPVspDF7k+VAgTPIvqZGvMaveU8dqU9haMP5qJEQEX7smD9H1hcEEn6IC
 t+4DstktGKwxukNCfBxGFCz7xuzcwrG40vBPAkmXP8BX3zpQDOXcSI5QbKoc40goj+a/
 u5RA==
X-Gm-Message-State: AOAM532+6Svl8faMoSHSoKG81RPvQHlpMdzCJ6CeeF9W1C8gcf+gmc3E
 h2LoApoLeevkb0yO7Qxirw4PlcniNwYmC6HIbgNnvg==
X-Google-Smtp-Source: ABdhPJwYH5gn15uoFzBDY6UOJB4PZNlWFht6ukKixCgnytsroeKsY1oQEEh/DugTEc3N37q7CcQzATdA2SDPNXzTq4g=
X-Received: by 2002:a4a:d64f:: with SMTP id y15mr21104375oos.68.1593573339463; 
 Tue, 30 Jun 2020 20:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <20200701005129.GA27962@andestech.com>
In-Reply-To: <20200701005129.GA27962@andestech.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 1 Jul 2020 11:15:27 +0800
Message-ID: <CANXhq0o322Pa1kUXjBb4b21Zxrz+zXB5D7Ljyj18j_=TMKfeVg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
To: Alan Kao <alankao@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_231543_090489_8B4E0826 
X-CRM114-Status: GOOD (  27.31  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 1, 2020 at 8:52 AM Alan Kao <alankao@andestech.com> wrote:
>
> On Mon, Jun 29, 2020 at 11:19:09AM +0800, Zong Li wrote:
> > This patch set adds raw event support on RISC-V. In addition, we
> > introduce the DT mechanism to make our perf more generic and common.
> >
> > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > would raise an illegal instruction exception and trap into m-mode to
> > emulate event selector CSRs access. It doesn't make sense because we
> > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > but we also discussing the feasibility of accessing these PMU CSRs on
> > s-mode at the same time, such as delegation mechanism, so I was
> > wondering if we could use SBI calls first and make the PMU SBI extension
> > as legacy when s-mode access mechanism is accepted by Foundation? or
> > keep the current situation to see what would happen in the future.
> >
> > This patch set also introduces the DT mechanism, we don't want to add too
> > much platform-dependency code in perf like other architectures, so we
> > put the mapping of generic hardware events to DT, then we can easy to
> > transfer generic hardware events to vendor's own hardware events without
> > any platfrom-dependency stuff in our perf.
> >
> > Zong Li (6):
> >   dt-bindings: riscv: Add YAML documentation for PMU
> >   riscv: dts: sifive: Add DT support for PMU
> >   riscv: add definition of hpmcounter CSRs
> >   riscv: perf: Add raw event support
> >   riscv: perf: introduce DT mechanism
> >   riscv: remove PMU menu of Kconfig
> >
>
> DT-based PMU registration looks good to me. Together with Anup's feedback,
> we can anticipate that the following items will be:
>
> - rewrite RISC-V PMU to a platform driver
> - propose SBI PMU extention
> - fixes: RV32 counter access, namings, etc.
>
> Yes, all are good directions towards better counting (`perf stat`) function.
> But as the original author of RISC-V perf port, please allow me to address
> the fundamental problems of RISC-V perf, again [0][1][2][3], that the sampling
> (`perf record`) function never earned enough respect.  Counting gives you a
> shallow view regarding an application, while sampling demystifies one for you.
>
> The problems are three-fold
> (1) Interrupt
> Sampling in perf requires that a HPM raises an interrupt when it overflows.
> Making RISC-V perf platform driver or not has nothing to do with this.  This
> requires more discussions in TGs.
> (2) S-mode access to PMU CSRs
> This is also addressed in this patch set but to me, it is kind of like a
> SBI-solves-them-all mindset to me.  Perf event is for performance monitoring
> thus we should eliminate any possible overhead if we can.  Setting event masks
> through SBI calls for counting maybe OK, but if we really take sampling and
> interrupt handling into consideration, it is questionable if it is still a
> viable way.
> (3) Registers, registers, registers
> There is just no enough CSR/function for perf sampling. The previous proposal
> explains why [2].
>
> Perf sampling is off-topic but somehow related, so I bring it up here just
> for your information.
>

Agree, sampling is an important measurement for perf, we should integrate it
to perf as soon as possible after overflow interrupt mechanism is standardized.

> As this patch set goes v2, the PMU porting guide in [0] should be removed since
> it contains no useful information anymore.
>

It seems that the document mentioned some hook functions, it is good for me to
reserve this document, maybe we could try to give some modification. I
would check that. Thanks

> [0] Documentation/riscv/pmu.rst
> [1] https://www.youtube.com/watch?v=Onvlcl4e2IU
> [2] https://github.com/riscv/riscv-isa-manual/issues/402
>     This proposal has been posted in Privileged Spec Task Group, in
> https://lists.riscv.org/g/tech-privileged-archive/message/488?p=,,,20,0,0,0::Created,,Proposal,20,2,40,32306071
> but never receive any feedback.
> [3] https://lists.riscv.org/g/tech-unixplatformspec/message/84
>     I intended to discuss [2] in the Unixplatform Spec Task Group at the
> online meeting, but obviously people were too busy knowing who the new
> RISC-V CTO is and what he has done to even follow the agenda.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
