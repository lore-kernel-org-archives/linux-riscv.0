Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47482EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKywzc+/sFLCYACU/TcguALJWH3hv6skp42jszufX5U=; b=ynwj3/vLc0fhR/
	HeumJfOLIvxP4jEbwuJlj6hGnD2JaIo8R8o5XjmYWXuCz8VZjbLNvTGDsiDA/4+c42dUHT27mD9s2
	Q+zWo7rx6whJVKSCvbsKfZaaKrcaag7Xc3iUZDt9usS4l5HQpIJK4uBLBcrZ2ZTOpatU8lYqumlhT
	Upwb+Jmcr0MZbr12MH4DaxXDX87aw6MFXu8E9L0w2UdJ5GUPUTQz/lNSDSkFAGOAYaNXa5a3iwVpS
	SuvyDNDrGaLI/p55qsTH4IUun4nrExe8xnJfreQc0f7PpgewyT3gyqAWld1Ug3plueEXfOTQtwKHL
	UepfwF5sy9ahaHG/yAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV0h-00FjmN-2U;
	Wed, 28 Jun 2023 13:15:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEV0e-00Fjl0-1B
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:15:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-314090abb67so928304f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687958098; x=1690550098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6nhK8W+AfdQ4hZQdqGj29/wgqqdks0TQ+I2eHBrD5Ys=;
        b=ccY9m5lQYm1SOaalBgT1roSGj2L57EgIf+rtlbiGmeRcv0haI0bPgiHVC2hybOLWn/
         5vK/XAP0KxECaP4qo7EreOzd2IGz06dBFXie/twv/IaRSJEHIIo1zZ3KH85XeAHUUMs0
         rNtH+DCrDjkDhz9jAQaf5I0yH3YBHEyy2bl2iiTsuNax1C5wPifA6yvNO85CU06yal6b
         k9IeyBv4ipnuVnA8MoeDeSLVruznQuabOkPkDdl0KHc14EueKy0ouTk1MViFV+xxOOUq
         7G2ACm6aaV4QQp06o4BQos2iW4DkgAlAWnY2ONgmuxKJpJCTp7z+KA1kbBM+qhdRbqkx
         Dlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687958098; x=1690550098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nhK8W+AfdQ4hZQdqGj29/wgqqdks0TQ+I2eHBrD5Ys=;
        b=kF4STmGpMfLs4y2Qi+kKJhxITHAD2jpXqCqupmhUx60hG9HbfsJG7YReJGFZP1WN+N
         payIJE6gYLTqxuFSnrxmxtTtTm+pnzmDnlJq7VY8LdmaCT6n8GRT5nOm8iX24uZiWoRN
         /qkSjMI7vA7wALz0ZRWFUNoW08GoTIHrwBzbR1Amuzmnxr5neRw2pb8GrpUb4SmQNcJC
         bPD4BCpEsz38byyF4gc/T6QoFGtESQgtxbFRpnyci30dBI3vDH51EwTC12ydlrcdk/Wf
         2s24E1p3N2kRIaqbwdNJBhalqF1EAK2imzjHDA4gFdutoQbgBXU7R5MATpxi1s8KAEXF
         K2ow==
X-Gm-Message-State: ABy/qLalOuYEqImgIP6eRmIftvKsvIVFDtE0jcpyQ7JkCWS4WIELJRNW
	/g9nk8vrabIkR4e8mkUdejfePg==
X-Google-Smtp-Source: APBJJlGSjIr/SRBaTE80Ha1daaVNUQNbNbKCO8txWQKZ5n3EoACEySH84sVfpSPM/eC4C8JR3wboFw==
X-Received: by 2002:a5d:490a:0:b0:314:ff1:e714 with SMTP id x10-20020a5d490a000000b003140ff1e714mr941498wrq.5.1687958098406;
        Wed, 28 Jun 2023 06:14:58 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id a11-20020a056000050b00b003110dc7f408sm13456946wrf.41.2023.06.28.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 06:14:57 -0700 (PDT)
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
	Evan Green <evan@rivosinc.com>
Subject: [PATCH v2 0/3] RISC-V: archrandom support
Date: Wed, 28 Jun 2023 15:14:32 +0200
Message-ID: <20230628131442.3022772-1-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_061500_596239_8D655EA4 
X-CRM114-Status: GOOD (  11.29  )
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
and all scalar crypto extensions.

The second patch exposes the Zbc and scalar crypto extensions through
the hwprobe syscall.

The last patch relies on the first ones to check for the Zkr support,
and implements get_random_seed_longs by looping through a seed CSR
read-write to return one long worth of entropy.

---

v2:

- Fixed the ISA map setting for zkbx
- Alphanumerically sort the ISA map setting
- Added my SOB on Hongren's patch
- Fixed patch #1 commit message
- Remove printk prefix from the archrandom implementation
- Fix needed_seeds computation (and make it const)
- Replace riscv_isa_extension_available() with
  riscv_has_extension_likely()
- Make the get_random_seed_longs implementation more readable

---

Hongren (Zenithal) Zheng (1):
  RISC-V: add Bitmanip/Scalar Crypto parsing from DT

Samuel Ortiz (2):
  RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
  RISC-V: Implement archrandom when Zkr is available

 Documentation/riscv/hwprobe.rst       | 33 +++++++++++++
 arch/riscv/include/asm/archrandom.h   | 70 +++++++++++++++++++++++++++
 arch/riscv/include/asm/csr.h          |  9 ++++
 arch/riscv/include/asm/hwcap.h        | 11 +++++
 arch/riscv/include/uapi/asm/hwprobe.h | 11 +++++
 arch/riscv/kernel/cpu.c               | 11 +++++
 arch/riscv/kernel/cpufeature.c        | 30 ++++++++++++
 arch/riscv/kernel/sys_riscv.c         | 36 ++++++++------
 8 files changed, 197 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/archrandom.h


base-commit: 488833ccdcac118da16701f4ee0673b20ba47fe3
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
