Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0EEC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfzRvYhc2kxGnb1424R7yaIadfRu+xky2B+livX5U78=; b=BvmMGUUYNPCvSC
	e5p069Oq44nR5785KDNptLPuSGsQYMJ17QTWx3WF0iJItJR9Enq1ZEGiDiPHAsFHr2wJbsCGa8+Zl
	nh8wb5fdLovctgikkOA8nL/q7lk5hmvMccDJ/21a37yTSl5APO4tLFcbE0wmCAsUEf9ajv12TAJfR
	1DbJfMUMa3/FHGzTsERwQ66358PavbaHSvwSqTRyJFnAQCk7RxZIHkG6vCxotdQA+TrqRqU52mhDe
	KA1IKjcH6VKtacNg/lqO316s5UQxkUMc+w8jms1WTWEYyAWTxfA1dDz5Ohx1vt9qYmoKLIs6zcTmh
	zHNc698fShs05Mw2r9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQS8u-00Faaa-11;
	Mon, 31 Jul 2023 12:36:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQS8r-00FaZP-1b
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:36:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe3678010eso1467961e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690807010; x=1691411810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jF+qIvYpPc+s8ZkZ6lpYstLpD9WuWovmY74rgDT3zGo=;
        b=cbz8lUdpxCV9PSSGLiWqCnHtgQ5iAFaAE8pks5tiHxcqGnsQpeRnPmP4ULc78cfAH7
         SCrpRpmsnTa3PDQHg+e7q3fMthSBVv4BeOTwnM0c+EPb6OrYIgYzmggisGOvAQwLJyWN
         RGs3rX9n+DTDyoRK73x1gMkC9y6W+CgNbzZqB+sb9EDNUqnC68zpu+nlA+o5ZZTtSKFs
         Ni9bS3LliOQLs0KvheYNlmK6Qt0oV6sCls2VJJXKG7wClFdBTMI3m+G0nG7D/7ZdB4V6
         ddcMxi8Vd4KmcuNf5D0AEir4lbnmbxbCddVSSuEWM4DJUZ8z0M5/uW6LFHOYuZnTOROP
         blEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690807010; x=1691411810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF+qIvYpPc+s8ZkZ6lpYstLpD9WuWovmY74rgDT3zGo=;
        b=gp5Q+aYH4uOVl7+Yd0Gud+0cgTR4KXR1J7h1FU5cUHS7QJkasxUpm2+Zl0QOXSo5Ev
         gecJyNycqZGEaVpkSzwjkqhmaSr2NaHFJ6gEvAFQ666RQndYSZVTZo82BKPTkoq5w5Ge
         MO96OZMIvS1h7y40+3l0KEI+BoxDL2lOwNnoxcT2dL7YEuL+dYXTSLoYLH0g9sSZQqn6
         Zw6WmVf3VZIUrjpJJst642eCZ2XCrru4jgeapY2/KJ0RGuG8EbqbePiRR6IPPUuJhWQW
         YQFY2vVk2kv1mEvCsFLTrm2qUskfGXr3kXqHzYUj0Onzz6Q3ucxgbnHYvd42kHDL3VC0
         Gmyg==
X-Gm-Message-State: ABy/qLbcZv5fzAx6aSZwdEH60EGkwvP4cMxiY34AsUzXqmlfXIevuzZs
	ieodLbAiCP025pj5FxPjl6NzrQ==
X-Google-Smtp-Source: APBJJlGlfdloV2ZSEYCFwEpzynbyyETazG/MM87GBRmC6dSvM24bvbR+34BUEWMGcRSB7K/HKODkcw==
X-Received: by 2002:a2e:9044:0:b0:2b6:fa3f:9230 with SMTP id n4-20020a2e9044000000b002b6fa3f9230mr6642932ljg.46.1690807009618;
        Mon, 31 Jul 2023 05:36:49 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id pv24-20020a170907209800b0099bccb03eadsm6005861ejb.205.2023.07.31.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:36:49 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:36:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH 0/6] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230731-c7a6aeed9045da1d86631697@orel>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_053653_553364_89E3B7D2 
X-CRM114-Status: GOOD (  34.03  )
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

On Mon, Jul 31, 2023 at 09:04:14AM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> This work was motivated by the changes made in QEMU in commit df817297d7
> ("target/riscv: update multi-letter extension KVM properties") where it
> was required to use EINVAL to try to assess whether a given extension is
> available in the host.
> 
> It turns out that the RISC-V KVM module makes regular use of the EIVAL
> error code in all kvm_get_one_reg() and kvm_set_one_reg() callbacks,
> which is not ideal. For example, ENOENT is a better error code for the
> case where a given register does not exist. While at it I decided to
> take a look at other error codes from these callbacks, comparing them
> with how other archs (ARM) handles the same error types, and changed
> some of the EOPNOTSUPP instances to either ENOENT or EBUSY.
> 
> I am aware that changing error codes can be problematic to existing
> userspaces. I took a look and no other major userspace (checked crosvm,
> rust-vmm, QEMU, kvmtool), aside from QEMU now checking for EIVAL (and we
> can't change that because of backwards compat for that particular case
> we're covering),

Merging this series just prior to some other API change, like adding
the get-reg-list ioctl[1], will allow QEMU to eventually drop the EINVAL
handling. This is because when QEMU sees the get-reg-list ioctl it will
know that get/set-reg-list has the updated API. At some point when QEMU
no longer wants to support a KVM which doesn't have get-reg-list, then
the EINVAL handling can be dropped.

And, once KVM has get-reg-list, then QEMU won't want to probe for
registers with get-one-reg anyway. Instead, it'll get the list once
and then check that each register it would have probed is in the list.

[1] https://lore.kernel.org/lkml/cover.1690273969.git.haibo1.xu@intel.com/T/


> will be impacted by this kind of change since they're
> all checking for "return < 0 then ..." instead of doing specific error
> handling based on the error value. This means that we're still in good
> time to make this kind of change while we're still in the initial steps
> of the RISC-V KVM ecossystem support.
> 
> Patch 3 happens to also change the behavior of the set_reg() for
> zicbom/zicboz block sizes. Instead of always erroring out we'll check if
> userspace is writing the same value that the host uses. In this case,
> allow the write to succeed (i.e. do nothing). This avoids the situation
> in which userspace reads cbom_block_size, find out that it's set to X,
> and then can't write the same value back to the register. It's a QOL
> improvement to allow userspace to be lazier when reading/writing regs.

Being able to write back the same value will greatly simplify
save/restore for QEMU, particularly when get-reg-list is available. QEMU
would then get the list of registers and, for save, it'll iterate the list
blindly, calling get-one-reg on each, storing each value. Then, for
restore, it'll blindly iterate again, writing each saved value back with
set-one-reg.

Thanks,
drew


> A
> similar change was also made in patch 4.
> 
> Patches are based on top of riscv_kvm_queue.
> 
> Daniel Henrique Barboza (6):
>   RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
>   RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
>   RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
>   RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
>   RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
>   docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
> 
>  Documentation/virt/kvm/api.rst |  2 ++
>  arch/riscv/kvm/aia.c           |  4 +--
>  arch/riscv/kvm/vcpu_fp.c       | 12 ++++----
>  arch/riscv/kvm/vcpu_onereg.c   | 52 ++++++++++++++++++++--------------
>  arch/riscv/kvm/vcpu_sbi.c      | 16 ++++++-----
>  arch/riscv/kvm/vcpu_timer.c    | 11 +++----
>  6 files changed, 55 insertions(+), 42 deletions(-)
> 
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
