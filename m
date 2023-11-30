Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C321C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmyWyhhHIXOIKgdmxbNLEJAsmVNjkoTu9hcfFNUaZ9M=; b=jacNvOy5G8L9sx
	e+R3+g1ue+ZWX20yUnvsXDv1++q9xd/SnWLE73ti3A85/4gEA/OnVFTmhOezu9z9ne1Zc5SHrg2sU
	g8s1NioF5GIXCGP8H0rGEiufHQBdGdEo21PpCMJa66g/80SNfR0nEYBBUEgKAWDfF9E52J6RbR9OB
	iq8rvLiMT78YfBQTD3xXbu5uchi3isC4jt7irbw4czoRidH0CuTvrJ5kD2lHHxrLqr8A43b/KSdnk
	vKJBRUxiy4S6M2UdamTWEpgOJo+afhUO+c6oHzJt/F5LjvIzhcG5dwevsXuraVFHvyOzsmP2zrfKH
	Lkl9g/vks77l64t6Rlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipb-00BBal-1Z;
	Thu, 30 Nov 2023 15:19:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipY-00BBYl-1w
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:19:57 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4A9DC3FADC
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357595;
	bh=kJozCoiP+8SSmbIdgX+XEOLC3TmZqjTi2KwgKhtjA04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=j2P2+v6uPqWsLBWMVLpSlNsxxfN23TBBFyM3EVUgVN0GetqIfdnFB4AH6W92L6aER
	 43OywQMCuX7bD6FrvPGc8IAGziMIrrL0FIqfNVrLW4qPm2KAhpRLnr9HUIy/QKY+nd
	 so3ue85mzwP3D+o7BtlYs/2UTe3dnc9+7sN248DC3J1mPP8i2MfQhorKBeEKo9bqCx
	 nnUjiA1oaJqQOAmJkug4ZDPEYyi5hjzGePadXKisaCJsCeC0mRbxCvTN+gqq//DPJb
	 iUF73KucP18AqC62KHPR5pjJirukQuGJu7vW42XjpOH32b0ISnRrJpTjwIHBDgyH9/
	 jPXXJe7j7cP4A==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b85da398acso1297215b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357592; x=1701962392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJozCoiP+8SSmbIdgX+XEOLC3TmZqjTi2KwgKhtjA04=;
        b=DyMXYPSkIV8SIHS22Io67kJniovKjSDdOSmv2OMsINsF1bYEp7wcmods0kAni3HNYp
         LhFF/YBas7QqmKF/elqXeb+xOnCj+JiLZKg3fqS+XfbAnYasWI43dCeSaCRtCgDli5aS
         SYnoeID41FWyyqo78uVWxGqkMBhjxRnAei/2cWElByQRUQcZ4ZEzeUcrVD946exMuwkm
         rLYfTAUtw1WLCoShVRbO4FUG478bB8H1suzC0+miYkloPPBvAiYBaqheS/e4QXr1zUBk
         5vS+gesHRm7vW++6PibS1CP3YiBCVUxccfIXNSLkI473Tj1Ro8M1iGwFPhKdQWBpxLH1
         VKQA==
X-Gm-Message-State: AOJu0YxGs8HlgrX70zJQ6mKbnpItO5rXNJEdf1+SKTjvMYucYB517iKd
	PRkJMGYnQFqIrWCI/3JEwz4LBEti1Tc13k0Cc4Cml2uctzqo3etILBIhf3qrlxKzyXwAgZEc1pi
	Z9X5Jj/hR8c1j86AzKGq3WqagmSu2ls83o7SvMhQq0d87vpOpJEtBGw==
X-Received: by 2002:a05:6808:114c:b0:3b8:616b:24e with SMTP id u12-20020a056808114c00b003b8616b024emr22271207oiu.49.1701357592775;
        Thu, 30 Nov 2023 07:19:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/tZgpwM4g3D4RLe+xKwxGoAIWPI28s+VjwwPdoqac/L+nPUOpvs7DOtcRdrL5y9bTCAwjtg==
X-Received: by 2002:a05:6808:114c:b0:3b8:616b:24e with SMTP id u12-20020a056808114c00b003b8616b024emr22271182oiu.49.1701357592537;
        Thu, 30 Nov 2023 07:19:52 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:19:52 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] riscv: errata: Add StarFive JH7100 errata
Date: Thu, 30 Nov 2023 16:19:25 +0100
Message-Id: <20231130151932.729708-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_071956_775628_289F8D07 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This not really an errata, but since the JH7100 was made before
the standard Zicbom extension it needs the DMA_GLOBAL_POOL and
RISCV_NONSTANDARD_CACHE_OPS enabled to work correctly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
