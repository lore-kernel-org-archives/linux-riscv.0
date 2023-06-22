Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9195EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 23:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UG+gkk96tesWlJILCLiYEXMtyY3cn9ryxf4Wkz7hZII=; b=Tqt5klgdiZPTok
	+3Qpw5G678gTE3ddkyvWwT4El+ezaVa8ijDBf1H7HeEEbkikkfzKxELGRqdL6gwmXCTNv12EN+1Gj
	Im40Hmvh9wlNKaZdh0naEvCag7Sx1nS92sVi1kqo2Bv5Q/hAjNdIwI3bOTmk/eDw8VysU//CJmENp
	OuhbMhaWLWfjnkQwnZCRuiqdOdQ2898+LivKp47eBkrN/sVmVPQ1KaOYg65imO0nrSwDg28nLFvkj
	rGKT7To5d9Bm23329T2BTwRB84fZkJSBxxSu+gcijLeiB+UTi1ysnRQj9xIguNwv0aafBciz5CLZK
	ttpYuYAZK5MZuVmgwY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCTUV-0021bg-26;
	Thu, 22 Jun 2023 23:13:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCTUT-0021Ze-0V
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 23:13:26 +0000
Received: from i53875bdf.versanet.de ([83.135.91.223] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qCTUO-0002nK-BL; Fri, 23 Jun 2023 01:13:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	samuel@sholland.org,
	guoren@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 0/2] RISC-V: T-Head vector handling
Date: Fri, 23 Jun 2023 01:13:02 +0200
Message-Id: <20230622231305.631331-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_161325_196298_92F31195 
X-CRM114-Status: GOOD (  13.75  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

As is widely known the T-Head C9xx cores used for example in the
Allwinner D1 implement an older non-ratified variant of the vector spec.

While userspace will probably have a lot more problems implementing
support for both, on the kernel side the needed changes are actually
somewhat small'ish and can be handled via alternatives somewhat nicely.

With this patchset I could run the same userspace program (picked from
some riscv-vector-test repository) that does some vector additions on
both qemu and a d1-nezha board. On both platforms it ran sucessfully and
even produced the same results.


As can be seen in the todo list, there are 2 places where the changed
SR_VS location still needs to be handled in the next revision
(assembly + ALTERNATIVES + constants + probably stringify resulted in
 some grey hair so far already)


ToDo:
- follow along with the base vector patchset
- handle SR_VS access in _save_context and _secondary_start_sbi

changes since v1:
- rebase on top of the merged vector patchset
- add separate patch for "has_vector()" variable
- a number of cleanups
- a comment that T-Head cores do not seem to implement the
  vxsat and vxrm fields in the fcsr register


Heiko Stuebner (3):
  RISC-V: define the elements of the VCSR vector CSR
  RISC-V: move vector-available status into a dedicated variable
  RISC-V: add T-Head vector errata handling

 arch/riscv/Kconfig.errata            |  13 +++
 arch/riscv/errata/thead/errata.c     |  32 ++++++
 arch/riscv/include/asm/csr.h         |  29 +++++-
 arch/riscv/include/asm/errata_list.h |  45 ++++++++-
 arch/riscv/include/asm/vector.h      | 144 +++++++++++++++++++++++++--
 arch/riscv/kernel/setup.c            |   6 ++
 arch/riscv/kernel/vector.c           |  10 +-
 7 files changed, 261 insertions(+), 18 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
