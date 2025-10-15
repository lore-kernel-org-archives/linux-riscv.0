Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0494FCCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 22:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KPSc7kslAjDQA2ev97RaOZboOcoHPK8pZry3tc5lQEk=; b=bQxyquKs5nZnVc
	r7jkQb5VxTjrXFPbUrimcltgFfFj32RcdAQTADdXz91R5zQwP6AYa62QyWNv5FTJrJ2Hm/ZtoEqEK
	BkejsalJTYpdWHEi72AINumn6IejBv19iS7/jpiWfL91G3fIIZZ10+Tr5af0uu0ZBaMXVzqXWHTFD
	spf1LYsMbRP+iAuXm1ZK1mh7PknNWYIx2JGp73QV3fHSiI9idMSf4M2zOXYs8UJ8ELGUWI6AXDDb9
	191DY3ab2jjPftLtzJTQ3Wed0r40gMZImwuedIUGFOl6IoWNrnmOKbCu5mFWR655ggzlOKJkbTXI0
	wgH23L3mVSuoHDtXGG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9APk-000000032lp-1fIg;
	Wed, 15 Oct 2025 22:56:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9APe-000000032lM-0w26
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 22:56:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so124600a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760568965; x=1761173765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmd6Gbc/aLFm7anjGNLJMoxHRshjAtp5OcPtG6yYWY=;
        b=iUQnhmktj5eDmYKF6qLG7yE9Neh2tGONisIAjv0dFq/KBlp0iiS856mey5PAoipCnZ
         Ysbfmi41sMwWR6Vvd0YN96u/UrG1+dKaVNpqrNA3gBpkCwsrz1iVh5gZ9vF56L2ZVwxv
         syyy3T6SB2CZu1i2qO1gg0Y3UNF3hKX+F3qIzKWnEMaQdvNe7/FYWnHoxzii9YEgsw77
         UeyMx97dVekZEWNEomGuDKWetEWzZKat4L+jXt7nywrCWTa8M/tfvhDeVa1H5ctc7DqN
         uplR8B5AQWAX0y6Kip5Pav5bgtpav4TUIn4lWA5/lLNUSmkwFKqPN3U2AMMrk/GA+RBI
         HpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760568965; x=1761173765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFmd6Gbc/aLFm7anjGNLJMoxHRshjAtp5OcPtG6yYWY=;
        b=OMqQB1ayfjbzUTfWxEV/xILCdbYwSqX/XcEIvOWsxr2nZ0u2IWmKDrXLWVga9DvRgP
         SeAOWOszjXOTBxynMSO2pOHd/fscyrFpp+kVUx/YzEsnjQ8XiPZv7TA6UQY+GQVaZ/+J
         ascEktiqawxLE6HQRUrgE8Bhxrn/bFcgDw98XUVa9hu4ESwftND/eXBNK1hc/Hc8GXFq
         lawSMAcJZeUVRSL0mmlDfylw/tyreBD9fhqXm6o6fM8gT59gQTK/HVHUzDQNRwfiG9a4
         2g4QNhOmpl2MhfZO+s6+bf9y/pLo0kKHRJw3/BDCYq/KWUmlwUNBpUn7douFGUU7kl8c
         /8Sg==
X-Gm-Message-State: AOJu0Yx5tT5St4VimepVWeGglK/KELcinkbCuWiBflBuEDkhI8UOHAH9
	ASqg9Ttl2PuiHq5fCwaUZ9wPIK9DcOv/SYKdrBGtfU7cjD1xFXTLjhWtgv8MnzrusngkEXYYBP7
	cWexZ
X-Gm-Gg: ASbGncsgE6vtmiMLyNeBEBd3KqnTl6hNK0kUruJASkvH6piYKHhYlLfrqZLOXomuffg
	SECUzrazl6xRSDCZQ1ooKMqsg86u2aMsN3tsli/XFdgGrydVvkHZ0yecuv0Ij39NyT0JUPCKz+o
	UyrF2P6SjmPucc+qdZ74WnIeelIwD+ueE1azFw7UwbFvJgaJ3H/L4UnHfa3cAbrvXBmLMJZWiPB
	v34irxR73pI8f5aYiCIAdvavEHmQ0STQf0X5uzEqgKhaL3G+Ur31LKvm/1IpG/849QMu4Xfqfw4
	S770clTQWLKvDeP3eS2f2gq9SSirm2wfg8jwOtNgPwXdpf01kIi+IGEN/wVM6vk6aYpBgJoybhC
	RF2baTpl1S+y+ML1MhHs+nMZryv9Jrmkakk89Khy5gsDSMJkROb0ucZzDQJzdwZe40OuinP9vAk
	IQSIKbYGymKZwikLFYRlQKdFP8Z3o193RE
X-Google-Smtp-Source: AGHT+IGMDc40TRec5CNPCGntnVAlaUyey/p2L74uxLAtYHLpIqRuuwj9pmkS0fKnBmRsmWayiBsKhQ==
X-Received: by 2002:a17:90b:3e8d:b0:32c:38b0:593e with SMTP id 98e67ed59e1d1-33b5114d3d4mr39059251a91.5.1760568965288;
        Wed, 15 Oct 2025 15:56:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33ba927394csm243597a91.0.2025.10.15.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 15:56:04 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Remove the PER_CPU_OFFSET_SHIFT macro
Date: Wed, 15 Oct 2025 15:56:00 -0700
Message-ID: <20251015225604.3860409-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_155606_298550_D9CDA97E 
X-CRM114-Status: UNSURE (   7.14  )
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

__per_cpu_offset is an array of unsigned long, so we can reuse the
existing RISCV_LGPTR macro.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/asm.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8bd2a11382a3..ac28066bb564 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -84,15 +84,9 @@
 .endm
 
 #ifdef CONFIG_SMP
-#ifdef CONFIG_32BIT
-#define PER_CPU_OFFSET_SHIFT 2
-#else
-#define PER_CPU_OFFSET_SHIFT 3
-#endif
-
 .macro asm_per_cpu dst sym tmp
 	lw    \tmp, TASK_TI_CPU_NUM(tp)
-	slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
+	slli  \tmp, \tmp, RISCV_LGPTR
 	la    \dst, __per_cpu_offset
 	add   \dst, \dst, \tmp
 	REG_L \tmp, 0(\dst)
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/percpu-shift

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
