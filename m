Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA04C352A1
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 12:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CNl3XOWvGYuTX3SRpduK17FzlhggVBwFVwljZ2lkjg=; b=FBSfwumg98Lfhv
	Bu0gVPq8cd8oojpUl8iBd1mqnSnkebbjeBy4oCVhMV7iVFu3CGs17pznqIg4AZsCfgSzAmujl01ht
	s7iLdJDruSPS0O3N4IlQLOJP2NQnWpte+U0lgYFkLEWDAKrg3MgMqybcUwMcsKqdNZd8b49NMtIB9
	TBhlYkkN5nnm4ROZkxYzph02IS1owRH9wIADwOAXbv7RzwoF0yP0fwL8m7gaq5j4ScDThnLviBkQF
	Ch5zHHcjRgGFqAa/d6UYbH17uk+j1XjPB1w4Ala+w1bkYL/ZtfMBle+EuVCLrftbBndu3zmzCg4pD
	Bvw/tudvvsj86wsdBUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Rnm-003XAX-I7; Sat, 03 Dec 2022 12:39:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Rnj-003X9a-Qx
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 12:39:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id gu23so17350496ejb.10
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49SXpg0viIkcd9bV8ou6W/kCNoCZOtgNWC4CjYCXnhU=;
        b=PSTRveg6xO09Jyy+2/f2eLu36Tno0cVpPwpwXi9Gu0+hXkz/8ZfMI8nWVYHCvqgMTJ
         Ot8/3Q0QXgUxtA27R659zoq98WRQrJCcLAMlCJwcrF2Vqus1J1e0qTLSekNBe4BywpyJ
         t59GrHwUNZknHU7H1DpEERVsYvqzGoLM+Ly4Qac0I1GkhktyRepwAXUzUklqLusqDTga
         ZDNzQ7/cP0C1IW8wl+E8QIPmG1S79hDkXB2OB+rStgOzS4LwK6lsrl8uhafBCc5vs0im
         TDIGp1zVCsPeeIP968heikMn6TPo08tmgkrC4lYh2hxHOQZGcuHGAT54Gf6DjjEwV0nY
         v3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49SXpg0viIkcd9bV8ou6W/kCNoCZOtgNWC4CjYCXnhU=;
        b=R5TcRA1tDjR+LXNMzH2EIm7fdG7hQmoN6avmSP/Urdz1qlMPKgR18gZhLgAKMhcDpJ
         vkkW6MVqQtwRvlY1pI4isWA3aSuQiDXVNrZNmTwH0D4q2xrTYeM1L3PFqSKc1K5D+xYL
         F0D/b8nMMYzZmzB+WrrqPc4RsrkFRdTlZGHuiv40zFPR9hu5Hsd2C39Xr2e/+0LL9qGn
         D5qjKT/LqTYTJaFk1ZMRpW0DSfcjdcIYgVkONbtvAfQBi4nNz4Kt1rddHs4l6jvSsvey
         3JPnDtH9l7hqGrRo1a2EeXIExulWKxnk2MnkEXmicb/8YCJ1AOvvRTdUYRzuQG6HjQnY
         euVQ==
X-Gm-Message-State: ANoB5pnsP0K8MyXeoKEkiI0CN596zTnJ8ZhhKsRT7GXVuz9I40BwWm3e
	vBiPSqju9QAaz3VHaoAPG4iVdYAUWj9l6pfpZCIChw==
X-Google-Smtp-Source: AA0mqf65SciKagO59wuSYI5TKINseWpYtrCqxKUmH8YoaR4LIG9Igwh+LUO0IcFlL22PHHxL34aI2lZmWL3oY3TVBCY=
X-Received: by 2002:a17:906:6dd5:b0:78d:a633:b55 with SMTP id
 j21-20020a1709066dd500b0078da6330b55mr66280507ejt.106.1670071164294; Sat, 03
 Dec 2022 04:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Dec 2022 18:09:11 +0530
Message-ID: <CAAhSdy1b=uzQqaBAkysHzFtSC+ftrTEryqLT03SPrBtyTKjuWQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] RISC-V KVM ONE_REG interface for SBI
To: Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_043927_897861_2F2143D8 
X-CRM114-Status: GOOD (  14.43  )
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

On Mon, Nov 28, 2022 at 9:44 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series does first does few cleanups/fixes (PATCH1 to PATCH5) and
> adds ONE-REG interface for customizing the SBI interface visible to the
> Guest/VM.
>
> The testing of this series has been done with KVMTOOL changes in
> riscv_sbi_imp_v1 branch at:
> https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_kvm_sbi_imp_v1 branch at:
> https://github.com/avpatel/linux.git
>
> Anup Patel (9):
>   RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
>   RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
>   RISC-V: KVM: Remove redundant includes of asm/csr.h
>   RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
>   RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
>   RISC-V: Export sbi_get_mvendorid() and friends
>   RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
>   RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
>   RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

I have queued PATCH1 to PATCH8 for Linux-6.2.

I have deferred PATCH9 until we have an agreement about how to deal
with VM-level attributes. This is also required for the KVM SBI PMU series.

>
>  arch/riscv/include/asm/kvm_host.h     |  16 ++-
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  14 ++-
>  arch/riscv/include/uapi/asm/kvm.h     |  22 ++++
>  arch/riscv/kernel/sbi.c               |   3 +
>  arch/riscv/kvm/vcpu.c                 |  82 +++++++++++----
>  arch/riscv/kvm/vcpu_sbi.c             | 145 +++++++++++++++++++++++---
>  arch/riscv/kvm/vcpu_sbi_base.c        |  15 ++-
>  arch/riscv/kvm/vcpu_sbi_hsm.c         |   1 -
>  arch/riscv/kvm/vcpu_sbi_replace.c     |   1 -
>  arch/riscv/kvm/vcpu_sbi_v01.c         |   1 -
>  10 files changed, 244 insertions(+), 56 deletions(-)
>
> --
> 2.34.1
>

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
