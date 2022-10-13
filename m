Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B6C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vVhNSaMAASTmmAmEczj5FfDkM1Suov2Hg8bpCrs7vEg=; b=0+37ike/qbgJm4Fzkorn1nwPR4
	D9jMduExnoVrs03hGP1MdeRnO/Dwny3dAwagDzHeBtd1CaDF4/sZKcBIZQLLWJmCgRvhIPYwObF4s
	2BQyDFRFrLnMJ63WXL8/ni99C3gyWzmFDueh2p5+qPvQd78V4I4S4W/mDqfh9/xuLTGS+lMaoJ9c1
	+CBrZkOtKAhnEAtqq5KjR3TGzEg05hC8YTyxODFEXaz2L4jG9D9cj4DcthFZbQRsmsUQS6JhBhX/r
	YbEC7YDp0Xm+rkkGx3EFeDj0qaVbJ+JzUG7TVtPktJzW+2RzYAYEEp/0e8EFPNcfF8Ui0pHjDaEnu
	VcvQX6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5Kc-00CxYc-6h; Thu, 13 Oct 2022 21:01:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5KZ-00CxY9-84
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 21:01:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id cl1so2997393pjb.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jdu8CDhPFUGuuqJLB1hm8uRgcdUvFaGH3LFEE7wY72E=;
        b=t3NB2tnT0mOyQNL9SqfMc3Y7GNvuenW4Yj9HqN57Y/yVtpYG8bqNmlprt00zkcnvli
         Obq7zW1RMHD9vOWjVQ3IKBcRS/3+J2JS40IujCdx+lxEzQrysdaZ+PekVHybVUDZ61rv
         HaBQNyAMXTPC78lu4kmOOyS5eypmwPQGVzg4djhqYBXV+5JNfXI9wQsQLMS0ywa9zMMx
         GAqg8GtUZGLgvq5Chtb3MjkGhS2Hxuk6nvFLsFTbq9ZeB8G/5nQa3/q/ogVb5PTHJP+o
         585fZTcCdT0YWiI1q5FI2p+cZs7xjz6ZI0ziP/Q7AVKlhYyDTOPvXzrtvCVoCicSxFEc
         axkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jdu8CDhPFUGuuqJLB1hm8uRgcdUvFaGH3LFEE7wY72E=;
        b=dJCeb3ZgL82fL2W2g4UTsxjbw2NhSVFDT9QCVQdp6XX9HYePXoISFfHcNLWl790nn3
         KDfsgMawJaLC/e0+UbZSb7VsVJTaHiXaBiHn+AyrwLr17IUbMGoaMs9i9kS5ZI6mXlnQ
         0v/AILZjZTkOrc1pvhR3TojS9QaTHWOHjtcel/WfrpZNI4wshmVTaj34vFdP7PadNvM6
         FKtUu2xC1FF5u1g42oy/9dr3YraEipk8XBsBHETIcXocPZsS4Q/1hxCeyztkGuhulIP1
         Xg10YhKg7bikj4JT0TfDsL5UPJ+Fwipg7Fydzeto3mLAc2QvZln19ozvLBFEpf0aweIJ
         SYIw==
X-Gm-Message-State: ACrzQf2xf+amrZiT/5eol2syy8ySaf0+7nSJs8fRbc075lTDHxUu/D6y
	YnqH7cNzeDfv3PT38WKh6abqbg==
X-Google-Smtp-Source: AMsMyM6ItHsqYSboXb3Wt1sovvrB2QN7DJyWgsIfBNru+f2ZODqJjgkDFgWAMD/t9jyKG7ENUEuGpA==
X-Received: by 2002:a17:902:e549:b0:184:5c4a:fad0 with SMTP id n9-20020a170902e54900b001845c4afad0mr1659214plf.6.1665694884466;
        Thu, 13 Oct 2022 14:01:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001750361f430sm274955pll.155.2022.10.13.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:01:23 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:01:23 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Oct 2022 12:51:26 PDT (-0700)
Subject: Re: [PATCH v4 0/2] Make mmap() with PROT_WRITE imply PROT_READ
In-Reply-To: <20220915193702.2201018-1-abrestic@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, coelacanthus@outlook.com,
  dramforever@live.com, c141028@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, abrestic@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: abrestic@rivosinc.com
Message-ID: <mhng-389708b4-d3b4-46a5-a56c-6ea59c8e322d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_140127_528415_41B27535 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu, 15 Sep 2022 12:37:00 PDT (-0700), abrestic@rivosinc.com wrote:
> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> invalid") made mmap() reject mappings with only PROT_WRITE set in an
> attempt to fix an observed inconsistency in behavior when attempting
> to read from a PROT_WRITE-only mapping. The root cause of this behavior
> was actually that while RISC-V's protection_map maps VM_WRITE to
> readable PTE permissions (since write-only PTEs are considered reserved
> by the privileged spec), the page fault handler considered loads from
> VM_WRITE-only VMAs illegal accesses. Fix the underlying cause by
> handling faults in VM_WRITE-only VMAs (patch 1) and then re-enable
> use of mmap(PROT_WRITE) (patch 2), making RISC-V's behavior consistent
> with all other architectures that don't support write-only PTEs.
>
> Both patches are tagged as fixes for the aforementioned commit since that
> commit made a userspace visible change that will break any software relying
> on mmap(PROT_WRITE). (Also cc: stable since the offending commit was
> itself backported to stable).
>
> v1 -> v2: Allow handling of load faults in VM_WRITE VMAs
> v2 -> v3: Split into two pathces
> v3 -> v4: Fixes tags (+ this cover letter)
>
> Andrew Bresticker (2):
>   riscv: Make VM_WRITE imply VM_READ
>   riscv: Allow PROT_WRITE-only mmap()
>
>  arch/riscv/kernel/sys_riscv.c | 3 ---
>  arch/riscv/mm/fault.c         | 3 ++-
>  2 files changed, 2 insertions(+), 4 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
