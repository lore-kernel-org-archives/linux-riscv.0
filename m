Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D344CCA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5txeFhuX1sYJSjoyAzs2FI2KqrSOgA7XLi4eFwt0O8=; b=ySMOe86rqxml3z
	qhxnxGbj/N+lowF/qkxTv6kqIjh/BKTeXP7VIOHeaT7LAKQrzZkVW4BeZFBXG6N1hbJEZiyY/yv12
	ofc23GUX9k21n3BpntbhcVA3aLBSYj7s1J3HBgnDwzU/0q0fTYOlSWhP3oLqyP9fnLe7BZcEKqS67
	8QIPBex8sVwT/+AqKXERkSbz9JDQtlywQSQ19q735HPo1yYxjTy31CB5LInyORu1vmerK8U48RNg8
	4FOsuti/uYFZLZmTfOKqdS8gIrqESesP4mZPISr5jPC3vL+04eN4yP6FUpbtOgROhWZo/w1ulkYaY
	3oXj4z7iXDLjiUaiRmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN9-00000001zOx-40Mm;
	Wed, 07 Oct 2026 08:51:35 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN6-00000001zMA-0cgJ
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-35154cb9de2so1826222eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363091; x=1791967891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=PItIHbrK1Ig0eqjhwzNGPZjkQ13YfZuA9TsJKz213WBesNiE0iFM1YmToSUdNom7ev
         1HdDJhsIrQUKbKFk9xnsIBvRS/z3khPteUb3oRjdAfDz9OEimQcd0z0R2Q2cLxBURiWV
         uiZd4Dkq9KmLxtTUepD0Opq2UkFhN5dCXqb+Q2HM0FpxYup0oCeQFGl+QT4yDO43l1q/
         eVuQWKKxpz6D5MuioZxP4pxo9FIg8dX1jS+z/H14JQH6PL0eBmcVD0ygq8FoqE09Wnzs
         2RF7Lzrum8OlsvkU46tEFuINAH09SFKFUvQrpdHbeh4OUKTk/YlyUgCpMA9Y35Cx8HAU
         ujLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363091; x=1791967891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=Nb4nVZ3Lt5fUT2sYWcRo+oy/Tw336Vbc3RwZe9U+LuvOMpmkLlIN7Cr5N3BB2SodGG
         t7N+V9aZRix3Ph9DYAQgV13WraGi37f1amRK8Frvjjmnr0A7P11f+8oDaFL8NcQHGU4v
         7Dm3q2eGQCEh8fTMEyb1OB5/BpAJ+jClPuMO9txnLAhSnAfm3RypkLAvhnaRMOJ4earu
         VzEOtCuTVK4m2Pcp61Y3tcch/4YLO7Q5evFcTL8KYie7lnKLxEd+V6OODTS4QeRCrd9i
         mrpRworgV+oM1iKqC1RigAK9Zl1rzTX2o1H1hFWxPznBNTiefesQSXcVjVNC03QVgPXB
         nNIA==
X-Forwarded-Encrypted: i=1; AKwUvBwBYFhaspl3daXTTKuIMqxFjPL3qnqtePaJLpW6+GtGAbJBJX9j5vZJyR9hbHm4Mh8uDjWtQG6fCVAW1Q==@lists.infradead.org
X-Gm-Message-State: AFuF++ljh8yLVGRzei7DqVaRQyayt9MWyMgCjhDXoh/L4V2xy3Pw5zn6
	AkuN4iVkVmMKRalJxgSm9A7j42FWhvTQzTHijMlacc5YB6rnJIjhRqRHhxbiSOycuLc=
X-Gm-Gg: AYBFou2Sd3UEXbbNQrtY0XaM1hA5w5TeNUQg0tffBipJPewkFGx1PnlQYCB1ojjeL0P
	UG9jMPCcDWYveYz6pLswITV/24wQkOh88PvpD1dg88tTro0o8GKheaAc4OW5qNulRvzt9MjU6jD
	jngy+sF76JSzM/1trZbYjCGwk4JTivhDBB6leZA54Th2+XBLOT47Ge3C2mVwFjsl664YBDc6+Yg
	0FOkKQ56Kx2HmqWp2k6c5KLeoAN5fgBD4zB42p5YlFYLHaEQZ7fU2WtYqXYkTopKVZ9M1YuGWGx
	eHauTSMpmsJ6V3x6CyZMQ7i5e0G2vE5t5KLv96p4I5xJ+ZRMlY96etEcvMV9ranDIPv8X37SH0q
	R7vv64gn7UAZJOIjlfbzth/08kjRvyd/Bm0ToR4dZlEImNRfzKWi6rjiREHVKnsfeGEO3lJCH+4
	eanlYfHAWE74nYrRFMRbH1zv5W0XWjL9Z/TMIy2bm8edW3BH30sUVCyMxefq/egKaIPLMtglYuu
	2FZnWakYaPDVQjMuaB8
X-Received: by 2002:a05:701b:2719:b0:14e:8ae9:87c8 with SMTP id a92af1059eb24-161fe497e3cmr1456351c88.1.1791363091401;
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] RISC-V: KVM: Decouple vector prctl state from VM ISA
Date: Wed,  7 Oct 2026 01:51:18 -0700
Message-ID: <20261007085126.222688-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015132_187605_1D887F0F 
X-CRM114-Status: UNSURE (   9.00  )
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

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This was hooked up to KVM so a process that
could not use V in userspace also could not create a KVM VM with V in
the ISA.

Remove this connection as it does not really help with any compatibility
concerns. A VMM that does not understand V will not include it in the
virtual machine's ISA.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/isa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..447c778bf850e 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -9,7 +9,6 @@
 #include <linux/nospec.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_isa.h>
-#include <asm/vector.h>
 
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
@@ -159,8 +158,6 @@ bool kvm_riscv_isa_enable_allowed(unsigned long ext)
 		 * Guest OS can use Svadu only when host OS enable Svadu.
 		 */
 		return arch_has_hw_pte_young();
-	case KVM_RISCV_ISA_EXT_V:
-		return riscv_v_vstate_ctrl_user_allowed();
 	default:
 		break;
 	}
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
