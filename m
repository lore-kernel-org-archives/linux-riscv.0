Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AD1C44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGgblNEOGZlwfdDBgS5cbbU+6Tb/iRfdA3BJtph8jFs=; b=L9SS7C2Waquf1B
	nG/a8CgsGM9Nd67IXOaQunOS1z1ax6btMfDeQ8AqI1jQlrpK7cAub4d95951uAlTwed7MhxyLloIW
	jUH/9wVH6dj5CeyVnhCoQu+VISMoBWlPHFrwRaQSFp/EuTRFGVzUHeVJsOXjMS3mexpmQG2IuglGN
	SYRorjXGNSj9tn7VpgvP4rjEaCNA1bhT04zPQGd73XzF8FU2woyT75naL24Dl84HfMwYIqo3vfaP0
	hmFK6vsAcUCvVgJLRh2or2VsPzA1EtQ4/Hpx6Dir56slGeINc+qL5irbRHvbx82C5Yj2ZvYTwRS9T
	7gzzx6+deNYPJ7SG8yhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyN-00000001RRu-2TjG;
	Fri, 17 Jul 2026 07:27:03 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyG-00000001RDV-0l04
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 07:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273182;
	bh=jEptvT1X09De8R5/A6uLESasfKVE1BpRXqYYNEEYFJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=aFGslG8v03MRxdtofzmH+ks5RHh4NDpKLX+9oFJklUC7bi+XgfxRQU7mjpMoFPYsP
	 qE/2Ka/C+OAetdtyuJ2Bged2Tp/zPqMDgRO6YPMmu+2gFkPcFixpYxoArTExckPQmk
	 Axjk3VQNW9ySDyesifkKN7CWV+nNITYEM9NqWgrI=
X-QQ-mid: esmtpsz11t1784273172t86be77f2
X-QQ-Originating-IP: Bw9tCNH376+ZtWl5C6e6i58YBeeAjXoMSEuf/COzNQY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7455975292204269396
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and divider
 rates
Date: Fri, 17 Jul 2026 00:26:00 -0700
Message-Id: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqDUAwAryJZG9D4K15FutBn1FSx5aWKIN7dq
 MthmNlB2QsrlMEOnldR+c4GcRiAG+q5Z5TWGCiiPMrjDMcE3TRiJxsKKWZMxatOCzIJFv08m7q
 H1fthXZoPu/91geM4ASF9h2ByAAAA
X-Change-ID: 20260615-k3-clk-fix-i2s-5e278a472061
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=FUEnUCyCQt8oabfZeZlckH5YssHKTRkpCvLvgorY36Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmRN3m5TV4lvbAMKDFa7Tl9styp+r7sLs+wbon1Rn/ZH
 07d58rbUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMJFDpYwMm/UFp/5NnNVamblJ
 cvHN4rtZvJOZHl45xf1JYGbenyv6igz/02bw7zI1DfzXKv1C/tS1P7KFb5++nWrYdP/RDOnM25F
 n2AA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzOHSugmTg7XFhOqTQmyscbdQ5wyP0fH3xplLwdQ2sm1dexmGbPII3oP
	JeZKinuWiHB20hLoCnUOvtEuhZnUFoG/p+uDVUJQ5JUBYvwqsVINYgplSx+45ctAVOQguHI
	eWYKCKnlNl0hKggvq/b6venkNHNPC98OEiLM3ebEhDC9qx1eMRd6edNjgsjwq7X6SLhPWJG
	4PyLgAwcvPGmNJkepCFhl7+Bawm5uKVcCLW0uckHpD2lDuywUHJXQkf+pw5du+e3ZjMm5wx
	KeAJhFhWg6m75xL6ny4ufX9hHWbCkkd/PrVEchibONmRgwaChmp45VhI0p4sNcC+FTqqUig
	yHLVpg2DKB9eI36nkP2fpJNXJfHnJwF9lGX7uewXkxh6zZKgyneAqxKXS6dNGFl4p8W+4sd
	ll96tbiq/Fjz9aZXVX77EJfayVpdmy26ocPIgD3fjyRzbIgKoYCYyCam0ejLwJ4myScmB0a
	Av6Ie3HVs3aCDFKFN8IHGz+dR9EAC1GwEfhztCXkI5DTQuu9kOQK/Tb6C6mHGgrejTWMRXk
	L/kO7PuB0SaA1rYfWtGdZd5Mrfa9Q9/zKqWPvLeoAWw99ZaOhL2mwEbiO6bURXzXpsedgqY
	p9QVAqCGLiiJEbty9FgiTwDk7yk+ejohNb8r4sHDW0we1Hj/S7Vtlb/K1IcRLxg0EnZdqtm
	YehUZRHWXbW29GOVdheyFMkdLkrg2PSN3zWmqW1tScwGAtp9ZRAIZ25ubJh7BgTl10svn67
	tRVDKt8PJEoSSOs++PCLcqRD9PAMqLoGzbDpo8ELJwxdXn0rL0LtJJO6nGNe/bWnh4NGNes
	oo8nTHVGLVxN8hQFTTjvg7c879rygX4b7VtGALtCByHYFwbNuNeSdUCpuhy+0vdIO+0QD3C
	4OU66YiCgjXG2UEAw78C39rK6iCQ4N00ZhShAygm4IIrfhYG0oHVoIvbQymenhHSzKEu6qE
	SbRdmag6QyEwFh+b+c7MmblZL3BJIRKXbSBQa4GtS+qsJpAr7ziRHUgD5wYxSNjAdTtgO+I
	NXVF9AVtMmrKMEsEbh4k8bzyV2/eignEUXGCy74CLffC4Bysy2hS+owdYNJGxUqHxEfrk0C
	w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002657_098772_B659B4CB 
X-CRM114-Status: UNSURE (   9.31  )
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

The K3 i2s clock tree was modelled on the K1 layout but does not match
the actual K3 hardware topology, leading to incorrect clock rates being
reported and programmed.

Three fixes are provided in dependency order:

First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
added. This prepares the header for the clock topology corrections that
follow.

Second, the clock topology is reworked to reflect the real hardware:
the common i2s_sysclk DDN at MPMU_ISCCR1 is renamed from "i2s1_sysclk",
an implicit 1/2 factor (i2s_bclk_factor) is introduced before i2s_bclk,
and the dedicated i2s1 clock path (i2s1_sysclk_src MUX + i2s1_sysclk
DDN backed by MPMU_ISCCR0) is added. CLK_MPMU_I2S1_SYSCLK keeps its
existing ID but now refers to the real per-instance i2s1 clock; no
in-tree user references this ID so the semantic change is contained.

Third, the per-instance i2s sysclk DDNs (i2s{0,2,3,4,5}_sysclk_div)
are corrected to account for the hardware-internal 1/2 factor by setting
pre_div to 2 instead of 1, so clk_get_rate() and clk_set_rate() report
and program the real hardware rate.

---
Troy Mitchell (3):
      dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      clk: spacemit: k3: fix i2s clock topology
      clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

 drivers/clk/spacemit/ccu-k3.c                  | 31 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  3 +++
 include/soc/spacemit/k3-syscon.h               |  3 ++-
 3 files changed, 26 insertions(+), 11 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-k3-clk-fix-i2s-5e278a472061

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
