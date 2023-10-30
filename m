Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE84C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDB0+f6aH37GORBlVK/Jc/37xF4dPZr34QYxTAOJll8=; b=ZVj+inELt/tfeB
	UrPJ+YiDPZsNblFIU2cEFx30LuG7DzG7a/WwNMl8OlLtZisnArVBkiwkkj0LzRiG0XmGPRK1Y2Rln
	EaS4b2EhnRWriVwEqStt4J9tWp3XGwlA6MnpEoTBf0bGPRLlafZtRY6+jJZhUt+mvtj2mIcWHM1eE
	O+hSArky+5rUsNLgSauMf7g6MWaBPQbngZewIxgoBEgaXolEh3HPaJHhPUJpDuRhaOUFgA88pzifp
	lRSj+rDne5JR3xGz2xgBE/uBrzOaGgDUHfTjJ6XPO2pImvh2RUGeJ+EaHIekwYnYH4nTLgHHCsol6
	VmP4abDK1Qbk6wg2b7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOfe-002uXv-1g;
	Mon, 30 Oct 2023 09:34:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOfa-002uXT-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 09:34:52 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SJp1g0rmqz1L9Qj;
	Mon, 30 Oct 2023 17:31:35 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 30 Oct 2023 17:34:33 +0800
Message-ID: <47437c2b-5946-41c6-ad1b-cc03329eb230@huawei.com>
Date: Mon, 30 Oct 2023 17:34:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: cma: report correct node id
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>, Christoph
 Hellwig <hch@lst.de>, <linux-riscv@lists.infradead.org>
References: <20231019013253.2792048-1-wangkefeng.wang@huawei.com>
 <20231025163703.GA2440148@dev-arch.thelio-3990X>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20231025163703.GA2440148@dev-arch.thelio-3990X>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_023450_837114_5A72AF74 
X-CRM114-Status: GOOD (  28.50  )
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

Hi Nathan,

On 2023/10/26 0:37, Nathan Chancellor wrote:
> Hi Kefeng,
> 
> On Thu, Oct 19, 2023 at 09:32:53AM +0800, Kefeng Wang wrote:
>> Use early_pfn_to_nid() to get correct node id from base instead of
>> the default NUMA_NO_NODE in cma_declare_contiguous_nid().
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   mm/cma.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 2b2494fd6b59..97c27e5fe1a2 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -375,6 +375,9 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
>>   	if (ret)
>>   		goto free_mem;
>>   
>> +	if (nid == NUMA_NO_NODE)
>> +		nid = early_pfn_to_nid(PHYS_PFN(base));
>> +
>>   	pr_info("Reserved %ld MiB at %pa on node %d\n", (unsigned long)size / SZ_1M,
>>   		&base, nid);
>>   	return 0;
>> -- 
>> 2.27.0
>>
> 
> I bisected a RISC-V boot failure in QEMU to this change in -next. It
> happens with OpenSUSE's RISC-V configuration [1], which I was able to
> narrow down to the follow configurations on top of defconfig:
> 

I think the root cause is the bad node info of memory address, meanwhile,
the riscv's cma reserve is before numa init, see the following log,

[    0.000000] cma: Reserved 16 MiB at 0x000000009f000000 on node 4
[    0.000000] NUMA: Faking a node at [mem 
0x0000000080000000-0x000000009fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x9eff2780-0x9eff3fff]
[    0.000000] NUMA: NODE_DATA(0) on node 4		// should be node 0
[    0.000000] [ff1c000002000000-ff1c000002000fff] potential offnode 
page_structs

additional, early_pfn_to_nid will cache the recent lookups of 
pfn-to-nid, which
led to the next early_pfn_to_nid get the cache nid, not the new 
nid(changed by numa init),

setup_arch
  paging_init
   dma_contiguous_reserve
    cma_declare_contiguous_nid // 9f000000 node 4
     early_pfn_to_nid		  // 1. lookup memblk, pfn=9f000, nid=4 cached
  misc_mem_init
   arch_numa_init
    numa_init
     dummy_numa_init
      numa_add_memblk		  // 2. setup new nid of memblk
     numa_register_nodes
      setup_node_data
       early_pfn_to_nid        // 3. *but still use cached pfn,nid*
mm_core_init
  mem_init
   memblock_free_all
    __free_pages_core		  // 4. check page and find bad page

Firstly, 9f000000 on nid=4 should be fixed in firmware(I don't know 
where store this infomation), secondly, if we want to fix it or avoid
similar issue happened in other scene,a reset function to cleanup the
cached pfn-nid should be added, I try following diff, it should work.

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index eaa31e567d1e..24100e45971c 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -210,6 +210,7 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
  	}

  	node_set(nid, numa_nodes_parsed);
