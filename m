Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807CC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuC0LQ04hPnfPDwwAUHZ+XtM3X1uyEMmTlWe17nUO/E=; b=EJKeHVRRI+mcvg
	l/SsjKg64T+LomRlxTWoQMAUBTnJ4AFe4KfAD+T+if6bdvTrv/PoCJgM6q0qXTGfrKcEE6ac3PvDG
	Rfrbox6bcVW+jJCRntoy1pBoW1ewRR9h0psVE0VlgmmkYM1Qj8APgexEomBIaYGlCx2B4Bf2+8tCV
	Cg6sOlYZUCjIoZ30ibvC5I1MFvPx3n6P8GbS2DdXoCO5HXlAuRX5Y0Y+IyG6zyMvTH8OuzPuxhm9i
	MMgKMm/h6Xb2xNkCz/kCTV4U5sRpSeO0SO1zXDDPP+ZABg9uqDx1eeRR1Z9wwINgZuUYJgyYA7xij
	NgIV5psjkJ0VpsZgaKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oH-00BlRp-2H;
	Sun, 12 Nov 2023 06:19:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oE-00BlPF-2c
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEB3E60C25;
	Sun, 12 Nov 2023 06:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F1EC433CC;
	Sun, 12 Nov 2023 06:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769941;
	bh=qRqp7QPejGbBbu5oKyIM5RFWyLdo559Kq9GxnASTbi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ggOZX2kRI1MtgdsU3XRYcle/m3IZf5lFlvSEYa0dAcFri8lmz9B12mIjqRdjlTXpT
	 9eFDzbRis6FA35srzfdsZ1u+hdrQQVMKimjV/uEL8gk48FIJWD4Fq7mAEAar6U9BQA
	 UO4a6fHPSuSWXP7Uof/glDnhRF6GmGUcc2ukCjlha4UnHfycJl2E7Vmx63uepFbtX2
	 eSwGWL6bq0W+YoWoC5OdGwLBR3dmmolU6lxAdTgevj6QQ9NDteYmG5XgzL4wGhXiFx
	 mJWrDq5z/7tZHCpCSiEhZE6dgetUMoigTXmlWHhxf6Q40hsyiNK/Qs5ODE9ZGl3gwW
	 COGIgXRKibzXA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 35/38] clocksource: riscv: s64ilp32: Use __riscv_xlen instead of CONFIG_32BIT
Date: Sun, 12 Nov 2023 01:15:11 -0500
Message-Id: <20231112061514.2306187-36-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221902_891515_89C9DC2F 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When s64ilp32 enabled, CONFIG_32BIT=y but __riscv_xlen=64. So we
must use __riscv_xlen to detect real machine XLEN for CSR access.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..fe83b4e2005a 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -38,7 +38,7 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	csr_set(CSR_IE, IE_TIE);
 	if (static_branch_likely(&riscv_sstc_available)) {
-#if defined(CONFIG_32BIT)
+#if __riscv_xlen == 32
 		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
 #else
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
