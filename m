Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F35C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXbDwXm2ghHc2QSFatN97eYHuOccPuGpcadr9cw7km4=; b=giNIRJ0Xro8Dcm
	2++IabhnXTpx42aCdRJRyim+E6kSwmf2M1uz8jEPPPDH39rzfibiQUxxrvL0c4Zx1CfbMHYchTrt1
	lY0tHAg23/1ATWZ7Yd+OEaUvw1mjIULFzYFJ0vZR0Ou0nt0KEfgqWQN4a6nwAfxu6qg4DNx+upAb+
	H1nwnZEYFoNMPPm3hUE3XT+cqIZ/PQAyrG/X1siR4v8olcmzQ50LgDUdIKkEY4qqjKqX6sW/A7Rse
	veIrVjgGJKN/1ObmwX7h78pul01PT7hWx/jesaO2yk5fsqWE145SneBzmv6hu9wxK8waFQscLTtut
	bTTRXGRwuAil/sda3aKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt11K-00ENlk-N3; Fri, 03 Dec 2021 05:22:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0ys-00EMC7-2Q; Fri, 03 Dec 2021 05:19:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2E7462957;
 Fri,  3 Dec 2021 05:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95775C53FD1;
 Fri,  3 Dec 2021 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508773;
 bh=8aNi3jzRLx9EvlHvQrJ8+c0FPLWUfjaF4txqATGz5dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PbmtvVVu3EW5lZpDtlp5isAZcUo7CXeKc+dXipWy344d/9FofNAtRnFsEkHQibyxM
 94plzcYhxqXUeq6UOQl3HEne1hxkOcko15N7K9RLfmZrdtGsJjxLN6OBmlpT20nJdm
 IhpanescmVnYesI7ThWQRZx75hvpVkn+DTPgRlkf4uc57wZzQy19dTfTzkFRusqEoo
 uBw4C8R4NVLrTIBYtmfEmM/oG2KXWgy05CPuBCPotoU0vkM87Oph5vGg8XDMyzchnX
 /BVLkmJ5xjW+KWxzbDYsfRp+8EvOkeZSpZabclJ/y20qiusZQeMl+7T3D093aqlb+o
 qmAKcKrIGGGOg==
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
Subject: [RFC PATCH 5/5] arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of
 #ifdef
Date: Fri,  3 Dec 2021 13:11:57 +0800
Message-Id: <20211203051157.2160-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203051157.2160-1-jszhang@kernel.org>
References: <20211203051157.2160-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211934_182960_52342E5F 
X-CRM114-Status: GOOD (  13.23  )
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
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
code and increase compile coverage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 284a80c0b6e1..f9a054a344c0 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -973,7 +973,6 @@ static int __init init_machine_late(void)
 }
 late_initcall(init_machine_late);
 
-#ifdef CONFIG_KEXEC
 /*
  * The crash region must be aligned to 128MB to avoid
  * zImage relocating below the reserved region.
@@ -1001,6 +1000,9 @@ static void __init reserve_crashkernel(void)
 	unsigned long long total_mem;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
+
 	total_mem = get_total_mem();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base);
@@ -1056,9 +1058,6 @@ static void __init reserve_crashkernel(void)
 		insert_resource(&iomem_resource, &crashk_boot_res);
 	}
 }
-#else
-static inline void reserve_crashkernel(void) {}
-#endif /* CONFIG_KEXEC */
 
 void __init hyp_mode_check(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
