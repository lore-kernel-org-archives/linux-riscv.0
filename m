Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B734C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 19:09:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C6F20882
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 19:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KOD4p5lq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C6F20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N7yskFbMIvmkHMJUC7H6j9HdhlIbv33o4FPnNeUrx+4=; b=KOD4p5lqBUCh/tvw9Y26pnLJD
	HyqTNsf+pH6eTpPZiiBBZWGyZwzKNoL7v68B8gC5iDGni6x6MQnzN77A6syJ9/mPvAWc/vsqIjHyd
	D/hfHRGAlwXrB5GOtg990BN8Dble5epzbp8xLZ2DdwYjjxfgTeCjRZe4wUXDTU9e7wB8Gqmi2XZ3B
	pEdSl31jLH+QLrhvuYLWpVotwhgz0jfyBUQhjy7+QWZFYkKx5taZ5DMIq9fY1KgZWnPHqIzwoz2dP
	wPMEx3Kh4TDIGoqSzXy7iosQig+m+rJpb1LjblIae5mbRt7GdFav/zrLxWWAlTvUW/9GRW2Dm+gyR
	FOFA7a5JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb76g-0003gR-G0; Fri, 06 Nov 2020 19:09:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb76W-0003cY-5H; Fri, 06 Nov 2020 19:08:58 +0000
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA06120882;
 Fri,  6 Nov 2020 19:08:50 +0000 (UTC)
Date: Fri, 6 Nov 2020 19:08:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 2/5] arm64, numa: Change the numa init functions name
 to be generic
Message-ID: <20201106190847.GA23792@gaia>
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <20201006001752.248564-3-atish.patra@wdc.com>
 <20201106171403.GK29329@gaia>
 <CAOnJCUJo795yX_7am0hdB_JFio3_ZBRHioHNcydhqEouCUynUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUJo795yX_7am0hdB_JFio3_ZBRHioHNcydhqEouCUynUg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_140856_352831_66BAE657 
X-CRM114-Status: GOOD (  26.42  )
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

On Fri, Nov 06, 2020 at 09:33:14AM -0800, Atish Patra wrote:
> On Fri, Nov 6, 2020 at 9:14 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Mon, Oct 05, 2020 at 05:17:49PM -0700, Atish Patra wrote:
> > > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > > index 7ff800045434..96502ff92af5 100644
> > > --- a/arch/arm64/kernel/acpi_numa.c
> > > +++ b/arch/arm64/kernel/acpi_numa.c
> > > @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
> > >
> > >       node_set(node, numa_nodes_parsed);
> > >  }
> > > -
> > > -int __init arm64_acpi_numa_init(void)
> > > -{
> > > -     int ret;
> > > -
> > > -     ret = acpi_numa_init();
> > > -     if (ret) {
> > > -             pr_info("Failed to initialise from firmware\n");
> > > -             return ret;
> > > -     }
> > > -
> > > -     return srat_disabled() ? -EINVAL : 0;
> > > -}
> >
> > I think it's better if arm64_acpi_numa_init() and arm64_numa_init()
> > remained in the arm64 code. It's not really much code to be shared.
> 
> RISC-V will probably support ACPI one day. The idea is to not to do
> exercise again in future.
> Moreover, there will be arch_numa_init which will be used by RISC-V
> and there will be arm64_numa_init
> used by arm64. However, if you feel strongly about it, I am happy to
> move back those two functions to arm64.

I don't have a strong view on this, only if there's a risk at some point
of the implementations diverging (e.g. quirks). We can revisit it if
that happens.

It may be worth swapping patches 1 and 2 so that you don't have an
arm64_* function in the core code after the first patch (more of a
nitpick). Either way, feel free to add my ack on both patches:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
