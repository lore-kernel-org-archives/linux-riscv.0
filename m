Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC9C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 23:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cj2V44gqU/Xjek5sobsPgKvh8nYuQ+xXIssVmriuaE=; b=OKTNuF8AtVFfHd
	ZlYkkhSb+hYHhiM0oSJ2RgMijsxWXEugdpphmonNZJo6yfTjWnv6OZVTnerflPdZR2EaXc8BFLUag
	rsoqxZGTgxUh8hWD2cmQPRYiMh2uT0wzvV6lII12ldHjmTyBBVIEr2qvFqKjav+HFtJHQDfkHZDc6
	ltB5q/Hjju5KwEOw2DPdZtjefDURXVjMuxYGHfI4k9rTv8BkA3tHhWu1Wj2tum09vLjzRmWXizCMW
	mlxmdy5l3Pf9d1X553vSj6KmVYZYTB1ElU4VqjtOxVTgK2cx/Hs7ApqmEGmFeDUBa0HV+D3sc7Lmf
	JNFVITvjFvgz6YXgz8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZi3N-0007g2-43; Wed, 30 Mar 2022 23:48:41 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZi3J-0007f2-QP
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 23:48:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id s8so20294058pfk.12
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=mbvQcvzRMWuLzmRogAceckeWGzUztkwWXFc3ujFTsg4=;
 b=hKV3NtwLlixYyPl3wYg91OPT9ev6NMYgYVcW66JImWNV4H6l/6QD6bu/oZiuPvb7sU
 5c8wjhHFBrwPjLGHIWwLfasYWOKBYez82T6uiRd9tEBtKc/Ss0PPdxCegGZ2+Iov5gDo
 fv8EC2gXx/eL3evXObW0dxrjs+T8yl8ytIuSdoJ+jRxyWTsZtn6YOkuyJA27F1dn1E+p
 KFW7TRR7tJNQICZ1fSgt5g9NqKs5v5bSvp0z5XYkLvNZ3h0fdtmMamnoRJVsqrijGOsI
 Rl1PywIQbfbX86u+RNGW52gA6f8iVv/nOyyWFRIbWlbgsSFU+IH/iRjtQx5lCiRfQIap
 axKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=mbvQcvzRMWuLzmRogAceckeWGzUztkwWXFc3ujFTsg4=;
 b=xR7+HWpq/Ty7MUZ7Vss5fU5Av0IfT20+qUNQxfpB+CJLE10+nxAg56SemuibpcvfxB
 VdUkbzC4EspCICpWDRNt7JuNjaya3olJy1wujChtgXfeawHbsAZtgcvM4rPO/T8gVQPY
 hTbu+MR2pZ+QopsTm6LZcewQM1p2mszokXPODDTq9edeOvpOq/6rpGpFWm9HV4/RRU35
 ineX8PfpX2Dtdxjdpeyqocq+mO6JUXMn7rs2+XGsF7zVXg/j1dxciO4YEqhAu+cHgwe5
 Vm5stdxiXrMk1++jyrt4XNpJEHtpNZ+tejZNszi83MJqJaU8QF6prqWFikp5rzoFEMDi
 OKIA==
X-Gm-Message-State: AOAM532s8YDKhGIWQOq/JwNeU665pvPiR2Tqjdvhv+FKger5bZcXEIKS
 mkISk0Y/No7FAR149ghtB7g6Lg==
X-Google-Smtp-Source: ABdhPJxUfdCHemwktOqu1uVW7qEFwNUDvkbDuengsBjhft82tKgxYanWnnNscNq7+SEqmDqfxxpj4w==
X-Received: by 2002:a05:6a00:130e:b0:4cc:3c7d:4dec with SMTP id
 j14-20020a056a00130e00b004cc3c7d4decmr2142386pfu.32.1648684116701; 
 Wed, 30 Mar 2022 16:48:36 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm20075524pgc.64.2022.03.30.16.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 16:48:36 -0700 (PDT)
Subject: [PATCH 2/3] RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n
Date: Wed, 30 Mar 2022 16:47:38 -0700
Message-Id: <20220330234739.1956-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330234739.1956-1-palmer@rivosinc.com>
References: <20220330234739.1956-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, heinrich.schuchardt@canonical.com,
 atishp@atishpatra.org, 
 mchitale@ventanamicro.com, alexandre.ghiti@canonical.com,
 damien.lemoal@opensource.wdc.com, 
 axboe@kernel.dk, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_164837_879538_5A1BF315 
X-CRM114-Status: GOOD (  12.32  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As of 93917ad50972 ("RISC-V: Add support for restartable sequence") we
have support for restartable sequences, which default to enabled.  These
select MEMBARRIER, so disabling it is now redundant.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

I'm not actually sure this is the right way to go: presumably the K210
defconfigs had MEMBARRIER=n for a reason (maybe just size?), so we might
actually want to move to RSEQ=n instead?  As usual: I don't test on the
K210, so I'm not exactly sure what the constraints are.
---
 arch/riscv/configs/nommu_k210_defconfig        | 1 -
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 arch/riscv/configs/nommu_virt_defconfig        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 3f42ed87dde8..2438fa39f8ae 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -21,7 +21,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 # CONFIG_IO_URING is not set
 # CONFIG_ADVISE_SYSCALLS is not set
-# CONFIG_MEMBARRIER is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index af64b95e88cc..9a133e63ae5b 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -13,7 +13,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 # CONFIG_IO_URING is not set
 # CONFIG_ADVISE_SYSCALLS is not set
-# CONFIG_MEMBARRIER is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index e1c9864b6237..5269fbb6b4fc 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -19,7 +19,6 @@ CONFIG_EXPERT=y
 # CONFIG_AIO is not set
 # CONFIG_IO_URING is not set
 # CONFIG_ADVISE_SYSCALLS is not set
-# CONFIG_MEMBARRIER is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
