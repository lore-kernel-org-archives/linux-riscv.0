Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72E606A768
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plA7kdOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PKyc+GMHJWgQqS5dEFCG72GW29q2P53q0Sb8WOcTdNM=; b=plA7kdOFWT/q3WZsK1Je3zCJbE
	2s3+yZZZuVIHMcuu0oHrVq+1UpY7IVsOzd+WFl1+7A4JKPPFHo8IINlikmgceT9+OAimZaG1FHeu4
	UBeDptCyC82rYEJ5plQpQx6/788if05x7msHyqUcbO+wDxfyQDhJ0r2VVmmQLkh1JknNfdaLAzjVe
	Ky4WTgcggjvP419Y1UAb54Tt5Rb5DGd9W/KefOXhiJQLYkscR3xcUN74YOC2xnzlPdr0l0kHigPW7
	cMgFkrD/pozLMoXhtZQZ86Q1hZnRdkf4UpFhkcm1KgjhqfBg64ZkkU6qkjV7SWR8V9GEWaOHqWmxK
	XfmA6oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlxT-000000044Gk-07WX;
	Tue, 10 Nov 2026 13:32:19 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlxQ-000000044Fo-2ER1
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:32:18 +0000
Received: from [127.0.1.1] (unknown [223.166.93.97])
	by APP-01 (Coremail) with SMTP id qwCowABnj_nVHPNqe_62AA--.3592S2;
	Tue, 10 Nov 2026 21:32:06 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 10 Nov 2026 21:32:05 +0800
Subject: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIANQc82oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3dTMZHNzAwPdkuRS3cTknGzdxJRkoyRT41QLY3NDJaC2gqLUtMw
 KsJHRsbW1ANW2mmxiAAAA
X-Change-ID: 20261110-eic7700-tcu-aclk-adc2b53e8371
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABnj_nVHPNqe_62AA--.3592S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kCw1rKF4UZFWDuryUJrb_yoW8ZFyDpF
	sxtFs5uF1ktr1fWa42yFyaqrZ3Aa1UGa43GFy8G3WkZ3WUKr1v9F48Kas8tayUZw1xXw15
	tryxJay3GF4j9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRMHDGry1-3bzQAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_053216_964350_C8FB0AF4 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SMMU TCU needs its AXI clock for DMA, even in bypass mode. No driver
claims this clock, so clk_disable_unused() gates it and DMA through the
SMMU stalls. On the HiFive Premier P550, this hangs firmware loading of
an RX550 graphics card.

Mark the clock as critical.

Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Tested on the HiFive Premier P550 with an RX550 graphics card:

- Without this patch, amdgpu stalls while loading the RX550 firmware
  and CPUs can no longer be halted.
- With only the TCU AXI clock kept enabled (the TCU configuration clock
  is still managed normally), amdgpu initializes and the IB ring tests
  pass without any manual register writes.
---
 drivers/clk/eswin/clk-eic7700.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
index 43a47fe16ab14ae1d1cacc3a0da0203e412541c0..7c95055f13eb782a03723e4475d63060d37711aa 100644
--- a/drivers/clk/eswin/clk-eic7700.c
+++ b/drivers/clk/eswin/clk-eic7700.c
@@ -832,8 +832,10 @@ static struct eswin_clk_info eic7700_clks[] = {
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_D2D_CFG_CLK, "gate_d2d_cfg_clk",
 			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
 			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_D2D_CFG, 31, 0),
+	/* DMA through the SMMU still needs the TCU AXI clock in bypass mode. */
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_ACLK, "gate_tcu_aclk",
-			EIC7700_CLK_DIV_DDR_ACLK_DYNM, CLK_SET_RATE_PARENT,
+			EIC7700_CLK_DIV_DDR_ACLK_DYNM,
+			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			EIC7700_REG_OFFSET_TCU_ACLK, 31, 0),
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_CFG_CLK, "gate_tcu_cfg_clk",
 			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-eic7700-tcu-aclk-adc2b53e8371

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
