Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC450CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGfKmOL5/FwFvO7Bws+qgANIeeh71cNXysCMxRREuW0=; b=l9i3ZvPlwy/S+6
	xaoJKTqmiZ53RwBO9kLgcq/UIj5IYp7f9sKZUx2tipfqrKeXkX8bfWR0Ss2uK92tbNwDQ8GUMcLir
	JTMDbwaUK/ZS+X7047NESmjAZ7i/E5hw2TRVSoA4dd7Wtxj6yGXcg6XmVDPEuoVH/vZEc0AiTzh3H
	DLflotqG/t80V6Fno5p3SwkZT2LKGqPaldHDw82KlDDLqKbFZGTZ1vnb2skC996tCmD8kt0BLVkz2
	7XI7pHL7jMT3FkQ9R7zfgWa7Yoe7CJuxcbvaoEhXJA0fjzph9Egnw6qYye7QAvhdnhD1m04QLVcrG
	BZJMNZSPcXBuo7JiKkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1fh-0000000AlmH-41iQ;
	Fri, 26 Jun 2026 08:12:21 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1fe-0000000Aljy-2k2C
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:12:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gmpLL6WH5z9vM2;
	Fri, 26 Jun 2026 10:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782461530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rGnXw71gOf/NHgaS6fndCKJ/qJ+w/itmp6SAHYCMOOk=;
	b=R517p//SmtenqfjN1zHhbcvciggca4pFsRHEYQBWlaRNdm7EplIL0Ro1rcGLMmptYiZ5xn
	HPDc2RoQz8wuUfKjRVeDvqLAaLcmvwy7FYjbYxRdGGNfbPbBDHG3gLSNzmHs+CeLjYbfxi
	5z+cE9mkl0UP2prLTn+PHjGi1hdh+YAdg4C9t6eFckj3bkEeenqF7gTQNCPTNS6wPvb1hT
	+jO5i4FVdd6B9C9eDumTBj3JTeQnoyn0mWnsNCX8iNEE2n4FdziGfgXwd0Jc/Uo8hrQU/O
	Ua7xOxYuwUc4m3MEZ299Ln2hgPNsJa5W8AXJlo/k9ry9j9XVTvgW2BbvkPfuqA==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782461528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rGnXw71gOf/NHgaS6fndCKJ/qJ+w/itmp6SAHYCMOOk=;
	b=oDuIRq1K8btmISlDln+QSv3IrjaHxuJxm6HDLGaWD350z0fFNWyx9tKdi8D3BfRKlXlnzQ
	bVa5o6lbWtAK3AsuE19vEpw7XvRND6Vqy4n3sHQihkyCfZt20GCaLfFZrWClpWECGbpfkv
	jEWFVU8Y6HNlO+MNUwwCrK1ALcBzCr8xXqx0GMQd6FvdLXP4Ul7qZw9LG+cHg/qpvydz+2
	g8nPnLnGIukA5AAhBVECBllOiF/6puJF6LLeE8GoAjyG3L831fWRNbHaV/FyN8T/UA23B8
	UabWwXDv3+iyWNu5KnwcftgOxJT3mzUE/R9PIgp+iPKrXqdsiEDbYIBEAwDkeA==
