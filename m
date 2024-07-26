Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3408C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVazto207vdwCrxNB0KG5aHJ3KiH4MuUP+6Yu1XGGRM=; b=3WaxkHRiyla6Q0
	4Fiiz12MEEWwCL/OOoGggiYFxJY4dWe05pzONiMiPFxR6eAVb0G7ySsnk/aD+yx7DPxpKF1j9xKNs
	n7UOfDUn9v5LlNw3jkOvW+9csQZlp2nW0WVZuGlkA87zS+HDOgw2y+Qe7sq7+dxFCiMtMoLcp3eyr
	+Uq2/pSmlnWIUB+T+o9T2PmSzWd0x9M385ntBm+Oe6o8UtuG3dsd9K/4CGJ48juWQl3ieJhb1pEcv
	PLCoiaUFQktQz1dcPrmN0IJNB0TLOaTQUmyTww3FmcQmk8uTm3/xvJn0AwLOzWMGNNLvdoBWN306t
	NnHjeXcnWWo2kCw+Z4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNww-00000004QvZ-0x6s;
	Fri, 26 Jul 2024 16:37:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNwt-00000004Qsp-1IY1
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:37:45 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2caff99b1c9so825789a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011861; x=1722616661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0rt4u3JgYQdmYK/5XCmCvbMmsxncqWCmcN6vbrwaOA=;
        b=2w/d/M1Hkp1hJT00LOt7J8bZuqaj8zS05kj5pXxUtk7JcBawYB9JE7o4qaX/q2sZU+
         0s5vPEnSWa/n9pqR+A7QivotEEyG5cKLD+EigrwZJ0Y3DW/96D/5Xdq2tl5ud3L34YF/
         wHt8Iboias/kO9vWpC1NgkHR/soepdixJAoeLpzyApDHeM1XCsjnrbRQjEPFhFIYglfs
         Ix295hVNS1zXYuBmhJWTwPINsNkAstoHKY5hDZR3z2NyE6l3fzcQdpM04eeiccNuY/xu
         YE3ca7fP2EFPuJD0g+SWEgm5YJ5v8kUTRlNF1uOqTC50vtOJPNyFb42+u2kSInstlqb3
         U40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011861; x=1722616661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0rt4u3JgYQdmYK/5XCmCvbMmsxncqWCmcN6vbrwaOA=;
        b=AKGwh5vdqLP+tXvQUc48eO2lFpoVM820vdjZnBT6K/7w3Lslr+RRo1/d8OoZXPUKgU
         GmKgVEgoWnSS60dIi16tjSHjrjr3InEERSwU5dUipBfReSVBh5NOh+eLfTGhySptgYfw
         +KYk8HJi8X7bOm06mRtPgtAyft5X7ezG83mGZovIdjYRPOm7Djx3FSv3KHOxrGYHwKYM
         FrX8vI9wDylApbP9efFeBsyBebvRHjK2gkvU+LAiXlc7U94b91B/8qRDpUEQuaZ/bvul
         pTg/Icad4l/zxuaIeifgIZdtpBsgxPZ091apZBdQFRGeMGCLQqgUm9P8XbasN/PevHj+
         nvmw==
X-Gm-Message-State: AOJu0YxazJfarBHZ4EMWCKy7jnx/qcJrZY2ZreNAi5XlsW1f8duacOlu
	c2Ek8oTEB2dk13dtrMBWDVn3cgSE2+LZY61UFF1CdWoXq2fDWWA6KnUFf5wWj/wjHQCv0Hjvn+L
	G
X-Google-Smtp-Source: AGHT+IFt0Hx7tCHd8rmEPH3r9WQzWMpJRolI2HaFqal33DHnd4BM9lIVbdq7BXaVWa8aOT/1lsYEQA==
X-Received: by 2002:a17:90b:2552:b0:2c9:62be:292a with SMTP id 98e67ed59e1d1-2cf7e1fba30mr38548a91.21.1722011861534;
        Fri, 26 Jul 2024 09:37:41 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:41 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 4/8] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Fri, 26 Jul 2024 12:37:15 -0400
Message-ID: <20240726163719.1667923-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726163719.1667923-1-jesse@rivosinc.com>
References: <20240726163719.1667923-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_093743_757800_3F4B3762 
X-CRM114-Status: GOOD (  10.82  )
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

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
V5 -> V6:
 - New patch
V6 -> V7:
 - No changes
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..b67db1fc3740 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
