Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A7CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Message-Id:Subject:From:In-Reply-To:
	Date:To:References:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eDCjl+waXSQ3hdZSUnasHsNphz2Ebo7r11L+1DUWz0=; b=GPiqwMrzwaVwdw
	bDCpOE3SfeAHlnKqwQyQ/141f9GPYh/+b/AQWH8QQGlueqMAev7buUGTmCc5CGn4f/pArjAJMZkgI
	AaMTfbhY/MyjUVKnBVsG0KcX8/Zr7wI0keWXEy2WdyEhSDdZApHCMX/+6ZpngxWhaZJxjqm6JxcRv
	9sQJuSe0mgY6RBGKbmKaDTxQgLnEJ2qpgXZGWVZcK2H/vGnGTICiNbl1bx6ISiBZBvufxXhREe4N+
	tYLgw1idyFYai/LqMV/jsddJFGawwu9P32W0VqKwW8BkiAjbO/XRNkzgjWdN5n+B/5uhZ6hpO7O/5
	RJVXRwxRs5gVG7p3LdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpII-00000001n0B-3E3u;
	Fri, 15 Aug 2025 07:56:10 +0000
Received: from sg-3-12.ptr.tlmpb.com ([101.45.255.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpIC-00000001mxq-1W9y
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 07:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755244556;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=JFpwghLSkeHlDIyCqRaPY0QI7oFLO/bDk8iDSgor+H0=;
 b=JCHaOt79+FpJwMEF7MRFiVBmM7NRIVRO46N9vtxoUBQNCWKKuPHJnhr1vPpzS8NH/c0s/I
 33ez8lQ1GIkU3aGeRNvcisNTor4xcYX4/obXTRhXN9VeCXJMyi5nLH0EiAZAzWBNyHlD62
 GEwqxVMbCRlj3QDclzcpb+Mtdclvs4G7kFh7VICQThkE7567Bup+Wz4J2RVj6SASBmc6o6
 AoBpSQBCWEDINl1b4IkCjPCXKe5LRQRe4RihqqppIEokahkYW+w2P/V0WMKTz8xmxN8L0/
 3eK3aNopCH3jZs/7unM/Isv9V2FBhHK+KLSlUxon8ip2aLd+qxYrylKsjtF6uA==
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
References: <20250716104059.3539482-2-sunilvl@ventanamicro.com>
To: <sunilvl@ventanamicro.com>
Date: Fri, 15 Aug 2025 15:55:41 +0800
In-Reply-To: <20250716104059.3539482-2-sunilvl@ventanamicro.com>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Subject: Re: [PATCH v5 1/3] ACPI: RISC-V: Add support for RIMT
Message-Id: <20250815075541.29941-1-huangxianliang@lanxincomputing.com>
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Fri, 15 Aug 2025 15:55:53 +0800
X-Lms-Return-Path: <lba+2689ee80a+10b7f4+lists.infradead.org+huangxianliang@lanxincomputing.com>
Cc: <ajones@ventanamicro.com>, <alex@ghiti.fr>, <anup@brainfault.org>, 
	<apatel@ventanamicro.com>, <atishp@rivosinc.com>, 
	<iommu@lists.linux.dev>, <joro@8bytes.org>, <lenb@kernel.org>, 
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <rafael@kernel.org>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>, 
	<huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_005605_006600_24DCEF03 
X-CRM114-Status: UNSURE (   5.23  )
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

Hi Sunil,

On Wed, 16 Jul 2025 16:10:57 +0530, Sunil V L wrote:
> +	parent = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table, map->dest_offset);
> +
> +	if (node->type == ACPI_RIMT_NODE_TYPE_PLAT_DEVICE ||
> +	    node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX) {
> +		*id_out = map->dest_offset;
> +		return parent;
> +	}

Why do we assign dest_offset to id_out? The dest_offset is the iommu offset, not
a valid deviceid required for platform device in rimt_plat_iommu_map?

Regards,
Xianliang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
