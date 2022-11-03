Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2281C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1tPcT5+vMJc6TWdaPHZRxkQn5qXETYD7kxeX3EL3UM=; b=HjpwDt84hJckZr
	RmxrB6FRuPXJmmp12Lu1U8Qa6DYAhD3UWzeAedUB+Z5na6uqBMkebFmT3ysoYShPSuADRGSNXAysL
	F5yV4RT/eOYz4aNMYXTYx7VC3TbOYqjljSjMYLd7qdIQXr8xEISusUekkEIKYDwC6V0nUYIbto2/H
	a9ouT4rrAHglk78WAKlvL2yJRS6w55WcRFMzz5SIl6OsQHe11G5nyO5KEgKJT4SKOVb1mzYrqdKyQ
	sJqwisNE6p46D6JSTFUlZpuhBPjW9m3UdTzRElum0lzoVIyXDmpOxTl4rBGvqPhSR6rAUKeV61XLQ
	u+CPc5z6p3EID9Dy+L4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV0r-00GVhy-D1; Thu, 03 Nov 2022 07:51:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqV0o-00GVgo-0g
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:51:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A1DF61D98;
	Thu,  3 Nov 2022 07:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C8BC43142;
	Thu,  3 Nov 2022 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667461901;
	bh=8F+Kx4X5IE8S8oO8XnXHjQy0E8HHBWecQqZQdnIaKB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hb/4FuK4tIbDKiVPyAtBpXREjGDG3pRPu3LgfIxXF4pkM5k4KeFnVCEsdFH8oqthx
	 qw6XSqmN2km/us1xp65NafYHHW9aXD96CTfaOkYhRdrMaxhblVfa+6VP/59SkelB71
	 NwTqS0dUoLlY+ewrJwPS2xebx2Z+6sFHSctx4+PUPbiaIRpSdHoCwyu8jhhlVdMPv1
	 vGCEbhGoaLTHKN69qH8mt2dvHT3g5YkzU4pwJwaxzCaSFC2ph56pQxrZhPjmBGf7uG
	 HRhKfGCuQfexo9e30Srn0KRjQVcUuvFa18EPvo49QZ1Hq25jQ5vVdbaN9scWEGcNUX
	 EjMTNnSdbbFRg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next V8 02/14] riscv: elf_kexec: Fixup compile warning
Date: Thu,  3 Nov 2022 03:50:35 -0400
Message-Id: <20221103075047.1634923-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221103075047.1634923-1-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_005142_116778_0BF3A639 
X-CRM114-Status: GOOD (  12.29  )
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

From: Guo Ren <guoren@linux.alibaba.com>

If CRYTPO or CRYPTO_SHA256 or KEXE_FILE is not enabled, then:

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
'kernel_start' set but not used [-Wunused-but-set-variable]
  185 |         unsigned long kernel_start;
      |                       ^~~~~~~~~~~~

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/kernel/elf_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 0cb94992c15b..4b9264340b78 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 	kernel_start = image->start;
-	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
+	pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);
 
 	/* Add the kernel binary to the image */
 	ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
