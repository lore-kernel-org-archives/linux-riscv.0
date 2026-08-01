Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF17C5516F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgnKtIFrLT4WB+0m6KUAIYzk90SGgt69P7TftoRSyWo=; b=xHl0WrWBQYep5d
	UpiYoeBlvwBWHB8XU4d9hIPkqCEPGsBP+O94CaH0GY6nBpubuY+K/b3LenwTOk2VtshfFqvmmwBGM
	zKBx6ig23DonYDXYK/PPO3urqDYxL3dV1TaI+sd0dMeFOErFzzZMF0H+gwgPtQHJyJsswKI6xAl6C
	a7O8YvIrrORROA+I+NSFKPgDbNDT8dYiz1QboriGYabrAfqHUuf6lenEW8OzsCudXCP6wcQvPovP5
	QSIyWlojptvRTDaWfp9BdUlLOdOb0N3Fb7Ajza9n7zqRwLuxOhEqTbY3kX5FhR2Xdiuw19sjcMmFz
	d7SOiSdRth6RyZJLpt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpy3c-0000000Dmya-0CQh;
	Sat, 01 Aug 2026 00:58:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpy3b-0000000DmyU-23rr
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 00:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B83D543C3A;
	Sat,  1 Aug 2026 00:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D501F00AC4;
	Sat,  1 Aug 2026 00:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785545910;
	bh=LYRQpuzIyMl3zJADWFX5IN1PL3+LNC1In3syVPUK/5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d2vjah6UX4HkhcO/C80E/gRhOBWJZ5SSXbNB0qiZz+WfzvCn3guWvCwnQ4pbpjV16
	 cUVgtuJDxq3ZXRK0l6vidQr5Yc8izrZh1b0MolILgsT0WkFS232GW9DoUeK7g0OLAg
	 3gOJ+tOFkMZRKvgXJh4lH9EG65N+4n57enz2fJ59qymLGd93f88ubVL/x5DYUZMZ9q
	 UiB2STglkP9IEWDUWm/MdrwuU4AWhnGBNA4xHeCRPs/33kxircMfIPWMeVWScITbRK
	 1vRhVer5ahnOMz2Lr7Nyv9BTFUOoxNm7zJah5w/7SxNjxCBamHBqZfzkXqjW26YcC+
	 yB4JTdCqX1zhA==
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
Subject: Re: [PATCH] tools/mm: add hwpoison-panic tool
Date: Fri, 31 Jul 2026 17:58:22 -0700
Message-ID: <20260801005822.85110-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-memory_failure_rewrite_test-v1-1-6aa8c6435693@debian.org>
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

On Fri, 31 Jul 2026 06:16:12 -0700 Breno Leitao <leitao@debian.org> wrote:

> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> sysctl, picks a kernel-owned PFN and writes its physical address to
> hard_offline_page.  Three page kinds are selectable with -k: rodata
> (default), slab or pgtable. In all cases the host should panic.
> 
> Example:
> 
>         # ./hwpoison-panic  -k slab -f
>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> 
> In dmesg, you will see:
> 
>         Memory failure: 0x100032: unhandlable page.
>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> 
> This lives in tools/mm rather than selftests/mm because every successful
> run crashes the machine, which is not something to run from CI.

If the purpose of the new program is testing, would it make more sense to put
it under tools/testing/ ?

Also, does this test really need to be end-to-end test that cause panic?  How
about doing unit test of core functions, using tools like kunit?  Or,
live-patching panic() to only print messages and return before running the
test?

