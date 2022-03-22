Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CE8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 22:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AO3lhLD7bFQ9gKJ7+I/46bjOh7DDEZSSgLeAas0Fm8=; b=d45KVBl8rP6NQf
	vtyjWYPjoacHHdjZyy8x/GHT4rFwp06fVFBaR7DyNaBJGGMM49tpgnnOxtJxEHmAW9+6jhn6b9RzR
	EIhEg5T0/5og4Y2E3CXx9xWZCuNV1xOwOF/1iC/vqMn1/ctOOdbeF7mIHaD5Z5ufznWXU8g7mlPwF
	eg0jcOxxKu4sGhAh2sPWbupAF4dNkEJ4MvEEfA0Xi5ek39VAGMhQQPg3bixNn94MnzaR+HEj0SlIs
	t54LitF2QTPehuQ0y9hRd4co44RxNBf6j4Iv4DP3MX6t+Zd93TX66/IlxrgegpwyQfgOYCV0bk2Wh
	JcYT/8m0DyoQXVy9ZuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWmwN-00CLF0-EB; Tue, 22 Mar 2022 22:25:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWmwL-00CLEj-3d; Tue, 22 Mar 2022 22:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eovEULQEtS4IdiH2X4rLza7n8ELjkv/QjM+V7uK+7fE=; b=bnzkSlKmoegZQal9eq4WRnfrF7
 ErKu7+9xgc0b6+vxkkrSQtEv8hg6b4//HkBa4pUFTUyVM0qYYjprX4a/WUNnYdapLfTIdqyUOJTdF
 NbXWmYCZ5mB64t/qkPw00QKjod2qtFMlEMaam+/6/Q1GxBo8XNRMDhKggxXUMYb3xw0JTzMCXpuhA
 QqeIR6iB1E34oDkeZqDQ/0XcdUHJlfuyUmyuQgUl85/MgC8+/HF5YYa4//BzdDiI7l1qPWj+0GvU7
 /KwPpGU4rd9usZ3WcyxJ75uOnZlU5jm6C1EI0xiye+wAIx9AKvNj8L5q1r0aS6HL6p/cqPr8N/kqp
 jV8/jPtw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWmwC-003a9a-DV; Tue, 22 Mar 2022 22:25:12 +0000
Message-ID: <32f48850-c72d-a551-8383-b2ad344c38d3@infradead.org>
Date: Tue, 22 Mar 2022 15:25:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] perf: RISC-V: Remove non-kernel-doc ** comments
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Atish Patra <atishp@rivosinc.com>
Cc: atishp@atishpatra.org, anup@brainfault.org, Will Deacon
 <will@kernel.org>, mark.rutland@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20220322220147.11407-1-palmer@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220322220147.11407-1-palmer@rivosinc.com>
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



On 3/22/22 15:01, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This will presumably trip up some tools that try to parse the comments
> as kernel doc when they're not.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> 
> --
> 
> These recently landed in for-next, but I'm trying to avoid rewriting
> history as there's a lot in flight right now.
> ---
>  drivers/perf/riscv_pmu_sbi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a1317a483512..dca3537a8dcc 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,7 +35,7 @@ union sbi_pmu_ctr_info {
>  	};
>  };
>  
> -/**
> +/*
>   * RISC-V doesn't have hetergenous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -477,7 +477,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>  
>  static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  {
> -	/**
> +	/*
>  	 * No need to check the error because we are disabling all the counters
>  	 * which may include counters that are not enabled yet.
>  	 */
> @@ -494,7 +494,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>  		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
>  }
>  
> -/**
> +/*
>   * This function starts all the used counters in two step approach.
>   * Any counter that did not overflow can be start in a single step
>   * while the overflowed counters need to be started with updated initialization
> @@ -563,7 +563,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>  	/* Overflow status register should only be read after counter are stopped */
>  	overflow = csr_read(CSR_SSCOUNTOVF);
>  
> -	/**
> +	/*
>  	 * Overflow interrupt pending bit should only be cleared after stopping
>  	 * all the counters to avoid any race condition.
>  	 */

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
