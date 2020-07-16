Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98352C433EB
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CC32065F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hP9WDtIQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A9q2xqO9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66CC32065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2hDpqp8md/khJiE/gWt80wVgGCteMczzZyUZO36Xjg=; b=hP9WDtIQX868a6agBUDd4bpZZ
	2fTBx2AykJV6q+WycnwFqCk+gCezlx0aQoA4NFvf050RzH9QkrXRbFZNS9GyHdT2xuC9bdLAFzEev
	fRcChCQN6muUA9aveFABiIaPnlO+tOzLsO6NY0CJe70l8eHfdirHeGyQ5ERrt2t3gtf36OLCjd6IN
	tigzvmggTOWQoyMjN0ueXw0hXNRts9k+3OVnQcoarxJ5+rFcasNklOq76ACIMEr0S7u46QMHGLQYx
	Gzdf23tPsFtFBDHpN/AknVexdbs7n3pi/jB+rpwJFDE3k7SJ1knpmNtwTxMzPyQBSlp9/2lm0FB6a
	HtbFRuWng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3aI-0005PH-Oc; Thu, 16 Jul 2020 13:05:58 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3aG-0005O4-Dr
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:05:57 +0000
Received: by mail-pf1-x443.google.com with SMTP id u5so3656276pfn.7
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGzmIzqJnm7CKiLoQ8H6AcVjxIg7aO11yFeUG1Srnrs=;
 b=A9q2xqO9qU7vO2PYAJ7sDGqDrFpOQhpO18YI1qzAdojQMgDPA9vvbwy6Dr+qGyMlCt
 0hu0x4+MjSDu59Y1L4wyeRpS1SBGMk/weFFlmPqqkWNwkD+jMvYZP1yfV7b/5+7XWHaV
 cXMf2/u/3oSKMUlCX4vV2knvHwlk/NIvsKJonyc9mbygZbI1RX6+2ut3TJxs8vm1MT7O
 6OqsthAU2ZM5XML9B4JgoAmxMBS8EqYWHIAtatLVxwCfrq752o0gpHG/Xv2wptWcFf4F
 0nTOxf1XAJQALDR0EOPkwADZwKZA9JIxftA8904XOF/qPSngheKnxRmZL8dZmy/1v0HU
 jV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGzmIzqJnm7CKiLoQ8H6AcVjxIg7aO11yFeUG1Srnrs=;
 b=iHvPMtS7V2smvOKfLkwlNmt2Sp+Uclm/QSxa2XJtQwaQmDg3jC9dbuhj9Y+oi7IYVX
 eppjdBn5oEYEQD7RvBiL4SbjCPTNhu3EAV7C7dUi9YMllxiP9ezWlm0um+QGelQU+/Nc
 qF9Q5tseMNi4TVvSSC4txtAMhUnR0aBL/b4twyVtrGBs8CVfxC6pMXCtm5ntUyPJWpwE
 jiG2j0X1fXy8ZdNmVHA3afG8YW2DuUo+Iy0PTF5C2dMVGYEZpnyOgOvaXIXx9eetxFTg
 jjNDyqlmEGVlX1ZYTiJEaBWWAhP6dqGWfEWeBg4xK4Oj53qlOqbGtZ3nrHeQ2qXiUabV
 d4qQ==
X-Gm-Message-State: AOAM5305MZvI++HKPNqnkH026SB4OywbvKj/h7C+7aDOle5Wo29cec0k
 tPKm2r75KpXEX5K5Z05mtJE1I1DxNyU=
X-Google-Smtp-Source: ABdhPJwGEOBlmUcQ6k6tnLCKBcSWT/f0cdQf1kOitNTShXHuFHrwdKJCFKyv96KFR+kV2UBc8bbkWA==
X-Received: by 2002:a63:4a4c:: with SMTP id j12mr4317304pgl.115.1594904754427; 
 Thu, 16 Jul 2020 06:05:54 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c134sm4770203pfc.115.2020.07.16.06.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:05:53 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: Fix build warning for mm/pageattr
Date: Thu, 16 Jul 2020 21:05:46 +0800
Message-Id: <8691a6a78271c748a2f75f1430b36f304551838d.1594886530.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594886530.git.zong.li@sifive.com>
References: <cover.1594886530.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_090556_524166_8E767DCB 
X-CRM114-Status: GOOD (  10.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add header for missing prototype. Also, static keyword should be at
beginning of declaration.

The warning messages as follows (with W=1 build):

arch/riscv/mm/pageattr.c:130:5:
warning: no previous prototype for 'set_memory_ro' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:136:5:
warning: no previous prototype for 'set_memory_rw' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:142:5:
warning: no previous prototype for 'set_memory_x' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:147:5:
warning: no previous prototype for 'set_memory_nx' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:152:5:
warning: no previous prototype for 'set_direct_map_invalid_noflush' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:169:5:
warning: no previous prototype for 'set_direct_map_default_noflush' [-Wmissing-prototypes]

arch/riscv/mm/pageattr.c:97:1:
warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/pageattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 289a9a5ea5b5..19fecb362d81 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -7,6 +7,7 @@
 #include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
+#include <asm/set_memory.h>
 
 struct pageattr_masks {
 	pgprot_t set_mask;
@@ -94,7 +95,7 @@ static int pageattr_pte_hole(unsigned long addr, unsigned long next,
 	return 0;
 }
 
-const static struct mm_walk_ops pageattr_ops = {
+static const struct mm_walk_ops pageattr_ops = {
 	.pgd_entry = pageattr_pgd_entry,
 	.p4d_entry = pageattr_p4d_entry,
 	.pud_entry = pageattr_pud_entry,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
