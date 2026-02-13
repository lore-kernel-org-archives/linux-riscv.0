Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942C6EE36A0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sFAkOjIPl86fVoZB2XWS0K3WD4ie2k8euPndtEO+bbw=; b=rVvCjJMxyYIXXR
	Awn4Av09DXbqbqE2bLuIOrhjr5wEK5hmWHG8iabHxkQy1jjGvxJ88Ivexdykyn5DlzcLXUoIcy7Xm
	tDuxx9Fie9HlKzZSqHQhHTJV/cV59a9JyCLlmsERtSpcZuVJH7bhlu/W+yti7HTNn+uIYJeOryE5r
	/XDplwrCenj6wUSINcuOaz8fb0lv3JlKeIFQPEuKuxlzw565AZHdIARDkknwytbMXvCBHsM0sFVMU
	DK9Od/XZ2n9kDkQ8VfmT7JEeM3T9Jc70//WscL8VU74i4VnvBeSYN28z8hTD+F4QBp51nKie5kKaH
	W77+lo+8PX54fWomxavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpmy-00000003GJY-0mvJ;
	Fri, 13 Feb 2026 09:48:40 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpmv-00000003GIT-3GbB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 09:48:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770976113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gf06fOc9NSYWQuPmpzEppb+KChKB/ddt5VFMWOyC7BM=;
	b=iJvb5k5kNQko7FF0TlwdhzgqiPwqrGAkRZ7HSJ9sDSrMIfVuwf9jNcXfHCgDl2435Ewb8I
	/Ks8XieDmt/OzyMLskNQ0Qq8XXiTBTF24MCBgMTSn72m9r6uEs6Qb4wWr27JukjAMYY5aH
	6Lo1lA/9/EPaIl1vUg3//6U9r9vejx8=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	zhouzhouyi <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH 0/2] riscv: fix minor typos and style issues in XIP code
Date: Fri, 13 Feb 2026 17:47:37 +0800
Message-Id: <20260213094739.397762-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_014837_962602_FB330996 
X-CRM114-Status: UNSURE (   4.62  )
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

Fix a few minor issues found in riscv XIP-related code:

- xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
- head.S: spelling typo and wrong #endif comment

Kunwu Chan (2):
  riscv: xip_fixup.h: fix comment typo and whitespace issue
  riscv: head.S: fix typo and wrong #endif comment

 arch/riscv/include/asm/xip_fixup.h | 4 ++--
 arch/riscv/kernel/head.S           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
