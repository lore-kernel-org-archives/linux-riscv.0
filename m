Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64458C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 07:59:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29FB619FB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 07:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29FB619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDmw40bfjkR3pHZyllOOpcuC5R250b3nnRx/SZIwyJY=; b=Y76obpF7Cj07+jmT/moE+1Yv0Y
	sQ5R2LoFhgZm8fzqB/OBUmpO492OBv7k+/28kot/HdTJRrmu5LN0nGINVVNtRBQ5tDXSHnRSrbMsT
	RoZisxkR2kVKwlm0GP+0w3jikjw7yz/KuHw4bEbfqydeRTQJLlBIrLXrHoBHKxKPwK5pzwjN6oLsQ
	oX/Kwg9BkswyHqyETeHuZ+WF06L9cbGA9KAUTMprb60V+zSQWD2yIGjl8gAPG3HyXBxgD228g4qjZ
	9bk2rSdVGA2aj9xG/Guq9WgbZY0140dBoIUGdiEorm1+Do+iBD/rjQke1O/+Uh+ACJrBuKnSFY+1j
	v8TgkTFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKtq-000rmM-CA; Thu, 25 Mar 2021 07:59:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKrI-000qwh-Cf
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 07:57:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D59E761945;
 Thu, 25 Mar 2021 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616659005;
 bh=/wwJUDyl0L2cZlkv2+pe9ddYhc6OecFJJCkq6BkU3O0=;
 h=From:To:Cc:Subject:Date:From;
 b=OpFmlg9OBvyO10jNum7/CquDBaJxsFlSi9+zj3wgYdbg2fsOreULnLun9bZCz6SXp
 JKwPRVJP3lF4PdMljN0mTC0wTK8kewvJUOPRgys0fw7ouGfWsTFjb6vIRXA3yMf+qZ
 L+fKTi1+5bjzf5RMASfAexFZ7PPKNf7Oq+p+VDvyjeze1j4hDMh43j/hYhvJwtACO/
 cr93gggBCwAJyE3k053ltgHgXMwridRPmVpdsyS75eCAQdt9IjAebSzKTHGX6Nlerw
 ZwYdPrxr7fTxULpmjdXr16VMPEokqvEUpzabcJF4cqJXdck/40geNJyQmPgYaaG6C1
 vgM5pozmDujrA==
From: guoren@kernel.org
To: guoren@kernel.org,
	Anup.Patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 tech-unixplatformspec@lists.riscv.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v3 0/4] riscv: Add qspinlock/qrwlock
Date: Thu, 25 Mar 2021 07:55:33 +0000
Message-Id: <1616658937-82063-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_075659_845663_A55AAF9D 
X-CRM114-Status: UNSURE (   6.80  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv is still using baby spinlock implementation. It'll cause
fairness and cache line bouncing problems. Many people are involved
and pay the efforts to improve it:

 - The first version of patch was made in 2019.1:
   https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r

 - The second version was made in 2020.11:
   https://lore.kernel.org/linux-riscv/1606225437-22948-2-git-send-email-guoren@kernel.org/

 - A good discussion at Platform HSC.2021-03-08:
   https://drive.google.com/drive/folders/1ooqdnIsYx7XKor5O1XTtM6D1CHp4hc0p

Hope your comments and Tested-by or Co-developed-by or Reviewed-by ...

Let's kick the qspinlock into riscv right now (Also for the
architectures which doesn't have short atmoic xchg instructions.)

Change V3:
 - Fixup short-xchg asm code (slli -> slliw, srli -> srliw)
 - Coding convention by Peter Zijlstra's advices 

Change V2:
 - Coding convention in cmpxchg.h
 - Re-implement short xchg
 - Remove char & cmpxchg implementations

V1: (by michael)

Guo Ren (3):
  riscv: cmpxchg.h: Cleanup unused code
  riscv: cmpxchg.h: Merge macros
  riscv: cmpxchg.h: Implement xchg for short

Michael Clark (1):
  riscv: Convert custom spinlock/rwlock to generic qspinlock/qrwlock

 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/cmpxchg.h        | 211 ++++++------------------
 arch/riscv/include/asm/spinlock.h       | 126 +-------------
 arch/riscv/include/asm/spinlock_types.h |  15 +-
 5 files changed, 58 insertions(+), 299 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
