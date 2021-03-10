Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A879C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:47:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68B164FEE
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68B164FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=61rHs5Pvxl+IJvQ5zL3DsHsb6ES/jNtbC0aDOMuFAJg=; b=UowR2x9I5qsXg0Lc09AWxIccq
	dlKVCVi9YWq7YPAv54M/Enz1eOyFOu5Xb3hleJvzd+F3NTsNMtilvzEWKaVAoAGpJIDhASn7y/TyA
	C4GAGm3ZnzsD/l0ltlK1ZulMVUUx78Sl2RagWgbVaBriMxaDyuZlSS+nRVLTgXqNUksEYJqrBY4Zk
	YYOBEpIU76QlJmsTjAu4BN2M2xhkf7BgUiPt91UxuWZkct1SJ3mQRci/dkI8IfXlSZNnP5oT2TvgY
	UqljyjVfC45HU6USGMe0UhduadzKngys5IWEUZwEXELm51gEQLJWCY5yGi4rSfp2Eyx4By2WyUtmj
	ofZSq13Gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJql3-0061Lt-0t; Wed, 10 Mar 2021 04:47:41 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqkw-0061Ka-6K
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:47:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id j12so11085672pfj.12
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SfH09lKBExpP+Z5yjQAJdcQXB/ODLLtwcv/93KvORQc=;
 b=l47JK39H9m+0KqzzGVpsKDFO0M5uLj3S8SOU6Y3kSEYsr1mfSW6hOoU7q9kD9YNqvW
 lgXU0hLk6jTKjyrRcQ9pxbyUnUn0KjxloxLGj9sxENsPGYXtIa3qKDUvpNkfw0Zo3ZyX
 tvjGKCfKywQ/VW5sy1sFGa2/C6IID9Evq5808X5J/eQ0Wc1/WP3rZ5sECmBbSquiaF7k
 GI6BHHd1FDyoifL7A9mClXvu/ScPFEFaXpHlkIGxZyIo+Ketf8C2Zv8TLO0c5eO+3Qrk
 mG52Zi6viD6ny5QYDrTkD0sq3u+UCcfjXOEPaLw6O68/ucYfBioj3GnZ02KsHWORZYk0
 ZFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SfH09lKBExpP+Z5yjQAJdcQXB/ODLLtwcv/93KvORQc=;
 b=sNgcUFisJKgYXYYd61sq/XFNABENqsAMuqQacFW5Cns1tjrWQbUle5h4EEuuCQ+tfu
 xhUp1+LsvueaDIp125H6JdJcE/6gTOEv5Djvs5yn3ELI1MtA2vEbclrAUVQMVQm00zvX
 pBmfWNJuafevjIUqge/9wEBL7SwUzlMKO2KWJuo9zSp2uncznrAmmvLDbDDSNYOzcH8A
 oBjrDE1nhsaqV5NCSWV2BVqWDD4V/gA9dnLVmSkn14+i4NGm7oSmZJhgvW1lhAmLdbxw
 dTjfy3JhOw9gK+PO1Jo/0dY1fYkVYpdiJ7DKsNfumLzDC8Shr6Y3uGgolgCA2TUo+HUn
 aHAQ==
X-Gm-Message-State: AOAM531+9owd+NgQrtzABV3hN6+12g6L4Q3BwewyYmx4DkaCc2uBibS3
 reFQUyLzTXVIzG1qnUbfKCJXkA==
X-Google-Smtp-Source: ABdhPJzZqLbr5erZbKAG7BIrJUpovzgOrbFtNyVvKuJH9x1DRKGjJZCkIaQ5m97k5YqQeHB8dlSHdQ==
X-Received: by 2002:a63:5549:: with SMTP id f9mr1271715pgm.28.1615351652651;
 Tue, 09 Mar 2021 20:47:32 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t12sm4014320pga.85.2021.03.09.20.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:47:32 -0800 (PST)
Date: Tue, 09 Mar 2021 20:47:32 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 20:47:20 PST (-0800)
Subject: Re: [PATCH 0/9] riscv: misc cleanup
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-c2e752e9-7f90-41c1-98be-8d8b71a8ecf9@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_044734_878490_4E3F49DB 
X-CRM114-Status: GOOD (  12.49  )
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

On Fri, 05 Mar 2021 03:33:23 PST (-0800), sunnanyong@huawei.com wrote:
> Fix some compilation warnings,improve code style
>
> Nanyong Sun (9):
>   riscv: traps: Fix no prototype warnings
>   riscv: irq: Fix no prototype warning
>   riscv: sbi: Fix comment of __sbi_set_timer_v01
>   riscv: ptrace: Fix no prototype warnings
>   riscv: time: Fix no prototype for time_init
>   riscv: syscall_table: Reduce W=1 compilation warnings noise
>   riscv: process: Fix no prototype for show_regs
>   riscv: ftrace: Use ftrace_get_regs helper
>   riscv: process: Fix no prototype for arch_dup_task_struct
>
>  arch/riscv/include/asm/asm-prototypes.h | 16 ++++++++++++++++
>  arch/riscv/include/asm/irq.h            |  2 ++
>  arch/riscv/include/asm/processor.h      |  1 +
>  arch/riscv/include/asm/ptrace.h         |  5 +++++
>  arch/riscv/include/asm/timex.h          |  2 ++
>  arch/riscv/kernel/Makefile              |  1 +
>  arch/riscv/kernel/probes/ftrace.c       | 16 +++++++++-------
>  arch/riscv/kernel/process.c             |  1 +
>  arch/riscv/kernel/sbi.c                 |  2 +-
>  arch/riscv/kernel/time.c                |  1 +
>  arch/riscv/kernel/traps.c               |  1 +
>  11 files changed, 40 insertions(+), 8 deletions(-)

Thanks.  I fixed the checkpatch warning, these are all on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
