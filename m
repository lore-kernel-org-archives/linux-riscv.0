Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E49C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNHhlAfPDCdizCTOOd5jTwjXYp80mMZEIsBxyupU5Xc=; b=ilNJPnWO/+WAya
	o2I7fyOBDuvXwWfCnQZ5RSe1vJ5rzRVfdNZ96VgBMT6jfzI9eiVydH6j1yCdNLvhBceubmsFySQMK
	YkYJM/PYBpbRUv2FJYVwWYshCjxq89QxVE+DVGlimgnUCFYUGbIYkK3NzbHIsE8VOcL+gQMwE9bLx
	R38DACBOuMlCq5u74TorzzekdNrl+vlEssV/jLI5IfwgtNlc7Td7Z+UQ8YY3Otykgs3oOCXUV6fO3
	in9tzcbFhh1PpwfYUSnExwSCV06fj6R+mDNrr8u1vnXy4e/48y4+yjH5lS2F5utNc0jyzaXOf/u+J
	UQSLpSd8WFjqalrLOHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWO-0000000FaVt-3iLh;
	Fri, 18 Sep 2026 21:53:28 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWM-0000000FaUs-1N5W
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:27 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43f9b120so11894477b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768404; x=1790373204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEKcScQKYwpD2ZjF7rByElSaxHA/EpxXkim3g5WtdzE=;
        b=Hf7DPcQXrwfSxy0Wb+A2GS6dWtuugqw1P2Dz72uZM5IJVapNdWn6xXtJVrInfQw6cm
         7EnlPUzILtc8iBbrOpsBOFKfs8tZvSPztQvQK5BTLaFASqCWCxrj6YfmdQ+OPc0z4PoT
         NxaDfRTF9XP7OgS0JUWquS/mFHjbM+tp1Hc4Q8+k6bGG7EfXepLGGBTVs9I/la/OJFkB
         CZZWpPXJWqh/IlBPLS75YN5OC+4v0wGicKJqD6rcyWjLMOLq+yXt5Qm9Jow6zjc45X6f
         CWghajVbctWFUdGsQvLc4PR8ElNrgpgDd6Csx750kX3y2aQnbZPaPqXOGtJ5SL+WaF4Q
         NpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768404; x=1790373204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEKcScQKYwpD2ZjF7rByElSaxHA/EpxXkim3g5WtdzE=;
        b=cla6HFeg30h3P5LFoTjma3TX5roY+gDE/ZRe/PFHXD9kkFkGEny1KS4wRz7DsutKLl
         rmebYo4kEztbfxGBP8XzHWwveHLuzpGqYbrqzW6k9mBm7W8G5cc+dSicDqtcjs3xKadw
         3HenSXJNRF/alggYCMfFNh+VXS+JzC2mVOZSxnIgP2hzLsewKLDbVfQvmV3oQfIixVuC
         lxcmZBYPL9BaPd6mhGPfXkwt9WmC4HE+jOLlTLczH6R9wZ5q7HIM/rlvBlNI6O9Vw0Hj
         HKly7Rg6F7QDpCXgUED2WQX6Pic2YiSVqISC9L5FHy+FLQrYAKZ3bn/9S1l0cX+pYjgV
         YBRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0A3h90AgXtVYuwDIsmxca8/AvH34bEBkGSsv2VYxU8BOzoOxYHQj15WxoiMZ0eAQUPcubr+OHHDNJ7Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mZiT321ZaEXSkx4AXRHNj3Pld7MXIZrtT6/c5ruLM9rO7J1106
	fRtr/I0FM5dqTkW+Z+rE7iV6z5ucIJani2CvPPv2zfqKCFHxe5+fvyoEaaiMaDrdSgE=
X-Gm-Gg: AYBFou2qz3ojySo9IceNFqHxdkpM0HJY6EiUJyd373PMNoahndee9FpIqXA3yqNGnFN
	gvBagqspXdob92Jbyeh+42jdvBB+LYyY8wVki604y1dRUT/c9dD3eIAUYrVVjCBKp5UF9o/NKnu
	KK1smqoK3Eu2ypGp6Ed8n6VPc7bslU4J/RJDZXqAx2FcQFhsNalT0ive4DnXYDZI+BJwWUY0GVG
	eL1pNjG4+V+nFeKN4c3x+3Gp47H7F3YsxGv/BDfZUyI6irN+pFXigF67gkWoC9ul6enRS/Kj9ZR
	N4A7WZFTtyBIfVobqf4195hQVDLOSq+CFYT5lo4RqF4TxCQfXeFOiacZtCmC/LWNCyQYnct9+/4
	3tiXnOTJTtdxOwHv14Im55iCBZFj6QDGd5BkA7FGyhEIAEofODH35asmS+vHWcESJguRb/vsRmz
	tfMe6B/0f9VW1Di3HJA9UhwjExql5XHQBR3HZTEiAay0/UFx2zReqYln2zu8VY9yZbgupbvvlhX
	RrToe6Co/cNU3QhmiuDzKeQ7z6mAWSYt+Dc
X-Received: by 2002:a05:690c:a0dc:b0:89a:63da:fa9f with SMTP id 00721157ae682-89a63db0554mr2079187b3.90.1789768404439;
        Fri, 18 Sep 2026 14:53:24 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:24 -0700 (PDT)
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
Subject: [PATCH v6 1/8] riscv: do not read csr in vector context switch
Date: Fri, 18 Sep 2026 16:51:15 -0500
Message-ID: <20260918215154.2481482-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145326_528379_8724B979 
X-CRM114-Status: GOOD (  13.11  )
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

CSR operation can be costly as it may introduces serialization. Instead
of reading from sstatus.vs to the detect voluntary context switch in
kernel-mode vector, we can read the context depth from riscv_v_flags, as
it is always non-zero on a trap-introduced context switch.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - new patch since v5
---
 arch/riscv/include/asm/vector.h        | 3 +--
 arch/riscv/kernel/kernel_mode_vector.c | 8 --------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a77208..fccf9edb4e6a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -377,8 +377,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
-		if (riscv_v_is_on()) {
-			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+		if (!(current->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK)) {
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		}
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 77e98b504485..5ad93ddf6a10 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -182,14 +182,6 @@ static int riscv_v_start_kernel_context(void)
 	get_cpu_vector_context();
 	__riscv_flush_vector_context();
 	put_cpu_vector_context();
-	/*
-	 *  A voluntary context switch caused by put_cpu_vector_context() can
-	 *  raise the NEED_RESTORE flag if preempt_v starts too early due to a
-	 *  failed risv_v_is_on() check.
-	 *
-	 *  This causes the next context_nesting_end pollute the v-reg from
-	 *  the stale context memory in kernel-mode vector.
-	 */
 	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
