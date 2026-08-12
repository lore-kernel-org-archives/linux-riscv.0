Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B56C5AC67
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rgcs4rUqvn0YqtGo9rhs3rmpxXFauv8AJsCDMFc9ofs=; b=cvr/X1dO+pmRp8
	dbUAO7VZ/5OnfWWaK8xvLgD4szV0ZHrznc1pl25HguwxbIAPQd5PoOnb1nBmhLyirW9/dHISGMSr7
	Z6NxhnWc5ooFwj1fNYCxHjawhLcYNclWYyhyM1aKu+7TjD20S/ix/3F5H9o7NWZdPY46N5iogZpBu
	P/65eb/kqwxR1nNJT3arLvhRF/jxScHZ+BTtg+e0XedMDrmEA74zzx0TnBrp+33SrnDZ+IGiu1USD
	A9DTt6kHwr5/XFKTBSYyTCoYTdZF7ii3KZBKPDj9yYwVouRnV0uv62oFQOyZTW5C8l2Kz+XjtqZLU
	rTb8KfnY3/xsDkjpDziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyYg-0000000FGGc-3JWa;
	Wed, 12 Aug 2026 02:19:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyYf-0000000FGGK-3IlF
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 02:19:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BE1D4093E;
	Wed, 12 Aug 2026 02:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FDC1F000E9;
	Wed, 12 Aug 2026 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786501148;
	bh=ycLlSOHTauxo4PZFYfru/N1BjjuXsszYlQ61e8B13FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNdNZeAOTmL3g1Q5f+zq4R+xp1YeQQortTkMT0z7ccREjUF0IUtWx04ovwNbjShWg
	 qPjNk7jrLRV8UOYUX6eUDwqgIg6Ly4YIyx4kS/zij1c/e0KSdPKyU7DLf6INYqIhL+
	 RKlVAk5n+BLOWEzD65T1VUfCImRT6SaTAb9PW7fara1QBzt8GNkF8E5rgZelRYxzIV
	 gKtG+XeQwW2NWQ8Vs8PQFwl8AfJ0QuUGuvbH77ZALY2FZSWi9iowSRXoLrp1gTGFR0
	 eaaZyv6IpvMShZJynGMEn+iSboKMwe8XoW7knKBTFZtmUyzoDz6D+RJ34e+1ed/IuW
	 8PTxG5rAC1qVg==
Date: Tue, 11 Aug 2026 19:19:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net,
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 3/7] resctrl: Add a devices file for external
 requester assignment
Message-ID: <anvYGuNF3MC//Q94@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-4-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-4-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:53PM +0800, Zhanpeng Zhang wrote:
> Do not overload the resctrl tasks file with architecture-specific
> non-PID tokens. The tasks ABI remains a list of task IDs, while the new
> devices file carries external requesters assigned to a resctrl group.
> 
> Add architecture hooks for assigning and showing those external
> objects, and reject group removal, reparenting, or pseudo-lock setup
> while devices are still assigned. The teardown path performs a
> best-effort reset to the default group.
> 
> The devices file is an assignment interface only. It does not describe
> a new resource schema or domain; resource allocation and monitoring
> policy remain described by the existing schemata and info files.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  Documentation/filesystems/resctrl.rst |  26 ++++
>  arch/Kconfig                          |   6 +
>  fs/resctrl/rdtgroup.c                 | 206 +++++++++++++++++++++++++-
>  include/linux/resctrl.h               |  45 ++++++
>  4 files changed, 280 insertions(+), 3 deletions(-)
[..]
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index af2cbab14497..2e424c911049 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
[..]
> @@ -2067,6 +2236,16 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdtgroup_tasks_show,
>  		.fflags		= RFTYPE_BASE,
>  	},
> +#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
> +	{
> +		.name		= "devices",
> +		.mode		= 0644,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.write		= rdtgroup_devices_write,
> +		.seq_show	= rdtgroup_devices_show,
> +		.fflags		= RFTYPE_BASE,

Once CONFIG_ARCH_HAS_RESCTRL_DEVICES is built in, the file shows up in
every resctrl group directory, even on hardware whose IOMMU does not
implement QOSID. I think it would be better to make fflags zero so
rdtgroup_add_files() skips it, and enable it at runtime from
resctrl_init().

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
