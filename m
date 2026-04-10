Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE97CE99052
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c97eLe6Dgr5g0rnEI2HyAaTdtuOtmzv2paf6tjMizFo=; b=zdT9IlavDF54K9
	m0RXTAk1d7GBvUcui4sz+rjBMVp3AabAntah/fmeXvifGXn5f0RADo1beSWgQzRAF5bfpUvQAecKD
	/2XIxcohRpIPhQ2PvvxgfcBii9jS3cKARJtoFt00gkdUsppwQS4sLjc09DnhT3tYgc5AkHTjuVaMI
	jMhdT1Aa8CJXfdioxLAAVlNYsUX9k2D2Sv8N7RJMVx5KXoaKR+0LSFF3bBVOt/RBhLpQXIvjDegvz
	FBi84DyW/GvTQFa28NNJ5jU38OMYgSGy9Vzg+d6XeN6YFzgQgdUd60htdopuBkZmzKMiSHhtMUe5u
	gZXb2VmSMNEZGftnPNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6m9-0000000Bo2j-1Gy7;
	Fri, 10 Apr 2026 07:59:37 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6m6-0000000Bo1w-2KlN
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 07:59:36 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fsTjH6R8Hz9tVg;
	Fri, 10 Apr 2026 09:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775807972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pdMupNV8SQH25nPQgo6yosbWJa8EJVott5NjvgAdmzo=;
	b=u488TrHCmC2oDwyTMhsyVBFs8gADJoiSDdU2t574byHJQc9Vr2hOSfxDyaBhboCzdM2O5k
	Hqx4NVEuGXK7P9fQQy4nGrtKZmfaQQmknlNQ0pDTCqKAJHHFuDJrNST7uQTcp40zwRXTyC
	ICZokpnMagDR29zDKkamlzJomrJY5ne27hcWEfdDqqCHshV263x6HuOnxDmb79UkPJruh/
	KqCPVOSMd0oQL5Xn/ONTQc3EfpOnEcqUsDpJkvS5OIICT9CJNdFesajsLNd1qo3s10njCV
	92a3/5VsIazTfjQcQjWcSfKp1G/8LJ079OUrCMGd/5akTa1Nl7dOPGLJuQLmnA==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775807969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pdMupNV8SQH25nPQgo6yosbWJa8EJVott5NjvgAdmzo=;
	b=biA2xEQmEhQXECUxzgwRWNqDC/XpwfA46WJ4ZigDrPZ9Jg1YdErE6TohQKLcjL35ACqqcS
	V73yTbyBhpJqFmolGnyL5fBjBFbXI3cFceP9qXgwCrv2xc9JggMVl7xrHMY+oExkVEIdtX
	vTooqolPRjjmtxWA6fxQ16WKzXO1fYwTU36InJYNpBibKwO23/D5I6raoK1M2Tk7D5j2GF
	IVTK0q8tuqAHWlKsFpuoVkwlP8XeQsuuvDbOxjFozKD+DoxihimjOKgH6QZP9hbv2jlXP2
	WB+n030Fzx6dOnrPgqY/k0/5rkX2YjY86vgMU0HyuiuLJe+mL5iKdKEHEhNs4w==
Subject: [PATCH v2 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Date: Fri, 10 Apr 2026 15:58:21 +0800
Message-Id: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ2t2GkC/22Qy2rDMBBFf8Vo3Ql6eCTZlJL/KFnoMY5F49i1X
 Dcl5N+rOF200OUVzNHhXFmmOVFmbXVlM60pp/FchnyqWOjd+UiQYtlMcqm54gZy7+L4CZGmDAq
 tdMY6Z1CzcjHN1KXLRns9PPZM7x8Fujwe2eSW0BdkWwmsfaw7I3kg5BojWt9YG8l20ijJja9rN
 JLu3IFydptKWz1vJpJryJMLNKQFJgFrDRxspxuMjbJC0H5OOeTFzbswDi//QxRHeBMQTm9QtGE
 VIMD54CxGTVLr/eDSyY+X3TgfN4R3maDwyqdthULX1CAWddVF5LYcugYVCiVVh0bo2PkixO4l+
 pSXcf7aMq9iS/GjYP8ULQ4cShGPwQRuyP92YIfb7fYN/KHkcrIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775807959; l=2567;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=FeITDC/Wu3yb3H+8bxUK/EofL6or0jSpsm7kf+klLiw=;
 b=IkShTdJXqbof0FcLu6L47SjTOGt8Zw2qonrPSlXJWOd+dzJWOF0NpmeDdsG2nWglcOhBz51/D
 ITsJQIALMUkAs9IyoPhLm66F+Qkg5zR5VdlPUHT+R/co7dYr1E/ZRml
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: 1ff74546b71c080cfd6
X-MBO-RS-META: 1d3df5xeshc6anpdtytt7tkp3r3eh4z9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_005934_746356_C6A4DFD4 
X-CRM114-Status: UNSURE (   7.60  )
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

Tested on Banana Pi BPI-F3, the execution time scales as expected
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
 drivers/cpufreq/cpufreq-dt-platdev.c            |   1 +
 4 files changed, 148 insertions(+), 1 deletion(-)
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
