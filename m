Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2B1EB8FA5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dwAdNxw4YbU4OyEDJXKP4QVVoBFFDIYwUStNT5hGCc0=; b=GJ7rp7iD2jdQJA
	CJVdHo9ltNtn/AbB0ulWJr5tE07ZylVWjqvtshCTRLNhH80b4gH2H+GkRksUH6YoqUu43VYi/diW0
	QXSKF3r+WpPXJUftZvHXzeiskQ0WBqQfN8jeYIacww6iYYX4xOVokxbeNCfIdpXvJW1M8anEJgyDl
	gc4CjIz9OrDYzzJ+c5gGiLd0K/W9q5S8SQuqqs6XzXx5L/FO/kGixy6o822T0PJ3BCDiuRjihyv+z
	xKW+NXvCVPp3+FhpNsfvegoJCTsQhPNlMcenK5YLzPKHjVVe35EaGEVkEninbnh7cjdJ7t47cpQ91
	BZldsqbFIganYvQFFWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpLm-00837S-0o;
	Wed, 06 Sep 2023 10:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpLk-00836y-1A
	for linux-riscv@bombadil.infradead.org;
	Wed, 06 Sep 2023 10:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qx6heqJfwZMssIcg1+/CXa/l64Lln4cl+ILrIU9bCbg=; b=oeOrY2PEkOmXGnyG878ffx79Uk
	lbKrALvz7ZS109vlDO4t5Jpv4Za2775urWXyOJ6oLL+kSscNjPXb2zivo49E2RN77Dd/0OSPUErrP
	QB8dqux9FllCN5FrL5UvRBsLS8fFu0nba1nd2KYdxKkNeWy4ktyUBotSFx216SgtgljLov+iBsjur
	Rl9cQQiUFQGSdE0OGrVAZmZqdtMV/jgfkOE0W4Bsdf/eA2q3norCOW5kzH9HYfVaehAOQteAmacve
	nYJu31cvjLgd+NXu5cLNue2jI+tLQcERrEWQjdf1wWYMsZDkKEO5hAhXSRwsO9zjs5zEuHLwaAy3T
	/f1QkjRA==;
Received: from bg2.exmail.qq.com ([114.132.63.24])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpLV-0012MX-2d
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 10:01:27 +0000
X-QQ-mid: bizesmtp77t1693994304tbs1f5fp
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 Sep 2023 17:58:20 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 1OQ4fzPuJwa4CnM18ZyX6sw3+4M5cE1N93fmTWEuCPfoL34gU/m35awvJ+qzy
	KEqeeZow+/+yU3bTEtcEr9fDxqGOyP/Id1CRKrwzXmRu+b306s+jgkT1KMo9eSKQ1ys7ZYI
	urhLlokF4HwS5LjITI3zbGJCZNoLYmX7mzFkDDgz2ej2f6tSHy9jqukP6u0lm+MritL4lVX
	ZL0u0tFwmWGAN9cPaA4UdtahEf+9w0pY/zwajuTcZC4gzS/TfB0o+LXTTBaNN/sIrkZEfSD
	Ipt8tVlpKrwhhcdYWJcEUcsnUO2AzHZQ4V266iSYWbOLuO1UQQ8CE1BUlMVa2eO/OMQHyl8
	TyNs2jb4vxhzrA3Lvrww02GZS+eVRMI016bb6svEfr6OcqaTZ4=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9162341374277156945
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	lihuafei1@huawei.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	songshuaishuai@tinylab.org,
	lizhengyu3@huawei.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: kexec: Align the kexeced kernel entry
Date: Wed,  6 Sep 2023 17:58:17 +0800
Message-Id: <20230906095817.364390-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110116_043786_A5D7857D 
X-CRM114-Status: UNSURE (   9.21  )
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

The current riscv boot protocol requires 2MB alignment for RV64
and 4MB alignment for RV32.

In KEXEC_FILE path, the elf_find_pbase() function should align
the kexeced kernel entry according to the requirement, otherwise
the kexeced kernel would silently BUG at the setup_vm().

Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
You can use my kexec-tools[1] to test the kexec-file-syscall and this patch.

[1]: https://github.com/sugarfillet/kexec-tools/tree/fix-riscv 
---
 arch/riscv/kernel/elf_kexec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 5372b708fae2..9a81d6926ac6 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -98,7 +98,13 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	kbuf.image = image;
 	kbuf.buf_min = lowest_paddr;
 	kbuf.buf_max = ULONG_MAX;
-	kbuf.buf_align = PAGE_SIZE;
+
+	/*
+	 * Current riscv boot protocol requires 2MB alignment for
+	 * RV64 and 4MB alignment for RV32
+	 *
+	 */
+	kbuf.buf_align = PMD_SIZE;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
 	kbuf.top_down = false;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
