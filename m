Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C316AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09m6KeLBHbg/krneX9PdUFLfl+7E1QNu+Gdg2wgS4oQ=; b=GM+oYXigGhvSFs
	V0LRt2E66j33MAiPZwiPIIbDItrFQCPU5Y/5QuvesOj2p3E70OPiWBOl+AVimcCiq8c0Xi+ExQZya
	1gn/oCwhMrwfqMUdu+orPH5wFXKFSLKoDl+GZit/fKsh58L82epvT522kcG375NwrzNTiNcJmy7Nw
	h0DyxkL7TxphjGsAVWu8G9dpwE9oDx0e2c+2vor2aUMtJIJFKNx4VknrJPsS4B/YYWkWBlSEGXke+
	ya1y+fbyadnuw1dSzInYWK3Oz9J6k75eOnV6upzfOSdlHneVhTZG8J5CFo+AYkYy/a3r3muyC2fyr
	qgJotjELJWedvgSgqnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFMT-00DjOL-Pk; Wed, 01 Jun 2022 03:49:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFMJ-00DjMG-Go
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654055362;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZG0/fOlftf51d/HCO+fdLg9BUlxBwfKtSrN1+VicIE=;
	b=gJDVll1kfTQ2XeWPLViXlbmbZvX8IenFuskM9PoCS8kVF0p1BeZg+YEhZBeKpaLjWQC9RG
	9eo7O9IJKLg7T+UjEnjFrgiSr6K0lH2MXvMbbuUr26OzGa3YUSkMBxitLj8rs/R8J+df2f
	ky0Zy6BkkvQFI2gZqLzpUSZx6QkFVEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-76I8nYocM8SXstKquykPdQ-1; Tue, 31 May 2022 23:49:17 -0400
X-MC-Unique: 76I8nYocM8SXstKquykPdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 469F7107EA01;
	Wed,  1 Jun 2022 03:49:16 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22985492C3B;
	Wed,  1 Jun 2022 03:49:10 +0000 (UTC)
Subject: Re: [PATCH v3 00/16] arch_topology: Updates to add socket support and
 fix cluster ids
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5258e7c2-7829-af20-6416-1a40a09d1917@redhat.com>
Date: Wed, 1 Jun 2022 11:49:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-1-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_204923_661790_F2E398BD 
X-CRM114-Status: GOOD (  36.25  )
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
Reply-To: Gavin Shan <gshan@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sudeep,

On 5/25/22 4:14 PM, Sudeep Holla wrote:
> This version updates cacheinfo to populate and use the information from
> there for all the cache topology. Sorry for posting in the middle of
> merge window but better to get this tested earlier so that it is ready
> for next merge window.
> 
> This series intends to fix some discrepancies we have in the CPU topology
> parsing from the device tree /cpu-map node. Also this diverges from the
> behaviour on a ACPI enabled platform. The expectation is that both DT
> and ACPI enabled systems must present consistent view of the CPU topology.
> 
> Currently we assign generated cluster count as the physical package identifier
> for each CPU which is wrong. The device tree bindings for CPU topology supports
> sockets to infer the socket or physical package identifier for a given CPU.
> Also we don't check if all the cores/threads belong to the same cluster before
> updating their sibling masks which is fine as we don't set the cluster id yet.
> 
> These changes also assigns the cluster identifier as parsed from the device tree
> cluster nodes within /cpu-map without support for nesting of the clusters.
> Finally, it also add support for socket nodes in /cpu-map. With this the
> parsing of exact same information from ACPI PPTT and /cpu-map DT node
> aligns well.
> 
> The only exception is that the last level cache id information can be
> inferred from the same ACPI PPTT while we need to parse CPU cache nodes
> in the device tree.
> 
> P.S: I have not cc-ed Greg and Rafael so that all the users of arch_topology
> agree with the changes first before we include them.
> 
> v2[2]->v3:
> 	- Dropped support to get the device node for the CPU's LLC
> 	- Updated cacheinfo to support calling of detect_cache_attributes
> 	  early in smp_prepare_cpus stage
> 	- Added support to check if LLC is valid and shared in the cacheinfo
> 	- Used the same in arch_topology
> 
> v1[1]->v2[2]:
> 	- Updated ID validity check include all non-negative value
> 	- Added support to get the device node for the CPU's last level cache
> 	- Added support to build llc_sibling on DT platforms
> 
> [1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com
> [2] https://lore.kernel.org/lkml/20220518093325.2070336-1-sudeep.holla@arm.com
> 
> Sudeep Holla (16):
>    cacheinfo: Use of_cpu_device_node_get instead cpu_dev->of_node
>    cacheinfo: Add helper to access any cache index for a given CPU
>    cacheinfo: Move cache_leaves_are_shared out of CONFIG_OF
>    cacheinfo: Add support to check if last level cache(LLC) is valid or shared
>    cacheinfo: Allow early detection and population of cache attributes
>    arch_topology: Add support to parse and detect cache attributes
>    arch_topology: Use the last level cache information from the cacheinfo
>    arm64: topology: Remove redundant setting of llc_id in CPU topology
>    arch_topology: Drop LLC identifier stash from the CPU topology
>    arch_topology: Set thread sibling cpumask only within the cluster
>    arch_topology: Check for non-negative value rather than -1 for IDs validity
>    arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
>    arch_topology: Don't set cluster identifier as physical package identifier
>    arch_topology: Drop unnecessary check for uninitialised package_id
>    arch_topology: Set cluster identifier in each core/thread from /cpu-map
>    arch_topology: Add support for parsing sockets in /cpu-map
> 
>   arch/arm64/kernel/topology.c  |  14 -----
>   drivers/base/arch_topology.c  |  92 +++++++++++++++++----------
>   drivers/base/cacheinfo.c      | 114 +++++++++++++++++++++-------------
>   include/linux/arch_topology.h |   1 -
>   include/linux/cacheinfo.h     |   3 +
>   5 files changed, 135 insertions(+), 89 deletions(-)
> 

I tried this series on virtual machine where ACPI is enabled and looks good.
Especially for PATCH[10], resolving the issue I have. So I provided my tested-by
tag for it. Besides, I checked the changes related to ACPI part and looks to
me either after the mentioned nits fixed. I leave the changes related to device-tree
to be reviewed by the experts :)

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
