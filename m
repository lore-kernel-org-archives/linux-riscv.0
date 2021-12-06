Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72104C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BR/pYoEvIJH7ZSMa5CWfWTUQ0VldvmxFO042VvQrnU=; b=I4Nw+ki8qtlNHP
	K3FuPvLo0X3cg2T7A/YKLmb6UjpjW+tOLG+IThplqTDSPJnMb4EjSOBvXMIMlQAJtLaDb4TxGkWQ6
	vCMIi6Er1/FDPAjoM/wZmt9IhkMv67Ec9h73ZTp5ifE7vy49hLSEcbNx4WGAcGDvdHjkZvLUOysgb
	vU15vobwWFy5T1kpGaheXIAReivcdSP2TT8PRu9ueFwrVeMOsdFjLMroWaUpHHZSxwFWSkDTxsCaM
	vqMeRQ/XWMlM5gPvdPcvy3PTm44Mt03LO1BtajeXAkyQFbcqo1RC6X/vUlS3XtvguN8qldolcEHV5
	qNk7UPOEyzI0NfK5cYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGbg-004gjT-2E; Mon, 06 Dec 2021 16:12:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGbS-004geM-1e; Mon, 06 Dec 2021 16:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C2C46CE1693;
 Mon,  6 Dec 2021 16:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E24C341C1;
 Mon,  6 Dec 2021 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807149;
 bh=dwbrNjZZfbu4oEgK1JyUMMblUgSIXuqfZwlfGeMoXPc=;
 h=From:To:Cc:Subject:Date:From;
 b=a9Z803W9nzZK1lISjFvZTCPzk5gyjgPf80jyDPez6w2IaEu2N5Ny5VuMEVutBTGKJ
 gALiRfbRgaEg/GwxHiVUjdD+XvupTZusEYKusCqUVKulKJ84aSvDi6QoAJF6dSDRrH
 T5igpNHJHXA93HttOAqSgGuzg9DhexvLcFSPhBmd38lf2gRszUelaAzvrZmtkA1Nzo
 Et1BonhmJCUVbZqWxl4nLVsLbXF7JY8LfMv7yg0LmcQMRsiT4Kb+SAemnLF5z1I5N1
 HbeJ874mdet+GqLXVwACn1t/JtNIXD5+3dhPT0/xHyoEz5mBV2ufkMXVFzpgVA4Ogs
 BD05a6x6djLMw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of
 #ifdef
Date: Tue,  7 Dec 2021 00:05:09 +0800
Message-Id: <20211206160514.2000-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081234_285949_9C3986C2 
X-CRM114-Status: UNSURE (   8.36  )
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

Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
and increase compile coverage.

I only modify x86, arm, arm64 and riscv, other architectures such as
sh, powerpc and s390 are better to be kept kexec code as-is so they
are not touched.

Since v1:
 - collect Reviewed-by tag
 - fix misleading commit msg.

Jisheng Zhang (5):
  kexec: make crashk_res, crashk_low_res and crash_notes symbols always
    visible
  riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
  arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef

 arch/arm/kernel/setup.c |  7 +++----
 arch/arm64/mm/init.c    |  9 +++------
 arch/riscv/mm/init.c    |  6 ++----
 arch/x86/kernel/setup.c | 10 +++-------
 include/linux/kexec.h   | 12 ++++++------
 5 files changed, 17 insertions(+), 27 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
