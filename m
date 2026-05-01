Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5986CD3424
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNxHDvgPu7aKsNNNicMaQEtqDi+KaVUgK8Y9pzThoF8=; b=jPiRUuyxqMQo3b
	CPN7Yyp/yOx1FmgPAjnoNUJsletQPtIRyjOLpkDAVxQo/Oa7Lkf/Xw30GK0g4W1vZz8FbrfeSFKVP
	aLyS+k38EyJ1/nSkMat5YOM+5ZFFLTYyNJtiLnUvra9V5fE9E8auOEHcxWl+kHXuc8DWkq0V7TLxe
	ymqciVWvnRMm/SouukdvTgSxPXlvilADCgut5WPFlDwOk8lUbp0wqHQiOK8f+QKxMl+v38tZ93yCJ
	PQAZaeDJ8L/gX2h5Tha5DAXq0SLV4lF2u94IAPQAJ10vHIsoiiY2Oh7lpbBXSqOUPnFa4fwXGFZG5
	oRcx2U7hYAKv+GkqYfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrN2-00000007USU-1WIE;
	Fri, 01 May 2026 17:09:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrMz-00000007US0-13Xb;
	Fri, 01 May 2026 17:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE7D143E9A;
	Fri,  1 May 2026 17:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC2AC2BCB4;
	Fri,  1 May 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777655379;
	bh=aCKpiD8Crlk0uEQZs9vyjBCgLqxVn32/cxl6Y0AtRGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX2L1x4xFIxbScfPDUbir6mmS+xdX9NmUYzJR0EJkE7ri86qbaeUTkDb4jWI5oeb+
	 aN4JbRR+N5UIrCNNa22w2pCZ2JSMSHoSZwNy2T2qFiVEenmDxH9tkupv+ZDyGU2ObI
	 654hr8gYpcXDtcmeRIPh1KdMIPoWk95vpdUy3GSPXi4IHKF8A7wxn55TDFMfm9T3X7
	 2RVfuwK5n/jkaekIr44u2S02mSaPb7gcycVdlcOtlmx86ngcN1rcmImzOHzRA44jyl
	 l2G+a79TnBeaUy0DKnFo0u2dmfaqSvsLz/R2tzsXHpnuJk6XOz3vggn1h43+SNrKA+
	 0+Ne8WhoVmpcw==
Date: Fri, 1 May 2026 18:09:30 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, kasong@tencent.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afTeKp90wGNixIOX@lucifer>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <afTKsSj0i-ZkRZN5@lucifer>
 <afTPamwDbtY_tgk_@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afTPamwDbtY_tgk_@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_100941_310975_D854A137 
X-CRM114-Status: GOOD (  12.36  )
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

On Fri, May 01, 2026 at 05:06:02PM +0100, Matthew Wilcox wrote:
> On Fri, May 01, 2026 at 04:52:12PM +0100, Lorenzo Stoakes wrote:
> > After a brief eyeball I share Matthew's assessment, I really don't like this
> > series, it's piling on complexity for what seem like niche cases.
>
> I don't think they're niche cases ... I think it's a real problem.
> While our current code performs better for this workload than the
> pre-vma-lock code did, it doesn't perform as well as it could.
>
> > We already have enough weirdness in fault code honestly.
> >
> > Let's maybe discuss at LSF if you're attending?
>
> Not only is he attending, there's a topic scheduled (currently 10:30 on
> Wednesday).

Well then, let's revisit this in person in Zagreb :)

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
