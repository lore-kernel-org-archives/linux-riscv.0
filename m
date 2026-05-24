Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE01CD5BB1
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo7JfG6jjeNeGVINe+2P5DiGV3XWPwxoUWFgoDzDUFU=; b=SYpdo0hWYCYFtl
	QqeSrzNY1aHA6QqwbIbhE2d33+NHG+bGBo7CyUsg189e+Oot9Fgd1eDUgU21kv2gDC7hh9z4q1PLB
	p96gOQhivBp9B4orWZBTpH+tby819wvJmdVmGQKekrGw+tsH98TZAC4VXhqvUVH94xBw3y8ye0z18
	48BN0iw8dpgdeS/t8jQ2LAwKFflagBR2hjYTV+QG96Fg6W98yszmRoeeXDaoVHbgYCHD3Ob/o2ItJ
	AlL/99fROhDKT4oQChXHEDusJvKxl5dtXxyJsdM9g4+VsS3FBT7i8effLILc2MVIs9u8flFMApeSv
	vgUODHDb4AnzyrTlEhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8ea-0000000Ezxb-27J4;
	Sun, 24 May 2026 13:14:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8eX-0000000Ezx6-2KhG
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 13:14:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-837b39eb078so6053076b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628441; x=1780233241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=UBgtlxNuf76hMqUnNQaWTTrGbUL/RelCoVYuiNMyA1YEXIK6XiammLrMK9DzIPvtov
         DWS3mRTnC9O+n9J+Z7TqUvAadDBcWHzqV/PPCpviOoqYr4MCn7hxafQjS1ujF2gdl0YK
         woAFRRUuYrshJUqY/uPgKg+o07d/4hAKRkhKgWA1CoBSIx2DgOEmhvPfGrCoZQIYPTWN
         T3kHdhAC8JjKyzkPd6wTDTrfzP8OcgywcbsLwbDWkPI05HbQpq84TSyHD7ie/FZdYdsS
         KtdFSr4JmdBWrsBys+nV6vx+w8KfeJzdCZ0GAanEpocdtjua4zaxHxDoUZC4rYpNQsFP
         QUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628441; x=1780233241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=gsyDrv9DwTwjklaaedkTFRPCibnhWdGjNLRYhOX4Fcd62uFmZbtNsZ0dBLCF7W5uQk
         IsSirbYfXfdxv/V7n1hwdmE14pfYe0sWSR1OVIIkdkx6dkD0UBZtiFBlNSwl11AZFmn9
         IuqEg4vfXSS3nf/LygiPvmHRyw0V5FPlETUthLOKufhJ9sifjHok0uoxpULjaI9C4ouS
         UQMoLvhPJGZcGyjSwPpvX8RU8OIuw2xRm/yR9G1wMy2yxR3BsOWDW+t3MWYnflMITFuY
         +jK/2nICh2VZiridvhaPzIeE70kTjuon8dsOitI8BKTO7hY36d6hou50Q+u+GiNOMcXf
         RwaQ==
X-Gm-Message-State: AOJu0YygYUP4SUJnQ4mS74Gcykq700FQfwj+8QfNl4f1vNDUFDeciw1q
	gugCJDIw8H2yq4PqGAbdBizRsg/OyzdI94Bpkjk6djE6UESriNHOlPiU
X-Gm-Gg: Acq92OHmJ2AgU4Cr23GjBiW22tWJPYLpGHREdcBRQnVxS2R+VAJ2283HX9yBcaa7ylM
	aUOzWHUtmqY3k10JYS1K+v0Z612GhIdF0dsYQ4djimE+SezC6ZMjVbxSk0IOGCYwzt88COEKya0
	XZZdSai/1B5DCYH5VZISE3G5Y+kBfE0c1+GzSsVzgUizREKg6QexuDU0awEoq40rx5e06HUF01b
	RENUXfscRnUfaO1AI1j5fOg+Gc+LgLOQZ2awfVYD32peOJauTSB+wwoZKVbfP00BV9phnBIlf0l
	ZL0u9a3WSUgev4a2sxqGRyTqiebVptYIw80C4zt03d2759X4bCWVZMC5ftLbPp2sIG/v+TZ2bAM
	9X56PJj6qU8tRRDszOqYb+yKjcsrr3i8TzTY4Z1wCYgkohquG98mATB776sthKrvsz2iXrhQmUh
	X4uEi603Me9jPw46jSYU8RIUceGvY=
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr9374677b3a.13.1779628440534;
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:06 +0800
Subject: [PATCH v2 1/3] riscv: add Siflower RISC-V SoC family Kconfig
 support
MIME-Version: 1.0
Message-Id: <20260524-sf21-topcrm-v2-1-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_061401_605155_43C1E841 
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
index c174ac0ec46b..7c412b2bdbe1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,13 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA
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
