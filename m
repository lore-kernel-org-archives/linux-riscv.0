Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459FDC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 18:43:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0F4238EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 18:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0F4238EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNjEmRLt164+qC6u5zEmo36UqKO5Tyb6VWKIQnDralQ=; b=tBDl4ExPiTKMXMN/iRK7HnsMR
	jO6IXfei9/X5ajJJQUzRsC9XkI2wwf3SJKHK4sxUVqIVDa4W4tVb0mPLHRwErScwPt9KKMKIEPjpz
	retghDMbySjAJqYI1JlStijm+yNP6bbC1AxzpPyzkBkylL9bsz4wOOTiY/he2+5YlYMljGAAw31Ux
	0Y2ktym2ZbXn+XiWO7o1Y+piRD/SINh6vdaBf9HdbUw3psp/C/D3YuJyPgcWAyP2nz/fQ/01jpoiN
	9yzqiORXfjq9dsLO9yHooKbr+dE2HrI54L9K4b0T8TH4q/soFaMbVU5ITocjXErWKfmoRqhfFRxz6
	5GhAmUN1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpyFb-0002Cr-K2; Thu, 17 Dec 2020 18:43:43 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpyFY-0002C7-4T
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 18:43:41 +0000
Received: by mail-il1-x12e.google.com with SMTP id q5so6163718ilc.10
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GhCmWDf1zDOcCqnjHfrHpu6FMwXfWQDjjYOx3YRDYEM=;
 b=o2b0xfanSuTrKAiDh3Pln6QdO8dBEtuDt1+Zt2OXH61D1bujrI4m8KgQPEfMTqrwIO
 7+esb88Ew7eiHeiTLCB/iAjaq0j6gVwNPHB7wz7byjqpx35rR1ljsKISGehsBfISgAmd
 fJ1jlps25+KKntiJnkOiWE+cVXopSjElSxeJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhCmWDf1zDOcCqnjHfrHpu6FMwXfWQDjjYOx3YRDYEM=;
 b=gVvx3Ao/7iIZ+bqTyfArBZ3+PYI9XpWf/A0PUDgzB9XKhvwiEexApgn/sJ9v+JKede
 un69Fd/kzgkCoBQkRNhvAL6WNuEhyXSO5vcea1VAToejJbsG1gfy/nN2osCJXXxTs0+x
 t1gAnxUzw+hRb1PSoUFeNUsEKpwOnYA3+Uaao5VtLhVRc2xYLKCbXjPbY6P+YMq2z3/L
 ksfB7UgakBs8Zxb2G7bXmfAvg3Sf7yGEVtTpFN30K8Z3R4ahdXt9Qt6ifw2Oqnzk/Oy3
 HY0wlZ7vZKLsn38raTJ+48I8fndlEclWuPGIyxwpsqnTq3xy/zOZavPytqRIdyaqrgv4
 /ZxA==
X-Gm-Message-State: AOAM533GyMG4JDR4P7W6okw73QhfCxFTRtR7TnluBzpEZUdmf15jWIq8
 j7N8l60pM2A1S9ozl4F2/uuSra9EndBvghCitBA6zo5FTbSQX6o=
X-Google-Smtp-Source: ABdhPJzGkZYdVuvBg0IbOrixSCkDtSoUydV+YkFH0u59qTLxamUo/AsdYMtBoNpTsPs/UUe4RwoMwqOnuJPL6FABqmc=
X-Received: by 2002:a92:6410:: with SMTP id y16mr221762ilb.126.1608230616874; 
 Thu, 17 Dec 2020 10:43:36 -0800 (PST)
MIME-Version: 1.0
References: <5684d662-b0ae-15d7-687a-3cf9daf174d4@gmail.com>
In-Reply-To: <5684d662-b0ae-15d7-687a-3cf9daf174d4@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Dec 2020 10:43:26 -0800
Message-ID: <CAOnJCUJvg=9pMezhbEtRfruh1CadZvKcnfwSf5aJQ1MmGCPGrQ@mail.gmail.com>
Subject: Re: Looking for a Roadmap / TODOs
To: Varad Gautam <varadgautam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_134340_336195_AC36B903 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 4:26 AM Varad Gautam <varadgautam@gmail.com> wrote:
>
> Hi linux-riscv developers,
>
> I'm interested in getting involved with kernel development on the
> platform. ATM, I only have qemu available (no real hw), but I suppose
> that could be a good start.
>
> I've started looking into enabling CONFIG_RELOCATABLE +
> CONFIG_RANDOMIZE_BASE as a first task, since I found these missing on
> for-next [1].
>

Alex had a series on enabling CONFIG_RELOCATBLE [1]
Zong had a series on enabling CONFIG_RANDOMIZE_BASE[2] as a part of kaslr.

[1] https://lkml.org/lkml/2020/6/7/30
[2]https://lkml.org/lkml/2020/3/24/131


> Since I am new to the riscv ecosystem, is there a checklist/roadmap of
> things missing from the kernel where I can find stuff to help out with?
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/?h=for-next
>
> Thanks,
> Varad Gautam
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
