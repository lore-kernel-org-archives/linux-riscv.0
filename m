Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6877FC32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 05:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+X1WeArrQf9wtbLctOu0oedlbVA0VIbDwwMPijIWuE=; b=BPbU2dYnnSYKVO
	qZirJCX6C7rFFFPqlxaP6B/nKB+Bqlw3XiDrb/XiBnfZV/9n80TLFSxBwubEpIudKBnpa6KeKLs9x
	k00jtyChmbEIZ1dJUJhj/oFGmRFrCTTrOfDzfr8Ujc/N4jk6N3Ov5t5nd4gdBOes9rEOplP210mil
	3u7d9bR0oPIzK+dFQ/dAIauNAjxA4yUBbJSI12ohp5PIp5YYB1HERd4u1D34jqkFwQPSWk68QQ9l6
	F1kI6/7UjHdlCUrZRdk3X2kyKdhQ2s1RgWmnGKpRs6pHvNVvMgiFRJeH8t5LejOE9pp4dWRVmGPxd
	WAI4k8YYVffMuiHuKm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZmxB-00CdZP-Gk; Sun, 18 Sep 2022 05:34:53 +0000
Received: from m12-13.163.com ([220.181.12.13])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZmx8-00CdVH-1Z
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 05:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9jmLn
	AQGQj431zPZBKBz9FpincMQ/bzVP8lGuYEZmNI=; b=i+WF53MgRJC4iYrIirrS+
	8W9O6M4TxEPnx6nFDx6MliHc1blymL8PLzhAHs33kEEHCKRDizjMsyJVHPXIkPMo
	u5hGNMJpf+zk5JiK5tRFvwX81xSNh4u9n7AsZCCmsmFj1QyhYW39YO1dJWa8rvZU
	kAQbp/YykFKArfB0XCWXsk=
Received: from whoami-VirtualBox.. (unknown [223.72.42.150])
	by smtp9 (Coremail) with SMTP id DcCowAA3TcLIrSZjjTfifA--.59008S2;
	Sun, 18 Sep 2022 13:34:00 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: geomatsi@gmail.com
Cc: akpm@linux-foundation.org,
	alexandre.ghiti@canonical.com,
	anshuman.khandual@arm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	falcon@tinylab.org,
	guoren@kernel.org,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	panqinglin2020@iscas.ac.cn,
	paul.walmsley@sifive.com,
	sunnanyong@huawei.com,
	tjytimi@163.com,
	tongtiangen@huawei.com
Subject: Re:Re: [PATCH v2] riscv: make update_mmu_cache to support asid
Date: Sun, 18 Sep 2022 13:33:32 +0800
Message-Id: <20220918053332.22189-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yx7fCL3rMgT4Uh96@curiosity>
References: <Yx7fCL3rMgT4Uh96@curiosity>
MIME-Version: 1.0
X-CM-TRANSID: DcCowAA3TcLIrSZjjTfifA--.59008S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1UtF45AF4rZF4rAw1rCrg_yoW8XrWfpF
	Z2krs5KrykGw13CFy7Xw4vgr4rJw4vgr1avw1fCr9rJ39xZrnFk393tr18ZryDGF9akF4x
	urWj93Z8ua4kA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUnXowUUUUU=
X-Originating-IP: [223.72.42.150]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiVgiAeFqzt7laWwAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_223450_437331_AF05E54C 
X-CRM114-Status: GOOD (  10.06  )
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

At 2022-09-12 15:26:00, "Sergey Matyukevich" <geomatsi@gmail.com> wrote:
>Hi Jinyu,
>
>> The `update_mmu_cache` function in riscv flush tlb cache without asid
>> information now, which will flush tlbs in other tasks' address space
>> even if processor supports asid. So add a new function
>> `flush_tlb_local_one_page` to flush local one page whether processor
>> supports asid or not,for cases that need to flush local one page like
>> function `update_mmu_cache`.
>> 
>> Signed-off-by: Jinyu Tang <tjytimi@163.com>
>> ---
>> RFC V1 -> V2 : 
>> 1.Rebased on PATCH9 of IPI imporvement series as Anup Patel
>> suggestion. 
>> 2.Make commit log more clear.
>> 
>>  arch/riscv/include/asm/pgtable.h  |  2 +-
>>  arch/riscv/include/asm/tlbflush.h |  2 ++
>>  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
>>  3 files changed, 14 insertions(+), 1 deletion(-)
>
>Just FYI: I have been looking into the same function w.r.t. to its
>ASID/SMP handling. In addition to what your patch is doing with ASID,
>I posted experimental change following flush_icache_mm approach. That
>patch takes into account other concurrently running harts as well as
>possible migration to other harts later on, see:
>
>https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/
>
>Regards,
>Sergey
Maybe local flush is enough for this function,because others may not use the pte forever.
And if another hart use this pte later, it may trap in pagefault to survive.

Yours,

Jinyu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
