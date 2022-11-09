Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70F6C43217
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 06:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FqGIA0FMgQ6H3v9zevkMvTMxeYvaiZMY03dFYluTu3w=; b=0sQAHp7AS/pLZR
	/MXoKp2dnek8e9ygS5bUZGw2MbUIm6N2IyhbQqnjHEYquBbLnGmb9dsPPUH0TcBWZ/iDofYezEOnQ
	vrvn9OJjStlsta9BneGdY3kQqqUNhib4bHGsudhqBd87znNl3NtyfVaqq5Wp5JEnW5orXmsXKI8YX
	2ep3MjypPk8M4UfyjE6S67J/xAURGeayVo+vcEuUqG0gzvKTWAavXCl4Ob4ztyU8pkKvfSPj1fVHu
	0mrI96kgnAyOpJAS0/DvzI4p/BiON3DJSrnx3OA58iP/AUq5bWI59qqkSqWJZXzzrZe5bJjR07gxu
	E7CBW0Ec9VEtoMxnYUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuN-00BMcE-KW; Wed, 09 Nov 2022 06:49:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oseuK-00BMZ3-4i
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 06:49:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E34CFB81C8A;
	Wed,  9 Nov 2022 06:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC145C433D6;
	Wed,  9 Nov 2022 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667976592;
	bh=BIrl1NrFxyHLR1IA71W4GKwpqlpYuXilX7sg5vJPyxM=;
	h=From:To:Cc:Subject:Date:From;
	b=NsCm1DpbXb5kW9klEWByeP+NTouXw3kZn/1gEo3NqKLiYEqIO8y2D+Ol1smVptbSq
	 /eupKkTVgnG68dWUT8GwIgeNHpLiPVr73dfEhwW17MCbXKJPPSw6p4qhl/JP3cGTjo
	 dqvLwrV478pu2BA0nvjdhWO6SQ8xPag+Or9dzpPg7F70dENFrSloOHritpELHS6q9m
	 ox44rCJpa/tMRN9i4DO63bDTMMDNmt0jIOcBjT/dbxxPsd6U+Wx7qjTcMtw4VMZ3FF
	 BCCcgs/ycVv1BgFBn3iWIMsDU6b9eS6+nBxehsQgHGk8aMh1Jx5Etk1G6xskdQq334
	 wHtULLzBf07xw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	peterz@infradead.org,
	arnd@arndb.de,
	linux-arch@vger.kernel.org,
	keescook@chromium.org,
	paulmck@kernel.org,
	frederic@kernel.org,
	nsaenzju@redhat.com,
	changbin.du@intel.com,
	vincent.chen@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/2] riscv: stacktrace: A fixup and an optimization
Date: Wed,  9 Nov 2022 01:49:35 -0500
Message-Id: <20221109064937.3643993-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_224956_349475_DC604673 
X-CRM114-Status: UNSURE (   7.70  )
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

From: Guo Ren <guoren@linux.alibaba.com>

First is a fixup for the return address pointer. The second makes
walk_stackframe could cross the pt_regs frame.

Guo Ren (2):
  riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
  riscv: stacktrace: Make walk_stackframe cross pt_regs frame

 arch/riscv/kernel/entry.S      |  2 +-
 arch/riscv/kernel/stacktrace.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
