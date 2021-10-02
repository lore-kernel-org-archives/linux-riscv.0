Return-Path: <SRS0=Ne9D=OW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CEDC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 20:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B58761AF0
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 20:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B58761AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=10clo0xfpr8k+dIlxOX0/+HCO4n4aXTsQBMh2JNL/3I=; b=37mUTSvc5Lzf09ZesFF/PPrG//
	Y6nZwTRZLPUGt4/f41X/tf+sZiyvW15dbcQ+j5Trk+Mqmx27IYKgKYh0FoCuyObg3A9w8aPXFAMSQ
	Bc3Hd+ktAL5jnWGsPa7vLBV66+OimXeFGuYYFnqZ6/76ElheC/dfSND+u2QoUGaCq0fL2CwvFC3Nf
	3VNj/az/35jQ+yt9RPJ9adHcKzJKh5kjZn7ZPjG73Drd9TAdkVGz2BCtuLVmKiPrpGGbh52ouq8RJ
	Vhn9oCmZrpTSm4P5KATm5I1DN0nUSLNbhxzcnp/puDlG+nSv/IMcZK7WIcVllVAwG76C4lHg/eUsC
	A2nUs0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWlYj-002hbp-Q5; Sat, 02 Oct 2021 20:24:37 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWlYg-002hb1-SA
 for linux-riscv@lists.infradead.org; Sat, 02 Oct 2021 20:24:36 +0000
Received: by mail-vk1-xa33.google.com with SMTP id z202so5950669vkd.1
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gheH1BWtvHm1zTSupgo4rpDcUcxXI3Gdklert++eNsE=;
 b=Qa5Fk+e0vrtXkpOlqgyKxq9fdCMqo2B9CVY8g4xw7CN3+f1sv7VpByX12vgNLSEkYt
 e0qW07WfIqE+PQLA2tb1lsvi5Emkth88DaatRRfI+0JDpyz+LKZU9YkmIAfS6u2Ct5I0
 o5UzeZeCjokrD8ANPCj14YWRBINOBLp8dhL7Fo7qvuea95i0Lb1wXmMaspGZLK4/HZYz
 nSI7uVkR4DNtw2ErK9QV467TW/+FqXxj61z1OEt3Yw2lSlb/eR7par4ZLCRYfJQ/kbBQ
 aVTrNoAX4PeXXFe10lI3ek9eVZ3Nq77JB1Wns7fizh1MO4r9C40W1s2CByAeUbx7UcZA
 Hb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gheH1BWtvHm1zTSupgo4rpDcUcxXI3Gdklert++eNsE=;
 b=ekFXSalyl47KK4UiXyZImYNeSU3jnnM0DW0gDnVC80RoHAGn2nKEoJEIrBdmZbgtLj
 5RVMZT8WMIlRtAmrWZlc2yLBBwwvnM7+fR6Bp9iQW+eoWU2ksquqhy8ruHfb9geoUkCO
 hPhmG7Sz4I8Xs1Z0HYyIOrUAW7ppvjDYEEEXITFHGQhHvO1ywgjLHC5hPAEIQiElM1vc
 I8g19IY+yvR0844vSWADFAoWXBRc2vzuvdO+VkwsAL+ZOABGnGW0oNL4RrKrUlTPxs3w
 D1XBrnqWeQOxY89w9nW7rXebIh9Pj0GNKcxl+ejRE4bKyjmthmzMhpSQojjqYlV/2zC6
 huOQ==
X-Gm-Message-State: AOAM530N4Fbr1xCJ88IWse03RyHIE37VG3JhOFpQyK3KIZedEaGPLTWP
 i8xxawydkv0NNBBMw3aP/UxQ3w==
X-Google-Smtp-Source: ABdhPJzNTve39xRVt8rmHnTobccKXQkEqcHACW9GMv/Nc5OpzbK2tJq3gt3Ap7dd1/3x+FlUW3L+sA==
X-Received: by 2002:a1f:388e:: with SMTP id f136mr11173001vka.12.1633206271300; 
 Sat, 02 Oct 2021 13:24:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e21sm4583394vsh.4.2021.10.02.13.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 13:24:30 -0700 (PDT)
Date: Sat, 02 Oct 2021 13:24:30 -0700 (PDT)
X-Google-Original-Date: Sat, 02 Oct 2021 13:24:25 PDT (-0700)
Subject: Re: [PATCH -next v3 0/3] riscv: Fix two vdso issue
In-Reply-To: <20210901024621.2528797-1-tongtiangen@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 abdulras@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tongtiangen@huawei.com
Message-ID: <mhng-62e741b1-d0a2-4c88-a2df-785f061924c9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_132435_008371_0BE26645 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, 31 Aug 2021 19:46:18 PDT (-0700), tongtiangen@huawei.com wrote:
> v3->v2:
>   Adapt to the latest code.
>
> v2->v1:
>   Add patch "Refactor asm/vdso.h" to avoid vdso.lds syntax error if
>   CONFIG_GENERIC_TIME_VSYSCALL=n.
>
> 1) Move vdso data page up front and introduce enum vvar_pages, This makes it
> easier to introduce new feature TIME_NS.
>
> 2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
> and return with EINTR if the task got killed while waiting.
>
> Tong Tiangen (3):
>   riscv/vdso: Refactor asm/vdso.h
>   riscv/vdso: Move vdso data page up front
>   riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for
>     write killable
>
>  arch/riscv/include/asm/syscall.h  |  1 +
>  arch/riscv/include/asm/vdso.h     | 15 ++++-----
>  arch/riscv/kernel/syscall_table.c |  1 -
>  arch/riscv/kernel/vdso.c          | 53 +++++++++++++++++++------------
>  arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
>  5 files changed, 42 insertions(+), 31 deletions(-)

Sorry, I thought this was targeted at for-next.  I've put this on fixes 
(not sure if my last copy went out, my mail client crashed).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
