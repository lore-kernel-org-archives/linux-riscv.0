Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A3C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VU/0TVsdMUlMW7lDLd6FYYtxjqEuQKCDYKcmmZMD9xg=; b=3fWkanU1XHTZ+3NmjNg64a4gs6
	Tdvbqczl7zwzQMYwXFztjZted3cy7T34xX+KkJc0RSIaIMC++bRxTzVOI89AibCaK2mbol4C1H17/
	fOglWoWqMNofSP4VtCiZuoKdOX5IYGUgFJWgpnHsTh/kYHBlKpLa29jZX2I45m2ltg99PjsASJJyE
	K2gTjlqFdAZ9xb8aohwBqdczrHaPLwveINSr4H3yQ33EP27cJ5FEHf0NxqPSDblBv+oqb5Y3qMEjC
	/oQMrp/gnqlfg+jVa361YAVj4mwiurx9p45yKeyKAVw60conVRL22sSRBUJLJdZV8NPx0ZxjFbnYo
	Te39x6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPxw-000000001B9-0p0P;
	Thu, 13 Aug 2026 07:35:04 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPxs-00000000100-0ySA
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 07:35:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zoQ5TKlhdKb/TFvHz+bAuP7Jqfz8RbpAKs8Q7ChZ5Mc=;
	b=11K6OQ/l6CX9yOZpy3sCXPQi38J0UeXCQl4f0o5jcxxCljMjDLy0aDX0PBmhRWYoAl5yFwruA
	D8CXHmEyy2TCEVn9azg+QMlAfPJekl+cOYs6qt/xgsevf8jYOi3tt7CNK+VT6s4xPoHBRO9ivcE
	4A0W3OUB1toinvjMeZoBDAs=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hLGz80LMwz1T4JN;
	Thu, 13 Aug 2026 15:22:44 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id BFF734057F;
	Thu, 13 Aug 2026 15:32:35 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 15:32:35 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Aug 2026 15:32:34 +0800
Subject: Re: [PATCH v2] tools/mm: add hwpoison-panic tool
To: Breno Leitao <leitao@debian.org>
CC: SJ Park <sj@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<kernel-team@meta.com>, Andrew Morton <akpm@linux-foundation.org>, "Naoya
 Horiguchi" <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <david@kernel.org>
References: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <be68a841-a326-4826-8e02-5148736dd356@huawei.com>
Date: Thu, 13 Aug 2026 15:32:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
Content-Language: en-US
X-Originating-IP: [10.173.124.160]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_003500_915622_3E190FDE 
X-CRM114-Status: GOOD (  22.90  )
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

On 2026/8/3 19:31, Breno Leitao wrote:
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
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

This patch looks good to me with some nits below.

> ---
> Changes in v2:
> - Reword the file header, the tool triggers a panic rather than
>   confirming one (SJ Park)
> - Rename -f to --yes-panic-my-kernel and say in usage() what it costs
>   (SJ Park)
> - Call check_prereqs() before getpagesize() (SJ Park)
> - Use 64-bit types for physical addresses and PFNs.  On a 32-bit build
>   the old long/unsigned long pair truncated addresses above 4G, and the
>   negative error sentinel was indistinguishable from a valid address at
>   or above 2G
> - Link to v1: https://patch.msgid.link/20260731-memory_failure_rewrite_test-v1-1-6aa8c6435693@debian.org
...
> +
> +static int pick_kpageflags_phys_addr(uint64_t want, uint64_t *phys_addr)
> +{
> +	uint64_t pfn = (16UL << 20) / page_size;

Could we use SZ_16M macro here?

> +	uint64_t flags;
> +	int ret = -1;
> +	int fd;
> +
> +	fd = open(PROC_KPAGEFLAGS, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	for (; kpageflags_read(fd, pfn, &flags) == 0; pfn++) {
> +		if ((flags & want) && !(flags & BIT(HWPOISON)) &&
> +		    !(flags & BIT(NOPAGE)) && !(flags & BIT(COMPOUND_TAIL))) {
> +			*phys_addr = pfn * page_size;
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	close(fd);
> +	return ret;
> +}
> +
> +static int read_sysctl(unsigned long *val)
> +{
> +	FILE *f = fopen(SYSCTL_PATH, "r");
> +	int ret;
> +
> +	if (!f)
> +		return -1;
> +	ret = fscanf(f, "%lu", val) == 1 ? 0 : -1;
> +	fclose(f);
> +
> +	return ret;
> +}
> +
> +static int write_sysctl(unsigned long val)
> +{
> +	FILE *f = fopen(SYSCTL_PATH, "w");
> +	int ret;
> +
> +	if (!f)
> +		return -1;
> +	ret = fprintf(f, "%lu", val) < 0 ? -1 : 0;
> +	fclose(f);
> +
> +	return ret;
> +}
> +
> +/* hard_offline_page() injects with MF_SW_SIMULATED, so unpoison is allowed. */
> +static void unpoison_pfn(uint64_t pfn)
> +{
> +	char path[PATH_MAX], buf[32];
> +	const char *debugfs;
> +	int fd, len;
> +
> +	debugfs = debugfs__mount();

I might be miss something but I can't find the implementation of debugfs__mount.

> +	if (!debugfs)
> +		return;
> +
> +	snprintf(path, sizeof(path), "%s/hwpoison/unpoison-pfn", debugfs);
> +	fd = open(path, O_WRONLY);
> +	if (fd < 0)
> +		return;
> +
> +	len = snprintf(buf, sizeof(buf), "0x%llx\n", (unsigned long long)pfn);
> +	if (write(fd, buf, len) < 0)
> +		perror("unpoison-pfn");
> +	close(fd);
> +}
> +
...
> +
> +static void check_prereqs(int armed)
> +{
> +	if (geteuid())
> +		fatal("must run as root\n");
> +	if (access(SYSCTL_PATH, W_OK))
> +		fatal("%s not present (kernel without the sysctl?)\n",
> +		      SYSCTL_PATH);
> +	if (access(INJECT_PATH, W_OK))
> +		fatal("%s not present (no MEMORY_HOTPLUG?)\n", INJECT_PATH);

MEMORY_HOTPLUG?

Thanks.
.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
