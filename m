Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D177C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WOr6JXKCJNlvtDSHBRWfaHBnC2NUmxjNuK2fpH6GiE=; b=lpXRBACbxfyee+
	0HGfvMuLiKYphlvONOVY6X/uVdG7bzg/jMVW0SW5HoKUACbo5EHXc97SK35qURmiFN8dKI0n/08+s
	dDbhEyem+EWOCAuus6v+M5df7m2gY+01cSAgV/RKX7RUiQQOueXJH6HDZQMLTv5wCt8mRnQUeghy8
	PdkvhcFRTH+f8rL5c59Ci05ljplFtDMup1Q4kJpXUbKbjURJWoVOvUM8U2EOzgqeW6DQat3/B2YhH
	fxTHS/G8s9UshaKjc7LBDgF6TIqzX4evvMqGwN4rYqrKo+7xH7fRUkWcBdXNjSyNQwPdR6dtR9OAE
	fBh3+RynExMKyKvxGpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpL3z-000byb-AS; Tue, 23 Nov 2021 01:57:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpL3w-000bxK-Oj
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:57:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 899AF60F70;
 Tue, 23 Nov 2021 01:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637632653;
 bh=DiRZ07Mz/LWCX1YgwTR0bxKJ+0HA3rQ0vFZS0plyMeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JjyhIRa4CRbPyeqxAFKMYepicgB1u4mNGFAtvPh6M56DylmdkG5nJ1HVAIq7Tez06
 X8RIrW5MOYPI/HNAWyVfzs0Y9pv0S7O43inZCdwzGn5zPA2rdiEFqlX1DEuLKb17oX
 S08/2GMgJkD1exeSQbRpiSDppmFiGtGEviL5Dbb4qHRCDZpOM5gS8EipaKGjdENEhS
 4dhrUKAr/xw3UlRMLc/h55Y7SvFM9pBSM1LtNrGOq1Qi9mBJUhZK4OIn9WPVKJDuSi
 nEXvMTU2at9EI2VSQ2uFzpZEsKDjp/lBF++mfPdXMsVgQGyiymXPl7+4d9TKNu5htx
 dWiLDSWbLvsFg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save memory
Date: Tue, 23 Nov 2021 09:57:14 +0800
Message-Id: <20211123015717.542631-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_175736_854789_0C1A4E19 
X-CRM114-Status: UNSURE (   5.78  )
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

The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
4MB(32bit) in Linux. It's very wasteful to small memory footprint
soc chip such as Allwinner D1s/F133. The kernel parameter gives a
chance to users to set the proper size of the firmware and get
more than 1.5MB of memory.

Guo Ren (3):
  riscv: Remove 2MB offset in the mm layout
  riscv: Add early_param to decrease firmware region
  riscv: Add riscv.fwsz kernel parameter

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/riscv/include/asm/page.h                 |  8 +++++++
 arch/riscv/kernel/head.S                      | 10 +++-----
 arch/riscv/kernel/vmlinux.lds.S               |  5 ++--
 arch/riscv/mm/init.c                          | 23 ++++++++++++++++---
 5 files changed, 36 insertions(+), 13 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
