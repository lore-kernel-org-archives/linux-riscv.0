Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B50AC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0BBqjuT3UZ0ZtGKcuWUxlr44XJU7hJQS01jLCuKpvc=; b=MV31As9YBpEyov
	2wnyjeJnWNz/3LHs9Iu/wtDnRCiLAvWAyMEkinv60pbGhwlvhinL2b8bdTRemPVNgujuuldjE3X+b
	9XPFU6KblYF41VO8Y7FyvOEs0jgkpMzEQoQakfJk/5D4Chfp8PY46BGRvX7k5uLMAh01ZqfG/h6+s
	G0nSJIhyaH7skWi51613J6NByLy2T2Y8xp1MAt/m7nQYv+GmsXQOnJy9do5krktYPfxWCS1VwrSHz
	BqQc+jsxjpv8yb2xSZpferY8Wu7dla4d8RHpX+LO3kZc1wfrJcCDLqNTMgYo1eBkwX1vhCfdKz7H3
	ja4VRAShPSK+OLs96w/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMb-0000000F9H5-10yP;
	Fri, 18 Apr 2025 05:34:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMZ-0000000F9G3-2Wrv
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227914acd20so21791725ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954446; x=1745559246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=Dt87S8wCk9IPghoSlWa0H+fpO/GtJiDw/jQ+nnMs2mKqVfnNVs4D3+yOrldT06paeV
         S+HNTd2ozD2C3lqd9ULTFVu3IdQyJChJJA7ovqRU2N4X+t0oHNzwoqkfLUWBdKJM8xXq
         IfCut6051/vFM7rtHothob1XE4i1fx+jHPNjfPSZyfgF3Bl1TfxpF8A3f2AADqc5hHes
         lHvTmSWnyNQzVFffpFS7yk0Lr2qxzfkSeKnAVmHRxGejmY4CVGa/Yjutw/s2b5EiU7oD
         /NGUci3eVWEUtD14vHydl4kGwk1CcdYEr4gVIMtekrPvULSveEQl7sMQN1o9++ntLgXO
         yUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954446; x=1745559246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=KI8j/xA+uu7kz4ac88y6kt8muvYFV7f90Prhri8R97Np+S9/JBtPkxLp23VKHNFkd/
         BjqhhYeJab2yUsPuY6/Dl8MLaOVfvDj8VM9pYQ74MptVbRKvHSx2Lzvh9AfquZxwAOcO
         OpwV/z6ln3nNCStUP8zps462Hk1PU11YqPCz6bAYSjCoKNmwVWP1GYXn3G/0Hb++5SNz
         N849F1mrNwF5HBeU60aShnXOMsh5ihm9eJapZQyKKJn2grSVYysTAz0EEj4HRHp+o61X
         /+0GTjLVlvEY9KpTytu96E12J5g+Eq5fFv6NZ1pajftWw5kIja1tCnFOAdq3q685rzFz
         gHYg==
X-Forwarded-Encrypted: i=1; AJvYcCVA3JSqlcHStuvP1Pkw7zttKjaBjfjPoZdVDCWvD8SBm5NrdYoDW2SVaHFMCBrkG3UL0zPhw49GFoGPWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywho8tR0I5UBAYxp6SO2t0Go6PCm+Yv0PtT+42t9UiKu8BnpPly
	KUSezc+66PzYZq7XoMusD0dLh2uBGO53v1mvNDCRMBpX572OTK3fQ1WshXcK3rM=
X-Gm-Gg: ASbGncvUTw46Ph16783lbMO9AHYGJz9u8U5Ix2gBNFAneOT84mMvmjktluqnWqFYA7u
	YDXUJJuW3SQ0Hl5jF2KVmI6rrybbasG/pFHHPNv2uT2cxysqzMvoR49ZHoqe73vzL1gLNjw9Mpf
	V1hRONcNIFqkL3dofakOQnEQTbrMquHtnLy7d497jDTmcbhofdVzJSMeZNBvjyv7OPN2SAk3Yvt
	iqi238uObtHJ3eshmtGUKWRNdtqn+v3u/+kT3iQYDo86XFoxrYZyOdaeZ5mvl7AYSk/6X9KJhR6
	2tS+6ieeKlNJ7L1eGfJ84jI1gNtb4f08KsgJUqC5zsAruvO1br+FB9KR0mEc/2us9Wib7+k1C3D
	C
X-Google-Smtp-Source: AGHT+IF30Ic6GVhtBZhXWiFfbhsB3x60TB4XZmnInk7Uzg1ufwZLD/plPYkbKF7vJ/qDJWcBp1kQIw==
X-Received: by 2002:a17:903:3bcc:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c50d44a6bmr35959255ad.18.1744954446358;
        Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:05 -0700 (PDT)
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
Subject: [PATCH 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 18 Apr 2025 13:32:27 +0800
Message-Id: <20250418053239.4351-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223407_651214_69B74CFB 
X-CRM114-Status: UNSURE (   9.28  )
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

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

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
