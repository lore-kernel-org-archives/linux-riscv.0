Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F952EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuH6AY7NpmOX6XXw2p8V2NGl/IajcZWRgnqrgceyE7o=; b=vnbWYQQpnIQV9x
	wnTn66IsnRyrC8xoCSSE+MsVT9mZBw28TZ7hUmiQ28UsQuA3KuWJAIRIbzMh/jY1OCURSW4kp+zJ5
	DSmWJ3KmvacBfPkCUPVbWl98O8gTqm2TCG7VpmpkyEcuRNKYtshmr0JKTugBZeLHcb3pXFjqdQf2O
	g4aK/ydjMPtBe96Wb/sRqojEaEBqYUFhkpZteWxdzUYiTOsh7FeBJIS4LV+GTmsvuxSEXkxvT1Y55
	19p0mz8pIu+Uo9e9QiqngXSbkLCp0stMqr1lxcbDsBJmISOW/UDIXht8YvD2fT0oZIQpBV12njWTe
	rw+hTOykAtneKL2BqETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHH-00A477-0a;
	Mon, 26 Jun 2023 11:21:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHD-00A41i-20
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778459; x=1719314459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7P2ZuLVh/mHZ6Q4BNnYCrGzK8DdnxNYlyk5flnLKkc8=;
  b=cHILVaRVQrQNiHDtUFoF03bPU/H0ALPdH5ddPJeHTTAINhey0zBrvHPW
   jndP+ArScGVRvef+FSgBu5UV7rrhiJPv+94TlJPu3UmGJZPKgwfCQ8jsZ
   n61JFO8BOxEuxr2OAPE96dWdOkMZI27X24VzjE1q/37zkKy7c6p5IkhmI
   xVO0nLJ+c2cVPko7yfazIPhMOzf0PHFsXyXGVTfTzr7NxB5wOeFrnooE0
   fyeL3crlOc3H6ULV7rNqZH6rBZ27KQuT35NGotXDUTHPfHXjoV8ZLAlYH
   kUuTfD/8jkdvL+uDF8wbRwCpFftqOEqQzHufy9r0sJRtAFcb6XtKmyLeb
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="232170783"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:20:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:20:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 5/9] RISC-V: add missing single letter extension definitions
Date: Mon, 26 Jun 2023 12:19:43 +0100
Message-ID: <20230626-possible-poet-ae4afce0a525@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=7P2ZuLVh/mHZ6Q4BNnYCrGzK8DdnxNYlyk5flnLKkc8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS/xE6xX23F074e9rMbcVQp8tu+YXyBy/sSt3+qSI3okt tbITOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR//MM/yNNa9dwJvmkacy1rj2x/n MTq7zVA7vpn1OurJVwNg59fIORYWPFuu+zBZZ/uTYx+h7/2avbjWesEnSN/tA/+ZyoyxqzcywA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042059_660869_2267E10C 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To facilitate adding single letter extensions to riscv_isa_ext, add
definitions for the extensions present in base_riscv_exts that do not
already have them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 36f46dfd2b87..a35bee219dd7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -14,12 +14,17 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
 #define RISCV_ISA_EXT_h		('h' - 'a')
 #define RISCV_ISA_EXT_i		('i' - 'a')
+#define RISCV_ISA_EXT_j		('j' - 'a')
+#define RISCV_ISA_EXT_k		('k' - 'a')
 #define RISCV_ISA_EXT_m		('m' - 'a')
+#define RISCV_ISA_EXT_p		('p' - 'a')
+#define RISCV_ISA_EXT_q		('q' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 #define RISCV_ISA_EXT_v		('v' - 'a')
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
