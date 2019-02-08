Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CABC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1258821916
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XiLgJ3hl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1258821916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLjpkNuNE/n/ZhGrYOug56mRMxIr7f5I49sclC3fC0I=; b=XiLgJ3hlzvSh+k
	hB59kAb40DFY9HxjzRRgt/9Htub2mte3IZACWNUMjhjcHCKw8qZ0hlH1fOUu45BrW2xzcdC0ffHSW
	HLIeU8dh26LDVVhQybamc5ocvbLqIH0DUrT1TjJWTR2OsywyMeQFy9EcD3lPBHKH3Irf8tGz1aFl8
	Nc5O03u7iWq3/NyWmdD3HVYS4JKyNkijRwplvZy2jneeojAZyW2V++Kz+GO7ovv6+uKxwCQlpfmVd
	fTYHaqP2OfdB7lD+AMOVceL3U9R7bHSR/BiF162NKn8YuEQZg3o18Rh+hFLB/HlC3sBAZvi84tZcw
	nrPaSDr10y8LNIkv26Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs245-0004dn-GQ; Fri, 08 Feb 2019 09:03:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gs244-0004dZ-Js; Fri, 08 Feb 2019 09:03:16 +0000
Date: Fri, 8 Feb 2019 01:03:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v3 PATCH 2/8] RISC-V: Move cpuid to hartid mapping to SMP.
Message-ID: <20190208090316.GB16932@infradead.org>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-3-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1549590681-24125-3-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Patrick =?iso-8859-1?Q?St=E4hlin?= <me@packi.ch>, linux-kernel@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 07, 2019 at 05:51:15PM -0800, Atish Patra wrote:
> Currently, logical CPU id to physical hartid mapping is
> defined for both smp and non-smp configurations. This
> is not required as we need this only for smp configuration.
> The mapping function can define directly boot_cpu_hartid
> for non-smp use case.

Please use up your available 72 chars for the changelog.  (probably also
in other patches).

> 
> The reverse mapping function i.e. hartid to cpuid can be called
> for any valid but not booted harts. So it should return default
> cpu 0 only if it is a boot hartid.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/include/asm/smp.h | 14 +++++++++++---
>  arch/riscv/kernel/setup.c    |  9 ---------
>  arch/riscv/kernel/smp.c      |  9 +++++++++
>  3 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 41aa73b4..21fd2d75 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -22,12 +22,13 @@
>  /*
>   * Mapping between linux logical cpu index and hartid.
>   */
> -extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> -#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>  
> +extern unsigned long boot_cpu_hartid;
>  struct seq_file;

We usually try to keep forward declatations at the top of the file.

Can you add the new external declaration below the forward one?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
