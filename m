Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C126C07E97
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zl8HBJtotVGd/xaw0q/EjqxpMKX7ErN+OGGy017U/IY=; b=ykbLa0PJW4U907
	9XHqC6SWu45qB52ZjXtTfFxuJudzdcKoHdIJeqVHW6rrveojpCCGohLivJpXK0KJi7szwkmfYeFSE
	MOeoIcCH1P3ISv1634nspn6JpsIPV8c9vIly681Tpd1ATTWTSc4XY3/oZg6+0zXJkAEdULiDd31z5
	MDdA2vcY0kvFQ9lScCpDfDVo1k/JAhmGw2cgJNQer+H0xnDoDvcLNP/n1N+DmYbWS2dqphlXA11lr
	AxWMI/XGf56kBKuVUZwbWKy+fANRfyfEly/lEgdaUqWuTtqqTq2j7j+LDJ1GKkvS0HH2zBppmAA+R
	P2KMK5JILnur8Y9kjtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXs-00Gh6c-0Y;
	Sun, 26 Nov 2023 23:28:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXn-00Gh2U-2H
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:09 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 78A6C3F885
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041286;
	bh=UTWv7B0aMCLXIjGIp62HkL6y/eNl9IP6Uhar24MKibc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MocMhaDotGAeHqTwO11kml/FOxZkPEUMFvUX8JrPx85W3/gTYP2eK5dwI0vYTIfLP
	 nc29XfQ8UVOQP8YNI0RBVPOxBgqiwpu6bVKSM1p4zq4isdjsU0yIP3QsCeP/75iCvM
	 cukL9CZ9TI1+JXp6/7e15eui6bX0jQiX98+y5lcDkm9sDudGXMp+odGcUaUMklhIlg
	 t4Jd2LQIaWi4gmLh8o5gDX7yegpzAioajjqVboPJBCaDs6fpIDzZnNR5j8yn16NH66
	 mY/UkPWBKtWK488JPcnPZ9VzGvslnmWeDOHg+h+tfHP9r7zHFYH9dlYlEzjMEKqvnx
	 CW4LnUlGFyl3A==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cfaeab7dafso18348525ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041285; x=1701646085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTWv7B0aMCLXIjGIp62HkL6y/eNl9IP6Uhar24MKibc=;
        b=BZEca0zY+dQpPvDdxiAQPtDmlA8ZNHZaviXE/i7WZLLcH6OdMfKzyE0yPYPfKczMJt
         mNxuL0PM7PYvHs//DRyQcsNMEnyB0nJmMg8aFo5giG812m96TWLprP+P5ifSlV9kGxsF
         dEjCaLlA/SjpHbXkAg6WPSsOdrEi9SrFv6959hQLS3avA3Z3ux8kXSy9+4v+FUJzDReJ
         BQaaPMN/Bi3hyB1q82rb+HO2gNpboFncfYVQ5vAKIEYGEY6O293csrx7QHEzFrnvGQf5
         BfYWSf+F2Wu586zCiVQV0KIxbAPj155jqj5Dv783RIeg1x5UoPG1TuTdgs6aucV8J71d
         TWqg==
X-Gm-Message-State: AOJu0YwiYkV+vaMlKAoj5d7CuSxx3Fczua3OHnH6K4lter8oT99ejkFh
	LdB8FWZgye22DaqyUnxEOfJZ/FznnZiYGETQFMDTHHLe4W8G5kUbZp8AK3pOUsmKFuo5z4OaGv4
	Mpr263GO+Rhg6/x110tTEYHLxecgLcEgY7p7xrGma7MU3yQFtTUwqqw==
X-Received: by 2002:a17:903:2308:b0:1ce:6312:5373 with SMTP id d8-20020a170903230800b001ce63125373mr9452862plh.0.1701041284719;
        Sun, 26 Nov 2023 15:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE43ssElCwc1AHbafPfLyauBD+DF8njBdZmf6dkxFwE+D353fKdfdo6BtPGfyggI8uwjzzEag==
X-Received: by 2002:a17:903:2308:b0:1ce:6312:5373 with SMTP id d8-20020a170903230800b001ce63125373mr9452844plh.0.1701041284377;
        Sun, 26 Nov 2023 15:28:04 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:04 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] riscv: errata: Add StarFive JH7100 errata
Date: Mon, 27 Nov 2023 00:27:39 +0100
Message-Id: <20231126232746.264302-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152807_879255_AD94EA4A 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This not really an errata, but since the JH7100 was made before
the standard Zicbom extension it needs the DMA_GLOBAL_POOL and
RISCV_NONSTANDARD_CACHE_OPS enabled to work correctly.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Kconfig.errata | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index e2c731cfed8c..692de149141f 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -53,6 +53,23 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_STARFIVE_JH7100
+	bool "StarFive JH7100 support"
+	depends on ARCH_STARFIVE && NONPORTABLE
+	select DMA_GLOBAL_POOL
+	select RISCV_DMA_NONCOHERENT
+	select RISCV_NONSTANDARD_CACHE_OPS
+	select SIFIVE_CCACHE
+	default n
+	help
+	  The StarFive JH7100 was a test chip for the JH7110 and has
+	  caches that are non-coherent with respect to peripheral DMAs.
+	  It was designed before the Zicbom extension so needs non-standard
+	  cache operations through the SiFive cache controller.
+
+	  Say "Y" if you want to support the BeagleV Starlight and/or
+	  StarFive VisionFive V1 boards.
+
 config ERRATA_THEAD
 	bool "T-HEAD errata"
 	depends on RISCV_ALTERNATIVE
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
