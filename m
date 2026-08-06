Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCEC55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:Date:To:Message-Id:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cAy3zKYRmDc7oLhO702eYYiP44zI4Uy2WS/+ZmXUW+w=; b=OVg
	CKF5MPFA43g8zu4kZgOsBSXpSEmVsMqimAt6+5rqLo/p51zWFniCZfc4fdkt5SO4S4tBQINpqKBJq
	fFura7Xj1uAjrvjXhynFAdb770w9n90cX6teKJKE3Uy5mB74swvyLyQZHGV8tW3yhEW2CPeSzf0R9
	ZL7NnzqTSt3ujBYcdNrZ4uIHIztV98OBqZ0Dey2Aj7SipqOJLWQd6hHte3UrPItKCU8KJ/g8P6Ph1
	YS0o9qTa2qO5Ps8gKwPyhIpJJJUtzzXuPtOX6OAqYwdlPVPpSfUD+CKqH1uAdopZl0xMWqMuG2o4X
	ZYOQwWeSeaAx1jLouED5MwkMY1mVzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRj-000000058Ee-0XYg;
	Thu, 06 Aug 2026 07:23:19 +0000
Received: from va-2-59.ptr.blmpb.com ([209.127.231.59])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRd-000000058Bh-1afS
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 07:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1786000980; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WdVMsl+tGZR1xHonLFh85UL50/izg62q+aI+hFS0+Hs=;
 b=E5aMrFdQpLvIDmji/EV073gY2eEf2IK5cXJpzTIf6GaSyBxBhx3ntTfVaPKZhtVv/JPOQJ
 NGY9vhXf23qPFQb5HQrvnV2eniNNnbiIBZGN2aQBSdgU3SyspJkCSkY/caeAcKou6fh7zo
 iGocazl9p34FTkBPJ8xZQnWSXMoG36HU0mjZp5X99b2I71c8KGx7dojt2djoccjXWD95nU
 ZqeHr1NlUvwDy2LrPL9ykv5WvZhVemfI+PVs61xqC1EKecrtoCTJxutzIkXnw9jhVENjRT
 ZlfPBwL/GYZ7FXuYlPW7X1G01QMlsCL6EXI9Q7dHEaJs/zyoAPMipB1JqrvkEQ==
X-Original-From: Yufan Dou <douyufan@picoheart.com>
From: "Yufan Dou" <douyufan@picoheart.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26a743652+8ed259+lists.infradead.org+douyufan@picoheart.com>
Message-Id: <20260806072256.1813-1-douyufan@picoheart.com>
Received: from 5CG30262N9-QAP.localdomain ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 06 Aug 2026 15:22:57 +0800
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Date: Thu,  6 Aug 2026 15:22:53 +0800
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Subject: [PATCH 0/3] Fix kexec_file segment placement on RISC-V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_002313_493546_67444B9D 
X-CRM114-Status: UNSURE (   6.88  )
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
marked for stable; patch 1/3 is not, as the commit it fixes has not been
released yet.

Yufan Dou (3):
  riscv: kexec_file: constrain extra segments to the Sv39 direct map
  riscv: kexec_file: size the ELF placement search by the load extent
  riscv: kexec: reserve the PMD-aligned kernel image range

 arch/riscv/kernel/kexec_elf.c          | 38 ++++++++++++++++++++++----
 arch/riscv/kernel/kexec_image.c        |  7 ++++-
 arch/riscv/kernel/machine_kexec_file.c | 25 ++++++++++++++++-
 3 files changed, 62 insertions(+), 8 deletions(-)


base-commit: 76e885f2b89d9e88291c1864e5f89a6b180768da
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
