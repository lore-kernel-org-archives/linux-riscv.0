Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C913C44507
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBY3iqN3nQpfaaNyU+e47s0B94yQuEMukX0nLpyrxOo=; b=4NS+jn94XmdB+J
	gnXdXwll7ePWHV4NhFs16aAK5uyvJjZ3pnk7/PXdGAAW9bfzphdVHM6J6B+arJj5FJaIT4s/HMNxm
	3hl9Thp6PskYrslKr8JhrFsHC9GWBUjszyDegsKFMkfYVIEsDxQKWSyWqXnW06u93zi31ATjE2boi
	3s5s/uZrTBy5ZiOrvwGGHvZTHlJvYgZe5Msh4I0J/BYgFv/9/C6ncGaHEh4OxoxdsnLnbeqiMll8G
	SgskrEPwknHoPPsV8lzYLoHsyFUr7WPrfwKRHZWdzStKxUPQ4TZ5VGjb+l8JmWSyKTMM2N7QEjvVz
	0QQnLC7W37aisfm26inA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpn-0000000BDfK-0XVn;
	Tue, 14 Jul 2026 07:45:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpi-0000000BDdH-26I8
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 07:45:40 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S3;
	Tue, 14 Jul 2026 15:45:30 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MoeLeak <i@leak.moe>
Subject: [PATCH v2 1/5] riscv: dts: thead: th1520: remove pclk for I2C1
Date: Tue, 14 Jul 2026 15:45:11 +0800
Message-ID: <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXq84X6VVqEs8pGA--.61698S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3try5XFWUXF4rJryUGFg_yoW8Wryxpw
	43Cr48AFn5WF1F9w13tw10gF4kA3Z5JF4kWr17WFyUZws8W3yjqFZ7KrWfXFWrt34xZw12
	kr1Dtw1fCr1YvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUfKs8UUUUU=
X-Originating-IP: [112.94.101.100]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_004538_900709_E379BE0E 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The I2C1 node added previously to the th1520.dtsi file has two clocks
set -- one "ref" clock (CLK_I2C1) and one "pclk" (CLK_PERI_APB_PCLK).

However, the CLK_I2C1 clock is just a clock gate with the
CLK_PERI_APB_PCLK clock as its input. In addition, when it's gated,
reading registers from the I2C controller returns fixed value (the last
read value) for all registers. These facts indicate that the CLK_I2C1
clock is the true APB clock fed into the I2C controller instead of a
dedicated reference clock.

Leave only the CLK_I2C1 clock as the `clocks` property of the I2C1
device node and remove `clock-names` property, which represents the I2C
controller only takes a single clock both as the APB clock and the
reference clock.

Fixes: 2f60e3516330 ("riscv: dts: thead: Add TH1520 I2C1 controller")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 94932c51b7e39..db23624696b73 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -415,8 +415,7 @@ i2c1: i2c@ffe7f24000 {
 			compatible = "thead,th1520-i2c", "snps,designware-i2c";
 			reg = <0xff 0xe7f24000 0x0 0x4000>;
 			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
-			clock-names = "ref", "pclk";
+			clocks = <&clk CLK_I2C1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
