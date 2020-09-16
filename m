Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF52EC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFAA221E3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PC+CbdeQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sha7upVR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFAA221E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjEr5Y/yvFhGx0EDegWnvvviZFCsBglwLgpA1NxT85M=; b=PC+CbdeQEX+wz9RFsFLeFg7/1
	86/B5iQ4EgBH+fCMsgybGXf4dKtKCaYeMfAv5RKlttplh1ue501wstEzEMgL+Nw5jXsxCxROUI/yM
	MGsgPXaCQDQ3HNGjqPBn7uqpKIdfhZCOCttwXuwR/JoA5BZKQXQMVBaSqcSy1WiAFRwQSMWdcCBPw
	9MeTcBLDhn/OwgbUqs1F0g2dVSr+cRz/mIMVPZ/k+HDIayAsdci1kns/KBg/FaBApEAdjlAh6l8w7
	O/Y4NL81T2ilZG9p1NV33vVwghBrtgb2xJ/TQdIPgSJH6sDtlPoL164nUwSJZphDxp4Qbm3G6oubL
	2NPFYMuzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIZsv-0005xG-Ie; Wed, 16 Sep 2020 16:02:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIZqc-0004aE-EQ; Wed, 16 Sep 2020 15:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=2L8WeVvRo1osqjjhclSBTpn136Oyr6chq2WMPl65EcM=; b=sha7upVR0ozVlTJFDWdFS4KUrg
 Dlh504xPkCjJ6bcnR0tgQmZYiIutQK/G0ONBD+iomCp+zVQ82oPYqYPfOa29q6UCwl36D+BB9FNFs
 pSeTBdPEiVQz6llxOwpNLZRraxMD45Yt9agHPf8ceWEhufE5EkURg5LtEm+1DjoRnfjJ/WOFs5+4j
 BadKgeBe/qwlbda6A6xYg/rSWFAOIGOJ/+qKGuMxZNBtCJ1ZUglDN7/DVuOWKZv/bNRIhqme65n0j
 CV7jlQDHwCcs1yfZz07j2hPdh6zbICLmsA3R4X5f+JNoZnWPrhrt60ytieQyxK1LeEjJ519udtgbv
 hAy+S0yQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIZqU-0000qm-87; Wed, 16 Sep 2020 15:59:46 +0000
Subject: Re: [PATCH v5 3/5] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20200916073539.3552-1-rppt@kernel.org>
 <20200916073539.3552-4-rppt@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6319035d-73db-4b4d-3fa7-aaa11d3843a0@infradead.org>
Date: Wed, 16 Sep 2020 08:59:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916073539.3552-4-rppt@kernel.org>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mike,


On 9/16/20 12:35 AM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/Kconfig                   |   7 +
>  arch/x86/Kconfig               |   1 +
>  include/uapi/linux/magic.h     |   1 +
>  include/uapi/linux/secretmem.h |   8 +
>  kernel/sys_ni.c                |   2 +
>  mm/Kconfig                     |   4 +
>  mm/Makefile                    |   1 +
>  mm/secretmem.c                 | 264 +++++++++++++++++++++++++++++++++
>  8 files changed, 288 insertions(+)
>  create mode 100644 include/uapi/linux/secretmem.h
>  create mode 100644 mm/secretmem.c
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index af14a567b493..8d161bd4142d 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -975,6 +975,13 @@ config HAVE_SPARSE_SYSCALL_NR
>  config ARCH_HAS_VDSO_DATA
>  	bool
>  
> +config HAVE_SECRETMEM_UNCACHED
> +       bool
> +       help
> +          An architecture can select this if its semantics of non-cached
> +          mappings can be used to prevent speculative loads and it is
> +          useful for secret protection.

Please use tabs instead of spaces for indentation.

> +
>  source "kernel/gcov/Kconfig"
>  
>  source "scripts/gcc-plugins/Kconfig"

> diff --git a/mm/Kconfig b/mm/Kconfig
> index 6c974888f86f..70cfc20d7caa 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -868,4 +868,8 @@ config ARCH_HAS_HUGEPD
>  config MAPPING_DIRTY_HELPERS
>          bool
>  
> +config SECRETMEM
> +        def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED

Use tab above for indentation.

> +	select GENERIC_ALLOCATOR
> +
>  endmenu


thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
