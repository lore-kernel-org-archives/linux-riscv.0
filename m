Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EECCE7AE8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQChB4HEvHA0d6YZb6Ul5j2PNhGWgEovl2NLY233guk=; b=avMVHbTGIYVufs
	3W7OXcJ9764asOHV/u+K6/Xp0mqOfzRw4UBkxSJo6WiSIwZ9NbvzC5QjjNhkUuK84Or2xUHLf1PV8
	ULlk2cD1AvwNcj/dPEeWLh4/H2b42BLpM93dK9PtOvlHC5D55dBXU0GpRI6PEenpVSv/Bom4h8+Jl
	OqZr0rXgi2PnvQ4Qt8bw3oEOlMvG4k62D5esrWPk/4FtBjNuhI3snrAEQYB+bjEslHAodpQ2yhLxz
	dZOFXzJNsUHZ/QP3RJMFraMWrFzkTwyzxJ91phLg+ZZe09NAhz6uhrdCwj7wAo1q2rmGIIl+OoIFb
	6F3Hq2hKKYn2/JFSz/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUO9-0000000BKyu-2316;
	Fri, 06 Sep 2024 08:32:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUGY-0000000BIPV-0H3P;
	Fri, 06 Sep 2024 08:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725611012;
	bh=MO0pi98eViiMaBz/NH3uP9iuQWzc2fwH2Tnw5ppTaJs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nazGTTq5f5GEbSZ33YaiXatCrhnULF0yJSeUDxKrA0FwkUypCGTkkVm+QNldcSuRq
	 9AlbHTdZHWZiBSURtvT90B3PbVzdOpcZGztk4cIlA8UeTEF2GojOpvjn4RpS3U9p7h
	 F7fmaBxMV/9axkXQqm4VlkmV9UIUfcnRFYMmtrDs=
X-QQ-mid: bizesmtp82t1725611003tulm6gpk
X-QQ-Originating-IP: WlORxptxdtKcKmsPKXiz0WSiWrD5HCSBdepoR+2Hh7o=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Sep 2024 16:23:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18096305791163907771
From: WangYuli <wangyuli@uniontech.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	alexghiti@rivosinc.com,
	palmer@rivosinc.com,
	wangyuli@uniontech.com
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	dvlachos@ics.forth.gr,
	bhe@redhat.com,
	samuel.holland@sifive.com,
	guoren@kernel.org,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	willy@infradead.org,
	akpm@linux-foundation.org,
	fengwei.yin@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	conor.dooley@microchip.com,
	glider@google.com,
	elver@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	ardb@kernel.org,
	linux-efi@vger.kernel.org,
	atishp@atishpatra.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	qiaozhe@iscas.ac.cn,
	ryan.roberts@arm.com,
	ryabinin.a.a@gmail.com,
	andreyknvl@gmail.com,
	vincenzo.frascino@arm.com,
	namcao@linutronix.de
Subject: [PATCH 6.6 3/4] riscv: mm: Only compile pgtable.c if MMU
Date: Fri,  6 Sep 2024 16:22:38 +0800
Message-ID: <A01B1440514C416E+20240906082254.435410-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20240906082254.435410-1-wangyuli@uniontech.com>
References: <20240906082254.435410-1-wangyuli@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_012426_610573_0F091ACD 
X-CRM114-Status: UNSURE (   7.21  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

[ Upstream commit d6508999d1882ddd0db8b3b4bd7967d83e9909fa ]

All functions defined in there depend on MMU, so no need to compile it
for !MMU configs.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20231213203001.179237-4-alexghiti@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/riscv/mm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 3a4dfc8babcf..2c869f8026a8 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,10 +13,9 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
 obj-y += cacheflush.o
 obj-y += context.o
-obj-y += pgtable.o
 obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
-- 
2.43.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
