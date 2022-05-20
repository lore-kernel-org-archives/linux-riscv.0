Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDC5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 04:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq3JK5cMFUufW6ydTjzbC1wbqk0jLR6Y0O2UQ0NgfFk=; b=lntJwQArIAxWmT
	/rI+ZqZ1WaBLLfNeuX87FnQYyGZYYpfbgWMAIBSv8oyt497oYiJRCxAiZvUKF2Gtb0n2GpAM6EcHb
	tYHIC1DTRZFYZDgOBJlobM4bNaPV6dmlmLcAaFLBZwSvvoK+k5xWTXqpBvvszCQW1Jmaaiq2RtoIG
	ulN2n1ubz/4WtLXFS0CGIV/9ThGUFM9sjanMO+XZLcxMDGKzWFtjc9Jgk6ZI2ECAjMJlR3r48AObV
	h7WdwMl9yVWZq0iB75laNVjL0NQ6ATHF+UtL7QyPMsddGntK/jSU+MCuc4dz8I19mepIEzGBblwK7
	2A+xrTjADMWT4YzgsaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nruaB-00AUmM-MQ; Fri, 20 May 2022 04:49:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrua8-00AUkn-U7
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 04:49:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id r23so9887468wrr.2
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qp/BBMxdc754d+bzk849z71FeQFIlWgSw30xEOvYyvU=;
 b=TYvWNgC4BfbVbjK1SlClNDynJbkU3Eq8sMH449G4Ua6TOsN+O+jT4pHj5nD9uYmkFx
 57ZeJDPNlZSG3ZAwnJOYHmGY8OKOMDlIkXPfWu8GEFQCo2VqPkjcg/M/x4RUgFNMX5lK
 5zFuAT5EEaVDkZrXUzDF+WzUv7cT4TE3j6tGtie/tfKN4t+kbwcGhhbZ3xzTG1WNO9YV
 dNlyrL4jMNdQXD3PQdqA7EF5esuccsuwtxTvVgOCKCk4vQy0TSiEVv9SjyaRRR+Q8rVa
 a8l/aKewy7JqLeAQ9KVPAvLqZlz7vE/ZIYeQogxPy2WEAKTp4rc0db0kGi51rJKrQj7b
 XbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qp/BBMxdc754d+bzk849z71FeQFIlWgSw30xEOvYyvU=;
 b=3WL7+l+8B2hneB/C+aSqIzGqxRiaHRVPVOzQ6y5QL4y6VrdOScwbeN6flA2cw2Q6Ka
 ppwpPXH0Rvtg6ZbCxGb7DHCZ3yUUliPblAEvIbC3Sr972/ikn8kbQqVlsB7Wau0V9N26
 QHhewV+/Pla8ISJnve0w6vamt0fRb03Yj0HYdlzjkNVXvFGaXnWYTfmwkwKunW1AUtvY
 7lERtnGvpAsqp+wf79uog6JuGLXps/KjcAx5X/cu3TjzopbjAKizS8NkCjB3GPn/OMRg
 plRa9IJfcNesM3x2VAzqbYPQMhAUjodGv9Fzilx8A2PlhsujqNjlSY45IZ67fQz2CzJI
 LAZg==
X-Gm-Message-State: AOAM533cZPNl1ol/vAPz6VAnagnkiXO8IpoNCP67eqgc3t5tGUKkDU3S
 8WhK6HZsmOaJzMWf5uKR/W7380BYQUu5P64pj2T27yTekzhOTg==
X-Google-Smtp-Source: ABdhPJzeAQDXB7LmBuO8hhje7e3q5B2NpjBDa2j8fa5MDZk1nAgROuJdGY8JwMp7w7Wy603wc6IO/j1S5rad8YwrCHQ=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr6663471wrz.690.1653022180980; Thu, 19
 May 2022 21:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0V3RziZOXe2UMfpAxmTYn1XpJJTQe5q2FdrmU_3zH+sQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0V3RziZOXe2UMfpAxmTYn1XpJJTQe5q2FdrmU_3zH+sQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 May 2022 10:19:28 +0530
