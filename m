Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5FEC982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxHcyQvioTVUpiidemdbdSBpW28RPczAC4qdC45GSgU=; b=vZ6pO6qB4aJER3
	fbtA1atcyrsIR+fLJMvzCCVITlf3XRUBuhw5UUS1NoTaBeXoiv7hACBFg+j2ulpGfgprzKRmsm6S3
	oC6GgvNo0diPI7RhfJ5keoupg40BGSIaM/Nacj52CycizlDtJgADO6PT81c15H41612aZeX5R/YHO
	WM3aH3rxz9x+bZdmMaBVN3H4Rn4CZgSKp1bWs6iII4/9fZER/WGbKoIio7aem7BRvu9F8oo6wo7nZ
	/qo9tPU2lma+InNxbKsQhBgRDdJn3FlBiML5/iO0kZ8G5vsEi4QcHWe5EzypUguwyYEbLZp75Puoc
	La/IwDcprM8e8IyEfVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWQ-0000000FaWe-45WE;
	Fri, 18 Sep 2026 21:53:30 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWO-0000000FaVP-2g3t
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:29 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d440939e3so9189617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768408; x=1790373208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhBsaqdre2vdgjZB6JaFhnWFGaOXu/kS98M8EN/totQ=;
        b=FqH7MgHLE/Jk9TYMbBPhVPc3Azv36rG3iWx3NK+VCnGt4wRvvZrA5hy+XdjZO6Kkqj
         W8QME2vLmR4RbemsQaEUotBwh1/SikeZ4zVw+1JcNUM+osCRff0/hGCbezoXT+IRv18J
         vM1qPoNuWpVzbCnaqDfAQ8k/HdiWQi9nPgUZOlzFKhHy/FD33jI8KkeOV9Sz8Hw/qzy6
         KErCZyrk6HmvQz2MtTPxH/Z7OGxSs7aufr07K34490PR6QmqwX7Y+Jxw5EiysyK7Cbnj
         R2ms8kdHj2OO91hzFbCtI6MP5kA3sBYhhp4MLgz0fJsEVPsFRmaHZGPvc3O0ML9VI2+B
         SKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768408; x=1790373208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhBsaqdre2vdgjZB6JaFhnWFGaOXu/kS98M8EN/totQ=;
        b=jgm9K387rqPs304PNTaCSDz8652o9sYhSQi+3ywo/mF6h+Nzh9hoyjUwMBCAR9aU7P
         mEKSEbVPNBDPmz1txHZdYFqm0hbSW6VTXh4B6B9Do44XJctwwDZfGr1AGGkvaGyTjM+7
         0LwnMPsv4g12KHeuhdY123f7Ymigoyh9ZvFxTcPkkLg7HUQkhdSV24G4449AyW5XaYWy
         2ctcc14wyp5Vu9mN54+mTo0Jjfg8m0lXKgyQ/jSqfnoS8PrU8qGteCp9RdAgwmiqqgfN
         ESuRTmZeTDQ0KdM3aglP+ZjkxQGeFmfhRNKqB2Lvcvwg0YmoFICsn37wVqv9jAbF/82W
         o/kQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0ZMuLLgm5B2gWCjACLYqmuG0TYD8BQpa6jQVIO3PoQcu0YYBjFf3wv1JU1bKt78gsS4hoqcnY8pkaLw==@lists.infradead.org
X-Gm-Message-State: AFuF++m4lB0F2983wz+ZuFH2kkcyfJPSMwPs9nSVXIf3bNHnL+7qrKxd
	z//n81PVn5HKcnyWWDZk2rIBpyXzM17L+WeskoXNN+k7Yf8K8KDfnl51XCm5yiV7dh4=
X-Gm-Gg: AYBFou1whcrnrGVvbwfCCgD5PsjIONnezD/sJ3DTmVypyd53e7EnYjuCYF2mNJMhKJL
	XpZu2wxLxIuhdM9Sk6WoB52ttiTYRDhdFU57o62lFMROjZiWjClu4IvNMBzfczeOl3ygnGTx5q5
	yfngzrt/pdWGM8yn8y+/UhlwIlERyynEVsDWCBFIzE6cLRpX5K+TPg0MuK736AT1EYvGrBUgMJh
	mNJnqfXB3CQmdkikIFi5fLMNAezVGvdOq85wAOe2+4cCc6SUPG+QrSd4tKgTDeK1h3Nxbpdxnqj
	v4DzNWkLRaoa6sSbyXTXRggFvgfwcgpDdciv6aalYyiWTc+ACW08X7IzBiHHLZ5XPXKDHQVQj2A
	sM39QMnjW8Vs+ViFUOItqwbEhMPAhnA1QuGZibpOYCkzYBsXdN+M/8FpsoTErheAy/mVjloxSOK
	gV22t31r+4kL9nLt5OsH2ZYqTqbTaot0xGjr1FiI/2d5RAYAHL1qRFX6K4lKhRmC6QJQUoJBRoe
	AZIAxYvlxlZtaEVB5f+yMf/rE/oiCOsJMkn
X-Received: by 2002:a05:690c:d:b0:847:d0cd:11eb with SMTP id 00721157ae682-897308fc982mr14274117b3.9.1789768407699;
        Fri, 18 Sep 2026 14:53:27 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:27 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v6 2/8] riscv: vector: refactor context switch for kernel-mode vector
Date: Fri, 18 Sep 2026 16:51:16 -0500
Message-ID: <20260918215154.2481482-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145328_681710_1E4265C3 
X-CRM114-Status: GOOD (  11.90  )
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

When context switching out a thread in preemptible kernel-mode vector,
there are 2 distinct cases: One is voluntary switch and the other is
trap-introduced switch. We don't need to save vector context for
voluntary switch and the context is always !dirty as long as we clear
the dirty bit at riscv_v_context_nesting_end().

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v6:
 - new patch since v6
---
 arch/riscv/include/asm/vector.h        | 5 +++--
 arch/riscv/kernel/kernel_mode_vector.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fccf9edb4e6a..6aa125d66ace 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -378,10 +378,11 @@ static inline void __switch_to_vector(struct task_struct *prev,
 
 	if (riscv_preempt_v_started(prev)) {
 		if (!(current->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK)) {
+			/* Voluntary schedule(): nesting_end closed any dirty. */
+			WARN_ON(riscv_preempt_v_dirty(prev));
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
-		}
-		if (riscv_preempt_v_dirty(prev)) {
+		} else if (riscv_preempt_v_dirty(prev)) {
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
 			riscv_preempt_v_clear_dirty(prev);
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 5ad93ddf6a10..b9481a3e40e3 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -219,6 +219,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 			__riscv_v_vstate_clean(regs);
 			riscv_preempt_v_reset_flags();
 		}
+		riscv_preempt_v_clear_dirty(current);
 	}
 }
 #else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
