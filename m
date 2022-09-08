Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05253C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib+0v39AlW27VbALUwvYFOs/RUIWlrAG7IgcR2QUs3U=; b=r0cq2J0g0ZlVMy
	Nx9jRXz1L7M1xBjmplz1xHdxHPJ04OpuWXi1RPTaKLU5IqqLxYV3wW5s9e9LDPbRRWbbOPOrcx7Pd
	KWJR1v+EVFn8Hk38VMYAZ5uv/BH/Zt5c4gChg+lqj94u+nTNIjX2JZ+BfYlUuqqR+0FcWvGxRInwO
	1n3YU0wbEWiwOJr1vPqNlNLV7uHci/vgjPY3PKJulx+6o6gO2TH1fD75Er+Fpvk4WmlMQ0W42eEQi
	7kBz/5s0drQ3BOJ0uv3KPFLYdyskJG+YaLl+0FD3xmqRfcsBNp5jTqsPUcTEC7rUtrE51ZMje8JdM
	2EFbzleY0vmYBBgQnDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7gp-00Eqmh-Hs; Thu, 08 Sep 2022 02:54:51 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7gn-00EqfK-Ea
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:54:50 +0000
Received: by mail-yb1-xb35.google.com with SMTP id a67so12664411ybb.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 19:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mNsB+S+kNV1cF/a504JAA/VecAC8x5Gh06eHvUw4oQg=;
        b=HhvUGPLNwSMQ6sjwq5qCSN0SxjxfGCE7/CQZOziIcq/QsDtkELvaDyO4og8PjqaxeI
         PrhWCd9r5qqc9xjO72+AfTXw1ZvWdAyzUILjmoNdRXxmfPydZ8SKm+mEul17qNHfWGRl
         1A/Zydk6Dq9Rb/C6kJPVF7eXYGeHeuQkENaC29YBqognafZkbvqiRfyZWLRHTmk+NMAV
         eETUk9E5T60RkPkSuxdy2xDNNFNHvHQgyJWrn6KiT+ZUH8px+9+9tuf+8SqjGIa72hsu
         CVugRkD0+rQDoLJnIbGREig21EabBFIU9T8P5aLpe67SQ03CXMSGV5CJekd+8P/kykHE
         8Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mNsB+S+kNV1cF/a504JAA/VecAC8x5Gh06eHvUw4oQg=;
        b=Kog/bxQhfNlW/RvUQEu5+EWBchq4Y8nYYNQvKelhPv/cCIBamr0DwwSX2yzx+chdlP
         yVPtAXGtwFu0sxmO/DD3t1/Ljq5Ce+ttYpWcXk6H8WvKCQIJnmkHAJhcg5DCnkV4oWtG
         cKH9iCGnIy46mzEbw3xpeyGPuD+JqOPu1TPVEazBpfwmML/PSALBtRAC73ysxaUra1cI
         /ZqDt1u6o/Nr9lGhLVOHot69SoRdrGJxm1LAq+LT0FnehGY+TAyB/6LwjaTwEq7jpyNl
         aNtcsvPZeLI/mtx1jXdroMjMq81nY7yO50WdIGGiZuc1W3bmKeH4y0tLX0wrtWvN3+K4
         u7XA==
X-Gm-Message-State: ACgBeo3BEvbBw5kAFp9dq7ekG6idlvbqTsggPyXlvuM0Dv00AB/C+6Nu
	jDuDpsuW0X9ga+59gXQo5J5cPKBD5KqdJaCUS5snrQ==
X-Google-Smtp-Source: AA6agR6WDhYDkQlw1WGcsxIN0eGo0i0gFbesHqPJHwnCIP3JfybrXquuReOMmVOEwHNz91LGFsNO1hhg6cRndt74EYg=
X-Received: by 2002:a5b:850:0:b0:68c:5798:a927 with SMTP id
 v16-20020a5b0850000000b0068c5798a927mr5320890ybq.8.1662605685390; Wed, 07 Sep
 2022 19:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220906145842.965488-1-ajones@ventanamicro.com>
 <20220906145842.965488-2-ajones@ventanamicro.com> <CAOnJCUJDoAiDhavwisxj4QVGruTb67STb_WqQ5NuojzDwLLqng@mail.gmail.com>
In-Reply-To: <CAOnJCUJDoAiDhavwisxj4QVGruTb67STb_WqQ5NuojzDwLLqng@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Sep 2022 08:24:32 +0530
Message-ID: <CAAhSdy3Bun6wE1wH=n9JejSwoMMzt5wPCMQD=GehQq0eD-Ni5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
To: Atish Patra <atishp@atishpatra.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_195449_494776_613FAC84 
X-CRM114-Status: GOOD (  20.81  )
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

On Thu, Sep 8, 2022 at 4:19 AM Atish Patra <atishp@atishpatra.org> wrote:
>
>
>
> On Tue, Sep 6, 2022 at 7:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> We're about to allow guests to use the Zicbom extension. KVM
>> userspace needs to know the cache block size in order to
>> properly advertise it to the guest. Provide a virtual config
>> register for userspace to get it with the GET_ONE_REG API, but
>> setting it cannot be supported, so disallow SET_ONE_REG.
>>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>>  arch/riscv/kvm/vcpu.c             | 6 ++++++
>>  arch/riscv/mm/cacheflush.c        | 1 +
>>  3 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
>> index 7351417afd62..b9a4cf36be4b 100644
>> --- a/arch/riscv/include/uapi/asm/kvm.h
>> +++ b/arch/riscv/include/uapi/asm/kvm.h
>> @@ -48,6 +48,7 @@ struct kvm_sregs {
>>  /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>>  struct kvm_riscv_config {
>>         unsigned long isa;
>> +       unsigned long zicbom_block_size;
>>  };
>>
>>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>> index d0f08d5b4282..3f36e79876e7 100644
>> --- a/arch/riscv/kvm/vcpu.c
>> +++ b/arch/riscv/kvm/vcpu.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/fs.h>
>>  #include <linux/kvm_host.h>
>>  #include <asm/csr.h>
>> +#include <asm/cacheflush.h>
>>  #include <asm/hwcap.h>
>>
>>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>> @@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>>         case KVM_REG_RISCV_CONFIG_REG(isa):
>>                 reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
>>                 break;
>> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>> +               reg_val = riscv_cbom_block_size;
>> +               break;
>
>
> Don't we need CONFIG_RISCV_ISA_ZICBOM here ? This one reg interface should only return riscv_cbom_block_size if we enable the parsing. Isn't it ?

The riscv_cbom_block_size is in the wrong location. This global variable
should always be available irrespective CONFIG_RISCV_ISA_ZICBOM
is enabled or not.

Better to check ISA feature flag instead of CONFIG_RISCV_ISA_ZICBOM.

Regards,
Anup

>
>>
>>         default:
>>                 return -EINVAL;
>>         }
>> @@ -311,6 +315,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>>                         return -EOPNOTSUPP;
>>                 }
>>                 break;
>> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>> +               return -EOPNOTSUPP;
>>         default:
>>                 return -EINVAL;
>>         }
>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
>> index e5b087be1577..f318b2553612 100644
>> --- a/arch/riscv/mm/cacheflush.c
>> +++ b/arch/riscv/mm/cacheflush.c
>> @@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
>>  #endif /* CONFIG_MMU */
>>
>>  unsigned int riscv_cbom_block_size;
>> +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>>
>>  #ifdef CONFIG_RISCV_ISA_ZICBOM
>>  void riscv_init_cbom_blocksize(void)
>> --
>> 2.37.2
>>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
