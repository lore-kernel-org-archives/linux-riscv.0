Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF422CDB47F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ThUFWrsNGGTPZh0dC1nOSsUavsSJ4Wx2Xy80RpBNiPQ=; b=Y9a4zV/Nw7qIWe
	E0VzI3cwov2uiY8jIQxMqFGA10bQog4FX2pe+qHHmDC4jEWJzvDZ8WqyrfKziRbO/9Qm+FdCiQdFG
	319SdKWgdEwD0Ci4Haodz5O5mxdJE5ciEkgyhMgNrYKmYzNp17h0ZVGB64Bii0NXgAeuostoHLu7c
	DuDAeb8YW3/R6AiEI7CyNt5mvRvZZ5Orlk4DKXlsZk7WmVKe9A2Q3oIIUQtV4fujii3E/GSGGbJkS
	CDq+AYyqp2LqHIRVrVgEfyem1+ZDS0myvCutKs/X8OyPz6HKih7Lhcd2w3HWXUdiKb+L4ksmRDfWo
	oJeQOjlHPe0AHuwr7/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdfe-00000008iAk-2n9y;
	Thu, 25 Jun 2026 06:34:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdfb-00000008iAE-1SpK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 06:34:42 +0000
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowACXOtP3yzxqLBgrAw--.37407S2;
	Thu, 25 Jun 2026 14:34:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 25 Jun 2026 14:34:15 +0800
Subject: [PATCH] riscv: Raise default NR_CPUS for 64BIT to 256
MIME-Version: 1.0
Message-Id: <20260625-riscv-more-nr-cpus-v1-1-5da8c72b9269@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAObLPGoC/yXMQQqDQAxA0atI1g2Mgw7iVcRFJ0abgqMkVQri3
 TvW5Vv8f4CxChu0xQHKu5gsKaN8FECvZ5oYZcgG73xwwdeoYrTjvChjUqR1M2zKuhlirELlCHK
 4Ko/y/U+7/rZt8c30uU5wnj+zt4fSdgAAAA==
X-Change-ID: 20260625-riscv-more-nr-cpus-8158dbb4640c
To: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Lufei Zheng <lufei.zheng@spacemit.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: qwCowACXOtP3yzxqLBgrAw--.37407S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15AFy8JFW7JF18ZryUAwb_yoW8Ary8pw
	sFkFn5Cry5Ars2gFW8ZryxWw4UZFs8W3yY93Wjq345JrsIyr90vrZ7t3Z5Gr1DWr4kJr4F
	yF93Ga4rJF1vyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_233439_767110_6E3118F8 
X-CRM114-Status: UNSURE (   8.55  )
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

SpacemiT has already produced a 80-core RVA23 RISC-V server [1], and
going further back, the dual-socket SG2042-based Sophgo Pisces has 128
cores (although that had some issues achieving mainline support).
Therefore, an NR_CPUS of 64 is not enough.

Raise default NR_CPUS to 256 for 64BIT (when !RISCV_SBI_V01, since very
old firmware can't support more than 64 cores). The number was picked as
a power of two that is at least double the known max. I believe this
should be the right balance between not wasting too much memory and not
having to touch this too often.

Ubuntu has already been shipping NR_CPUS=512 for riscv64. We have also
been testing NR_CPUS=256 internally at ISCAS and found negligible
performance impact and no ill effects.

Reported-by: Lufei Zheng <lufei.zheng@spacemit.com>
Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1140651 # [1]
Suggested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3f0a647218e4..c0a6992933e4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -454,7 +454,8 @@ config NR_CPUS
 	range 2 32 if RISCV_SBI_V01 && 32BIT
 	range 2 64 if RISCV_SBI_V01 && 64BIT
 	default "32" if 32BIT
-	default "64" if 64BIT
+	default "64" if RISCV_SBI_V01 && 64BIT
+	default "256" if !RISCV_SBI_V01 && 64BIT
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"

---
base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
change-id: 20260625-riscv-more-nr-cpus-8158dbb4640c

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
