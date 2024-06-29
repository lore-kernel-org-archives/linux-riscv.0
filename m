Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824A6C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9wDCGR7rRFztd/XuFUGib8TiDNdfKQCyP2LqJL9otes=; b=LggMifKo1fq8hX
	67uk2uEBt9x1EZWMfPVvXqQnyIN1SzK4iodHJYuJzwXJq8CTInfmqy/lkn2icstuaydZcSatoKDXr
	qJhhGxOOT+3MrG0YRG4kw5JTX7nstLeTLRbdZvQnuv4Zw1frIJ5ocGsDOgNiuS+sP5VTuw6kd1lMj
	M+d8d9sYUphRwNnpSDm58/xgKIXHxxyqp3Lg75U9AY+ggpvqp7chyDSan3KJ8XDE4flWtoNoyOSla
	q0p+xD2qGMWmLqJkw2G5ZoOvES0nhMdxNlAqWZalG4HeakSjPvDYVF3S76088iIxR01nsflsZlHCS
	iwXfTDIi3vL6UopUUdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNLuz-0000000FPmi-0nVZ;
	Sat, 29 Jun 2024 00:26:17 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNLuv-0000000FPks-3zSF
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 00:26:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7066c9741b7so864954b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 17:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719620773; x=1720225573; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSdyuK/9EHV/U4rOZJpo8LtJsTBOsCCeCRMcU68Fw1s=;
        b=ww6JdxNhJQvrQi1+/+zsLi87gRVeUsG2q0uil+f6o+75xfjhIppgsIXRuclmGg2/VU
         42tKLmUC0bnpRZsumdjJq9812VeEwUe7A8ZW2AgubDest7DXeKhh0JY1O4qxPp1nVd/z
         0DbIaYpZoZWlBtF0tGI7eO6Ex6zzIxclpbIx/o+V+qqSnpypWvrNTAvZmotqxvhBcZwt
         bmBFMOvIdivbEn1EmQ8hWZDvEn6RiB6OrDI5rdLJXuvJdihsMviuSo1ggD3wPimMzpVg
         Aay2uGLbGUnJ+HjAsxD8tSh4PI2/t2DW70YKKE/iubOJaaInbsYU16l9kckv6LVxXeRO
         40lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719620773; x=1720225573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSdyuK/9EHV/U4rOZJpo8LtJsTBOsCCeCRMcU68Fw1s=;
        b=GusPgk4q+hAsYMO2dstSVOii8Hwj145juk+xGxD2xlD0DQhQxpPzSlF0gHCHdWNcxO
         f+eUMvjr5Hy1Kglw5kHr8HR7mvvTw9tlPYGfSJsIWtMuoHJ6YgApyuI/I47P9VCQxlag
         x7zQsm7XjNUc0FoT42X9WDiHhiDn0pXJCQi4Chd7kvCfXbjBaXT7Xk0Tku0q7d8gz+Ti
         xDLm6LZXcmtMJAXwALp6deONDvzmnzoO2WjiFLQXL/Cy/hulj/ATpSXMTgl6EveEIw7A
         XDu3J51z2E3GvBDAJyEKeLB+62d5eIgvduwOmHbeNiS2U1dRVRUmC/4cHQ8yS66o9X34
         X5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1iYntyH5k4Ss9q2i8TPuP6Itq6ttbZohxEiI4KUtAYcTFGn/KxvIBieUmhIEM94g1c0EplPwbTiS7o9vltXuHOKaVT0MZJ94PiaocXmpT
X-Gm-Message-State: AOJu0YwlG8p5zyweItQqYM0zKNXaKE/EbpbmwbN1qgh9bjY5IbrA/i8C
	6dvGJjZOqzX97anOWxVtlUYTmtc5N27PWWRowqmhue7DMOW3GM2Offtaus44kyQ=
X-Google-Smtp-Source: AGHT+IEUKko/k4/6xXNCFY+KFjLpcjGNhy52rvbM05wygFCT1kSEw2lhuzMfsadc4asggUJvSJSz+w==
X-Received: by 2002:a05:6a00:1acc:b0:705:d8c9:f5e4 with SMTP id d2e1a72fcca58-7067454ad53mr22852485b3a.6.1719620772631;
        Fri, 28 Jun 2024 17:26:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044b1112sm2212053b3a.182.2024.06.28.17.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 17:26:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 28 Jun 2024 17:25:49 -0700
Subject: [PATCH] documentation: Fix riscv cmodx example
MIME-Version: 1.0
Message-Id: <20240628-fix_cmodx_example-v1-1-e6c6523bc163@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAIxUf2YC/x2MWwqAIBAAryL7nWD2sq4SEVZbLeQDhRCiuyd9D
 szMAxEDYYSBPRDwpkjOZigLBuup7YGctswghaxFKxXfKc2rcVuaMWnjL+SdVqJS1SIa1UPufMA
 s/c9xet8PCIo2h2MAAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719620770; l=1521;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=juYnk63GENV7/dzTgZy7CMBF5S/a+nYHrdMU1skYSO8=;
 b=99DCJWrEWmIJO23ODkaplB9EBbYalo8Zt/oDmYSmDCSdolAEaR2BUam3bXH8vdjkcvuCGOaXE
 nr6YjNkomtxAROeT1JFwg5zs5LTjxLxWlHNskwi5AmiSm7mtp+oNv2m
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_172614_253853_38EF6101 
X-CRM114-Status: UNSURE (   9.86  )
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

ON/OFF in the keys was swapped between the first and second argument of
the prctl. The prctl key is always PR_RISCV_SET_ICACHE_FLUSH_CTX, and
the second argument can be PR_RISCV_CTX_SW_FENCEI_ON or
PR_RISCV_CTX_SW_FENCEI_OFF.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 6a08e4709c58 ("documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl")
---
 Documentation/arch/riscv/cmodx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 1c0ca06b6c97..8c48bcff3df9 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -62,10 +62,10 @@ cmodx.c::
 		printf("Value before cmodx: %d\n", value);
 
 		// Call prctl before first fence.i is called inside modify_instruction
-		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_ON, PR_RISCV_SCOPE_PER_PROCESS);
 		modify_instruction();
 		// Call prctl after final fence.i is called in process
-		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_OFF, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_PROCESS);
 
 		value = get_value();
 		printf("Value after cmodx: %d\n", value);

---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240628-fix_cmodx_example-7a80383b0589
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
