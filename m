Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBE1EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4mCICrNDrvLFacz78rCrC9BMof5uh+G59eVNylQJ4z4=; b=Elv357p655r01l
	pkUWtfZTm8mav188XGCVJfVRTjJfWYnQsiSczjXHkcHX4n7Xxk0ZLNySlsntxRsyi4liHtg9yYdoz
	AhinirVn8NzuP/E5yDxNEgyMeBqRfQPDf+9KwGK6PrVs/qS5PjHfZaM3Rq3VZY6zSElxHWSXRJSWV
	LTS2dzGd1FGH+GVr5NeqIYYNU7GIk/KmyFpu8oXGoS8K8RZknBk/ZODMGUUa8fcLhJeDOQpjWk550
	WB8fsOoMVQ/BmzmKvFRMlOLPJE2RyinhA9/jgKkeJmJ6fP86JrS9LNgwFdxcf8BDpJ1BLBVGY/CdF
	KNEBT+bRTMjcaZPE5eKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQSF-00879O-0w;
	Sun, 25 Jun 2023 14:11:03 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQS8-008777-2a
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 14:11:02 +0000
X-QQ-mid: bizesmtp73t1687702201tfi94mxf
Received: from localhost.localdomain ( [112.2.230.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 25 Jun 2023 22:09:56 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 7QbCsSX/jDajboDIHjqXf60bGtIy5uaeLeazsMLa+7tUdkr3UGx10netYGscB
	urao5noZ9e0frsU9G1KBZ9rFA+mY4cvgSB865YOu0EOCQ8l9rF2XEOdiTTkNnEFQbed40my
	8eFOG2ZNIilDyadp3uJXT0MYK7YxgbWYDN5wzN9QVebgwF3leCB/t4axu/g/O4NXHOBTnRd
	iriLXHVh1GlKHeBdaPzczRTETLTg0QYdVRfn/arFPO8w0OF2aJSUwKWfms3kSlC3tJB5LKz
	4BoRRKhVkbH4zwvEQUU6h4053IIjk9G1cFJ9kIWgHo2ndiphh4Towdx++by0wIwTFIyYuZl
	pCAysmh43140F197LcSw+J3ajAS3wD44tSP3Yg9VWU1+pV6Ggk=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8927406621294641602
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	frowand.list@gmail.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	mpe@ellerman.id.au,
	arnd@arndb.de,
	songshuaishuai@tinylab.org,
	rppt@kernel.org,
	samuel@sholland.org,
	panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	xianting.tian@linux.alibaba.com,
	anshuman.khandual@arm.com,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 0/3] Revert huge-paged linear mapping and its related fixups
Date: Sun, 25 Jun 2023 22:09:28 +0800
Message-Id: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071057_152492_BCCDB635 
X-CRM114-Status: GOOD (  10.12  )
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

We have encountered these two issues about huge-paged linear mapping since v6.4-rc1: 

1. Bug report: kernel paniced when system hibernates[1]
  
OpenSbi [v0.8,v1.3) set the PMP regions as !no-map, and the commit 3335068f8721 
("riscv: Use PUD/P4D/PGD pages for the linear mapping") mapped them in linear mapping.
The hibernation process attempted to save/restore these mapped regions resulting in access fault.

This issue was temporarily fixed by commit ed309ce52218 ("RISC-V: mark hibernation as nonportable").
But as Alex's RFC and Rob's response stats in another thread [2] , 
"Hibernation is only one case. Speculative accesses could also occur."
So this fixing commit seems not the perfect answer to this issue. 


2. Bug report: kernel paniced while booting (with UEFI )[3]

During the booting with UEFI, UEFI Memory Mapping overwrote the memblock.
The phys_ram_base was set as the end address of mmoderes0 (like 0x80040000 for 256 KiB mmoderes0@80000000),
which resulted the VA based on 2M-aligned PA was not 2M-aligned using va_pa_offset 
(PAGE_OFFSET - phys_ram_base) to translate.

The best_map_size() from commit 3335068f8721 didn't check the virtual alignment
before choosing a map size. and then a "VA hole" was created where page faults always occurred.

This issue was fixed by commit 49a0a3731596 ("riscv: Check the virtual alignment before choosing a map size"),
But this fixing commit has a side-effect ("the possible third one" as Alex said in this thread). 
There are numerous PTE allocations slowing down the boot time and consuming some system memory when UEFI booting
(Note that it's not involved when booting directly with OpenSbi, where phys_ram_base is the 2M-aligned base of DRAM).

In my test, compared with/out reverting both commit 49a0a3731596 and commit 3335068f8721,
I must wait ~20s for the linear mapping creation and mem_init_print_info() reported ~8M extra reserved memory.

To eliminate this side-effect, We should find a way to align VA and PA on a 2MB boundary. 
The simplest way is reverting the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping").



Using PUD/P4D/PGD pages for the linear mapping to improve the performance is marginal from a recent talk [4]
from Mike Rapoport. OpenSbi had marked all the PMP-protected regions as "no-map" [5] to practice this talk.

For all those reasons, let's revert these related commits:

- commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
- commit 49a0a3731596 ("riscv: Check the virtual alignment before choosing a map size")
- commit ed309ce52218 ("RISC-V: mark hibernation as nonportable")
 
[1]: https://lore.kernel.org/linux-riscv/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/
[2]: https://lore.kernel.org/linux-kernel/20230530080425.18612-1-alexghiti@rivosinc.com/
[3]: https://lore.kernel.org/linux-riscv/tencent_7C3B580B47C1B17C16488EC1@qq.com/
[4]: https://lwn.net/Articles/931406/
[5]: https://github.com/riscv-software-src/opensbi/commit/8153b2622b08802cc542f30a1fcba407a5667ab9

Song Shuai (3):
  Revert "RISC-V: mark hibernation as nonportable"
  Revert "riscv: Check the virtual alignment before choosing a map size"
  Revert "riscv: Use PUD/P4D/PGD pages for the linear mapping"

 arch/riscv/Kconfig            |  5 +---
 arch/riscv/include/asm/page.h | 16 -------------
 arch/riscv/mm/init.c          | 43 +++++++----------------------------
 arch/riscv/mm/physaddr.c      | 16 -------------
 drivers/of/fdt.c              | 11 ++++-----
 5 files changed, 14 insertions(+), 77 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
