Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97759C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUavkeIdjbH9+3Z28tnZ2M8IneQSW6wbo3A7EzzAaWM=; b=qWMkMi+85FY7Lq
	INT7HpkNRYrGoNlFf3dDhIuS8oXFGG0JGB9hwJmitRV+QiG/gf/zp+TbpHqEQHeCLdX5Pf1+Jb4No
	b+sIdSb9vlN88ms1k5A1Ui+3LdVtWfRL+LbvZyBjuAVdHYsJXYkcgDW/FLDxuBmroOXNIn6Xm5BNI
	w3jB/+Q5+wqr+PlX76IUhmNt2KeaTIac8/BEuqdQ4AXO5JO6g+senmWD8hBkH8EL4vwNVRUXXkpsR
	blxnwQRxo4c9tUcu/whYI2dcQ1kkeNDf1N5g2DcLycSBiJm0/nk43jGTzxyo56vk7URZ8zoFrpTBA
	3RmJwYQHbip8J/ebiIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI51-00CBxF-1O;
	Wed, 15 Mar 2023 03:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI50-00CBwr-2a
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Mar 2023 03:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aOZC9xlq5oK9zfHrbfD1I5w67GRN7lAgeCV10VaVF3k=; b=k8BvQgFyNGWuw2ZiefxHbbg1XP
	q5f5PnkoxjxMCjL5LtXMo0I/+hFXoAh1rlB2l5rC0UiPUIWmyFlYMhSotmXInoMl8IRush+MeEt8q
	QGVEJ/sUmQQI0wrgmvihDrU7t/ftgMS+1Cr0oQPVz+dOKHzwLDWEKdoOXbuHyyv7YclBihxtnJNBO
	JKlLljtH+ZNpS25OvqlG3lobsAIVNSYSnliSZ0liedgjBHwJuU7F59QYkqX5eR3InhN3wNcjnCOjr
	0nAC6wV1vCp9kCgkifAN4FjawhxPuRfGR/ZhR4nYCC8FNuS5i52rlGBmWeinJbr3A1LJoa5K78YHh
	ASvpJxYw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSN-001zEm-1A
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so432819pjv.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849532;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOZC9xlq5oK9zfHrbfD1I5w67GRN7lAgeCV10VaVF3k=;
        b=K9waOzhTSocf5S/wDOQBDgV8dv2EBbrWlB6icT3n3eOn3aBwCzE1quBWWS5eLBl43v
         2GIX8VAElVK01zF7Q159vC0+esGvSNVEgVo1krYdOpl58TPEA72YrMA4t5AldEkXWuvT
         d8RLRXgJUdL5i/Q9N7TPgh6s0Dd6c0p3dhRvCjQbX4bcG+gYii0edSeZeYzcTH5W4OFX
         5zBs70RjyU2IUiz+9csHcPQxfGOe01e4ihaZj84AhEovkIliRoH0+xNZddmNKkpvvRYq
         NnRXeKLrhnhS7VS97vZc9U4pYx0wGeJV79JPP30ZFOtR587Idcxeo3jvJJsC3P0+Jxsn
         Ztcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849532;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOZC9xlq5oK9zfHrbfD1I5w67GRN7lAgeCV10VaVF3k=;
        b=uVra3FViYD496WqJSFbyRD4geNX5gQ3g+iHlV95s/xF3zYb8j1wyduE7lG6WZgF3fD
         YnbZIJfpow7GoPY7cxEmimWJXsYz4pmRkjxfxZ/f1GzYTDQ/vq5H5JyDz+a85FsuhzLF
         1Z+k+Hrchh1/sBDIjFKu8xrQITmUasGb6FfbE2VxEQEZE+E5Iwr1/OJvL4EO3bXdK7+L
         0O3vFPCwTN7X3/3mBag/5jdko++9lh1uJjYVvPVPdlS9G2OhDRqne32o3qmKJjahKvqy
         SgmjKpBj8bIaKTaLo0s+WLOFULyMJbW5s/hz54KWtNC22yI4vmmkBdLId49BIaDJo6xy
         +LCQ==
X-Gm-Message-State: AO0yUKXUSuoQ5hV7etbwX3J0I6Qd/XSBYmbrmGu+x8MPd25vLcAIH8X8
	4IEx4dRmHACOzIIZx5nVRsdK4Q==
X-Google-Smtp-Source: AK7set9kCiiyWzQ3igLEvZCSypTckIX+ebt5Tmlk9BmpkJZJwcIqMSFzq7VaBKi++BxTMFzZG1Gyrw==
X-Received: by 2002:a17:903:138b:b0:19f:3e7a:4290 with SMTP id jx11-20020a170903138b00b0019f3e7a4290mr890658plb.17.1678849532243;
        Tue, 14 Mar 2023 20:05:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090341c700b0019460ac7c6asm2406194ple.283.2023.03.14.20.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:31 -0700 (PDT)
Subject: [PATCH v2 6/6] s390: fault: Convert to VM_FAULT_ARCH_* codes
Date: Tue, 14 Mar 2023 20:03:59 -0700
Message-Id: <20230315030359.14162-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_030539_665992_BF32BCD7 
X-CRM114-Status: UNSURE (   9.82  )
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

These conflict with VM_FAULT_HINDEX_MASK, so move to some designated
arch-specific values.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/s390/mm/fault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index a2632fd97d00..f1a186a4c465 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -50,11 +50,11 @@
  * Allocate private vm_fault_reason from top.  Please make sure it won't
  * collide with vm_fault_reason.
  */
-#define VM_FAULT_BADCONTEXT	((__force vm_fault_t)0x80000000)
-#define VM_FAULT_BADMAP		((__force vm_fault_t)0x40000000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x20000000)
-#define VM_FAULT_SIGNAL		((__force vm_fault_t)0x10000000)
-#define VM_FAULT_PFAULT		((__force vm_fault_t)0x8000000)
+#define VM_FAULT_BADCONTEXT	VM_FAULT_ARCH_0
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_1
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_2
+#define VM_FAULT_SIGNAL		VM_FAULT_ARCH_3
+#define VM_FAULT_PFAULT		VM_FAULT_ARCH_4
 
 enum fault_type {
 	KERNEL_FAULT,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
