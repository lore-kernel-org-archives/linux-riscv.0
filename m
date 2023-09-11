Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4168BCA0EC8
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 22:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VilxP3M6jAuLeI6nsKJvSzkuCQ05RNvae5znmQU3iMQ=; b=BRg3d+bilh7gG6
	n6HTmbTVjX73txRgyhMvdnHcpSBfWdDnmOJi4ekb+pGrSv9CAeE9lrSwSF95o8z6teu9jnv677AZ9
	q7IyOUfLAmqjW80n0C1mTcsfleVWiRtTlGygT24iL9UzNw5m++y2WM9Rjan2nAGs9Vc7zXdMGZflb
	7F3ytsa+vRg82pCG8LlN0cWpDtxr+DMaRCOLidoTtEzZKhabvvmFZLUuFMWP7WvNJ/vwRicXoTt9O
	MfcBLWcEGq+vjCoT+PT93S+BFktiZefPVcdXLVirhgBRRXu8hF3rLVwUY0zSaaBjg+Qz/8fnNmlvo
	BhqkpfYS5batuAlQxlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpqo-001Yat-18;
	Mon, 11 Sep 2023 22:57:50 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpql-001YYd-0l
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 22:57:48 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-54290603887so3564516a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694473064; x=1695077864; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFHImHKcNiQeeK+5BliTUXW2QVp3vXADiZhQpYrJUp8=;
        b=W5mM1Toj/3yaGY2n2wjZx8phmcGlH9fG6WVESGK2IZfM11wX4s4czeLrvYTLAVTT9K
         fDX2N8qgX2uVNyXQB1WNAKAhDkWnYomkbVR8GcQ02kcKrxf9UF3DcVx889lQ3N73ICle
         pR3uDtPzJTVeaYdj7nGj2zBk6gNr5Xd32qbStwTQWqTA41laVqc8U3ZxX0BuipKyvTqj
         bQWohI6tt+MP0vkEQZVfi4egm8BI1RmuTtt2bruAR7VkKbQfbU1G4PuDCyqyZIzl3Phy
         Uai8qyvnr6NseKA+65TybyB0z5M0cW+oihTesYLP5uJXSat3sZtpFJEBwc9JY5gzKaaJ
         y4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473064; x=1695077864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFHImHKcNiQeeK+5BliTUXW2QVp3vXADiZhQpYrJUp8=;
        b=L980hetF0m6hI9b9XBWeaqR8wB1YjvLoQ7k3NgMjf8GfajDV2NweW1hg/QpNtVYiQv
         qd295AE+EkgbAjwMZA3Y/ZpKNRadcXUxx+1qg/LP8yrzZQPd6BO6DoT4dpVFtPj2Qdwo
         YA9aofB/jAHW43K9NTeMgaATLZLao7OuiGAC+87oNKewEVUS98vzxQkdpVNc1UMJc8ie
         ThHBLHSc7+fhMWWCVgd6c1gGivkO9PdPhQS2/LUFQNypjtw6Tl2RyJbfeUYcG46CZ/G+
         FXNKXO+Cb86WX8Ti09fwZcasky+QebcybtUUMJA0C7P9yE6/PEt/44/62F7h1WgdTVM4
         X/sQ==
X-Gm-Message-State: AOJu0YyFWgKY/rkbI0KHqbK7VEGZWFRf1Sx5h0sSDm+jm9yvSANZowSS
	B7CqTd6Obf6WmSszarhUOMSQEA==
X-Google-Smtp-Source: AGHT+IHA1R0qiVnW7n9r+m0MpAsKnCumiTMnjCic5EWNH4bsKLOSQXuZbxIlhVKjEjmIJ/bIc33XPw==
X-Received: by 2002:a05:6a20:1593:b0:13f:b028:789c with SMTP id h19-20020a056a20159300b0013fb028789cmr10806478pzj.5.1694473063940;
        Mon, 11 Sep 2023 15:57:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b0066a2e8431a0sm6021038pfm.183.2023.09.11.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:57:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/5] riscv: Add fine-tuned checksum functions
Date: Mon, 11 Sep 2023 15:57:10 -0700
Message-Id: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEab/2QC/23N3wrCIBTH8VcJrzP0qPvTVe8REZtaO8Tm0CXV2
 LvnRlDELr8/OJ8zkmA92kD2m5F4GzGg61LI7YbopuqulqJJTYCBYAWT1PUDtviyZ91YfQv3lpq
 aSwVFUWngJN313l7wsZjHU+oGw+D8c3kR+bx+NMhWtMgpo6XIFeN1YqE6eIwuYKd32rVkBiN8k
 ZKpNQQSorXJVGHqXIp6BRG/SL6GiBlRDIyQpjS5+EOmaXoDxv4t7D8BAAA=
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_155747_276014_19F82EF0 
X-CRM114-Status: GOOD (  15.56  )
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
Changes in v4:
- Suggestion by David Laight to use an improved checksum used in
  arch/arc.
- Eliminates zero-extension on rv32, but not on rv64.
- Reduces data dependency which should improve execution speed on
  rv32 and rv64
- Still passes CHECKSUM_KUNIT and RISCV_CHECKSUM_KUNIT on rv32 and
  rv64 with and without zbb.
- Link to v3: https://lore.kernel.org/r/20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com

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
 arch/riscv/include/asm/checksum.h     | 181 +++++++++++++++++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 302 +++++++++++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
 6 files changed, 848 insertions(+)
---
base-commit: af3c30d33476bc2694b0d699173544b07f7ae7de
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
