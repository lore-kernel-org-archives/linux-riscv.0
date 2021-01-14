Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDD9C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:09:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FAAF238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FAAF238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7uSdcKhcUg06pAmxQ4nO9eTjifjLWR26hGTjfkMNLI8=; b=q/A+lWRpuFlC/YbvZcQtmx40t
	iRDNC10Proy6JVL9YyrYZ3lL0GJY8wuvuSFZ81XCn8H/RiNZ55lGycdXwq2bIKvCK/fULY0IWNIvw
	/S/W5fiP0M7YjJufJPANRr+JO8VzDv4exQOBA6MFW9j/T+LzxhAylLN3pcSKzoDFASQEAphoh9FhK
	NYCa+s3U36H5bh68zynRqm54lqz95ub3Hk8NmPvjb2iig9bGpU6HJcfx7158/peVI7AyfBx3SwiAR
	4Ep8W5tdcl/4BIsf8x7brCkSIUnecrhP+2vXWMoLRL9JCgdgQ7VmWKo3JeqFo8ewszZB4te+Y4+PX
	eBMSqxn4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzutA-0002y1-D0; Thu, 14 Jan 2021 05:09:40 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzut7-0002ws-NP
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:09:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id m6so2667887pfm.6
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=l0SVd2Z6z2wiunvJxS4KRqjbI/ytm6ARhNhbn0IZGIA=;
 b=q8RNlcBRjFP2BNecOlGAIXcVb2tcLxP0m95wws3L5nfz3R/bj6jLK6ZSlQyqecVGBH
 baWhTyopNPQiosVcCHCn5G2V+Cz0RbU9VjcuMuUGuwJRSsmFix4TpJVcBMM6Gl9DJceK
 QZxFMOVhh2CGrfq/kKFRKbyl91TauSsfMJVrrl7NB9lRvt32B9Ev3N3IxOhGKeznjVdH
 ouOAtgS9qv+pwl2EoqItCQgCZn7OBqxrxPImdq8oqFLcPE9qhbgY/IAWQpD4QjbSZ1hP
 cqeple8OV0xEa6wqT5Fd4Oi6OEoElfJuVi5MxdB7XX1rwn6hwD5G9sPAd2XUkLBDQ/Pe
 hrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=l0SVd2Z6z2wiunvJxS4KRqjbI/ytm6ARhNhbn0IZGIA=;
 b=C1IVaSXgB7f4BocFaLYjvP9OXqEvHcjmg3n/qbGZBUtbuVwj38yyEiKkbeujNmocgO
 WF+0hMJdnX7xGqTU5b+PeSznb1SEKfylvdOD/5WMQY1sCs6UBIbbSpjEfieOfp2Xn9No
 NlOxQRoPiTdT7elV3mq5HWLJ1R80XpNRu9ggFvh9R864/DWG8hMnkzh+8Y9RZfDwNjdF
 ItHmmdAabwj5F+yDwh0BRtccaTVgR0G/bt6YE5teuYeGf7LTQ8KQZB3OOCFrrPo/Spkj
 sJjhXs5Bd5sw68jdNO55Th9AMpKBZU+Ug8ghoT/szmrgqO/XWXp0npL5a5sd7sEMiiNA
 ljMw==
X-Gm-Message-State: AOAM531Qqi9bBjFyiHw2Vr+YdTHjrB31goIRmjQoX8u8x1f9TrYdPvos
 Gnx12mroSshCmxdHXvUDeBPIkw==
X-Google-Smtp-Source: ABdhPJxYDip1RIxxaby45IP3aK2dYVPkxBLmeZ5dufXHqw2Cb/0PSEBpQNl4WBi+G21aOj0gWHPjVA==
X-Received: by 2002:a65:6659:: with SMTP id z25mr5697984pgv.427.1610600975227; 
 Wed, 13 Jan 2021 21:09:35 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p8sm4103108pjo.21.2021.01.13.21.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:09:34 -0800 (PST)
Date: Wed, 13 Jan 2021 21:09:34 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:08:16 PST (-0800)
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
In-Reply-To: <20210107092652.3438696-4-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-1400a3dd-651b-4a78-bb2d-1f10580add75@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_000937_780844_E2C9ABD0 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, akpm@linux-foundation.org, ardb@kernel.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> allocation if it is requested to be aligned with SMP_CACHE_BYTES.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/cache.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> index 9b58b104559e..c9c669ea2fe6 100644
> --- a/arch/riscv/include/asm/cache.h
> +++ b/arch/riscv/include/asm/cache.h
> @@ -7,7 +7,11 @@
>  #ifndef _ASM_RISCV_CACHE_H
>  #define _ASM_RISCV_CACHE_H
>
> +#ifdef CONFIG_64BIT
>  #define L1_CACHE_SHIFT		6
> +#else
> +#define L1_CACHE_SHIFT		5
> +#endif
>
>  #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)

Should we not instead just

#define SMP_CACHE_BYTES L1_CACHE_BYTES

like a handful of architectures do?

The cache size is sort of fake here, as we don't have any non-coherent
mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
cache lines in RISC-V implementations as software may assume that for
performance reasons.  Not really a strong reason, but I'd prefer to just make
these match.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
