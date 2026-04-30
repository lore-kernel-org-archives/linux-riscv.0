Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427CEFF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdKgXfSTarKqbFlWgkL6/dqnErncAXaGtFglleigD1o=; b=RAUS3tvwdcsy18
	BP395Tg4Usd1jndjmCwpV/CTLREfmEE24Hy2zs0b8U392C0IL5rqJpjbSm5QZwKHcLY7OBwzaIPgL
	cn5AzoHB/e1a1UlaNnfxpC5pt5cdatDH7KkHm7uNzbOfW3BUIsfAlAFfFqU1o3rHL2UjlLsrYL0dL
	+MhsD7mi9Gn3PNIcuau8qap/ziMRPR64L0iL9tx8uCwCQYcP+1/MxaXc1VNsFUwmeQp94ioX5GFmE
	Z6dYuxP6a6pXl9Ud+E8zYOB6iE5OfjNsZlf2v4iCzYBFBZXGhBWVLzM5BhTKBffntA5rBebAhCcii
	asyU67CUQFSD4uBGdDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfk-00000005CPT-0urw;
	Thu, 30 Apr 2026 10:31:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOfh-00000005CP5-25g9
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3E043830;
	Thu, 30 Apr 2026 10:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1CFC2BCB4;
	Thu, 30 Apr 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545065;
	bh=QJ3l9s3WRH0yxHRx/NIafnOMgM2A7S6+psCcSgpfN6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NnqFYq25pGo/VPzFfdpzHdzYlZeqEzFG2P1obsx6PyWS6zGWijOpXPwFJAIwl2cP9
	 tbECcUYRuHW5FhBbPwYc19hYSMmzRY3TgdNdXwbhm5ILN613etBRLZJab+mS8PWxDD
	 TuXP2PMhVc9Qa8R9Xvq6VSYiamcOOyYDfa8Vmssc6yKp0RBshZG0HYNJtxnPKjuX/2
	 QH5a/rvz73TgSQRkwZ3wTt2dtxvwLTMATVeBaGiCdMB/FKSE9JSi8wZ1XIVDfC6Ncn
	 OmZyZ1HSwja6jPm3a0Ndnt3kQoHyfkh0OU/WQctoiqLlDcE4M4hcTG6hedkQ8AG6FT
	 ti+eeEkLWJahQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 30 Apr 2026 10:30:26 +0000
Subject: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
MIME-Version: 1.0
Message-Id: <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
In-Reply-To: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=dlan@kernel.org;
 h=from:subject:message-id; bh=QJ3l9s3WRH0yxHRx/NIafnOMgM2A7S6+psCcSgpfN6I=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9SSIqzEuSPbtUyWFait1k7Ip757U8OyVpzG
 t+X0JrAYvqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2Mpg/7B4iSJo/BrSyeWdPkixvHCMSvye2WX+yY/meFPbYJ0W8qrlsGwMCke
 EMj+Rrhiz1tHULVm6H+S7jPCFvCDMd3Ryp8oad/An4BEBrECfpqTjl9UKLpFoX9GbU7SbiYh6Hi
 1sNZ807E3wDXP+W5+i4DSX83qH7pRflD41wm9g4rzmCA7msr8dSjJLbVFDWGuYrYiOd0y5m3uMb
 bDokkeQonPIexstW9cQ37IIBi2qt2y9bkiUerUMOUl+QvNhWctU26m0TljWka42tjyMyKTVpCR5
 RdUA6CwzvhVNhphZJy+ktYDNwesoFDnqN/Gub2R/1Wjr8ONQ2cH9MxHBxjboCHGXmIIyZqR0u2s
 ssZc+wO8KjfqTQxc+yDBC604BSWuj1akNTZhntx64pPt2FUQsKZj5+ScLrpNIxzbxzIIZ4E5smp
 8oM5nqNMKBIHU70iURQ8Y1gtgc8RB7hgmPXNxrtktGPhCMTv4CrYg6b/9fnPvdl8pBwEwr3bI/U
 MaPekx9ZrFh4JlzPvo/fd0V2y2jhiRwQcCPfncaMy3GiAhoHDcTdaJL+T/DPo6Zq4DO53Bpf0SH
 YviBuQJ+8UVCAcuGlSL/ZpNebMx60C6VnV1x7VYKTRKbhiWxdD4pTPSSnxOaJYRfH6qAG8Kve7v
 t9kOOonzcx+Zkz2RK5dPR11B6IVJtc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_033105_566965_F980CC40 
X-CRM114-Status: UNSURE (   6.89  )
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

Add clock IDs of PCIe DBI (Data Bus Interface) clock.

Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index b22336f3ae40..dfae52547cda 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -380,6 +380,11 @@
 #define CLK_APMU_ISIM_VCLK1      86
 #define CLK_APMU_ISIM_VCLK2      87
 #define CLK_APMU_ISIM_VCLK3      88
+#define CLK_APMU_PCIE_PORTA_DBI  89
+#define CLK_APMU_PCIE_PORTB_DBI  90
+#define CLK_APMU_PCIE_PORTC_DBI  91
+#define CLK_APMU_PCIE_PORTD_DBI  92
+#define CLK_APMU_PCIE_PORTE_DBI  93
 
 /* DCIU clocks */
 #define CLK_DCIU_HDMA            0

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
