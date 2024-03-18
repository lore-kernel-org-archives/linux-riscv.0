Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26490C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nojwsHxITUUu0xeV1nPfnEC2YVF8wpWDrVim5tf1h5k=; b=JAD7SwwiZj7rVe
	7NU0OhzNt1pj3VFs8Hy5wbFgt5vrLChHD16HWZUZ+lYfzJt7JGkE9Nlsh9yyol4EJN+ru6tDDr2ih
	fMYoENQKL0LH2Sgec8ik7Kgtq42SUkEShYBF4NW6NVFeCwekDMaMrlL3oMgyjB7GYRHnh+d3Ac2qg
	hTMN2W67IaHNNtRA26R1mDmptI5k7H8JqXuYMZPqao4yP7dVHo9cv9kV+ikA0awiiwyTY9UA3dBEM
	LYelnpS/B+PoyZQpfPCO8FJUGaMJhdUDm2ecTEk0eZVToKtpAazzQ/cmixQRnC48LWVgc85BvfyBq
	J7pDqvw5dHt/0roohcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm6tR-00000007Wl4-1gMM;
	Mon, 18 Mar 2024 06:54:45 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm6tJ-00000007WiI-3NcN
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 06:54:44 +0000
X-QQ-mid: bizesmtp67t1710744854tfxcwua3
X-QQ-Originating-IP: mrevuy/Rs539dEBlGNPPK3F3bnF1JYIlXxZ0h2VzWw0=
Received: from HX01040049.powercore.com.cn ( [116.21.68.104])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Mar 2024 14:54:08 +0800 (CST)
X-QQ-SSF: 0140000000000090B000000A0000000
X-QQ-FEAT: LE7C6P2vL8S2AsPvDMxMsr7RnQBDCpTCdqZRGD02RV6WKILltgocXch7agQkR
	OKeWW5jdgoxVH661xRpnaGH9wX5ng4BBorVUtQAEhdo2EL8BWGNdwBuJ21QafppND8J98vg
	fVvjpZRwxR9yhn86JY0pLCpGWwhGiol6lBtFouRW6ilaNffNqLF737/g0DxEEYsBcMgDhQG
	5b3Wn4rBPkyp3irnHrJZLdp29vZMmz5RjPuSsFt6gPF5KHIgUa/8+dMHWnT40HIY4khlCwc
	Qte7n8jZQ4IftAuaI7wD8s+Ay66+ZM04f/5h38U0Wxbn4CgCaWYj7sDRTqVBLNjPHzERNCG
	EF9IrHjG7ZaLE9G5paFL5WCra9OC0bdspBtkE6cf+iaFOT7Zm+DPz/sDhynww==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 15004159612326503418
From: Zhao Ke <ke.zhao@shingroup.cn>
To: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dawei.li@shingroup.cn,
	shenghui.qu@shingroup.cn,
	ke.zhao@shingroup.cn
Subject: [PATCH] Use bool value in set_cpu_online()
Date: Mon, 18 Mar 2024 14:54:04 +0800
Message-Id: <20240318065404.123668-1-ke.zhao@shingroup.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_235438_467679_ED089AFB 
X-CRM114-Status: UNSURE (   8.39  )
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

The declaration of set_cpu_online() takes a bool value. So replace
int here to make it consistent with the declaration.

Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
---
 arch/riscv/kernel/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 519b6bd946e5..3f7c274653ab 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -229,7 +229,7 @@ asmlinkage __visible void smp_callin(void)
 	riscv_ipi_enable();
 
 	numa_add_cpu(curr_cpuid);
-	set_cpu_online(curr_cpuid, 1);
+	set_cpu_online(curr_cpuid, true);
 
 	if (has_vector()) {
 		if (riscv_v_setup_vsize())
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
