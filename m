Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B7C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYosbvBHcDVY/1LtHwNUjalpJ3i79l+U3rJYbrqEU4k=; b=twU66l6+jD2Tfw
	2hwz6mu20G0YKI5dMJ4DKiqsk9883KRGj1zxlA1eQoMRW6rS5tfvRAQzsEjj7D7E/QZ7tgUsOTisl
	g7OpZQ0JIR79jS7fs8gET1qPkmH60OxNxYkkF8SmPznOC6p/pIWWxlgsl2OIGyvBZdRi4Yy8uIcUg
	SSgHzQtze5Xi7MRIUe8R7fLgsOiaw2cK3M3XnpVzx70LFYtAM3rMBMVpGG6XXJc/cyD5lay2Vgfnv
	YrmAFFGCNDWi5VGHlCQR8Zp7wEH1rnv5lRHRnZBZcNwt7WMCq6xSL9w8kbjJ62BUILuDgudyB+UPq
	KcW/dJ9nfo9ppuWayEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfIM-0000000BdhD-1YyV;
	Tue, 16 Apr 2024 09:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfIJ-0000000Bdgf-1XjZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 09:40:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E70441063;
	Tue, 16 Apr 2024 02:40:30 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8941D3F792;
	Tue, 16 Apr 2024 02:40:00 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:39:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	Sudeep Holla <sudeep.holla@arm.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	bhelgaas@google.com, james.morse@arm.com, jhugo@codeaurora.org,
	jeremy.linton@arm.com, john.garry@huawei.com,
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com,
	tiantao6@huawei.com
Subject: Re: [PATCH v3 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <Zh5HbV_M6wOdf9QN@bogus>
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
 <20240416031438.7637-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416031438.7637-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_024003_743706_B886946F 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 16, 2024 at 11:14:37AM +0800, Yunhui Cui wrote:
> Before cacheinfo can be built correctly, we need to initialize level
> and type. Since RSIC-V currently does not have a register group that
> describes cache-related attributes like ARM64, we cannot obtain them
> directly, so now we obtain cache leaves from the ACPI PPTT table
> (acpi_get_cache_info()) and set the cache type through split_levels.
>
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>

I had already given the reviewed-by for the series, anyways here we go again:

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
