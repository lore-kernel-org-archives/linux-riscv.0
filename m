Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721B606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 22:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ga4ib4LF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vk97GFiK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E/9/RjtDayYklyikOUoyYUuyAbBgvmsqVTxQ3t1HuPI=; b=Ga4ib4LFPF712wjyx5+evHPTiE
	CkMP4ErZpM1G+D0W2TRRx4M2+0SYuFJRESYGZyCRRx6WvnhOCvyhTYx2XdAKFq0thjFjCSeDTO6IW
	xaTj1a+89JBY5cCwchVXm46zVmOu2ooPFOgsO/OsVkaiqLTGoGftpBcdkCEtP5DqdAsklAO5l+o9y
	qctC/PK4R+FPNEsETvIkWamjJVv9PoKASsdSjy1EgG1zExXVccCVLmHUy8er1bSsgaSkSSzk2HUbD
	CKFQxwp86vyAKNW2UftSpNGA4XxXb1zNuuQwLisunNPk7d3IffjLAgipq/mbYmeiHZxcs/Gi18P1Z
	753KadfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvAU-0000000Cg4A-3XBm;
	Fri, 30 Oct 2026 22:33:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvAT-0000000Cg44-3DZO
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 22:33:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7997A60233;
	Fri, 30 Oct 2026 22:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC75A1F000C1;
	Fri, 30 Oct 2026 22:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793399628;
	bh=ucXB7kIXkR22wptA4ECw1Ukmrn4C7DPZ8GfL9sZbPxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vk97GFiKii5heUCxUE0rGgXFrRQo8z7xlej80GQQndc0rTb+p2aICUANyQvibAKyg
	 3OoZjHTlLmP6Ja46z3aZqb0EUlojQj/Fyg6xq1NJ0wjDXXR4Sfb69m1VHnONpbtdby
	 0uhiQy7RzXCMegLzFo3y0rRkPyBUmBm9gD1U7PGY=
Date: Fri, 30 Oct 2026 15:33:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of
 free_pmd_table()
Message-Id: <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
In-Reply-To: <20261030221401.155797-1-sashal@kernel.org>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
	<20261030221401.155797-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 18:14:01 -0400 Sasha Levin <sashal@kernel.org> wrote:

> The mm-fixes merge reuses an older resolution of the conflict in
> remove_pud_mapping() and keeps the free_pmd_table() call that passes
> is_vmemmap. Commit f998a21c2ba5 ("riscv/mm: fix hotplug page-table
> destructor handling") in mm-fixes removed that argument, so a riscv
> build with CONFIG_MEMORY_HOTPLUG fails:
> 
>   arch/riscv/mm/init.c:1657:35: error: too many arguments to function call, expected 2, have 3
> 
> Drop the argument to match the mm-fixes version of the call.
> 
> ---
> Mark, this applies on top of next-20261030 and is meant to be folded into
> the mm-fixes merge resolution. Next/merge.log says it was resolved using
> a previous resolution, I think the one from the risc-v/mm conflict on
> 2026-10-12, which had the same problem (next-20261012 has it too).

Thanks.  The "mm: Fix page-table teardown during memory hot-remove", v3
series was problematic, but I now have all four patches lined up in
Muchun's as-sent order in mm-hotfixes-unstable.  I'll push that in the
next hour or three.  Then hopefully any -next merge resolution can just
go away.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
