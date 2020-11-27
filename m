Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1802C2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 08:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD270206DF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 08:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X6Tok+td";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="m18nERKW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD270206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LvHwytcmf7PIduoYcPRojWd7jIf8g8PxvCbmxqsai/M=; b=X6Tok+tdq3iwyplFLLnLj5A8s
	CTKc0fXw9anA2b68NCRS4zfXk+khGzCDGVs/4vUOcQ5JZYogrdzm+/F1Rndwa4CXqqmEODK4N0Fbv
	WxBqN5taEUviYM5iRlOIlCtqqRTr4vtVSC/ChEr22HZUIOhLGe8vYP7sEK2Fjp4eiSG0QQcuyxOU8
	VOaE8TlmtBWCH3Z8YGHn6WQQAI9kpJYqv81WRBNAo6ytmnElTClq3moGipRvsPtSxuSrDSVnL2HN3
	Puv10+1crhvaK+cYrd74wsLGgmIAV1Yao1i+mbrr76/pZgfy3u2dtIfSDeR3K9b/qbLniU/yNyQuY
	rxKi6FEAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiYuR-0007kp-BA; Fri, 27 Nov 2020 08:15:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiYuL-0007g3-SG
 for linux-riscv@lists.infradead.org; Fri, 27 Nov 2020 08:15:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id w24so5688260wmi.0
 for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2020 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMhtxoOQO9MieYk5Rltrie3Vdx47/RH1jVgYv6FFhaQ=;
 b=m18nERKWsFZ00KX/m38Vvp9IoTZj62sK5tPmNvoeLIbF/briBEzrkI4Hs/aP0+f5Dk
 b6L6mUdr+pMsHGojOE1pYEaNg+qTaTwxdx3UC3m6PH7giJbpoICZWLUfN6McEJznQI0/
 ADGFpQpnm3rro734UAHnBzt65wVTVP9BpbCXcx94t+MOoll+iCpnDcavAFcdF0+QDELM
 12QxEZVpZX7d+cnirVswy7GSxpe3Mi/4Rk9WyUD/NhH36baHA//UTri8KODMTLjGwSZU
 jLOOkQku0V93aTg4vi4zxvjXe+Whmc44JqBeo++EqL9Q/YPCtY5Ta5ONyPUR14qNpZId
 wP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMhtxoOQO9MieYk5Rltrie3Vdx47/RH1jVgYv6FFhaQ=;
 b=WLu7YZtItCVcrUDbBkgpt2mLsbIJk2qI1nkszv5Xh8qkol4t5ljRaBPDYVYSVxBEVr
 fG76fINIEm4u/gUF6Q9w16jnu/AUGaGrrCii1zvAUtUQdTZCbY2GfMOQzwVpjLqM6cM5
 C0WrZP+mX/rAk6aIe0g6cJlITp1ls1hE2lbpNut19mgzDLCkPkEX2sTt4wCRwaEuOQVZ
 Q73O48Ne7M2nEcdDvc5hZGVTSl+1NZUe0VXuSNRFGJNwSnXVmCiVMbhzFgD4bYT97HBN
 fQAiHnbaPislEsvgKw4LzxaST2Zq9QH/NlwvrLs6vZADNHv45KufuNG/MJs82cpM2aH0
 cJ1Q==
X-Gm-Message-State: AOAM531sNWafLyLCnOGO3ctLuZHbkRzdUheYVAdHgA5DKM4iXgcX8HQW
 +tPT8tnUQ6NyVFlqQ20Ja9JlSeMIBDEax51u78Qsdw==
X-Google-Smtp-Source: ABdhPJyk6kMwRndUJx8qkTrZCUGCRggV1uLiA8zUdqoxIaXhDdJQV7aRToPt4xzAJtqmF1NyBDcB0fbNhk0qaRpavdQ=
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr121691wmk.157.1606464903925; 
 Fri, 27 Nov 2020 00:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20200803175846.26272-1-atish.patra@wdc.com>
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Nov 2020 13:44:52 +0530
Message-ID: <CAAhSdy0hrKNwOA4428Vf4mf32gZSw1cKiSXhhXB1s==yq7jEpA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add SBI v0.2 support for KVM
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_031510_284732_94D0C4EE 
X-CRM114-Status: GOOD (  17.94  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 KVM General <kvm@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexander Graf <graf@amazon.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 11:29 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> The Supervisor Binary Interface(SBI) specification[1] now defines a
> base extension that provides extendability to add future extensions
> while maintaining backward compatibility with previous versions.
> The new version is defined as 0.2 and older version is marked as 0.1.
>
> This series adds following features to RISC-V Linux KVM.
> 1. Adds support for SBI v0.2 in KVM
> 2. SBI Hart state management extension (HSM) in KVM
> 3. Ordered booting of guest vcpus in guest Linux
>
> This series depends on the base kvm support series[2].
>
> Guest kernel needs to also support SBI v0.2 and HSM extension in Kernel
> to boot multiple vcpus. Linux kernel supports both starting v5.7.
> In absense of that, guest can only boot 1vcpu.
>
> [1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> [2] http://lists.infradead.org/pipermail/linux-riscv/2020-July/001028.html
>
> Atish Patra (6):
> RISC-V: Add a non-void return for sbi v02 functions
> RISC-V: Mark the existing SBI v0.1 implementation as legacy
> RISC-V: Reorganize SBI code by moving legacy SBI to its own file
> RISC-V: Add SBI v0.2 base extension
> RISC-V: Add v0.1 replacement SBI extensions defined in v02
> RISC-V: Add SBI HSM extension in KVM
>
> arch/riscv/include/asm/kvm_vcpu_sbi.h |  32 +++++
> arch/riscv/include/asm/sbi.h          |  17 ++-
> arch/riscv/kernel/sbi.c               |  32 ++---
> arch/riscv/kvm/Makefile               |   4 +-
> arch/riscv/kvm/vcpu.c                 |  19 +++
> arch/riscv/kvm/vcpu_sbi.c             | 194 ++++++++++++--------------
> arch/riscv/kvm/vcpu_sbi_base.c        |  73 ++++++++++
> arch/riscv/kvm/vcpu_sbi_hsm.c         | 109 +++++++++++++++
> arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 +++++++++++++++++
> arch/riscv/kvm/vcpu_sbi_replace.c     | 136 ++++++++++++++++++
> 10 files changed, 619 insertions(+), 126 deletions(-)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
> create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
> create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
> create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c
> create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
>
> --
> 2.24.0
>

Please implement the SBI SRST extension in your series.

Also, the PATCH1 can be merged separately so I would suggest
you to send this patch separately.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
