Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9CC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ia4bbu9kMlhNEcghp7VIHl08ipvIe9jWFCS3PcoJEzY=; b=4KZPelmAyg8hzK
	NqbXNB6tV2Ruo7O/umAaUDg7uarg71d+2i9jDEVrjK18F+j80aRpR9K7r0sHw+45iHxjazzgeDpt0
	2Xb7LDypzaSGDiH2oKHbY2lC0W6p3qBVvMZn4tBgf3wJDZsTbCKLDrcftiOCEjXkFxlD+qEbZm3gT
	TsDaJkjHp6aG9yb8/EHSZCOG/K1lv+6RxYJ55ZHVvARnq+j+ZTCxGzPS+UKEzqNIfnH2RlCZwcRj9
	UmhxhVPCt+5inhU+4DYX3ChKthnnIf0V/6ASQB9zuCEt3YZ1UrYpyOp3F+O2qAjC/I+fMC8R4Lh5B
	Yju+2DlPE9Kz69pvh5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGD8l-001sse-1Q;
	Thu, 21 Dec 2023 07:06:43 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGD8h-001srR-2h
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 07:06:42 +0000
X-QQ-mid: bizesmtp72t1703142306tblaxfeg
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Dec 2023 15:05:03 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: 90EFqYDyPxDH2HniTLYrCGVM0lzrYT3J1RBkPF9OpvfqEomvd8LqAX4a2tFyP
	xSskE1SPFeB1dab/nMJmmyK4Y9eJfkhfxTN0p1KXoy1nOMYslvqKxIyVlwSEdJqNvOCLDKF
	XgQjKtBH6p+699LlifhZnx/2Idjh20GPiIVkwyMC/YeBMf+kAXAMnlTWMAGy3JthyNUPf4X
	Ft7TWogOJrWFV8LOOodC4XwVZntDYS2OxioYlfK5J/FJ2gHyayBMBSZyYpwv8pqHwalauHu
	JXdc1ul8HXjoERHkBWfjEK+Gnx8f1iQEs/0MrQwSOarrEwGRQYFUSBTCh58CrslSZtFUWVB
	/kU/RXtpsjPVKXkEIjE2v9uqMsUT7k08Os/cDOx
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7023690611978233006
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	xiao.w.wang@intel.com,
	heiko@sntech.de,
	ruinland.tsai@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: vector: Check SR_SD before saving vstate
Date: Thu, 21 Dec 2023 15:04:49 +0800
Message-Id: <20231221070449.1809020-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_230640_467636_246ECE33 
X-CRM114-Status: UNSURE (   7.79  )
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

The SD bit summarizes the dirty states of FS, VS, or XS fields,
providing a "fast check" before saving fstate or vstate.

Let __switch_to_vector() check SD bit as __switch_to_fpu() does.

Fixes: 3a2df6323def ("riscv: Add task switch support for vector")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/include/asm/vector.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 87aaef656257..d30fa56f67c6 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -190,7 +190,8 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	riscv_v_vstate_save(prev, regs);
+	if (unlikely(regs->status & SR_SD))
+		riscv_v_vstate_save(prev, regs);
 	riscv_v_vstate_restore(next, task_pt_regs(next));
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
