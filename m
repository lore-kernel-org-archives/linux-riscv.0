Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FBECA0EE8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63Uk5afi3ONPE7wp4Qt+n9OmzHHe3y1P/on7E7+zToM=; b=A05tgvqBuclI0i
	lznHieFI15J0ZnbhYKUm3zunXavcyEs3OVMeZkuEdWxMwxpdfAAvUbmysNcEU/jnT9c32sqSpE2yo
	bj2eF/KwUfa2RznGlXsMuwwb3Ah9BYlDAhonnS5HaEUOW07ai6b01+VIW8GEz9gP7NUER3C45jcDU
	QokqEUixa/P288xQHnfyStXqnANZVqkwWlN/GvF6oLEI4/zZiMDK7BVxUKOEITk8oxS0jYTFTr0Y3
	lZmeKXzyH3EmW/PBzgStGuRmhMRdtgEltYxOzG3xiYXwtfwr9MbwjrF7LRMVJByJexARutYx31SsQ
	Nm7gtXeUbP1xXH7C4J0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu0i-00000002VTK-2bHH;
	Fri, 15 Aug 2025 12:58:20 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.142.27])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqr7-000000024t1-0GHz
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 09:36:15 +0000
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgAHHxB1_55ouQy_AA--.59061S2;
	Fri, 15 Aug 2025 17:35:51 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v4 0/3] Add driver support for ESWIN eic700 SoC clock controller
Date: Fri, 15 Aug 2025 17:35:39 +0800
Message-Id: <20250815093539.975-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgAHHxB1_55ouQy_AA--.59061S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF15GF15Cw1UGrW3Kr4kJFb_yoW5KF45pF
	4kCr98Cr1qgryxXan7ta4IgFyrZanxXFWjkryxXw15Z3429a4vyF4ftFy5AF97Ar1fAw1D
	tr1aga10kF4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRuHqcUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_023613_277237_14AFE5D5 
X-CRM114-Status: GOOD (  15.23  )
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

From: Xuyang Dong <dongxuyang@eswincomputing.com>

This series depends on the vendor prefix patch [1] and config option patch [2].

[1] https://lore.kernel.org/all/20250616112316.3833343-4-pinkesh.vaghela@einfochips.com/
[2] https://lore.kernel.org/all/20250616112316.3833343-3-pinkesh.vaghela@einfochips.com/

Updates:

  Changes in v4:
  - Updated YAML file
    - Changed name from cpu-default-frequency to cpu-default-freq-hz.
    - Dropped $ref of cpu-default-frequency.
    - Added cpu-default-frequency for required.
    - Removed cpu-default-frequency in updated file, because there was no
      need to add cpu-default-frequency.
    - Moved DIVIDER to DIV.
    - Arranged the IDs in order.
    - Dropped EIC7700_NR_CLKS.
    - Removed dt-bindings eswin,eic7700-clock.h. Because IDs was not used,
      and used clock device nodes.
    - According to the updated driver codes, the YAML has been updated.
  - Updated driver file
    - Remove undocumented parameters "cpu_no_boost_1_6ghz" and
      "cpu-default-frequency".
    - Modified the comment and used the correct Linux coding style.
    - Removed codes of voltage, because it was not the clock driver.
    - Updated the formula of clock frequency calculation. Removed the logic
      that only used register selection.
    - Used CLK_OF_DECLARE() to register clocks. Registered pll-clock,
      mux-clock, divider-clock, and gate-clock in clk-eic7700.c.
      The specific implementation of clock registration was in clk.c.
    - Added eic7700-clocks.dtsi.
    - Moved device information to DTS. Put all clocks' node in the
      eic7700-clocks.dtsi.

  - Link to v3: https://lore.kernel.org/all/20250624103212.287-1-dongxuyang@eswincomputing.com/

  Changes in v3:
  - Update example, drop child node and add '#clock-cells' to the parent
    node.
  - Change parent node from sys-crg to clock-controller for this yaml.
  - Drop "syscon", "simple-mfd" to clear warnings/errors by using "make
    dt_binding_check". And these are not necessary.
  - Add "cpu-default-frequency" definition in yaml for "undocumented ABI".
  - Drop Reviewed-by, this is misunderstanding. We have not received such
    an email.
  - Link to v2: https://lore.kernel.org/all/20250523090747.1830-1-dongxuyang@eswincomputing.com/

  Changes in v2:
  - Update example, drop child node.
  - Clear warnings/errors for using "make dt_binding_check".
  - Change to the correct format.
  - Drop some non-stanard code.
  - Use dev_err_probe() in probe functions.
  - Link to v1: https://lore.kernel.org/all/20250514002233.187-1-dongxuyang@eswincomputing.com/

Xuyang Dong (3):
  clock: eswin: Documentation for eic7700 SoC
  clock: eswin: Add eic7700 clock driver
  riscv: dts: eswin: Add clock driver support

 .../bindings/clock/eswin,eic7700-clock.yaml   |  381 +++
 arch/riscv/boot/dts/eswin/eic7700-clocks.dtsi | 2283 +++++++++++++++++
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/eswin/Kconfig                     |   10 +
 drivers/clk/eswin/Makefile                    |    8 +
 drivers/clk/eswin/clk-eic7700.c               |   44 +
 drivers/clk/eswin/clk.c                       |  734 ++++++
 drivers/clk/eswin/clk.h                       |   69 +
 9 files changed, 3531 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-clocks.dtsi
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/clk.h

--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
