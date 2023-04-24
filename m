Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF056C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsnzxmytwoGmEY3U55rocXNRVKb54RC2WY0QdUXCp3Y=; b=aR2wUuEN28ktfQ
	+xblmgGNwXri5l5dUnTsdLwLPAGbBVzc8HbZ5p1x9UDkbtKU9BYTwmTQw2VI2/qTcHd2GdOJzw3FU
	IdwOInXvtqzWTcpyN1CGBOAIAeaUI3DB9UoSnUyfzmyfZgYjx7V9C7BJOSAy6IWHdOrjHwEg/knoE
	EjAlVI7sz1+0Bpl28QPpq3zEHblU7W+M997t/vRq7778Fqrdvadv4vBehQHhNUXRvWNrAayRaApv2
	WetRx282J7+BtPK7I9Ngd/V+mopoYzWzJEHBoMNu9AZrL3G+sHI0Kd4f+JfkrMw5tIMP2GNDLeHxp
	hIGkoDTybAi2E3E+3uLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqv54-00GHCC-0g;
	Mon, 24 Apr 2023 12:14:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqv53-00GHBn-03
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Apr 2023 12:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ceu/85gKskypn0Mrq4JYlt57CB6zS+y89QBRxsdO88Q=; b=Nejt0hIo62NyZ1fkh6fD8vRQZF
	aYMERb5oeaUEbF9TbBbZhTELLP8VnyK34nKzwawbWXzljHpfYAtBqlv2vQrheufsmYpiISOPQTs5s
	nOwGS36PGHYKP+hWkada6uaztQzsPRNRVXFPOF5kRX7HSj0Sg/TAgVFHuRQVZQ62YO9Z+jrsFgwK3
	kj33CAgpr4umMp7NSEUl3PuQJRlffRKtB2WdTGTlp/d70FmdvfOPWt94HguG+hoYxQl95vj1MH+LV
	ReCUR8nlp1J41hgRB6QUd0EszLhRM/8ntdsGY47OcNZuMV0WBXoHiw3+9qI7SHDpyBsd1xdghW5sj
	5WsuNw1A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pqv4v-000QYK-Nj; Mon, 24 Apr 2023 12:13:57 +0000
Date: Mon, 24 Apr 2023 13:13:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
	kernel-janitors <kernel-janitors@vger.kernel.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 renaming
Message-ID: <ZEZyhSKaAEVpx4KX@casper.infradead.org>
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
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

On Mon, Apr 24, 2023 at 11:40:25AM +0200, Lukas Bulwahn wrote:
> It is easy to fix, adjust this one line to the renaming and 'select
> ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
> know; probably, it is best to get a quick fix-up patch with -rc2, once
> all the changes landed in -rc1.

Actually, it's best that both parties who send a pull request to Linus
note this collision and he can fix it in the merge commit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
