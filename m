Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C49EC10F12
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 15:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE4C2147C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 15:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvqoksyC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE4C2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIFkKQY/XJEHjuWOB89uJqAYXX8nvJ0Ey190ipVA3FE=; b=RvqoksyCb+OflG
	zhoCeabKwzGHJt9XidkrUnfpJ0aeEOzBdzkxF9RAnSnstyUhRtCBC5sxpR1O0VocSSz23eT4Vs/fk
	LPcpI1pJb98MqgsuTbX2KwKsTkqYAbBpdCE3asoOm7+IbgJ+VFcxrqoudzJsOqt2p102omWm3XAFx
	LlmO5nomYr0/333MKC1+yjkNVqj9rW2VBte6lPBcAk5jcn3EGX8ZWmadijnQu6+iam78QVO/Y3K9G
	/uDSizjzF8se38OHnfKDtXJB6gX+fKWht8foqYDqxSBR5NwScKwtSZLwiEtuPl8jV+1nYfRermLf4
	kFe1fm5cxQugSLLleNig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG3aO-0005Xq-QS; Mon, 15 Apr 2019 15:31:56 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG3aL-0005XA-Sh
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 15:31:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D08B374;
 Mon, 15 Apr 2019 08:31:53 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BC6F3F68F;
 Mon, 15 Apr 2019 08:31:49 -0700 (PDT)
Date: Mon, 15 Apr 2019 16:31:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Message-ID: <20190415153147.GB28623@e107155-lin>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320234806.19748-5-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_083153_928154_69DD6D8E 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
 Johan Hovold <johan@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Otto Sabart <ottosabart@seberm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-riscv@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
> Currently, ARM32 and ARM64 uses different data structures to
> represent their cpu toplogies. Since, we are moving the ARM64
> topology to common code to be used by other architectures, we
> can reuse that for ARM32 as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/arm/include/asm/topology.h | 22 +---------------------
>  arch/arm/kernel/topology.c      | 10 +++++-----
>  include/linux/arch_topology.h   | 10 +++++++++-
>  3 files changed, 15 insertions(+), 27 deletions(-)
>

[...]

> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index d4e76e0a..7c850611 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>  struct cpu_topology {
>  	int thread_id;
>  	int core_id;
> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
> +	int socket_id;

Sorry, but I can't find any reason why we need to do this ifdef dance
here, especially for socket_id vs package_id ? Other's I can understand
as there are new, but I am sure we can find a way and get away with
#ifdefery here completely.

> +#else
>  	int package_id;
>  	int llc_id;
> +	cpumask_t llc_sibling;
> +#endif
>  	cpumask_t thread_sibling;
>  	cpumask_t core_sibling;
> -	cpumask_t llc_sibling;
>  };
>
>  #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>  extern struct cpu_topology cpu_topology[NR_CPUS];
>
> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
> +#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
> +#else
>  #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
> +#endif

Since all callsites must use topology_physical_package_id, we should be
able to rename socket_id to package_id easily.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
