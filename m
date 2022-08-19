Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8C1C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 02:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXepJUgB9aANUZAOrYK6JegvdFEkCPG2AdSnxJ7Vz9s=; b=JNshITBgRmw2Tz
	f4iYCSdeiD5ebHCuwfGxU3jIp6j0hQcYcSGWe9FTg0GKnA/69kPJ9PajhHesjdkhHmsv4fCNOdb8c
	KWepGPKjJLXATaWmYR+YK4L3kxJw70bKbv/kD2uavidojCYkkhWGR5r9KsrW3MqyRaWXnto8GXuXw
	5aDaVUD/xDtM1n5PGwv3JroqSuLQQjI3+S0Aef1/+rLczo0qOoQZ5gyEvbd93wYeo96izDqWQa8kA
	Pb72DatNTT9NV2ATNZZJFds8TD7a2cHC2hsw1/VCU6f3qyAF7qIAClsCrVpsOwZCzS8+6lBjdROSl
	/PhG2DuDEFD292Mq/sQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOsAG-00F6vL-CE; Fri, 19 Aug 2022 02:55:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOsAD-00F6rj-33
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 02:55:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F77D614AA;
	Fri, 19 Aug 2022 02:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25A2C433C1;
	Fri, 19 Aug 2022 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660877712;
	bh=+m/z9t7difm+T7Kf5VxuNeNPtaHK+1MlGIRm7crGn/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b/KIBp6hGb/CV7ctjyoNlVNQctbDKqvWvOycBri2jc8hs9jUBTknd3RUQZctSwBLL
	 yxSkFw0wSgftsks4Jezn7Vkx/H3bXALoSoIeBckdBjW9MMbGpWsWOjeRdf7u3z5SIU
	 i6JkQUV3k0hBw1x10fSsb1DSNVGOVd6XnafE0lln8m68gdOiySWihoy1hal61YTPhL
	 JVx1X0kgAnAr3Q3mh1rJwygcyxhoEyqMe//CRj+Au8ixgPCs3/lUYs5fY4Aaj3qp6R
	 Y2aOOyquD6emEJypZunLgSQEEWmPr8Rt85PLL1Hrtdg4QeqLhKpPq/SjH/8sWci13v
	 zeg/00VCA9i0Q==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de,
	guoren@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org
Subject: [PATCH V3 3/3] arch: crash: Remove duplicate declaration in smp.h
Date: Thu, 18 Aug 2022 22:54:44 -0400
Message-Id: <20220819025444.2121315-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819025444.2121315-1-guoren@kernel.org>
References: <20220819025444.2121315-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_195513_286528_7188C876 
X-CRM114-Status: GOOD (  11.01  )
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

Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h which
has been done in include/linux/smp.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: x86@kernel.org
---
 arch/arm64/include/asm/smp.h | 1 -
 arch/x86/include/asm/crash.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index fc55f5a57a06..a108ac93fd8f 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -141,7 +141,6 @@ static inline void cpu_panic_kernel(void)
  */
 bool cpus_are_stuck_in_kernel(void);
 
-extern void crash_smp_send_stop(void);
 extern bool smp_crash_stop_failed(void);
 extern void panic_smp_self_stop(void);
 
diff --git a/arch/x86/include/asm/crash.h b/arch/x86/include/asm/crash.h
index 8b6bd63530dc..6a9be4907c82 100644
--- a/arch/x86/include/asm/crash.h
+++ b/arch/x86/include/asm/crash.h
@@ -7,6 +7,5 @@ struct kimage;
 int crash_load_segments(struct kimage *image);
 int crash_setup_memmap_entries(struct kimage *image,
 		struct boot_params *params);
-void crash_smp_send_stop(void);
 
 #endif /* _ASM_X86_CRASH_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
