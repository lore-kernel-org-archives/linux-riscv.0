Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94630C678D4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO9O9WpN35nta6ysX4d56CBeGJSq50rob+tmlt1UrxM=; b=r/zy73+1Y2VCMF
	WbtI334onLuz8RIO/fK5pDnlPNqc9lrdYXyZwqwsiLVVOQt5xIMZLnEEVe1mGb07GrAmYFegvkpMI
	0BYoSF2ldT0bVHe+TRMFTlGdd9CvIKYWjFmVdCDgQzh5Og1+nsafrwBVRCv6PKJlX1L0j3yjhPPAN
	Dz1GuYSj66UfzE7966b+yTh2KY1XOeNQFvHseYfKrHGKpE1habPyL8ifEK/sTt2zSXZwNmqjhz0/p
	D+67pzuqCNUJaSzQuVhm52Dct8SLv93GcZuty7Lqzj5tEYVzO8a+DCgiWsxp9Rh8DorltFJod7Cuc
	lechTT27lVMPrxIfvbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI77C-000eD8-IL; Wed, 18 Jan 2023 12:00:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI76t-000e2i-Ku; Wed, 18 Jan 2023 12:00:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600C51477;
	Wed, 18 Jan 2023 04:00:44 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17CEF3F71A;
	Wed, 18 Jan 2023 03:59:59 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Len Brown <lenb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-acpi@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] arch_topology: Build cacheinfo from primary CPU
Date: Wed, 18 Jan 2023 11:55:59 +0000
Message-Id: <167404285593.885445.6219705651301997538.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104183033.755668-1-pierre.gondois@arm.com>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_040007_770243_FD479C4C 
X-CRM114-Status: UNSURE (   8.99  )
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

On Wed, 4 Jan 2023 19:30:23 +0100, Pierre Gondois wrote:
> v2:
>  - Applied renaming/formatting comments from v1.
>  - Check CACHE_TYPE_VALID flag in pppt.c.
> v3:
>  - Applied Sudeep's suggestions (for patch 5/5):
>    - Renaming allocate_cache_info() -> fecth_cache_info()
>    - Updated error message
>    - Extract an inline allocate_cache_info() function
>  - Re-run checkpatch with --strict option
> v4:
>  - Remove RISC-V's implementation of init_cache_level() as not
>    necessary.
>  - Add patch: 'cacheinfo: Check 'cache-unified' property to count
>    cache leaves' to increase the number of leaves at a cache level
>    when no cache-size property is found.
>  - In cacheinfo: Use RISC-V's init_cache_level() [...],
>    make 'levels', 'leaves' and 'level' unsigned int to match
>    of_property_read_u32()'s parameters signedness.
> 
> [...]

Applied to sudeep.holla/linux (for-next/cacheinfo), thanks!

[1/6] cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation
      https://git.kernel.org/sudeep.holla/c/c3719bd9eeb2
[2/6] cacheinfo: Return error code in init_of_cache_level()
      https://git.kernel.org/sudeep.holla/c/8844c3df001b
[3/6] cacheinfo: Check 'cache-unified' property to count cache leaves
      https://git.kernel.org/sudeep.holla/c/de0df442ee49
[4/6] ACPI: PPTT: Remove acpi_find_cache_levels()
      https://git.kernel.org/sudeep.holla/c/fa4d566a605b
[5/6] ACPI: PPTT: Update acpi_find_last_cache_level() to acpi_get_cache_info()
      https://git.kernel.org/sudeep.holla/c/bd500361a937
[6/6] arch_topology: Build cacheinfo from primary CPU
      https://git.kernel.org/sudeep.holla/c/5944ce092b97

--
Regards,
Sudeep


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
