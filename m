Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DFC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 04:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZxqHulmdfInYR/yio/vvo1vUnm7Vbk0/gQCuXA4e5g=; b=4fqOUhVfUvfS0p
	un3qTHz0ED4bp+K+O5EQpCv33lmDwd/RZPjhH+j0nEX5ptAOftEbKyMPoglC2wUAQoJ0mq43eDGO0
	UHZSxl9jPWGtaPx3km+2JsWu4hluBVB1VnmE8oSsHzxq3UVVOV8p8k5N0WGLQHGieBmUQvBoeTopN
	se8swrDvSpsJwL/s8cT33o9BjA8+9CwKWI3AwuBbD0WC/7JmeWjsIuzlNMJeNjh8+YsChr/+mDbuA
	QLhkDBUXdRsFrWFaH/Ybg6g2p5YRzaksvS/6EjLPkqJiLGEH3oKqFHXa2/kB5l5Jp+O43XdyvhJeX
	0n0aCHmZDR5Nr+amjEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3Rb-007rcq-IK; Fri, 16 Sep 2022 04:59:15 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3RY-007rYU-Na
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 04:59:14 +0000
Received: by mail-io1-xd36.google.com with SMTP id v128so16589541ioe.12
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 21:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9wX0Os/v3fWWsqmWeRj6d/WnVKZOSdCwMBBhNWRxR70=;
        b=Zsq7Sluoau0Y8EpRoGjXEFmrki9+nCAvyXbkwbUsj1GZWAINsUoO2X3jW5YQxpWD+H
         arWfeMPFscfb/P6b+WvdXfdmnZy9NTj0/PCTy7yijgkOUCOC/+kQB+YhfAzlfoDvbiNs
         6bup61heaUz3XJgBcTW5V4ubRkY7MYkAPt1qp3EEjYNunDAXEFqZPkx3Fud/zLDhaAny
         hNIvmbVe8zwa7pRlMrNdQVZwsl9hzznP6piNGuhgraDCph7oKU9fmxRn//8NIsNfcLhZ
         at2naX0NQAeOHDTF5BCF9KgZ4GUVjSu4+sS7SdERQDePG3HScSsuBZTmxK7LD8v7t9Zb
         zInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9wX0Os/v3fWWsqmWeRj6d/WnVKZOSdCwMBBhNWRxR70=;
        b=xOBYcwi3+yAB3utEcIWNQy+2HuqHZIrG62bkpuxQVA9P0xKHC6H+hpZMX8KMyX7pge
         Y+dJos3hwmi+vWuRzMd0/2I1CD8MbYbhDBTorcyx7riyLAGs4fQPFUrfvV4+iyqB3GFS
         n/1xcbpe2lvxV/uUBKps0ZnMlsUtvLxtjXop3meFzWjWqVeX6YqkvSC3TkGRjgJv+0Bw
         pZ33s35dompfUVdvgh4les66ZoJstXqkmKnFwBf1JsgIu+epssg3Qc4JalRLNwaYMk0a
         8COgZ4KP7UbhS7iKZie6k8xywxR37cQKn4A+1I+5yRZmX83KUFdvPUXzECX3JlvWlDNj
         f7YA==
X-Gm-Message-State: ACrzQf1Nh9PdK+UAfFT9XTNlA96H1eJpYtNBqJylC5UAhhqsICSKEBtt
	RLsjhdkTYjljKfpBnCM9GWidxKN4f/AOzdiTz9KnDg==
X-Google-Smtp-Source: AMsMyM5izN6DIFJa0XyJ9EbNwioGVgvdO48cBsD4pTMfjEZje20lI/t2JQnMc5Gs7iZWgkq88k9bwa0WD7YaiVcyAMY=
X-Received: by 2002:a05:6638:270d:b0:35a:6246:ba76 with SMTP id
 m13-20020a056638270d00b0035a6246ba76mr1633632jav.263.1663304348836; Thu, 15
 Sep 2022 21:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220902170131.32334-1-apatel@ventanamicro.com>
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Sep 2022 10:28:56 +0530
Message-ID: <CAAhSdy1iDXMhE_MVdj9JDu8XHXiV_Ci=aLVqQG7r-m6d28aAdw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Svinval support for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_215912_793975_236E2924 
X-CRM114-Status: GOOD (  12.38  )
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

On Fri, Sep 2, 2022 at 10:31 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds Svinval extension support for both Host hypervisor
> and Guest.
>
> These patches can also be found in riscv_kvm_svinval_v1 branch at:
> https://github.com/avpatel/linux.git
>
> The corresponding KVMTOOL patches are available in riscv_svinval_v1
> branch at: https://github.com/avpatel/kvmtool.git
>
> Anup Patel (2):
>   RISC-V: KVM: Use Svinval for local TLB maintenance when available
>   RISC-V: KVM: Allow Guest use Svinval extension
>
> Mayuresh Chitale (1):
>   RISC-V: Probe Svinval extension form ISA string

I have queued this series for 6.1

Thanks,
Anup

>
>  arch/riscv/include/asm/hwcap.h    |  4 +++
>  arch/riscv/include/asm/insn-def.h | 20 +++++++++++
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kernel/cpu.c           |  1 +
>  arch/riscv/kernel/cpufeature.c    |  1 +
>  arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
>  arch/riscv/kvm/vcpu.c             |  2 ++
>  7 files changed, 77 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
