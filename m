Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Thw3VL4uyK2PeMH5tJDqAH6vUs2Js1A7EFiT7MSM3kE=; b=D4+cCe84SjaMZl
	Whnr5jYxwPHJDx8l9urZ2UVffZAD5tQODwYHuLSJ7OW/dvddDVQWHn0v0Um09GIiDLDQVmnrihLgW
	S5BzgcWBOePv1dXwEG2cEDGZFSY5PUUCSw2YJ6Rvpim/Wl9Lz1xJGqjI1ZDD0r7hvg4HSpdh+FgtU
	EAmqoe9KGYYIhKa+kL1Kvj6zNYr/57R1aFqUhAmz9ee0yBSUkblCchh8r+QtflDV33Naog/+qj7VR
	WP9rojz2hXboSto/hMMb1ZV/iPk74Vj+6rQNwBVoS75zBFmbE9mZqS5vmz2CQDlvmJT+FmdaDd5ax
	3TqHbPl6R8t5Fc0+H1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ypW-00AAbK-RL; Wed, 22 Jun 2022 11:47:30 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ypL-00AAYs-FB; Wed, 22 Jun 2022 11:47:20 +0000
Received: by mail-yb1-f182.google.com with SMTP id t1so29727107ybd.2;
        Wed, 22 Jun 2022 04:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9G0m5h5tEL+v3rqcpmcGX0SX814uyxHrxPQmImDaRts=;
        b=Df7mKmPzEKsTNbMhT9IQ+F5XFh1Eqyv3EJ231WMWmiijdYmUT4BV3y1aVN3OKAReCT
         bi/e5WJbwwA8Sir+A7uNrGYyPtoi21qAHZpvHBqGimkNMU0ABWPR8g4Ec6lKfL4GJbl7
         siZbvctQwhHCySZbreks9Cfvof0rqkFJI4/vjjM/4ZURWFAXxgn+egkE5soAYDN0h03f
         3S/BKrXIqfi6zNEbuo6DtZ1rjy4jmxIegKNKIAla2maF2+ZPfUsyRaAU8zWG8XN5VKF+
         sh77xg8Sf76r6jUAiR6sOYa8B0kgc5yuWYPSoT/BvOTo6Bje+yGVHObQ+SR5yisRJldo
         0DNw==
X-Gm-Message-State: AJIora8dMjSoXHQmpZK+7+NqEM0qGrkEpV769a0N5e8HrPo/DYUJAKvj
	4peOzJY3xDgzmEWwBwzYBuxmu3+aHvCIfnUUYjU=
X-Google-Smtp-Source: AGRyM1uQpWaGytZj64Anw2lr4RSLcvw2joZ2mbIGJ5VWxqoBTAcGKfxy4p98mpKgqE/LwF+k96Tkcc5Whw/4hlteUGA=
X-Received: by 2002:a25:d841:0:b0:668:ab2f:7b01 with SMTP id
 p62-20020a25d841000000b00668ab2f7b01mr3256535ybg.482.1655898437141; Wed, 22
 Jun 2022 04:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220621192034.3332546-1-sudeep.holla@arm.com> <20220621192034.3332546-2-sudeep.holla@arm.com>
In-Reply-To: <20220621192034.3332546-2-sudeep.holla@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Jun 2022 13:47:06 +0200
Message-ID: <CAJZ5v0huqb1+RGD8De0EDM4xbjqin6wCBUsh6pcR=W9rXWw8JA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] ACPI: PPTT: Use table offset as fw_token instead
 of virtual address
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_044719_549088_1C45C4A8 
X-CRM114-Status: GOOD (  27.31  )
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

On Tue, Jun 21, 2022 at 9:20 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> There is need to use the cache sharing information quite early during
> the boot before the secondary cores are up and running. The permanent
> memory map for all the ACPI tables(via acpi_permanent_mmap) is turned
> on in acpi_early_init() which is quite late for the above requirement.
>
> As a result there is possibility that the ACPI PPTT gets mapped to
> different virtual addresses. In such scenarios, using virtual address as
> fw_token before the acpi_permanent_mmap is enabled results in different
> fw_token for the same cache entity and hence wrong cache sharing
> information will be deduced based on the same.
>
> Instead of using virtual address, just use the table offset as the
> unique firmware token for the caches. The same offset is used as
> ACPI identifiers if the firmware has not set a valid one for other
> entries in the ACPI PPTT.
>
> Cc: linux-acpi@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/pptt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Hi Rafael,
>
> If you are happy with this change, can you provide Ack, so that it can be
> merged together with other changes ?

No objections:

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 701f61c01359..763f021d45e6 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -437,7 +437,8 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>                 pr_debug("found = %p %p\n", found_cache, cpu_node);
>                 if (found_cache)
>                         update_cache_properties(this_leaf, found_cache,
> -                                               cpu_node, table->revision);
> +                                               ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
> +                                               table->revision);
>
>                 index++;
>         }
> --
> 2.36.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
