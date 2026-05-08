Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14666CD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdQOQgmhHLAOPnxli/xm03VOYFcZk9nshQUSn4DowcE=; b=v7QK/xcBV9R3mk
	RLioqv9cLxpD/L7pm48Dnw+JeA3AvQF3FfrcIxRLg5vnLJ0peKMG+4D4qCUNScA7aSudr19F9ZR6A
	SJZ8IYAPL4uRKYTZMMHJ+iI92uJUJn7B7JCUzoPhmXt1r7m0GfwwDvQvrsuW4X3VTnsEP/8QmcJic
	hsKX1wrzyXkovU02sNT9dej44vzpZcuabvHwoGQqYSqAdIkUQJwHtcFkURI1MrIU2Kbn9BjVUMcaL
	9q7OWKGLdGozrAww1kkkxfS6dzIDAFCA0O3u2PH9NAXV1izC75l1gx8Hxc7C1gkqIw0B2JJVb/zLM
	jv2nCfUyQI7X3wOH/ADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdE-00000006Nht-3PiR;
	Fri, 08 May 2026 11:44:37 +0000
Received: from mail-dl1-f65.google.com ([74.125.82.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdB-00000006Nh4-46pO
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 11:44:35 +0000
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c1a170a50so2649572c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 04:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240673; x=1778845473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzCHDRov5czdFb4E1osJ9K5lNOkGAu52SXuGZ3RLxI0=;
        b=BN+/K5H3cGxZpW9eRbHucjPQfRKxiGtfPS8X9AwuTSo9PAp3G2lfS7KraaTfG9Kz0K
         d80oe3H8SSagsF4/p7qRpAng2OjFlykb2cO9n9thSxhdky0OmYztGN+5hlot8c9xj4GV
         EqNm4IkQWNTUM8QEVyhF57WaMgbtah5sXW6LseVmM3q3gbRyywnx7boSZ8y6q3VCQ/AT
         TNmM6Uv5aZAlLeIzYPushcdFAB079r0AiTj425+J0/VFdJCkbx5zgOtIvx+wRHnnyY6C
         d2YoCr5PRSTlV2ix7AHTzPf8ddW0Q3jOBH4VPnGKKg6/np1ycN8ZnJqO9/msLYD2H9VA
         pWKw==
X-Forwarded-Encrypted: i=1; AFNElJ+jXhEFzuTuZwQ38fxHOnLO2xVVX+EDNRW92Kzu9NTJndW0bhZ2C3aXUDQCmXw20ydHjweMJa9hy427Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbHlmBO0FzBVw0jkO035dBHVxpLR8fLA9D4QshpUFpbUTGiVs6
	d+yVFdhXjmJVDnLxSN+1w68STY41/s1DnUumj3fgWvL200ijA2L9UUIM
X-Gm-Gg: AeBDiesPUqooLyL7fIidgJu/CDP5tG1Cb0bvYKnyc4qg1UmtS8bGWXWNFTmkiZr6gY2
	if1xHwVauU8AETWdogmpHa2i2IWsG2d9b9s3uHDh84Le9yejA995OfoGVBSPmTiyei41p01i2r6
	lmDIaSUeKxNaJyaqzTzc+w0MsYYKt5ufMRu5FMKYGV9DrnULA8bFJGB70rC9+uwxXwLwe+pEsus
	byYwnx1HA3UHfITf23HuHUitOJsqee970xd4K8xdJJ9kF06um3HsNPh6j9UNFTddQQyI1yqZAw1
	iyA36HtPKZ0P4SUXiDrv7s8ZcHv9GM+7FPRee2Z5/IweA+lZbaItpljHfdF9OTAdlGL2bSXGH1O
	RRqz0rYUgM7edrmo6VubeZTJ9WdIfXD8Sat3G5tSYiUV41M+a5OpaEqkVTBBnrvK4419S4bib0P
	Tp8pCEV3MxQ8VVEZuboPylH39YLEqhiOs=
X-Received: by 2002:a05:7022:6986:b0:128:d450:bc76 with SMTP id a92af1059eb24-1319cf558b9mr5748384c88.26.1778240672982;
        Fri, 08 May 2026 04:44:32 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:32 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Date: Fri, 08 May 2026 19:44:13 +0800
Subject: [PATCH v2 1/2] riscv: dts: thead: Add TH1520 I2C1 controller
MIME-Version: 1.0
Message-Id: <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=i@leak.moe;
 h=from:subject:message-id; bh=LOeM8ihnb36RoLRaLOifM2tLinrlgXXEyl5wwuq/3u4=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyWGYB8TW+I2NcVqCYJ4tHDII2NzJeRB0yBz
 vpiduMSkBeJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MlgAKCRDSEJKs904I
 kNX0B/9rUHxQnv/AqrbV4wDZFW21lOOUuhYE4jYWYDT7RH/00N4nFru0RlDLNdUzAkwhEFoUyRf
 Izl5kcrN6hh9LrPrdugc+ZMu4cRG3CrR/LhF/5Dk6mvVFxBkpo3yH4jgTQ6rPvwpDVSAQP1VpUK
 UyXKBLUH2b/Ltrtzsntm9uunPKL6EGZ9ashu5O3aXNyvj0d+Ei4mrIlTp3j9ibIfll6RpspYzqO
 rQCxrUlLRSzEbae3fdjmRIt+98uy51vP2vQT1NCFcg8bWgrjJsoE0CFg61rdYieJxR4vHjNzc8q
 5OfwVRznUPSuD3Ford4A26zBZLD2IGElIzbN/Q+IGIqQw0ye
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044434_026215_F4F007FB 
X-CRM114-Status: UNSURE (   7.49  )
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

Describe the TH1520 I2C1 controller so boards can enable devices attached
to that bus.

The controller is disabled by default because pinmuxing and connected
peripherals are board-specific.

Signed-off-by: MoeLeak <i@leak.moe>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 5e91dc1d2b9b..94932c51b7e3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -411,6 +411,17 @@ uart3: serial@ffe7f04000 {
 			status = "disabled";
 		};
 
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
+			clock-names = "ref", "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@ffe7f34000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f34000 0x0 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
