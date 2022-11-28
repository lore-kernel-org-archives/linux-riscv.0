Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD21C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 02:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwkBlyYYyxmC4SSIFn/HjED+5NQkM3fk4Hmxl1MnKTc=; b=tnAQxDQljvlYba
	Uy8ttPhgp29Aczg5uJCVKiIJeFJ0Qx6eVoHII8mLdPd9TYYqyY/n29f4zNZpIamJk4DIuqSDSGl17
	bLc1vKHAtsRwkyDVjEgoRW8mV8shO8hP29TcoVxa8eA5pHBwZRSpxfUMIKTdTNzFGXdRkLVUVMu/Q
	f9DtnBOthfHVVXB/kwLIsnZFXVRVBwypxPeJT9aeYsl/mFsZ9798dSQq2Wn3i24mhEQ8Cx9hjO5/q
	aORbKyiq8fOrcgw+FpbrMMakmHrYZ2befeG0A5gXnSQ7UMwZXvbRyaRO7z5Tp1QH6Cjb6R0ZmzHPZ
	oriGa3YQDQgrBDk43NkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTrt-00EzwF-37; Mon, 28 Nov 2022 02:27:37 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTrp-00Eztf-9d
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 02:27:34 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn7_eRHIRjGpnlAg--.14781S2;
	Mon, 28 Nov 2022 10:27:29 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	alex@ghiti.fr,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v8 0/3] riscv, mm: detect svnapot cpu support at runtime
Date: Mon, 28 Nov 2022 10:27:16 +0800
Message-Id: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7_eRHIRjGpnlAg--.14781S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZw1UJw43Jr13WrW3Jrb_yoW8uFyrpF
	WYkrn3GF98Ar93GF1fur9F9rn5Jw1rKFWaqw1xJ34UAwsxJayUZ390yFn8Ca1kXFWfXw4I
	kF45uFy3ua4DZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4UMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbdb15UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwAEDGODb0TzegAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_182733_730767_3D63B7A4 
X-CRM114-Status: UNSURE (   9.54  )
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


Qinglin Pan (3):
  riscv: mm: modify pte format for Svnapot
  riscv: mm: support Svnapot in hugetlb page
  riscv: mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                  |  16 +-
 arch/riscv/include/asm/hugetlb.h    |  34 +++-
 arch/riscv/include/asm/hwcap.h      |   4 +
 arch/riscv/include/asm/page.h       |   5 -
 arch/riscv/include/asm/pgtable-64.h |  34 ++++
 arch/riscv/include/asm/pgtable.h    |  39 +++-
 arch/riscv/include/asm/vmalloc.h    |  61 +++++-
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |   1 +
 arch/riscv/mm/hugetlbpage.c         | 294 ++++++++++++++++++++++++++++
 10 files changed, 480 insertions(+), 9 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
