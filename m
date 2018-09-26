Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E3C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 09:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E061020645
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 09:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXK7BHRe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E061020645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6bY+Oumwt1hb6rdLtkIZr175vwEF2HmmKvAj73SjV8=; b=FXK7BHRekL1mKk
	nxBbh46di1Pugb4KKK4F0zaGRJ1YQwrkrs62vjzTk1Jg2BrdestZvUGL1HOmcBYjEqtgVcMsHZabD
	HxbPyr7wYWYGwGeIX7YaGguPysktIVbVnFPD/YU7sHZvUiLhjwjukZa6QDXd7lzRV0Sw6hhJvFPil
	ZzCQISIVsEpmMicIwtTeH9wvQT4XECuTUkSMi+4OyUlqQqeKqbt/kW2GojmldCqu6dYaE6RAcqqQM
	lM1JfdPUAC8plauFZoe71smiCSMe71F921zbwY80AOG3CWqylRE2UJQRu0XwtF2Y8RXVLKRuU8rfe
	WVOLQzL+UuKmxtD1EF8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g56E0-00068w-J2; Wed, 26 Sep 2018 09:35:16 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g56At-0005c4-Fq; Wed, 26 Sep 2018 09:32:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A918EB04E;
 Wed, 26 Sep 2018 09:31:31 +0000 (UTC)
Date: Wed, 26 Sep 2018 11:31:27 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 14/30] memblock: add align parameter to
 memblock_alloc_node()
Message-ID: <20180926093127.GO6278@dhcp22.suse.cz>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-15-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1536927045-23536-15-git-send-email-rppt@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_023203_840765_62A87E8E 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Richard Kuo <rkuo@codeaurora.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Richard Weinberger <richard@nod.at>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Ley Foon Tan <lftan@altera.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926093127.Mp8vwnh6vlUGfbuxX9rYs0VT6thstWNhrZwo2qSdfTU@z>

On Fri 14-09-18 15:10:29, Mike Rapoport wrote:
> With the align parameter memblock_alloc_node() can be used as drop in
> replacement for alloc_bootmem_pages_node() and __alloc_bootmem_node(),
> which is done in the following patches.

/me confused. Why do we need this patch at all? Maybe it should be
folded into the later patch you are refereing here?

> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> ---
>  include/linux/bootmem.h | 4 ++--
>  mm/sparse.c             | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/bootmem.h b/include/linux/bootmem.h
> index 7d91f0f..3896af2 100644
> --- a/include/linux/bootmem.h
> +++ b/include/linux/bootmem.h
> @@ -157,9 +157,9 @@ static inline void * __init memblock_alloc_from_nopanic(
>  }
>  
>  static inline void * __init memblock_alloc_node(
> -						phys_addr_t size, int nid)
> +		phys_addr_t size, phys_addr_t align, int nid)
>  {
> -	return memblock_alloc_try_nid(size, 0, BOOTMEM_LOW_LIMIT,
> +	return memblock_alloc_try_nid(size, align, BOOTMEM_LOW_LIMIT,
>  					    BOOTMEM_ALLOC_ACCESSIBLE, nid);
>  }
>  
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 04e97af..509828f 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -68,7 +68,7 @@ static noinline struct mem_section __ref *sparse_index_alloc(int nid)
>  	if (slab_is_available())
>  		section = kzalloc_node(array_size, GFP_KERNEL, nid);
>  	else
> -		section = memblock_alloc_node(array_size, nid);
> +		section = memblock_alloc_node(array_size, 0, nid);
>  
>  	return section;
>  }
> -- 
> 2.7.4
> 

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
