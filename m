Return-Path: <SRS0=AX01=6O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062B9C4724C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 14:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9996C2074A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 14:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdLpt4Wp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FxZt9q69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9996C2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQZ8f3nWspkcMVyQxaM9lki0jYoUn+ENmpwlQM54tJI=; b=WdLpt4Wp9JDbH+
	tj2RK52iHf5hEtB+1iHsWeUwrRiQZqiucr9vThp2QHhPvx2mZLbbldttRcWneRh9qIo+TDqnVwObN
	ym73VS6zFLU6Y19Iy3P5LLB893joOlKvhFZpHzDHoxybim7pTo+r1mrckg5vEJBT+PbQsr7vtOOlv
	VGgabLQvaOUVO8c1pcVxQHA8MxOjLNue3RAnLCrV87aQBwSo+LUFek+TC0jWUbQ9eqzvkGay88gY+
	bb05p/9QOb4JOF0oV/BbcablY/lfM6p7Ze2ABO2agQdwvUdpX8m1sdR9E5JilCRh4pz01EoSnyEKG
	zFjwZ27J3HEmJCU/MSEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUAWC-0007DP-0g; Thu, 30 Apr 2020 14:50:28 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUASz-0002C4-5Q
 for linux-riscv@lists.infradead.org; Thu, 30 Apr 2020 14:47:11 +0000
Received: by mail-qk1-x743.google.com with SMTP id i136so1819415qke.10
 for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2020 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VQZ8f3nWspkcMVyQxaM9lki0jYoUn+ENmpwlQM54tJI=;
 b=FxZt9q69WeDISYW/u+FapX+g4AcoQ60SHR3rObRVjDCxZJ6UlTOi0dDCo80/JgOZxn
 DXt30paSE9HJByZpd9MN/9bqoaSpWnTTzk8huYKSl43IenhzSPYC/6nqzrHL/ZM7l3m0
 ZYx4yU6m6RbIlqhaO29As71mAiNpfB+eFLqeN8uhtMe8aNYNMnCt2+mMYYBBP3BK56ls
 5xIIg/Rbx93ERJ0KI+y9BtFSxWflV/zzBmS6MLyPYWkeJj0lVjQfi/iAxyBdd07EIs6i
 MUrvs4ayiVBB0q/LP8J/0bQNgyfH/yXLTdnOQbJAEkTzD6vHAusumKAYkH7MyPfImSVN
 UqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VQZ8f3nWspkcMVyQxaM9lki0jYoUn+ENmpwlQM54tJI=;
 b=jDua2f+CTQUhRxpq5W/Jh7t9N5OCrEqzYzzkO/c0AABe6Aul2rfJXsyTy+9lYdVdt1
 o8NuZVD97EK+eiPrMB45HQfMuErMCT3HVAo0/E5BobpJfrix0LBIQThSiLw7HfwHgSYY
 zsbUaBvoejN7WIVnMpZPsGOFGw4SP4cgSK4nODJi/ct+HyA5JiBKA7xrOipnHbrkpqmt
 0uP8ekRvJ6eapiAyZY1hKDAU40wDGkpBqv26jBkDXn1mCs8Cblf37QQkbZrJ8NlzU95x
 p0Ut7oo+nyBajGwC7+48Sei9zNt/5fGj9wlYH7WZwITZqpsCSc8o9Z5PKqvHqkS6Qbqw
 izKQ==
X-Gm-Message-State: AGi0PuYhahlebi2N+ZvWQg8oOC172i8FOcQEPpWWshAMgrbfK9ORK0Wv
 DgoUQq2Het+HFtYoYb6Jxjg2GY0tXzEBDUhzF+HRdg==
X-Google-Smtp-Source: APiQypI4BcCVLkg5AN9fc3sf6hgpcY3Uycdlk5eEMR0cZLkzEcOAknCav+JRxX81uhcEm63uJ9YZeUIFuFufJtosWy4=
X-Received: by 2002:a37:4792:: with SMTP id u140mr2610211qka.327.1588258027121; 
 Thu, 30 Apr 2020 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095325.111441-1-zong.li@sifive.com>
In-Reply-To: <20200430095325.111441-1-zong.li@sifive.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Thu, 30 Apr 2020 22:45:47 +0800
Message-ID: <CAHCEehJ2pbGUe79Kq6q5DFSHNWwg0FEOinqqL=PRNmTt1nT_kg@mail.gmail.com>
Subject: Re: [PATCH] riscv: force __cpu_up_ variables to put in data section
To: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_074709_249935_20DCC360 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Zong Li <zong.li@sifive.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=8830=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Put __cpu_up_stack_pointer and __cpu_up_task_pointer in data section.
> Currently, these two variables are put in bss section, there is a
> potential risk that secondary harts get the uninitialized value before
> main hart finishing the bss clearing. In this case, all secondary
> harts would go through the waiting loop and enable the MMU before
> main hart set up the page table.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/cpu_ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index c4c33bf02369..0ec22354018c 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -15,8 +15,8 @@
>
>  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
>
> -void *__cpu_up_stack_pointer[NR_CPUS];
> -void *__cpu_up_task_pointer[NR_CPUS];
> +void *__cpu_up_stack_pointer[NR_CPUS] __section(.data);
> +void *__cpu_up_task_pointer[NR_CPUS] __section(.data);
>
>  extern const struct cpu_operations cpu_ops_sbi;
>  extern const struct cpu_operations cpu_ops_spinwait;

Reviewed-by: Greentime Hu <greentime.hu@sifive.com>

