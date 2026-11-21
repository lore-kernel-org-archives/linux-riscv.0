Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAB606A32A
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4n8b//WO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpyHBnf7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yioP77NCQ7OY2iNNM9UWJfTyGi/f1P2ll6pnz+ZDSQA=; b=4n8b//WOYNL+lVbYLkNxEQsNCr
	BKLmyupdbklCuSnosfGqE1I/dUFg6TqPu7+o/DMfi8R8xLilYGG4Bpmfso0K324SBjjYQ/vw/oJHs
	7HKVRpVQCgzw5K/VOYHBmh0SrqFMS6tdFXOk1bhoCz3ncHor+7bYpRPKonWlkGwTuiF1hlJhopNwH
	6rAg83LlZ0EB76x5UxJXHJQZ6uOK8LWDNmzfGYsnWP8hohQp4FtfZKkzyFJR92ldGnE8HaEatwbPO
	mXy5nvJCdHMNisa1HJG9zK5vsOTuespY6OFWKfcT0mLSia7Hh23fa0/dgBti0/DJl6RvphzSEJUgs
	5I4HWCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU8-0000000H2iB-0w45;
	Sat, 21 Nov 2026 10:38:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU7-0000000H2ho-14Rq
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 10:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D89643EEE;
	Sat, 21 Nov 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795257498;
	b=GatvQPmaiOpF25DvV58ijjpjD6vJ0xx6gTrSnBKAceSPSTwI5R0RiT6jHDwaBAyCC0hx
	 GryhqY1ku4YjKcHq4CCcULuz3Ek1dSFnddK+Q55tMeU2vh0437Y020zt6iasJ2AudoML8
	 8kBw+uqGAJ82mxidoie3jToDqnHZduXOkF/ihL8vj3ThKt22zfFjmH2fPKH0s9K3+D3HB
	 F1aDFFbXo6PgADrkQfprBgnO+9yPayQo4TJ1vdIVn7SuwcgRwnri/UbPULph/7Ufny91s
	 Bpw4Few+gtzwpJb2KPCIVRNts0Brw8p3vIiXdeTTfvXIhbISIMJZrUZb7EKtTjUW17Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257498;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OG0c6l+y/8sOpyl1NqaqhQcf9W4FSCA1cHzu90CtLcs=;
	b=PQdBLstlPWA2nh9JhY0lYtD3HraYGBve/LNoOzRChQpe+ZylkaPfteZBAfJpFO3046XS
	 QQdKhBI4ut1s9g4z0uMFKkiwiT+opCqQu6D4I2UKuhxWR4HaD6eMgzKsreZ92n/aqXyHP
	 q1+/K/j3xl5FCFUSOJ9wKl51bVT7w+p96wVKOa6UNk/jMnjQjn9hXZsMPyUpmWxsXs81s
	 Clhkyo6IVWTGh9YkhJtgW3iQEXG2I2m8I0Xjat6hfpUgeP/dwYfC1hW1sLHg+vaQv/HwM
	 dgL/aLz6gJyEq5mIC1O9KiMsolnNCLFPzfKHv89wdySduyFPmExNM97yfpc0PiE/vmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0A121F000C6;
	Sat, 21 Nov 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795257498;
	bh=OG0c6l+y/8sOpyl1NqaqhQcf9W4FSCA1cHzu90CtLcs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dpyHBnf7GVP/4dU7w/wMGIWaaD3YUoLa3+I62ISoBZjWvDW9JZKLEi+Eqzn42tmZZ
	 i7BZzwQ4hnUIOfBj0AFYycfj1uV9IwYrp+VOpRokoNh0FElvo/dYt4wegxJi5imsYr
	 VFdkiKYzPb0VQCJ/CU2bl8GkkbPrd6qYEGwIVCfUHgGpQq4n0WHwh4LDVS0fPrVaXp
	 ZKJPqzL1b53LEqI67RgMEMO4JcQL02MV/JNZhJTnOWXqdxMZd28UHVOyFlVbXkPr48
	 Pwdyk6T2tD0xlXKvoiVMlRvNmDBhqvu43un7/oFkHtT3R8KaAUi1D6AAd/Uho+Lkw+
	 T+sWJUdUG4Q7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 301264BBE7;
	Sat, 21 Nov 2026 10:38:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 18:38:08 +0800
