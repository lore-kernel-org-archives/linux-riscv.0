Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB5FC11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 06:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FADD6162A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 06:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FADD6162A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjjIES5TP7fXaFpAfuumy2ZMu/eB+F282Hrph3NL9FY=; b=CuQqD5Hg/ki+C1
	OGlu3anKZdEeR4amzO/xNMdenr6eQQH27jNTIVgbN4SwzcPJcGKsivVAjxUqL81lFZkfcKAil8ogt
	kLqzZq22Hilv5JOsZHuIExiUwpQh36wzPF/lDT44wed2OaMriCk8JBPOcU7rWu58sDrJtakbjWaqO
	phZhiCXzjMwpPusV1hIuXSsTUtcMVtc/rCxTdNj1JDu5x8/lA14ax71Tung590m9UkLTVogj/Jdx4
	toiwmojKFkM98dnlwy6HEWEWo738LMs2h1tFO5TCi31dObtLA0CmaI+J2GwlWwpvQHK9HX4nBkfsf
	XRwEylQheJL7ptrlqAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyq9l-00GEhS-2v; Thu, 01 Jul 2021 06:26:37 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyq9i-00GEh9-RF
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 06:26:36 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 v3-20020a4ac9030000b029024c9d0bff49so1315451ooq.0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 23:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weLO0U8CcMdO2GwWr9sKBhxG+qWHdNo4kkTxiwdSbK4=;
 b=SqGXprIAcInGnP7tK3RzkxDFPtE76fgh9ARvCCa7CynU5vIKHM8LIhUULBtT6tjx8N
 qwAYUrFIBI0aO8DYME+OnXVK8NVMazv5UTd95r/fhCJpc1ZfdwQWrx19YftkIIyLM57I
 uhhw2w3/2CjU+Fr811EXVEsI+nWRRi9LpedTh/wNkrsfhXM7sW9Be1j4md9z8ojoLG/e
 eO7l7TCzk2EojkLLOoQrmldA2gYDFbVCla7jxoXjXCaht9NVdxH71hPso7NAg3QHmyZY
 5G61NKyHCsXiZQsg6gdg6MmyQRSWR/Q8v16KHHibtvvED7ygDyUg7JeL1XAE1j6fptrF
 E+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weLO0U8CcMdO2GwWr9sKBhxG+qWHdNo4kkTxiwdSbK4=;
 b=pSkl/ARTcLEJEQeuLHgifQEPkj2KFwBH4DIMK3BgEMpofYxDk2HlxIvBi69+H15vTy
 RxS2je1cIfborUZgeV7uhhcjQ9DSlvwLmHBBRC1DgfcpmV1Dw4hMjSXcHQEMKuOvWyuo
 XUW/CpLh8NDaOT7G0OV4LHjvb7So4aLDERuqiMPRwTmNBAOxY820qSYYr8btSLjwXszk
 9S6AuYtikAi/ZsXmj+M0ARNLfh19WZFudfn4A5RLoIufQVGpmoEokLBdajOEdH/bTlR6
 otU6m+f23ZhtE1QfO+2Nc8lQ4grGT7ZON5y1AJpMANev20dPlxJcSh9VUC+mRyUvp7Aq
 StSw==
X-Gm-Message-State: AOAM530W9+sFP6JkuSMSZOAXPsJ2L0W/FtJN+kuHCWyb1slY1dEszWoR
 Om9YsDRS4qpqLAbo9DvLtY4sYoCRK9JSFVDriH8o+A==
X-Google-Smtp-Source: ABdhPJyE6V22IxIuIcUaAU/qzpVLNqrO4pmbeOz/TNrL7m3Q7QtNRt8NZqMaVLud4itqp0JzKz+A5CQRB6xzqHmv2ok=
X-Received: by 2002:a4a:9406:: with SMTP id h6mr11669704ooi.36.1625120793225; 
 Wed, 30 Jun 2021 23:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMh9ef30N6LfTrKaAVFR5iKPt_pkKr9p4Ly=-BD7GbTQQ@mail.gmail.com>
 <mhng-d63a7488-73a5-451e-9bf8-52ded7f2e15c@palmerdabbelt-glaptop>
In-Reply-To: <mhng-d63a7488-73a5-451e-9bf8-52ded7f2e15c@palmerdabbelt-glaptop>
From: Marco Elver <elver@google.com>
Date: Thu, 1 Jul 2021 08:26:21 +0200
Message-ID: <CANpmjNM4nJBu_7HyEGdb5x-me25duwH_kLU01XBZANEBTO3EhQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] riscv: Enable KFENCE for riscv64
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: liushixin2@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_232634_943143_25BF6E09 
X-CRM114-Status: GOOD (  17.17  )
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

On Thu, 1 Jul 2021 at 04:38, 'Palmer Dabbelt' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On Wed, 16 Jun 2021 02:11:53 PDT (-0700), elver@google.com wrote:
> > On Tue, 15 Jun 2021 at 04:35, Liu Shixin <liushixin2@huawei.com> wrote:
> >> Add architecture specific implementation details for KFENCE and enable
> >> KFENCE for the riscv64 architecture. In particular, this implements the
> >> required interface in <asm/kfence.h>.
> >>
> >> KFENCE requires that attributes for pages from its memory pool can
> >> individually be set. Therefore, force the kfence pool to be mapped at
> >> page granularity.
> >>
> >> Testing this patch using the testcases in kfence_test.c and all passed.
> >>
> >> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> >> Acked-by: Marco Elver <elver@google.com>
> >> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >
> > I can't see this in -next yet. It would be nice if riscv64 could get
> > KFENCE support.
>
> Thanks, this is on for-next.  I'm just doing a boot test with
> CONFIG_KFENCE=y (and whatever that turns on for defconfig), let me know
> if there's anything more interesting to test on the KFENCE side of
> things.

To test if everything still works, CONFIG_KFENCE_KUNIT_TEST=y
(requires CONFIG_KUNIT=y) will run the KFENCE test suite on boot.

Thanks,
-- Marco

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
