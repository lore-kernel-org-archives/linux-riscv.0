Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F195DF55130
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yka6DEsSzJUti2WB23icTN63DDgfssp12a+8xlSFnrc=; b=Mk3m6q2oi9sAof
	s5S3clpVg5YUsDTicVmyi17p0TGH+/BvVB/AIGYvk5k33wT/QG4l64cRFiWdtbMTtgzFMTG6ND87m
	0fjLVE/Ki++o88Y1VmdAhRINPo0P0ag+TJGfYfLlmfRA1V3Q3F5eBvqznUPkfOUUYXnwt4+sZJfEL
	CGDVGHzegMx8g3tH5YiP3MgLGa7BRPaT1r4UitoVxamI3HKb5676UzbrPfHanMGuddY9qJubEwXwZ
	H7ywQLYYojf4dCN8a2GGU7PfArbKgHA+eQuAyAWRLPmCgboLXHtiQkN26TKuW7trdBHxBF62ujae1
	8ivgs6pqD7ZE48br9Ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6X1-00000005ieI-2v38;
	Sun, 08 Mar 2026 05:18:23 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6Wy-00000005icn-2TBa
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 05:18:21 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fT7hR4T1Pz9tcd;
	Sun,  8 Mar 2026 06:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772947095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0TE+7A2kmuKkKWE6ucMW8ur0y2V3+9v8BXKbbsXZtiI=;
	b=Eke5byglpJoybzZexXW6CuxnwDdIUQsu04QfrjTdBdR3rhrFiUFolpgqtczTojHb9TPEbF
	nep9f1EvQrVA/AMxj4y1vvcA4Q3iPQyJtxPUzeH/+UxbquTi8ASQ+GnZW3ByRMkmlwiFEK
	zPCZY6Um1R/M7AUsU8hs+swJMQ4OHMYF1OluOYFwobTcMbeoYBLItPPpVTq7hv2Mu5hXp1
	K69svMqxl8ZRgUi4hHGzNjsFFLZFG/hS1gXJZWI6HTHkdGI44yYhF0a6+UXD2iAsMQs/rL
	CkDM91Zv/xftzUCL1O/0QGqCzI0h2K80OBEME8cEcoMN41pSwTTV4DIPigx1IA==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772947093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0TE+7A2kmuKkKWE6ucMW8ur0y2V3+9v8BXKbbsXZtiI=;
	b=kZQKc6PilSaJml360PU2s6sIsSjaLz0jsecj3ld0mS2Beovyj9UYs4u1wgZIpAfLIcixwm
	825LZMLnGXtc26Nk0M1BBJp10NHUjkt640Oz3U3erm+W+JSw6Az8pCg7bfdm2+5TRHFa/a
	oWm8NuE9YxfZtz17aY0N9nckKlo4TolOCszzTa82sS26ZmMthx75g1+agOmhm48EgxsmQY
	Pa5o8FzlcgPjQe9RKbdvekF3ts1+R9p2NGr/swbIrP6c22RqEVUyfdwWkei3ypwDa+iNmZ
	yWKQc8znOFVZibuHRk9fmXkDiGEiBYCgbVJvKO0q520vLKunirjz2uvTu8mFMw==
Subject: [PATCH 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Date: Sun, 08 Mar 2026 13:17:38 +0800
Message-Id: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHMGrWkC/22Oy27CMBREfyXyuhf5kWs7UVXxHxULP67BgpDUT
 ikS4t/rhm2XM9KcOQ9WqWSqbOwerNAt1zxfWxBvHQsndz0S5Ngyk1xqrriBenJx/oFISwWFVjp
 jnTOoWVsshVK+b7TPwysX+vpu0PVVssWt4dSQ7QF7H/tkJA+EXGNE6wdrI9kkjZLc+L5HI+mPO
 1GtblMZu/fNRHINdXGBprzCIuDWAweb9IBxUFYI2pdcQ11d2YV5+vgfojjCWUC4nKFpw02AAOe
 Dsxg1Sa33k8sXP993czluCO8qQeO107FDoXsaEJu6ShG5bUM3oEKhpEpohI7JNyF2eD5/Aax2d
 T9nAQAA
X-Change-ID: 20260307-shadow-deps-3582a78aa756
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yixun Lan <dlan@gentoo.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947080; l=2292;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=jkMSpeyiXMumeCgs7R3LeudHrmmiyPYo7I0sKbUDMdo=;
 b=RQaAAJGU1ge1++GAza+Fbqk1kkbMrqJ90icGN/P4rTL6Er2uFx4fFtXtrMOZPllFaCmmZIfXI
 iR3tl0U5obuBFUNHQuURrbCZiQ+FHhNl+zgsq96/sQVDPnvMlAm/Tgm
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: xaggukirckx879mdesfjst8tnpxrc4ao
X-MBO-RS-ID: a621523f8cf1d5fdc33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_211820_773980_1F8AE252 
X-CRM114-Status: UNSURE (   7.82  )
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

This series enables dynamic voltage and frequency scaling (DVFS) for
the SpacemiT K1 SoC using the generic cpufreq-dt driver.

Tested on OrangePi-RV2, the execution time scales as expected
across different CPU frequencies:

~ # echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

~ # echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m 1.07s
user    0m 1.07s
sys     0m 0.00s

~ # echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m 1.40s
user    0m 1.40s
sys     0m 0.00s

~ # echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m 1.72s
user    0m 1.72s
sys     0m 0.00s

~ # echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m 2.10s
user    0m 2.10s
sys     0m 0.00s

~ # echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m 2.80s
user    0m 2.80s
sys     0m 0.00s

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
Shuwei Wu (2):
      cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
      riscv: dts: spacemit: Add cpu scaling for K1 SoC

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 34 +++++++++-
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 86 +++++++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c            |  1 +
 3 files changed, 120 insertions(+), 1 deletion(-)
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