+	early_pfn_reset_nid();
  	return ret;
  }

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..f20a8da22b35 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3173,9 +3173,11 @@ static inline int early_pfn_to_nid(unsigned long pfn)
  {
  	return 0;
  }
+static inline void early_pfn_reset_nid(void) {}
  #else
  /* please see mm/page_alloc.c */
  extern int __meminit early_pfn_to_nid(unsigned long pfn);
+extern void __meminit early_pfn_reset_nid(void);
  #endif

  extern void set_dma_reserve(unsigned long new_dma_reserve);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 077bfe393b5e..fb7751b233c4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -586,6 +586,7 @@ struct mminit_pfnnid_cache {
  };

  static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
+static DEFINE_SPINLOCK(early_pfn_lock);

  /*
   * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
@@ -611,7 +612,6 @@ static int __meminit __early_pfn_to_nid(unsigned 
long pfn,

  int __meminit early_pfn_to_nid(unsigned long pfn)
  {
-	static DEFINE_SPINLOCK(early_pfn_lock);
  	int nid;

  	spin_lock(&early_pfn_lock);
@@ -623,6 +623,15 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
  	return nid;
  }

+void __meminit early_pfn_reset_nid(void)
+{
+	spin_lock(&early_pfn_lock);
+	early_pfnnid_cache.last_start = 0;
+	early_pfnnid_cache.last_end = 0;
+	early_pfnnid_cache.last_nid = 0;
+	spin_unlock(&early_pfn_lock);
+}
+
  int hashdist = HASHDIST_DEFAULT;

  static int __init set_hashdist(char *str)



> 
> <hangs after OpenSBI output>
> 
> Without CONFIG_ACPI_SPCR_TABLE=y, there is a visible crash.
> 
> [    0.000000] Linux version 6.6.0-rc7-next-20231025 (nathan@dev-fedora.c3-large-arm64) (riscv64-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41) #1 SMP Wed Oct 25 16:14:59 UTC 2023
> ...
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> [    0.000000] page:ff1c000002200000 is uninitialized and poisoned
> [    0.000000] page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at include/linux/page-flags.h:493!
> [    0.000000] Kernel BUG [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc7-next-20231025 #1
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] epc : __free_pages_core+0x78/0x126
> [    0.000000]  ra : __free_pages_core+0x78/0x126
> [    0.000000] epc : ffffffff8018dd8e ra : ffffffff8018dd8e sp : ffffffff81403d40
> [    0.000000]  gp : ffffffff815013a0 tp : ffffffff8140db00 t0 : 6d75642065676170
> [    0.000000]  t1 : 0000000000000070 t2 : 706d756420656761 s0 : ffffffff81403d50
> [    0.000000]  s1 : 0000000000000004 a0 : 000000000000003c a1 : ffffffff814866a8
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000008 a7 : 0000000000000038
> [    0.000000]  s2 : 0000000000088000 s3 : ff1c000002200000 s4 : 0000000000000009
> [    0.000000]  s5 : 00000000ffffffff s6 : 0000000000081800 s7 : 0000000000088200
> [    0.000000]  s8 : 00000000000001c0 s9 : 0040000000000000 s10: ffffffff81500bdd
> [    0.000000]  s11: ffffffff81500bdc t3 : ffffffff81515aa7 t4 : ffffffff81515aa7
> [    0.000000]  t5 : ffffffff81515aa8 t6 : ffffffff81403b58
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.000000] [<ffffffff8018dd8e>] __free_pages_core+0x78/0x126
> [    0.000000] [<ffffffff80a12fee>] memblock_free_pages+0x52/0x62
> [    0.000000] [<ffffffff80a15f02>] memblock_free_all+0x1fc/0x27e
> [    0.000000] [<ffffffff80a061fa>] mem_init+0x34/0x22c
> [    0.000000] [<ffffffff80a13114>] mm_core_init+0x116/0x2d0
> [    0.000000] [<ffffffff80a00a6e>] start_kernel+0x3c6/0x742
> [    0.000000] Code: 0405 8399 8b85 d7f1 9597 00e2 8593 2ae5 90ef e5dd (9002) 6597
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception in interrupt
> 
> The rootfs is available at [2] if necessary. If there is any more
> information I can provide or patches I can test, I am more than happy to
> do so.
> 
> [1]: https://github.com/openSUSE/kernel-source/raw/master/config/riscv64/default
> [2]: https://github.com/ClangBuiltLinux/boot-utils/releases
> 
> Cheers,
> Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
