Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A008ECAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kunuHlLkp5fkEftwGYcE5OTAz7inu1+OO2D6Aq5Tjcw=; b=1CwVOmrKq1RmNl
	41SsTVphNZBK2/9OcrErm1ghX/HljVCe836ayrqgJX4QhdHQ9YqcPB6x0FdGpVCVTY2coyLtiatdC
	jTrCM2Wxxgn1VdpEr5rE+SV4jIi4VTTE9PoHSQmHk1ypImwQnYOMNw+hRsvbsKrDG2ZdqF1HQN1xA
	tnlZ9t9rzsimSC4Hk89cM7V2D6K7h73g6jg4bQ8LX9kFsxjywmocCHrUQcZm0BNliE0CYWo8fugFe
	zSTVTMBsFM2CuDtaExClEDF8RS5/4SxXlM8FegLNUptq/82ZWgL5KnyCFKbqfx4S+gs00D5uD5Vyd
	2+bW5QA9ksx9vU1wkGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g2h-0000000ANSO-3BLr;
	Mon, 22 Sep 2025 12:53:19 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g2e-0000000ANRz-47ya
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jgY/nh+y15BHifMIdd/REVh/xjQfAOjh4Euxvg9/japqnXrHsMFjJNtmY4kbR5VViIS+WFg6NnwmEzGlznKr5ltLFMAne/yx/x/ju0PwFJ9xkOf2K+jU+9utYmHc2UK+BgQc4Xdj4uIs/XBty6AEjKzjdE8G0opFt3CoznNnkFs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AzPN14CQDR7GdRQ0bhai+yzKrO6MX8eixNS0CyDzQSw=; 
	b=KOSj9WRsa1UXmbZ+G76dUmSTYlLLOKHu9hy7llxigbXpFPyvNxBLp0G9ftJo/e/owcZsunNu6nRwRJyPx9ZTzqR9/oULRtFfgNtsJq4d+2iu+36PzA0cQZa5ceX/AXEZaZglnGq1s6vplcQ0QFDd1CNqc3MgJA8DKStWkTTAxJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545593;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AzPN14CQDR7GdRQ0bhai+yzKrO6MX8eixNS0CyDzQSw=;
	b=GUXI1k19F4CAQyVtn64CvRfK8Tjy3w0yvT/1MVsjJ/+RV6idbXtv9zwa16/GN9l8
	4w2Q0g+kqx70qgZdpDzaPhkjULwe6DHSPKDiJvQy5cxcSf+fr6lUUGMvKrKyz87+W3Q
	awwpI+BOFAAfCZK18ASby90kbp4x2VIrCu4NcU3g=
Received: by mx.zohomail.com with SMTPS id 1758545590809698.9443345062982;
	Mon, 22 Sep 2025 05:53:10 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:34 +0800
Subject: [PATCH v2 04/11] dt-bindings: timer: Add Anlogic DR1V90 CLINT
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-4-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=942;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=eOipe/Sn3bAQRsqRp8QLAdpWF4T4V+UpWtlRriazdjQ=;
 b=CrY8cXYflx/6y2PKSggRYQ10ZFL6WXY+/pfriid5c3ignGpySBP7LjeTaLHr7VKhMr5ZYQqQo
 P162LLEh9+/Act4TqmuC1+o9dlar3XlU9f6OyiTSEWNmSzvsA6BCnU2
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_055317_086814_FC8D6BA4 
X-CRM114-Status: UNSURE (   7.98  )
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

Add CLINT support for Anlogic DR1V90.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35dabc0aa202475b926302705c4cf1..16b8c0bdce82a55765046cfdc8d1f85a8dfb3912 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - anlogic,dr1v90-clint    # Anlogic DR1V90
               - canaan,k210-clint       # Canaan Kendryte K210
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
