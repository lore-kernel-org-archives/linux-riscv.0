Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F195C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:53:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC0164FAC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC0164FAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=M9pJkrQhpl905GBMipG6FJ+2LRUhZ6W8eN9k610OhtQ=; b=MAWXKXK3X+O999AegUoix4YaG
	uhok92BLINl2+MI8jqB2z5leblNMgmltLyHEi7+J88UCGwYB23UxMuo10roJI0R0CD4prhkjHO9BG
	NNW1T/0UWh0DUDEr4SRAiEFGjV7CJPW/FtXn0tFugFFrZiBVOgAX1uQPgwRXLLUtBNPKF6xRvc9NK
	OLOSN8Lp/GchB6CHRrBTFrQIo1vWGLyk3Wy1vgot4d7nMGYGW5mvWWwLho67do2v25iKWXtHVXpE3
	qoZ8/O+Mh4mJDNyMg1L6XQ0/HtzJRVLzRL2aiCn5cE+Q8c+LzSt6UXwhzaLMljwYFPGRUsBMryg8x
	QI97IBsfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMOBD-002TFQ-Of; Wed, 17 Mar 2021 04:53:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMOB8-002TEl-6N
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:53:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id x26so269545pfn.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d8dYAktnUBBiQrXZEcua+BNHo2fKNZhUG+0Inwx8kus=;
 b=niXuLSlZqGyMJtNFFYws30ei5jxNF1MxBhVz9FPSaYoEmbFkVgyw4ZkEQHEVf6noNd
 V9H+PU446TPYO7d32QIqeBkc8UXXUYgCry+5/ckOLtRjzilQge6EU6Yc+EzwnGrzSnpi
 rq6lNNpO5ZehsNQNUhtK4w69j6Q87T52YF/1w3kCF3tbOatws1+X/rWCDHJj7x94aktS
 Sxd/NBV4K88tIzvti9/2TH1ZxcjyIsw/WXR2jXdCnLnZqgJK4+kkXiXrPndvSGhiqM2S
 B8caEl4y8conzl1sI2o7EVNClXDwCLhSAZEIwf3B5E51KpFmjRp9wmB/xAQRwquljt01
 qpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d8dYAktnUBBiQrXZEcua+BNHo2fKNZhUG+0Inwx8kus=;
 b=PofOawTjgQqx0W140fAJ4Vu+J5nm6gyIxJ5hIM+V6Gq2w7+luGrUf9QvQM800HJuvp
 E9NqUbNBe//bONHyk3gzoZ5zETCX48ARsYYvVXpK1Yg1nRUbPqpZ35RGA98/sTtANLZZ
 jSzt6+8SQTt4m1kTRScqrVrhc4VpuwYd5DY6kFt5IhmpmsucUg0xVGGjqZ1Vlix9PHbC
 oBx8MxLlTiOA8b0rqEpqtR4Hjes80wL1Gnxvxd1ald/s/aTHScRzFQgXvIiEFiNs06M5
 mW8W1XE0n3TKBN1FgtVvasTr5zxBbeEfcJHDvMdOzB+gF3D8CICgRkfPAoOuff66QNtk
 7Kkg==
X-Gm-Message-State: AOAM532xioHunt/JKoU7FrT84yyBkFRINVgOzMRNApl0BIhOsgFo5c9W
 hh93dfceaXk8l8A/icg39A5QnA==
X-Google-Smtp-Source: ABdhPJze1AWtbvlK653ib6kGnHhosP0U9QAm2Y6eHCKmfcznfiMba+6v3xcBWJcN5Rw2R9jzVTmc4Q==
X-Received: by 2002:aa7:9619:0:b029:1fa:ed79:b724 with SMTP id
 q25-20020aa796190000b02901faed79b724mr2509040pfg.38.1615956784475; 
 Tue, 16 Mar 2021 21:53:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i1sm17197849pfo.160.2021.03.16.21.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:53:03 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:53:03 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:49:52 PDT (-0700)
Subject: Re: [RFC PATCH v1 0/3] IPI and remote TBL flush improvement
In-Reply-To: <20210311164712.652608-1-anup.patel@wdc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org, tglx@linutronix.de,
 Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-18286acf-f6b8-4793-88a1-f747b818f764@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_045306_464282_2BA0974D 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Mar 2021 08:47:09 PST (-0800), Anup Patel wrote:
> This series primarily does two things:
> 1. Allows RISC-V IPI provider to specificy whether IPI operations are
>    suitable for remote TLB flush (PATCH1)
> 2. Improve remote TLB flush to use IPIs whenever possible (PATCH2)
> 3. Allow irqchip drivers to handle IPIs from chained IRQ handlers (PATCH3)

IIUC this last one isn't technically used in both forms, as we don't have any
drivers that behave that way yet?  I'm OK taking it, under the assumption it
makes keeping the out-of-tree driver for the draft interrupt controller easier,
but I was wrong then it's probably out of order so I figured I'd check.

Aside from that this generally LGTM.  We are making quite a bit of mess in
here, but I don't really see a way around that as we need to support the old
hardware.  We can always do a cleanup when the specifications settle down.

Oddly enough this did come up in IRC recently and there may be some new bits in
the CLINT on the FU740 that allow S-mode SW interrupts to show up directly --
there's at least a "delegate supervisor software interrupt" bit now, but the
manual only calls out machine mode as being able to set it (though IIUC it's
memory mapped, so not sure how that would be enforced).  Not saying we need
that in order to take the last patch, but if it is possible it's probably worth
giving it a shot when the boards show up.

> This series also a preparatory series for upcoming RISC-V advanced
> interrupt architecture (AIA) support.
>
> These patches can be found in riscv_ipi_imp_v1 branch at
> https://github.com/avpatel/linux
>
> Anup Patel (3):
>   RISC-V: IPI provider should specify if we can use IPI for remote FENCE
>   RISC-V: Use IPIs for remote TLB flush when possible
>   RISC-V: Add handle_IPI_noregs() for irqchip drivers
>
>  arch/riscv/include/asm/smp.h      | 19 +++++++++-
>  arch/riscv/kernel/sbi.c           |  2 +-
>  arch/riscv/kernel/smp.c           | 30 +++++++++++----
>  arch/riscv/mm/cacheflush.c        |  2 +-
>  arch/riscv/mm/tlbflush.c          | 62 ++++++++++++++++++++++++-------
>  drivers/clocksource/timer-clint.c |  2 +-
>  6 files changed, 91 insertions(+), 26 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
