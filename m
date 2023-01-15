Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F8DC3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nB0NFzaIuGRiR9ujWI8ATW/QrFAhQDEwBqY9XZADJYc=; b=wpieayLbg4wvIa
	ZsQ1cSuNX2WoS9B9g/UOEGIegVNidIcBqXiPNbLPbk4jCccEWc9TH50EsbC9hr8Lph0JZyXaDi+TS
	pSi3sZBcx8p2gdrPNmcNzPCxuCsLdTqhVGCNFfdB+EU0v9VHHnqbK59Hykkvj1fod4MOjlg/eBOhT
	l1sOaxGAlfuBwHFRJ99euiUlTQ5SxsoXYCiac3FLevoDbhDlq4wS6zLFMmZ+1JpiSY8UgM0LPwtVH
	naZSwUffjaTpJ0ou+r0rxJ0xO5NyFW7Mw/X97dsaZI9UzmnSRd7/xRs4MY7V8ZzJSGf+KSl3OMIbg
	a9ZBBUR4dZXmGfRimu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5R7-007c1L-VM; Sun, 15 Jan 2023 16:00:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qy-007bpu-K2; Sun, 15 Jan 2023 16:00:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 14EABB80B57;
	Sun, 15 Jan 2023 16:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4123CC433D2;
	Sun, 15 Jan 2023 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798433;
	bh=a+5QZf9cRg0N2ZzfrrrGF2H31LP1zc5XIp+raVH9xP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eeATq3GeOjDCnHtOuIlblgyo54bNCI8Be+rNhdZO3EH1ekeEJDMyGH66ChnMB+NWj
	 I+ZhDDI8WeAibt7FSddSrGJuVDOdYgIVjVL8tfnyZ+h5JWyxroyMQOMIqrxpE1uO2Y
	 l2EGhswWLUQM0+iDWNaX1hM7+KjMIx10mq5JVRhs7x+1iVddB9DLhpryCAsh+XaSLB
	 tLjBCyWIXEpy8OuKgl+/a7qYz7DgQeJ9ssf9IosOGNqVsevHbCxuqLhCqoUSa1PveT
	 mO71cZVCTOxn7pDzuJKFU4seP2uSYCYyx0FJS+EdPP54bTlJBKtb5jyz8lqJa2QIEh
	 pHrgbTj3v8z7w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
Date: Sun, 15 Jan 2023 23:49:47 +0800
Message-Id: <20230115154953.831-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080036_828602_23BFEF7A 
X-CRM114-Status: GOOD (  10.28  )
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

Switch has_fpu() from static branch to the new helper
riscv_has_extension_likely().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/switch_to.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 11463489fec6..60f8ca01d36e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
