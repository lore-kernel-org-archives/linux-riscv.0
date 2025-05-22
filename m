Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA338C54ED0
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9MZrAk1WlG9CzbfqTMd3x9rPZjNEmj397ZqdmYDR5oo=; b=me2IKy7mBbQvac
	+u7QxCpZCX0jaicgR28E8/GElAZ1Nrk/XsBJRX0KtJd9uSfcaufSE36sTSlSKt5564r5wOG1HOiTx
	eC63uJfawBqFs8/lGGU7+yhZXg3DaL0gov7bEMT8h9e1sigSqA8XTXytvwAD4bjrzBgDHn5LpgyL0
	4KOjP8tz7kk96GiSKgGkO5RVp+lOVVbhCtpzbPjvmMCxgfky1NcvBm/hyEZmV1gel6WAZJqtGnjYl
	2731tF6h7X5YuTKDtT7+gPIbhb1HHhKUm1Dt7koHW37p5FOhS8T7k5vGcY86O5Ex0yOAbA2IMBCVO
	dnx5v/QF00jBPtJdZzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9k4-00000001jza-11DW;
	Thu, 22 May 2025 17:30:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9hd-00000001jhz-2gjk
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 17:27:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2322f8afe02so43232705ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934852; x=1748539652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ztGTHofDD0QlJWRuLcr8IoncE0qHTx6dcK54AezMcs=;
        b=Kw7+/2oQzZps8kFEZtYL633cLwVBqsV7bpn9kh9G7lGZhHIU5CROhB2qzBRQljyrNy
         7Ek+ynaDE6Ec3vXgV0dq3sYxVuw7jff1D95xHDgekudcarO6J9k/Pj/mVsdz63rKF5LD
         dr4TyCg4eqMMVcLKa0MKGWtqnwHIknvWfjDMTvYT8o0UEqoy5c7V1OwimUI2QUsHhQDG
         JAPaU43IPeSYGvrsuJhwhGSYMFaUYWo9zD6W2AxedycM2zuNQhbrzH5JlJArzLO6Ji3y
         Q1BlvLwbPQnZOIfAQUG8/yLe8tqzAwnSWSODd8KiUjBxQ6j3NdfaW6b6K3yl+XGXvMSc
         0l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934852; x=1748539652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ztGTHofDD0QlJWRuLcr8IoncE0qHTx6dcK54AezMcs=;
        b=m3KAcFDvQGB1srB3WMVlD1SFUiSxQocaSmdaTB1M3+1Upy1ZrCPaW+EfT++V3ke3Me
         DeIPxVPeQYYArxvwGuaMQnGJrmPIBpxWmq0pS26/Mf3ThplmP1oyiHcQ6xINSr/9xiyh
         4ytFoIcagOzB8Spvs5AFTy4Vj4B3spDPLjZsHftmFLhk+vg1Nozw+q3sathX3cs7/wTL
         X/wKi+W4yCYNZ12/9hYf8E3P9dNBZ0oV8Ev6x7Zq1dzJFE0rYm1fx3EHWjzdnZJRhin7
         tOT+QMztNxt0Kf93pCI6SqKX/W2RbxZUKQ4RRTL4jygz6zr+YVds8xJ+dsbqunaP3oLW
         s16A==
X-Gm-Message-State: AOJu0YwubTxy8GmecCmAJLGFIArQpp9df+Pqk592RkusTzfyudgk0lQK
	1jig4Qt/YTQxuxMMtKBe7NOdnRQpisScdSRn11qpnGnDmyKJ+CtH3SSU336VvXspLi+fQmHz
X-Gm-Gg: ASbGncuETs5y4KdW8ANQHD/6x/CmaGO+8x4aSsrz3QytsMpFbzQK1ZYzV/PNZWC13nK
	SQOmn28nfmJLjdHF/zqM3gyP66CWZ1dK8sUqvmd3mely8AMSVu+4tBpXbtOXxQD2SpPJI5BdeO0
	uO+ndbBf0Bzu53xMlvcoHjOk3SyrR8Lb3ko0fqnRlYJoHvCORDHkeabDP8mi0Ymhcb1nhLxGlXO
	cJsW4TfF9/7hzexrvVqSiiwcLhFPwJXxLv2fWDak49XfKcMRIbHXBFMD9MDca1AZHBcMCIv4n3c
	SMPmLIz/FDD3pd8ZPDeohQ/4cEyA2G8RqvZx6dcob6J+K/axdLn/RMQZuqXflQ==
X-Google-Smtp-Source: AGHT+IG7bPR8dyYr5GWSAWbH798rbSA8VE+03g42gPIXsWNEbWya72hArENXMGWvl9e7aXzqPUj+WA==
X-Received: by 2002:a17:902:f645:b0:223:4d7e:e52c with SMTP id d9443c01a7336-231d43d9a3amr401362305ad.5.1747934851951;
        Thu, 22 May 2025 10:27:31 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97227sm110993875ad.109.2025.05.22.10.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:27:31 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: vector: fix xtheadvector save/restore
Date: Fri, 23 May 2025 01:27:01 +0800
Message-ID: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_102733_676899_0F20929A 
X-CRM114-Status: UNSURE (   7.96  )
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

Fix [1] save/restore vector register error

Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/include/asm/vector.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..7df6355023a3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VSB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
@@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VLB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
