Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50749CD129C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2ApldK3eZgeHMlPbJw1iaHde3QZtDeONihGA5IaOds=; b=zMbZa4t/pzsGlf
	w0qkyhoqdCJweMduIHJtdle/8Hpm3fH0fylYRciNs3uXh9ou7lJsz9bnky72+1Na6txjtglSGIyKZ
	fesc2pznD8PT4vXYg8IG5uQuLh1WqieBgkFsLLfCqHqI7a9INMVOLGrdr8PpDe+wswxVLmCsdSbkU
	qZ8V+Yrg2iqOCPE0nypfrsq+6nxoy6BpbIMe5WfnEKk2aUz9rBLfHjkWEqqOctn7zZMl9S6v6OVyz
	y7A0wycV0OUz3+y8Ctvf6vmyTzVsQrSEBWM5UtReBn2JA8NiTGBPJozb7PJjO1UrUPHUxh2MHXMtG
	9xJnMt/dWAhEDrE9O6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lh-000000006uT-0w7V;
	Wed, 03 Apr 2024 20:36:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Ld-000000006re-1wm3
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33ddd1624beso129683f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176599; x=1712781399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSGypoDfqpqf30JRW1cSjKb3kn4Y8om8katFtm1k9j8=;
        b=UhIe0rx7Dp42bMha+85u5fT+pR7Ar/Czmt+c9xoMJ4C43UC2HCsAGG2jd4IAqdgwQT
         XGEMAgjDRK4jzJkbkq/ybrTGv8yADVno+FoVMCWth8WBjwPg3LR91Gw1pKZQIzSZQ2Ku
         u8di1o3I0keWJhiaJ9LPF+cKykRXuwqLo4oLqgOKbsWg+VHlYoYwz1ZNO4muu17mqVlz
         H8q7i8+HHNhdQYdTwzy3JnEMsjx4EmSWXBzHI3rYCSwsUUsdpYMXM5GbLntdxrXNYg9O
         RMiTTSOsskY2sWnc2FcnKloFuWVI0aaiAkZkNWthD/Dzz9l9KalX1zSqpOhTTpYb8gO3
         KSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176599; x=1712781399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSGypoDfqpqf30JRW1cSjKb3kn4Y8om8katFtm1k9j8=;
        b=tynxTDBdFjwN0nonfuiVjH1TKrbhpW0ecKfRd9T+fIfBIRbb79h8eGZUKefkPDlbqb
         cwtFwn6ilj7r6tn3XQVsvf5TIJsMftAExrFxRgquCcmC8O6lxrKAT57NHS9vznMiQx2W
         5Gwi+nzNHm/NfYTpUJq2gk+4jrgA3T4efvp08Gjvqni3K1jQ5YNiwJMCUpDaGLHwFURe
         MD+HwDisx6coPkmFocBNAk9BRQHiaEtoNcFrAq22v8UUjvvozcPZhyaZOLqQ9j29Q2Ij
         dN3c4pqt7av5Ekcdw0qu0XmIrV/CgmXPRs6nrFoCesGWeL7ichjIaDzWb9dw45jDoh5G
         ly4w==
X-Forwarded-Encrypted: i=1; AJvYcCV7OGrLQJQ6vEJx37Z8JuCzzL+/Yuq4VFTa2Hi1rn7P6yG7HIY2D0VWIj8k3bCzJSPU9bBcrgNpv5iDpD1IJz0jwiMFSSN5VlT9lLKj+9PK
X-Gm-Message-State: AOJu0YzSf6fOzDNZ6Td1cgiyCZMK254ncFHrbfCokKqKZm+CBnyQbsXG
	PXAFlpd3X6v6is5wTkBoY1JVTbWSA0ol03slHrADuHVmKCp4l4iG
X-Google-Smtp-Source: AGHT+IFyZ/P7OD6dXKo56fesVxWbcmlAoQodU4rrW7wCYbFjzNMLINpZAc8FOrmJHkASHxkvyr9Gjg==
X-Received: by 2002:a5d:5447:0:b0:343:7f4b:6da5 with SMTP id w7-20020a5d5447000000b003437f4b6da5mr2931617wrv.17.1712176599471;
        Wed, 03 Apr 2024 13:36:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt properties from ETH0/1 nodes
Date: Wed,  3 Apr 2024 21:35:03 +0100
Message-Id: <20240403203503.634465-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133641_541938_84D7F6A8 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Now that we have enabled IRQC support for RZ/Five SoC switch to interrupt
mode for ethernet0/1 PHYs instead of polling mode.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Included RB tag from Geert
---
 .../riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 72d9b6fba526..86b2f15375ec 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -7,22 +7,6 @@
 
 #include <arm64/renesas/rzg2ul-smarc-som.dtsi>
 
-#if (!SW_ET0_EN_N)
-&eth0 {
-	phy0: ethernet-phy@7 {
-		/delete-property/ interrupt-parent;
-		/delete-property/ interrupts;
-	};
-};
-#endif
-
-&eth1 {
-	phy1: ethernet-phy@7 {
-		/delete-property/ interrupt-parent;
-		/delete-property/ interrupts;
-	};
-};
-
 &sbc {
 	status = "disabled";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
