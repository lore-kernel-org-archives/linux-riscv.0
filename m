Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15CFCA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtFLhX28R6WnmMP9jzIEh/WYm104Go9aGZRqRrmu0qI=; b=2lTa+1RjUTK+ke
	Tz1sMZcfpHJsnaOVfxXb4+Yfq9acx8X6VF3075MY/MqN2FVCmCNSdcZTbny/T/bvhPxTfBZfPnmac
	tZDhSF+vDo40v1CpJM+cxfecjcsR6qqfJb1dC6RO4Qk6H8QciAOp7trrMNg1hlexKIZ94Y0ywBXCz
	hzHq6Mbtr5U571AmtWFGtYABcckglGLf2nTtOugQ43TLEOvXYspM8KmtsW1SjVwn4EN39Pz0yS7wV
	ZWnnlb8LCcF/bRXRpRy4kuvHbe96FIVfOABrXthR2jCGNCeQsUmf/Nv9casz9GxrNEsXzDbjqzr5w
	ak3B7TCOoa+kYfFQVCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5kL-00000000vOB-3vno;
	Tue, 06 Oct 2026 14:02:21 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5kI-00000000vNP-3nFN
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 14:02:20 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93e027da22eso38806385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295336; x=1791900136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPvl7PbyU/2kfsD+JpTBP33aFuEJTpqh+wQCTs8+mrY=;
        b=kAzvDY3aNdVmHWDKqb7cAinGgGAfjmwyJlHp00vLlVtfmfhbhEtyQ8CBBzZ0VZ6SBV
         oizC0tepJU90inzJovK2q2RefaU25lIe3+58XroTEx81TGit+1xQp+G1OgS36favaVA8
         JcKI0Zv6xG7UmqCDPV+AfE/jmm42plNsvcQW+mmgD1rL0zmedtzyaKj4eToftwUPCZs5
         OG87jucQavSADMNkSPzJf8FND8s49J29VWufe2J8XOTyrtRmcM8fXnE3NJ1APp62nAX7
         3SNOYq8e9cbFPyeA4OUTu5/ZZnpBZKYSG/6caEd0ZDRERYyyFaZsCzjkUel2hRg4cbou
         Zx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295336; x=1791900136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPvl7PbyU/2kfsD+JpTBP33aFuEJTpqh+wQCTs8+mrY=;
        b=a+yZ1dD0d5v8UVkJfS+AWnii+jzelDAkMKnXvbyi9yCic4k8/6h3mGwLh6hTVY7BM/
         QPP27oM2CfaCs/mqetpDu6/dCl3AuTGRD29ETUKCtpOK9xKcplCgSQnwWULKdDW/U99D
         5cX6i3MLbiCt+rHhA6YekPiSyCyfcfbLJHFHgPnOCUcb52rtjyVj89RFlc9e5cYNPfXG
         Z+G2ium9+DVY/AyOsDwRQnH+XN/lUekL3cBhk419C9SiMiUZsJPRSsrlcAjSwaIwzTFR
         f5NzFbLxBqq8vcSP/V6HGMHwGiKr+rjuikzMEjP2j0LPQhtW87uxoloHCgS9HAWZZ0m1
         NnMA==
X-Forwarded-Encrypted: i=1; AKwUvBydNwHX8eEghEQe/yEtdlPC/XwMb3AtbcrStoVm7yLiI/sg0uEVqSHnhZsJr9+4ej9Hp9dcDxWNY7YGfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kXQimcYQzCwC+H6cN31uqLfXlf7EgOvlP47A/1T4toZCm4aJwb
	8jQzynvdTC2ScN8dnCs4UH1glCkRUXVYicC+4k/xJOrp/7q/JYx99Q5g
