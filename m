Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F4DC04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb8dfX6dOSU+7f/t5HeUlyYm1qvu38FemZr8Q8tB8SI=; b=yirbCHdwxIbubc
	Q3HEq264s24YjjXciihcZ16oancutygnbgPH1w1mJDPrzyr4y3cNj4iTpr8KMnou1swBx5MKSdd2E
	1fRa7MfvNSyKI4FLB8HZVr8Uaz/0MRFJ9fg2QP78sjteIdrnUaMEeQtz9jMJaIBmNGqSn/Eg/w6Nm
	ruDr4tdc84paDuH6z1xVk2fUxleT3ZnooFF8AlCdV3N8gUoLw48+m29fu2WmgBSNU7o9RLRhaZl7+
	dCNiVauMFW5y0Q3YSni5AMH7YQEayXuyIHWrHfEGAKk9+t+E9+uvWXvR6b/AIdcO7r8JE9Yi4v/AN
	efy4sjTHx/NFs6VLqdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsW-0000000Fy67-0lDf;
	Fri, 12 Apr 2024 08:03:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsN-0000000Fxyv-3io6
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNPGi/LJLZ1f/UWkNAkdI7gt1aIfJVZxqk0hEY+zuuE=;
	b=GOY+tHJ0cCNbo84p0W8gYe1eCEVr6KXXXIG0ITrv3NgsfmrxGkczM29r1zOamYTUikDpY+
	IUl+o1feTHhnx3sXhn4wFOit8kSv0jmc2NtKzKXK2fel7GuZWoakp6/6+Lij+29L2Hy9bH
	OW5owUMbBd2NEhifiAz8vLSTt19gYv4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-cA0wPUf2PPKMPQL1oePi2A-1; Fri, 12 Apr 2024 04:03:08 -0400
X-MC-Unique: cA0wPUf2PPKMPQL1oePi2A-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a6f2c7c1b8so375939a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908987; x=1713513787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNPGi/LJLZ1f/UWkNAkdI7gt1aIfJVZxqk0hEY+zuuE=;
        b=eF0Z3Et/bS8TyiKAqjFpgJuOloKsBttEkngdM8S/QSCG7l0vy5ILp0xTi4oCX7hO78
         CEFKSAphlKa+jqkcp0JTuwUO+upLTkosuwranFrSSO0Pk5lIHUn7qMbKNza5/P7H1snc
         R3ub0mpJfBggmgER+U1F1Hv8xb9ptN7UCjsbE/0QVLvzgt1MDG+PU8w8KnZ3VnTdzAXF
         qZDodYvUE/w8NEWGR6HmLoIMDlAOu5RAdSEH4dLVCQ8SseM0A+bvmJppkDyyYVr1rwer
         7XNVnxplmKesXWUd1EC81nsR5pTfDve4B7Tyy8FDsxY+5MGyQrHPa4ktRc299Yc6oBeT
         0cSA==
X-Gm-Message-State: AOJu0Yz9rwvjKdfkmtTf4fF/gLNwDuwciZtfVLpUpUWKdZTb0NjVd8AF
	Cd1Nii8GuLxbAz98xJBy5jYgxmcyBI4nCUCoE1iPfsoGCxtPEmZUF4TQN7rhczr5IojAEYZf6Bj
	oYZStFI++4aRfAlZC2pP2fz0oW8JlwWm11BIrjXv4Jp1XYEB8ePQwmZiOT1sgvGZa7g==
X-Received: by 2002:a17:90b:3597:b0:2a5:5334:e223 with SMTP id mm23-20020a17090b359700b002a55334e223mr1616967pjb.24.1712908987688;
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXR+HX46H9j17BcJJXoxM6E1KRCiVCkfSB10IGeNquAnS6am5GYCSSbFBeb4H+vygzWBIgQ==
X-Received: by 2002:a17:90b:3597:b0:2a5:5334:e223 with SMTP id mm23-20020a17090b359700b002a55334e223mr1616944pjb.24.1712908987375;
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:03:07 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 5/5] riscv: dts: thead: Add XuanTie TH1520 RTC device node
Date: Fri, 12 Apr 2024 16:01:47 +0800
Message-ID: <20240412080238.134191-6-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010312_070575_E895DFA4 
X-CRM114-Status: UNSURE (   8.13  )
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

From: Wei Fu <wefu@redhat.com>

Add nodes for the XuanTie TH1520 RTC device node on the XuanTie TH1520 Soc.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index cd6bc89a240c..62e588dbc942 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -463,6 +463,17 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		rtc: rtc@fffff40000 {
+			compatible = "snps,dw-apb-rtc";
+			reg = <0xff 0xfff40000 0x0 0x1000>;
+			interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc_32k>;
+			clock-names = "osc_32k";
+			wakeup-source;
+			prescaler = <0x8000>;
+			status = "okay";
+		};
+
 		gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
