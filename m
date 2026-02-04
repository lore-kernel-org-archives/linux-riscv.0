Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5F8E83EED
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNKMnLFP2XwtYJUlHW74XS3Rp1v6BtfeKk4kSrgvZ84=; b=zZOjmiBqzBu5ck
	UKojYkepKEjZL3rr1LlWVZYqh1V6ncicwly/WLg2oGuy6HRrL2h0skZ7w7NlC0JCj9/f6lTMEWzeX
	07Aco+qgv7KkE5XCg6s9Rg3oidKUi644Zvf6Z3othDMeFOvS24HBi91MhwLeWPSS8S1FdTxGTRFVi
	TDqtwLUcQyja7jQVkyG1bnvDlJLzzd6kVZeeBxrpI/DhNZcpBkIOW7SksTviB7a34Gx9gihwT708d
	IpteumpnzK1RpkeJRtM8j+KI2fqdXQhIJVDi8D/2XZzG0ysxkIOsHIjd/6/e77jGTLNtcH2UugIwC
	AI8UkDaBwXmQbIYtXmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYGU-000000086eW-49Qj;
	Wed, 04 Feb 2026 08:29:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYGR-000000086dU-0vCb
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 08:29:33 +0000
Received: from duge-virtual-machine (unknown [223.160.207.2])
	by APP-01 (Coremail) with SMTP id qwCowADnjWlcA4NpYqgfBw--.6098S2;
	Wed, 04 Feb 2026 16:29:18 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc,
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Subject: [PATCH 0/3] Add SDHCI support for Canaan K230 SoC
Date: Wed,  4 Feb 2026 16:29:05 +0800
Message-ID: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnjWlcA4NpYqgfBw--.6098S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWrGw4DXr17GF1UZFykAFb_yoWDtrcEkw
	1xCa40ya48AFWDCayS9ws3try3Ca15Xrn5Wa4qqr1UGry5Zrn5XF40yas8Xr18CF4SqFZ3
	trW5XrW8Ww43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [223.160.207.2]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_002931_623441_316AECF4 
X-CRM114-Status: UNSURE (   5.85  )
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

This series is based on the k230 usbphy series[1].

This patch series adds SDHCI support for the Canaan K230 SoC,
which uses Synopsys DWCMSHC SDHCI controllers, include MMC0 and MMC1.
The MMC0 supports eMMC, while MMC1 supports SDIO. Detailed information
can be found in the vendor's manual[2].

Link: https://lore.kernel.org/all/20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
Link: https://www.kendryte.com/k230/zh/dev/00_hardware/K230_%E7%A1%AC%E4%BB%B6%E8%AE%BE%E8%AE%A1%E6%8C%87%E5%8D%97.html#mmc [2]

Jiayu Du (3):
  dt-bindings: mmc: Add sdhci support for Canaan k230
  mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC controller support
  riscv: dts: canaan: Add mmc nodes for K230

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  22 ++
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  17 ++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi |   7 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |  26 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 247 ++++++++++++++++++
 5 files changed, 319 insertions(+)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
