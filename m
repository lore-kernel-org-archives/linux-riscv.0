Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49DC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buqHMojh9s0akuUHNNE/JVC4sn3JSSk6WJlp8fJdGYQ=; b=4ly7zKWVLkS+w3
	WKBwvy1HXZslNHUlqKwSC4gzeVW2R0v/m5vFu7+Ocq65P4TtMvz+4gim0Fim3PGZGGtLCvvw44GfO
	D41GofXO4P4L5Z0ika7Hec8vgQWBjKglwglAdLbRVTQUHotNaXnn4R4ISopOqdo5QBfoe0L034Xzr
	ogOdnDsvXy6ExXH/UC+1DuyhzaYG9ORsCRHCcfCJVVqh35OtVVIBzWhPZO+JXMIudZ4ujdL0hAFzM
	fGk0hsHg4Zoc6pp7lGLZRqOegHrWxCqOj9MPp6Hd3QpTrgnk8lgnAzno6Somueoz5fKgULCrn94s5
	cswcXpEaQqvoA3vmZGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxV2K-00CQJZ-0y;
	Fri, 12 May 2023 15:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxV2H-00CQIo-2X
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 15:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B0D165478;
	Fri, 12 May 2023 15:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FE5C433D2;
	Fri, 12 May 2023 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683906624;
	bh=4hkHCupzGOuMqiw3YwQ6v+xlkODto1KsgLIqwYw321I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UewoEjUiWl69xJYbwoKS3AP5squS7pM/TUB6Duf3uzKqmzXM60uW3jRLTX/dJlSvU
	 MeV0zd22G4mfXp4haj2JfrR0P31mlrxR2+6U5J48bcKgDVNlwj2B+FpHh7CjRfzg9n
	 VwsHHCeMUQhmCKeg+FG66Jj+R9zgX7QMMGXTWu9p0NufHqlzH+MaNPlueluwTtRKbs
	 dYC/iCYGsL3VTPklGka/sT8zR1CW8Berie7jWTvfbj1aG8SGHStxEmsHaO4H4oTg8q
	 A+rIlE2Wt26WOvfT59rB08ESjRozq9JYab/7dTTranNoGfixToSP2t8DDzgTZqD8h4
	 Gux1xro9qoPdw==
Date: Fri, 12 May 2023 23:39:15 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <ZF5do/iNVntdl3s7@xhacker>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-5-jszhang@kernel.org>
 <20230512-spouse-pang-87f2e579baa2@wendy>
 <20230512-garage-slacked-d16268c0726e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512-garage-slacked-d16268c0726e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_085025_863249_F03C7377 
X-CRM114-Status: GOOD (  17.83  )
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

On Fri, May 12, 2023 at 04:16:31PM +0100, Conor Dooley wrote:
> On Fri, May 12, 2023 at 02:58:49PM +0100, Conor Dooley wrote:
> > On Thu, May 11, 2023 at 10:12:11PM +0800, Jisheng Zhang wrote:
> > 
> > > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > > index e5f9f4677bbf..492dd4b8f3d6 100644
> > > --- a/arch/riscv/kernel/vmlinux.lds.S
> > > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > > @@ -85,11 +85,11 @@ SECTIONS
> > >  	INIT_DATA_SECTION(16)
> > >  
> > >  	.init.pi : {
> > > -		*(.init.pi*)
> > > +		KEEP(*(.init.pi*))
> > >  	}
> > 
> > This section no longer exists in v6.4-rc1, it is now:
> > 	/* Those sections result from the compilation of kernel/pi/string.c */
> > 	.init.pidata : {
> > 		*(.init.srodata.cst8*)
> > 		*(.init__bug_table*)
> > 		*(.init.sdata*)
> > 	}
> 
> Ahh, I see what has happened. This series was made on top of
> riscv/fixes, but none of the patches are marked as a fix, leading to the

I need to touch the sections, and there's a fix in Palmer's tree which
will rename the section name, so rebased on the fix HEAD.

> automation testing this as new content.
> 
> Sorry for the noise on this patch.

Thank you for your review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
