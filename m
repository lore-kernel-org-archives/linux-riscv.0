Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63+NmFTKzFdHTBcKFpmVusNJwtQ6ftqoMGcO21Ka4Ek=; b=Qv4w5rAGnKCliG
	ZInSi+omg0YIIRdKrFWdglnvOxGPInFHUvsA77GoyRR8EXMdreMxa9enhMhHwvcU56vMzbLDdbCDa
	POnAEq2ilGkI3dka1w2BKoKwmp3FgdCmVHWjrjhUWm0trmZPKhy7ZAOrK7N9i44QHofqxNiuvqgxp
	mpqQn9hIWl2VtedwTtDf9bZi3ODbIR4cOaT0j66ONzR+G0zin4WU38iwoT/4LSs8+md7QFq62gj1k
	t5SRDeWsyqnia0qXJzn+1YlforGwBJ/LvTVzDyKhTlq4tWHEgoJ29SHqyBzCbtloCEvRWbjusGCHL
	9vFSYJnGD3PsFLAJaSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5rP9-004VX8-0j; Fri, 07 Jan 2022 15:43:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5rP5-004VV0-Hv
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 15:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641570222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLApLSkD2tnkzqx7aoXrE25bXex4a2vpZpy1QnhSBFE=;
 b=XoD+WKvQGqdecRgD/jja1YSvt5SBlSXqfbbyV95QxVPaRAVOyejld179BggsBu03sVQDbj
 vw2fZFlZQOey3fhz2Pzs4WUqG12N7j/LRDWDeF1I7aXbA0ydsx4LekVv4/XNaVeGWGDf1Y
 4vNdtJnHL+KloMZIvZHlV0uAZqbSsWA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Drx2gPlMNaWsYBurzBDeVw-1; Fri, 07 Jan 2022 10:43:39 -0500
X-MC-Unique: Drx2gPlMNaWsYBurzBDeVw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so4980616edd.11
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 07:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xLApLSkD2tnkzqx7aoXrE25bXex4a2vpZpy1QnhSBFE=;
 b=FmowD3OY0BMwMnuQ6oMYHfzG8s/jAjGFTCNhnGiSN9LIm1EGV66kACUzUR6SGr3H09
 qqCQwqsPXWPkzGv7Krg/Cm47U7XJzNNGMfwN+SPfOihTCc4bRVMmAztD/dK2ddqvkRI+
 Ow2dT+cAZawOE+iQLl1EWxz/8E4qdssJZju2HhYYC3rbheTsq+YaO/qaFZVaY05iGC3N
 ISsVuSaT8g46yrTIL7BaghvGiJrvTcSrjJ9bcm4ThC/607wHkWP1PdYEh0OHClInIj1g
 zaoOImyus8tK0nwxpUR2zH+TwAaVE4hF7aAJCHa7ATvBT6C6eXbBSb5Tx6s4Hk6K5O7N
 d3Pg==
X-Gm-Message-State: AOAM532AY0rxVw6lgANshQrdovpmZB2dRhsNaJs3l1CcLXHWD3lMJg+Q
 q2/+8tCJIEXyZBzNjggA47Z5UmKY+9lUBqPjPxkMwspER8aMly/CV33vxmkIhqrO8c1WhNaBzFM
 Fdd4SgeIIImhJgG6oAQNXuPApaVEe
X-Received: by 2002:a17:907:961c:: with SMTP id
 gb28mr49410035ejc.385.1641570217886; 
 Fri, 07 Jan 2022 07:43:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuHgNBYCw3FFcW3eQJ8shP/R+L2QCQpOod+A/9z88SLM/oJpVx1fVYsU+6h62mFlJQkskP8A==
X-Received: by 2002:a17:907:961c:: with SMTP id
 gb28mr49410027ejc.385.1641570217668; 
 Fri, 07 Jan 2022 07:43:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b10sm2219207edu.42.2022.01.07.07.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 07:43:37 -0800 (PST)
Message-ID: <806cc760-8e49-62a4-7bab-7149e9c95d33@redhat.com>
Date: Fri, 7 Jan 2022 16:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [GIT PULL] KVM/riscv changes for 5.17, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy2iRgCBt=6t2p5AE_Rq18s2QcRoM62ZAGiAcn5A6TfB4w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy2iRgCBt=6t2p5AE_Rq18s2QcRoM62ZAGiAcn5A6TfB4w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_074343_713938_2553600E 
X-CRM114-Status: GOOD (  16.38  )
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

