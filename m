Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12105C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdvCHXknSlD52qssj4gFSyZZDay7rOlY5e5Q+BsYzyw=; b=iU4VS6jxQgtbSk
	vLY5HxSRfaKUDF3UJ/IeDQBuA3wunt2MQsPGFsmhUvaxxPqv0p0JbVm0/EjtwNDiL9IroMkUkSSkC
	wm/dhCgCsJKRbmRvxnKmznhST8PzW9PUewoblIMkpwgxb4C9vxY4H1f5YwQoYhXwPOWcWD3H4xJGc
	QFy6BiT2rAvbMXaEAx70Ladj0Cuti9ALwiE+is5X6q9VT+cH/SGoUgyFMluVWnLCOVCfGETfRPE4c
	YKVzxEQZfYiVTiiX0JWLnpWvzxyrZuuCWU+gztLk257gunoxmE9TvjhAHp96rNq6aKXP1AEWpH21H
	woWDqSOuHacMTFjRkClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLfo6-00AF9Q-1N; Wed, 10 Aug 2022 07:07:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLfo2-00AF3A-M3
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 07:07:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id s9so15180797ljs.6
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 00:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=sMw4VU5RWixo87gNCaJPKsEZSe5TLfAn57Qyc69mrdA=;
        b=Sv56YTKDWEOyhnXx1FQ5ZE2ckw4nXj1LcSyOrgQfjqu5TLpKLBG9Gea43oeMcGjPDc
         JKqaMuXgfL6THGSCpquXFBEr3jQwLnSAXJMLi8zbqw74SfWPIT8j0mmtGPv37qHKiRai
         nkoedzPayuw3M5g287Sp3woJpApHX/3AqUO2OrmqulH4w6D4FSFDfrWx5DQJlGVw8l1V
         wuqALINYn6BXW48uP/am96hkbaeb4JHBcbDeFBHJAMLsCMiishu3tkAdJlra0EiEmXWu
         hgGcpk1meX2aEDPxjVkZbx2yznmRdqlaRVZ+UzluaBK2gvrattSu7ToLeQ1Sp3QwCQRf
         B9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sMw4VU5RWixo87gNCaJPKsEZSe5TLfAn57Qyc69mrdA=;
        b=51ck27cHDYIm42gjAJdtsc8bjSOrKNBKsJhY2dCj6oPc7H6usE/5WlNYG8TeTaTOkY
         gUFlEZpou+5MMuSRmR8q0MRTq6cU7viGY0602QjrwECVrXEaElzQq4muK25d3bit9jn9
         FvBPC4J+X6Yx8KQUEHHHKafpLeD6Jk1/bwRUufSZisYUeM9rAjml85FJ5hv1ONt0wnbM
         fM5wFvrnkIHLHdEarEEubYujAfoV0ku03bkeJ5HGKzkqPNxmmD4c2JFvinF93mb7M5af
         kje4I0Wf+dFIREku2pJP+8uoHsidGtDbytD/MgUhVGLYuEF0W+QfE5NTvlUQCovIbap6
         T8Xw==
X-Gm-Message-State: ACgBeo0o+iAFx5m3O7kBX9EU8qvlVkZ+vQWPY+E82lIw5GQq5lX5V6Iz
	xiDIMFsfLbGjigaTmBq4RdBz1JIbm5M=
X-Google-Smtp-Source: AA6agR4RBP14N0qHmRad2+Pees6yHaT7IEVkKpXERAlwYESy4KecdOD8pRD8h3BKr0drRBlbxURfeA==
X-Received: by 2002:a2e:7218:0:b0:25f:dd3c:dfd2 with SMTP id n24-20020a2e7218000000b0025fdd3cdfd2mr4360514ljc.299.1660115209475;
        Wed, 10 Aug 2022 00:06:49 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id o12-20020a05651205cc00b0048b1d05631fsm228634lfo.202.2022.08.10.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 00:06:48 -0700 (PDT)
Date: Wed, 10 Aug 2022 10:06:47 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/2] perf: RISC-V: fix access beyond allocated array
Message-ID: <YvNZB7FNMPSlpnVC@curiosity>
References: <20220624135902.520748-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624135902.520748-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_000706_765086_3EAF10DB 
X-CRM114-Status: GOOD (  17.06  )
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

Hi Atish, Anup

> These patches suggest some fixes and cleanups for the handling of pmu
> counters. The first patch fixes access beyond the allocated pmu_ctr_list
> array. The second patch fixes the counters mask sent to SBI firmware: it
> excludes counters that were not fully specified by SBI firmware on init.
> 
> Initial attempt to fix access to the highest available has been reworked.
> Now it is handled in the OpenSBI, see the following patch:
> - https://patchwork.ozlabs.org/project/opensbi/patch/20220624110330.452640-1-geomatsi@gmail.com/
> 
> Regards,
> Sergey
> 
> v1 -> v2:
> - drop changes for access to the highest available counter as they are
>   now handled on the OpenSBI side
> - drop switch to IDR: in fact there is no need to handle non-contiguous
>   counter ranges
> 
> Sergey Matyukevich (2):
>   perf: RISC-V: fix access beyond allocated array
>   perf: RISC-V: exclude invalid pmu counters from SBI calls
> 
>  drivers/perf/riscv_pmu_legacy.c |  4 ++--
>  drivers/perf/riscv_pmu_sbi.c    | 24 ++++++++++++++----------
>  include/linux/perf/riscv_pmu.h  |  2 +-
>  3 files changed, 17 insertions(+), 13 deletions(-)

Friendly ping.  I have already received RB tag from Atish for the first
patch. Do you have any concerns with the second one ?

Besides, what is the appropriate merge path for RISC-V PMU driver ?
Are they usually merged via risc-v kernel trees ?

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
