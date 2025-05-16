Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2DC2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dy7ltblub1GpN36jsu3GMibDK+GzVIy9QF6RsxCMbRY=; b=N4YCJYnSttxGTv
	3ZhyUY1TVzaDVyLRf0UITx0qlzVPi037Y6V5hHoKmnxBY+LyAkuHciF0ouecQpAQFjWBTk3q9XdDj
	kSHViaz8VNgJcrgbbyOJgsMxwWV8J1vs3nAuW/jwumhrCikBELPAxOJe2Gyi2i8lGlfkgGPN32VVO
	e/y6D6P0AL6IXDTyQuXTHxrgHtuN/S+czo4o6c/HU1lYMtW1X1FtMUaB0YUowPX/q32Ei6bTlyqTD
	W/BkT5IMNQnsUpWI5cY8lM+D5KuaVri0z+ZT2H33nEfsSjP17/w+5yOzqeg7UGP4gwKaJI0Adw/ZP
	uFIzlm/vgeBSWFTox0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOG-00000002JtF-0fuV;
	Fri, 16 May 2025 03:05:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOD-00000002Jru-2Y5e
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so14721715ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364736; x=1747969536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=dm5KZ7UlS4OR9BDf8l/NUeWMUIMuFO+RExyfksS5dYz+8SvKxR3ujGlBximF4QzWyZ
         Dfpl0Uy2nTeinRZCcokelAKJXXdvX76MUhTdtK3fyY3tqLJpVJSPNXglRbTCgugfwYqN
         2lF94FH57G/o0NtBMoBLNThWqKgp2GfsAcNSPl+hlgqsIrbgSDJemf/yI1JuD5O6gtTo
         0IRU9HQ55mXjRLrdQiN+069cqjpqmFLP6zsfkn5HsAyehFBUYcbrvOhdxwcE7IEPLlct
         9perk4bKNAvilOJk9VDrAr8cyKyRb6f1HKRhI7lu9Pj8lseQ+jYrz5v2Y+FANYv+votU
         cLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364736; x=1747969536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=kYPwaCilDIcB2XCbH0RcJp0sAYolwKfH+KouWvHyondhsvCk+GEIeMtNp2o3Ob2T9t
         uxOxwPyl7nJM3j7N/RH8nPdyFhMVZ1u8xeiOnNziNXRen6pKWBQY4CLXP28RVKul5v4k
         tc9EOziyTJ45YAZJ1r3ijBJSiwZHaa1L1NcDtedCWQTgpMsMwUaoRF8esPzJwPIOB/ih
         M1W/TJd2fxkaChH2ZMYmwlJ/p2/dtj2bsIbRQaA4t7UIQU3Um/A47cnjq1fmAydM/4M2
         WEE1lDcyDfeKh6kz9XDGEilxIwRd01lT8PQZnmzlkmY8Ub49hrR9Q80RRuNSPPffjYi/
         fv9A==
X-Forwarded-Encrypted: i=1; AJvYcCVyyCXBY1GYVk3/mZjvgubZazF7xTOnYFlIiinG0GzW32IhyvX7XlB/lk0gr+9jXgMLIW2RiDw5T7rC4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJ8AZjBZ4QiQR4pwikvuViLugeCdhu1uxISa4Ojj5aP5DVPpv
	ApDTn2u9g3LSNp2pF7JCGUtYc1GMbzQkTH5PnLrfotObLYP9Fv+DwZGrY8M5iqfY77+NGrX2tIC
	50Px6
X-Gm-Gg: ASbGncvBEr+xpYvjST0xPzfeBSlabLln8oL4rnej5kqXL79qh9/50qI1CpapaKbPP9w
	oknWcXq66A+jUUGfp+xJHr8KOZ6O/tmN0MD59k9ZPVPonuFhwpDIicJgVWTy4QJwwTYBBHeZP20
	ecA2IIGlbIOgKdKQ1cisBNeyN9EKXn3rTOtsw5WEazzME++4FBIBz0epwUniwADnAGoGic97DV5
	aB94/7FWsDVYS2QJIn1+cjH1VnR8kgUd4HEUaOwbXfQecnvbUhO3trYboJUUlPFKObeCg4UbeYa
	zxgApBziQGv9Dj7jOiFv3DvgzYaWGKwRAs/CqjDgSb1E1RUk9koeqNp9RMMyfFVih+x/OylsV0+
	jmsKFsQBU5GU=
X-Google-Smtp-Source: AGHT+IFV+4ue4pHbZ3acCvgAnlMAR5bRIjj1Ic0kd5kGB0kSO79yQHTYUTk7y+Xm+spnNhWWuTTQiQ==
X-Received: by 2002:a17:902:c951:b0:22e:421b:49ad with SMTP id d9443c01a7336-231d454e4bamr23708045ad.46.1747364736303;
        Thu, 15 May 2025 20:05:36 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:35 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 16 May 2025 11:02:58 +0800
Message-Id: <20250516030310.16950-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200537_663293_6B3D3222 
X-CRM114-Status: GOOD (  10.23  )
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

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

---
Changes in v2:
 - Fixed a sparse warning
 - Link to v1: https://lore.kernel.org/r/20250418053239.4351-1-cyan.yang@sifive.com

---
Cyan Yang (12):
  dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension
    description
  riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
  riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor
    extensions
  riscv: hwprobe: Add SiFive vendor extension support and probe for
    xsfqmaccdod and xsfqmaccqoq
  dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
  riscv: Add SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
  dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
  riscv: Add SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

 Documentation/arch/riscv/hwprobe.rst          | 22 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 25 +++++++++++++++++++
 arch/riscv/Kconfig.vendor                     | 13 ++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/sifive.h    | 16 ++++++++++++
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 arch/riscv/kernel/vendor_extensions/sifive.c  | 21 ++++++++++++++++
 .../kernel/vendor_extensions/sifive_hwprobe.c | 22 ++++++++++++++++
 13 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
