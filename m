Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687CCCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt2GAg3zt/B2sYmOJNJg/TCdBULVKgj6WijaQmx33rU=; b=SblQNW5h3dlCTx
	Zxy0tpaxF8iG7uzEzoassqR58M9s/DJ+ItLadHkjSIBamCH5Qdi07SlLlm2oDH2IscQgN4mIh3NL9
	5+xPdpdIvcrcQRAkx7NAlQ424KFmyz9XW2DzwmQeOx+XvZk70rnhZr2vHL6yfe07VQB/gHni8hIEz
	beqiz6CnoWqyH21zzM0uG4WfzYrVB9O6Ku8Ozfmfglx4Z9o6i8mKlXxIEDUKFNVrpfEYJ25YFXpqo
	RPZHg3FEVS9fAdEjkJkAzI0HXRUmchQGaBF7U4ifIrSZ5STuCt4ObVwOVCbQLWRPvvPX9wL+PIjjN
	OpcVSSULyJh1mctO0Ckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fw6-00000004zcY-0hk2;
	Thu, 09 Oct 2025 01:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fw4-00000004zaI-1w5b
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Oct 2025 01:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hsaEY+Rh/SX8Cp9wIkDltmX8vYREKpu310o7cjQ17zs=; b=THcuuaZ9ppdVtywx3U8cCrNdzg
	t+0X6wA05yHhJgfTNUtdv/EphitilivJRaaGkQX/upMoyK6e6v+vaRixEQNEch77QNMmxLRJcO0Lt
	OjoZVGEnqAtJWsDLO57fpOwXecBC4APdHYVKLIN0Qsk6ifM9WdYXlShZgltgbuvoCP+lBuaEu8xI1
	5APVUWuSblgveqQz3q0LigqrhCn9udBC8JpIKqfA45Q0N+CnRxE4yTh8Vy+mZ/SgOUQbyVQWQb0zy
	i13tlqexdXMesphkY/c1V/2Uf+T+8W0A4PRszvH4NWiCDR+c5GbS1ntgVrf3T07P0asABPngyX0UQ
	MCiFgWpA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvo-000000014FV-2mrR
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:59:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27c369f8986so3828515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975138; x=1760579938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsaEY+Rh/SX8Cp9wIkDltmX8vYREKpu310o7cjQ17zs=;
        b=b8e56S4rPdpaLFTNF2+dWDgRJ2L3OVLgq2yZ1bOJ/bvKFNjk0HHQ9IS7wBdQ12E7/7
         UVssJtHqGXcKxqOEEGwH9CvJlLabEmq42Ixs5kJxF57QVhWHXgQbCzO2DOL2Ua3zZVuZ
         PJOIg/+dH5X1DHol21D0fDKmdFhAgWPKskdho+p04FS9+Mr1Vm2vMS1St7JY6C/frm+c
         UyPIFfKBwUBnRT4SeLp4tQ/ireETxmPmVw4W7bb3Hid8EBIYaGrW91GWwkDTK23iIiMr
         gCZh2fR03kNV/JIkc62p6oRS3aPI8Qv9xMjED/+N5RWeymXNN9CoxzVtTL9uCY9C2ENV
         gfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975138; x=1760579938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsaEY+Rh/SX8Cp9wIkDltmX8vYREKpu310o7cjQ17zs=;
        b=U/wDVbDAHabkzrUcewW444eN6EWH9lyOzWivwRlSmnHXz9cDesihnPe5sGgXowuzd3
         EoqVP7iRy4q4M+lJnGvk279ZN2dJPDN6UUFIi32C1Itwf5AuX4it2p/ur63QMZioDiXy
         mmUWH0CCRx4Ov9SGNHGka3jrxnt7Uiisal5Ism3CLDEIrgb95Hs8VRZtl+mktXGxP9P/
         LhoZZAKT1wtwM0wwJuO4c6brH79+dxfT5Y8+gVVufkY1QF/jIYKITwUZjN9bk4T0QVZ7
         O5kxbkMurGKfaN0keH983SvVSW0sNyb8ii3AzedbaQvVxA0lcQEp2UOwz5Db5F5yLz5U
         4Dhw==
X-Forwarded-Encrypted: i=1; AJvYcCVV6epYP3l6ovC7YqRKogSYKE1WA9FnrUH8GLPgnQM99yCxlLsNWxyyiD7cv3WGOUnnH371mFGu+Q8X4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkk+GQbIdAgKKHLQQzv0vtXwlPWaXZj/KIiNXPIZuysd3IwGF
	UrKIuna8b6iWvqSoCFdq5GGlJMuUT/1MAtHnqAJuNcawJUZyHhCOPRXXiHzZJE9QY0U=
X-Gm-Gg: ASbGncv8EOyvtHkx09166NgFQZQJwaSpm/6a6ObQupV97N+BgI+kPp+0nWdQYzx8aot
	VPE//i6j4HAChEtpoRl+5uKuRXQ5LtxAqUnGhyPSMVHWg/wDHEdBaTTF79N3d/hlhGNY8nKzM8m
	WOwRiiFu2KqPb80f2qE4NBDoE7y01kMfGLydWPfkImcEJbBvo2E7zmSznyw5i5YTTgffaJQWplb
	mWieZlev9yP0pVffmqzi9919HvS0mhk0+DmVFrK1bLQuNGUdJl7ytnDYcNg3+XVzGVQPWzK7OCK
	MUGyzFAVXrYIpwbCE57dzZpdrCNlXkqrC9sWwBKIT+DxG5rXzh35zQH8Z56BrKB2K092Q8nuuTW
	Hptl9UgD1TxTXCU5OXdquaud502BYT6uwD2jxlLJSxOw+98DAcbRFQGfdX69cC/pmKd4o
X-Google-Smtp-Source: AGHT+IEK6h9ymUfW6feQoPDds5nddPhZXwbaTwfv9f5LhAo3XesBm08EFRVtNsNefL2i5+3bnakD+g==
X-Received: by 2002:a17:903:3c48:b0:268:f83a:835a with SMTP id d9443c01a7336-2902741d091mr61417485ad.60.1759975138296;
        Wed, 08 Oct 2025 18:58:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 14/18] riscv: alternative: Allow calls with alternate link registers
Date: Wed,  8 Oct 2025 18:57:50 -0700
Message-ID: <20251009015839.3460231-15-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_025903_618955_58946FCC 
X-CRM114-Status: GOOD (  11.94  )
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

Alternative assembly code may wish to use an alternate link register to
minimize the number of clobbered registers. Apply the offset fix to all
jalr (not jr) instructions, i.e. where rd is not x0.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7eb3cb1215c62..249ee55d05475 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -121,8 +121,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 			if (!riscv_insn_is_jalr(insn2))
 				continue;
 
-			/* if instruction pair is a call, it will use the ra register */
-			if (RV_EXTRACT_RD_REG(insn) != 1)
+			/* if instruction pair is a call, it will save a link register */
+			if (RV_EXTRACT_RD_REG(insn) == 0)
 				continue;
 
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
