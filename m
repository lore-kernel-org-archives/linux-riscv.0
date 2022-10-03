Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D91C43217
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fcwDFdzguW1naxTXYk9ElqGJD235hvCRIY6t+SfnJg=; b=RGuBUoRfSpQzsO
	dklT4REWORNj6Ewkdjbz0aLAKd6sbf5pRDszqAhl1UIZIIfPCC3yOGjAyxHvTmg8R0nBxJdz6xOpj
	81JMCxR/tppGaRu84Upt2VINi33wHpQTAQBYJOpIQCe1QDEz0w4j4IOzP9GB8qFzcuzEiZtyZlngj
	qPoNus6r5tpYX95LH5/1ZDAig4MnnmjFOHTa2rnBbU881H3pYd4wahJZymAfo9Ruf/U5LfJ9aVp6a
	P5QUCvYik7HKrdE+w1TIQTR7DCikkarQGNPiFCFeki49jlblKI+IO8SWdU2h0I4XFi0xUo1ZnMP/M
	GTclCXdXzto0nmKqLS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLtC-0066z8-WA; Mon, 03 Oct 2022 13:53:47 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLtA-0066xa-Eb
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:53:46 +0000
Received: from [198.18.0.1] (unknown [124.16.96.231])
	by APP-01 (Coremail) with SMTP id qwCowAAnyGli6TpjdpAYAw--.13460S2;
	Mon, 03 Oct 2022 21:53:40 +0800 (CST)
Message-ID: <fda428b0-11ac-7b75-b2e1-c169042e476e@iscas.ac.cn>
Date: Mon, 3 Oct 2022 21:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v5 0/4] riscv, mm: detect svnapot cpu support at runtime
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
X-CM-TRANSID: qwCowAAnyGli6TpjdpAYAw--.13460S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF43Zw4ruFy7Gw4kXw1DWrg_yoW8CF4DpF
	WDCrs3GF98CryfGF1avryDurs8tw1rGayaqw1xJ34UAws3tay5uw1qy3Z8C3WkXFWfXF1I
	kF45CFyY934DZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5QyCtUUUUU==
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQAIDGM6o59cXwABsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_065344_887842_3CD2FA8D 
X-CRM114-Status: GOOD (  11.76  )
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

Sorry for missing below information.

Changes in v2:
   - detect Svnapot hardware support at boot time.
Changes in v3:
   - do linear mapping again if has_svnapot
Changes in v4:
   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
Changes in v5:
   - modify code according to @Conor and @Heiko's suggestions.
     Thanks @Conor @Heiko


On 10/3/22 9:47 PM, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in Linux Kernel's boot process
> and hugetlb fs.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is off,
> and people can set it on if they allow kernel to detect Svnapot hardware
> support and leverage it.
> 
> Tested on:
>    - qemu rv64 with "Svnapot support" off and svnapot=true.
>    - qemu rv64 with "Svnapot support" on and svnapot=true.
>    - qemu rv64 with "Svnapot support" off and svnapot=false.
>    - qemu rv64 with "Svnapot support" on and svnapot=false.
> 
> 
> Qinglin Pan (4):
>    mm: modify pte format for Svnapot
>    mm: support Svnapot in physical page linear-mapping
>    mm: support Svnapot in hugetlb page
>    mm: support Svnapot in huge vmap
> 
>   arch/riscv/Kconfig                   |  17 +-
>   arch/riscv/include/asm/errata_list.h |  23 ++-
>   arch/riscv/include/asm/hugetlb.h     |  30 +++-
>   arch/riscv/include/asm/hwcap.h       |   3 +-
>   arch/riscv/include/asm/page.h        |   2 +-
>   arch/riscv/include/asm/pgtable-64.h  |  13 ++
>   arch/riscv/include/asm/pgtable.h     |  68 +++++++-
>   arch/riscv/include/asm/vmalloc.h     |  28 +++
>   arch/riscv/kernel/cpu.c              |   1 +
>   arch/riscv/kernel/cpufeature.c       |  18 ++
>   arch/riscv/mm/hugetlbpage.c          | 250 ++++++++++++++++++++++++++-
>   arch/riscv/mm/init.c                 |  28 ++-
>   12 files changed, 467 insertions(+), 14 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
