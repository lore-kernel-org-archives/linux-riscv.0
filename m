Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B381E6B26B
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 01:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuuZj57guiWT3pPjsVlFYi1CCVr4pzaK4GMV77/GV6o=; b=1QZrm4MdgHl6Ne
	0thg9CI/FGsvmF+dhCWWXqtLgn+zgFRX2lNgTfdna6eU+ygJSiocn/NTCf1CAPuSqqUT4WPaQDeZ0
	HKNy/H1rwQ+iaTqdV8BqSYod2gkC+dq/wCDUUdExNHnIxIbTUFbEuoJkfoLlwmt7kcpwFhwAmBNfc
	yMcrHHQ2O6pCT70UqSb07YxQsl8RLkJSLzBkRfzsKhmSHMMd4gpGC7Ll270RUMckFs0OugCwjVR1E
	GTMYTvHvi39HUOtocJS5NF6cKhlC7YFJnZ1fMcQxtqG56XXDzdWpNS6hpXCXMAn/Y74v0fuw5MovZ
	oiMsHjwKQ5hin0WilRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrEm-0000000EO6w-14bt;
	Tue, 23 Dec 2025 01:30:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrEk-0000000EO6a-0VEx
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 01:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E74CF40DD1;
	Tue, 23 Dec 2025 01:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613A2C4CEF1;
	Tue, 23 Dec 2025 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453452;
	bh=j7q2987NriSlS+UGsGEBmtZisdMET3w6wHahvWlFCXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dO5p1eAeCiTmrLjfR2upqrJjMfmN+fqYqX5pLP/UpyRrXF2AUHgEYFwEMyD3r1obi
	 pEDjXWgKmiqndnrwphcQ1xmocdXiVenBgaQpH8OhamNZ4Iq/5MM1cZj8puJ14LI3RY
	 LIv+2+3bD4SBxu39wqhdoZkP8nz/qNyqFeQe02gX9CRGPAcZc59Hrq2vgSPjMPIkYw
	 UaOU0CNfN/e1qXIcM9EXSCPrhHOvAC89afJ/neG7VaxyRjcLSVrHRanYLjzuXOsJWy
	 l8K/ZNSDlGs6d4U/rrmNlDoBWYqa9kWYB4qLSlkOXTaf4oEIb8M8vGOL0VKP76nvWM
	 AiNxz4lmAEbWw==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
Date: Mon, 22 Dec 2025 17:30:44 -0800
Message-ID: <20251223013045.4579-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_173054_181071_5FB37E6D 
X-CRM114-Status: GOOD (  13.58  )
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

On Sun, 21 Dec 2025 10:49:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> 
> > > 
> > > My main concern was -
> > > A fixes tag means it might get auto backported to stable kernels too,
> > 
> > Not in the MM world -- IIRC. I think there is the agreement, that we 
> > decide what should go into stable and what not.
> > 
> > Andrew can correct me if my memory is wrong.
> 
> Yes, -stable maintainers have been asked to only backport patches where
> the MM developers asked for that, with cc:stable.  There may be
> slipups, but as far as I know this is working.
> 
> I don't actually know how they determine which patches need this
> special treatment.  Pathname?  Signed-off-by:akpm?

I guess it is pathname, based on ignore_list file [1] of stable-queue repo.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16


Thanks,
SJ

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
