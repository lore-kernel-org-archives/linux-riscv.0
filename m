Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE45C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZXykNQpBar0umWx46lK6NZ+sWSkBtamPbOYvI3avpA=; b=4tb1g8C4tKrpip
	tU+p7ctUMeJ75kCwKY5VK1mNdwK2YPoceLVGWX+8JVRAHSuBs/R0jbexNVKHb8cSYlGuFjgn9jhXu
	cQ+xpJo/fJ7JdzWiyrw4pkAn1gil5r42QXh3FQ8DllsKQWB3y6JOVvWd7jE6CKu5mIhEdYJFaNwht
	sWjeimsh+HJmK8XzJa1/TlVptbadfcfZvbnmoSMZxaUIQfJRMGGLHCakx7WPEV6Ca/LM7H9xIMPV/
	JQloZMUI5nJGIN8ml92g4bxHAUV5IZGEgOi5pLCcyZFQ0+uprkirZIyml2bOjPDqKdHQjLWLSE3r1
	aLDK5s37emArYbEDu/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyla-0000000DMhO-3JFA;
	Fri, 16 Aug 2024 15:21:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seygp-0000000DLWk-0ODR;
	Fri, 16 Aug 2024 15:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78D72CE1F03;
	Fri, 16 Aug 2024 15:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499C2C4AF11;
	Fri, 16 Aug 2024 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723821388;
	bh=M3aXYfvZtOSP1Cm45umkLlCrgyuN8YBKot+wHksTLeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVh4w6IU4BSTS3EEym+oVd0Mq9Ouw3SmOallmWODUWdGVf9OugK7otEfi9BoLeKAz
	 J5PZ0UXn8RIKzwhJiOzTplTw64PmFk4gvwywbayvCdJHI6LOtYkWBRf+zu0DYADo3y
	 Wv+WRh172doczIcxyUdWBblmE3+v07vGSj62NNA6QDtVypTduqILY+dGQyfiCoLcrz
	 SgtrXpwq6g7+r6aC1XGenCfs44AUf9TEDQ16aQita6pLU3g8YPLZ1yoUN3u6iQ23q8
	 JOJ1yZ9+/cOktFvkJcoTH4g0sFhsGf3DUBX04Xyb9tnfC65Ful/vkdLm6VX8LmO4Wr
	 Y+/55HnIpEV5g==
From: Will Deacon <will@kernel.org>
To: sunilvl@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
Date: Fri, 16 Aug 2024 16:15:57 +0100
Message-Id: <172380817082.2918676.9519520229609793025.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240729035958.1957185-1-haibo1.xu@intel.com>
References: <20240729035958.1957185-1-haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_081631_326438_A62167A6 
X-CRM114-Status: UNSURE (   6.31  )
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

On Mon, 29 Jul 2024 11:59:55 +0800, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> 

Applied arm64 hunk to arm64 (for-next/acpi), thanks!

[1/1] ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
      https://git.kernel.org/arm64/c/8bb0376fe082

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
