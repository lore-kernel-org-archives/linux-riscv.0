Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CDC28B2F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 03:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znqijF1vzteyOkgS3HKY3VmoCionJSRwe/sRI2HSJP0=; b=x0IYw2Efjolgo9
	zdFt1mWGhJ0fHsuqnW4SU9Rsysx2SNdX8EnhcrNnwCNHV8yQ2Df1jqSSmKx6pMWRILJTLrPjZWp/K
	Rb9/Dh3JOzlGnqQ/jEoRSuEccogN8ODpb/6MTvK0SOBPvJB9HeSRJOZqGcyQUdVGXxJBuVBxF5ggl
	7w/iwibQtLuPqFDmFSZghLNqtlPnmdheE93dJrzv/FG0nVD8flzDyCrb21RujBjxMK4bRANk+OAEx
	gQr9o/BJyz49F6uRV3YagTYUn6jmuy26VApPT0cSLHOTSefXW8wabwXq6PELM5+VpSSAtzh1RDm2H
	DWVldREZAzx2XbVYasEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0pn-000000011ax-0HxZ;
	Mon, 17 Mar 2025 03:08:11 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0oN-000000011OP-0h6P
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 03:06:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZGKcP09Gdz4f3jt8
	for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 11:06:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3B6651A1D02
	for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 11:06:30 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgCnB1ywkddnJjbjGg--.29453S2;
	Mon, 17 Mar 2025 11:06:26 +0800 (CST)
Message-ID: <18b3bbb9-0733-4f0a-b859-2aabceefbc67@huaweicloud.com>
Date: Mon, 17 Mar 2025 11:06:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match
 __arch_ftrace_regs argument of ftrace_return_to_handler
To: kernel test robot <lkp@intel.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Pu Lehui <pulehui@huawei.com>
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
 <202503160820.dvqMpH0g-lkp@intel.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <202503160820.dvqMpH0g-lkp@intel.com>
X-CM-TRANSID: gCh0CgCnB1ywkddnJjbjGg--.29453S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4kJFW5Zr13JrWkAw1UWrg_yoWrCFy3pr
	W8A3WDG3yFkr1Iga4IyrZ7uw4Utw4Duw1rWF93Ars7WF4qvrWIk3Wxtrs0qryvqr40gr9F
	9ryj9wsFkrWUAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_200643_509914_8CF1DDD8 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2025/3/16 9:16, kernel test robot wrote:
> Hi Pu,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.14-rc6 next-20250314]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Pu-Lehui/riscv-fgraph-Fix-stack-layout-to-match-__arch_ftrace_regs-argument-of-ftrace_return_to_handler/20250311-212440
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250311132243.2178271-1-pulehui%40huaweicloud.com
> patch subject: [PATCH] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
> config: riscv-randconfig-001-20250316 (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503160820.dvqMpH0g-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
>     addi sp, sp, -FREGS_SIZE_ON_STACK
>                  ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>>> <instantiation>:2:17: error: unexpected token
>      sw ra, FREGS_RA(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>     <instantiation>:3:17: error: unexpected token
>      sw s0, FREGS_S0(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>     <instantiation>:4:17: error: unexpected token
>      sw a0, FREGS_A0(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>     <instantiation>:5:17: error: unexpected token
>      sw a1, FREGS_A1(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>     <instantiation>:6:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
>      addi s0, sp, FREGS_SIZE_ON_STACK
>                   ^
>     arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
>      SAVE_RET_ABI_STATE
>      ^
>     <instantiation>:1:16: error: unexpected token
>     lw ra, FREGS_RA(sp)
>                    ^
>     arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
>      RESTORE_RET_ABI_STATE
>      ^
>>> <instantiation>:2:17: error: unexpected token
>      lw s0, FREGS_S0(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
>      RESTORE_RET_ABI_STATE
>      ^
>     <instantiation>:3:17: error: unexpected token
>      lw a0, FREGS_A0(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
>      RESTORE_RET_ABI_STATE
>      ^
>     <instantiation>:4:17: error: unexpected token
>      lw a1, FREGS_A1(sp)
>                     ^
>     arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
>      RESTORE_RET_ABI_STATE
>      ^
>     <instantiation>:5:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
>      addi sp, sp, FREGS_SIZE_ON_STACK
>                   ^
>     arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
>      RESTORE_RET_ABI_STATE
>      ^
> 

Nice catch. The reason is that HAVE_DYNAMIC_FTRACE can be diabled when 
CONFIG_MMU=n, and lead to disable HAVE_DYNAMIC_FTRACE_WITH_ARGS. 
However, the current fgraph on riscv relies on the infrastructure of 
DYNAMIC_FTRACE_WITH_ARGS. So let's select HAVE_FUNCTION_GRAPH_TRACER 
depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS. I will send new soon.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
