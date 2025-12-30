Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D9EE95A8D
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5iA5NbdK7TQueAQyC36hjyhSRORn22GnAavV7+2AZI=; b=xprngmTMDET+51
	o9JrAm/c6mXGNaNSZ8i2iWlcN7+7ihsJFi+c9ZW1Fa6+w3ilbLxW6nGi2CckmqtTTqtHo/lezW/W7
	atlm4QDtmCyw4kd7Hr7DgPSIm4zujWOknbGlZYxvn9o5aNEw/bg8SqSYxBqZb8IGn7IZ4AGWd+A0Z
	cubUvBIO7cXsJQPVkP6AW9wYC03C/vtMhjxmaSNF7pUA9W3ylWLe//EADR/+137JvlrE5l2WL5cWV
	QJnfvkSTHPFp3rz3VC13oihblVEAFJqJJ/jqrkVsrPhQpE5gk59gq793+jNhF6DlAa2Fp1ONgETCh
	GpINbg+sgHtDE/xGjA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZwy-00000004sBT-19qh;
	Tue, 30 Dec 2025 13:39:48 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZwv-00000004sAu-0gQN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 13:39:47 +0000
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-01 (Coremail) with SMTP id qwCowADnjWkN1lNpCqNgAg--.13684S2;
	Tue, 30 Dec 2025 21:39:26 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 30 Dec 2025 21:39:17 +0800
Subject: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
MIME-Version: 1.0
Message-Id: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAATWU2kC/yXNywqDMBCF4VeRWXdKEmlBX6Uo2GRsB2q0kwtC8
 N0b6vI7i/8UCCRMAfqmgFDmwKuv0JcG7HvyL0J21WCUuWnTKhQONmNePuzTjn6NmHyIwttGDlt
 FVtmuVbMzUBOb0Mz7P/8YTgt9U32J5wjPKRDadVk49k2+X3WHYvVYDhiO4wdoLjN0ngAAAA==
X-Change-ID: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 stable@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: qwCowADnjWkN1lNpCqNgAg--.13684S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUAF1DGr4UJw1DWrWUXFb_yoW8Cr15p3
	yUuw1YkrWUJrWj9F10y3y293y2qFn0g3y3ZFW8GF1DtrWjqF1vqwsIgayUWF9rGFs3Wa1D
	Xr4fGF95Ca40y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_053945_593379_AA143F10 
X-CRM114-Status: UNSURE (   8.94  )
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

Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
.rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
vmlinux to produce Image, not vmlinux.unstripped.

Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
caused by this chain of events:

- Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
  vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
- The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
  of it.
- The Image header's image_size field does not expect to include
  .modinfo and does not account for it, since it should not be in Image.
- If .modinfo is large enough, the file size of Image ends up larger
  than image_size, which eventually leads to it failing
  sanity_check_segment_list().

Using vmlinux instead of vmlinux.unstripped means that the unexpected
.modinfo section is gone from Image, fixing the file size problem.

Cc: stable@vger.kernel.org
Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index bfc3d0b75b9b..5301adf5f3f5 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
 
 endif
 
-ifdef CONFIG_RELOCATABLE
-$(obj)/Image: vmlinux.unstripped FORCE
-else
 $(obj)/Image: vmlinux FORCE
-endif
 	$(call if_changed,objcopy)
 
 $(obj)/Image.gz: $(obj)/Image FORCE

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
