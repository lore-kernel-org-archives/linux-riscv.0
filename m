Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC07EC636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKd4nBCkNdTxGhBAX6XHegT2s71jZ/VXH5rG8RlfWOQ=; b=qKyJLu/wN9cqB4
	f41yTmnD0Zh1S65j+3axjg4/nGlr54smlT3qKZ1mk/OeXbGg0ulHPHiYxiYtSIKKpIOw4XS8c5CbY
	tJsj96Ea5TgTzyVWcKiAuImH9T9qovPNutlL+BfsBlSD8dKSbMAhwCWpNkJWLLWsQX3s0mKMiRwEV
	PKTWv25TCTlk5xMvlZ8aIcLj79fTKJcDYQJlp6VbreCsVaCqThZ6ufA1UxnB1LU7Cu5aY97oSOxto
	b6HC7Y6fW8cKaiJuIri1E1WR6r/8ADgW9F1Xp7JshrQ5c1rDAYdOFKfWg6n7jeD8DUqNtwEDNA+bS
	4r5B2I6ynsKQusIaNgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBnN-00BciS-6s; Wed, 01 Feb 2023 12:00:57 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBnI-00BchD-PQ
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 12:00:55 +0000
Received: from [10.210.135.129] (unknown [111.199.71.227])
	by APP-01 (Coremail) with SMTP id qwCowAA3Mz9kVNpjuhwYAw--.17119S2;
	Wed, 01 Feb 2023 20:00:37 +0800 (CST)
Message-ID: <974b75e8-be10-b29b-1ed1-518736b1e2b6@iscas.ac.cn>
Date: Wed, 1 Feb 2023 19:58:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v11 0/3] riscv, mm: detect svnapot cpu support at runtime
Content-Language: en-US
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, conor@kernel.org,
 ajones@ventanamicro.com
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
X-CM-TRANSID: qwCowAA3Mz9kVNpjuhwYAw--.17119S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr47tFy3ur1UJr1UtF1kKrg_yoW5Ary8pF
	WUGrn3CF98Ar93KF4avrnF9rs5t3WrGayaqw1fJ34UAwsxtFW5Cws0yF90k3WkXFWfXr1I
	kF45ZFyj93WDA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfU5sqWUUUUU
X-Originating-IP: [111.199.71.227]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwUJDGPZ5Xr5agAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_040053_245593_EB055CFD 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Palmer,

Just a friendly ping :)

Is there anything else I need to do for this patchset?

Thanks,
Qinglin

On 2022/12/16 14:21, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is on,
> and people can set it off if they don't allow kernel to detect Svnapot
> hardware support and leverage it.
> 
> Tested on:
>    - qemu rv64 with "Svnapot support" off and svnapot=true.
>    - qemu rv64 with "Svnapot support" on and svnapot=true.
>    - qemu rv64 with "Svnapot support" off and svnapot=false.
>    - qemu rv64 with "Svnapot support" on and svnapot=false.
> 
> 
> Changes in v2:
>    - detect Svnapot hardware support at boot time.
> Changes in v3:
>    - do linear mapping again if has_svnapot
> Changes in v4:
>    - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> Changes in v5:
>    - modify code according to @Conor and @Heiko
> Changes in v6:
>    - use static key insead of alternative errata
> Changes in v7:
>    - add napot_cont_order for possible more napot order in the future
>    - remove linear mapping related code from this patchset to another patch
>    - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
>    - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
>    - support svnapot in huge vmap on newer for-next branch
> Changes in v8:
>    - fix compilation errors in rv32_defconfig
>    - insert some lines of whitespace according to @Conor's suggestion
> Changes in v9:
>    - use alternative to avoid using static branches inside heavily used
>      inline functions
>    - change napot_cont_mask definition
>    - post test_vmalloc modification about testing vmalloc_huge
> Changes in v10:
>    - fix some nits caught by @Andrew
>    - collect Reviewed-by/Acked-by
>    - add memory leak warning in KConfig text
>    - replace test_vmalloc patch link with the standard one
> Changes in v11:
>    - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig text
>    - fix missing reverse-xmas tree
> 
> 
> Qinglin Pan (3):
>    riscv: mm: modify pte format for Svnapot
>    riscv: mm: support Svnapot in hugetlb page
>    riscv: mm: support Svnapot in huge vmap
> 
>   arch/riscv/Kconfig                   |  21 +-
>   arch/riscv/include/asm/errata_list.h |  15 +-
>   arch/riscv/include/asm/hugetlb.h     |  34 ++-
>   arch/riscv/include/asm/hwcap.h       |   2 +-
>   arch/riscv/include/asm/page.h        |   5 -
>   arch/riscv/include/asm/pgtable-64.h  |  34 +++
>   arch/riscv/include/asm/pgtable.h     |  43 +++-
>   arch/riscv/include/asm/vmalloc.h     |  61 +++++-
>   arch/riscv/kernel/cpu.c              |   1 +
>   arch/riscv/kernel/cpufeature.c       |  15 ++
>   arch/riscv/mm/hugetlbpage.c          | 301 +++++++++++++++++++++++++++
>   11 files changed, 519 insertions(+), 13 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
