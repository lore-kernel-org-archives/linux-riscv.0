Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D7ECAC5A0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ull/7A+GsEI8JY70Gu9dQaE4yx7DNpyD2jcqu0scssk=; b=26lHS/qnjnYBP2
	8aZ4eRVCw7tJ5I1ONO+C8mpmScGyr5ljTSvEDJoXbik11tOZIn7tRL6kLG8f+GuJ7qYoNm+iQ3j5E
	GQf/RDfhgPFfkbWKUOEMjWox66+NW3hzy9p0jSN9q3w3liZw1jD7SorsDjQG29yFTcbcSggqV8lkH
	/Wb6IguL1FHJDa9eQ4u94A1YspxINvM0jZLTANBPx7gHkKrpgkUiOK5uSDX10xg5ScibaLPQ03MJ/
	JjbJUwQ9iNVl+CLYXY1juVJ4UO2MRHh2Jz5TN2/A2IENkgDRhqAwgHX33WVdXcapWYC6wK8m1NXzd
	Vykufgs1qYkAPp6BhmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvsr-0000000DXlZ-3AX7;
	Wed, 17 Sep 2025 17:23:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvsq-0000000DXkc-0A74
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 17:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59A5844E80;
	Wed, 17 Sep 2025 17:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19270C4CEFB;
	Wed, 17 Sep 2025 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129835;
	bh=AEjr09QcVFyHfR49Xhj+cZndmHLQP2q4JTzun26NeA8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MAYR6UOjLdo7DFEoGecQvOTeLMCCGup/8ZTPEXVpmzeBHhQM43nAUhEnWIeZ47kdk
	 KmSVPmwpAFZb91dKZs/QxIA6APe9JVMcY8R+FLwqPnckkz7aaD0VGuh4gTfHO3OJbs
	 plKq6+H7mH6Mr/+NdJ3DlWdZRHTDfBxFgXrzRWMeJCrandLTNOqXHWhPpd3MaIBDwR
	 R+HSVON1gLASAjLIHfF9X1m1gaYU8pC+TC6kPJkjlXZHoCpyLLkDZfof0Rg8efdx/A
	 7QYnZEy2gkNaRUl//5T+WXfwKhwd7wKxG+c6cZs8nSg4wa0vpfhTlpMQZK23c8M4uk
	 YTiRT0GUz9thw==
Date: Wed, 17 Sep 2025 11:23:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, hchauhan@ventanamicro.com
cc: xueshuai@linux.alibaba.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-acpi@vger.kernel.org, james.morse@arm.com, tony.luck@intel.com, 
    cleger@rivosinc.com
Subject: Re: [RFC PATCH 1/5] riscv: Define ioremap_cache for RISC-V
In-Reply-To: <20250910093347.75822-2-tianruidong@linux.alibaba.com>
Message-ID: <f15b08a6-84f5-1e5c-79cd-a178037a2f11@kernel.org>
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com> <20250910093347.75822-2-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_102356_097480_864CA9E3 
X-CRM114-Status: UNSURE (   7.25  )
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

On Wed, 10 Sep 2025, Ruidong Tian wrote:

> From: Himanshu Chauhan <hchauhan@ventanamicro.com>
> 
> bert and einj drivers use ioremap_cache for mapping entries
> but ioremap_cache is not defined for RISC-V.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks like nothing should be using ioremap_cache() at all:

  https://lore.kernel.org/linux-riscv/YzQ6pqykLhJVeD2p@infradead.org/#t

Probably best just to fix the ACPI drivers?


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
