Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A702C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQ4vdGGFtYsvU+Fo9O7DVkmO1lVH6dmk64pDJD6p0CU=; b=BS8qff/vRR245k
	f3U4GGrrdtAXH9hN2DJMkXIUOyJJOBim+W8MRs6OqnxzDzuggrySO9/OMWOEoC/StooibUNBWWxWU
	Z4TAlI2Fk3dEf2KzaTbi5+HJN74mp0zY/gEWcA60Eb8u7ENT5VzoCqZZ1kr8IU6ifTcng7mU2rRtf
	/v07AfowfN9wIQ3abBlWTfQaoEsrQbpE2sImvrksTU0PN1DK2XPViGpbrL+QhgXfdlEG0IWw5RWSV
	ICck8AlTQhvnC8JvPmhqnEHf6S+8WT9O8AkoUHHbUwFhr5L3/dFfvdJVYzFk18+RdrIxMrqmFCYjD
	W3ZdGjamb/HgAI97AcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Y6D-00CKXU-Rs; Wed, 29 Jun 2022 13:51:21 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Y63-00CKVu-7g; Wed, 29 Jun 2022 13:51:12 +0000
Received: by mail-yb1-f175.google.com with SMTP id h187so25863064ybg.0;
        Wed, 29 Jun 2022 06:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCp/LRokJcxZDVsuGLGOHFR2m172HOBXIzph0VMMKOw=;
        b=UO/2GLaKb2YfhqTTyV72q0vuPonYLToB7hTQ2XU6wj+ZdrAssjtNM6jFr/37xbIxbT
         MGrrAHdNht/0IaQen0jCRwgxEwAmMSaT+gngnMdsMwRNFDKTgvSgTIRiX/5K2IzyPfiO
         luZtY+IwGrPjpJOrMHJoKqXXlF6YItbEJI9FZG727gSxrulS+gWvm4EvCStZcNhjGSML
         dm60E6Rc07G6sbd9NzN+rUiUuWQVSP3lG2R2UhzRhTxgHZvqJaiw+6v6lsX5fI/9ycR7
         FK9xbG63e63De58iKIbT1e9VIx0efUgAJPbvm2n7gjw9srcMKhM+9gGAy3rQWeqPX3my
         X+Zw==
X-Gm-Message-State: AJIora8MZqokj37RP3Nm4+NdGtH8jzokQoWoDwvPDAJ3XBGYja8CwguV
	ADIs1iBKQ8rQ6fTAfO490+Ne2hJZQDsuODl90OE=
X-Google-Smtp-Source: AGRyM1s66IF0TiL7HjPl7I4lBUzShSoaC6NNemCaiaGJtRsPoy7MMeZdcDP+G6yttdeXcBU4a++p3p7oNEA0ycJSE6M=
X-Received: by 2002:a25:664f:0:b0:66c:d0f4:36cc with SMTP id
 z15-20020a25664f000000b0066cd0f436ccmr3368498ybm.482.1656510669730; Wed, 29
 Jun 2022 06:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220627165047.336669-1-sudeep.holla@arm.com> <20220629130644.1258904-1-sudeep.holla@arm.com>
In-Reply-To: <20220629130644.1258904-1-sudeep.holla@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Jun 2022 15:50:58 +0200
Message-ID: <CAJZ5v0jdbS9HNfZ5N=M9jDCOp5uiQ5L30LA6haxpoG6QUFrNbw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Remove the unused find_acpi_cpu_cache_topology()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Pierre Gondois <pierre.gondois@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Wang Qing <wangqing@vivo.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_065111_332602_6E5B1B0A 
X-CRM114-Status: GOOD (  24.33  )
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

On Wed, Jun 29, 2022 at 3:07 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> The sole user of this find_acpi_cpu_cache_topology() was arm64 topology
> which is now consolidated into the generic arch_topology without the need
> of this function.
>
> Drop the unused function find_acpi_cpu_cache_topology().
>
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> Cc: linux-acpi@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/pptt.c  | 37 -------------------------------------
>  include/linux/acpi.h |  5 -----
>  2 files changed, 42 deletions(-)
>
> Hi Rafael,
>
> This is another patch that I would like to be part of the series[1].
> Please ack the same if you are OK to route this via Greg. I am avoiding
> to repost the whole series just for this one additional patch for now.

Sure.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> [1] https://lore.kernel.org/all/20220627165047.336669-1-sudeep.holla@arm.com/
>
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 763f021d45e6..dd3222a15c9c 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -691,43 +691,6 @@ int find_acpi_cpu_topology(unsigned int cpu, int level)
>         return find_acpi_cpu_topology_tag(cpu, level, 0);
>  }
>
> -/**
> - * find_acpi_cpu_cache_topology() - Determine a unique cache topology value
> - * @cpu: Kernel logical CPU number
> - * @level: The cache level for which we would like a unique ID
> - *
> - * Determine a unique ID for each unified cache in the system
> - *
> - * Return: -ENOENT if the PPTT doesn't exist, or the CPU cannot be found.
> - * Otherwise returns a value which represents a unique topological feature.
> - */
> -int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
> -{
> -       struct acpi_table_header *table;
> -       struct acpi_pptt_cache *found_cache;
> -       acpi_status status;
> -       u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> -       struct acpi_pptt_processor *cpu_node = NULL;
> -       int ret = -1;
> -
> -       status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
> -       if (ACPI_FAILURE(status)) {
> -               acpi_pptt_warn_missing();
> -               return -ENOENT;
> -       }
> -
> -       found_cache = acpi_find_cache_node(table, acpi_cpu_id,
> -                                          CACHE_TYPE_UNIFIED,
> -                                          level,
> -                                          &cpu_node);
> -       if (found_cache)
> -               ret = ACPI_PTR_DIFF(cpu_node, table);
> -
> -       acpi_put_table(table);
> -
> -       return ret;
> -}
> -
>  /**
>   * find_acpi_cpu_topology_package() - Determine a unique CPU package value
>   * @cpu: Kernel logical CPU number
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4f82a5bc6d98..7b96a8bff6d2 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1429,7 +1429,6 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
>  int find_acpi_cpu_topology_cluster(unsigned int cpu);
>  int find_acpi_cpu_topology_package(unsigned int cpu);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> -int find_acpi_cpu_cache_topology(unsigned int cpu, int level);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>  {
> @@ -1451,10 +1450,6 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>  {
>         return -EINVAL;
>  }
> -static inline int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
> -{
> -       return -EINVAL;
> -}
>  #endif
>
>  #ifdef CONFIG_ACPI_PCC
> --
> 2.37.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
