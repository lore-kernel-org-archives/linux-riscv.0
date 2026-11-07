Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C69606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2Eab6qG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=HTybT7DT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OsDoFzJyHBIoU1PNHeFEf2Zm+APYnZXdHml+gUB6EyE=; b=M2Eab6qGlWiLKDcKwQK6IR9Ke0
	T5C/G08ouZb/2/K0PYW8V7wBwLUzVyLIryk30k/nmhcuACUNsMs4A2tOuR+Ae2uAz1V+99QUZYeH0
	8lryLqVJw2ce7gscv+jA0g/Vw+UogjxSW6MZ+qqoZB0MfKjPMemVNoqVbo3McYlZuEe0yrHIY1N6o
	Uc1LIPP7skyH2q4cfcsd3uFubYTC4FC0GcGpLZ5QYPY/3wa971+z0i0ZdruqsUY9sgdbhaThKcOyT
	9S78x5McIYqVVZ3qzzSqI3RhlkUlZY2trcwvym/TZmb1sIdodq1gwPnlP0F2JGeBLJ5XsLXYhp2MS
	SJx6GP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXx5-0000000EB25-2jvd;
	Sat, 07 Nov 2026 04:22:51 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXx2-0000000EB1g-3CZH
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 04:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794025362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wlygg3ErILvMjlgvg/tjexSb8yjv/A4ciW54erY9Jg5Rf0wnqcHfSK/239ZrL9kgPyVwD/hh4l0B11Rl8jBWPRPpMMWw9Opqnv909KuxvOy46XqIZoAJbQdKzngzOGn0KBFkrc7+QUdHAvtsqvZEBl/8XjIARBSqXe5Jk0RAdjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794025362; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5IRK5++d8vkxxLfiNyIoLEIgRBhFubpsN36OkQPt33Y=; 
	b=BhI25Fl2KcB3GoVotOc4vGDSt/xOKVchTH6uz/3ijSFMM35qsNsuzZL6giuTLy1hYsN6ayzIhiHW7aojk+mJ1no9a/EdS9qkn+oLiQlGrS5fWQmx6k18FfNo9sVLrjqp6+cJlnide7PLGzczgUdYsWc0vbKnWoVU3WRzoX2AZM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=HTybT7DTZcTX86rpyM57RsTGumP26evQIPCA8S8YB17PqJR2itRoiIaUYikzL4gmqZITm7ZokpkGewxLnP6TCo1zzmjo+f8VSamnm8ymJtCZWGVsE+SiohEHqw7hB4NILaTadqg8Cu3Nk7i6W1/ScdubgUOR6KNseSgSsicwK+I=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=5IRK5++d8vkxxLfiNyIoLEIgRBhFubpsN36OkQPt33Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794025360505186.3136085299359;
	Fri, 6 Nov 2026 20:22:40 -0800 (PST)
Date: Sat, 7 Nov 2026 04:22:32 +0000
From: Yao Zi <me@ziyao.cc>
To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <au6niF5xiqj7cqJ4@pie>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106060525.346873-3-duge1256@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.18.53
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_202249_361428_9B8FEB23 
X-CRM114-Status: GOOD (  24.31  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 02:05:24PM +0800, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve reads
> from the snapshot and use keepouts for the remaining register ranges.
> Keep the AES_WTM clock enabled and its shared reset deasserted while the
> provider is registered.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/nvmem/Kconfig             |  14 +++
>  drivers/nvmem/Makefile            |   1 +
>  drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
>  4 files changed, 167 insertions(+)
>  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

...

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236663..28d6c59fbd74 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-snvs-lpgpr.
>  
> +config NVMEM_SPACEMIT_K3_EFUSE
> +	tristate "SpacemiT K3 eFuse support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	depends on COMMON_CLK && RESET_CONTROLLER
> +	help
> +	  Say Y here to read configuration and calibration data from the
> +	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
> +	  the shadow registers before Linux starts. Programming and reloading
> +	  the fuses are not supported.

I didn't read K3's TRM, but is there a reason to depend on the
bootloader to do so? We should depend on the state set up by bootloaders
as less as possible, I think.

> +	  This driver can also be built as a module. If so, the module will
> +	  be called spacemit-k3-efuse.
> +

...

> diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
> new file mode 100644
> index 000000000000..d106053beae8
> --- /dev/null
> +++ b/drivers/nvmem/spacemit-k3-efuse.c

...

> +static int k3_efuse_probe(struct platform_device *pdev)
> +{

...

> +	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
> +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> +			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
> +
> +			put_unaligned_le32(val, efuse->data[bank] + i);

Does memcpy_fromio() works for the device? Otherwise, you could define
efuse->data as an array of u32 instead of u8, so it keeps aligned and
you could do a simple assignment here. Reading from efuse->data is
always ok since memcpy() is used.

> +		}
> +	}

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
