Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2877C001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Be0T7yql+khhqZwpCOgA2VWV4EjCHr0GtJE70StI+w=; b=HYoD7QE+Em2nm8
	+MKWk2qGMDASfB86XYgVdZdJN0X8fwUWUmxY79J5dTTM6MkH9PRK+fjSd0XnIcaBUTWhmotWaY/Zd
	DJAIPZCaAJ5s1+8itWT8KZU3T5x83wMCEkeEVvIMwWSWI7GIoy1xKx4FVuglkO8IQlKdgbKZWMJx1
	bkfSP3uBqdC/ozbI/JQenanXPB6C+Xe8tXpQHlC/dI7zdMtjFapiYlX6AcOWryb6b5z+KD5XBeQge
	SGdf28r5DDyiEmt8esmS0q2eDfwhqAz/TPMUAE4gMN1Q63AofoCqEPKpWdOz2FBjY2B8GuaxSvcz2
	kaUBO+QOpHkVEsq7+zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPt-00GwNd-0k;
	Wed, 12 Jul 2023 08:41:45 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPp-00GwMO-1v
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:41:43 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so109816681fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689151298; x=1691743298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUbAuUSvAlU7VMm5cmtoV0SpHebNxqAw1L0b3txSkeA=;
        b=q0AyVktPOJVBLAjWdHnUNM/pjTZmAsjJDDXL/tZPG2yS5iNCBt6aLEdnLrBoMnhnmz
         WAc9c5eoOLd+gctm6PEInMsjY8PhtcDqwL3B1Dl5BDeMqL43Mw6VMUL5w7DnIn1mgmvD
         yTQXB960YJxyFpnAYKsZN5cRdQPTji0LOy0TxUckPKJx/NpimVI7A8NiRL4DqA0gqmBo
         Fb3sCT+6425IsW6GrkzsdGqNAPJFWqmNHYHWBN9RuJa/4AyJaBkFyXY3MqqFWOFoVN5U
         HEqEFAE3wVMj1/uyQjkuxdT0TvC/lz5ONbcTueaNuzPJf52K2+ICCJ3+Fo5hE4yqZI2J
         UkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151298; x=1691743298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUbAuUSvAlU7VMm5cmtoV0SpHebNxqAw1L0b3txSkeA=;
        b=Mfiz0ZVtjSZ3VvG8Wmuc20ZftNHJFh4M/XfbWLD/QRJ+TcR4qeb6JYRvacu1OGbTWC
         xv31GgJD+4AZGEXndpVzEK1yxosuQmZ2NRyx9jAXNgJScZE2YSRvgCZFxkYJm4LRH7rr
         uaYLUtsU9GKvIN44GPtqpw6h38LQlBVA/zwxLzqaIf1vbu0aopBkaFZhjwYVZdESp9pb
         vrhirz+FNxIdZ82w9OPN614nfekLMAYQUtlq9tv8m+YRfH8wp5tgTPb46deQP6XUYOYO
         wvVXNGQAIY5YLZn+Q/+LF2k5vnz1T2fT4hish2amjysSAt+g0bYbJ8BcbbEc7hjnqUeX
         6KKg==
X-Gm-Message-State: ABy/qLZRfKgaZEREQyDDF+9EvYMWKYsKgnAr+kz/BboAlVzjOtZ/WcXH
	VXnE64btGfGqFhl2XG88RhUkxg==
X-Google-Smtp-Source: APBJJlGKY0rPUEVIW0S4wt6ebCIbE/MCdi8SP1zuwJFBdbAWwb185JZBJ5tkEleUiq2f5q8wWYV9uA==
X-Received: by 2002:a05:651c:120c:b0:2b7:ada:cb25 with SMTP id i12-20020a05651c120c00b002b70adacb25mr13810462lja.31.1689151298155;
        Wed, 12 Jul 2023 01:41:38 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm4496122wrm.1.2023.07.12.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:41:37 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	devicetree@vger.kernel.org,
	sorear@fastmail.com
Subject: [PATCH v4 0/4] RISC-V: archrandom support
Date: Wed, 12 Jul 2023 10:41:16 +0200
Message-ID: <20230712084134.1648008-1-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_014141_630508_DB14152A 
X-CRM114-Status: GOOD (  12.26  )
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

This patchset adds support for the archrandom API to the RISC-V
architecture.

The ratified crypto scalar extensions provide entropy bits via the seed
CSR, as exposed by the Zkr extension.

The first patch of this patchset allows for detecting support of the Zbc
and all scalar crypto extensions. The second patch documents the
corresponding dt-bindings.

The third patch exposes the Zbc and scalar crypto extensions through
the hwprobe syscall.

The last patch relies on the first ones to check for the Zkr support,
and implements get_random_seed_longs by looping through a seed CSR
read-write to return one long worth of entropy.

---
v4:

- Documented the USEED and SSEED requirements when Zkr is enabled

v3:

- Increased the CSR SEED retry loop max iterations to 100
- Documented the added extensions in the related dt-bindings file

v2:

- Fixed the ISA map setting for zkbx
- Alphanumerically sorted the ISA map setting
- Added my SOB on Hongren's patch
- Fixed patch #1 commit message
- Removed printk prefix from the archrandom implementation
- Fixed needed_seeds computation (and make it const)
- Replaced riscv_isa_extension_available() with
  riscv_has_extension_likely()
- Made the get_random_seed_longs implementation more readable

---

Hongren (Zenithal) Zheng (1):
  RISC-V: Add Bitmanip/Scalar Crypto parsing from DT

Samuel Ortiz (3):
  dt-bindings: riscv: Document the 1.0 scalar cryptography extensions
  RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
  RISC-V: Implement archrandom when Zkr is available

 .../devicetree/bindings/riscv/extensions.yaml | 87 +++++++++++++++++++
 Documentation/riscv/hwprobe.rst               | 35 ++++++++
 arch/riscv/include/asm/archrandom.h           | 70 +++++++++++++++
 arch/riscv/include/asm/csr.h                  |  9 ++
 arch/riscv/include/asm/hwcap.h                | 11 +++
 arch/riscv/include/uapi/asm/hwprobe.h         | 11 +++
 arch/riscv/kernel/cpu.c                       | 11 +++
 arch/riscv/kernel/cpufeature.c                | 30 +++++++
 arch/riscv/kernel/sys_riscv.c                 | 36 +++++---
 9 files changed, 286 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/archrandom.h


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
