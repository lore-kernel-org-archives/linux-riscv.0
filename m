Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03505C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jL460mVatQrd/LS+d/37G9e7b4WtvfMlj/FJ9NTmu9c=; b=yH66sCoOO86M7C
	WwA5vzOA1LpfeHqVb+pUu5yLq2toDdqyeHsLnYRjazsQaDxz4DuRascMiCum/H5lewrzed+X3QZwb
	DAFEYnaOGlcx0VGjUfJCH+tyBmw/2AdDtu/c+/IlZpqDT1uGnhphvDXkv5bgOuzrmYrjqtCW+bnwO
	eYDuc6p9cfDyuN99hOPwdfeb1mvkvlB7pwe8mq+eia/V1DCxoAdyBE7eFQTJh8xREbiAbRQC3z7OR
	hEf7BVMGu4VpCwzqvuj20cRRzr1IryYxghEbM+9wGD6d+g586kU8k2jTub9TiophEo5Cz7KgtDHBK
	p9wN/PAuytiQaJIdiaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHzd-00000007bNv-3oZ9;
	Mon, 15 Apr 2024 08:47:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHza-00000007bMl-2P8S
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 08:47:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 528D7DA7;
	Mon, 15 Apr 2024 01:47:38 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDE163F64C;
	Mon, 15 Apr 2024 01:47:07 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:47:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v2 1/3] riscv: cacheinfo: remove the useless parameter
 (node) of ci_leaf_init()
Message-ID: <ZhzpiWFCSvWWTqxx@bogus>
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240414025826.64025-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_014710_696907_29D725EC 
X-CRM114-Status: UNSURE (   9.08  )
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

On Sun, Apr 14, 2024 at 10:58:24AM +0800, Yunhui Cui wrote:
> The implementation of the ci_leaf_init() function body and the caller
> do not use the input parameter (struct device_node *node), so remove it.
> 
> Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")

Not sure if this can be tagged as fix, but I leave that to RISC-V maintainers.

With the comment in PATCH 2/3 fixed based on your experiment, feel free
to add to the whole series,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
