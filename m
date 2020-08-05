Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA46C433E1
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 13:05:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43A422D07
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 13:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jD8KfiDU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HWXVkRHw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43A422D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=My0gEPMvblVy2M0TDEkvJygvmwK102Z8mZsp6AER2qU=; b=jD8KfiDUPcSu4AepvD/z3X0Bx
	aDFfb6DL3WRZiC/3SLc8envu8yQ0pyNYIMYvmsmHTg/XFFJS4XOz4kkfPvUH2NnVwJdMxM0j9ON1J
	RrGP7//Od9buK4u1wqTEqTKxPhH685dnwqoM3QdpIKIpyi7mXxr+89YOQBuXrwKGjxR7OjzKvp336
	OOuGkvumxyIgmkUpEsNqN23oGbjR/qFBtNVuJn+M0OpQsJnorAR+qbMKEAIiORvKd8kMy7eeSEnST
	2AYxK2KSDmnqV9Wikypi3vUSIW59IcJCGxCXlZRIzAqGkmovxLAmo6nb7ym9AX8hobD71Eae/F1mf
	xTxFXlLJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3J6v-0002Nt-Iu; Wed, 05 Aug 2020 13:05:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3J6u-0002Nb-2t; Wed, 05 Aug 2020 13:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=da1gRr0zZ2t7B4lRqNuRkoPDQjMi6ltCJuE8Al1tVCE=; b=HWXVkRHwN832dRG05UXHB0oBIw
 bVIHmST3idcP9ekdGW3zfjwF0Pw9NtKHZriMtDEWG2IfLDr6OCBzltDSMhOl6UaR4VB+MKj5TLP04
 D+y2OfSJNRXduO2wurxCTyIhNrEbjOfxiC3fQ9kowloxLDsXYz+qNZBWskWkV4r67YJb5rni6tnxu
 zEaPdgkZf+diFOhUAogaiUm5PlxPfMHj+JY1pUqMrnKYwv3swkoiKxzB+3OAJw82jZfkAD5C/RvSG
 ZSbD7oGskSaQ/+z+rKi6n9bG70XhVIbZNtZ+0+ODNHwM6cKpRLNKr0S7UXSrAbxLcx/udZsOs7w26
 cmMvbHww==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3J6n-0003pL-49; Wed, 05 Aug 2020 13:05:31 +0000
Subject: Re: [PATCH v3 3/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <20200804095035.18778-1-rppt@kernel.org>
 <20200804095035.18778-4-rppt@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1f52d43e-29e4-b175-73d5-0aa3c3e79f23@infradead.org>
Date: Wed, 5 Aug 2020 06:05:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804095035.18778-4-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
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
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/4/20 2:50 AM, Mike Rapoport wrote:
> diff --git a/mm/Kconfig b/mm/Kconfig
> index f2104cc0d35c..8378175e72a4 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -872,4 +872,8 @@ config ARCH_HAS_HUGEPD
>  config MAPPING_DIRTY_HELPERS
>          bool
>  
> +config SECRETMEM
> +        def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED

use tab above, not spaces.

> +	select GENERIC_ALLOCATOR
> +
>  endmenu


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
