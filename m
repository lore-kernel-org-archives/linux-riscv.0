Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FDFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3662B61038
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3662B61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZZ832SbRKl1zH6vjsnfQ14EROyhk8fttbcnfqAS7w6g=; b=b+DWGPh+qGXsiLPJATRsl4zsf8
	3Hl0Prq+OaUEjUxruCnHFe58TzQ8RHF3p5Am+fSjj9zF7L65sCBztQwSUBGRpJaXQoSsBh40Hgdo7
	36GRh+7X/B0EWYGL6UG5EFuxwCkG57xcshQ0WLJFuYf1Q+pDYwR8xrkkVq9A2yEBpX2uz4SIwy45v
	2jJXYHB/fZYbBwcihzxbor/wf13ilcOh7nVlx4HOmwfqZ8DwaR54IQFBko+fEE/EMNMiIZ9huTHmc
	ZySm7dTOmd/8ON6FZK8giWzIcjaHtusWlqWLkl+xTg5y4GO9uWWX4rOD3uER6NmxiLKM7I2Y5wMko
	4hkcm2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg6xr-008MNl-Oc; Thu, 28 Oct 2021 15:05:11 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg6xo-008MMd-5G
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:05:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so8164629pjl.2
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4gMtHi9lx++3HO8vHpSr1p/5SUEC9v5TgkpF9eatiFk=;
 b=K+NZNuK0NEy7CWaSV4JOiMoT1ySYl6N3psbfIWxFVz1dNkttxp8v1yfcGJYuRN1wQ2
 qTBQdAU/viqVKYgueJn3+kUsPZyTErYkXStWjxkMnERO/TJ7TAIEJkb9uJ3NnyvedF15
 KGXi3XJTzqFVc2DL7LV6IEeYXkcEGk137v0IxMTPxmToOcUxs0S5AlHrLaWddDVEjYZN
 Jh/93FheIbHdWy7RcEmassxL63YQ3P5YuPUqPH0uH9S4lqAI/kG1X7xn2cGnopL49tnN
 rqfwiTUqrN3qQ2VpvNF30j5y/hBy9Ziey8OVbNXJ+fv/M51074tMETY59y+ZI7cllj7a
 nEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4gMtHi9lx++3HO8vHpSr1p/5SUEC9v5TgkpF9eatiFk=;
 b=g6CPmTFTqYnmxwup9Qe4VddlZQy03e497KWW1V/ui28PzpKSySC5kZObFpVt45Lrd8
 xlIUx7AqS/h4sRYQkiL9G2sibmBkaQkVBV6PKQo7Hknqik5P4Y7emLi3G3WX8xlFwaPC
 iYXj1ewVlfbNCoMqEylDI1n1k6g6dWrnYgoeFc+PctveXvay1gK4PRiVXetGJ9LG0MlW
 DBnZSfJl0ex9HTbITstI+ZaZ88NIjJd0sZoK5ARitJlGY+CnKbAIwFgeMEJRPHoYeKiy
 7oWLEj/igLdVq2ZiCT4xovtO+j/ZVqk04VwSqZgl1n0Z3ScsGjBfF84PC6EYwZVJGNaG
 fnSA==
X-Gm-Message-State: AOAM533THqaoVCbj6pTIjJ6uH0mA65fWVahS+pf8LyWbvvBlePLgbs63
 YpL/S0rPjobPXezZ+c88jXZFcA==
X-Google-Smtp-Source: ABdhPJxjB/bUKH1oax3ewBcarZQQHiVnAU8V8Q1ZM8DOQgZjlVjFf7NuLsk1V8PGZf2QWwCTX3AR1g==
X-Received: by 2002:a17:902:ab50:b0:13f:4c70:9322 with SMTP id
 ij16-20020a170902ab5000b0013f4c709322mr4222731plb.89.1635433507260; 
 Thu, 28 Oct 2021 08:05:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o22sm4215280pfu.50.2021.10.28.08.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:06 -0700 (PDT)
Date: Thu, 28 Oct 2021 08:05:06 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Oct 2021 08:05:03 PDT (-0700)
Subject: Re: [PATCH 0/3] RISC-V: KVM: Few assorted changes
In-Reply-To: <62fe1c8e-abe0-5de9-5c00-3549faae1dba@redhat.com>
CC: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Atish Patra <Atish.Patra@wdc.com>,
 anup@brainfault.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pbonzini@redhat.com
Message-ID: <mhng-e9d8caea-eae9-45dc-8072-cde5e275833f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_080508_324422_9C21AAFD 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu, 28 Oct 2021 07:07:33 PDT (-0700), pbonzini@redhat.com wrote:
> On 26/10/21 19:01, Anup Patel wrote:
>> I had a few assorted KVM RISC-V changes which I wanted to sent after
>> KVM RISC-V was merged hence this series.
>>
>> These patches can also be found in riscv_kvm_assorted_v1 branch at:
>> https://github.com/avpatel/linux.git
>>
>> Anup Patel (3):
>>    RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module
>>    RISC-V: KVM: Factor-out FP virtualization into separate sources
>>    RISC-V: KVM: Fix GPA passed to __kvm_riscv_hfence_gvma_xyz() functions
>>
>>   arch/riscv/configs/defconfig         |  15 ++-
>>   arch/riscv/configs/rv32_defconfig    |   8 +-
>>   arch/riscv/include/asm/kvm_host.h    |  10 +-
>>   arch/riscv/include/asm/kvm_vcpu_fp.h |  59 +++++++++
>>   arch/riscv/kvm/Makefile              |   1 +
>>   arch/riscv/kvm/tlb.S                 |   4 +-
>>   arch/riscv/kvm/vcpu.c                | 172 ---------------------------
>>   arch/riscv/kvm/vcpu_fp.c             | 167 ++++++++++++++++++++++++++
>>   8 files changed, 244 insertions(+), 192 deletions(-)
>>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_fp.h
>>   create mode 100644 arch/riscv/kvm/vcpu_fp.c
>>
>
> Queued 2+3, thanks.

Thanks.  I'll pick up 1, as per the thread.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
