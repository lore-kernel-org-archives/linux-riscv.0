Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DF1C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pnsjGuxLCpRK5Xp84UkrrM9cz2Sl9Ymvnbw1lF9Y9XQ=; b=zE/gIE7X1KCdLL6Bf6OVUeJJtG
	FVjIfk8G1XANF5UBbmNQd1QLhXTDTLuvtqktnaXg7X0B1xZiYBjZa/X4TT7ntKck70mNgr/AROkDR
	reBKVA3KvXh8V6Of1Z5g7j3/t8l49MNwesod4ZgYx5XIHsVAy8xhoylSFSewP5jyg6we0KF1jp6IW
	7h9XuOdyjsSMYSYBWT5SDIhH8/plXLczn1XaFlqT0YaqTGNUKOpziOO5C79bBV1MIwJ9zRLzW82LI
	tCth2bXobrAdArcf+EPPJVFPWNoAvRqdXvQWhwclIu3rZanA8p6/JR9RfBzriqR3JghtFXzj2bCtX
	Wf81Cn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6eAk-008JYm-0B; Sun, 09 Jan 2022 19:48:10 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6eAh-008JY1-Aa
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 19:48:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v25so9425653pge.2
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JyqLjQnkJpIxD8QTaBOhLwMadk8N68x8plAXpy9Hz0c=;
 b=wlXDxSwWI+cU/jDX6EPuCXko8qAEyfTr/XvemTHjVyrH8tQJ+erL/GO9C9svhL6FPT
 6Gc3OZs9vxDPI1BfDW/FAza1teZ8+10EHnk20ZcxHs/OO78y01q4KTkPAhcIbXPtxFK6
 KKfAkKQrZeOvgXCnCFSdeMNbPlRlD6WQWqwtlqHtXD2rT80XWhfnRMxFBRz7LtXS2R2/
 KIOlc22iKAeDZ5bYPGyXfhw+XbmBw8XPd5fhsGUjDVVDooZzZCrcCXezOM4kT7avIoPl
 n9ODPvqnocR8sb2leSniR9IJYU2ZEMEfv4Tl/XBFi3hTNz7rg5hLiCr04efMLWhp/mhc
 Ag9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JyqLjQnkJpIxD8QTaBOhLwMadk8N68x8plAXpy9Hz0c=;
 b=eWQSzyrY+y9U4rzv7YZeLxCm4PN5H9vBsoicHMBIyaWaCZp6Zkq57Kfib+YoccPg7A
 0vBRcpHyL5zXAs2JKa0nftealTbfv5Uv713Au9kCKlv1cVj1cPl5jxtLnhRfjOBIyt4/
 3y/NHfhqzRF2UbFUJwImVOxsFPXOzM8vGfr44a5QlMfCLfPFBwx2PzKbKONtYz5pmN9F
 JrmCHIu74iL5t1OacG7X728/ku8Par/BWkpqfJT2H9L9QkfZ9a0TCajaV978tKOBDBIZ
 jBYwG7DG4GLjCq1m6UeWWUmXqjYvy7fg9YrGQBXDTMKcCoiiEu+9Y1Df76Yjw/yvRfLF
 gaNg==
X-Gm-Message-State: AOAM530iJmb3DoMIIkQq8rzCQuCTyK8VHgDrXDSlZiOy3wbwo59Jmvr6
 sA8DkLb7zTinrEACP5diX8VPsw==
X-Google-Smtp-Source: ABdhPJwu+d4+2ofEkpi1W3WNzWjp7vIYF0vd9QvzESYvxs7HnIN7MVX0KSrgkszCVogy/ZsxBkTSSg==
X-Received: by 2002:a63:9602:: with SMTP id c2mr48737508pge.538.1641757686425; 
 Sun, 09 Jan 2022 11:48:06 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s14sm1213780pfw.33.2022.01.09.11.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 11:48:06 -0800 (PST)
Date: Sun, 09 Jan 2022 11:48:06 -0800 (PST)
X-Google-Original-Date: Sun, 09 Jan 2022 11:47:30 PST (-0800)
Subject: Re: [PATCH 0/5] riscv: misc clean up
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-4e157e52-f315-48ee-ac92-03628c35cbde@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_114807_416447_57CA6EB6 
X-CRM114-Status: GOOD (  12.11  )
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

On Sun, 28 Nov 2021 08:07:36 PST (-0800), jszhang@kernel.org wrote:
> This series is a misc clean up: clean up useless LoCs, or make some
> functions static, or mark function pointer as __initdata, or remove
> one function().
>
> Jisheng Zhang (5):
>   riscv: remove cpu_stop()
>   riscv: head: make secondary_start_common() static
>   riscv: kvm: make kvm_riscv_vcpu_fp_clean() static

Probably best to split out the KVM patches, as they go in via a 
different tree.

>   riscv: errata: alternative: mark vendor_patch_func __initdata
>   riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign
>
>  arch/riscv/errata/alternative.c | 3 ++-
>  arch/riscv/include/asm/smp.h    | 2 --
>  arch/riscv/kernel/cpu-hotplug.c | 8 +-------
>  arch/riscv/kernel/head.S        | 9 ++-------
>  arch/riscv/kvm/vcpu_fp.c        | 2 +-
>  5 files changed, 6 insertions(+), 18 deletions(-)

These are on for-next (aside from the KVM one, which Anup has already 
picked up).

Thanks!



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
