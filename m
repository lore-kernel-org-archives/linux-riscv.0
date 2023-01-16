Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B99BC46467
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3206sT+cI8TQ9eDVmlWWF80g6LMx63eAA/U/UPrLKbU=; b=oIMwnkdC8scB7A
	u+1Ie+a/wcp51EfbuwgESRJxfyTxx4espo+tWFf9CXOwkIfMg0je1TcghANQb0C5YtG80ErsYtUFW
	5P4G2iB2HgTDQSGtFLnYKjwXwuMxpYvhksStOnvO6VUDyDeviwAZcfBpVYCMyJgg8SzAWQ+KMhpOj
	WVwl+hg56kWp1+4tdFP3MnbSc4PxM8a8hvU55l68IJh4GLDgjQTFc2/HWv1WBM4MFNHuHGAuPznqS
	zrWm9VoRRraiTWO3HMqQWvp3bfvK6eP8cLTek9w6EQF1evco4oR1aTJ+yEm2EBpeHse5Lb5bybc31
	bXjSUU4i5ABY6T/YLgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsL-00BAwq-It; Mon, 16 Jan 2023 15:58:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsJ-00BAwT-JU
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 15:58:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B80761030;
	Mon, 16 Jan 2023 15:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680DFC433D2;
	Mon, 16 Jan 2023 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673884697;
	bh=RsabiBXFC4MHgxAsWRde8upzJ5+4idNkSNxNVbPz2qM=;
	h=From:To:Cc:Subject:Date:From;
	b=hQHNDXBOFwCYCPg/jGnWzkM0roEWo9xa3yhCCgU/5TNHWSiahSxoL1sxNAF02e7gp
	 RU5O5/lE1ojiqRukUmo/ZccDi3ltGDU9IfyTnh27zF7z4RfKqmjQndSr4MYVyDZyf8
	 atUaOZB1XSPmgn+6OXY4vOcjOpxAHoHrdQ/Y5DDub7VpcGEiLjy7JjXeqdByu6Ut0p
	 Z8WKFI6x/F6oBYVcmVh8W6cHa+0CZuz9b9VzoL07ntq9C02Xkf/TqBzIdypwN3XNk0
	 TurlIGGne4BX7IR3GY5KD9qHvQzDBDueY1VhbdUpeoGl2jO468Wp+1hnqoEb8Npesi
	 Cr0nWfpumqg8A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] riscv: improve link and support ARCH_WANT_LD_ORPHAN_WARN
Date: Mon, 16 Jan 2023 23:47:56 +0800
Message-Id: <20230116154800.2396-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_075819_723016_3900D43C 
X-CRM114-Status: UNSURE (   7.44  )
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

This series tries to improve link time handling of riscv:
patch1 adds the missing RUNTIME_DISCARD_EXIT as suggested by Masahiro.

Similar as other architectures such as x86, arm64 and so on, enable
ARCH_WANT_LD_ORPHAN_WARN to enable linker orphan warnings to prevent
from missing any new sections in future. So the following two patches
are preparation patches, and the last patch finally selects
ARCH_WANT_LD_ORPHAN_WARN

Jisheng Zhang (4):
  riscv: lds: define RUNTIME_DISCARD_EXIT
  riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
  riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
  riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL

 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vmlinux.lds.S | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
