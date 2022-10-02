Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDCC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1tPcT5+vMJc6TWdaPHZRxkQn5qXETYD7kxeX3EL3UM=; b=uQF/hhmQAdea94
	r9ybS523B9fsNeAL2zMoKewPM4toMVeIXbKU/WAI884wAphQHyW80FZIpgzAcRTaI5CFMZSmIjr0O
	wVHBodI/piGNcfuJ5NoXZNHb8NQNO4jNWgArTi2eMoz5YvXu3wM9DqUyddM7K41eKJ425E1/iIrIf
	uAOxDXYKefXmUgQ3OYlO4aDGfo6AxACUjRMoUd5Lx84JpiswsAc/CK0PVJqSzgSuTjqrAd+1uRh0Z
	ppOEetQoRWHCwhtIownhFmhnQoF+FQlfVIPj4B6yc43OHR5j/x2kJASdd4GLKY1xOZBdYP0cqpZdF
	VBAE2mCww0xK1e5yeuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenje-00GrNL-Os; Sun, 02 Oct 2022 01:25:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjb-00GrM0-OL
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 70FA2B80C02;
	Sun,  2 Oct 2022 01:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81F2C43141;
	Sun,  2 Oct 2022 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673932;
	bh=8F+Kx4X5IE8S8oO8XnXHjQy0E8HHBWecQqZQdnIaKB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q6Zz0FKxb/V4jiO9ATtYq1u8u06FMCcghKlsouZhoSgKkwWgt+Wp4geBK4W75BINx
	 IfeYgK6VvDulvX8ilCyL4ud5ryj3BroZJA10s1bQURItRhyvLPeYUOUskMZqpLksGg
	 9xzUrVXM/yr7qgRyvJfI1JniBgryfHKM+R0IKi4mJHC998Wym+cbOQu7XsMqd2pj2Q
	 0xzBMjMBI4mecmVcDm2ZaKd0wgC7fJ9KTok5hV8ZQUAZMx4l8RkE3XAPNcOcfYTwKS
	 URSIj3PQIG0Ugcp1n+NxfHY3k5ZxuqXFjsp8o6WU9XmCsHCdLn9MMGeo+WNWOqeA15
	 dssWeQ+1haAwA==
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
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V6 01/11] riscv: elf_kexec: Fixup compile warning
Date: Sat,  1 Oct 2022 21:24:41 -0400
Message-Id: <20221002012451.2351127-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182535_952963_02D63B71 
X-CRM114-Status: GOOD (  11.81  )
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
