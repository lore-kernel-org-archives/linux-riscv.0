Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E137CC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3D060E73
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B3D060E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2c05CBg3+NTvwod8JSaf6vSEgopR2+MNdq6EHlch840=; b=GL55jxp8/XAHt6
	X3Y0MzLNZX7+eQZvYFI+63bGwnjRuveaEfqxvVzSOmDqBktqYiRaaTHv8roWpgdTg45FxXcqjRsXe
	SaSSEkdBN1XOYI0CGUzeJh0NaifHEc3dQNYgteqRh1Ck3oDOV0o0S7UuzT+gOOMcqm6tib6D728e/
	ZGQGN+T9Fml8or2eqhiEQPJrroGjVsZiEmluAXTmMstGCVYqaAAVM4Fwdv15+OcHOP62HENBXO6R5
	Jjgw0QOms3ul2/Fs5/TOiHiJglOH9MShX65E5GTSUUveBfPD7BkRk6Z7WwEoouH58TlBWBssmUday
	6BY8X8vOhUOvtrqLKs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6uo8-004lR4-Ml; Fri, 23 Jul 2021 13:01:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6uo5-004lOz-6U
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 13:01:38 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1A8A660003;
 Fri, 23 Jul 2021 13:01:30 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 0/5] Small cleanup for mm/init.c and address conversion macros
Date: Fri, 23 Jul 2021 15:01:23 +0200
Message-Id: <20210723130128.47664-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_060137_415793_BAB20C72 
X-CRM114-Status: UNSURE (   7.11  )
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

The first patch allows to have only one definition of the address
conversion macros for all kernel types.

The following patches bring small cleanups to mm/init.c and the last
patch makes the size of the DTB early mapping consistent between 32-bit
and 64-bit kernels.

Alexandre Ghiti (5)
  riscv: Introduce va_kernel_pa_offset for 32-bit kernel
  riscv: Get rid of map_size parameter to create_kernel_page_table
  riscv: Use __maybe_unused instead of #ifdefs around variable
    declarations
  riscv: Simplify BUILTIN_DTB device tree mapping handling
  riscv: Move early fdt mapping creation in its own function

 arch/riscv/include/asm/page.h |  15 +----
 arch/riscv/mm/init.c          | 121 +++++++++++++++-------------------
 2 files changed, 54 insertions(+), 82 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
