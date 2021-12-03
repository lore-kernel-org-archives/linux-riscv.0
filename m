Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739BDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8za7EfD9PuqnZgUiX/VFLiq0ixSc0mbIvLeZB+tI00=; b=sq8soxaIZYTGRz
	Q5odf2Q5S2YI7mus2NuNYYVIA3oAUu5Maq+SIim5cvU8sngXtpMSOJu6BVzNzpCHQkyLRU81AnMno
	LqDOiFWTsw1pGj6HbXiMzgc/8tdSC7WMYN31PTpLJ1i8yt0ljrSnhdxNOHHe1ZZiUeNhxzl+h27Cf
	oROtW8MjH8FzgtQB48TsioxXH0iQSqKPs8HTcpL0KBi1jn4ik4H5sY+11hto5aAQM7ZUfJ/W0LUDG
	4dnUnPkXKFAY4hfGmrBPtLCQdLzEG6l47whV2MO3CyAuJkPTsj9AZqyhNizHoUINAoBjWlXWph6i/
	F0xnO6C4cak83YMQT6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0z1-00EMGl-Fm; Fri, 03 Dec 2021 05:19:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0yb-00EM4k-Bd; Fri, 03 Dec 2021 05:19:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E58E962956;
 Fri,  3 Dec 2021 05:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D838CC53FAD;
 Fri,  3 Dec 2021 05:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508756;
 bh=Pwe0wYHKG5lxvAb6z5/hTI+22/H72lsdHUeOXryUv9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQwA+lKlGMNL5+ZkG7fJpteCU1piW7MSKcUDcDOMfJURL53112HoSUivtVDIQCJiP
 VWXAID0dxXH0vkl/fKdMXC64Li71glf4sdbelM1ePF123whpN3CxzO5sQ19+Y2vxbB
 iAXdJyYE82EhSthCH4WnMQkVD7Od2ZIGSNPAk42hZEYNLF4liT7QVFHzu4SIEdBw5P
 j8oAiWpE/h62SA+diLe3gNQWcfrkXTuleSNcGg2+QZQe/TpT34DSvQgL9YZwJys8Dk
 4wiirN0zV2EkksxpTmadF5ewDJt/IlWbtu9HiilkY3W+c5OBXHQuZj7jKeZ9Tvvvx2
 KeKEISnvy75Kg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: [RFC PATCH 1/5] kexec: make crashk_res,
 crashk_low_res and crash_notes symbols always visible
Date: Fri,  3 Dec 2021 13:11:53 +0800
Message-Id: <20211203051157.2160-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203051157.2160-1-jszhang@kernel.org>
References: <20211203051157.2160-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211917_502461_3C356073 
X-CRM114-Status: GOOD (  13.39  )
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

Make the forward declarations of crashk_res, crashk_low_res and
crash_notes always visible. Code referring to these symbols can then
just check for IS_ENABLED(CONFIG_KEXEC_CORE), instead of requiring
conditional compilation using an #ifdef, thus preparing to increase
compile coverage and simplify the code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/linux/kexec.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0c994ae37729..58d1b58a971e 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -20,6 +20,12 @@
 
 #include <uapi/linux/kexec.h>
 
+/* Location of a reserved region to hold the crash kernel.
+ */
+extern struct resource crashk_res;
+extern struct resource crashk_low_res;
+extern note_buf_t __percpu *crash_notes;
+
 #ifdef CONFIG_KEXEC_CORE
 #include <linux/list.h>
 #include <linux/compat.h>
@@ -350,12 +356,6 @@ extern int kexec_load_disabled;
 #define KEXEC_FILE_FLAGS	(KEXEC_FILE_UNLOAD | KEXEC_FILE_ON_CRASH | \
 				 KEXEC_FILE_NO_INITRAMFS)
 
-/* Location of a reserved region to hold the crash kernel.
- */
-extern struct resource crashk_res;
-extern struct resource crashk_low_res;
-extern note_buf_t __percpu *crash_notes;
-
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
