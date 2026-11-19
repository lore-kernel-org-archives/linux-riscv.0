Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F20E606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vxjhQTqO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+715F/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MN63WthzGCczdtorSWkyMQHxfZLCrsVN10OkG2DM6eo=; b=vxjhQTqOMsUWHqlutr3+maJ+hQ
	1rZ1KhMjqNEAQm79SPJoPAkw/fMbNDvIDDAbRjCcGJcTtLayxyE5/Jpvxh1pTyh1vcxHmuPJvIAB5
	2QSGO4hr+Fop5HJXV89hLNkBI/SQNM6q3GKJECYH0bEZ/IuiuUIYVGPT+7WBqNzmMfSJockVVdu/V
	fvhR4I6kLVB5m5k2bFXHLOIHxpGlJP62hEVu1vrObEz+CRj6F4ZlcQiY6nrxEDYPtdctli+eyG0kX
	TC7UbF0rx18zznaRCbfpY416Tc48UmEfU0me1VwI8ninJY5EA2veBF3MSJaGb7Hb8OKIxr+Zg4rLr
	yvT5A9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpZU-0000000AXU9-3VfO;
	Thu, 19 Nov 2026 00:00:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpZT-0000000AXTo-3yZA
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 00:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63CE546DE1;
	Thu, 19 Nov 2026 00:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7371F000C4;
	Thu, 19 Nov 2026 00:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046411;
	bh=95BhZaacN34i0fFF7Kfyb6EieMsIfD7H3uLPE59Ft90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q+715F/+EfgqUhtk6oXjQYPoTDq26lFCum27vHpPitcYeLyac1v55S696Zqb2GJLb
	 Y/g7E4Qzvzq19c/Is7Mfh3MPftXq5qxDbyxH8Do1JGs5H+HmR8abTE5pf3FJ8urcHP
	 n4chz1xJig38lwPuxUQy0tkcA0BDb7x3M+gofU0r2tBtEvGcBej0tJuqcRVyANQFh1
	 E4GASDz5/5/Ex2PKnF6nhmPuNfw1I+R4hABi3+jgDgI580yQwNEP/jceH1LTPzqhhV
	 wKq3l+c/3gXj4/CYmzHex9/CsE9KVCeav4mfwZMN7XDPlkOLD3Wjr4mY+yU5MMJGOQ
	 AzNoW1Oc1Je9g==
Date: Thu, 19 Nov 2026 00:00:00 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan
 <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei
 <cp0613@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua
 Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong
 Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse
 <james.morse@arm.com>, Kornel =?UTF-8?B?RHVsxJliYQ==?=
 <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter Newman
 <peternewman@google.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, Tony
 Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui
 <cuiyunhui@bytedance.com>, Zhanpeng Zhang
 <zhangzhanpeng.jasper@bytedance.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng
 Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <20261119000000.1b43ba35@jic23-hlaptop>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
	<20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 14:06:25 -0800
Drew Fustini <fustini@kernel.org> wrote:

> Add a platform driver for CBQRI capacity controllers described in
> device tree with the riscv,cbqri-capacity-controller compatible.
> 
> The controller node points at the cache it governs with a
> riscv,cbqri-cache phandle. The driver maps the register block, looks
> that cache up in cacheinfo and uses its cache id as the resctrl domain
> id, so the binding does not need to carry a CPU mask. The controller is
> then handed to the CBQRI core, which probes its capabilities and decides
> whether to expose it through resctrl. Only an L2 or L3 cache is
> accepted, since those are the cache levels resctrl has resources for.
> 
> Nothing is vendor-specific and reg is the CBQRI register block itself,
> so any SoC that describes a CBQRI capacity controller in device tree can
> use the driver unchanged.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Tested-by: Zeng Heng <zengheng@picoheart.com>
> Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

Sorry, late to the game and pretty much a drive by review.

Still a few things below that will leave you with more readable
and probably less fragile code.

