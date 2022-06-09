Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C68C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg9nc7wmkwDaXOHi8wSMDmzvP2byDYotOPKngd6hXHA=; b=UXeNlVgUc4bdVn
	TaEgg9TLqo4z/1+YtJa3tolBn00NoUfY01L+WGbaGj85A5e8j30ILVHdfxVKiI3+iDshPRSO71R21
	uiuINf0WyEgliHXOs1MHJ0K2y88PKyCiSM2e6QOReW79gOHXlzsnt5wKEKd+GaykCX1/dFwm6JWAU
	MOprE3Ic40Lep1PO3opKo6IsGNamNmgPf1zwKNoOC2bP/Sbv3i5btFmn+Xq09S5tF21aBPXtO3B8o
	uoDeivQSMg8UpBehG6LGQdejt1zkYxsW8514yPFqxSYKWLlikn7BtCnHzNlw1Z2mZFGnwxXxWv4o9
	eL2t7ti5iYweMHV5IOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIcL-002KtR-30; Thu, 09 Jun 2022 13:54:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIc9-002Kpo-8O; Thu, 09 Jun 2022 13:54:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4890B82DEC;
	Thu,  9 Jun 2022 13:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BF7C34114;
	Thu,  9 Jun 2022 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654782858;
	bh=EqK3l8EhZM8vr8CZoAbl3TZw+eC3UTreMJMI61a6pu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nu066p8wi8D0b/W+KtAIMZXEqf8T5so/ZpPARpp2F80qtM8hICLFVIgHQFkZ6BnDU
	 t5Neeq1Qhx6wQjAPHmQ+nUQqPt8y+RGBiiu+lSmynWCOcFRGvfGsiNjviJ2veJmhyz
	 EW2jUoonxInuUbEktvsPb844zUPaQl4vyrpk7Lg7o0s7jJ45/OjKVakLMMxPW1NzLF
	 37g/d8NyLdPYnQp5Mpr/bQP0rcovdbrKay5aAtNarjj6kIjIqSvTM47G5pTtgfLOYc
	 Dl+R6HHCMTebu5wxbkSEOaLfKXW92LbHmNYnfIDhu4P6Xrw2vJrebP4rb8KV8y7xkp
	 GwOtLKhonzk1w==
Date: Thu, 9 Jun 2022 14:54:11 +0100
From: Will Deacon <will@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RISC-V PMU DRIVERS" <linux-riscv@lists.infradead.org>,
	"moderated list:ARM PMU PROFILING AND DEBUGGING" <linux-arm-kernel@lists.infradead.org>,
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] RISC-V: Support CPUID for risc-v in perf
Message-ID: <20220609135411.GB3064@willie-the-truck>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
 <20220607131648.29439-3-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607131648.29439-3-nikita.shubin@maquefel.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_065421_480931_CE634571 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 07, 2022 at 04:16:45PM +0300, Nikita Shubin wrote:
> From: Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt>
> =

> This patch creates the header.c file for the risc-v architecture and intr=
oduces support for
> PMU identification through sysfs.
> It is now possible to configure pmu-events in risc-v.
> =

> Depends on patch [1], that introduces the id sysfs file.
> =

> Signed-off-by: Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt>
> [Nikita: replaced soc:pmu to riscv-pmu/id]
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> v2->v3:
> - Change 'soc/soc:pmu/id' to 'riscv-pmu/id'
> ---
>  drivers/perf/riscv_pmu.c            | 18 ++++++++
>  tools/perf/arch/riscv/util/Build    |  1 +
>  tools/perf/arch/riscv/util/header.c | 66 +++++++++++++++++++++++++++++

You will need to separate out the kernel changes from the tooling changes in
order to get this merged.

Thanks,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
