Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2902C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlgG5oP1YfLARuECQDW2xfBS7/Tb7dViJXPuaZcGzKg=; b=gGnG9oqAuuMePU
	8c2pBTG4fVr5inNYn/XxHayLWGY1EXUHRxinAIYTgd+NfPeNGEBWCSGbDgrzoXMEqd6A+v3x8i+7+
	c0gUmA/1mAguzSErbMTZGC4yFF3IEZaZjQCOkrpPq81BDu+othT8AwFAAA/4I6UbSAt7rBsQg6pjo
	v/2XZkWEgSptNaevX9zc9CLwZPP+oZAw7aMT6+N4WDucWVwCMyCOblaq2OzavNq/waioJGklCp66M
	uYR4EI0RwcU2uucxih0nMEHoeZvzkVfPqoYkaDKBExdgSFjAe+GzGSvNlD2yyTDL33/mamhncN54k
	hH89iLEBjci5ZHQNityA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr2K4-00FRNA-Fo; Tue, 17 May 2022 18:53:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr2Jz-00FRKt-A4
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 18:53:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2F81B81B92;
 Tue, 17 May 2022 18:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E981C385B8;
 Tue, 17 May 2022 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652813604;
 bh=30bwI04Mfd+WHyRtaC9/dHrxj9ZJ1vDpxbC6SXTuArM=;
 h=From:To:Cc:Subject:Date:From;
 b=ViZxlk2oP9X2+pd1GYvHwFkTyQsN4T/eSndGxXWag0ldygf5NWqIu4FDJK6MT3Lat
 01la7yF+ab+Q7i/vSfVHl2RzgzVmUvPXY8UgRGUZcjW8uiM30SHIrmIpAJ8fQt9OIR
 xAOU6iPFasa+IORG1IJCM9MquWTImpMIn3FkEc9qZk8vlodYoBoq8ZOzKS6/iAnPs+
 9DmDsahX7LgrZ4Sll9GUzmM08ZFRaNmYxdIjVEArVYAGjzJKPAGN+8hKUzVvNVvDb+
 RATa1oWQ1NJKWQTZ7znU7nFjWXsdwp93KkioiY/CFc+YC1A0M/gDKclwbIA0HBTzWN
 QOaJWCuYXXz9g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] introduce unified static key mechanism for ISA ext
Date: Wed, 18 May 2022 02:44:51 +0800
Message-Id: <20220517184453.3558-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_115327_536294_4B8C265A 
X-CRM114-Status: GOOD (  10.27  )
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

Currently, riscv has several extensions which may not be supported on all
riscv platforms, for example, FPU and so on. To support unified kernel
Image style, we need to check whether the feature is suportted or not.
If the check sits at hot code path, the performance will be impacted a
lot. static key can be used to solve the issue. In the past, FPU
support has been converted to use static key mechanism. I believe we
will have similar cases in the future.

Jisheng Zhang (2):
  riscv: introduce unified static key mechanism for ISA extensions
  riscv: switch has_fpu() to the unified static key mechanism

 arch/riscv/include/asm/hwcap.h     | 40 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h |  5 ++--
 arch/riscv/kernel/cpufeature.c     | 14 +++++------
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
