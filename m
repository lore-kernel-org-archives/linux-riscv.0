Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B06F53D69
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjNSWPhwa9NRYVt4BlRL9fc4shp97GqpcWHitiPA8ek=; b=poMJ0JI6dnLw5G
	K65zuvqzVbA2+wsAk/ZOIztV5LTXi7Xdum8LQ+j3z1wjKQiFMyh4ZEkaxrCwY3YjXGersgD/Ttals
	R+0Z6lR6Bw5jRYVD2oh2FUD1eGXj4MEbQjyjbNuth6NY0VgA9rbJfglag/WpGgP9Epz9+Kkmwax1b
	NFXrz38om8v49NtIED7x+4LK+g3VoOgnkpNaU2CbhhAeMHqhQtgUJ6C50PANlJB35mxbLxiia1VE5
	YowDkbQNUrLKel4ph//cFKjalpTERitxbAHczCX0nHCb7xFlAqNwsmzsdkZRA+sH2st6/r12oFuui
	CqAN4pYDGLFfUPDG2EzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A7n-00000004MjN-2TGe;
	Mon, 16 Mar 2026 15:44:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A7l-00000004Mj9-31Te
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FE2360018;
	Mon, 16 Mar 2026 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE97C19421;
	Mon, 16 Mar 2026 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773675896;
	bh=IH6hjF+pkW2zjrOcoLLUCtQbwyxCT8NByC78D6ekXco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TcOeR9SgSAlkVmfMXk8wAz1W+adrhixRO9ilx9mDNYkqKasT0/37suCzyVn5arpef
	 8+axpziHyVNvrp8vMNMQTmTnKkwlsFNtb2TmxOlNa4WXFUg4R0IPHS7CHZvX2eRlfb
	 vnib7BcfwcCG2CaM+sGH5qQT9iRVVwlx83jDrY7I=
Date: Mon, 16 Mar 2026 08:44:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan
 <surenb@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Qi
 Zheng <zhengqi.arch@bytedance.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: add null check for find_vm_area in
 __set_memory
Message-Id: <20260316084455.bb44dd7baa47487f1e567ce9@linux-foundation.org>
In-Reply-To: <20260316151642.13738-1-osama.abdelkader@gmail.com>
References: <20260316151642.13738-1-osama.abdelkader@gmail.com>
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

On Mon, 16 Mar 2026 16:16:39 +0100 Osama Abdelkader <osama.abdelkader@gmail.com> wrote:

> find_vm_area() can return NULL. Add a null check to avoid potential
> null pointer dereference, matching the pattern used by other arches.
> 
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")

Three years ago.

> Cc: stable@vger.kernel.org

Why cc:stable?  Has anyone ever hit this?  Are we able to identify a
scenario where this bug might be triggered?

> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -289,6 +289,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>  		int i, page_start;
>  
>  		area = find_vm_area((void *)start);
> +		if (!area) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
>  		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
>  
>  		for (i = page_start; i < page_start + numpages; ++i) {
> -- 
> 2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
