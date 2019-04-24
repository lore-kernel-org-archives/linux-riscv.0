Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1286FC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 09:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D501921773
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 09:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPs409fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D501921773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v40mocapNkCTPiU2VRLOe35NoiwZWrVlqHuvHNjCJRo=; b=bPs409fiwPrI0J
	W5pLpmkO9lpDrZyycqyBAtq8QMc5Qf9eA5EQ5RWdmptovsvwzBC++agaRUBcOrMlMjOInb0ZG3UG6
	TAXqLLmOYA4LRbrtNy2inPfKKh2ANOb9e3Js3OlBFgYUN41mh5qd7MqHlZnJf+VOD7IpbqdsbnO6F
	Zsr70gehMEIIIm1UThWacNvfUkUYqYDnMB7T3T1+sVY0RwJTEp1sC8M+0l7JaQ/R+boBjfgKAdVTl
	Sas+ZUC+AiA6QpYVutcUjo5LC+oatKixzhwdICl4MuTDdGmzihonCKWxJy3aZ8TjFjN54Ltf7ZG1T
	cj+a6tLt2FNbpSIUL7JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJDsJ-00048c-O2; Wed, 24 Apr 2019 09:07:31 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJDsD-0003xN-IX
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 09:07:30 +0000
Received: by mail-wm1-f65.google.com with SMTP id r186so4101382wmf.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 02:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rz+GYtqgldMYK3PobWaTcPCrbBeBFXQ6BGTMl9sOxPg=;
 b=XOPdnER6mAyV2tYs7ivpdVPlrXHKaA1QsgxIeYQSkHMtglNuCqhrPVapBT+5UO0cEK
 mpyLMt1uYhIxDoNL1RBVnl03mq9GdfsWoOnY8eTLWI6p/rp6/7Jo/PeoQSjI48zgePOP
 AZ00ig6PENxw6AAt5QkQhL6g5U3vO2w0MfN/eKTe5K3egMZvbB/nquyfAc8lUt9iohZ1
 tP8BeYtp/GTr7U+mdvYxXco76E1cbWnAUzXHua4dAye5GPWcY1XQw54/6+z0df0Rioai
 2LadPOQZwWQCd3Zxi+7/33wIEDip+50HberFaFbq4BRWKRirZOPfOW49I1BjinR8E+sT
 a3OQ==
X-Gm-Message-State: APjAAAUoCM0GPwwENKXIJjtCbDSJYPYzY7utSrjmZEv+b8EaU7SoEtNc
 iRcIpW2S2wb7C9LsWwz1IISbWAnINiJxr6xZPWs=
X-Google-Smtp-Source: APXvYqzsl5BIWuGViFFuJJRMhJ+DXwESY4sG0eIl63gl9NTqJyTh80rU9Vs0h5ATXckFig1qe8FzAj71BO60OcC5DdE=
X-Received: by 2002:a1c:3845:: with SMTP id f66mr5385802wma.97.1556096843472; 
 Wed, 24 Apr 2019 02:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190424000227.3085-1-atish.patra@wdc.com>
 <20190424000227.3085-2-atish.patra@wdc.com>
In-Reply-To: <20190424000227.3085-2-atish.patra@wdc.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 24 Apr 2019 10:07:12 +0100
Message-ID: <CAPKp9uZNEdL=Jt7vsxMBo72WR=ArefB6Vi7fLxnxMwAfUT3JOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_020725_865950_43FA8555 
X-CRM114-Status: GOOD (  14.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 1:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> OF/DT core has a hook for architecture specific logical cpuid to hartid
> mapping. By implementing this, we can pass the logical cpu id to cpu
> node parsing functions.
>
> Fix the instances where logical cpuid is expected as an argument in
> of_get_cpu_node.
>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/cpu.c | 3 +--
>  arch/riscv/kernel/smp.c | 5 +++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index cf2fca12414a..c8d2a3223099 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -136,8 +136,7 @@ static void c_stop(struct seq_file *m, void *v)
>  static int c_show(struct seq_file *m, void *v)
>  {
>         unsigned long cpu_id = (unsigned long)v - 1;
> -       struct device_node *node = of_get_cpu_node(cpuid_to_hartid_map(cpu_id),
> -                                                  NULL);

I assume it work working just fine as you are doing cpu to hartid
conversion here and
weak implementation of arch_match_cpu_phys_id does direct match.

> +       struct device_node *node = of_get_cpu_node(cpu_id, NULL);
>         const char *compat, *isa, *mmu;
>
>         seq_printf(m, "processor\t: %lu\n", cpu_id);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 0c41d07ec281..94db72662f60 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -70,6 +70,11 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
>         for_each_cpu(cpu, in)
>                 cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
>  }
> +
> +bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
> +{
> +       return phys_id == cpuid_to_hartid_map(cpu);
> +}
>  /* Unsupported */
>  int setup_profiling_timer(unsigned int multiplier)
>  {
> --
> 2.21.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
