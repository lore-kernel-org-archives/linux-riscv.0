Return-Path: <SRS0=2Vdo=5E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726A2C4332D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2020 07:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BFA20724
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2020 07:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2FHRT8E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="miVDWU3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BFA20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZZ9JpRLP71PK+VNpemb+Gegi8ltDnpAruGHqikdnkM=; b=N2FHRT8EQMXTYE
	qImycWsAZzW2F8l60DonJWs5V/vxbrIpZ6s2KoVSgctxvrwe/jzI7gKeQa5QGbu9p6z/vkNmBChxH
	9gQJXCMkjAfep4Vz6C3zCnIBchCoP9CBXrVhJRR7vhv0QMOJTiVepxm21SdOU7+3P8VIFU/MqAN+5
	OUiVcu1LEGk3+Us1Hg6sQGeHSkKHLkuGnMfqCnTa78Bm8mDRv0hlj/H+JzPJ7NElenJma9xhe5nh9
	TAI59isjgfh81b1yJiv12EF8b0RQe3uNbMwyR5WtcVjDlopBrE19TjYLQEpvLabOGP+sphkxpQCy0
	82T3a33hMHt8M6jijnoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEpET-0006yx-DO; Thu, 19 Mar 2020 07:04:45 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEpEK-0006qi-Jb; Thu, 19 Mar 2020 07:04:38 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jdF71sjtz9v1Md;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=miVDWU3+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LNpYefN951gJ; Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jdF70XNZz9v1Mc;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584601467; bh=5ZZ9JpRLP71PK+VNpemb+Gegi8ltDnpAruGHqikdnkM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=miVDWU3+a2y0u275N9hD/wlPdJIb1qmEFxnWhWbDAcuzzhQKA62bOJRlcQS+0FgpJ
 1oDaIjZur3d9lpK8mGIRkzkhqA4W3uvhQ9x7BDYfoczEr1ShtNesHCpCKh7CmjNR3c
 w9QIjLFWO20jXxv/VZmy7eFG3M/ZUt7wHjFbPowk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E903D8B772;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NWMcTA98PEcE; Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F89E8B769;
 Thu, 19 Mar 2020 08:04:26 +0100 (CET)
Subject: Re: [PATCH 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-3-mike.kravetz@oracle.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
Date: Thu, 19 Mar 2020 08:04:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318220634.32100-3-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_000436_941375_983E48A8 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



Le 18/03/2020 à 23:06, Mike Kravetz a écrit :
> Now that architectures provide arch_hugetlb_valid_size(), parsing
> of "hugepagesz=" can be done in architecture independent code.
> Create a single routine to handle hugepagesz= parsing and remove
> all arch specific routines.  We can also remove the interface
> hugetlb_bad_size() as this is no longer used outside arch independent
> code.
> 
> This also provides consistent behavior of hugetlbfs command line
> options.  The hugepagesz= option should only be specified once for
> a specific size, but some architectures allow multiple instances.
> This appears to be more of an oversight when code was added by some
> architectures to set up ALL huge pages sizes.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>   arch/arm64/mm/hugetlbpage.c   | 15 ---------------
>   arch/powerpc/mm/hugetlbpage.c | 15 ---------------
>   arch/riscv/mm/hugetlbpage.c   | 16 ----------------
>   arch/s390/mm/hugetlbpage.c    | 18 ------------------
>   arch/sparc/mm/init_64.c       | 22 ----------------------
>   arch/x86/mm/hugetlbpage.c     | 16 ----------------
>   include/linux/hugetlb.h       |  1 -
>   mm/hugetlb.c                  | 24 ++++++++++++++++++------
>   8 files changed, 18 insertions(+), 109 deletions(-)
> 

[snip]

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 2f99359b93af..cd4ec07080fb 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3149,12 +3149,6 @@ static int __init hugetlb_init(void)
>   }
>   subsys_initcall(hugetlb_init);
>   
> -/* Should be called on processing a hugepagesz=... option */
> -void __init hugetlb_bad_size(void)
> -{
> -	parsed_valid_hugepagesz = false;
> -}
> -
>   void __init hugetlb_add_hstate(unsigned int order)
>   {
>   	struct hstate *h;
> @@ -3224,6 +3218,24 @@ static int __init hugetlb_nrpages_setup(char *s)
>   }
>   __setup("hugepages=", hugetlb_nrpages_setup);
>   
> +static int __init hugepagesz_setup(char *s)
> +{
> +	unsigned long long size;
> +	char *saved_s = s;
> +
> +	size = memparse(s, &s);

You don't use s after that, so you can pass NULL instead of &s and avoid 
the saved_s

> +
> +	if (!arch_hugetlb_valid_size(size)) {
> +		parsed_valid_hugepagesz = false;
> +		pr_err("HugeTLB: unsupported hugepagesz %s\n", saved_s);
> +		return 0;
> +	}
> +
> +	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> +	return 1;
> +}
> +__setup("hugepagesz=", hugepagesz_setup);
> +
>   static int __init default_hugepagesz_setup(char *s)
>   {
>   	unsigned long long size;
> 

Christophe

