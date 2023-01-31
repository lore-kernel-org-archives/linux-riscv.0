Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F71C636D3
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a+udEtpn5gzgYk/SInBborXNuQfNqpcNhnV+2mibZc=; b=QXcVl8YRc1wkbi
	5UTXhORrFNTnLcfvCc4wl6Wmgx+OHDnCgbPoaWwohVvatzVg8AA55mKedvdue5cYrCGoJmJvPEWKR
	ZztmAZ5JC/a23iUJleYfjL6WHW0pWdLr9j0AFA6AkTP1jAjbGgiLim/Z3LkYJLSpFVBzqKW3l7Mnl
	zhj+Q0fc3RT6/EInU+1ra1b8nXIjhdVhdUJb/nB3yA5+T5OSeeQYVvbQPsv98lLcrEkZ8H2a43JQ7
	D646Ob0bWT4oDVB9qI/px/KEYxIwq9DCaYCtiRKrCok2q3DJKxdFh6+pFNMe7F+SUJj+XdZE4yzz0
	cSuosu2J9MboyvS/nZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMji5-006NFg-1U; Tue, 31 Jan 2023 06:01:37 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMji2-006NEw-9j
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 06:01:35 +0000
Received: by mail-vs1-xe32.google.com with SMTP id e9so7163492vsj.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 22:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jH9jtw54xpyA3LsRz4MvxNgaHM7qf/mASxIp14kGwU=;
        b=Xe+fcSj6UKNT8s+4fYZgUIM1+O2VECK/uLab2bCFNZHpaA1Cw291Dn2vZYt6yHkj6W
         04gmIeNZSuxOhlh4B5MwNZTnNU4gVwq5br6cQWtmoVtb6cm7tTjaZxtu6uL27Iqd4t9R
         tqdT0LMuv6CySqxMNp8Qbysw3UZ9OGVNCIOk5wj1hbu1xlglsaObX4P4AkqTdFUhkiKk
         x/bQpLU9FIbUHQvvluXYbkfwxXUEeyKm+naVg9f5ISLlWyQ9DfdHOtqJIBgrC0tZkWM/
         QkoY1fxbgwUwXx15kpfnP2jntPWT5pSbhGSYS6irEu5lrBdnOZjic7/7Bo1/KomxyBVw
         uDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jH9jtw54xpyA3LsRz4MvxNgaHM7qf/mASxIp14kGwU=;
        b=i+uZAEyb1Rbgugt5agC6cMjY36RMVhw6SWBMl7CGnALwHOMrd7JlnsIla+EP1BB3CZ
         3utOsWkT24ewxnitSu5GFZWAkx7NIMBTJL6uOWXga9KEhqkJuJqHnGs1gbeCFBt+mCVT
         vIuOzQ/JIiIBAZMjbCoJltZyxPixlPQekYLHQo6WHTVYICpRMqznzYJfamm1BzVSvN+M
         x87CQ+XHXJ1/kmVcPJzMB6+2XV3PWPw5bMEtlomBdv4GyMuUd79INykW4uCHpvYbRFV7
         W6Yw+y5b1pzXoZfp0x/r6pJuLuyNJdaWfCu11gU/7pX/5gV0SxBUP80dAdc7fPqywu2X
         z91g==
X-Gm-Message-State: AO0yUKVji2M9opHjN9EZiLFyOkpU9VZRhR0NO15Sbp+2osxFmLEebnvb
	pAolTF/8vPx9lmJ72+WTuF/JCxK8GTAAosxYGQwZZg==
X-Google-Smtp-Source: AK7set8T8zGFEyjd7YIsBGyAbXe+hLHmog7RQVHiqnPBoaPeefEtsDF+IRzZWa18/zB+XQZSyeHb16GQwO/ao//beQo=
X-Received: by 2002:a05:6102:3098:b0:3ec:1029:9eae with SMTP id
 l24-20020a056102309800b003ec10299eaemr2618701vsb.10.1675144890577; Mon, 30
 Jan 2023 22:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-1-apatel@ventanamicro.com>
In-Reply-To: <20230128072737.2995881-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 31 Jan 2023 11:31:19 +0530
Message-ID: <CAK9=C2W=MPqU8UGBt89HMWW7Mpda8prm3_8WnuTR=8vipynDYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] RISC-V KVM virtualize AIA CSRs
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_220134_366424_F6378F52 
X-CRM114-Status: GOOD (  17.12  )
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

Hi Palmer,

On Sat, Jan 28, 2023 at 12:57 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf
>
> This series implements first phase of AIA virtualization which targets
> virtualizing AIA CSRs. This also provides a foundation for the second
> phase of AIA virtualization which will target in-kernel AIA irqchip
> (including both IMSIC and APLIC).
>
> The first two patches are shared with the "Linux RISC-V AIA Support"
> series which adds AIA driver support.
>
> To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
> series and use KVMTOOL from the riscv_aia_v1 branch at:
> https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_kvm_aia_csr_v2 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Addressed from Drew and Conor in PATCH1
>  - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
>  - Use GENMASK() in PATCH3
>
> Anup Patel (7):
>   RISC-V: Add AIA related CSR defines
>   RISC-V: Detect AIA CSRs from ISA string
>   RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
>   RISC-V: KVM: Initial skeletal support for AIA
>   RISC-V: KVM: Add ONE_REG interface for AIA CSRs
>   RISC-V: KVM: Virtualize per-HART AIA CSRs
>   RISC-V: KVM: Implement guest external interrupt line management

Can you please provide ACK for the first two patches so that I can
take it through the KVM RISC-V tree. ?

Regards,
Anup

>
>  arch/riscv/include/asm/csr.h      | 107 ++++-
>  arch/riscv/include/asm/hwcap.h    |   8 +
>  arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
>  arch/riscv/include/asm/kvm_host.h |  14 +-
>  arch/riscv/include/uapi/asm/kvm.h |  22 +-
>  arch/riscv/kernel/cpu.c           |   2 +
>  arch/riscv/kernel/cpufeature.c    |   2 +
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/aia.c              | 624 ++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c             |  14 +
>  arch/riscv/kvm/mmu.c              |   3 +-
>  arch/riscv/kvm/vcpu.c             | 185 +++++++--
>  arch/riscv/kvm/vcpu_insn.c        |   4 +-
>  arch/riscv/kvm/vm.c               |   4 +
>  arch/riscv/kvm/vmid.c             |   4 +-
>  15 files changed, 1075 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
