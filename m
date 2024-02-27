Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E4C54E51
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciH6ZJIJG6CJx/wLO1sMtE+eKFORd1LkrNV++H/HnYo=; b=ETKLA65GDKEN7f
	titStwyHoAEtn67iz5L8dxL41JvDHyWk+zTILYfeOzrOsclVDfY3KAbngZX/r8D8rdLb8OGDxdRre
	u/7tzZXVKBHLKBAj8Diw7Z4D/8rj5H2TzmjG3ruTVxOOVoEw3bhwB0hJxgJgj0/z6J3gLClYmkI/Y
	tWyd/ZMIbxg9LOrM5uJKcw1B4j95TkgKqaGrJ54n7NSOp8UmypJMG0xsWrjwyrZ8uszYAFAtBx/nw
	MsVc/im/Xg5HCU/Pv5SXYRA8FFvl77ySejWOP4ZH/BIQ/rS1uYgfaTM6m53UCTUMWyXH5N6njI5lT
	H2wQHLWklZoeHazTKxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSf-0000000371A-1d9V;
	Tue, 27 Feb 2024 00:36:45 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSZ-000000036yl-0R1K
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 00:36:40 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-214def5da12so1998933fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708994198; x=1709598998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IhytZLl3RHTt2r80xPYLkB9iZxHThEoH75QMIzrbQ8=;
        b=D7hTcVkXs2tvZ+DZHCwdXrBEIz9UCfbUIBx6iPRof0WAY5vCIH5BSNuTHbxBAMRgml
         ErZRoUHSHSWx4vQc9RktBZ6hV74nFnZ6MKYnpdg4cLRhIfip9EF/ts3h1Ic0z5GiK6By
         kQUeMVFeAyzfWm8xHKaS3FCw++7y42tUhg6KioONVu99gAbIQJTxHoel2tJW/n3Awcfa
         RPtnYG5vUs4fID0xIKlq7YI+FnklIoipL+uRvZBoHmBccXBMqqFRUe7F0ufxC9n51hnz
         8KWedAUPdYSgND6QiF07O5asUUuboyVihoQqiqXglRtBdUYBl2APMVNiKzH2GKFbqKjr
         lWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994198; x=1709598998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IhytZLl3RHTt2r80xPYLkB9iZxHThEoH75QMIzrbQ8=;
        b=aShx5vblIZWajKZ2JtRifzuZntu3BuByiOoZQF4hgSKGYx8pBCDNUKJyiIo14sUJgZ
         ov4Dg2PdtRDm8lIUCsFLS9xZyeO9NC27bDLJwK+UPNCwONoY3meOm1IY7OfRYNGEh6GW
         vKb+05rdKNFiZ7qYj5CuvIpEp+TAF0mq5czWlN9P+WxsrPR5N2HI9MFCQX5HO/cprAmg
         oRHohYcuF92tXZgisIz6hnG/Wr4vEIerLZE3m+Z6XOsRsXAlVB9xttk45+NQhSLgixka
         YP/biJSwTZcutDjW5PxhUV4UQjgqallOC4cbHcwBkImcmom/fDXDDxYmFq83mgNc+C7U
         C65A==
X-Forwarded-Encrypted: i=1; AJvYcCX7kqvsCSj9UL9k2pvRCg0n2f+fXrnyk/iHyWVL6QcAreqEFMzxc9Eae+eet7XoHbyyVxUGX51IQvO1sKMPRuov+HhS2hcWWEr1k8wX1EtN
X-Gm-Message-State: AOJu0YxQDTLs+4IpWesWoX8dyRgRGR15f8SuOUNTNr+UaFqD4aQ6BXML
	cvDpEz9dNtcGvU1TmcRlgWhSBiLLQYRyFZZMe9Z88hWXpCGCPeTp0PY4XPoUueRjeRFrhSC47Yl
	N
X-Google-Smtp-Source: AGHT+IHuBZg/S/3Di/VYl17m/qNJYD118ohwXH+f7ieMrzQ9VNxL/lys1ubJ/2vm2l8Q2yXGwE0xZw==
X-Received: by 2002:a05:6871:230f:b0:21f:a4ce:d532 with SMTP id sf15-20020a056871230f00b0021fa4ced532mr9485542oab.31.1708994197885;
        Mon, 26 Feb 2024 16:36:37 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020a631919000000b005dc85821c80sm4504117pgl.12.2024.02.26.16.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:36:37 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/4] riscv: Allow NOMMU kernels to run in S-mode
Date: Mon, 26 Feb 2024 16:34:49 -0800
Message-ID: <20240227003630.3634533-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_163639_220958_F7DBCB58 
X-CRM114-Status: GOOD (  10.46  )
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

For ease of testing, it is convenient to run NOMMU kernels in supervisor
mode. The only required change is to offset the kernel load address,
since the beginning of RAM is usually reserved for M-mode firmware.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef53c00470d6..0dc09b2ac2f6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,7 +64,7 @@ config RISCV
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-	select CLINT_TIMER if !MMU
+	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
@@ -220,8 +220,12 @@ config ARCH_MMAP_RND_COMPAT_BITS_MAX
 
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
-	bool
-	default !MMU
+	bool "Build a kernel that runs in machine mode"
+	depends on !MMU
+	default y
+	help
+	  Select this option if you want to run the kernel in M-mode,
+	  without the assistance of any other firmware.
 
 # set if we are running in S-mode and can use SBI calls
 config RISCV_SBI
@@ -238,8 +242,9 @@ config MMU
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT && MMU
-	default 0x80000000 if !MMU
+	default 0x80000000 if !MMU && RISCV_M_MODE
+	default 0x80200000 if !MMU
+	default 0xc0000000 if 32BIT
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