Jonathan

> diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> new file mode 100644
> index 000000000000..6f3d06c4f74b
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_capacity.c

> +static int cbqri_capacity_probe(struct platform_device *pdev)
> +{

Noted in the ACPI patch that you can save some effort there
by a few tweaks that probably make sense here anyway.

> +	struct device *dev = &pdev->dev;
> +	struct cbqri_controller_info info = {};
> +	struct device_node *cache_np;
> +	struct resource *res;
> +	void __iomem *base;
> +	u32 rcid_count, cache_level, cache_id;
> +	bool found = false;
> +	int cpu, ret;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> +	if (ret) {
> +		dev_err(dev, "missing riscv,cbqri-rcid\n");
It's a probe, use
		return dev_err_probe(dev, ret, "missing riscv,cbqri-rcid\n);
same for all these paths.  Sure we won't defer but it does nice formatting
and tends to save a couple of lines every time!

With the __free() magic, you can do this for all the returns in this
function.

> +		return ret;
> +	}
> +
> +	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
Follow on from glancing at the acpi and then finding this elsewhere in my
inbox.
	struct device_node *cache_np __free(device_node) =
		of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
and drop all the goto iritiations.

> +	if (!cache_np) {
> +		dev_err(dev, "missing riscv,cbqri-cache phandle\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32(cache_np, "cache-level", &cache_level);
> +	if (ret) {
> +		dev_err(dev, "%pOF: missing cache-level\n", cache_np);
> +		goto out_put;
> +	}
> +
> +	if (cache_level != 2 && cache_level != 3) {
> +		dev_err(dev, "%pOF: unsupported cache-level %u\n",
> +			cache_np, cache_level);
> +		ret = -EINVAL;
> +		goto out_put;
> +	}
> +
> +	/*
> +	 * Associate the controller with its cache instance via cacheinfo.
> +	 * The matching cache provides the cache id used as the resctrl
> +	 * domain id.
> +	 *
> +	 * Taking the first leaf at the level is sufficient because a
> +	 * unified cache node yields one cacheinfo leaf and
> +	 * cache_setup_of_node() walks one cache node per leaf past L1, so
> +	 * the first leaf at the level has that level's node as fw_token.
> +	 *
> +	 * get_cpu_cacheinfo_level() returns the leaf only when cacheinfo
> +	 * assigned it an id (CACHE_ID), which the resctrl domain id needs.
> +	 */
> +	cpus_read_lock();
> +	for_each_online_cpu(cpu) {
> +		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> +
> +		if (ci && ci->fw_token == cache_np) {
> +			cache_id = ci->id;
> +			found = true;
> +			break;
> +		}
> +	}
> +	cpus_read_unlock();
> +
> +	if (!found) {
> +		dev_err(dev, "%pOF: no online hart reports an L%u cache with a cache id for this node\n",
> +			cache_np, cache_level);
> +		ret = -ENODEV;
> +		goto out_put;
> +	}
> +
> +	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
> +	info.base = base;
> +	info.addr = res->start;
> +	info.size = resource_size(res);
> +	info.rcid_count = rcid_count;
> +	info.cache_id = cache_id;
> +	info.cache_level = cache_level;
	info = (struct cbqri_controller_info) {
		.type = CBQRI_CONTROLLER_TYPE_CAPACITY,
		.base = base,
		.addr = res->start,
		.size = resource_size,
	...

Might as well as you nicely set everything here.
It's more readable and also makes it clear anything not set
is zeroed without anyone having to go check the = { }; above.


	};
> +
> +	ret = riscv_cbqri_register_cc(&info);
> +	if (ret) {
> +		dev_err(dev, "failed to register capacity controller: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%u, rcid=%u)\n",
> +		 cache_level, &info.addr, cache_id, rcid_count);
> +
> +out_put:
> +	of_node_put(cache_np);
> +	return ret;
> +}



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
