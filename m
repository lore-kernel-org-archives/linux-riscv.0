Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE17CD4F21
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPh5faU3JcacphJoZ7b5f3Isru6E8uydEROwVpNs8sA=; b=EcNWg9m19/Xy4Z
	3YS65mp2zKZ36wiWWUj+WXaxlhS3q3zBUi5fD6+OrnBBVcmAue2VdXb3Nbltl6dGYi7z6KxTxiI5M
	FdPMHRdgjFTTaw2VV2Mz/oclBZOKqKclII0RLQFkzp/QLOWBRz9unW0ExeV/Gt8UKyS7xW+gZIWB7
	3VhswlEyJxShawT4mN0p2pGZZ3lng680wjNzwdKlZuLpXHUD4excLLeK3G8QpaMxQY/ylbdJa6f+m
	3uf5/u30+6aVHy92LI1bil2vGwNIXPd72LWknXg18VvuewyJjCBmPVU992C/2Wba28jVZKqZ5SQ4M
	URe+EHXZ2b2EFM7BxqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFf-0000000CpKN-1CVu;
	Sun, 17 May 2026 14:13:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFd-0000000CpJw-1K7r
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 14:13:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-839dc688d6cso493941b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027232; x=1779632032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seaxzvl1xgZZJAa+rRq0jV+BZBh4vJTt4ZSm28H6Xmk=;
        b=LAACiO4K0zPm6i2P6ArYEZwXoO37SbB2g7V+mfpLubkadPRdMt3PByH8gZmaCygkRt
         kX84MmVLb6WgVCpeWBMC/mj0mG3j38p4Xto+axfmlmfZEaAsZ52f0Ka0Qr8B6KjCUU1n
         sXk0SXCnnxZnYUS/5T57YyyfUuEham7YEIw/E49jejy5QTlrFsJdxM8JiLrIMRNILH6h
         z2vTBdkCetBdguG3uJwJ3Kchl3LB8VlIPGlX/l/pYTwrX6ZGvHeTXeN2H+nQVGU05G9S
         OLInT7rGfJga7+5TUOH4jRjEDzWu/xcgek7ZQ6+s5qqvf8qxa4JAEYcaGsYgqPYCKwbs
         +fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027232; x=1779632032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=seaxzvl1xgZZJAa+rRq0jV+BZBh4vJTt4ZSm28H6Xmk=;
        b=oJSUYGmSQKsJ/h2w/9933gJCvXZ0ERBxnsTR+B/aqCCPjtmigNXYpgjkoOIngxNHAU
         fr4si++AZyMK2VDnPNPjH0cn01lE25I+B4sua7O6dvNJ+31EL32bxImk2xfp3kGaPkv5
         S7DDx8Pdbo+7pMBeJmMMQkYdFrJ7ctETuLBDjj6sCJtdedrQWM9X52N0CxKte3kvrVPd
         MwXtzlbGUMyWzH/1qBXwrK38M5oRGAyn5nIipW04VCWR0+02UokPa/93/zJRU9JCm1mO
         C1ezK3t+tqDCtoBTggFWCmd0k7VI+c4VoALXhHx8xtI7VbIFtZdOfTt4+DfoHFEu53+W
         RgRg==
X-Gm-Message-State: AOJu0YyWGyLcdZA6Qt3siRn7TSpxhilSgHp8c2sNeqdOXHoCTAbO3G+x
	y5mJy9U38y6FXZ2B4AWHQyjgVmTbfvSdvIdnvd1xt+b/osUFHANbS3Gm
X-Gm-Gg: Acq92OGvFLn9fmK8Pun7ObVERaw0cjTRgvTnYGj3igVj/5jxTQu8XzSS2taG6sdrDOB
	UrwXItfN+3xmw3kWWKXElkfPoyQM0j5tULY8YV/goKCP60QECQn0Ai14/FhhuzO3YCh/aANGYSf
	Hdq02ba3zEMhoqqAzlZlEu3IiMlhg0StU1qbAtUYfi8wiFS+A1OXS+MwrLVd1i7+3jkaCFs412w
	ZYatrlONxWPmsqlbYEWPdbdmmbOtaGAhWNITgjzWqHfFppniDT47Lr+ZMqet+n4c9hifuliFDbo
	FYeo+iEVy8IV8gGCgEKTDF6zk5uawKx4jBQUHDGJJU3MlY4z3YrtAWBy0HURrik+CslDI4M9p8M
	b0Cia2nbAIsaayQJcg5yAM3JpmhmWPapmdR11vWsOPcpqiiRD32vsShsUcnOqFscga1vfL3udH9
	qXD+B9BdsWYRoy9ZklbYOHwkjIyHhunW0a77F36kE=
X-Received: by 2002:a05:6a00:4ac2:b0:82c:66f2:1226 with SMTP id d2e1a72fcca58-83f33d5494bmr11243398b3a.38.1779027232488;
        Sun, 17 May 2026 07:13:52 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:13:52 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:55 +0800
Subject: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_071353_360210_68CD9CF2 
X-CRM114-Status: UNSURE (   7.87  )
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

Siflower RISC-V SoCs, including SF21A6826 and SF21H8898, are RISC-V
chips with T-Head C908 cores for home routers and gateways. Add a
Kconfig entry named ARCH_SIFLOWER for them.
Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
for its driver.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c174ac0ec46b..9996591cd9db 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,13 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA if TTY
+	select ERRATA_THEAD
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
