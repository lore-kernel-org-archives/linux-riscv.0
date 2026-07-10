Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2940CC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JObjGaJiuDZ9tIDiRyB2ezIelgTdfJLiwG28XGYQMAc=; b=NwCnMzqqHnUnbg
	KoQGdbAo+fMvTegYtj7Zg6tRVAxxIZV2n/bavNiK0XNmFz3m+Kr4umRiqeXa2qrZ6D6e6d+m13M31
	/30mpZ5mcY0FUILblJddDpl7nJiD5ZPLPJhzGtBrtgoo0lfn+tFccuxsxYnsPG1fdZn/XBN8DgP78
	1Enk98pwAlg7Poo1qR+2trKmcHNfize2hkZqQkXVi3HYYKpWXm6Z5jB/3Y/0hrgeIB7UMmO3xinur
	QBMbQCH3sJb8Zo2hGE3jHeUo+J5fiy2PqbXPxAszUQ4L2snxIM0dqi2GxLxHlZJRgiRnCIVAc8P3/
	BVsFZyORIrMzDgSWxupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7I9-00000004Xcs-30PM;
	Fri, 10 Jul 2026 09:13:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7I7-00000004XcV-1dlS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 09:13:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8883C403F7;
	Fri, 10 Jul 2026 09:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127BF1F000E9;
	Fri, 10 Jul 2026 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674782;
	bh=u4DsWnWasA8h85Gsu5f/xy2b9ecOlCuQy+slRnVs+gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zapqd/L+c4EJRqbtdJXls25prmMPM69KR+behI08XwP7Zvf6QZAqU7MiOzZtFHRF/
	 wD4iJaGNt8Adqf0+BR3WQ4gGuuKCKQPbob13gw2XF+IwWUuAJC53l5NtARu5EgnrqO
	 2s+OVM2YpE6+2ky0X8MAtBRzo0TLixGd+xwQf2zQCIqpcqzKd7rH17c8Hq//DpGAjK
	 VX1oMzXzF9r/Ezcb6NoQiu5uEZXcE0v7sYESgSiNwMvQEQUnX9X/cbJYV2J6UjOOxU
	 eKf5qxR79Cu00qV8/YxzDNqW3yviZQ4UK9uTlc9c8F0hRNVzdmRfLpn3XDSxvfvSx2
	 0r8QevW6jbmAA==
Date: Fri, 10 Jul 2026 10:12:47 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: David CARLIER <devnexen@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dev Jain <dev.jain@arm.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
Message-ID: <alC3HqLVTBA92Prx@lucifer>
References: <20260706203128.162335-1-devnexen@gmail.com>
 <ak0YI9KjSstnj9rJ@lucifer>
 <CA+XhMqzvFtLq1OT-qh207aJhSf+okdE8o8Joe8e_KBvdCjcQfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+XhMqzvFtLq1OT-qh207aJhSf+okdE8o8Joe8e_KBvdCjcQfQ@mail.gmail.com>
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

On Tue, Jul 07, 2026 at 06:08:49PM +0100, David CARLIER wrote:
> Sure thing :)
>
> On Tue, 7 Jul 2026 at 16:19, Lorenzo Stoakes <ljs@kernel.org> wrote:
> >
> > Hi David C,
> >
> > This has been through a lot of revisions so I think for the sake of expediency
> > the best solution here is for me to grab this and fiddle with it a bit then post
> > it out myself.
> >
> > TO BE VERY CLEAR - I will keep your authorship and attribution :), and simply
> > stick my name on a Co-developed-by tag.
> >
> > So this will remain your patch.

Apologies, but the approach I'm taking is very significantly different so it
would be problematic in terms of patch provenance to do this :(

I will make sure to credit you directly in the commit message so there is proper
attribution, this patch and follow up stuff has grown a lot (been working on it
all of yesterday afternoon/evening + this morning) and need to ensure the stable
stuff is backported etc.

Thanks for your contributions here, very much appreciated, and sorry to have
messed you about on this!

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