Subject: [PATCH v4 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Date: Fri, 26 Jun 2026 16:10:22 +0800
Message-Id: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO4zPmoC/22Q2U7DMBBFfyXKM4O8je1ECPU/EA9exq3VJSEOA
 YT675gUqVTwOJbO8dH9bAtNmUrbN5/tREsueTjVQ901bdi505Ygx3q3ggnNJDNQdi4ObxBpLCD
 RCmescwZ1W4lxopTfV9vT8+We6OW1SufLYzu6Oeyqsm84Kh9VMoIFQqYxovWdtZFsEkYKZrxSa
 AR9e49UiltT+uZhLRFMQxldoGOeYeSwKGBgk+4wdtJyTpspl1BmN92H4fj4v0QyhD2HcNhDzYa
 FAwfng7MYNQmtN0eXD354vx+m7arwrhBUX/20b5BrRR1iTZcpIrMVdB1K5FLIhIbrmHwNar+X2
 OUyD9PHOvPC1yl+EuzNorWBQV3EYzCBGfK/G1bTIq604uyWFpVWxLW3gSXN6C8tr7Tm4paWlRZ
 Jemet5jylW/p8Pn8BD81wVy4CAAA=
X-Change-ID: 20260307-shadow-deps-3582a78aa756
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782461515; l=4573;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=dlA1MiAGzdoA9HwFhEa5DIIWYNj8BhxawgGxQzmpXz8=;
 b=dWTgFqi7U2eQZs2u7TXeO4qbCDgE9l0+DUtN+zfSnyZyWk6zUVrl2fx9x+EfjzolKWh2mufXW
 YsnC+L2ta/HCNAwwrDNXtcGmLvTo0xpCtRdRY2wZI5BHE/vIxxNY/N3
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: 8c5cd3c12b250b0ee23
X-MBO-RS-META: suke7fefyj4dz4nj3desdi5d7itrkxos
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_011218_884253_37D7E398 
X-CRM114-Status: GOOD (  10.07  )
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

This series enables CPU DVFS for the SpacemiT K1 SoC using the generic
cpufreq-dt driver.

K1 has two CPU clock clusters. The two clusters have separate CPU clocks,
so they are represented as two cpufreq policies: policy0 for CPUs 0-3 and
policy4 for CPUs 4-7.

The CPU voltage rail is shared between the clusters. To model this with two
policies, the OPP entries describe voltage ranges instead of a single fixed
voltage, so the shared regulator can keep the rail within a range acceptable
for the active OPP constraints.

Tested on Banana Pi BPI-F3:

~ # cat /sys/devices/system/cpu/online
0-7

~ # ls /sys/devices/system/cpu/cpufreq/
policy0  policy4

~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_driver
cpufreq-dt
~ # cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
0 1 2 3

~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_driver
cpufreq-dt
~ # cat /sys/devices/system/cpu/cpufreq/policy4/affected_cpus
4 5 6 7

Both policies expose the same OPP frequencies:

~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
614400 819000 1000000 1228800 1600000

~ # cat /sys/devices/system/cpu/cpufreq/policy4/scaling_available_frequencies
614400 819000 1000000 1228800 1600000

For each policy, scaling_setspeed was set to each supported OPP and the
workload was pinned to one CPU covered by that policy with taskset.
CPU0 was used for policy0, and CPU4 was used for policy4. The clock rates below
are from /sys/kernel/debug/clk/clk_summary.

policy0 / CPU0:
----------------------------------------------------------
Frequency    |  cpu_c0_core_clk  |  Real (s)  |  User (s)
(kHz)        |  (Hz)             |            |
-------------+-------------------+------------+-----------
1,600,000    |  1,600,000,000    |    1.81    |    1.80
1,228,800    |  1,228,800,000    |    2.37    |    2.37
1,000,000    |  1,000,000,000    |    2.89    |    2.89
  819,000    |    819,200,000    |    3.56    |    3.55
  614,400    |    614,400,000    |    4.71    |    4.71
----------------------------------------------------------

policy4 / CPU4:
----------------------------------------------------------
Frequency    |  cpu_c1_core_clk  |  Real (s)  |  User (s)
(kHz)        |  (Hz)             |            |
-------------+-------------------+------------+-----------
1,600,000    |  1,600,000,000    |    1.81    |    1.80
1,228,800    |  1,228,800,000    |    2.36    |    2.36
1,000,000    |  1,000,000,000    |    2.89    |    2.89
  819,000    |    819,200,000    |    3.55    |    3.55
  614,400    |    614,400,000    |    4.71    |    4.70
----------------------------------------------------------

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
Changes in v4:
- Represent K1 as two cpufreq-dt policies, one per CPU clock cluster
- Use OPP voltage ranges for the shared CPU supply
- Link to v3: https://lore.kernel.org/r/20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org

Changes in v3:
- Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
- Use one shared CPU OPP table and one cpufreq policy for all CPUs
- Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org

Changes in v2:
- Move OPP tables to dedicated k1-opp.dtsi
- Enable OPP only on BPI-F3 with cpu-supply present
- Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org

---
Shuwei Wu (2):
      cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
      riscv: dts: spacemit: Add cpu scaling for K1 SoC

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
 arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
 drivers/cpufreq/cpufreq-dt-platdev.c            |   2 +
 4 files changed, 149 insertions(+), 1 deletion(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260307-shadow-deps-3582a78aa756
prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e
prerequisite-message-id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
prerequisite-patch-id: 5da3e75b18291a5540d4f66d7a0600fb8975ef62
prerequisite-patch-id: bcf41917414ecef8cf743095d130f6004c32f6a5
prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
prerequisite-message-id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
prerequisite-patch-id: 7c7fb9f87dba019ece4c97c45750349a7cd28f3a

Best regards,
-- 
Shuwei Wu <shuwei.wu@mailbox.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
