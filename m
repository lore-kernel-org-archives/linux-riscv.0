Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B34CA0EED
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e13z8Ysl4OLvAiCbgLJX296D6cCd0wiqRIoa47r7he8=; b=nlhrvuy9GQuDUI
	c8XHRfSXRHHAGXwM+co3AN7w4SxK8nIO6vmdyftOwhSfSRDaZQfP2WluSrtkxRnyAeHV1hM+bt+qm
	RJhCanvmPwVe+LVXYQe5K1WqI+K64LcPvmHRoDZ+HTXw3giPAnoJn/iWPzdyIUzDs29Z38Hdl8Yrh
	QjZWn9wZ65VmQinTLyqdAGG/Hby/Kk1DjGaSOruhaOFRo/pYQHuJZIjZohjyZinbQFGXsDWkaCI46
	p99zUx/+spkJ2gx3tfzYkum++86fxa7tFQ8ofiAfMIVPXxTnhNbEdWO0wwVRNXIkNMhmZ9FV36TBe
	6Iq42mYzlFYK5i/6JPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGvP-00000009hLn-1CT3;
	Tue, 19 Aug 2025 07:38:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGXC-00000009dCP-24D3
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 07:13:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2449978aceaso7642215ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 00:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755587609; x=1756192409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54h6HYLCIyFowOQ5k+dd7fW4m0Sq6cnWtzdVWW1yskg=;
        b=in8LgnJ8DIrswBEBpAQDZOcCc5xM9W3I80TFO9vPPGoYZufMCKRv4yOvYbpmUnS6he
         qigKMGhvXqkxce7TZUJ1U/Qdnw1cgjNX37cuMA+4gj6yIz8ticHNYeB5EIazJDLN7hmp
         CONY/x4x2wGlw/jP9aHNGl4Czz7+viy1vTwjDfSrCMp04HrLhWbfoJTu/x4p6/Aa4ed6
         Wor3JRNw+u/1aZMkvkv10UYKrBNM0mdVbFcyCuV1fY9MAwDCBnnvxbcdq62TpuMOOa6C
         PYs/R9iak3P7yYtxl0//dB8KJR8JENl/T4mvgUUEQiWm6+3HaHBPx4bbxLdAUMgVVo+v
         JUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755587609; x=1756192409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54h6HYLCIyFowOQ5k+dd7fW4m0Sq6cnWtzdVWW1yskg=;
        b=YqUxmddQQIjym+lH6g97LEyBRXJHMqe+N2hMrDiDfxZMJx7zYa4f0QIqc5lNr1GJLn
         q4KRqGEN6yRVanb1oRJuhmyHyjLw54Hmu7YJYubiMgt0FrjPAfXNJYBNka4YRmlgViC0
         PEwrHpd7TzPJcsIeivSOzja4YXvNFqTOfahxzu/rDvG+g6sP0yyromoyoDQcxGvbMrTd
         dtPqh0mtmIwZ2SCJBdzKuy+06hiFa2byxwVw12gqaQOxtCEwPTD59CTdUVCsbbW/vlF+
         xAEUUX9SV/tZ4m6xAs8zXU2lVUpT/LRz4P1fMURtxTVL5v4nZnYksIPVncNnQBGTwQdw
         0Qkg==
X-Gm-Message-State: AOJu0YyDt6Wwc/Sc7OqlG7E/GiXG4OVV4iRgQXUVsAkaueL6Zo1JAUOG
	a7sMiW7AxMaitVLhEbnl/Fz1NJZnOKUttwv+LfXS0Ddo+UAQWHKe77TyYGejXu0KGirK6ZB9UZl
	kK5bOtHgKOlXRmyuUaCBCV3ZN7G5ZOjND5JQ3dZfAOWt9Srvfg9vlp9faxYvL+wWurkFva2neZA
	mlQyQdR5x8cNXJ+4IIljKSgmSyr+cIhihHLczyuRtFElA1nxP/R8RIysj/vw==
X-Gm-Gg: ASbGncum9WU9i0of2rqKURckDh7YD8t82wYyL2pzInmd56CJs6xQILTsRFKZsnmQ5dK
	zrCzfdf9WDhIFqP1aRCLzFy0pQ1yDCygaM++/PgrEJTNt37oVloFcC5nKEfzRcM6na6hFHlutlh
	bSXN5uYDov5LgnNz8SL89xcE+cbGZb5VE4yNScs/kE2RJGumiLrhWkQvKKvFOOCD0RGa3i/mh0B
	9PLZPS+E2t6aJdB4VuC4pY+SoTOoybJT50Gmcs0WDlYT/hU5ovrzYLccJGdDMvMqUReSxaJmlue
	bYUsmgYLuQYDQi4qRt4A2eO8EpYfpFBtmM64p8dpRUmw/rbI8L6Bn41dJX7C6HXQoNZ0SYS9MPj
	3PApOoRXP8UH+l4sef1M8wPQyo13XuKLxzk74qAc3JCekgQ==
X-Google-Smtp-Source: AGHT+IFgLj8ZUjinADX0iiyxMlpjCRbQuMeIpCjPaYhpGuAKm0Pcum7h2PqqQ0wUNesJ6iACw9jDCg==
X-Received: by 2002:a17:903:22ce:b0:234:f580:a11 with SMTP id d9443c01a7336-245e0309271mr19635405ad.19.1755587608797;
        Tue, 19 Aug 2025 00:13:28 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cae6213sm100213915ad.44.2025.08.19.00.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:13:28 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	ziyao@disroot.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cyrilbur@tenstorrent.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	kees@kernel.org,
	ben.dooks@codethink.co.uk,
	jszhang@kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH v3] riscv: fix using wrong load type
Date: Tue, 19 Aug 2025 15:13:18 +0800
Message-ID: <20250819071318.21103-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_001330_549683_A089F401 
X-CRM114-Status: GOOD (  10.91  )
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

thread_info.cpu field is 32 bits wide,
but is accessed using an XLEN-bit load, which might be 64bit load, fix it

Changes in v3:
- replace space with tab to keep it aligned with code block
- Add "Fixes" tag

Changes in v2:
- add a comment to explain why use lw instead of REG_L.
- correct commit message

Fixes: 503638e0babf3 ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 arch/riscv/kernel/entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3a0ec6fd5956..492ae936dccd 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -45,8 +45,10 @@
 	 * Computes:
 	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
 	 * a1 = BIT_MASK(cpu)
+	 * 
+	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
 	 */
-	REG_L 	a2, TASK_TI_CPU(tp)
+	lw	a2, TASK_TI_CPU(tp)
 	/*
 	 * Compute the new_vmalloc element position:
 	 * (cpu / 64) * 8 = (cpu >> 6) << 3
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
