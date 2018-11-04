Return-Path: <SRS0=KFOV=NP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847D8C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Nov 2018 06:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C292082E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  4 Nov 2018 06:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJMxSOB7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Js7Nh27v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C292082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7WctkQ6PM/1ruDclrwBdkV1i+/Rpr3vN38Zxb3/hEM=; b=pJMxSOB70k59Dt
	OnlBmHdFN2TkEYoB2tJSz+hxoE67xDmA3wMtP9O9jd4hgnWcT2my+J6kR7G13t6iIE2wdplDc+H9V
	jMc2zY4YFKnzGmt5ml1c2GU+FnWy9MIeY2ldlZkfWFMO+/gUlJobt0BR2W/3H30LAyYGl+J3DCe/D
	MpJzT1JWVMgL58CXmvzQxS1O1EOWCvuMf+6BmhB01Zu/T9R1yrI9//gbdJgH6Hy++62bFm8H93hgk
	5usMaj3FIxuFQJ1G07yPfvORSepcR/Pppj2ZyB1A1sd33tvAV4wbGq3p3XuvDNYBCd657G3/Zpdsd
	WDzXpqcbKi0XOOgKo6mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJCNl-0004TQ-Fm; Sun, 04 Nov 2018 06:59:37 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJCNi-0004SL-7w; Sun, 04 Nov 2018 06:59:35 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wA46u6n9035325;
 Sun, 4 Nov 2018 06:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2018-07-02; bh=Dv2JIDyr6hj+SI1f67+zM2v2M4uA+R2C7fKFV5CQ+kE=;
 b=Js7Nh27vbqOyY2gZ0UpqFfC92w4EMKr/VwCtgb/4hz0cpD+muu4dt9mHR/RIg7LXLRKM
 KSdQlyKUBJ0Wepu8UCnGYCRdHpxOUY3LSEVv1pS+k+mLUIjCdfn6slguWQuKOfCVqlp8
 L9lqOMCdjJaGmZq1nHUWfgmmHv1CnRaeRXXjaAPM2Xi2w1DSFM+8xUpoxcjRF6GwcHR2
 Q8VGkhI55EFSCNDiU2BqFcJrF9NDtefdCtLLfW7nm+lXI8yZIprvLVxRVTeAfWiOYVVD
 vSRxnGitTcbrLliDWcoiH4FzDASOny4srW6qN47aUOBPO6AznnIha2Je6/kcXA9kalmP rQ== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
 by userp2130.oracle.com with ESMTP id 2nh33tjd1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 04 Nov 2018 06:57:32 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wA46vJtx021700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 4 Nov 2018 06:57:21 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id wA46urU6025556;
 Sun, 4 Nov 2018 06:56:56 GMT
Received: from [192.168.0.110] (/73.243.10.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 03 Nov 2018 23:56:53 -0700
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
From: William Kucharski <william.kucharski@oracle.com>
In-Reply-To: <20181103183208.GA56850@google.com>
Date: Sun, 4 Nov 2018 00:56:48 -0600
Message-Id: <D6FB3C15-A8C1-4694-A434-A7489F590E05@oracle.com>
References: <20181103040041.7085-1-joelaf@google.com>
 <6886607.O3ZT5bM3Cy@blindfold>
 <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
 <20181103183208.GA56850@google.com>
To: Joel Fernandes <joel@joelfernandes.org>
X-Mailer: Apple Mail (2.3445.102.3)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9066
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1811040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_235934_423620_F7296ACC 
X-CRM114-Status: GOOD (  21.59  )
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
Cc: linux-mips@linux-mips.org, linux-m68k@vger.kernel.org,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, linux-ia64@vge.kvack.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 r.kernel.org@lithops.sigma-star.at, hughd@google.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 Anton Ivanov <anton.ivanov@kot-begemot.co.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com,
 LKML <linux-kernel@vger.kernel.org>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181104065648.yEt62BV8DCvcDkVEi1gpAYgRzFIqTpPh-EVVG0C1aAE@z>



> On Nov 3, 2018, at 12:32 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> Looks like more architectures don't define set_pmd_at. I am thinking the
> easiest way forward is to just do the following, instead of defining
> set_pmd_at for every architecture that doesn't care about it. Thoughts?
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7cf6b0943090..31ad64dcdae6 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -281,7 +281,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> 			split_huge_pmd(vma, old_pmd, old_addr);
> 			if (pmd_trans_unstable(old_pmd))
> 				continue;
> -		} else if (extent == PMD_SIZE && IS_ENABLED(CONFIG_HAVE_MOVE_PMD)) {
> +		} else if (extent == PMD_SIZE) {
> +#ifdef CONFIG_HAVE_MOVE_PMD
> 			/*
> 			 * If the extent is PMD-sized, try to speed the move by
> 			 * moving at the PMD level if possible.
> @@ -296,6 +297,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> 				drop_rmap_locks(vma);
> 			if (moved)
> 				continue;
> +#endif
> 		}
> 
> 		if (pte_alloc(new_vma->vm_mm, new_pmd))
> 

That seems reasonable as there are going to be a lot of architectures that never have
mappings at the PMD level.

Have you thought about what might be needed to extend this paradigm to be able to
perform remaps at the PUD level, given many architectures already support PUD-mapped
pages?

    William Kucharski
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
