Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+PU2xVXUVVLFJVKjiFl64Yfq0yX3VV3SoH0ZG6NgCw=; b=UcbdedC3ARfafa
	528ZdDvHwe5OiVSCyYiPsJaYXjBlOdlTurGazIxH/sS+1n+mdH2WZVPk/VOVhSrEn/i8QapHnM8gl
	zEVJtgj2OUlhqVUiHekFRxbg6wmzpx6CdB2fH9ugVUPMQ+43jPAeiUPD69rG65XQE1niVJwLokoAE
	Uo6sIxi9+hOmq0uAYxmE5WWmvs1lK6UV1yr1cdXU2xFbNG3MlHNYDc2ti5ymyTmGI4ouVksK/i4yW
	xoPECF5/PdtLaHsM6TgeDLMJVGovjp81PTeTkdhwup+DrDTny7Wvd/c0FFLNnlgxyMiHvUcHtpDsh
	sABMhvO9KXyadTgs3z7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpqKF-004ZdM-Fb; Wed, 24 Nov 2021 11:20:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpqK9-004Za8-B4
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 11:20:27 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowAAnL_v3H55hpmdRCA--.35989S2;
 Wed, 24 Nov 2021 19:20:23 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RESEND PATCH v1 0/2] Add Sv57 page table support
Date: Wed, 24 Nov 2021 19:20:19 +0800
Message-Id: <20211124112021.788242-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAnL_v3H55hpmdRCA--.35989S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1rKF18Wr18AFyfJFW7CFg_yoWDZrc_C3
 97JayfXryxXFWxJF9rJ3WfJry2kFWFgFyDAF4UX3W7K3WkGrn8Ga4Dtryqyr1jyrZ0van7
 AFyrtrWftr12gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbhxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gw4l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb8wIDUUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_032025_810776_2818294A 
X-CRM114-Status: UNSURE (   5.03  )
X-CRM114-Notice: Please train this message.
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patchset is based on Alex's Sv48 patchset v2.

This implements Sv57 support at runtime. The kernel will try to boot with
5-level page table firstly when the mmu-type field in dtb is "mmu,sv57" or null,
and will fallback to 4-level if the HW does not support it.

Tested on:
  - qemu rv64 sv39
  - qemu rv64 sv48
  - qemu rv64 sv57
  - Sifive unmatched

Qinglin Pan (2):
  riscv,mm: Add Sv57 support based on Sv48 implementation
  Documentation, mm: Add Sv57 vm layout documentation

 Documentation/riscv/vm-layout.rst   |  36 ++++++
 arch/riscv/Kconfig                  |   4 +-
 arch/riscv/include/asm/csr.h        |   1 +
 arch/riscv/include/asm/fixmap.h     |   1 +
 arch/riscv/include/asm/page.h       |   1 +
 arch/riscv/include/asm/pgalloc.h    |  49 ++++++++
 arch/riscv/include/asm/pgtable-64.h | 103 ++++++++++++++++-
 arch/riscv/include/asm/pgtable.h    |   4 +-
 arch/riscv/kernel/cpu.c             |   4 +-
 arch/riscv/mm/init.c                | 169 +++++++++++++++++++++++++---
 10 files changed, 348 insertions(+), 24 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
