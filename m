Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F94CC5DF69
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 03:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8ed1kY3f0RdYaLcOlJmsJWals9l/qPvtAlEZgjJTgk=; b=yFcT67EjjiRb/U
	cfEVJQezJkCeiHr+5YFsNnYHcdGX2L/ceZZGD0rI00F1SIcN3m6C+MA+gzjQakGXtXKQeVx5bYM/t
	JlJAumBh4ffSndezHFba5KB+uoKnovDfeSBnY9ctApqOysWIld/CZqc94LEJvvNS3aIXrzd78Tjqo
	0OK14vKBxDH/yXbaslafpDa3bgHXLHV9i5Y0TxGYAQYzXH8DUiGDnGD0QKxwOrBuUP+9oWeMNLqVA
	PBBKOhhxkBjCI9yOMFvUwl/BRNnn4v6Wz4FpDcMfxbc+aFujQXXXn0KBwXQO2NBUfUlu28n+cWRfW
	HAg+zzT2x5WK1IM9brJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiQz-00000001tbC-3oc4;
	Fri, 14 Aug 2026 03:18:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiQx-00000001tav-3WSx
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 03:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE3F8600AD;
	Fri, 14 Aug 2026 03:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C261F000E9;
	Fri, 14 Aug 2026 03:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786677494;
	bh=LsgWn8sG7KwPcJHSK2CgogemlhdZd4bBu7Jx3POkoZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TJz9evUqTStazAS2hs+GEFRo2dO95zacLioKESOh/64Gdo1mZOppeX26Vfv9cBonO
	 UrB99vNLxkWx2+On3R8N/AL3lsEZq16lOoF+N/JJL4okKtYbmrQ0QsVpDh+wCWdWFt
	 1Q5CSmAwU1Ebq180oD0vSnTH5Q3hnQ5/jEYmZY89pF+PRiAfkXRw5B81IAo7XkT3HX
	 S40aWVevme9sUAlMQ8D5KJtAOGRdFr7TONuUt/URwsnA8VnjjKMn3KNOU7Fc1PNghw
	 GYt72oh7Kr+c1QikCWm8I6JsO8pRU11XHtRITb5MkIYPTGfJ79sYZwoglCJGL7rNnw
	 MCM3mIEl6zLyA==
From: SJ Park <sj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3] tools/mm: add hwpoison-panic tool
Date: Thu, 13 Aug 2026 20:18:10 -0700
Message-ID: <20260814031810.88417-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
References: 
MIME-Version: 1.0
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

On Thu, 13 Aug 2026 04:45:15 -0700 Breno Leitao <leitao@debian.org> wrote:

> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> sysctl, picks a kernel-owned PFN and writes its physical address to
> hard_offline_page.  Three page kinds are selectable with -k: rodata
> (default), slab or pgtable. In all cases the host should panic.
> 
> Example:
> 
>         # ./hwpoison-panic -k slab --yes-panic-my-kernel
>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'

Too trivial nit, but I couldn't resist.  Why print '<pfn>' instead of the real
pfn value, while we know it?

> 
> In dmesg, you will see:
> 
>         Memory failure: 0x100032: unhandlable page.
>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> 
> This lives in tools/mm rather than selftests/mm because every successful
> run crashes the machine, which is not something to run from CI.
> 
> The --yes-panic-my-kernel argument is required so an accidental
> invocation does not take the box down.

Looks useful to me, thank you!

> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: SJ Park <sj@kernel.org>

[...]
> +static const char *inject_hwpoison(const struct page_kind *kind,
> +				   uint64_t phys_addr, uint64_t pfn)
> +{
> +	char buf[32];
> +	int fd, len;
> +	ssize_t ret;
> +
> +	printf("injecting hwpoison at phys 0x%llx (pfn 0x%llx, kind=%s)\n",
> +	       (unsigned long long)phys_addr, (unsigned long long)pfn,
> +	       kind->name);
> +	printf("expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'\n");
> +	fflush(stdout);
> +
> +	fd = open(INJECT_PATH, O_WRONLY);
> +	if (fd < 0)
> +		return "cannot open " INJECT_PATH;
> +
> +	len = snprintf(buf, sizeof(buf), "0x%llx", (unsigned long long)phys_addr);

Yet another trivial comment.  I'm not a big fan of >80 columns lines, but I
understand there are various tastes :)


Thanks,
SJ

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
