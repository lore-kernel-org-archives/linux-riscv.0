Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09E8D6ACF3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OGJdsEITfvVeFr67Yc3+WwrK+X7M4OoRx1eTDdeeHA=; b=APWWOpd6pz6nf7
	O199TbMuqx7roj1aE/igo4jsZhce7HPzpeu7gt1eVqDoG0BMNvPDvWupCnx/5K+Y6G7rZIwSQ4nMm
	xbkvupURuzW56J0epQB15mJDCX6SuBE2XKiVYF74u/W8O+ewo1IgwC2SO5MXsCVE+fQuZXzV0Mnl3
	6PJVaJaspl/sejYqJRwgbDEh9S3PXDtfVtZwKGj7iwqzUAO0y1yVxI/Xd0LBRcF8LiykBGqbrc1zZ
	iOO6RQKuFhunjLr/GYa8ES5N1RtbboIAfZ9FXEg3qsijFo/VlZ/U+El/CMKYSWHbXcW/K3JoyER1u
	ZVP5aGMEGuX1mRXcW0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCiL-00000008OW8-0PHb;
	Thu, 18 Dec 2025 12:02:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCiJ-00000008OVV-1Q3Z
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 12:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A1F60129;
	Thu, 18 Dec 2025 12:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577E6C4CEFB;
	Thu, 18 Dec 2025 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059354;
	bh=RX3bRnBmhpBc13or7Zw0e7NytvYT8ZV6+njf/aHokrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEW+IUHegTvXC6YsIp5YDGxKhjcCFE6QWykQXEbSEO4Z1PXHYavcyeMkTg4uqJ8nZ
	 ejHYcPvuA5ASP9jFe9iZ3TwAMvle38YKKJSHnGoYwzsVRpI4urQgNRWsJNfUsyZ/5K
	 beNc8V8+rA5WLvJbhxuEcbYE5f2KPDgToQ0wuBD88hVSIPBMdic16GZbxzIFYPkDNP
	 /pDxwW1FThBGzY4cdk8jy0GOP2jGci186EFo/jq1S/Fju+VAbPS+wVNo2blJV7MlS5
	 57qKqEycr2COf62xvyJYM2MFvoPySKgD8nLAKsSwNvtMXP2Wggq2Q+Pw8keIaJvnGy
	 LxYtRqncYAJiA==
Message-ID: <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
Date: Thu, 18 Dec 2025 13:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/18/25 12:41, Sourabh Jain wrote:
> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
> 
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
> 
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
> 
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
> 
> For example, fadump kernel booting with the kernel arguments
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
> following logs:
> 
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
> 
> Even though the logs say that hugetlb support is disabled, gigantic
> hugepages are still getting allocated, which causes the fadump kernel
> to run out of memory during boot.

Yeah, that's suboptimal.

> 
> To fix this, the gigantic hugepage allocation should come under
> hugepages_supported().
> 
> To bring gigantic hugepage allocation under hugepages_supported(), two
> approaches were previously proposed:
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages.
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
> 
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
> 
> To control gigantic hugepage allocation, it is proposed to skip
> processing the hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages_support() returns false.

You could briefly mention the new output here, so one has a before-after 
comparison.

Curious, should we at least add a Fixes: tag? Allocating memory when 
it's completely unusable sounds wrong.

[...]

> +	if (!hugepages_supported()) {
> +		pr_warn("HugeTLB: hugepages unsupported, ignoring default_hugepagesz=%s cmdline\n",
> +			s);
> +		return 0;
> +	}
> +
>   	parsed_valid_hugepagesz = false;
>   	if (parsed_default_hugepagesz) {
>   		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n", s);


LGTM!

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