X-Gm-Gg: AYBFou1jptHl+QaSoEwTnjmiKMN6vTx3NiNpfUiT1a6CRDrTP+SlmwJDi+89W8tmBGu
	zY4tqKhsQUaB/8yA0Mox0wGDqYd7BEXuMT+/J8Bdfsv+QHw/sk+b79EVo5eHMVAhleRhB/b+X8e
	0//pbnuBjjVOa2Wb0RnCMhDiKDD5W0Je5O6HHn7KcNr/Uer6yJzN32H0X//rRikfM/GTgoIKMHE
	iuzqVVR04Gc6vc2c03rg97WG+wx/6xE+X3NQWsutOFADVl7MWx6N024H1ahzWrOcH5MTH2OLJEg
	QqoP7VJLWOGJFgDbAeECU4tISwE1bFKfNyAHsyfWOTbMIWOXr/CtB56sOF92ZtLbcB4X6Qu6vpR
	hVNEEJN9bupISNEGf7dsS1fmx2XLhAD59Eni7ktHv6ueySMB1qDU0ekyi9sey3keck1t+hcLDd8
	LU6wCE11uSInV9rdKeSzdfgW6hsomDUdg9JW7g36YgrzvUylKFbTrxcwjM5j0Bj2ng07thSUZTk
	ZhZD9NIPNXzLXXzPqRh8AH14tj6lADLqmEG9S0Gzdf4mlVuenBVw6K+fyhbV3T4Sz3jrNZCHKEg
	m8W9V1Lj
X-Received: by 2002:a05:620a:4101:b0:93e:4bbf:cc11 with SMTP id af79cd13be357-93e8f35972dmr280007185a.30.1791295335737;
        Tue, 06 Oct 2026 07:02:15 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cc9d80ae3sm1138742185a.0.2026.10.06.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:02:15 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: samuel.holland@sifive.com,
	thecharlesjenkins@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH v2] riscv: futex: untag the user pointer before the atomic access
Date: Tue,  6 Oct 2026 14:02:00 +0000
Message-Id: <20261006140200.877263-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001184355.2395068-1-guoziyi114@gmail.com>
References: <20261001184355.2395068-1-guoziyi114@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_070218_953975_1B704685 
X-CRM114-Status: GOOD (  12.25  )
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

access_ok() checks untagged_addr(uaddr), but arch_futex_atomic_op_inuser()
and futex_atomic_cmpxchg_inatomic() hand the raw uaddr to the inline asm
amoswap/amoadd/.../lr.w+sc.w through the "+m" (*uaddr) operand.  When the
tagged address ABI is enabled (CONFIG_RISCV_ISA_SUPM, prctl
PR_SET_TAGGED_ADDR_CTRL with PMLEN != 0), those two addresses differ: a
user pointer whose top PMLEN bits hold a tag passes access_ok() after
untagging, but the atomic is then performed on the still-tagged raw
address.

Supervisor-mode data accesses are not subject to the U-mode pointer
masking (that is governed by menvcfg.PMM, which the kernel does not set),
so hardware does not strip the tag for the kernel's own access.  With
Sv57 and PMLEN=16 the tag bits overlap the canonical-address bits, so a
tagged pointer can name a canonical kernel virtual address (e.g. in the
linear map) whose untagged form is a valid user address.  An unprivileged
process can thus make FUTEX_WAKE_OP perform an atomic read-modify-write on
an arbitrary kernel address, with the matching FUTEX_OP_CMP_* result
serving as a read oracle.

get_user()/put_user()/raw_copy_{to,from}_user() already untag the pointer
after the access_ok() check; do the same in the futex helpers so the
atomic operates on the address that was actually validated.

Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
Changes in v2:
- Drop the inline comments (Samuel Holland)
- Add Samuel's Reviewed-by

v1: https://lore.kernel.org/all/20261001184355.2395068-1-guoziyi114@gmail.com/

 arch/riscv/include/asm/futex.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..6f3bc9bdb85e 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -40,6 +40,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -82,6 +83,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);
 
 	__enable_user_access();
 	__asm__ __volatile__ (
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
