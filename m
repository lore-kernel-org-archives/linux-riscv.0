Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B6AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDhn50ZYUcJo/ru5AUZtxwGCCsIqj0PGc3AjnROu8CE=; b=iQv+ptfFrlThk2
	J1ks2m1WG5Tlj1x1R0mFYa9htPqFNy0hb0jJLmnMTwjeLJtho2jXciLKVNwB4kgOr/F+oPZ2Nj6Cy
	olwOtOgDo525OhIjnus2idS7+fB8tXiR9qXMFGPBvNVtpzmdL8EIEdoGrVZGpNRgfD+tHygSX6tPz
	Zp72X3yyKh0atb2Lc3NLPuvbp8e+sfnWZPCLXnr/wPu2QWC6LALpDchdbOyDO4c1tNB8+oVfBRweO
	bZQ0/LgQ+9o2uOfB6IHuNiueNOQQ0JppdxW53xFT6p1ZdmzuIlly/UQ3YrXLeyhEGsv+ROIW8iRec
	U1qKnahDZzH1swEqG8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIFE2-004mLl-2c; Thu, 10 Feb 2022 19:35:30 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIFDy-004mL6-JC
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 19:35:28 +0000
Received: by mail-yb1-xb34.google.com with SMTP id c6so18550153ybk.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 11:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQbKIG9j1W18INmvYSforoWyR9qXCd+zp+SDRigSpF0=;
 b=AWzSE4fxFtHcRnR8exZ0VvymBSZIjlc3NkHBuxoaBVwPTI5/7TGca3DizteXNmRfml
 UkTAJ6DDlovttVmBXC3I/G1L3Qz3zY7n07EcF5lxyzssr6Ecq5RE4nIgUthZuwdumdFy
 DfGUzaA1/ssr87kyFsn1iF1H4+VHRk32yXzc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQbKIG9j1W18INmvYSforoWyR9qXCd+zp+SDRigSpF0=;
 b=1NSxaElmGZwAlLOb+1yTsatZM4a6rW/uhh0F4t936jD1NPFafj7dYOwUQ3jzwXxroY
 Izjo/F2PYVHUR4lL9+jI6R7PNq8+US510WX1hyVfeajxlUtsZMHcL3MZjrCpSkUqG9HQ
 WwJmuo7QjiQlsHL1zOlalExTiEFMK2ac5UGx98uoxJuprhIa0ly5KOfzABaHcJ9zlHZ4
 qcdOJRxBhZlVydyDwalb6k6s4uQOQ11yxO4Wiqv/PSCWok1pMRzvtzEA4lehlV+25Pzc
 S1i2/Dtz9CG7q259gd9tJ+HF/tpuO3hnx/5SNC1zVeqku1NOH9/NAb/eCtQ6YHsSvcew
 OCnw==
X-Gm-Message-State: AOAM532FiiQQUSS+2R3Z5kcMKC49x2vZYshaKwFYLorPCbFFGZOJO3YK
 U6RGB14ZqCYkPkrHmTtcn4VPrksAyCdZA2zDQiXY
X-Google-Smtp-Source: ABdhPJx7raBOsuqaBIYZe+/6W1QquLhbZxxrQIkvCEfeU4XzAedeBtZAK3Ve+1wAs92y2OZC0c0c+hrlHZw+JpXhGKc=
X-Received: by 2002:a25:8b0a:: with SMTP id i10mr9045482ybl.651.1644521724616; 
 Thu, 10 Feb 2022 11:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20220123121352.13199-1-kernelfans@gmail.com>
 <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
In-Reply-To: <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 11:35:14 -0800
Message-ID: <CAOnJCUJcYwbO6XNjRkjYBzw77F97BKE_f8DRfQjh7Q_MJPMWNA@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpu-hotplug: clear cpu from numa map when teardown
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: kernelfans@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_113526_703255_D66D79FE 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Feb 8, 2022 at 5:13 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 23 Jan 2022 04:13:52 PST (-0800), kernelfans@gmail.com wrote:
> > There is numa_add_cpu() when cpus online, accordingly, there should be
> > numa_remove_cpu() when cpus offline.
> >
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Jisheng Zhang <jszhang@kernel.org>
> > To: linux-riscv@lists.infradead.org
> > ---
> >  arch/riscv/kernel/cpu-hotplug.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
> > index be7f05b542bb..78d156a359ef 100644
> > --- a/arch/riscv/kernel/cpu-hotplug.c
> > +++ b/arch/riscv/kernel/cpu-hotplug.c
> > @@ -40,6 +40,7 @@ int __cpu_disable(void)
> >               return ret;
> >
> >       remove_cpu_topology(cpu);
> > +     numa_remove_cpu(cpu);
> >       set_cpu_online(cpu, false);
> >       irq_migrate_all_off_this_cpu();
>
> Thanks, this is on fixes.  I don't really have any NUMA-related test
> setups, but if someone has a QEMU-based config that's meaningful then
> I'm happy to add it.
>

lscpu/numactl already checks the online cpu list and prints correct output
without the fix which explains why I did not notice this earlier.

This is the correct thing to do anyways. Thanks for the fix.

Tested-by: Atish Patra <atishp@rivosinc.com>

Here is my qemu config
qemu-system-riscv64 -cpu rv64 -M virt -m 1G -smp 4 \
-objectmemory-backend-ram,size=512M,policy=bind,host-nodes=0,id=ram-node0
\
-numa node,memdev=ram-node0 \
-object memory-backend-ram,size=512M,policy=bind,host-nodes=0,id=ram-node1 \
-numa node,memdev=ram-node1

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
