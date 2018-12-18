Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE78C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 23:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D806520869
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 23:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wr64OZ4E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="C3JQgWSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D806520869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFIMdeR6xyiyrKFqqlTnBRk1LQE2OZvuaZwIrjbXAHA=; b=Wr64OZ4Er+DTosl+HlWCb4p81
	1R+wdoRM0zZCqUDu6JiCPNzAM9p3H/IU05jwwJ0oLJNnqujX7Z2gSjLEd/+lufRPqZxPTcDy7/4Oh
	zrMJvIkv0yOt7aPT4c5q3SdyUeJvbHZYdcal3MWS+nXybtSGmfFMg/uYQMLqVQ+vPml2d/Fc+Ymr7
	UIpEKIN0B40ZrdmO48WpM+QzPgXwia8KnJgDrCLs5cZkhPYxgPQmdSoq1dE6faCx9YGMaB+nS6I+x
	nEbvH+FQB9NoAIhmBdpb7XWRuBOg0UycDwWbnMMW4WJuPpa6JtTi7TN675X+mrakljgLZdevET6a9
	fH1uag/Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZPDk-0000oj-OU; Tue, 18 Dec 2018 23:56:16 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZPDh-0000nh-GC
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 23:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545177373; x=1576713373;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y2b/sktj+XFBb0QeOZRsAE7cZ9vVpwFIlsMXq0GYU9o=;
 b=C3JQgWSWOm5jh89RAItXMPfkZhitUfRRE1gX/BbrhJwntD+E8j1rSUxO
 y37qz7p+oyp1MSeBTgOPjMZGAyNxlWhw/BT17utOIR79NHYcHKkdltjrT
 fOpuSnTas8NdlckJUwwXvi+7eke93oK9T5RXdMeR/N3gEibA7j9w2HtGA
 B142myYQJ8aGUJm6yFJDQDzyiTUo+22eQXloWu9tJeJ2EtQ5gGBI2taf1
 Z5eu9ap82Out7IPyi/JS9vesGEuzryu3yf6ay+tHIB9FY6EQUY1Lh7CD5
 hX/+Lv6pO0xG7H2OpfQonpSIKUNPhHonIztMwLY3LOkl0JiWE1IsEjv4H w==;
X-IronPort-AV: E=Sophos;i="5.56,370,1539619200"; d="scan'208";a="201619268"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2018 07:55:43 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 18 Dec 2018 15:37:49 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Dec 2018 15:55:44 -0800
Subject: Re: [PATCH] RISC-V: Fix of_node_* refcount
From: Atish Patra <atish.patra@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
Message-ID: <99bcf158-80f2-efa8-cbcb-01493185852d@wdc.com>
Date: Tue, 18 Dec 2018 15:55:42 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_155613_661014_A233C4FE 
X-CRM114-Status: GOOD (  19.52  )
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
Cc: "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "schwab@suse.de" <schwab@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/20/18 3:07 PM, Atish Patra wrote:
> Fix of_node* refcount at various places by using of_node_put.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/kernel/cacheinfo.c  | 11 +++++++++++
>   arch/riscv/kernel/cpu.c        |  1 +
>   arch/riscv/kernel/cpufeature.c |  2 ++
>   arch/riscv/kernel/perf_event.c |  1 +
>   arch/riscv/kernel/smpboot.c    |  6 +++++-
>   5 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index cb35ffd8..638dee3f 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -28,6 +28,7 @@ static int __init_cache_level(unsigned int cpu)
>   {
>   	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	struct device_node *np = of_cpu_device_node_get(cpu);
> +	struct device_node *prev = NULL;
>   	int levels = 0, leaves = 0, level;
>   
>   	if (of_property_read_bool(np, "cache-size"))
> @@ -39,7 +40,10 @@ static int __init_cache_level(unsigned int cpu)
>   	if (leaves > 0)
>   		levels = 1;
>   
> +	prev = np;
>   	while ((np = of_find_next_cache_node(np))) {
> +		of_node_put(prev);
> +		prev = np;
>   		if (!of_device_is_compatible(np, "cache"))
>   			break;
>   		if (of_property_read_u32(np, "cache-level", &level))
> @@ -55,8 +59,10 @@ static int __init_cache_level(unsigned int cpu)
>   		levels = level;
>   	}
>   
> +	of_node_put(np);
>   	this_cpu_ci->num_levels = levels;
>   	this_cpu_ci->num_leaves = leaves;
> +
>   	return 0;
>   }
>   
> @@ -65,6 +71,7 @@ static int __populate_cache_leaves(unsigned int cpu)
>   	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
>   	struct device_node *np = of_cpu_device_node_get(cpu);
> +	struct device_node *prev = NULL;
>   	int levels = 1, level = 1;
>   
>   	if (of_property_read_bool(np, "cache-size"))
> @@ -74,7 +81,10 @@ static int __populate_cache_leaves(unsigned int cpu)
>   	if (of_property_read_bool(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
>   
> +	prev = np;
>   	while ((np = of_find_next_cache_node(np))) {
> +		of_node_put(prev);
> +		prev = np;
>   		if (!of_device_is_compatible(np, "cache"))
>   			break;
>   		if (of_property_read_u32(np, "cache-level", &level))
> @@ -89,6 +99,7 @@ static int __populate_cache_leaves(unsigned int cpu)
>   			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}
> +	of_node_put(np);
>   
>   	return 0;
>   }
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3a5a2ee3..7b3eb970 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -155,6 +155,7 @@ static int c_show(struct seq_file *m, void *v)
>   	    && strcmp(compat, "riscv"))
>   		seq_printf(m, "uarch\t\t: %s\n", compat);
>   	seq_puts(m, "\n");
> +	of_node_put(node);
>   
>   	return 0;
>   }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0339087a..a6e369ed 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -56,8 +56,10 @@ void riscv_fill_hwcap(void)
>   
>   	if (of_property_read_string(node, "riscv,isa", &isa)) {
>   		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
> +		of_node_put(node);
>   		return;
>   	}
> +	of_node_put(node);
>   
>   	for (i = 0; i < strlen(isa); ++i)
>   		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
> index a243fae1..667ee70d 100644
> --- a/arch/riscv/kernel/perf_event.c
> +++ b/arch/riscv/kernel/perf_event.c
> @@ -476,6 +476,7 @@ int __init init_hw_perf_events(void)
>   
>   		if (of_id)
>   			riscv_pmu = of_id->data;
> +		of_node_put(node);
>   	}
>   
>   	perf_pmu_register(riscv_pmu->pmu, "cpu", PERF_TYPE_RAW);
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 18cda0e8..fc185eca 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -57,12 +57,15 @@ void __init setup_smp(void)
>   
>   	while ((dn = of_find_node_by_type(dn, "cpu"))) {
>   		hart = riscv_of_processor_hartid(dn);
> -		if (hart < 0)
> +		if (hart < 0) {
> +			of_node_put(dn);
>   			continue;
> +		}
>   
>   		if (hart == cpuid_to_hartid_map(0)) {
>   			BUG_ON(found_boot_cpu);
>   			found_boot_cpu = 1;
> +			of_node_put(dn);
>   			continue;
>   		}
>   
> @@ -70,6 +73,7 @@ void __init setup_smp(void)
>   		set_cpu_possible(cpuid, true);
>   		set_cpu_present(cpuid, true);
>   		cpuid++;
> +		of_node_put(dn);
>   	}
>   
>   	BUG_ON(!found_boot_cpu);
> 

ping ?

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
