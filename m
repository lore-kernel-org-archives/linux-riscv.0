Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354ADEE57C7
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ioDu4Z/gqX9OD4zBTjb8rBKSGM+YEhJ8YdUKGqbg5g=; b=VJSIhPd3cx/OET
	rmkNwqQPMqqNGO5Ti2kH37BJ6ZHpKyUgaaVISwsKr2+TnEfubtSxwqHkcUO1hClxt0oNGwOX/QgWt
	XNNO4rcvJ15o9Ku7Mg2UprDQfPA9JHeJmiBOU+MqGn+cKfGzdpdOa+Sw0BG0jZGW3oZ9AVeQn6HsG
	pLutJR2+sBm1xZT7gg3t7y7KFUq6ZIf2LqCAIWbkxZlYCq7+E1qyYvP2pSSpZ2mVpnmIVdlZB9HDS
	QLYjWD0CacIIatoP/PiUMLu0GqJt4OuIam9sfGMpVrhft5FzyC965uSOut4Z2DSf1tiRb3UzUkpoT
	+Cyxj3Pt4CTmEA7OFTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTp0-00D54n-2V;
	Fri, 08 Sep 2023 05:14:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTov-00D53L-1l
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 05:14:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdf4752c3cso13311375ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 22:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694150054; x=1694754854; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/a46APqCOn2UBYLl+3vM5GiJlv00SujJdiThpnMY9u8=;
        b=kdZ/xONn8EsZ1VAjDqNazat/NnWiToke4CuFKb0OKT3scblD+YAhMCbPmMwJpSdMOw
         IYz3E6ofasPGdnjsRC1EdfGYUqYTtzEdu57jHGoG6aSCYwoc71EtTQmspz7OfjWVBcQk
         vRIpVA2IMFKijpFsEAJhPHFdMv1O5bpVZrPfEOCkNahnuQHSYhlrD3kDsrhHQ76iHQXJ
         wdjXAwvDHM07JobMk+aHd6DgSODSxLStgqZQQX2VeLSr+Fv+qSU5vyjcItWf6To6Gz0d
         JfCTey12NJJAt3wFVOxuDyZla2TyZFsP79o3GLc8CpC9zBQze89eksKgjF7pDwrt1cIv
         qY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694150054; x=1694754854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/a46APqCOn2UBYLl+3vM5GiJlv00SujJdiThpnMY9u8=;
        b=rp5SIVVe8Ofau6w6wDBsdAkzzqH9UQvbbHAgLhDdZqO6mV1b+7r2YyCU4eBgwha5HK
         mOQW0ebWH+UFQ2mLIMhlGC7M4/26rGXmEnSOjc4wsS4TLDviVT2tPnZcUYQbHxjG/fxy
         sYnrY3fZPDUZix6AQgIg4tthT7Cd3lrGQYMTAlKtcOyPugyLbPJA9rkEdkqzGog3I1YI
         hOVFDDZyspGRPx3e+9EUEpDFxIYKT/7e3Itm+5drusmOZm+bgWFv6DDdCgVNtNhfm5oI
         LEqBVO1EDls+k026eGCrKHPurg1uTVcc/pKsxfftq6OOQDJRw2lb3q9taBkaERYWlcfw
         wEYg==
X-Gm-Message-State: AOJu0YzWKHZBqgsQfDkEfcZbHETOntbsg7kx0cfbbl2VWl9ns33oo+gp
	9UlgFtsfvdp6NpiKGDmuZEBr/A==
X-Google-Smtp-Source: AGHT+IHujgbMM9DgjN+STeVv4CWjHBT7RgXxHsWcHil+Pw1TmXDbknKLDXT2gfzOP8AzMjzeKIVzjA==
X-Received: by 2002:a17:902:b18c:b0:1b2:1b22:196 with SMTP id s12-20020a170902b18c00b001b21b220196mr1621335plr.48.1694150054292;
        Thu, 07 Sep 2023 22:14:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090274c500b001a5fccab02dsm616482plt.177.2023.09.07.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:14:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/5] riscv: Add fine-tuned checksum functions
Date: Thu, 07 Sep 2023 22:14:03 -0700
Message-Id: <20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJut+mQC/23N3wqCMBTH8VeRXbfYH6ezq94jItxx5SF0stmox
 HdvShCEl98fnM+ZSLAebSCHbCLeRgzo+hRylxFo6/5mKTapiWBCMs1y6oYRO3zbC7QW7uHR0cb
 wXAmtaxCcpLvB2ys+V/N0Tt1iGJ1/rS8iX9avJooNLXLKaCVLxbhJrKiPHqML2MMeXEcWMIofU
 jG1hYiEADSF0o0pc2n+kHmeP9/95E76AAAA
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_221417_810349_EB9A7445 
X-CRM114-Status: GOOD (  14.56  )
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

Each architecture generally implements fine-tuned checksum functions to
leverage the instruction set. This patch adds the main checksum
functions that are used in networking.

Vector support is included in this patch to start a discussion on that,
it can probably be optimized more. The vector patches still need some
work as they rely on GCC vector intrinsics types which cannot work in
the kernel since it requires C vector support rather than just assembler
support. I have tested the vector patches as standalone algorithms in QEMU.

This patch takes heavy use of the Zbb extension using alternatives
patching.

To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
and RISCV_CHECKSUM_KUNIT.

I have attempted to make these functions as optimal as possible, but I
have not ran anything on actual riscv hardware. My performance testing
has been limited to inspecting the assembly, running the algorithms on
x86 hardware, and running in QEMU.

ip_fast_csum is a relatively small function so even though it is
possible to read 64 bits at a time on compatible hardware, the
bottleneck becomes the clean up and setup code so loading 32 bits at a
time is actually faster.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Use riscv_has_extension_likely and has_vector where possible (Conor)
- Reduce ifdefs by using IS_ENABLED where possible (Conor)
- Use kernel_vector_begin in the vector code (Samuel)
- Link to v2: https://lore.kernel.org/r/20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com

Changes in v2:
- After more benchmarking, rework functions to improve performance.
- Remove tests that overlapped with the already existing checksum
  tests and make tests more extensive.
- Use alternatives to activate code with Zbb and vector extensions
- Link to v1: https://lore.kernel.org/r/20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com

---
Charlie Jenkins (5):
      riscv: Checksum header
      riscv: Add checksum library
      riscv: Vector checksum header
      riscv: Vector checksum library
      riscv: Test checksum functions

 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/include/asm/checksum.h     | 180 +++++++++++++++++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 301 +++++++++++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 6 files changed, 846 insertions(+)
---
base-commit: af3c30d33476bc2694b0d699173544b07f7ae7de
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