> 
> Argument -f is required so an accidental invocation does not take the
> box down.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  MAINTAINERS                              |   1 +
>  tools/mm/.gitignore                      |   1 +
>  tools/mm/Makefile                        |   2 +
>  tools/mm/memory-failure/hwpoison-panic.c | 353 +++++++++++++++++++++++++++++++
>  4 files changed, 357 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56b337a064478..799c4883d5b0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12094,6 +12094,7 @@ F:	include/linux/memory-failure.h
>  F:	include/trace/events/memory-failure.h
>  F:	mm/hwpoison-inject.c
>  F:	mm/memory-failure.c
> +F:	tools/mm/memory-failure/
>  F:	tools/testing/selftests/mm/memory-failure.c
>  
>  HYCON HY46XX TOUCHSCREEN SUPPORT
> diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
> index 1446a659e5408..b9b80d909db4a 100644
> --- a/tools/mm/.gitignore
> +++ b/tools/mm/.gitignore
> @@ -3,3 +3,4 @@ slabinfo
>  page-types
>  page_owner_sort
>  thp_swap_allocator_test
> +memory-failure/hwpoison-panic
> diff --git a/tools/mm/Makefile b/tools/mm/Makefile
> index 858186a6eefdb..9f6de957a95a0 100644
> --- a/tools/mm/Makefile
> +++ b/tools/mm/Makefile
> @@ -4,6 +4,7 @@
>  include ../scripts/Makefile.include
>  
>  BUILD_TARGETS=page-types slabinfo page_owner_sort page_owner_filter thp_swap_allocator_test
> +BUILD_TARGETS+=memory-failure/hwpoison-panic

I was initially thought why not underscore but dash on the name?  But, I
realize it is obviously too persoanl taste.

[...]
> diff --git a/tools/mm/memory-failure/hwpoison-panic.c b/tools/mm/memory-failure/hwpoison-panic.c
> new file mode 100644
> index 0000000000000..b8076d86da15b
> --- /dev/null
> +++ b/tools/mm/memory-failure/hwpoison-panic.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * hwpoison-panic: verify vm.panic_on_unrecoverable_memory_failure by
> + * injecting a hwpoison error on a kernel-owned page and confirming the
> + * kernel panics.

While reading the above explanation, I was expecting this program will directly
say me if the kernel panic-ed or not.  But this only says if it was not
panic-ed iiuc?  How about saying, like, "Trigger intentional kernel panic by
..." ?

No strong opinion.  I'm never a good English reader.

[...]
> +static const struct page_kind *parse_args(int argc, char **argv, int *force)
> +{
> +	const struct page_kind *kind;
> +	const char *name = "rodata";
> +	int c;
> +
> +	while ((c = getopt_long(argc, argv, "k:fh", opts, NULL)) != -1) {
> +		switch (c) {
> +		case 'k':
> +			name = optarg;
> +			break;
> +		case 'f':
> +			*force = 1;
> +			break;
> +		case 'h':
> +			usage();
> +			exit(EXIT_SUCCESS);
> +		default:
> +			usage();
> +			exit(EXIT_FAILURE);
> +		}
> +	}
> +
> +	kind = lookup_kind(name);
> +	if (!kind)
> +		fatal("unknown kind '%s' (expected: rodata|slab|pgtable)\n",
> +		      name);
> +
> +	return kind;
> +}
> +
> +static void check_prereqs(int force)
> +{
> +	if (geteuid())
> +		fatal("must run as root\n");
> +	if (access(SYSCTL_PATH, W_OK))
> +		fatal("%s not present (kernel without the sysctl?)\n",
> +		      SYSCTL_PATH);
> +	if (access(INJECT_PATH, W_OK))
> +		fatal("%s not present (no MEMORY_HOTPLUG?)\n", INJECT_PATH);
> +	if (!force)
> +		fatal("this panics the kernel; pass -f to run it in a disposable VM\n");

I personally feel like this option is not very intuitive to me.  I think the
name could be better to be intuitive.  Just removing the option also seems fine
to me.  If we really want to warn the brave root user, adding an interactive
prompt (E.g., "This will panic the kernel.  Proceed? [y/N]") also be an
intuitive and safer way in my opinion.

No strong opinion.  My user experience design skill is undoubtedly bad.  Feel
free to keep this as is.

> +}
[...]
> +int main(int argc, char **argv)
> +{
> +	unsigned long phys_addr, pfn, prior;
> +	const struct page_kind *kind;
> +	const char *verdict;
> +	int force = 0;
> +
> +	kind = parse_args(argc, argv, &force);
> +	page_size = getpagesize();
> +	check_prereqs(force);

Maybe check_prereqs() can be called before getpagesize()?

[...]


Thanks,
SJ

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
