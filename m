Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D52C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:51:41 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBFD461413
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBFD461413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C0DcsJDXP4cKbomDrfDiDy5h+1vBBzOwoLOECIu7UOs=; b=F0HpvCzIZFTtJWkpClk/lwaiHc
	7OeKOpUCvMzRWJPEELZfdouz2Ho+bW972TQVcdHvprzlAaJUqpL2PFXNEcXzPNfCMj2GtfDzcezfp
	1IXZdn3bXAwYsgfIpkehoex/EtMlhCLM4/AdvpQgHjY2b3ra31kykaB4Aj6iUr4IGjOF7ynyng78a
	LR98qK3X38fgUi6LQo6gaLmjFJSsOhV3TF0E9NIzwc0+572FcTbU0YCX+hO7qT6Ln6O8P1qDCNl+K
	jjZWGPUPeGBt8P6RhFnmq0yNzZjggCVxYbrySyEACSxJvtlNiOvxZfOzQxecDtpTvMu8nTGHHwpsk
	ZWSqCL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9SU-000K03-OF; Tue, 15 Jun 2021 13:50:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Fq-000DDm-Tj
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=dY4/0t04KFhfKEfeeQPY/UKc8Hz3xhT/LXpQW76N4T4=; b=QfjH4EjQv8Z0Do8bw/S018WHLi
 /V+QKHM2pak0SzJkRitDdD21fHG87Il6BlcdgAuuAdALV/jJyyzHBUGf0b/G5vPO/NamptdzP8L1E
 ruPIW6nSyxRNRIX00SiKVPqNuk3a/qYcUs+OmJlaN7XyEq0UFI/pvP82IcqlQ5yHYsMl8fDiD6fEQ
 NzOr5iyv3VIm3m1y6Z4d6LXTxFLZ3WiWChulkY/ZCalYcu4BZn1vjNeJEwOZXF/ao9Hg8mWeMSPG7
 csZn1s6F7PqfTc52AubAo0Av/Hg2AqSpFuww+R5J7sjx+yuARJ5iPnH7rkFjmwic9MwGN4sus1UBt
 I2sbL7nA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt77i-007lnR-76
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 11:20:59 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G45QF4lXpz7044;
 Tue, 15 Jun 2021 19:17:41 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:20:50 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:20:50 +0800
Subject: Re: rebased ASID-based tlbflush
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20210606152050.636038-1-hch@lst.de>
 <mhng-fe973a87-b364-4190-96f5-194895558801@palmerdabbelt-glaptop>
 <CAJF2gTQE-PrUU8xDo8=u+V984sW84DnPb_rW=UcAOLmh4HnDrA@mail.gmail.com>
CC: Christoph Hellwig <hch@lst.de>, Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <a06ebb56-2fd7-d8f8-866e-ea235f52696b@huawei.com>
Date: Tue, 15 Jun 2021 19:20:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQE-PrUU8xDo8=u+V984sW84DnPb_rW=UcAOLmh4HnDrA@mail.gmail.com>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_122057_597820_8988AB44 
X-CRM114-Status: GOOD (  21.71  )
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

On 2021/6/13 21:08, Guo Ren wrote:
> I've just tested your for-next, but:
>
>  LD      .tmp_vmlinux.kallsyms1
> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
> mm/vmalloc.o: in function `.L0 ':
> vmalloc.c:(.text+0x2bd2): undefined reference to `pud_clear_huge'
> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
> mm/vmalloc.o: in function `.L1225':
> vmalloc.c:(.text+0x2cac): undefined reference to `pud_clear_huge'
> Makefile:1191: recipe for target 'vmlinux' failed
>
> I quick fixup with the simple patch:
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 738dc6f3530f..b1fbd575cbac 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -25,6 +25,14 @@ int pmd_clear_huge(pmd_t *pmd)
>  }
>  #endif
>
> +int pud_clear_huge(pud_t *pudp)
> +{
> +       if (!pud_leaf(READ_ONCE(*pudp)))
> +               return 0;
> +       pud_clear(pudp);
> +       return 1;
> +}
> +
>  int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  {
>         pte_t *pte;
>
> I think it's from:
> commit 14512690a16537527dacf0f5cd3d2263be317f35
> Author: Liu Shixin <liushixin2@huawei.com>
> Date:   Sat Jun 5 13:48:37 2021 +0800
>
>     riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
>
>     This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
>     define the required page table functions(Currently, riscv has only
>     three-level page tables support for 64BIT).
>
>     Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>     Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
This commit is based on linux-next. pud_clear_huge() have been defined in pre-commit
("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge") which is not on for-next.
The code is different and thus an error is reported here.
Should I rebase the patch on for-next and resend it?

thanks,
> On Sun, Jun 13, 2021 at 8:47 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>> On Sun, 06 Jun 2021 08:20:48 PDT (-0700), Christoph Hellwig wrote:
>>> Hi all,
>>>
>>> this is what I think is a resonable set of patches for the ASID based
>>> flushing, largely based on the work from Guo and thus attributed to him.
>> Thanks, these are on for-next.
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
