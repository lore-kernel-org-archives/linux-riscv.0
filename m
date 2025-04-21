Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF52C369C2
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3pPB7Oe1hjIcNLE9s/x/kpU01UXC+xdssqK/m+MW/jk=; b=SFzqC52k3L120c
	T2yvo+HCss2Q8+8GphTftOwi7LudHSMyGK8TRzobqheFkDHaT3HAPFCWAKIhiYI8GXuZZRFYCaash
	gVqTHkZ4TUpEJb77f7LGW/TZmcg0eRG5nlkgHDsGh83Q08jPqvSdd1r90IeHkIPtSdZRdvX+VWG95
	rB0l+Ezt0jLSXTehT+VWQf6zMxP1hmj+TNChDPjB302chQfAulzw0ADTWxKvQvVWEYk2C4JevsgCO
	niQxRrPHNLTkAADaalCcM2UFBTypgmscCLIEZtSOawZSaW+zN3BOdv0/I66iqIjGzXAE2BU/RnvZ8
	7yMgwL00BDzOf2ZMmsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s67-00000004Rsw-1Ffc;
	Mon, 21 Apr 2025 14:26:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s5N-00000004Rh5-3GrJ
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:25:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so47673165e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245524; x=1745850324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toKO1sbJD3mjCZojiPpBgF8TUiCeKbxXOR8aMRMuFBs=;
        b=UiEG205KpJTj2kBnPt528t8ajT8DXGqKDqPERTcVmMhFB4gsO8VvmmU1M9JWB6sCJ3
         FeD0QYDi8HbDrxPzBo1gZmAIs0/CEkbjshMoHfPQ9BBbebwB5raOiqno/pQulA1LmEUf
         HhjGRtnLDC9dB1qOOb/fPMy48dUkJLZaa49pDpZMedkgOAIDjBZiWKqf+T0pZuv8poUn
         cfneZsYo2FjOkWbZ/K5CevOGP6+7vTNVDHYPbJQcfTVor9zSY92xDsV0CP6Slsl5HiYk
         ZykeAJcwqLQee20y8W+hYx3BcJlU+zDI/AuOE7ziUMPKQbHoE+c6kRoR/SVN6UvHg2XI
         sAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245524; x=1745850324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toKO1sbJD3mjCZojiPpBgF8TUiCeKbxXOR8aMRMuFBs=;
        b=T/f80G9gS4V3ChcqDehjQ5dxAdjYnCSaChTKT7hFJD2DBbpIbrw9jwJ3vRTHwC0Sy2
         RGAIUAu6FuVi4NRkW25genKuYSarYw89fXTFO1UE93EQKOqLcIerHi9N04SxV9jDlGVM
         x1FBuCTx/F/C4bVUw27qv3n96Y2GKNSEvZV/aRtaLlyYFKBWGkngqniPc/qMVKiumcDD
         2ow0ApyJy1ZP7h9q9hpQA87RsWTxwvDSP3Uf368NolJCZ6AeyE/778/eEghTYsqxMMpo
         44c3ol2wpllk1Te30Skvi1fyc5lXwtaNca6Rd7hdv08MOEc5m2l3fCPegoGAoBFm7rhO
         etbA==
X-Forwarded-Encrypted: i=1; AJvYcCWjoulxQjFw5qJFyDYRb1fQICT5AkB47es7Bx1BoTNc23O1yvjcylmHvolHmwrf7JiCxHk/GNq8ElehTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeabcenaxlO8CD5bexGw0XgXF4vjnhQGWElZWyGA4HQ0FdxXVd
	bNIsxQJlptPebaG7LxcPkpx6M1dH4EqwxRXSEPcIidMDl9ug4WCIs3oFHIyjuLA=
X-Gm-Gg: ASbGncsoW4OqzaMXuMriwhecgTYkYh0PbfpwoyA1hwNZgwcJ4klmAZJhOAyR7/8qJ0E
	C/t9HrGLQt6c+RLmZbiqDb18NR/73ts2MdLen3dp08BDsK3FAIqk7iNWG6blCZrluOiAoKHvXQL
	f7jgQFjYvjW0VCHgvtnHBa4rfKMwglrVCI7dtOridsThC+iTC7n/mK9wUVkTAU7k1ty1LLcFAVM
	ueXHXcnlEkb+cFLxVKiHmkPE2OToaTVqnT0Yjoc0FpIr06SM5WEgwbTA1oHK/IEgMPqeMfGuoK6
	Ii8i6ZoAGVoWNk/rRT0g7DvccIeMBEepzojiIHihpc6HIMx7sMvs3DN3rCc=
X-Google-Smtp-Source: AGHT+IEQLqqHojl3Rtaz5jkvsm1plxH9LhG+i0zNjFhjUyPMpSA/8M2QR3ivKWaD+zb2wwThWQLuwg==
X-Received: by 2002:a05:600c:3d86:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-4406ac176dbmr116056225e9.31.1745245524159;
        Mon, 21 Apr 2025 07:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6dfed6sm135615795e9.35.2025.04.21.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:25:23 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
Date: Mon, 21 Apr 2025 16:24:37 +0200
Message-Id: <20250421142441.395849-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072525_817245_473F18D2 
X-CRM114-Status: GOOD (  12.53  )
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

I found this lost series developed by Guo so here is a respin with the
comments on v2 applied.

This patch series adds Zicbop support and then enables the Linux
prefetch features.

Changelog:
V3:
 - Fix typo (Drew)
 - Split first patch (Drew)
 - Ensure that the bits [0:4] of the prefetch insns are zeroed
 - Move PREFETCHW_ASM out of ifdef (Guo)
 - Remove CBO_ prefix for prefetching insn
 - Add prefetch (Drew)

V2: https://lore.kernel.org/linux-riscv/20231231082955.16516-1-guoren@kernel.org/
 - Separate from the qspinlock series
 - Optimize coding convention with last review advice
 - Add DEFINE_INSN_S type in insn-def.h
 - Add CBO_PREFETCH_I/R/W

V1:
https://lore.kernel.org/linux-riscv/20230910082911.3378782-4-guoren@kernel.org/

Alexandre Ghiti (2):
  riscv: Introduce Zicbop instructions
  riscv: Add support for Zicbop

Guo Ren (2):
  riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
  riscv: xchg: Prefetch the destination word for sc.w

 arch/riscv/Kconfig                  | 15 +++++++
 arch/riscv/include/asm/barrier.h    |  5 ---
 arch/riscv/include/asm/cacheflush.h |  1 +
 arch/riscv/include/asm/cmpxchg.h    |  4 +-
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/insn-def.h   | 66 +++++++++++++++++++++++++++++
 arch/riscv/include/asm/processor.h  | 25 ++++++++++-
 arch/riscv/kernel/cpufeature.c      | 21 +++++++++
 arch/riscv/mm/cacheflush.c          | 14 ++++--
 9 files changed, 142 insertions(+), 10 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
