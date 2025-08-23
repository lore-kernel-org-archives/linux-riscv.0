Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3BBCA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcRFqjLBPX6kmMY1IZl0Oh7cPeVkGBP86CtW7U3tz44=; b=JtjZf82iJL7bRq
	bur8DCbgVSQpJdpP2RwKcaqYv1WKMEWJ+4M24/boJ2+r/Xe4jGsQj+nvZQUqfB+xTHngfba6E2w/Z
	QQC8hvqZt5F6JxSzFtdYnwtzJKxArYBvx0q2i/LRIWJnPnteiVteCCNmwYDH7pHMoi0JL2uB6InUV
	d5eKvQobCgDs7N7Ijy/FUIHk8Ka0FzkforUhIS13m8O1Kh8i44bKUXQep/rTwlVrcdHzDHNeoshs8
	7NKtP6D3ToHABQIkLxXRjsG6hSJ4MpQAksE6q+S/cfXESK+wqA1HV6jFXV4y0qH8tGh1Nw5zEv1do
	WCqmsQxZM6SqVd6L6L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgl-00000004X5c-15dz;
	Sat, 23 Aug 2025 09:37:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upcLX-00000003jf5-1Kz2
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 00:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9068A566E7;
	Sat, 23 Aug 2025 00:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7C6C4CEED;
	Sat, 23 Aug 2025 00:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755909781;
	bh=EKwFARSCxE6DW/3EQ5i9Wr8vmKaZVfVfckT18HUdQE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S8hZWVU6hakZ1AbQJY4qDd9ZvCnTU2Gw+bC1eFg4cq0BeGVUmBchZh/wksiAWI8pu
	 +XFkJju44Ls9/D8MWUzK+x4U/k8MLbI6bDadFCqMj2rSDYTHoSNyxSMXs7k1OJ9ML/
	 3HkdUAtQiBgCUKib2sOu+2fDGf1bDvrdTvP73/d4=
Date: Fri, 22 Aug 2025 17:42:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Leon Romanovsky
 <leon@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kevin.brodsky@arm.com,
 kernel@collabora.com
Subject: Re: [PATCH v3 0/8] selftests/mm: Add compiler flags and fix found
 warnings
Message-Id: <20250822174259.bf4ed76a0da7d0d6f80ba2c1@linux-foundation.org>
In-Reply-To: <20250822082145.4145617-1-usama.anjum@collabora.com>
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_174303_444595_B4819D76 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, 22 Aug 2025 13:20:57 +0500 Muhammad Usama Anjum <usama.anjum@collabora.com> wrote:

> Recently, I reviewed a patch on the mm/kselftest mailing list about a
> test which had obvious type mismatch fix in it. It was strange why that
> wasn't caught during development and when patch was accepted. This led
> me to discover that those extra compiler options to catch these warnings
> aren't being used. When I added them, I found tens of warnings in just
> mm suite.
> 
> In this series, I'm adding these flags and fixing those warnings. In the
> last try several months ago [1], I'd patches for individual tests. I've
> made patches better by grouping the same type of fixes together. Hence
> there is no changelog for individual patches.

I think it would be best to avoid adding warnings to selftests which
aren't present in the main kernel code.  If only to avoid surprising
people over what isn't permissible in selftests/.

In particular, there's an expectation that we can do

#else
static inline int some_stub(type1 arg1, type2 arg2)
{
}
#endif

without warning.  We do this extensively.

Also, please be aware that there's already a patch in mm-new which
centralizes selftests' __maybe_unused definition.
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/selftests-centralise-maybe-unused-definition-in-kselftesth.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
