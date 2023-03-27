Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C2AC761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2fyFm07+nn2ahfB60CxlNiPFSokEkf2cHvGIXDYfx4=; b=nJ/CyxDcTT0h6P
	AkAUPlOf8EEbBRm8pDKB1LVP3XvoNsU/wy3zjOHTcDMtU+Yr2VrUA946WOYUmbzW4JwwSSHAEmJlW
	/skiKfpL3UeCFEhxeDfBB0OSqyGzQc20ZdEnSXz8Mbs2/9Pli+qEjenU7JjxYkdvexdjpr5R+rr1K
	i04Qi1blg1YO11Z9oDUyG+W+le0yge+zQJ2GOZRq6/kxmhJPmBXudXPmLvEFEHi1H47IKqJRmXy0P
	AMTvYLrLuyQlmvH21S9Z9bMovlBuDwMTAEYqLJK6LImtjh/YwH/ZEIPYkvPK0trvkehmgjzTiitZ2
	vvGy2XHSrXP4GbIHv6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq37-00BlF3-3B;
	Mon, 27 Mar 2023 16:50:25 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq35-00Bl8q-1k
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id k15so5528962pgt.10
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935815;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRENwq6Q5h6bJkuLEU9y2ZlvRnSbbBagGQhAGvyqbY8=;
        b=Im2pA+xjTJP1P/7egZqhj7wkh9qONRyQrUqtdz7kdGU6/vnyYyA3/IT4SZ/uJsFTVu
         VWMFANP6w7WezQw3jXfiusIanyzEoBNI7oiUGLghiqVc7+TWpzO4xUt+PcIA1IAyTWeY
         pnhXC0LjwfO79zrt64ZGJ0+iFsjG3xUHog792DyiW6TQucAA8dW6dabCNdCrM2C1JEah
         SkdDLNInlQ8X9+1bxDO4QiFvUKU+eYBKvTTVtiBIUaAqkTfJmC7rRSlfCusQNKIOmacS
         AS0DjilPT7oHtUKN+189FM5WbpRrtL/2ufvhPs+sjv1kUc/nBZFGbDemb2g1fJagMlsB
         R9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935815;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRENwq6Q5h6bJkuLEU9y2ZlvRnSbbBagGQhAGvyqbY8=;
        b=f8oy39VsEr9nTL8KEFPZn38nfwP11N8XiX2W/ctk+NmW751EeoNFFjZ6VntGKCJ0iQ
         5X01axIOssyJug40ZUS/KqSpyYbi3IedlzckZkKWQvlFqUOy6afxrRbnVyRmHNiZ5ZkL
         jEK//qAkzwPFntf+FcCCan8+Y7SOnLg4vghK39p36fGcqFTlPM4wzpeQ/6EuWXHmoG6T
         LexnehDEHMThmc4/d9jpRIuoXcPaKK65r1vclbx5nqVNSq/gM8d1mVM8n5oHhDpvBOMj
         PF2IuH7gjAq0ON/6elw86NvzeWIGNOMwCTGWxy21beSWN3/vwXiRCRNjHOK+N+S917WT
         w/ag==
X-Gm-Message-State: AAQBX9fq0rnoILl71MzoDS6SVWBZkLEpbB+vVayGAzKas3s+sH8E4wMR
	/054ZRMobNbyFBxlDdJmwr4zgeC4r5NXVl4m5XyejtJjT07RmWNBKNyuKq8kmrD61hq9hmUkaeH
	c5blcWBduHnX7XKuyYD8UbL3vlWPsXon6+r5CwwJIb/zYN1w7K5op/XOlK/+9W2aBSeg1pKQ44w
	qKa8bKjTi1Xymf
X-Google-Smtp-Source: AKy350YgIDNmaFkFmOyTXNpYJWHviuDbzam9Pt544m/wq3Qo5T1ceNLABvH+KviZQi73xRGSDtn+uQ==
X-Received: by 2002:aa7:981c:0:b0:625:e3c0:8a58 with SMTP id e28-20020aa7981c000000b00625e3c08a58mr12825490pfl.4.1679935814799;
        Mon, 27 Mar 2023 09:50:14 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:14 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v17 05/20] riscv: Disable Vector Instructions for kernel itself
Date: Mon, 27 Mar 2023 16:49:25 +0000
Message-Id: <20230327164941.20491-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095023_583974_BA0AA45C 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Disable vector instructions execution for kernel mode at its entrances.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..e9ae284a55c1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -48,10 +48,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3fd6a4bd9c3e..e16bb2185d55 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
 	.option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 	/* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
