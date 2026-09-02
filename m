Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F19C624D0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:Cc:To:Message-Id:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OjgbNNyQ/oG7dXtKvJpiW4mtFq0BnHvhQx0ynFsp/W0=; b=RCZwsR1TLrgEjd
	Cigxw4y7P7QCnrheqcbZ8SuMU89d3eaEORLiCOWxaKiL0hEkDe2Zy4iGnZLB84kyB5xrP9O7PcD4v
	qc9hfhQdqGtEXXidCsRigBDU6w7bXB8x4Kb5MzKMBG5olNcs6wOxF2ilm6NDbRC7sb9ovDOGO4zTR
	Ca8LH46GY9QjzDPff/jrAn4GGnxejfs1SNNyypLEkmpln78IK19Qg+P+GIYhUA2VmOvqwfazm5eBq
	cs1k+z6dQpp/ERv7o24PIcPi7M3GxETHrQJ3mpU236nXtIxsx/OQV47sakbg5zLN3Y8Bv4vSDIB6e
	doeXKCbQoRAwnrAuJHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxx-0000000EBHm-1jB9;
	Wed, 02 Sep 2026 09:09:09 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxu-0000000EBGd-1Ww9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 09:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340134; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=kplzY+ir5BhXbpEn3+WYNn+D3WrMj/dxeymw75eVxzk=;
 b=sWlPLjVtDl3lNfNAhYrDRbqLHXyPCidXyHyDg+tgPJurAzsvRgjySVKdWVHCbmCqkjVVuh
 RYM3zsUfgfqT+t/I+aopBlYTZE67oGLvV005zZLb64SXCkDHCK8xYpOqIXt41Dv1DgOuun
 o7SVeAl+UTjJ920FUAYssMVRbVu1bcyo4nh7PCJjbQSF9/4t9OQDFzOZcbFMarjwECUgvt
 W3Y9bK+ZRpkGDVISRDkdIQHS//6TzqboRXRCZHSGiYq/eLIXPKUHg/Jw93/Lqy5bshgE1U
 OJbk+W3RSi7rpO7DTFJc8/NqENPnV4ByzUdz5p9czBNijZDfJ9THYbVw6PgBcA==
From: "Yufan Dou" <douyufan@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:47 +0800
Message-Id: <20260902090850.2601-1-douyufan@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Subject: [PATCH RESEND 0/3] Fix kexec_file segment placement on RISC-V
Mime-Version: 1.0
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:52 +0800
X-Lms-Return-Path: <lba+26a97e7a4+b0e5ae+lists.infradead.org+douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_020906_484495_F6BD4B3D 
X-CRM114-Status: UNSURE (   6.43  )
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

This patchset fixes three ways in which kexec_file_load() can place
segments where the next kernel cannot use them:
- Patch 1/3 keeps the extra segments within the direct map of the next
  kernel, which is narrower when an Sv48/Sv57 kernel loads an Sv39 one
- Patch 2/3 sizes the ELF placement search by the extent the image
  occupies in memory rather than by the length of the file
- Patch 3/3 reserves the PMD-aligned tail of the kernel image that the
  next kernel reserves under CONFIG_STRICT_KERNEL_RWX

Patch 1/3 is independent. Patch 3/3 depends on patch 2/3, and both are
marked for stable.

Resending rebased onto current mainline (v7.3-rc1); no code changes
since the previous posting.

Yufan Dou (3):
  riscv: kexec_file: constrain extra segments to the Sv39 direct map
  riscv: kexec_file: size the ELF placement search by the load extent
  riscv: kexec: reserve the PMD-aligned kernel image range

 arch/riscv/kernel/kexec_elf.c          | 38 ++++++++++++++++++++++----
 arch/riscv/kernel/kexec_image.c        |  7 ++++-
 arch/riscv/kernel/machine_kexec_file.c | 25 ++++++++++++++++-
 3 files changed, 62 insertions(+), 8 deletions(-)


base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
