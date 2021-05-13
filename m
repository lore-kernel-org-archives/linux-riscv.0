Return-Path: <SRS0=0BZE=KI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A77FC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 18:49:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA414613DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 18:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA414613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qAjGaQisoYoYMJ3iCMX7Swo/N05SaSqlChdxEmZhWlY=; b=XRE4291hpjOefkBWn/eyCFt57
	MJDCiwt9IwvcOv+b15czuY6C4FYrsGnAj3Wl7I+3yaoqo1IKGC/bcrvmPMU0HVDLgxXIrDArNCFq3
	YatFz46TU1/4RVQHurcFTTy4f0isTpK0c8UUSEc2K+k5er2yeu/jqdAssD7YjwCvg1bKkoGwpTabO
	45vY/Dr40xYFZDJy+ralUos0NxcplqCKWDVd5shd+cPLRn5MfKTTc3w4yvmnUpZsWzj5HA5vmxGbr
	01bRFDDBmMWXV9yIY3AOtds50Fd2yuYMNhXJhXuOaxNQsUfL8qghaQfBoiC1Ct4JxxXeLK1HT6AJK
	sbvOykOKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhGOA-006B0D-FX; Thu, 13 May 2021 18:48:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGNc-006AtB-2y; Thu, 13 May 2021 18:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qKIaiPuh7YddYKNoE8XQ9lu6CpsW3ub4fvtqysK4mUw=; b=VQtX6lV1pUzswQyGeGoZy0CvGF
 I1Ob06+yF4UXtcnI88xWJO71SV71S11yFpobOwgcb99onXkpI6tr+ePQAQQ5mp8+8qJvSgFHj3Cyi
 LrJKNWt/FzOPHkBQfZIIhOlSSIDBdJu6ZRHVJGxb3UocjnZqib1HkN9G8N1dBDpwXIAJjNoj6Hbgq
 YhWOMhuDbQ/tqABowY+Waf5FTOuEKKfOM20/04n4aQkrEDScfB2MKxP2qQ2DXQsZdlSZfg/db+kPG
 4yjpJg9VB6ZkcdkCvk2kiXSav7nRvlNzRXN472zNdEkdiZ4znfbPDcYYJ09lbfUNzQ2M/b2BRcXiN
 qBGIc32w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGNZ-00BRvr-MR; Thu, 13 May 2021 18:48:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F100E61406;
 Thu, 13 May 2021 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620931693;
 bh=YNtMoJPFX1nxLRPKHlh/gIcXDvEsY+oL6IlnvheGTj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O8YS3+/cOgAs/MgNDyoxTbEUuuXfCvT6eHZ1iwwPEyokmWHJz/rNweYhb7xMkZN8H
 wpdKL5rXrLjM/FirwyTsI936e7Q3rxYj1QuzKvpAiYJMAgo+HH+/y0tEYSIvMC6KFu
 QANlycHRcGY1upUSI/xK7O+ywbFqCbSzN/ZmmrVlVqtQryzaY+HhB+rL6c+Wm7Hy6p
 DS/K9ZDuVoqmvXOynK9keW/rej34x4htPqRfBctTmqYL3GxwhLMNimZ0TRxd9Jzdzz
 vws2GdAUC/NFaIDG8zMfz3Bsf765Q9sUbXyK2BOPuGJGJgWognfFUS9DyLAdPVNTGp
 JVbN+tFK5lgFQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v19 2/8] riscv/Kconfig: make direct map manipulation options
 depend on MMU
Date: Thu, 13 May 2021 21:47:28 +0300
Message-Id: <20210513184734.29317-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210513184734.29317-1-rppt@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_114813_781577_86F06F59 
X-CRM114-Status: GOOD (  12.80  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
no meaning when CONFIG_MMU is disabled and there is no point to enable
them for the nommu case.

Add an explicit dependency on MMU for these options.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..c426e7d20907 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -26,8 +26,8 @@ config RISCV
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PTE_SPECIAL
-	select ARCH_HAS_SET_DIRECT_MAP
-	select ARCH_HAS_SET_MEMORY
+	select ARCH_HAS_SET_DIRECT_MAP if MMU
+	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
