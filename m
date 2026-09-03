Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258FBC624D6
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 03:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVShfwMlColqiuEHPQR9mlpHXeSmvZlCBWmakpU6wj8=; b=WLK0oNz5ms1FVM
	y0L+JZ1M/jWEtD6re4AI6n1Ry3vFVUdx1ic42f3VpQe0FX0n8tmIvE20i5iw5s3LM6J5tc2CcgYVE
	BrNnU6NzI34mBqmjN7md9zJ8n1VXCsUJZWYlCsE+8xHJ3rznO1erRDaxYAG4fxtaQGOXtQSAZhO6l
	jKvJr1Yu/iI8ob0lN/+6pZFLiRaOxUp8s5EnkzU/ZW0UZdEdOlFKj71d5HLqCuTjx0OGHrZh/3mGG
	D4NzPihc4p9flm4pLEgg2RjO31TWuYmwXUT32kPYd/M63qkTNJG7ElvQtBw41FX70I4Tf1fwRY6lE
	ZbYl2FCnH1R5sXCOOnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y3y-0000000GGyt-3JrQ;
	Thu, 03 Sep 2026 03:24:30 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y3v-0000000GGy4-3Ko3
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 03:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788405862; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=0wgFQtv8dkO8eMVrOYWRVOpDJA+dvQgD+EuoMqAxNGQ=;
	b=OIwsJIGmnLmzsp3kGeuMK7esa/+IWD+kV/vZx47Mk9Ihf+/FyKAbbmELjU8p6KE/gv6aLn4E4LDGW7WgP/7KG7/FqR2r/ryanXTzVoq57msgG/9t5fwsZhncIsITm5Sqa46MwhJNY2RuYQzkphLjfVVsGke8VJT8YcIjDrT0obc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=41;SR=0;TI=SMTPD_---0XAEcfX3_1788405852;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAEcfX3_1788405852 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 11:24:20 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>,
	guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 0/5] riscv: Add Ssqosid and initial CBQRI resctrl support
Date: Thu,  3 Sep 2026 11:24:09 +0800
Message-ID: <20260903103930-testedby-cbqri-v7-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
References: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_202428_721937_0B20235A 
X-CRM114-Status: UNSURE (   9.02  )
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

> This series adds initial RISC-V QoS support: the Ssqosid extension [1]
> (srmcfg CSR), the CBQRI controller interface [2] integrated with resctrl
> [3], and a DT-based platform driver for cache controllers. It has been
> tested on both the Tenstorrent Ascalon Shared Cache controller and a QEMU
> implementation [4].

Hi Drew,

I picked up this series for testing as promised. I exercised it on both
QEMU (using the riscv.cbqri.capacity device from your branch [4]) and on
real FPGA hardware with a CBQRI capacity controller, and behavior and
functionality look good on both.

What I verified:

  - Mounting resctrl and reading the default schemata (CBM reflects the
    controller's capacity blocks).
  - Creating control groups, writing a narrower CBM to schemata and reading
    it back; the value matches what was written.
  - Assigning tasks to control groups, with the RCID taking effect via
    srmcfg on schedule-in.
  - The CBQRI capacity-controller block-mask limit actually constraining
    cache capacity allocation.

No functional issues observed.

For full disclosure, this was a general functional pass over the main
resctrl operations to confirm the controls take effect, rather than
exhaustive or corner-case testing.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
