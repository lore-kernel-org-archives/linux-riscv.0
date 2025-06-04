Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2AFC5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8MYDzS/DqjSnUBBXISrU72Xlx+q4Cr/3xtVESszXhFE=; b=HYw/1U4Hnj5ard
	eeVtwFyjNdbHmjSub2jEZPEI5kIPuImjG1WIkUGKe9mukR4TuOzzNLLRJ5maHAP6X6fB6CCZK9TgH
	cV/ZzlePxwwb5CGXHSgVCJPjok0iT4BKhWi9pfkMFEYZNfL+uwKg9yC7OXmPksOOZafXUU81SqabT
	1QhB8yRyfjLV1GfdULfXDJqGwghGSUklCc40UytktVBGWd8lUmSoSMc36X2vqv4JA5Ddmzlz/eFAy
	mEncXWwfYWb7HKWncWrjJavjizuUOXU3zou7H8xuoGazCXGg9N0eHRXpqy0jyANUCf5SH0ZG6BsAO
	tAYMgVhgm/5VzcGuqWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkVk-0000000D2aD-0ryH;
	Wed, 04 Jun 2025 09:34:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkVi-0000000D2Zi-0VOY
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 09:34:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6254972a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749029653; x=1749634453; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C53yfP9noFGLpJoOWOCdlk5vVbd4Mts66+R+0j9vNf4=;
        b=nO0hlNHP267L9MN5JQSYekSbUC2J0QB629Brx1lEIVxUvW9RXiABiTw2Q6sL7pvPXp
         ErL+xLSio4j0QymwLYfyT6H711YotQaAAluO+LwzM2GPYTItlVAvEgCyb3v1tg+qIXPt
         24bF73HAbCEnLaYmaeQOMGSsIV5aDAgX0qqSl5knKaqFdFCbTR2lLFkR9CiVWy8rAkX8
         /1bOZFVlINxCjW+wPDsTg9jSXEbyLCe1oJxy7nLjb9I3wg11WHbs9b0iXK6H0BZRSIdU
         pCfE0Su1BJch7D7lwcp39MKMpMU0vti/ca5h/uwAcS/FfngzKDz8Lkbn5pYoMM1hU7Qi
         vHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029653; x=1749634453;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C53yfP9noFGLpJoOWOCdlk5vVbd4Mts66+R+0j9vNf4=;
        b=rJP8d37dXRhGt2gaJzMgCAPaYKM6IW4VQc/3TToZmElbwiBMWjjded+fMV9NBcpDyc
         uAGPu0iPZW7mM5tcon6MO3nr+4qjT46GjZq47REo0m91tGiCKyrzh14ZdUCIRtIFybbP
         MR7trltEGt87+1BpROHjo1i1hd0fd+xp1xgAY7CVlv9AOf0poktQhl5KT47PKA8PlVu6
         kWS1uYqHZMlDgAV7YF0VTEhzmtJXl9egNTqYQNbEy/fnKeCWAlEPPxOkF/da99mqUQnt
         fHafzihakUKVg1m7MtTdJJITshTTTZ3GhiBC0IEu8kKrbQ+X4hr/6abs19N2fltWIqWg
         LknQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEVfXKCM9+JrLjHV8qSU1FVltkbCv6PhTmcObwAeUBkr7Y9Jx7DFGXccUJpEdPbpVuTc/z1Ir3PZZMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG/W9+n2Y2M9xL4nwDfA+FpZ75NpgwGsmXniC36TOy6ao+ivej
	1NpIiUkn9Ba1LAUZFKCbDyyV4qvAUnqUWSx8ZSn+81/Cj1N0qloPvC5URkdmOzEGPwA=
X-Gm-Gg: ASbGncsqQXh/uKm9X7RgW/1WqRIl3t9x4Mbfy/0JWDVKMd+J/fSCPNzu0tlaKsIcYb5
	92ZBCiPB4kLM9E0veu418hfy0L8BJcY03VqdmnUVkB6Wy9/EGdg/hlmkAdeKClIeaJV8C2HahkF
	Oakqvs5FIrqljHN6bpG4ek/UAycvq0x7O6c7aG8b21mqld+YsaQNNt2p6/wVDj7/bo/8VgM9Nez
	vAF2HijFQTob9L/GxxMqyXsv9bFPM0bhpNhHrUNTkMRw7ur0NnvWbCjmIpfkv4SF6I9vVge4rHi
	iK538+GEjpQlfL9SzzDjZ+12JCcOC+Z8PR0shUtoe1N0GFicNdkJLxEFfPDKHI+l/Zu/rkX6VVz
	qRqWofOFf
X-Google-Smtp-Source: AGHT+IEFYjc4Tz4Dt5YRmUTvWxmINOOTd2yv6xcgMuml1Fa440dGfF+Zaiu6SCzXijeP68QhevG6tw==
X-Received: by 2002:a05:6a21:99a0:b0:215:e60b:3bcf with SMTP id adf61e73a8af0-21d22bcd4c6mr3584522637.30.1749029652910;
        Wed, 04 Jun 2025 02:34:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0280csm8406411a12.4.2025.06.04.02.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:34:12 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] riscv: traps: handle uprobe event in software-check exception
Date: Wed,  4 Jun 2025 17:34:03 +0800
Message-Id: <20250604093403.10916-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_023414_177488_0EBCEE71 
X-CRM114-Status: GOOD (  11.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Handle the uprobe event first before handling the CFI violation in
software-check exception handler. Because when the landing pad is
activated, if the uprobe point is set at the lpad instruction at
the beginning of a function, the system triggers a software-check
exception instead of an ebreak exception due to the exception
priority, then uprobe can't work successfully.

Co-developed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v2:
- Handle uprobe events only in the forward CFI case
- Move uprobe handling from do_trap_software_check to handle_user_cfi_violation

 arch/riscv/kernel/traps.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index d7b5fd576011..3aa5ecda29a8 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -369,17 +369,25 @@ void do_trap_ecall_u(struct pt_regs *regs)
 /* handle cfi violations */
 bool handle_user_cfi_violation(struct pt_regs *regs)
 {
-	bool ret = false;
 	unsigned long tval = csr_read(CSR_TVAL);
-
-	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
-	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
+	bool is_fcfi = (tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr());
+	bool is_bcfi = (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack());
+
+	/*
+	 * Handle uprobe event frist. The probe point can be a valid target
+	 * of indirect jumps or calls, in this case, forward cfi violation
+	 * will be triggered instead of breakpoint exception.
+	 */
+	if (is_fcfi && probe_breakpoint_handler(regs))
+		return true;
+
+	if (is_fcfi || is_bcfi) {
 		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
 			      "Oops - control flow violation");
-		ret = true;
+		return true;
 	}
 
-	return ret;
+	return false;
 }
 
 /*
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
