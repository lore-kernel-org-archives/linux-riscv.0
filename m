Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70153C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 01:53:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2852083E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 01:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZ0YW51z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IbOVk80B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBhw3tWR";
	dkim=neutral (0-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBhw3tWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2852083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zL/iP5b7/bmrS9ZIkrYpjkHgywIYJqwkpq4f9dSj3vQ=; b=CZ0YW51zLzx2MSk8jtunjvEch
	yG1JIe6bBzssQYB411L3kS7Bt42KRjk+aqvnqdjt29sqj//73tPfQJxmL46ozeyo5FvEtWNiKIISO
	2pZWCLZkvMXve+XyNB1ceQLHQnKozTNmjhOUC/ZejdLyJyXon9rhuF5vP6DNxPfkMdGBzw/cizcb1
	m8SaUIQ3Ic6rGc+bv8ROtL4PsEZBjGXSB+sfrp2a+ce4EP1MsnzN9tJdS52PT95Y8yBDfY467wGxS
	IpH6OqTy0qUcU5TLfm9BdoGnBkAzrlazgFOeYQ9ALuy4bm5ZEX6qZMpfVWrF3N9jh2aHRHHo4QEjJ
	JO1vExiDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0xkp-0006NI-88; Thu, 30 Jul 2020 01:53:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0xkV-0006GS-Ve
 for linux-riscv@merlin.infradead.org; Thu, 30 Jul 2020 01:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wr/vxuRMCyMaqxtO9q8uf3t1cVc0k0F6Dgt7vG6jHBM=; b=IbOVk80ByLabM7ppzIl0wYvdF6
 DyW3CwnfRpqvAhR+E0OUTRaaHxGhhrsXr4ps9/r1YcPvxdg2Mjge/pP8xmHQAwd0vWkSFiavsXnsy
 8Q4sHCCZbUN2j1oKpYedzVVGThnUKzje/7stmtIMZazop+jsI1mfTWqLzdHH3/mTxrTU2A/3hGnah
 QJRojz0To0QduCeSFpNVXH8Dy2EvCe8hkuOIU3eriLvsv5QO3lS9xvCm+9pRqxZgTILYN62pJO1Yv
 fEaQrnys3DD5LIdjx9NkNRsGhRPcfoZof0cUyU8hP8dEaWmbvzgfgSUhTm5Lia6U2kA9wfzx43LiR
 Y1CoLEKw==;
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0xkQ-0002sI-VQ
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 01:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596073959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wr/vxuRMCyMaqxtO9q8uf3t1cVc0k0F6Dgt7vG6jHBM=;
 b=aBhw3tWRZefQIBzuMK7MB9IbwUcjun42aeewRNDlN5wALbcL3JvpIO1/mxkYwjY3G1PBcE
 d7lQGs4tJRovG22Fboyc9wGygmn0NnReZss0iDjt1lfiqZ77cuU1EJbsQGqI/y5pprn4Zu
 bGVgBk5QdtElrbllzKMuUU6A/wp7Q1w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596073959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wr/vxuRMCyMaqxtO9q8uf3t1cVc0k0F6Dgt7vG6jHBM=;
 b=aBhw3tWRZefQIBzuMK7MB9IbwUcjun42aeewRNDlN5wALbcL3JvpIO1/mxkYwjY3G1PBcE
 d7lQGs4tJRovG22Fboyc9wGygmn0NnReZss0iDjt1lfiqZ77cuU1EJbsQGqI/y5pprn4Zu
 bGVgBk5QdtElrbllzKMuUU6A/wp7Q1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-29YBKjvJP4OrLqv9mdWq_A-1; Wed, 29 Jul 2020 21:52:35 -0400
X-MC-Unique: 29YBKjvJP4OrLqv9mdWq_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F7459;
 Thu, 30 Jul 2020 01:52:29 +0000 (UTC)
Received: from localhost (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3136179C;
 Thu, 30 Jul 2020 01:52:27 +0000 (UTC)
Date: Thu, 30 Jul 2020 09:52:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 09/15] memblock: make for_each_memblock_type() iterator
 private
Message-ID: <20200730015221.GI14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-10-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-10-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_025243_571271_9C430DC6 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 07/28/20 at 08:11am, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> for_each_memblock_type() is not used outside mm/memblock.c, move it there
> from include/linux/memblock.h
> 
> ---
>  include/linux/memblock.h | 5 -----
>  mm/memblock.c            | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 017fae833d4a..220b5f0dad42 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -532,11 +532,6 @@ static inline unsigned long memblock_region_reserved_end_pfn(const struct memblo
>  	     region < (memblock.memblock_type.regions + memblock.memblock_type.cnt);	\
>  	     region++)
>  
> -#define for_each_memblock_type(i, memblock_type, rgn)			\
> -	for (i = 0, rgn = &memblock_type->regions[0];			\
> -	     i < memblock_type->cnt;					\
> -	     i++, rgn = &memblock_type->regions[i])
> -
>  extern void *alloc_large_system_hash(const char *tablename,
>  				     unsigned long bucketsize,
>  				     unsigned long numentries,
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 39aceafc57f6..a5b9b3df81fc 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -129,6 +129,11 @@ struct memblock memblock __initdata_memblock = {
>  	.current_limit		= MEMBLOCK_ALLOC_ANYWHERE,
>  };
>  
> +#define for_each_memblock_type(i, memblock_type, rgn)			\
> +	for (i = 0, rgn = &memblock_type->regions[0];			\
> +	     i < memblock_type->cnt;					\
> +	     i++, rgn = &memblock_type->regions[i])
> +

Reviewed-by: Baoquan He <bhe@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
