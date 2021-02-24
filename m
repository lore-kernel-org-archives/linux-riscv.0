Return-Path: <SRS0=cdG+=H2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C69CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 23:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C238464F0D
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 23:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C238464F0D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A+x99eS84O3dfOHCLXCmVJ8VYmH5wQqtOQENQyP7Ous=; b=urda6CR3Nu87iuPU8ACK/kgAz
	R1owewUkw8Zcjwnfx8ISV3UH/sSiZpJbn/gEDGhevnJNxkTRWGjPdwC4y/QqlCHfC8HavLbnXWgL/
	pcKRpyeTSDvZBoUAXNE/aevq6RMOJC60gtPcXPiddhIda4C7gf00mbP94M5JafDQtJ4B8VBKvoAu3
	W/Wvhy4fFC5yQo545qZJCsGavh1CqRflNVI1+kNYsfbtPhShwOzn15Fm5dgqgCmQAPILza+RyKu+P
	zTqUSPRXH0tiGIoes6Lc0fbe8EGErBE8TtgRpK7sVSQjCcabvcz3DRTA5V6EgJsk1ytisQBv1ZcG6
	jepFVPSwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF3hU-0001rD-59; Wed, 24 Feb 2021 23:36:12 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF3hQ-0001qN-Ub
 for linux-riscv@lists.infradead.org; Wed, 24 Feb 2021 23:36:10 +0000
Received: by mail-il1-x12f.google.com with SMTP id e7so3322123ile.7
 for <linux-riscv@lists.infradead.org>; Wed, 24 Feb 2021 15:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ts5EjFxEGg0zJuChMf3K0PnWEQ1IAHWbeCb90vBdTho=;
 b=Ne+pk1WaaLBvcUUvQvctqPCMgnllRNhJ9u6P+k8dPRson1CpOgdni5XPgddwss19JM
 7MPIC6r0zS5nVlOh2iNwmAKyObW2uyKfeA5xZunU5qn28+SJIbeFnYhHhpL5gGErLc+p
 palipZ7nTOqUGcm4cVJgIFNR3mgncQxZ5ogsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ts5EjFxEGg0zJuChMf3K0PnWEQ1IAHWbeCb90vBdTho=;
 b=epsD1JeCIdOIbyZyUkjDyWWdwGWJAQoUMSWI6pSn6h2dEw938gQ3OCvOaaZFkDcBbf
 RBbnbiIVc+8gsmx6klZlM10I+vrmTkJjn+WLLoVHrlewKmmGekyOibZAoNgvpSHiBtcU
 dwyzbEO/kWqGqoosCOVaj4xIfjXLUv5Xbw51WZ34D29sUFVPQiv0AEZoUWK+bA1uXPz2
 /fkY7qqp/jdplPtSM2XLeF/xMhkSTO9rjL4JSnKtPGFQotZ44r6se/1lauAoC8cxdDGA
 80GvXInBYJ9ZLnpxvow2kTgmF0oL8PzajGxHy2MMp/zRzZ7rMNbjKe46DG41cETDZIqU
 xUjw==
X-Gm-Message-State: AOAM530CFlf/6P0UeVzcxyfmD7FWMWJciP7EWwkHHXcY4jKAcBjeXdf+
 lO/iSCPfIDRZBN6t5A8m7cC6AnvZrmfiACN6+YRW
X-Google-Smtp-Source: ABdhPJw46+7+gdUhuHsBkPNccDet5SWxVft/wBcbryg6VQ9Ib/bIoz2EKlXFDIh1ynKboqnv/75thahayaWqrb68ax8=
X-Received: by 2002:a05:6e02:1a68:: with SMTP id
 w8mr108919ilv.147.1614209763254; 
 Wed, 24 Feb 2021 15:36:03 -0800 (PST)
MIME-Version: 1.0
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
In-Reply-To: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 24 Feb 2021 15:35:52 -0800
Message-ID: <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
Subject: Re: question about RISCV EFI stub support
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_183609_129362_CBC4547A 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 24, 2021 at 3:14 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Hi Atish and Ard,
>
> The commit "cb7d2dd5612a RISC-V: Add PE/COFF header for EFI stub" use
> c.li to
>
> add Magic "MZ" signature for PE/COFF header, which select RISCV_ISA_C,
> but "C"
>
> to the ISA is optional,  and if "C" is not support ,  EFI boot is not
> supported.
>
> Could we use ".word MZ_MAGIC" like x86 code or some other way to support
> "MZ" signature?
>
.word won't work but .short will. With .word, you end up 0000 in the 2
bytes which can be interpreted as illegal instruction.

I guess your larger objective is to make the C extension optional and
not enabled by default for the Linux kernel.
Do you just want it for a custom kernel or the upstream kernel ?

> Thanks,
>
> Kefeng
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
