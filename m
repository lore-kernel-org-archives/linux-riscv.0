Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D442CC433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95AEA20848
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyzrXgFk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="w4bavdWt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95AEA20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WIifvfEZ6YnqgjYATJ6Xdc+i8fJhQqkoPCpkkc/fKMM=; b=eyzrXgFkPt/r/lyQqjqtPLcPJ
	gZuu5I1ZoQVLFhX1NDKs5QDOBoss9C0w+U57EA68pRLu7rodc91NDrMmetHu5Ydmq6UysJdqV1QQm
	4f9IZyIZf2Yc6k92xzatHMqa2/EFrRHxwD0m6al6ek5byzU5droAVkvhlwqwjcPvPM8i1vV/Du5Yv
	mt9GLPwOuhOKcoQzuQXZvMFnLysePMh3p7TLUCNJqqpr8iluc6Ukn+FxZBDfgIG67gsredVdrjSsU
	UlOf7JM3LI1Ms1GRdLoVeI/O1OPWcj7R0pFq4CWld6ZvE5ygxix6BBuNek5GXM/lK1CWHpUA+wV2D
	7S4+u6rJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBWIW-00008F-L4; Fri, 28 Aug 2020 04:47:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBWIT-00006z-1L
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 04:47:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id b18so32871wrs.7
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 21:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VoHjgG7QKE51iIfhD6VjTDAp7Ojtyk5HJQxEFibU7HM=;
 b=w4bavdWtOQoS3sfGaaTkABme/fmWscqxZ5LrFLLfrldCDaD5j15cu3uS+4KRzGWtAD
 jL5fKfr/VbGOMCueuYkDR/IHdD3S+K2HmqNHE33cZe92yF3E730cfcNfvJRvvjtvpofv
 o4VjvLoEiX/gTqSaMavHf835jiuIHMP9e29nXHVG3LCcfX1ntDV6SrcZNkxl9BbWySpQ
 L0xCcy75cNcozpbzciAGbPd0mlviVTMYGY1OdS6hsy7vPnm4oCc9i0TaN8v5awlLyqP8
 wKvDiHVEv3U0CxqaC7XDBCMfulRckM5RDLbgkftLx/QA7YHy9JcF1QvK7zu0sHK6W0NZ
 GRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoHjgG7QKE51iIfhD6VjTDAp7Ojtyk5HJQxEFibU7HM=;
 b=pFHqli0WyNGg3LN8bQN9f/kdHkoL/kZa39R7q5fpSozYwlgW0/7/Iz/cE4pw8qTLBk
 tf/wG6Gxy2Fugk2gnzAat85vxmPmLdaWdMvk3qqlCoxTY82JnN2L6mEhErtzstclET8F
 +vdv4rK5HtOxp7pJl5XItecOWfHXkDaApwimkdwQPKgjLxWbrOfw5EOEKnN9UAaG9u0/
 EpdgPMB30UwzFiZ9aWLJfetGJ8vk+JPcb/dMBdN1yHlP/36DKNznN3HsHQKRZuxQ/aua
 xOl7qb9iTNa+8aaJTJ+fC3TPg7FsBiLOSGu5/zJI1WHIz6UDWNlJyc6bu/BMtFMXXJ3a
 NWOw==
X-Gm-Message-State: AOAM531F1SqWK+2+idZ6bBkC/g/h7cPctYa3rTjhKSK79XE1wclR5AkF
 h6j17shuIPA4ROhqsttGreyjSWFv/+BYC5WJVFXCxQ==
X-Google-Smtp-Source: ABdhPJwovIXtCaNH0f/IjP5TwWI+pkvTR7Ji61aZ2sZ97tfrX8pksveSJF1DFwZSGd96+dxbvUTZTnuf4JCJxE9fvBA=
X-Received: by 2002:adf:fb87:: with SMTP id a7mr24852823wrr.390.1598590045816; 
 Thu, 27 Aug 2020 21:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200827082251.1591-1-jiangyifei@huawei.com>
 <20200827082251.1591-2-jiangyifei@huawei.com>
In-Reply-To: <20200827082251.1591-2-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Aug 2020 10:17:14 +0530
Message-ID: <CAAhSdy2+auxYci5guLqtbEf3bO3At5-6AcB9Wj3AK4=YcR8f6w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] riscv/kvm: Fix use VSIP_VALID_MASK mask HIP
 register
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_004729_236635_AA61A928 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, yinyipeng <yinyipeng1@huawei.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, deepa.kernel@gmail.com,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, wu.wubin@huawei.com,
 "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 1:53 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> The correct sip/sie 0x222 could mask wrong 0x000 by VSIP_VALID_MASK,
> This patch fix it.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index adb0815951aa..2976666e921f 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -419,8 +419,8 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>
>         if (reg_num == KVM_REG_RISCV_CSR_REG(sip) ||
>             reg_num == KVM_REG_RISCV_CSR_REG(sie)) {
> -               reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
>                 reg_val = reg_val & VSIP_VALID_MASK;
> +               reg_val = reg_val << VSIP_TO_HVIP_SHIFT;

Thanks for this fix. I have squashed it into PATCH5 of KVM RISC-V v14
series.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
