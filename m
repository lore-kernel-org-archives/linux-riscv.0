Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9CFC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 02:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OojW+8Ne5BuKsqo8UpqsHmztI4xVh2W+CYw9L9dpPQk=; b=jTKjG/bFHvCgny
	R0T2ATdRWY77qa/fhJjYQ+ri9saS5WQJ/pfcCJbvE219lk/XCEbRF13LA9CqAWuQiYUwWgMkulk7/
	C0hwuUP17qFF02m7e3aU3Al3CfUH99bKtqk0rECU29b1IGB5BBPQxlp/2PewrqP10BL7Xwuidf8S7
	g08TeGseAj518OLPgznvHmkh1PsWgrAxxC2ToRnbyJJ3J68o8kwkBkrNxXAWSvxNzPNSoTn3hR973
	SskhClxmYhgeUPICkoFrppqJgdfbOhQCwtOVSHUqfSnjGZjbHWt8D9XVwqE0TJ9UCNZpQaBbYQiqL
	R9uLCchmSE+qUCRGf9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WzX-0000000Dl2s-3EqT;
	Wed, 08 May 2024 02:25:12 +0000
Received: from m15.mail.163.com ([45.254.50.220])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WzU-0000000Dl2D-3gJ3
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 02:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4TOJO
	2TgucOnMCTJMIJIVkCaQ27EmlhBbO24n6BSyEY=; b=cyYxd4qczRY2DMXCTUuED
	DstPL1FZwcaLt35xBsPQC7/6FnUMjArlvGXj4TiXKOGPmuNmzO+g1nBVQWgxfUB0
	RZOHQqoKb+srWepZys0lXKmAczGABdk9l/tdXec5nzpWpfyF9ASAKJLbRmNoTvHe
	q71ghjvKTSKLMUlvOligqs=
Received: from yangzhang2020.localdomain (unknown [60.27.227.220])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3v+Nv4jpm+z+lDg--.23507S2;
	Wed, 08 May 2024 10:24:47 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: alexghiti@rivosinc.com
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"yang.zhang" <yang.zhang@hexintek.com>
Subject: [PATCH V3] riscv: set trap vector earlier
Date: Wed,  8 May 2024 10:24:45 +0800
Message-Id: <20240508022445.6131-1-gaoshanliukou@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3v+Nv4jpm+z+lDg--.23507S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wr1DJFW3Kw1rWF4ktr4xZwb_yoW8Jr1kpr
	4fKw18CryFkrWxWa43AFsY939xt3WDXa1fWa98Cay5GFWDXa4fJ3s2qw4DWw1a9r4UC395
	tF12grySyw1UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdHUDUUUUU=
X-Originating-IP: [60.27.227.220]
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiNwbX8mXAlHQD7QADs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_192509_380585_B5B757A6 
X-CRM114-Status: UNSURE (   8.82  )
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

From: "yang.zhang" <yang.zhang@hexintek.com>

The exception vector of the booting hart is not set before enabling
the mmu and then still points to the value of the previous firmware,
typically _start. That makes it hard to debug setup_vm() when bad
things happen. So fix that by setting the exception vector earlier.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: yang.zhang <yang.zhang@hexintek.com>

---
V2 -> v3:
- Fix commit message

v1 -> v2:
- As Alex commented, remove the patch for supporting hugesize kernek image
- Add the omissive logic of set trap vector earlier
https://lore.kernel.org/lkml/20240506022239.6817-1-gaoshanliukou@163.com
---
 arch/riscv/kernel/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..03dc440e643e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -300,6 +300,9 @@ SYM_CODE_START(_start_kernel)
 #else
 	mv a0, a1
 #endif /* CONFIG_BUILTIN_DTB */
+	/* Set trap vector to spin forever to help debug */
+	la a3, .Lsecondary_park
+	csrw CSR_TVEC, a3
 	call setup_vm
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
