Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2481FC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pb1t0NxgNXiIZpSwlFjL3lZOs3yNeEaeBnqwaPv672A=; b=kh1KM+frg5xsTk
	C51rVpFGHRUHVdg0rwDrq1/k9lCEULoOmLYzaamuLRtdY6cywpcWm23ULiLpMrE/wjrp8RVHLRMNC
	HL1wMuFxOVBFaUKFxQBBXf8iCAuGRKibOw3YDVLH8IhpjGLsJKDK4bz/oB209LgUK8St783anJmC3
	jnckGbSzI6kVxtSrmxSDQ2TJHMXxNtPVyXSE7JTD7flnfikdC6zLsFmLwU55vtakdUdKhNmcmHI6L
	8hPlOwJQrG5xlomiaH6HM5dJSoWg/8vKUGBC9kG7Y6BCG349mkO2FzPU9B3/v0tlUHed04K+q6ab6
	ZDVGljfClSeEPaHpQ7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRBo1-007vuH-1t;
	Sat, 20 Jan 2024 13:54:41 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRBnw-007vtl-0i
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 13:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1705758853; x=1706363653; i=erick.archer@gmx.com;
	bh=sb6+RW/YLIs0NzptG579OSujb6BOPGBFSGWE+7kOOos=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=NMAQ8/heKh2oHIoXl4qZXWLKYBcbUnrMHHYlBsHZe8A0WpJybyNVO/7xZynYxzU8
	 uS6aEx/UsScf7dn2SxS2cI9PTevN98Ss2pE023XnczRcipndN3yRd3f/RtIRuXup9
	 7AzW6SL1fCC/u4L7zdC/ZwEfKinnyi+pP4S73BTHoNEb7+Up+pgYyCIp82jrclmSS
	 ryZykkOJk/GcbJBPCxL3nVcEdygm/2adjJwfbP7TXpPs0/WBdbMNZNWleUC1GVSTy
	 eCTGPjgHSlMMws0QJGtIkzMFYwr5iYsXzobNOVA/IPzmVHcdB0rI5+ycdMtYDD8Bn
	 ZYg47Ek+kPVwLIOMgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N2V0H-1qyi672owh-013zTZ; Sat, 20 Jan 2024 14:54:12 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Erick Archer <erick.archer@gmx.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] riscv: Use kcalloc() instead of kzalloc()
Date: Sat, 20 Jan 2024 14:54:00 +0100
Message-Id: <20240120135400.4710-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:F/INeGDiLTwJQvGhuOW0o1CH6INUohueeE9N+/dCf5bIjyxbYfu
 CeKgye7vZan3mCPuDg4xacW4kqh6xENZOPOdooyEEgfdFsfCRONp+p9sR15D68FpKV5xuVD
 T7NEwUDtJ/ap/xuTqwk6A9C5SJkTqHamVWdpJdpTD+0FYaKb8JpjFsJEBe/fwsdevGijsEo
 8SmrvAbOn7d/l328zVJ/g==
UI-OutboundReport: notjunk:1;M01:P0:fwiyfGqDDDw=;qTRILBi3BkuJswYxQoUGatLIBaa
 vp8HGbRtvstX9X/BAvQBntItanH2FvgPOU+9d37r6FvA3PTjduk6hV4oW6bRVw8UFrrPWsUFJ
 fL9eOZvYSptF79/YR5D/v4eaeMhQfN7/GaU9Y+1pBbgZX7JjhpbtbwhohXEiMOxA1LK4Daslx
 +sLOR8IkA8qs+FzI8h89rISqogFpiqEeuUfKbm1p2aRU73CAAiEJ4yNCex0M9VzIPko6QOGWS
 lrHrDRriVvC0TdbMLQUMxR/daJ89S5vzhwqm6iz3t67k7q35Orh+M7zvfpvwRDUnnk9YwIZeb
 pxrJpYW4koW7S/Mr30NQ7LmnYqeC+8QcUdPeKHT/cEUeT7hLo8Y29VzHuGI9S75sabLmPzPqD
 SkSrUE+b8RqLgH7HVOoJ+6iyoqYRKLosZcUPu31LIToQJYVZiP1CAXWDlfeFO4wIyRFh/bxyZ
 4aXFGHZ04Nk+AZGjpKZqLE7GbRwY8EnvZVCQEDdEeRRA41ELzB3dNOCGv4IRk7t2XxjUAbkEl
 aEwckBa8ogjTRLwnZawMicL5Hy2R/497InZYRT9awexEddPNW3x6zPpgdOhadfx6KhOB8hhrP
 5qG2helCVJVd0qtASpJpY2LjJJAgI9Ju7Rl3Mu/JQsguufdJ/ZFHeuycu473Lwb96l7uRd7hi
 8QTwrTITgd6EEp38YgPWEr9vz7zz0TKWnEh9si+owfRGQx1lJREwaywAi2BF1IoomNYVHgULz
 a5oE8QkLPFsaXySd2oO/Zwv2kULDciEPVmjIRI7wz/8rsreu2utLG2Kxc1ChBdSepxB4C0xxz
 hx3a0AtjG+2tWgiAo9qZI+2WHk214z1B0EKCO6K+n4c2cCNYufPu0j+77R9UvXw3p1kHQIozH
 cQfGshpZJ2+Sjh2ElPD7/SQa9lFHTIIuoigUlw/kf6kqbekdq8cNJSJSCYcajltkq0r4KP+0N
 rWGF648w7jlAbENNtwYtidGcJOk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_055436_566074_58A5DF0D 
X-CRM114-Status: UNSURE (   9.89  )
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

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the purpose specific kcalloc() function instead of the argument
count * size in the kzalloc() function.

Also, it is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not change the
former (unlike the latter).

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Erick Archer <erick.archer@gmx.com>
---
 arch/riscv/kernel/cpufeature.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..549a76e34c4e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -901,8 +901,7 @@ static int check_unaligned_access_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
-	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
-				     GFP_KERNEL);
+	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);

 	if (!bufs) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
