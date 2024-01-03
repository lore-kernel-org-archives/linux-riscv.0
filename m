Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EDFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0U39XsY+HmWhaMvcRCK9G+tu4EOpoJDhsygQco+euRo=; b=nXJn3I49qod0rR
	fM1fU3faPjlPwV2YswaPXET6rXx9idD7TU9pSbHQnyGV5ZCDXr+I9etzksP52Px6xeTDF2BfIldiI
	NjFcxEtpHiFq9irXl4Z5kfMYNa7cNnoAOVfl+U66K3Qg+vmMNjjHxOfaJj3YSG6gvKmVsknzpqDvj
	34VZUnq74bGQdxPvwRK6Twxq74YxlBSHvWMWRkyTnD/h1ohszON5tr416UiIsLVXnQ897+f3Oqyag
	M7/3N86cxdX8cmZ+vqUiI6l/RoEXcCZPC/IcqN9gP7o+xYeOV8o2RbFU4kjoNEqiZE8JnrE/TMBZ/
	PvFKlvFdGNqlI0WrEv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2zF-00BE9C-0x;
	Wed, 03 Jan 2024 15:16:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2zC-00BE81-0x
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C624CE13B2;
	Wed,  3 Jan 2024 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6C9C433C7;
	Wed,  3 Jan 2024 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704295006;
	bh=htNgBFBV/CKJcgQaocKh9f1UxgQQ82NiIUtI74MyQj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gf9pQ/af33jkPwdM/5tgbvWGyNx5or7NiLzSPLWPf/matHojty611C2q3ZtsjVOA5
	 QGiLsSxw1vprazFYFKlVLl3DOAjlfoI5DTBnPD1gslBO0GG8otzapjEODkd38l1+wy
	 JMkxhWV4XNqOa8gSM5l/Zw5UdwxMObagUzzhwH6jrhgTgxmBmW4Ohz/mrrZZ4ABLA1
	 ubxUvmNSoIrplgsvtklkilJ3mIbnx7U86nDXpy7jd9RHjqaORsLdeZLG5tzCYb5hFM
	 ow+nweFB/PNpNryc3J+5jWGjflt8MsLSfCcrJPrOSt8DI67hYqdd9YbL8QrjtZeNNg
	 BATC0icqBPBCQ==
Date: Wed, 3 Jan 2024 23:04:04 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 04/12] riscv: Only send remote fences when some other
 CPU is online
Message-ID: <ZZV3ZDa7eS+Ecc4i@xhacker>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-5-samuel.holland@sifive.com>
 <ZZV19owFbjOzgG89@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZV19owFbjOzgG89@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_071650_514903_76DFF165 
X-CRM114-Status: GOOD (  23.12  )
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

On Wed, Jan 03, 2024 at 10:58:01PM +0800, Jisheng Zhang wrote:
> On Tue, Jan 02, 2024 at 02:00:41PM -0800, Samuel Holland wrote:
> > If no other CPU is online, a local cache or TLB flush is sufficient.
> > These checks can be constant-folded when SMP is disabled.
> > 
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> > 
> > Changes in v4:
> >  - New patch for v4
> > 
> >  arch/riscv/mm/cacheflush.c | 4 +++-
> >  arch/riscv/mm/tlbflush.c   | 4 +++-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 47c485bc7df0..f7933ae88a55 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -21,7 +21,9 @@ void flush_icache_all(void)
> >  {
> >  	local_flush_icache_all();
> >  
> > -	if (riscv_use_sbi_for_rfence())
> > +	if (num_online_cpus() < 2)
> 
> with patch5, I think it's better to short cut for !SMP, I.E
> if (!IS_ENABLED(CONFIG_SMP) || num_online_cpus()) < 2)

aha, plz ignore this comment, I see the num_online_cpus() is defined as 1U for
UP.

> 
> so that the UP case can avoid a atomic read and check
> 
> > +		return;
> > +	else if (riscv_use_sbi_for_rfence())
> >  		sbi_remote_fence_i(NULL);
> >  	else
> >  		on_each_cpu(ipi_remote_fence_i, NULL, 1);
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 2f18fe6fc4f3..37b3c93e3c30 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -73,7 +73,9 @@ static void __ipi_flush_tlb_all(void *info)
> >  
> >  void flush_tlb_all(void)
> >  {
> > -	if (riscv_use_sbi_for_rfence())
> > +	if (num_online_cpus() < 2)
> 
> ditto
> 
> > +		local_flush_tlb_all();
> > +	else if (riscv_use_sbi_for_rfence())
> >  		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
> >  	else
> >  		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> > -- 
> > 2.42.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
