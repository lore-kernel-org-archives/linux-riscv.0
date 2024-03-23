Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26164CD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84zG7uARsOGX14/cr5AWicDNQIeaAVbcJqjgiwOPX2k=; b=uXiSlSHMiSdXE0
	fgGBSvn3IuA3YCoqVJSaRcY0OAGcTeni+dQqBRnnXjmatGqeSWsgtk/LxHbcM+n/H13Z27VaSh8Yk
	jv9OvFgwwXzN1di0JmDKFjrVZJrO7cW1A5CuyQ+d46I29N79zRd9XhFjVtAtze0UhkqdN80jsBtA4
	Of7WNoMYg6/7Afn1rct7KYPEEFS9/QrIaskmGk6KkJ7Eu01I7ANwHcWHZ/rDb6X1adR7LSPpPskmQ
	B2hBOYjO2i+3xZiMcJEtzBIPA7ayS0BPNfhBSSo/sSR74xrYRwJisZcLzEww0VAkUHFTfpAXJjzEW
	ZrtV2NLFmcaY3cGeOt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FV-0000000AKut-1cdy;
	Sat, 23 Mar 2024 12:13:21 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FO-0000000AKng-21IA
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195987; bh=zZkfplMllcGZXaAHOpijHZhZw8UR9G8J39uQSbllctQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VEe9MiCEtSL6XIltfGKIjLdJxBdxoTn2ftxcoAjvNgs8mgWi6Hc4ZFvXfxk4qV78v
	 LMkqn9i5HrQSj9zqCSt4l3lCB1FeeNK+Jnl+q6QmuLUd0QeYaRynuZGVq6CL/Xo5EZ
	 0LwnexVF/dJ2+3cU7B8emJDUWlk4Wc9DSjJZJwy0=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195983tnrpaiiik
Message-ID: <tencent_E3E0973695E3306E5D4C41C84DA30F5FB506@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiexUNVyYWNTlxWuqPcHDTGFQ3bWaqzeOLy8Zyn+2kMxyOmMrE2U2
	 rhfI7jZQWix3KgacKtk28pjhwFUQiLgDzU5037aHSyAs3/RXqBbGThIBIbA/eGmP6hZW5fA4wjlM
	 PpH3YVcID2ZBakBIwLuuzMIuRXsdSOhoL5pnk1VRRrpdZHPDs9ZPKgIVpfiUKKu08OHqweEWQcB9
	 Lq4Q/nSvRQoCXqrv3KO2Mp3h601TscUSkhdj9bOjQ9piDqkZXasTuxgbJrIm9veGmTtvT19fKi3P
	 c1BwQevO35E6KGoeX/mTpfBkgIPiRqw79j2iOLtEU3WRGDBTOvspZ2sQYxJkGvkuu4BctknDajTO
	 wvl+Khec4apVpV3fLqLJZAL/D8LhjN53S8qhS00UJqLmu58Qlx8jprnY8Fdme51PgvDw15VtoK3a
	 Vmvt29QUZpVkqDQ7lAJ6AyeiomaUCN/yxQPgSQ1KiNPOes4Je3sHfJFyT+QVPeYKUofZztCEJY94
	 yAOmAUUVFzVBU9h1VmqgIPWZ7kNT8U/cZ94jqXGhiUZncNpFZNjqilFKkVOmdgBvLMA4MkNItQLW
	 pVKpZq/abV/uyxTK5H8b4IpcH9+nYJ4Dt6vD24GXkmvZfaLXkYjAWlyNIi8J8/FaPPGkVD3FpGj2
	 wmxXzV/cBctc3lEyzcuTZHxdRjNzehljX0fewMO8WN/qcyMqBRybfRlNUF9zs0Pl57OeMm4Akifi
	 RK1h54ASYwhVV48x3tfgcW6ub21X+xz2uhhNemVFgmk6zxASYR1TWYYn0+rI7YQLb5mmQSXWzCTN
	 dlKa+ZC+qMmMBQJa7lDKmsRDxzSV1m0aaKcVMaMVPmCU7KUl/fYKvlCrAiPO4m3fuhLXBngJiBOq
	 lKoKaYv7t4vvlRQf8AOyjfB1cEljZwGMzu4IR9tIj29vrCi3cQaFoc1UVAkGtRY5tFgTZuyFG8Vp
	 lSqT3o+LCj5LY/WC9Ak0M73eRjjQkb3ObLk+Z0zU4TG/EFMqxFVbC0A72qNhar5/TyLolEi2TZMm
	 r2+9PEpn35jlVcVI6AUQ6CioywxOo=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 11/11] riscv: config: enable ARCH_CANAAN in defconfig
Date: Sat, 23 Mar 2024 20:12:23 +0800
X-OQ-MSGID: <20240323121223.1729328-11-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051314_976724_8362E00D 
X-CRM114-Status: UNSURE (   7.55  )
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

Since K230 has been supported, allow ARCH_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index eaf34e871e30..1d5524cdd47d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
