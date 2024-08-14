Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95869C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8Qw7L9R20eD4VE+E/18zheFzTs9Ln07RkW/nKMvl+w=; b=ET0xJLxcojP71Q
	eGCQTMfkE6VpwXFsgrwDlLU6Hp6naw2TXrAslSInB3t9W1Rz8Yt1wwvRcdo7FUs/L3Qn4StVLBIT3
	obzT/LTq5YprMmzd1fdovGGhT4LEN64YMdvfpu7BqwcU9CZEypt2XLhOHVYFlgAgOySVaM3GD3T7r
	loD+fAZ+/IDFfsp2sp5EyFQn09Sk4iSzm/aCZFZwCTIlEwAhqIpmZBNsjYsXryVf0yHsY6cdliqem
	Tl+2fdLrYstc3h6J/4pNgikU5S4GNrDUEI1Bo/3UNn9HRcK6U36IAcwjmWdeDtiYzenxsv3HCTOuM
	CD1aVO5V7J5PIpsmYpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHGg-00000007kEJ-0pOV;
	Wed, 14 Aug 2024 16:54:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHG2-00000007k7z-0aec;
	Wed, 14 Aug 2024 16:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64F5361028;
	Wed, 14 Aug 2024 16:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A53FC4AF0A;
	Wed, 14 Aug 2024 16:53:54 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: ajones@ventanamicro.com,
	sunilvl@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>
Cc: Will Deacon <will@kernel.org>,
	xiaobo55x@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 1/2] RISC-V: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
Date: Wed, 14 Aug 2024 17:53:52 +0100
Message-Id: <172365442470.132931.8323822182514148315.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095358_267959_6EE5B8EF 
X-CRM114-Status: UNSURE (   6.45  )
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

On Mon, 05 Aug 2024 11:30:23 +0800, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[2/2] arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
      https://git.kernel.org/arm64/c/a21dcf0ea856

-- 
Catalin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
