Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0839ACD1292
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdPZhYCC/P+lHlOJJHKYe8EWmIoB5SzXASfo6S3ROio=; b=Y7HTJ3DJe1+VVC
	J0PXSqirsjIFO0oRmIxSDsa7Ae9hq1u5/jpmQl5ftNTh8/n+c+4fOee5lzAW5CmkRYt3jX6RDXO2S
	sH40iw16dX/XCiodXq55c68UoH/RGoIol/78PTyiMiSJQjJToC2QdPFUFtO2YTEAdB05goNHgxw5y
	qERAYBnKq9E3VXlGIY/WleJwbZlYwZWGa4b3SrB+k/fmVW0vmx8fa5NFhasmdDKQSULR8t+tySyh4
	/gVcH7N0dluXQOWL2d0sNjsWtXT7GGxLp/sYoOrK1iqlROhg0vfrEv8QsGpCi4gRNeZT72sjtFQvb
	LNRJ7NEY5vI4vU0UnV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeCF-00000002nF3-1f9u;
	Sat, 08 Nov 2025 08:21:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeCB-00000002nBq-25pW;
	Sat, 08 Nov 2025 08:21:18 +0000
Received: from localhost.localdomain (unknown [223.166.92.44])
	by APP-03 (Coremail) with SMTP id rQCowAA3texL_Q5p20b2AQ--.57722S4;
	Sat, 08 Nov 2025 16:20:37 +0800 (CST)
From: gaohan@iscas.ac.cn
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Drew Fustini <fustini@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guodong Xu <guodong@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH 2/3] riscv: soc: allwinner: d1: use the ARCH_SUNXI_XUANTIE
Date: Sat,  8 Nov 2025 16:20:24 +0800
Message-ID: <efd67b0b408bddcf664a8ae61230478e91823d01.1762588494.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762588494.git.gaohan@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAA3texL_Q5p20b2AQ--.57722S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4UZF4fGr4kXr47WFW8tFb_yoW8ZF43pF
	n3GFsxWFy3CrnagFW3WrZ8KFZ8tw48t390krZ8JFyIgrykJ34Ivr9rtrn7Kr1rtr9xJa1x
	Gr97CasxAw4fAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxAq
	zxv26xkF7I0En4kS14v26r4a6rW5MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRtku
	cUUUUU=
X-Originating-IP: [223.166.92.44]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_002115_927873_8B81FDE2 
X-CRM114-Status: UNSURE (   6.74  )
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

From: Han Gao <gaohan@iscas.ac.cn>

d1(s) use Xuantie IP.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/allwinner/Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
index 1c91be38ea16..635762ba06fe 100644
--- a/arch/riscv/boot/dts/allwinner/Makefile
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-clockworkpi-v3.14.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-devterm-v3.14.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-mangopi-mq-pro.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
-dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-clockworkpi-v3.14.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-devterm-v3.14.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-dongshan-nezha-stu.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-lichee-rv-86-panel-480p.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-lichee-rv-86-panel-720p.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-lichee-rv-dock.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-lichee-rv.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-mangopi-mq-pro.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1-nezha.dtb
+dtb-$(CONFIG_ARCH_SUNXI_XUANTIE) += sun20i-d1s-mangopi-mq.dtb
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
