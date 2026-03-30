Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC063FF4943
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 05:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fEZPtcKqKhyvwvAyATHRFzlkTWEvLK3bb4e51nJNyNk=; b=oDGJE9pVtERUMu
	39/uvx3ov9wQ726ONGAMsBW6XcpgCBMMMa6QP7VTCDUe8Tw6ZrXnBRdJAjnkuqULJGeD9ylGNDRWe
	fW1VhSgcatbg6hbAFk7gMf2k8riAiDAmUi5PLcelxJ1zdEvUL0lsAFYbCPt9v2VVDnSuXipVpCp23
	Ar0WwOCKZ0p/59VBIAtz7pBvbPrQC07zQowLAdBu6Ru7Jc5becs1Jr8ditXYkLnPbPleuY8fkvt3C
	isg64PD2alQ6hiPTsWTXRNCuKZM3mM8I7GM34FaZW7jBMoBGfLSdwpz/QyFMU/yXztlRuncMY6VeJ
	407V4U7AfFLpthyBVb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75E1-0000000AdqO-01I5;
	Mon, 30 Mar 2026 05:31:45 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75Dy-0000000Adq1-36MZ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 05:31:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35d96be7c13so1055619a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 22:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774848702; x=1775453502; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzQkhzH8J3EhVaeq7iJIylAXdorMRYNIS1P3OpIEB20=;
        b=LWXR9ZvG35u0YmONjzoFcbEjiFAhqVi8zZRnj9YcasvcuPMW7GwAsDUoIUStufJ4LA
         k4hbeapsfIsbbMnu/qMDRJko/JrybuV67rVoDilTABnmS6nIlzPqoBvLwh1mVSY0lcQz
         WYV1PlH2ZaB+B9eSOqXRWuXuIVYqk6XwQPginCGQ4JyVXsrelgbblcWt72T6bDKyqFb3
         Jc+rYXIxyUjiu0uMLAtKqyYfVrFemaRQwM7BV7d4hD+plEhd6bGElPOnp1AFyNRAe7T5
         4HxbOus+svHDsI43OXCjHXAU4W3XqkL2O7hS1JCTZrfNNmDzAr+SHvslOwQVEk3lAxC/
         yzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848702; x=1775453502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzQkhzH8J3EhVaeq7iJIylAXdorMRYNIS1P3OpIEB20=;
        b=UeM2R+OX879dDCH7ZMkeSHaOepgwAV4o92XDqJ2yf93kPJfsr5B1IjrvWhRzDxbD7R
         vsR8+an8yfcE8BzNmjiA112l9Uyxkm5KyZNHYgw+GjukwFPpi0SL1fTP6iu3rK0qskcj
         rQ2SoODSw3puIMTAW+bI7IIdZI/UMYULOWtHZP849GGkE3ES063K2ZG7/ih4+qmHrkLd
         p6emijvxnInxtBqC0sOmIiJWhaVQXNC72KZFwYY3Cw1Px1OA0eIY6AW3f96vL991i9Eb
         jjZ0yAY17xNsnu4OHdY+7E6q9eMDhInIg8BzMo+Qx3VpT9xWpjy/6mFUCJepKsvvfUUY
         UjSg==
X-Forwarded-Encrypted: i=1; AJvYcCWhNR0eEEqVOJoGtMHdaKWXoUNLZNFeGFWlVkYbzXFxW2llss+WgBvTcS7NtP53PJXNPwkrzbPWpLHlhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXbjJawycNj0pzarZmqK8onWIfYLlG+wjBiIwhGiwopwn5vP/z
	1k9rW1iAuvm6kNT6OQN8HTRA3Emx+m2V8jrqM/0ivcE1NUmVgFTj0qG6
X-Gm-Gg: ATEYQzzsyV1y++LBzAZuhqLqwmiAKsAphdHLPiomBKWMwd+2maKCsLJ1OCwPWGDYSYu
	iPUXMGv2L315F54VP1E+dIUJVWuZx4Y914gkKcMTESuleODzht5n/MpNLQlom/6zraPUsVqIQs9
	kAsxJBlt7f4/wKfPMCeTXZ1abOyUM6ewutrpVFSLSVJJFjAU+sSc/Kpa/ygpq4gnCTzHf1nvRm0
	/wfHMaye7P049DrqUlgCE8keRiHRZZOOEjQhD2XbXb1SzMtfHw07Rtm2stdojC0TbjYX8rgzi/Z
	jdQFqKy5rkJJrb7LKHHq0XXwbZQHE89ygCChXDitj4cl7k4TOpkq+OBgTDxVK0DFnqlpzQdq6J3
	VcMTynZsl+0Xe//4oL6GA0jtuOVr7JWvh1k0YKhNMvNJ10yfZkYXb2ipRgJt8KGVUBXOMIFmlCB
	T02ctD1BddiJM+LPOMyhcLPLgoZwv65h3iQ/Y2g0Y=
X-Received: by 2002:a17:90b:390d:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35c30d78e17mr8225908a91.9.1774848701678;
        Sun, 29 Mar 2026 22:31:41 -0700 (PDT)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9c4e4278sm2023607a91.0.2026.03.29.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 22:31:41 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:31:37 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com, austin.kim@lge.com
Subject: [PATCH] riscv: mm: refactor by introducing trace_page_fault_entries()
Message-ID: <acoKudXTM2AjQjKB@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_223142_784104_0C25DCCD 
X-CRM114-Status: GOOD (  10.20  )
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

From: Austin Kim <austin.kim@lge.com>

Introduce trace_page_fault_entries() as an inline helper to wrap page 
faults tracepoints. This simplifies handle_page_fault() and makes the code 
cleaner and more readable. No functional change is made.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/mm/fault.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8ac..54c9a388c 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -271,6 +271,16 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
+static __always_inline void
+trace_page_fault_entries(unsigned long address, struct pt_regs *regs,
+			 unsigned long cause_code)
+{
+	if (user_mode(regs))
+		trace_page_fault_user(address, regs, cause_code);
+	else
+		trace_page_fault_kernel(address, regs, cause_code);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -294,10 +304,7 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-	if (user_mode(regs))
-		trace_page_fault_user(addr, regs, cause);
-	else
-		trace_page_fault_kernel(addr, regs, cause);
+	trace_page_fault_entries(addr, regs, cause);
 
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
