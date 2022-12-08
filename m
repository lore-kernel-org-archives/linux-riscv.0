Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0AEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJvKgMaQ4w4i3uBx/P/fYJ90UsAEgmkRSEpv29IsyHU=; b=i+UqzDURZEZbaD
	YgaWbrAHnpYcxetN8hIgL9vmpXlS9fXOGEVOLBo5NWfnDkIqHOBz1QsWWazqm8b6RnGmwD5n+HFzM
	vbGOHbKMy9LJS/LxMpuI51OtMG4WFc78blcWPcr8RRt5YWJVjgkBPfIkTX705dkuncnuxSP4T+bRW
	0Ibaxk1WAlz8NG+woO8RaPxZOJLNsIo/HVaji2mA1B6Lq8ZlPgwtfwFqi58KcHweoaGL8oUKJQc2r
	1G84D1NxBd0KLeAFvkEx068wHcPEl/z7hk/B/bduE0BEvzbKYkN0lWVFajRD/4dAODAZ4Vm7f9y5A
	Tkzbs5swBFw7KSl2Razw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DFS-00Autw-Cp; Thu, 08 Dec 2022 09:31:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cxi-00AhDx-Ut
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:13:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 840C1B80D67;
	Thu,  8 Dec 2022 09:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809B5C433B5;
	Thu,  8 Dec 2022 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490780;
	bh=zRX1WGkq5/5rOqQYIfz6c61zn3GcrYwh7ZPLZK+zvJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfiR0RbRNujAJ6K1X6TnXkZZ3/Zc948Rt6E/c2FoHT0/JlFXrz3mk8DsAZUVgbScl
	 LsLungth7n/AAli5J7gfhOr9cMB4UTifgzUBxMK2atbX4y9JGccdx80AYpKHjWWfz4
	 WiG2bIa3b//o8VZxlajkRnI4ckwQZebBmxf9S4vwB1aMXj8cH5EPTNtN+/nIHUow/3
	 fwvJ6sNYYhz0xUAZv5Ko8KGii7pPzH6T7FAOLLat9bzxBQuNRjT6pEYisMlHPCRIqg
	 dQCFtbQEW9qtDQ6OpFMrMH1ik0S3baKq5S72jYEiv+4WLpFQhlfpU4FSYjJBWgj48H
	 2mDtaPJ47KaQw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next V5 1/7] riscv: ftrace: Fixup panic by disabling preemption
Date: Thu,  8 Dec 2022 04:12:38 -0500
Message-Id: <20221208091244.203407-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221208091244.203407-1-guoren@kernel.org>
References: <20221208091244.203407-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_011303_200447_D5EEF66D 
X-CRM114-Status: GOOD (  14.15  )
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

From: Andy Chiu <andy.chiu@sifive.com>

In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
forming a jump that jumps to an address over 4K. This may cause errors
if we want to enable kernel preemption and remove dependency from
patching code with stop_machine(). For example, if a task was switched
out on auipc. And, if we changed the ftrace function before it was
switched back, then it would jump to an address that has updated 11:0
bits mixing with previous XLEN:12 part.

p: patched area performed by dynamic ftrace
ftrace_prologue:
p|      REG_S   ra, -SZREG(sp)
p|      auipc   ra, 0x? ------------> preempted
					...
				change ftrace function
					...
p|      jalr    -?(ra) <------------- switched back
p|      REG_L   ra, -SZREG(sp)
func:
	xxx
	ret

Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
@Andy, could you give the patch a Signed-off-by? I just copy your most
important comment, so the first author should be you. First, let's fix
the problem caused by my previous patch, and you can continue your
ftrace preemption work.
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef8d66de5f38..da59182cb5f1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -136,7 +136,7 @@ config RISCV
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
