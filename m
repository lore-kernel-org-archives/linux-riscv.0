Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570A0C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 17:33:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90EA208C7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 17:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIebKQyq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Gum7idwr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90EA208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ia+dkrgpvYw3I5VUlZlu/UK5PUazFeAh78N2St6Pawk=; b=bIebKQyqJQUS1UdreEBeqOU3m
	rAnwzJead5vbpv5w/otaW78E7t9VVDzDfnmNu2u4xTKh77fxOZq/i3SgnyRvxxNZJcJswzTN4Qpyj
	XhxIJZgaJQJULhLgUjB3WNm/Ro/OJjn3cOdMY9aDqUMPL2kLHmMNiPUIMX5gYn41ZPOu5ZahKzdi3
	m7FDh8KqQjx/Z5lNeeK4dA+Bnvam5xLO7I7wODKmur+wyFbeQYxdhN48PP17fWX2bwh3mdVVQiMSi
	7LufL/eJWzRbfmEKi2LV4AmXutp3dE9NfP9tTlZ34k3jAtumk8N4fC41k7ticHUwM+0l3tGA6hFfh
	dWWTp+Lgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb5cE-0000Pd-89; Fri, 06 Nov 2020 17:33:34 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb5c8-0000Ni-6m
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 17:33:29 +0000
Received: by mail-il1-x144.google.com with SMTP id k1so1734719ilc.10
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 09:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZI7U3izYBLuKgwxS1LJeRXMFqpXLyUguXUomcL5pdk=;
 b=Gum7idwrRZT5cLtv5uC2Sol2ja8VuOwCY2LT1Rmh5IGcI+Zaj1U8ZZl7uHAfTB/K+4
 zwc01wlq6zZLsaM2E95LmhahaauO+pYSvPz9R40ehLEkrBdCtsMEF2Ryf0vyQWUH3gwF
 OLrrVouaLiZ0iDFQ1wOGn5DnXRwRIKsUmSkPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZI7U3izYBLuKgwxS1LJeRXMFqpXLyUguXUomcL5pdk=;
 b=iSlZLEEe2XX61Qxv8Bxaymlpr/+SAhk561mX8PdXAntwI/jI0k2uu0s8gKJY29N7A3
 0zawQqiTymM39DGcU1s5QuBSfAewu2bt4Zbe6zJdKUhhUktjgCHJbRnrEQWXlU4OJIJm
 k9lpQ/g20zdo+zk2aSc3QSca1Mkkp99ZMy1AxymIfIbor5zCV/b8wgq5U6NML8A7VFct
 OcEg4AbiQHLfkLl4a1XAVZnGjTxDsXV/YvYIKRY25yhLau+mK7SRvWUicHzi/AifgbAz
 YkXjix+3pTIwqi1cFUJir98UvFDvuM4gCYTZzjBl/QijJyr/+XNcKVW4U/XgknqyBkjs
 EWqQ==
X-Gm-Message-State: AOAM532I6IcayS62IvhpeRbe+QJ9MFCrQaguEdNwK9wwF/P8GXxiQIAz
 lWxHsJv7NyboY1BIHn94Di83W+7OzRznBJEFO/ZV
X-Google-Smtp-Source: ABdhPJxQKkLDaYAAvOSbnwEMmdO14qmO69Gu2BtyVBOiLFGnveflirWOvnXE8aUK7P43i2+nv0iQkJp/BpemBT5JVeU=
X-Received: by 2002:a05:6e02:111:: with SMTP id
 t17mr2266305ilm.79.1604684006022; 
 Fri, 06 Nov 2020 09:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <20201006001752.248564-3-atish.patra@wdc.com>
 <20201106171403.GK29329@gaia>
In-Reply-To: <20201106171403.GK29329@gaia>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 Nov 2020 09:33:14 -0800
Message-ID: <CAOnJCUJo795yX_7am0hdB_JFio3_ZBRHioHNcydhqEouCUynUg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64, numa: Change the numa init functions name
 to be generic
To: Catalin Marinas <catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_123328_584862_E7EC607C 
X-CRM114-Status: GOOD (  27.02  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 Jia He <justin.he@arm.com>, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 9:14 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Oct 05, 2020 at 05:17:49PM -0700, Atish Patra wrote:
> > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > index 7ff800045434..96502ff92af5 100644
> > --- a/arch/arm64/kernel/acpi_numa.c
> > +++ b/arch/arm64/kernel/acpi_numa.c
> > @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
> >
> >       node_set(node, numa_nodes_parsed);
> >  }
> > -
> > -int __init arm64_acpi_numa_init(void)
> > -{
> > -     int ret;
> > -
> > -     ret = acpi_numa_init();
> > -     if (ret) {
> > -             pr_info("Failed to initialise from firmware\n");
> > -             return ret;
> > -     }
> > -
> > -     return srat_disabled() ? -EINVAL : 0;
> > -}
>
> I think it's better if arm64_acpi_numa_init() and arm64_numa_init()
> remained in the arm64 code. It's not really much code to be shared.
>

RISC-V will probably support ACPI one day. The idea is to not to do
exercise again in future.
Moreover, there will be arch_numa_init which will be used by RISC-V
and there will be arm64_numa_init
used by arm64. However, if you feel strongly about it, I am happy to
move back those two functions to arm64.

In case, we decide to go that route, can we define arm64_numa_init in
mm/init.c ?
Defining numa.c just for arm64_numa_init in arm64 may be an overkill.

> > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > index 73f8b49d485c..74b4f2ddad70 100644
> > --- a/drivers/base/arch_numa.c
> > +++ b/drivers/base/arch_numa.c
> > @@ -13,7 +13,6 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >
> > -#include <asm/acpi.h>
> >  #include <asm/sections.h>
> >
> >  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> > @@ -444,16 +443,37 @@ static int __init dummy_numa_init(void)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_ACPI_NUMA
> > +static int __init arch_acpi_numa_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = acpi_numa_init();
> > +     if (ret) {
> > +             pr_info("Failed to initialise from firmware\n");
> > +             return ret;
> > +     }
> > +
> > +     return srat_disabled() ? -EINVAL : 0;
> > +}
> > +#else
> > +static int __init arch_acpi_numa_init(void)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +#endif
> > +
> >  /**
> > - * arm64_numa_init() - Initialize NUMA
> > + * arch_numa_init() - Initialize NUMA
> >   *
> >   * Try each configured NUMA initialization method until one succeeds. The
> > - * last fallback is dummy single node config encomapssing whole memory.
> > + * last fallback is dummy single node config encompassing whole memory.
> >   */
> > -void __init arm64_numa_init(void)
> > +void __init arch_numa_init(void)
> >  {
> >       if (!numa_off) {
> > -             if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
> > +             if (!acpi_disabled && !numa_init(arch_acpi_numa_init))
> >                       return;
> >               if (acpi_disabled && !numa_init(of_numa_init))
> >                       return;
>
> Does riscv even have an acpi_disabled variable?
>
It is defined in "include/linux/acpi.h" which is included in arch_numa.c

> --
> Catalin
>
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
