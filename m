Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C76EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KC8FyIpUviAHaE6XmW8v/cG9sqEhJNuiYMcW59ObbpQ=; b=gHbM2+iXZirD5U
	mEB9rWf5tIlwl2DeP7ei2NMUnPp90N937FK/D5ZrOvlUigJuIqqW9arTriPep/tlo1yt9iHA3q5Aa
	pqmNAozJrX3iK6fg2QHEstcigWxMJ93in0c2aDUXdky8iVqcZyFzQA08GdY4UXZCqPQ9CeDgTdncR
	E1znRypDOd8vnDiKilnErhcL/YTP3/Jcj1nAE4dxxdgIXjWEDgfvon11flR+5c66LZNOLiA2ZTOTB
	c3Jp1a5A1RFMca+/1Q3QOeJoYa4CPfHpjtwQaOaNP3rA9/ju6/jn+yqqEw/Lth9vSJPmg+rntr8We
	xSBDJs5IT4kuKk4+1zsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1K-0093f6-0Z;
	Sun, 09 Jul 2023 11:56:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1G-0093eA-2b
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:56:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so35822285e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jul 2023 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688903760; x=1691495760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ClPeT3EYDSTeWck+8VBf7+eniO1xXUIIPF5EwfwLuQ=;
        b=5i9AaQ9oato3/UxUWnfrVKNEXN28gXBBgsEndPj8lFkXiNp7pn4eFUss8XieUktpqy
         jnPYUs/Wt9Vrf4StdEQ6ugsUeHuFEsX+X5uRxJVr0tyiqbOprB0V1AA1D95r53Ebgity
         V3d2HOmJsNEcFrvdKWA5Z2/VwROJmRp+hKAuqE1qaldiaFPdxtyeEp71N68BOMnF232I
         EzA4NRw6o44BXBEIw9D2gr35cUyHZyrIRadIYZrp8kW58H9CcvV5MC1Y907oUwVOeCDb
         xuZ/ShwvXjLUj6hbV6prgrXglCW+neG8ZjMcNXfNZ7ItK5dhYtVETNTOI3mjCFemhKVA
         geFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688903760; x=1691495760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ClPeT3EYDSTeWck+8VBf7+eniO1xXUIIPF5EwfwLuQ=;
        b=hKo9gtbsYSqCs9GX5WwQSmpk2AdEcv11Vvi8RG9a2OjThDCYBxtAxnv0B7SZGDLmsX
         dfl96JhFWLCvcdu+tb0oi1KUrcZehPfsZ9BTlRKcFZnbQ7hPt1Lbdh8lYESywmO2pKJt
         PBAs3+CMaFOR+Hc4x7z5M3gyzkZOWCkXCy6tj/oiVP7Z+eJD1scYfwAs6btCNSW+eL4m
         V5rxEOHqg+ygVeb7tyf2hoe69yQIm7sG1HdeDNWOz1Cc3qZzlfpNOg/THckrKKgqt0h8
         hiIADXYIibGRrUeJTsEul6TsXcIklndL0TFrcLIX9uHsbzhRiKphob7rhFMY4v/V3W3y
         f2KA==
X-Gm-Message-State: ABy/qLaFr3rwtvcljdQ38lpLapiD4Fzw4rf4a+lUM12cXD+2rR5KG8Uu
	PcfdgVYwbowB6ftmuFE50y951g==
X-Google-Smtp-Source: APBJJlHwqX8wno99Ei1SLO2rybrVSZr3aNNZ0UqEPWijaCDDyP/QUsRHI0gO/gMYZS+xZN2BsNDNxw==
X-Received: by 2002:a1c:6a0c:0:b0:3fb:ab56:a66c with SMTP id f12-20020a1c6a0c000000b003fbab56a66cmr7071774wmc.10.1688903760019;
        Sun, 09 Jul 2023 04:56:00 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c02c200b003fc007d8a92sm6194101wmn.45.2023.07.09.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 04:55:59 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] RISC-V: archrandom support
Date: Sun,  9 Jul 2023 13:55:42 +0200
Message-ID: <20230709115549.2666557-1-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_045603_091678_CD5706F5 
X-CRM114-Status: GOOD (  12.56  )
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

v3:

- Increase the CSR SEED retry loop max iterations to 100
- Document the added extensions in the related dt-bindings file

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
  RISC-V: Add Bitmanip/Scalar Crypto parsing from DT

Samuel Ortiz (3):
  dt-bindings: riscv: Document the 1.0 scalar cryptography extensions
  RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
  RISC-V: Implement archrandom when Zkr is available

 .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++++++
 Documentation/riscv/hwprobe.rst               | 33 ++++++++
 arch/riscv/include/asm/archrandom.h           | 70 ++++++++++++++++
 arch/riscv/include/asm/csr.h                  |  9 ++
 arch/riscv/include/asm/hwcap.h                | 11 +++
 arch/riscv/include/uapi/asm/hwprobe.h         | 11 +++
 arch/riscv/kernel/cpu.c                       | 11 +++
 arch/riscv/kernel/cpufeature.c                | 30 +++++++
 arch/riscv/kernel/sys_riscv.c                 | 36 ++++----
 9 files changed, 279 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/archrandom.h


base-commit: e8605e8fdf42642048b7e59141deaf8e4cf06d71
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
