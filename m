Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D36CC4451C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 04:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=87VIVtdi9ONqET4zXUKOaggnGrQDuFQG1j6tYwmA7dY=; b=i+1ClMArIQsPpt
	ZTZ++kwv8gxNDQme1G+t9nsydoBnV/I2tZAePQSgytYXCHifto6Qhr8T9a92Gz1vS47Gd9amF4oSp
	NT/+h3wyZdfVakigIWm2nWGZL2i66+5q7vZLS5JXyBl8pApzaKx6p4zZvrEbY4fdcHKXMNStuqyXl
	evS9aK5EwtE5UQ7RR2KOzgLXkcvUNVtK5k8YNpu4MRKzclaRjRMCVyNj+grpDhyoS/pdz6kVEC5/I
	Ge//23ZirNMzMMV5ekDqpL6NmfLZ+Dn29USFpcyhBJ5Smm3oRCHAqVET++mv7e7hX55oKl/+du6vJ
	sEii+XnP8JkcSlLjuQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwmG-00000003gRg-0AA5;
	Sat, 18 Jul 2026 04:35:52 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwmD-00000003gR4-1RLi;
	Sat, 18 Jul 2026 04:35:50 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUCcAltqvEsuAA--.37031S2;
	Sat, 18 Jul 2026 12:35:40 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Reject overlapping AIA IMSIC address fields
Date: Sat, 18 Jul 2026 12:35:40 +0800
Message-ID: <20260718040000.005.6ede2881-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3AUCcAltqvEsuAA--.37031S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr43Ww17Kw45tF1UKw1DGFg_yoW8WFyUpr
	ZxKF4Fkryjgry7KFZY9w1Igw48C3Wvkw43JryUAr12kr1Iyr92kFn0grWUZFs5Ars2q3yf
	tF4Y93yv934UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_213549_771603_4F372B02 
X-CRM114-Status: UNSURE (   7.92  )
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

KVM lets userspace configure the IMSIC guest, HART, group-width, and
group-shift fields independently. The individual bounds allow a layout
such as guest_bits=7, hart_bits=6, group_bits=1, and group_shift=24.

That layout places the group index bit at bit 24 while the lower
guest+HART field also extends through bit 24. The IMSIC address helpers
later consume these values as one address layout: aia_imsic_ppn() masks
the lower guest+HART field and the group field, while
aia_imsic_hart_index() combines the group and HART index. Allowing an
overlapping configuration therefore gives one address bit two different
meanings.

Reject group-index layouts that start before the end of the guest+HART
field before initializing the in-kernel irqchip.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kvm/aia_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index be83c2d5fc308..0793d4d4cf5e3 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -248,6 +248,12 @@ static int aia_init(struct kvm *kvm)
 	if (aia->nr_sources && aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
 		return -EINVAL;
 
+	/* Group index bits must not overlap guest and HART index bits. */
+	if (aia->nr_group_bits &&
+	    aia->nr_group_shift < IMSIC_MMIO_PAGE_SHIFT +
+					  aia->nr_guest_bits + aia->nr_hart_bits)
+		return -EINVAL;
+
 	/* Initialize APLIC */
 	ret = kvm_riscv_aia_aplic_init(kvm);
 	if (ret)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
