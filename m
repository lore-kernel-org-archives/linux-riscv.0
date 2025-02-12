Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D047BC02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd8NlCW7OqtbQOW7Oeg662j+elbENnjb4QENeRcOqfI=; b=u+Cb6hunme5akz
	jvvbH6nXpvzmR3gG5enO+9tCT+pDOYkOAyUYr8KFoADFRXUi0q3wzloRT810bP8EcDpGGMW1T1fCS
	gmc/fBFKH03mV6aBnyFj5U2mJYSOozRcRTFFXPVy5fZJMjbWI8f55BdVMx+gcgL9RItSgwjJkkuv3
	UhwIBwuSrPKPfzYDEBkj/zBsqy5m7pG9zfc+Hykt8XE7G0CI/o0IPQNJz/ubeSrjrUUdhc3t84RWa
	9ugJhOODbXanGELOY8W9hP4Eg+XYVtJwHeinLdjomCZ1XzK6MgRdr6ntCbtnkSATAB4FltqvT42c+
	qFvgZJ1s/CO7ADI+52YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLZc-000000095pq-30E0;
	Wed, 12 Feb 2025 22:51:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSc-000000094fa-0ZP2;
	Wed, 12 Feb 2025 22:44:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so277598a12.3;
        Wed, 12 Feb 2025 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400240; x=1740005040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BT4zDjeG3hciOnfOqkiOnLRCnHCBLSV+hAz1Hb5QVE=;
        b=MtiYyh13HxMAQBm3nPP6I3wsRIgTxVOyKmbmV9f3+20Nm92oGLIkT0l79G624ewtgc
         ko+XOQicNk6DcS4Wj079DFvhrHMDlXHyBPVMJeV4z6N8cWCKIismrxNihEM/SnsLW/cJ
         j8O0oaXR274ntFv3oexI9CIsLJXMkrRRXAS64AEmVQIHMoAxVD/Klm/Yho/Pz8fkherQ
         4oBe+tJYNFDeXha6DhwncrSRJ3bioot2M6tynqM/p5G5OfsgVHmTjj0+EX9lNiVz4zVC
         LmNbFzRoRs7SEyoisFHdsOqpPl3x0RgXoWftEO7hBlHnaXTzvDF+qF8nmAKmF7mmu46A
         CWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400240; x=1740005040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BT4zDjeG3hciOnfOqkiOnLRCnHCBLSV+hAz1Hb5QVE=;
        b=WRIcJbrQm7MGsnewFmGjkUis4/IcsBdIdWp3Rs+HPRzpbHZZoSjkRMGe1bPhVDp6ns
         9MUarOAuvlp4mHrMqtEsQzpO9x21cAyG3oeBPNzcbuxTt+0ZzJb1CCZNq5R46IKNWvO2
         QGtBFibYwyvS8rQP9j3NR0I0hiYWiy3Yl2rHRRKZM2++wDyn4RyROmapv5h0lQeyQCLH
         yvkDbLB52zh6I44GVQ+Yca80heY3wL7R+562ovf17jPCFfb0zPaz5qBMe5EVR1iv4WNY
         6MHMw3wa349xIieH1WblzXGKuvg04XFW0KeiU5Q7I2lX4R25gS+9r/gPddpDRymlD+N5
         ZsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfKUgcvqjub5+Aj29EN1Sj+w5cXBWS63VpB8jmJE/k4ayYaSnam+8odSEN8TqLxRVkFzlvHWdKkL9boys=@lists.infradead.org, AJvYcCWjM+HKKkag+6pFf7zYGevcKYlfXVTyD+AS7h3JWHfmNMOkyioxt9Zyth8MAEsn2nq04lGBvEHiNNgLValxsBia@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhd7CIn8zn/Z0N4GuHTXtfPJaLIaEZxSqSa/8eV3EVm/BA3H17
	AF183GF/SfCyTzUjz1VAXAQt01yO8+ozJD08p33JVhwvhHFL8J8g
X-Gm-Gg: ASbGncup5NJ18f7AHnLZD6aNDgi7zJlxHorVIfxaE+VyudJkF6lYTaK4KBxgBiqILkd
	TTwFH7IaU6qfCM9w4mD01lw/DuXPPAIlgKDVI7q1dvwR8nOtMqY5Hsij/TI4E23UOTqXyYPpvpj
	c1nwzhTRzNysVOYGd87aYMel6pBIW7UpMq6fFZfl4r0P4bN+izbmzWgClF7D+j9lWHTtxqiR1ct
	6eigBml+a1VaD4C4v47yJu140Nv5IH/zammXpyHGuRbX5IEYtMgkpR/Jthb9Ass5zE5iQlVjpSr
	W3rN312u14Z7Dde8kCYqz4icGGhd
X-Google-Smtp-Source: AGHT+IH33VO0YZ1W7loC/G7CSLpb1z8VSxkc1c4pnZ62mQEDWwxNujuDsCoL33SSN4RE8aBnDnfjHQ==
X-Received: by 2002:a05:6402:2106:b0:5dc:90e7:d30 with SMTP id 4fb4d7f45d1cf-5deade10d5fmr4743023a12.30.1739400240350;
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v3 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Wed, 12 Feb 2025 23:43:38 +0100
Message-ID: <20250212224347.1767819-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144402_183819_4AC95BEB 
X-CRM114-Status: UNSURE (   9.45  )
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..21b6a2bfb45a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
