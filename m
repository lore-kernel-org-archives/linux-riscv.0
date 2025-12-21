Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455BE67482
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 18:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HycXLJ9Fj+o52l6Jk3t2Flho8LTIVHgdwE38TzCAsQ=; b=Ng6XJasq92Atjd
	D6p43muEH19A2JSFFG8+SGjoBgNw2BHPVANZMLWaWlcoH/TiHM4h1hQfgaW3FWjRzr1vzqmkJgNmp
	qGAqI0u4hAbQytC21G88jDtYFqAk50lfTdKs8pRZF/pwKNh6KwjjBaCY9WmbBgkXI9XTLuqP8Ws2R
	TJnU24nrx6qV7MODlVcUqX1GGn3Gnq0sjX0APVkqndHLt+dsvcfTMeiQQxDTcDGUAlHErddtsS+4E
	yFUOFmlJ6rUJiByYZLLMHVd02/3prEJuzFsP8g9PcGOtz0FqV3TfECM3kf6NgtrOr52Hp2fTh94vK
	aBcLN0d06G1SfsojP+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOUS-0000000Cecm-1lyN;
	Sun, 21 Dec 2025 18:49:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOUR-0000000Cecg-0Sru
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 18:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0B7F6001D;
	Sun, 21 Dec 2025 18:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87ECC4CEFB;
	Sun, 21 Dec 2025 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766342948;
	bh=IJXA+QzQQpGmzrjmRsOKwVn2upf0r1hQr276K/HQbNg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nJr+00XRdPtzlvH9JOjETY8okc5IoS3PxdQmW9oo668Rvqkalq9mXrLUjB0AbsyW/
	 eIKKrW8sm5ef9jKskfyVXa7x3lRrVXMySdJZN2ki5xU01eOomWskWSJRcFhhR668sx
	 3LiGEKDsBGq2NxgVr0zHtc+LHnCm1WTs0bAiuqPg=
Date: Sun, 21 Dec 2025 10:49:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Sourabh Jain
 <sourabhjain@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
In-Reply-To: <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
	<87a4zcml36.ritesh.list@gmail.com>
	<655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> > 
> > My main concern was -
> > A fixes tag means it might get auto backported to stable kernels too,
> 
> Not in the MM world -- IIRC. I think there is the agreement, that we 
> decide what should go into stable and what not.
> 
> Andrew can correct me if my memory is wrong.

Yes, -stable maintainers have been asked to only backport patches where
the MM developers asked for that, with cc:stable.  There may be
slipups, but as far as I know this is working.

I don't actually know how they determine which patches need this
special treatment.  Pathname?  Signed-off-by:akpm?

> But we can always jump in and say that something should not go to stable 
> trees.

Yes, please jump in if there are any thoughts about
ordering/priority/timing.  In fact, please jump in if there are any
thoughts at all ;)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
