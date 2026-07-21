Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1A1C4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyt8LDr8gkLwElwYL2nz3YNPV84alrtkidf4Iv4wPu8=; b=eAQeylUJcG3Nrs
	YglKlWqaKGYkH1eaqN/OhhGy/3tJ+KOVG/cV69ygUsv0zIOXtBPA4B8kq45FEFil9oK35T2vfHpbk
	qWKTzYdDSJU978UWFq3gWVU4WKyTGSOlJt1OJkAxy1frDu87yo4Zifi5bI+l/KiFxdxkFdto/MV9F
	+gyLaWW/H/OPk+bY+5YldIssqTrLF5mM2y3QiSadLDzoY+TDcxWwDfbA0Oym7p00Z9CYKMs102WYc
	lFFR2IzPZJcS6ZqQK3YC8I/BwSfX1mUsnI6rE5qXicD4IHi195nY7xqvmLqhwgspPW12BiNGpcwVb
	bg3gKO8BbdkXtdvuDznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5N3-00000008jHd-2Cg5;
	Tue, 21 Jul 2026 07:58:33 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5My-00000008jEW-2Gh5
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References; bh=P2eC5CO17ZmCaiY9iogmoKgMU+
	GEh9yZwgxAO6EYucI=; b=YuW5AlJ+Vope2VO8opcME13yqfR3vSD8eyIZcons2E
	g8jxWn+zhlNxtU0slbTvcH9MugIEvXAPyAOMM1qZd89ZF27Bg7LMVG4O89RIcZLW
	ntFUJNwM1RRkPtkxwq3G4v1TiIpgjjz9F23RMi7jidjzh1RnmGZpDHPSw5fV4sRz
	8=
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOyJl9q4GgUAA--.17568S4;
	Tue, 21 Jul 2026 15:58:51 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [RFC PATCH 2/3] riscv: kexec: Select HOTPLUG_CPU for KEXEC_FILE
Date: Tue, 21 Jul 2026 15:58:11 +0800
Message-Id: <20260721075812.82708-3-xb@ultrarisc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260721075812.82708-1-xb@ultrarisc.com>
References: <20260721075812.82708-1-xb@ultrarisc.com>
X-CM-TRANSID: AQAAfwAnEkOyJl9q4GgUAA--.17568S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4kKFy7Gw4DXrykJrWUArb_yoW3Zwb_C3
	48JF15urWfCF95Zr9agr4rZr4fAayrury5Jr47trW8u34a9wn3G34qkF1UZrn7W34rZ3yf
	urWFvrs7Kr18WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbqxFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUPk
	uDUUUUU==
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAOB2pdm1EAHAANsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005828_928685_7F9DAA3E 
X-CRM114-Status: UNSURE (   7.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V machine_shutdown() uses CPU hotplug to offline secondary harts
before handing control to the next kernel. ARCH_SELECTS_KEXEC selects
HOTPLUG_CPU for SMP, but the KEXEC_FILE-only configuration does not.

Select HOTPLUG_CPU from ARCH_SELECTS_KEXEC_FILE as well so both loading
interfaces use the same shutdown guarantee.

Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7028ca..55e94e2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1097,6 +1097,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
+	select HOTPLUG_CPU if SMP
 	select HAVE_IMA_KEXEC if IMA
 	select KEXEC_ELF
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