On 1/6/22 14:21, Anup Patel wrote:
> Hi Palao,
> 
> This is the first set of changes for 5.17. We have two new
> features for KVM RISC-V:
> 1) SBI v0.2 support and
> 2) Initial kvm selftest support.
> 
> Please pull.

Pulled, thanks!

Paolo

> Regards,
> Anup
> 
> The following changes since commit 5e4e84f1124aa02643833b7ea40abd5a8e964388:
> 
>    Merge tag 'kvm-s390-next-5.17-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
> (2021-12-21 12:59:53 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.17-1
> 
> for you to fetch changes up to 497685f2c743f552ec5626d60fc12e7c00faaf06:
> 
>    MAINTAINERS: Update Anup's email address (2022-01-06 15:18:22 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.17, take #1
> 
> - Use common KVM implementation of MMU memory caches
> - SBI v0.2 support for Guest
> - Initial KVM selftests support
> - Fix to avoid spurious virtual interrupts after clearing hideleg CSR
> - Update email address for Anup and Atish
> 
> ----------------------------------------------------------------
> Anup Patel (5):
>        RISC-V: KVM: Forward SBI experimental and vendor extensions
>        RISC-V: KVM: Add VM capability to allow userspace get GPA bits
>        KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
>        KVM: selftests: Add initial support for RISC-V 64-bit
>        MAINTAINERS: Update Anup's email address
> 
> Atish Patra (6):
>        RISC-V: KVM: Mark the existing SBI implementation as v0.1
>        RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file
>        RISC-V: KVM: Add SBI v0.2 base extension
>        RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2
>        RISC-V: KVM: Add SBI HSM extension in KVM
>        MAINTAINERS: Update Atish's email address
> 
> Jisheng Zhang (1):
>        RISC-V: KVM: make kvm_riscv_vcpu_fp_clean() static
> 
> Sean Christopherson (1):
>        KVM: RISC-V: Use common KVM implementation of MMU memory caches
> 
> Vincent Chen (1):
>        KVM: RISC-V: Avoid spurious virtual interrupts after clearing hideleg CSR
> 
>   .mailmap                                           |   2 +
>   MAINTAINERS                                        |   4 +-
>   arch/riscv/include/asm/kvm_host.h                  |  11 +-
>   arch/riscv/include/asm/kvm_types.h                 |   2 +-
>   arch/riscv/include/asm/kvm_vcpu_sbi.h              |  33 ++
>   arch/riscv/include/asm/sbi.h                       |   9 +
>   arch/riscv/kvm/Makefile                            |   4 +
>   arch/riscv/kvm/main.c                              |   8 +
>   arch/riscv/kvm/mmu.c                               |  71 +---
>   arch/riscv/kvm/vcpu.c                              |  28 +-
>   arch/riscv/kvm/vcpu_fp.c                           |   2 +-
>   arch/riscv/kvm/vcpu_sbi.c                          | 213 ++++++------
>   arch/riscv/kvm/vcpu_sbi_base.c                     |  99 ++++++
>   arch/riscv/kvm/vcpu_sbi_hsm.c                      | 105 ++++++
>   arch/riscv/kvm/vcpu_sbi_replace.c                  | 135 ++++++++
>   arch/riscv/kvm/vcpu_sbi_v01.c                      | 126 +++++++
>   arch/riscv/kvm/vm.c                                |   3 +
>   include/uapi/linux/kvm.h                           |   1 +
>   tools/testing/selftests/kvm/Makefile               |  14 +-
>   tools/testing/selftests/kvm/include/kvm_util.h     |  10 +
>   .../selftests/kvm/include/riscv/processor.h        | 135 ++++++++
>   tools/testing/selftests/kvm/lib/guest_modes.c      |  10 +
>   tools/testing/selftests/kvm/lib/riscv/processor.c  | 362 +++++++++++++++++++++
>   tools/testing/selftests/kvm/lib/riscv/ucall.c      |  87 +++++
>   24 files changed, 1291 insertions(+), 183 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
>   create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
>   create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
>   create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
>   create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c
>   create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
>   create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
>   create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
