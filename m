Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3B606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvvDnvER;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ExynSDzd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z4txZn943t7bbwFRzkf2ZMI+mfEybEeLb7NW2WFd1MY=; b=vvvDnvER2pckKD7GOAPjG13foT
	27DanjZjtpQQUfDLaxjkf2opMJesPJZZ7KHwXx7YvXQRMPrva1XA6Cl+pC3KAZq4B6RF+Cv2H16b0
	a7nze2wkK2nIKTEM/E9MxiEf4hK5aZZiyapwNHKeV1epUdeTUz/FMkoCjp+N3wYx5lqYo3s19lWnN
	GaEGVcsNDagrzRk8S67/cJzAX0AwPDRoHVW1eHwfOhTzn8TKNljBk+qbNAQvVIa2VszJef7DSE9Re
	n7NPIZbXjzAtqPR7PQkFyLDIL0drTpyKvJpN2szGo5O6iho6H7+x1EsuEf9s+RAj7viYjXGIOKQ6r
	HQjaEqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoEu-0000000Dg8v-2TQD;
	Thu, 22 Oct 2026 08:33:32 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoEn-0000000Dg1A-1Svo
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 08:33:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1259633a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792658002; x=1793262802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=htbP1Be5/tb7LgqEiuAX137LQm3n+SjOO/0MPt6z5aM=;
        b=ExynSDzdDjdKqjh6tdyz0ODzD2adg9atxbVnLIWEx5Ixl9cVpfm89ia/piBgvED/Hn
         Hw7VTqDrl4YVuipIL1wYT78tkiwtAP/0v9C0ckoE8QdArj6THQqxAqsU/VmmEaxLAA23
         WODH0S9p+FDKo7AVX8CFauopr7EEc9PZOB1iCvetFedHEmTnVIi9q6t7aFQb0hT9I4eC
         39xewzueM+ylFLy/VUHS3zNZKkcXnKbZTUIDIH3tsb72Pr7/AtGDgIhN8uqgFy3jG4qf
         tg/3rSNX9OES1dY4W3hiXtIPmPLOpMHoEX4eOn6dOF5zK8DOYS4pHdWzfLSLx93EwFu3
         /1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658002; x=1793262802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htbP1Be5/tb7LgqEiuAX137LQm3n+SjOO/0MPt6z5aM=;
        b=a5/yH2bqNQSxvpOaGcKMKMVH8uYVXgnuxQhZTorJh+eLVFZCQ6CvzWuCwQ+0bqqneu
         0484keU7VSqUvqKSA1Za3LaQFoOZSkU39w+EAL6HtQZL4VKizPMP3FTE8ocyRKkVo3SF
         ARiAWoUJCvA6PMTPm/QTnCou4mBzKsqLvYKwMuFXtn7H8yhdAU1NfmGBvUfBT5Qa0lFx
         FFR01qj4WXFtX3H9lYGx1ops+shAsCS7aemkjgEW/69GHRR/zWLqxOT8nSxSB8jaOfDA
         7JlqxE+KVvVmVuTbp/CySUsza65QoriQWf52bMUd+vy5vPEIRryYEczmz+HQtwAtW3P6
         iyHw==
X-Forwarded-Encrypted: i=1; AKwUvBykMiPrDO65KLlvBgtBMQPPjKYxZZkwomAxxkqJ+3yow97ADR3wBTNWTMAC9SSa3ToBipyuk8ImAzkwYg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKmxe0dDVaZbErIYyailVqzgoUWOHI1JpOY5WqmVvdUkWwSExgZ
	xcgiRjDtF3s+eip8VRvgjZrmm5Mtcxyp5jgTIlhK9l84NILne8WvULO3tzHBuSNHnxU=
X-Gm-Gg: AYBFou2y1bKxeoVDl+MlQOkE303b6MLM92joN99TWFWWq2fasZQAicjrg75FNcumEtC
	ujUhIhDt/evB/BYX8+XGtthit8NCzXjglPQ+WBlswoanY4FacyvyBNQoBAIZfEQRyCCrqT0eLtS
	+tF/hquXzv7u6eK6FLdgbF+3EL7gPvIhL/IbV2G0zqTIL2ErQXT5eptFBEiWYBonaFoEZvHP4Xq
	+hcWvm6jVgURzffmSoEGrM6hejBZNIkTXicCPENig3hF/gUzSG/NVTflM33vglJxK6FVCWr3IAi
	/IdYseemnUpMif7osTmgFb6pELqGxNWO6783UFVbrngxwepo9MM4TOc5W7CC0MVnjV8HpX0YzsU
	BnuuY+IcVaSKajUCv6birBEXnannWphIFpn/yEkvkpZ+6bZviALqQXKapzM3F1sXDi+dnPW2988
	OQ/DgY15bGS+PCzNqdErLIlm0+EAIhfqDYfA8eGSS+GWqfuVVhDK7YjjB0m0Jp6OK2OMe4sKCfh
	9hngXCiliA9XrrViR42BkM/7mITEoY4YulQVuShR3z8kHvSEEcoyS1hz4SzMHYXcWH7HNiwl/Ux
	9VhnIh/1o6KkSKz8sw==
X-Received: by 2002:a17:90b:48c9:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ad8708b8demr3966898a91.49.1792658001786;
        Thu, 22 Oct 2026 01:33:21 -0700 (PDT)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm3302053a91.2.2026.10.22.01.33.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 01:33:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	zong.li@sifive.com,
	wangruikang@iscas.ac.cn,
	debug@rivosinc.com,
	qirui.001@bytedance.com,
	cuiyunhui@bytedance.com,
	guoziyi114@gmail.com,
	samuel.holland@sifive.com,
	ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] riscv: Fix SR_SUM leakage across context switches
Date: Thu, 22 Oct 2026 16:32:12 +0800
Message-Id: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_013325_404100_8FBB5EBE 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__switch_to() saves the sstatus value of prev and restores the SR_SUM bit
of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
set in sstatus.

This lets next run with user memory access enabled even though its saved
SR_SUM state is clear.

Use csrrc to save the sstatus value of prev and clear SR_SUM from the
live CSR before restoring the saved SR_SUM state of next. This keeps
prev's SR_SUM state intact, while preventing it from leaking to next.

Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
Cc: stable@vger.kernel.org
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a77166971..628b85e3915a7 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
-	/* save the user space access flag */
-	csrr  s0, CSR_STATUS
+	/* Save and clear the user space access flag. */
+	li    s1, SR_SUM
+	csrrc s0, CSR_STATUS, s1
 	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
 	REG_L s0,  TASK_THREAD_SUM_RA(a4)
-	li    s1,  SR_SUM
 	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