Subject: [PATCH 2/2] clk: sophgo: sg2042-clkgen: Keep gates of reserved
 devices enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-b4-sg2042-efi-rtc-v1-2-19898b8ad497@iscas.ac.cn>
References: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
In-Reply-To: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, sophgo@lists.linux.dev, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795257496; l=2910;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=FkwMGNzzFP9SAcLoWWEAD8DpNa60dTDRuCtVoBpvCok=;
 b=q3erWT1fwlHrNACKyfuHpCkIL80XgAGDT0V7qQ9mS+QUbZiQmrTwvliwagyujW22SWx/sZF6H
 bwT8bv9x9O2AhcQ4V7L6UQij2B8Mnqdpeu0VWzecd1SoDkGktQ2wX4c
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

On Milk-V Pioneer, firmware can own I2C0 to back the EFI RTC, with the
node marked status = "reserved". I2C0 shares GATE_CLK_APB_I2C with the
I2C controllers Linux uses. When those runtime-suspend, the gate is
switched off under the firmware and GetTime() returns EFI_NOT_READY.

Walk the reserved children of /soc and match their clock references,
as done in commit 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all
clocks assigned to non-Linux system"). Unlike that driver, use
CLK_IS_CRITICAL rather than CLK_IGNORE_UNUSED: the gate is shared with
devices Linux drives, and their runtime PM would still turn it off.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 6abc2c973c49..414904965edf 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -11,6 +11,8 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
 #include <linux/platform_device.h>
 #include <asm/div64.h>
 
@@ -840,6 +842,35 @@ static int sg2042_clk_register_divs(struct device *dev,
 	return ret;
 }
 
+static bool sg2042_clk_is_reserved(struct device_node *clkgen, unsigned int id)
+{
+	struct device_node *soc __free(device_node) = of_find_node_by_path("/soc");
+	struct device_node *node;
+
+	for_each_reserved_child_of_node(soc, node) {
+		unsigned int i, count = of_clk_get_parent_count(node);
+
+		for (i = 0; i < count; i++) {
+			struct of_phandle_args clkspec;
+			bool match;
+
+			if (of_parse_phandle_with_args(node, "clocks", "#clock-cells",
+						       i, &clkspec))
+				continue;
+
+			match = clkspec.np == clkgen && clkspec.args_count == 1 &&
+				clkspec.args[0] == id;
+			of_node_put(clkspec.np);
+			if (match) {
+				of_node_put(node);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
 static int sg2042_clk_register_gates(struct device *dev,
 				     struct sg2042_clk_data *clk_data,
 				     const struct sg2042_gate_clock gate_clks[],
@@ -850,7 +881,12 @@ static int sg2042_clk_register_gates(struct device *dev,
 	int i, ret = 0;
 
 	for (i = 0; i < num_gate_clks; i++) {
+		unsigned long flags;
+
 		gate = &gate_clks[i];
+		flags = gate->hw.init->flags;
+		if (sg2042_clk_is_reserved(dev->of_node, gate->id))
+			flags |= CLK_IS_CRITICAL;
 		hw = __devm_clk_hw_register_gate
 			(dev,
 			 NULL,
@@ -858,7 +894,7 @@ static int sg2042_clk_register_gates(struct device *dev,
 			 NULL,
 			 gate->hw.init->parent_hws[0],
 			 NULL,
-			 gate->hw.init->flags,
+			 flags,
 			 clk_data->iobase + gate->offset_enable,
 			 gate->bit_idx,
 			 0,

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