Message-ID: <CAAhSdy2y9MCMxDpYzbRA-ak035qFJ5nm7ZBfqGes2mBMzLmx_g@mail.gmail.com>
Subject: Re: KVM/riscv changes for 5.19
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_214945_006231_38EBB686 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, May 20, 2022 at 10:15 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have following KVM RISC-V changes for 5.19:
> 1) Added Sv57x4 support for G-stage page table
> 2) Added range based local HFENCE functions
> 3) Added remote HFENCE functions based on VCPU requests
> 4) Added ISA extension registers in ONE_REG interface
> 5) Updated KVM RISC-V maintainers entry to cover selftests support
>
> I don't expect any other KVM RISC-V changes for 5.19.
>
> Please pull.

Forgot to add "[GIT PULL]" subject prefix. Please ignore this email.

I have sent it again with the correct subject.

Regards,
Anup

>
> Regards,
> Anup
>
> The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:
>
>   Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.19-1
>
> for you to fetch changes up to fed9b26b2501ea0ce41ae3a788bcc498440589c6:
>
>   MAINTAINERS: Update KVM RISC-V entry to cover selftests support
> (2022-05-20 09:09:23 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 5.19
>
> - Added Sv57x4 support for G-stage page table
> - Added range based local HFENCE functions
> - Added remote HFENCE functions based on VCPU requests
> - Added ISA extension registers in ONE_REG interface
> - Updated KVM RISC-V maintainers entry to cover selftests support
>
> ----------------------------------------------------------------
> Anup Patel (9):
>       KVM: selftests: riscv: Improve unexpected guest trap handling
>       RISC-V: KVM: Use G-stage name for hypervisor page table
>       RISC-V: KVM: Add Sv57x4 mode support for G-stage
>       RISC-V: KVM: Treat SBI HFENCE calls as NOPs
>       RISC-V: KVM: Introduce range based local HFENCE functions
>       RISC-V: KVM: Reduce KVM_MAX_VCPUS value
>       RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
>       RISC-V: KVM: Cleanup stale TLB entries when host CPU changes
>       MAINTAINERS: Update KVM RISC-V entry to cover selftests support
>
> Atish Patra (1):
>       RISC-V: KVM: Introduce ISA extension register
>
> Jiapeng Chong (1):
>       KVM: selftests: riscv: Remove unneeded semicolon
>
>  MAINTAINERS                                        |   2 +
>  arch/riscv/include/asm/csr.h                       |   1 +
>  arch/riscv/include/asm/kvm_host.h                  | 124 +++++-
>  arch/riscv/include/uapi/asm/kvm.h                  |  20 +
>  arch/riscv/kvm/main.c                              |  11 +-
>  arch/riscv/kvm/mmu.c                               | 264 ++++++------
>  arch/riscv/kvm/tlb.S                               |  74 ----
>  arch/riscv/kvm/tlb.c                               | 461 +++++++++++++++++++++
>  arch/riscv/kvm/vcpu.c                              | 144 ++++++-
>  arch/riscv/kvm/vcpu_exit.c                         |   6 +-
>  arch/riscv/kvm/vcpu_sbi_replace.c                  |  40 +-
>  arch/riscv/kvm/vcpu_sbi_v01.c                      |  35 +-
>  arch/riscv/kvm/vm.c                                |   8 +-
>  arch/riscv/kvm/vmid.c                              |  30 +-
>  .../selftests/kvm/include/riscv/processor.h        |   8 +-
>  tools/testing/selftests/kvm/lib/riscv/processor.c  |  11 +-
>  tools/testing/selftests/kvm/lib/riscv/ucall.c      |  31 +-
>  17 files changed, 965 insertions(+), 305 deletions(-)
>  delete mode 100644 arch/riscv/kvm/tlb.S
>  create mode 100644 arch/riscv/kvm/tlb.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
