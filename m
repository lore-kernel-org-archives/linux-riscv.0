Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD2DC46467
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jan 2023 04:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrI7+sLzBXgCkWXr/2AH+Jz0nv8GtqUt+F+g1JAbiZw=; b=Fx1fJRNqk+deFm
	TR8t5KJaibgYAm+ymu933xdIwso1fL7wxikFj+Q0AVwmNPDFiSSg9UE6XCyTjbwLki/9+CstbwQOh
	qwLcaXDfVaf5jcBaSvH25hfaVywB7VHvBbOgs0S4+WobWlNF/n+G+nGDoi7uaLE+XSbcywD7EUo/R
	RfEctjOsT8v/oIyEDL9TaHybAatoCPRJfxRj59VCakqJOtTFK/i2lR9kPPzu+p/vHf91cxo6/kl73
	MXGwkhb8hyLa/i9EqUC5l5TcIfM6Q8ETRyu1L96qlFJ2eC1pA65svK7OCkwk/IZR1LULStzA3uoKm
	meXuDr3D/aYSgSyL7viA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYaT-005F1O-J8; Sat, 14 Jan 2023 04:56:13 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGYaP-005F0E-NJ
	for linux-riscv@lists.infradead.org; Sat, 14 Jan 2023 04:56:12 +0000
Received: from [192.168.124.8] (unknown [125.79.20.228])
	by APP-01 (Coremail) with SMTP id qwCowACnqETVNcJjkQsQAA--.2956S2;
	Sat, 14 Jan 2023 12:55:51 +0800 (CST)
Message-ID: <cae8a125-24c7-81e7-899f-5a677cb86bc2@iscas.ac.cn>
Date: Sat, 14 Jan 2023 12:54:45 +0800
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
X-CM-TRANSID: qwCowACnqETVNcJjkQsQAA--.2956S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr47tFy3ur1UJr1UtF1kKrg_yoW5WFW5pF
	WUGrs3CF98Ar93KFsIvrnF9rs5tFn5Gayaqw1fJ34UAwsxtFW5Aws0yF90k3WkJFWfXr10
	yF45ZFyj9a4DA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjxUgQzVDUUUU
X-Originating-IP: [125.79.20.228]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwMLDGPBc--VMwAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_205610_174335_D859A371 
X-CRM114-Status: GOOD (  18.25  )
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

a friendly ping?

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
