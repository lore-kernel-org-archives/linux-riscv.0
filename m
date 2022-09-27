Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05DFC07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHNwErKxtMKDaRYkwqZoqHOPDgFk9a5pwNA7HrxnaQE=; b=LngCOX1n3Op4wc
	uVMzqYXGtAb/BI4/tDP1DgEmhthPGeeI9RhRZ1iBlu965JrYKJo7s4Ii6T8nA8zcf04DZamqeYV/N
	D6Wkwc69xtyuXz0BU54E+gKCyc72drYQ9aCwRnTfJlcD5Vtn8g3JooFHXp54nobMSRVhg2WAZbYuA
	C7P76Z1mYct3h1C/l9C8iulfqsdBCHzhOfwU+bxtEqYNEbVKYeaLMgfH6RHOl9/b0BUeUkAA8zHpI
	QSv7DzCDRMp7MGP5erc6paufwenfPW7rvyVroNDy/aNdr9qtsLoWboQtRkl8WgNioNNMKaw/69m40
	6ZyTB591WSHzFTtXDvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od3u1-008WeC-6e; Tue, 27 Sep 2022 06:17:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od3tq-008WYZ-86; Tue, 27 Sep 2022 06:16:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E1121042;
	Mon, 26 Sep 2022 23:16:57 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FBDD3F73B;
	Mon, 26 Sep 2022 23:16:41 -0700 (PDT)
Message-ID: <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
Date: Tue, 27 Sep 2022 11:46:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
 yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
 zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Barry Song <21cnbao@gmail.com>,
 wangkefeng.wang@huawei.com, xhao@linux.alibaba.com,
 prime.zeng@hisilicon.com, Barry Song <v-songbaohua@oppo.com>,
 Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220921084302.43631-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_231658_371446_88F79AF9 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

[...]

On 9/21/22 14:13, Yicong Yang wrote:
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/* for small systems with small number of CPUs, TLB shootdown is cheap */
> +	if (num_online_cpus() <= 4)

It would be great to have some more inputs from others, whether 4 (which should
to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
is optimal for an wide range of arm64 platforms.

> +		return false;> +
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
> +		return false;
> +#endif
> +
> +	return true;
> +}
> +

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
