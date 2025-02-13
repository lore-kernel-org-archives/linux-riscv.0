Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99445C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hnfs8dRsEKNQP/ppq9wzdnbKzlvRwsdqBqJnq7rdFpI=; b=qtk/nwvZ6pBU14
	BQ8Jd1UplFBkgnhsgJUK4VtFaaxqvVCOQkWwo1frLm2oxAaY22lfmPzC30nh+l7UMpw8QMK8pE59k
	NmCU2F8O4fLGFvTyHlJGC8nPjMysDUnOgYUgtFb/MST/pyBg0vhb/9fjpcbvbXH8VXzjzoD2CsRxF
	5lEso47OFNKVIjOovUgH1z3Vf19EOIgvcwQjcIRmlNDSgrRSE/mK4pxwrc8xxMFeI3SCLu8Q0OeF2
	DGxeqwHfTKqFt4TqWMZDEsy1vWTWJkuw3Dk86xGnASgtyK+dRjwKMfBwtEa6qlWA3ldFgMRpQHK/B
	6ixUwouubaYoCz8yJ7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXOF-0000000AqpL-2rcB;
	Thu, 13 Feb 2025 11:28:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXJR-0000000ApO0-0FRR
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Feb 2025 11:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bx8L+fEhoak9M81sLmQlt1yInYLp0VEidX6HAM3zf8o=; b=dUupcGsgPNsF8jK7JSS0+/76Td
	LpQ3/hq3QZmfvjKMvSjVzAzFs+3A9/zSUi1ExRN4Tn4drqsfaVMglWJrEDirCjxDzMq2ndCBEju0i
	pylGDbG2HB0XFSnatJsIcDeWDvDeJevcVpJoBOwrzaVPQAU4+sFBeLJE58xwc2iKEkrhjHroUVX4O
	rISqa3DMvfdpYOE5XHGWJ0zOzj1gRcacAQLUJFeZdtF0Wln3Xvib8jyfu0urFuR0hoiKyFP/oc97M
	qzNrVok5QV+mbOplJc9urbr3W5uzHZieUJoiB4wEtRQm0QO6jHFeuWLGrb81lQBezrHDnT2aJ+oTa
	Lrc0vKSw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXJN-00000000yEe-26D4
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:23:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4A621756;
	Thu, 13 Feb 2025 03:23:34 -0800 (PST)
Received: from [10.1.32.44] (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58D143F6A8;
	Thu, 13 Feb 2025 03:23:12 -0800 (PST)
Message-ID: <5504fadd-6174-41c4-90a8-d3ae7f76d7f6@arm.com>
Date: Thu, 13 Feb 2025 11:23:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: Make GENERIC_PTDUMP dependent on MMU
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-4-anshuman.khandual@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250213040934.3245750-4-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_112317_871383_DA11CFEE 
X-CRM114-Status: GOOD (  15.02  )
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

On 13/02/2025 04:09, Anshuman Khandual wrote:
> There is no page table dump without a MMU. Make this dependency at generic
> level and drop the same from riscv platform instead.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

As Christophe has pointed out - this is broken. The select will override
the dependency you've added in GENERIC_PTDUMP. Generally have "depends
on" for symbols that are "select"ed is broken. I'd suggest just dropping
this patch.

Steve

> ---
>  arch/riscv/Kconfig | 2 +-
>  mm/Kconfig.debug   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..c4cdba6460b8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -112,7 +112,7 @@ config RISCV
>  	select GENERIC_IRQ_SHOW_LEVEL
>  	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>  	select GENERIC_PCI_IOMAP
> -	select GENERIC_PTDUMP if MMU
> +	select GENERIC_PTDUMP
>  	select GENERIC_SCHED_CLOCK
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index a51a1149909a..c08406760d29 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -214,6 +214,7 @@ config DEBUG_WX
>  	  If in doubt, say "Y".
>  
>  config GENERIC_PTDUMP
> +	depends on MMU
>  	bool
>  
>  config PTDUMP_CORE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
