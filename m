Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9548CC636CC
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 03:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=54OLkLgf9a1Dku92rPyHiP51EirGNLl7MxSNX3AWoIg=; b=mAUO+SrICQZmuBh5ITp3FOfO+w
	BbY89zwgR6y0VawLxJ0puqjkac+WE/gHur0D7qTCMNt7ZHMkYI1AoXLYkI/gwL3DZDYEm5IY4buTe
	p20jPuu/iUwXGg92PrWn9I39adz2LmigjAWJLXf1xN8gLVwPee4T4lddKpEd1tIpwFA0cudnCpUu3
	gVdUnCIOr39pQhMYctxmZMI5Hbn2PwKq6S/HOQE5ZWVCR7wYuQrSjn7s1Khu6zgxtWnmWYzoGD1YG
	JZ4wqkpEzkIoBZQlvWaAlr1sLHG5VF6UWn7hZ5zd+rjtAVfoHE33WhOlxTc6IpEwFo9lzGBFSFdHG
	gR1jhscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPxNc-0000Lk-KY; Thu, 09 Feb 2023 03:13:48 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPxNY-0000Kh-1M
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 03:13:47 +0000
Received: from [198.18.0.1] (unknown [124.16.141.244])
	by APP-01 (Coremail) with SMTP id qwCowAA3Mz_bZORjqfYrBA--.61599S2;
	Thu, 09 Feb 2023 11:13:33 +0800 (CST)
Message-ID: <11ea7918-00db-3f30-2504-53692936aaae@iscas.ac.cn>
Date: Thu, 9 Feb 2023 11:13:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, conor@kernel.org,
 ajones@ventanamicro.com
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
X-CM-TRANSID: qwCowAA3Mz_bZORjqfYrBA--.61599S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyfAw47Gr4fCr17Gw4fGrg_yoW5XF4kpF
	W5Grn3GF98Ar93GFsxZrnF9r1rJw1rKFWaqw1fJ34UAws0y3yjvws0kF90k3WkJFZ3Xr10
	kF45ZFyj9a4DZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F
	4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5KsjDUUUU
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgsRDGPkWj0g9AAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_191344_497417_ADFF1A8E 
X-CRM114-Status: GOOD (  11.03  )
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


Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
page. This patch set is for using Svnapot in hugetlb fs and huge vmap.

This patchset adds a Kconfig item for using Svnapot in
"Platform type"->"SVNAPOT extension support". Its default value is on,
and people can set it off if they don't allow kernel to detect Svnapot
hardware support and leverage it.

Tested on:
   - qemu rv64 with "Svnapot support" off and svnapot=true.
   - qemu rv64 with "Svnapot support" on and svnapot=true.
   - qemu rv64 with "Svnapot support" off and svnapot=false.
   - qemu rv64 with "Svnapot support" on and svnapot=false.


Changes in v2:
   - detect Svnapot hardware support at boot time.
Changes in v3:
   - do linear mapping again if has_svnapot
Changes in v4:
   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
Changes in v5:
   - modify code according to @Conor and @Heiko
Changes in v6:
   - use static key insead of alternative errata
Changes in v7:
   - add napot_cont_order for possible more napot order in the future
   - remove linear mapping related code from this patchset to another patch
   - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
   - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
   - support svnapot in huge vmap on newer for-next branch
Changes in v8:
   - fix compilation errors in rv32_defconfig
   - insert some lines of whitespace according to @Conor's suggestion
Changes in v9:
   - use alternative to avoid using static branches inside heavily used
     inline functions
   - change napot_cont_mask definition
   - post test_vmalloc modification about testing vmalloc_huge
Changes in v10:
   - fix some nits caught by @Andrew
   - collect Reviewed-by/Acked-by
   - add memory leak warning in KConfig text
   - replace test_vmalloc patch link with the standard one
Changes in v11:
   - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig text
   - fix missing reverse-xmas tree
Changes in v12:
   - rebase on the new ISA extension API [1]

[1]https://lore.kernel.org/all/20230128172856.3814-5-jszhang@kernel.org/

Qinglin Pan (3):
   riscv: mm: modify pte format for Svnapot
   riscv: mm: support Svnapot in hugetlb page
   riscv: mm: support Svnapot in huge vmap

  arch/riscv/Kconfig                  |  21 +-
  arch/riscv/include/asm/hugetlb.h    |  34 +++-
  arch/riscv/include/asm/hwcap.h      |   9 +-
  arch/riscv/include/asm/page.h       |   5 -
  arch/riscv/include/asm/pgtable-64.h |  34 ++++
  arch/riscv/include/asm/pgtable.h    |  39 +++-
  arch/riscv/include/asm/vmalloc.h    |  61 +++++-
  arch/riscv/kernel/cpu.c             |   1 +
  arch/riscv/kernel/cpufeature.c      |   1 +
  arch/riscv/mm/hugetlbpage.c         | 301 ++++++++++++++++++++++++++++
  10 files changed, 493 insertions(+), 13 deletions(-)

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
