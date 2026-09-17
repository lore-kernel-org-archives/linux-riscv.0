Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19AAC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s097D5PWt4oJPYWr3avBby7JwLPgJhzDlKsSqChIRts=; b=kl5TJAfoFYJ0vp
	r2FDzFiA4K+t/+i7aV4t0mVc2vnyHSDFXKdBIZhMSa5CdiFUJ8R5QmkbskQqhW7HsdahFOLmJ/qSg
	2SnBK55AQdl/ssGX6JRTnkZWyOE/RCdA8kJh8wU+5lRi+9mA85N6Opai+qS82EKrhR2Wbl7jSc0B8
	Ff8PeQpBOMY9zqd13TventtT9ilZxw7vIB3PMaWXjZqNHEPiziEiNJzQP+zq9Pbha50BHMq/TBXaO
	AampiC8Va7Vq1rsfovOdrH6AEgQSK7FZtAiyIvCvHamJpJoTOJnMPBoGwKGG6cgyaJMOJHWCoDRiE
	L3oV4pdxQd4v4P2kuYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76s0-0000000AoKy-0bUP;
	Thu, 17 Sep 2026 07:49:24 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76rx-0000000AoJW-0WCZ
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 07:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3T
	Ahw8kdQ1bkc+p6ARnCv8c+rD9/bfuYAfSjbI9rJ7I=; b=TxSezOchSCRBSPleHp
	Cdt/NR9KrUKQzeMR12NCqPLsa79kxzDpiw6imQshkdVQhNxwYRi42zJWPiVOHh9A
	hj/H7FFN4VQBaRGvMxAvfCGVbmszyjCJ0ZHKUxB5wHh44zFyn7xjQ8fB5brsLAid
	Z8KFyeR04+B9Hfd+eyDP+LSjU=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC327hgm6tqF7HwBA--.39980S2;
	Thu, 17 Sep 2026 15:48:49 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
Date: Thu, 17 Sep 2026 15:48:43 +0800
Message-Id: <20260917074843.52716-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wC327hgm6tqF7HwBA--.39980S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyxuFWkWw4rCr4rCrW3Jrb_yoW8Ar45pr
	Z5Kr1rK395XFyxArsrGrW8Kws093yfX3y3G34Du347Jw47ArWjgr4kKF4Dta1qyrn5Xw45
	XF4SkFyIkayqyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXXoxUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9AGEMGqrm2F8ngAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_004921_580989_C96DDCE0 
X-CRM114-Status: GOOD (  10.03  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

errata_probe_ghostwrite() only marks the CPU as vulnerable when it is
called at the RISCV_ALTERNATIVES_EARLY_BOOT stage, and the mitigation
in ghostwrite_enable_mitigation() only takes effect if the vulnerable
state was recorded before the boot alternatives are patched.

The early boot stage is only executed when CONFIG_RISCV_ALTERNATIVE_EARLY
is enabled, which currently is only selected by ERRATA_THEAD_MAE. In a
kernel built with ERRATA_THEAD_GHOSTWRITE=y but ERRATA_THEAD_MAE=n, the
early alternatives never run, so ghostwrite_state is never set to
VULNERABLE: ghostwrite_enable_mitigation() returns false, xtheadvector
remains enabled, and sysfs reports "Not affected" on a vulnerable
T-Head C9xx CPU.

Select RISCV_ALTERNATIVE_EARLY from ERRATA_THEAD_GHOSTWRITE so that the
vulnerability is detected in the early boot stage and the default
mitigation is applied.

Fixes: 4bf97069239b ("riscv: Add ghostwrite vulnerability")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/Kconfig.errata | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..6121ba83cfa6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -146,6 +146,7 @@ config ERRATA_THEAD_PMU
 config ERRATA_THEAD_GHOSTWRITE
 	bool "Apply T-Head Ghostwrite errata"
 	depends on ERRATA_THEAD && RISCV_ISA_XTHEADVECTOR
+	select RISCV_ALTERNATIVE_EARLY
 	default y
 	help
 	  The T-Head C9xx cores have a vulnerability in the xtheadvector
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
