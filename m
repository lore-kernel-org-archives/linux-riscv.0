Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E66CCD1AD
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYFRDbyEzmW08th9QyPUfEMi1+B7pcj40QUC5Jzaw9Y=; b=R3rxhl+op350w9
	UoRdIbVNMvDl/tPaHqIsIjw8qfyy2+Yy/5zPxhzUWJ6XCm4tlQvo8slUpLWKXllJOxli/bujLSG/j
	2Z3VWd8yDB+qfLEmbnkBxIVeo4AIlDS1FzihJNCWmZkfxL1si2VxG6nMd0/H59O0+KUD3RxY9VV6u
	sIa9PowA69QAvRgpvThuyVNSpQRKOU+W555Nc2ozgg3Y7EsE7QL067zikoYqv2BW8yzmJnMEvRld2
	h25PnrjZS27MfK5y7qgkJVOceufummFEBHYpD8Jm3zyYL5bJwkOEwzbCxuIEIE4jmTFTxcpWqTazz
	35HP3F3zuq7zu5synE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt74-0000000ENA7-1HIW;
	Mon, 20 Oct 2025 16:52:02 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt71-0000000EN8W-2JBq
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:00 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-938de0df471so395315339f.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979118; x=1761583918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuOxACCK+Imy4d0s9ApaTGaS6oXJ+8tFgrJY9fioEn0=;
        b=bXIJcgXjalIX9OvXGdA5R4TPxroewnKNLjdWZ2X5ogcHPClyaVD3F7pEJQQLNlQ+Qf
         t8JE5YSvY9/pL1G5bYKy1+Rti9Xm0hMzi9H3qSMkWLrHfZOFhiOw4BnSyeM9OC75xzCq
         MetqGcOIZLpQR/EpF+k18NfBgOv5IIBgoa5irzpiXHf9clHeyk6Ai2dMh4ldHcpuTaoJ
         ciLzN6O9gwGxysTDxUUPZl9w6OlUcA3nhY7cf5+afy66XWID+tZgM3X8msAoBPsYqN4D
         8WZT5zh9pmusPo4XsTKtZAwQGQ3Nb3SUyt3PIPChSS+xkFp8kkZYBCd+ww7sNtTrGt/M
         qp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979118; x=1761583918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuOxACCK+Imy4d0s9ApaTGaS6oXJ+8tFgrJY9fioEn0=;
        b=a2ttDLMeQFQn3JYiOi03uSrCm1xmsUSBdFpa1vTiF6NfcyG9NXR8Hmi4zBXRIKA8OC
         2il8dc5ekaS2+MAxGolrA9IQAbcKD0IFD4X5YEVLIlVhUXNjyofSdKdqOm1erV30Plob
         eepieik4Uoq/mxr08rT1WRn4dADOu4T/4gDMKrjQb1sZd5yO6yryscsUoLfVIuo5RrSN
         U0SEnPh53EMJ3dNeD8ux0eyRMWsV/ZoJFx9FI37X+JHrCtIYUjw7+VrOQe6U+Hm6Yo2F
         RIFHouK30hSw6l3Vbnk0ldAe67CrEpGU19CBwcV6SfS45uLCaAawRy1+9aOL7hnKuna5
         X9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOEY0o2DT537oESAc36MzU1zK0AkU2cVuR7Tejpn8qkFrir2Z/EDNj35IA+ZStDpmW09ZFdB95EEgHLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqrDSb4Nh0jao5h4T2OXNzRtd5tkYSwM3JeaKQoL+itfL0xJsE
	SEAQv6lHWtr47bdFZKXOgrBfFCVk0VsWys2utorZbEk9guB7+QPl/3bW+x2IO0F88dQ=
X-Gm-Gg: ASbGnct5JZI/0rZ/sjsHM+O0ck414IWxoswrNKHe8t7LbPLGDXmz+Bq+EpejgqwKhb6
	2AeWKO/TJuv/pfshoznsD3MnecHwRHVllKxdQQh9GVMADHUIYSv1SJURtP+l8yrrpTE4b8a6RHm
	LX2yIT/ZZON9KCPLxShIG9+d9PgAP2qINwc56Ws0052LDWy0WTjbPE1d9GHVOk3QO8nZcFKKB2E
	4SU3wrEL02F8B1PE3CvGa24JepsjtjPNIw0tjOBCxbI21pDmHDWOGeiAdxO/5EtDUIyq5jGF/bB
	jweV9GLH5oKuCbZRIixLUku/4VsEWGxmrKIthi82GU5MnCqtyeKKb/hCuDHEnNzFwo9J7BXH+bc
	dL7yZjQZKghpCxStzTjL/v07sBBuBXkzhnmZSTrIlujc76GdodnVJhLQtQqzV1JPNp9vqYqzu2l
	SshB6jGoo8fu4jDfPjs2mHoSAq6fTqAjyP8qxKZQzwdhw=
X-Google-Smtp-Source: AGHT+IEC4oh/Jnvhjv0NLxKRomMypLMZRmo/rR+Ffv9+T12KDSfiODwIv7xt26rVmqA6jr2VlWiOZw==
X-Received: by 2002:a05:6e02:152d:b0:42f:9dd5:3ebb with SMTP id e9e14a558f8ab-430c529a04bmr188317305ab.24.1760979118533;
        Mon, 20 Oct 2025 09:51:58 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
Date: Mon, 20 Oct 2025 11:51:44 -0500
Message-ID: <20251020165152.666221-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095159_608918_14852BF3 
X-CRM114-Status: UNSURE (   7.64  )
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

Allow two resets to be optionally included for the Freescale QSPI driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..0315a13fe319a 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -54,6 +54,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
