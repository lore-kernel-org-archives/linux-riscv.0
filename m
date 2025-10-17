Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDD4CCD1A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLZje2LABkG6i2FzY/6catKrKixwzK4LGXvKyBJCdMQ=; b=0toWl3rXf6t+Eq
	D1JmGsjHK3Hhw9tiftQaoerP+z6GFKhpTLWKo3AiZ3ZrtJ3YbsAlQQ2gp8GQ9gTDXfXHtAFHuqxGn
	SoG8knGB2ZoIzXhrS/ob8pgcrWkBCF2s7Fh+9mlmPlspUVVU2+WwAZr+Ez1A1qu6qEfUsBRx9MtL4
	dZlBQ3dGCcJQi8IBLzjQ323/zK/dy3CWrP9Y8geqEjAwSLKAoTBgoS/4H7cSq/5wkwxN7p2QvDTql
	vl0VX6dG8LxiVWrc1DJqjvRFjmmnyCx+ID1c+G8JpKnhS3huWEZhMg5lpeUH8PSqIRXYbqbqVCxea
	VQc7AIB+0oUSYcdH3fSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnx-00000008o20-3FuJ;
	Fri, 17 Oct 2025 19:07:57 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pnu-00000008nzD-2iX8
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 19:07:55 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-42d8b15548eso12134225ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760728074; x=1761332874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfI/HxKZ5aLnk6gHq9CwlPfs/i+7HssnS2IuZUrc0Ms=;
        b=jy3Ko1jYoHBZp6tdBw+wBZIIMBajIKrF3oDRmxo4pvK7je0U8iViPJUYPaoDrlZiZB
         RsPW/gjRhLtrDINCKAjGEBuGRa40KhHf8iz/zU51WXmR1Beml1/48xXMT7HW2pbkgCOy
         MC2yncMmNUbrRoSJXmcUhjk2aEi0KGIqhFPo6Zla5Tp6Kh8wjyR4nkp+sXDwMPzZX/9m
         s5oK3Od1PNtYM0z3G1as0tljRA04npJMXamQahtMR4M2UOYSG4s7A81rWaQOKim9NRFe
         Ls6V3U6AMfN7UibnvZ9M2DvAgPfmy2Ukyso7FUsDh67Z042EOA80X7TMEDARSgYRQctS
         tWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760728074; x=1761332874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfI/HxKZ5aLnk6gHq9CwlPfs/i+7HssnS2IuZUrc0Ms=;
        b=sOXyivmZUy1YcpDmTJdpiN7QU6mxsouLmFJb1rsVepuuRc+w0Pbe4NwTelaOte5hpJ
         I/vcCzxUV+8qGrUeysZXfNByiIG16mSCJSeak5Cvmdj76t2a7WNwHDFDfru2TDPyXi/4
         da2JwXHSP9IhN6WSLslEXr2KAAPDjY4WQ+VdX9jwj6aP2UN12qRo7CRnZ21UZ112EwmN
         Dsp5KsIs8YKsexS3EaW69B1PF4/BU78oragZB+kFaaBHVzBtiycyeYpbRzLBpHhqd0aN
         2nFpVxTaBRyLuZxSERRIA3n6JXP//ng5hZf1AiM0tbUQuLOlUD0VMcqa8frSr0Jn4RwO
         nZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkB7DYZL4ZPsblRGaR1Pcks21NkIvOY2vScnpSBOchfupElKrahEE7/e0k6dBzKvQ77wFy408CZjJRLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtIFNS5bUoNowPL0r8fmQMjcuL9sGMxgV5NLXhtBBIVDt980aj
	txgva86Hjtq0yLaMaHoYjIJuzNDxVJOAqH6qrz7XCrluZ80ojKIuF/cL+RBlNth4p64=
X-Gm-Gg: ASbGnctSOqvVNqAo5cyApuqO2Ubx5gTd34Igi8FsIqnGwsuM8V74+yr69V9y9JxcNo/
	I119g5u399CNmWFnuEnS9/yOVaEME0h2/AsjRnQRhK1BfprubkUZpI/ivDNDLbbXnUl26FPtwaW
	p0apxWHX1HG11VZRN74v+t11Wu0M99DQFkxeUJ6iMUWS4mxg1D2S7A/qTyOA7qICHq0Bpq7J1dP
	cxtLjDAXd2gi9g0d7F9iCrGG2JuXGsi0Mr0ykDj4OiJrg898BYRFg8M1JgQRPZLWI2acvlkQISR
	gyzZ9eAotCXxbJzB+Hhf5swLAwVsZDOiji4gcvZMTEVwzIljST/X6+MjzJO9ygTRE8zt9bX+rS5
	F+82CmEpNhg/zzOT7cBKx9SCdM6CnPgejZJS+yACVO/ez8IoycosuXLWKfotG/bGqJYyHOGx1q8
	Jrd6wtEr5DKlu4dVyze6AGp6UeVltPdV1FBV0mGWO4/3603I+e0EYluQ==
X-Google-Smtp-Source: AGHT+IGgZuyks8/SPpqGraEYOHD64JLctbaQzahczxp3t8Isq+v66Q/LNb1tqq+q1CnCV61aP2fWQA==
X-Received: by 2002:a05:6e02:1a42:b0:430:b338:e55 with SMTP id e9e14a558f8ab-430c53068c3mr81229225ab.29.1760728072707;
        Fri, 17 Oct 2025 12:07:52 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9768b98sm153462173.46.2025.10.17.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:07:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Fri, 17 Oct 2025 14:07:38 -0500
Message-ID: <20251017190740.306780-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251017190740.306780-1-elder@riscstar.com>
References: <20251017190740.306780-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120754_685888_99B35C48 
X-CRM114-Status: UNSURE (   8.61  )
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

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..046ad441b7b4e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,14 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &emmc {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
