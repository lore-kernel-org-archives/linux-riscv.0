Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5503C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFQRhmNWspFiXy5hz/C8w4YEAr8hOFycM0yGmFZNh2Y=; b=dfUjWXg8Hv9yE1
	57Wr35PTWFTtHL44mmpH85afMwMrdU4JSqeLjbRLHlRVo3KWKTbp1FDbPtTV+fvfMz7+BIeZ5gKnZ
	mS4MGXMiSwGGY5+A4kLdj0FMAkTPjB80dhM+Y24K/3aHGb2Gw7ej8B9ZSfGL7hc9t7Fpr8ADfFYUa
	bSl3S/EMcYXgSpQKj3SxG0n5j8KOECoaUsR1rEZ+ksmU0Jiyqkyzd71dOOZB8Y76N6ptfkhXp2jAa
	Rhof1+Yx1WYB8YbW+v3ROkUjQL2NfWZuE41ZBKIAf90Z1Tlv7y4H9xuA7KFFZEFtWzpEBu7foJ7NB
	zGn/slgjwthTR950bqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHhWb-00GVDo-Lx; Wed, 09 Feb 2022 07:36:25 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHhWY-00GVCR-UO
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 07:36:24 +0000
Received: by mail-il1-x136.google.com with SMTP id z7so997801ilb.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxmt5Kj4ixMDalj8gkISOJ+VSocmulH3UobyBnsOLhM=;
 b=o+mXaTUke3o1ZKY3VsaTMUr+i7wRVoGg9VdlTBW5oScRv0Q+osXNF7V/DZUdrd68Gr
 NTMKukzca1PPt7xKtyy8hmIsijDmEzRzKXOclpmA6vbqCyd1wsyXek1QctEOFu9qVF71
 4vbOU3ECupYDfW/0SmOD/7J4Sqd67ovirei76VotWaofPSGuEvcChr34bQXvhRg+DiHP
 VoZlrIGPS62jJVErB65IrvwGg+Bcp0xlsR5pi9aoP/+nlbvnC73FVZjOn2ct5bvLy1O4
 Iv5ecqe0iEd8ipj3nJS+FKda4VNCuNG3p8YdcD5vrIZxpNSRqncqp3qlVEiTxEoIS4uD
 kzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxmt5Kj4ixMDalj8gkISOJ+VSocmulH3UobyBnsOLhM=;
 b=19OIvcfqDq7bux931OxLDdX/6iSUxOxpsIlCHIis4+P9NpAS+6JxB1mCR19ZCDLjx1
 rFvcRMSTVo1GSAyjgoQZSXyfXMyuRElZGEnZ+tFwd/HZhzJ1I+DksHH0rs64mKXcNEAz
 TdJDA9+LwR7601k1C1CQOLXzibHHOiC8Z+vGCbS4xFVs4tNefVvESMRFJxTWiKZ+Yht+
 qcI+PAsbw7kjnLcmceKYG+gM4Vc1R7E1SWAsJEM+cvqZMLSyVUWxO4Xq5ROUZC3hghSx
 5mVR+/62zkdcPrMywfb/BtoMqOqfGfVs5T1t9cW6+htOhKxY6oabc1xkLdOBW9DnFFiw
 fO+w==
X-Gm-Message-State: AOAM5324Y2Ga4LRX7WOq93vmRX6TOB3lJ+KW5XVljG2nlRItPothmCEI
 gLtexb8F4/ExPHHPudOsirXeJKcUGAbRmqalpA==
X-Google-Smtp-Source: ABdhPJygX67PVG8vWNKALWVMmfCOp1o97gDepvbvLMc7eyMqXlxcJkPUJWAO0M5Zf5+9RUyQ11UyAig0Ncqbx3GZH+g=
X-Received: by 2002:a05:6e02:1a87:: with SMTP id
 k7mr477045ilv.259.1644392181652; 
 Tue, 08 Feb 2022 23:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20220123121352.13199-1-kernelfans@gmail.com>
 <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
In-Reply-To: <mhng-9439ea0d-b7ab-48ed-a359-702383ad6321@palmer-ri-x1c9>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Wed, 9 Feb 2022 15:36:10 +0800
Message-ID: <CAFgQCTsLGm3ynWmQydPfV8gt4fJqamVnnBmJNpLhVwVJWcXoig@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpu-hotplug: clear cpu from numa map when teardown
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_233623_013012_883F4C4D 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Feb 9, 2022 at 9:13 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
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

Sorry that I have no such things even riscv machine. I did some
hotplug stuff, compared arm/arm64/riscv, and found the difference.

But since the code path should be symmetric, I think the hot-removing
path should revert the hot-adding path.

Thanks,

Pingfan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
