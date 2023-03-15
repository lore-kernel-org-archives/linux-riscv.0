Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F60C7618A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tYvRLHw9gEKn0Rz5Aa2iOaLZGFp8FAjuZbN0Ie7C3M=; b=mW9YrED/BSn7GY
	/5S03vObnDRXzZBNfqvDwD264BY11+IuYApOMtZdZR+BT5gQkVQCeuxdojv4DbrbT5MM5v3aAUBTm
	RZKC6yNuhSGNOy7p+hZ657gb5P7PW5Sz7Hi1aGsOv+g6GpkG5GGUxQucp78mqVj2fokgloKnA9WTi
	uNB1ekGmlodTn31xy9sSirPwVhXC0sjkjQ5ZDmzEUV7m2nE1wKO7e83Nb49M+v3+1i0vCtA9le0wb
	hso+Fm/noEhhXGgUQDwFENHtaoJFoMNF/sUk1uhsVR+KCT8cUgF8Hqt4B16OXpI+26gzL6o98i1O8
	RrTts5OftsYjyYufKJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSX-00C6pZ-2r;
	Wed, 15 Mar 2023 03:05:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSI-00C6iz-02
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id nn12so17350059pjb.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849531;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7SkdlXoEaWhStocARTpgdbab7cejcOgFmxzTVFGnrs=;
        b=gbSrb4xKWKUDpev+5xTldKtMAFbHj3vLwF3cqvdmErbeXSowCRx3W1Kku5VNtF25hQ
         JGkCLa2+KeTI18PILqbYkEHjYMXhVfMCNMqgjJpNLqUaCjh9zvONRwuCi/E/YW4FmmML
         REtcE7XQJ857RwYQlk6ALlq0ZQyrnFYldifPs5Jz+dyuB6eKFWhEduRI01G30w/4EfT1
         1Zrdtjd+hz2mImHV62PQNbWSbo7NIeuj61fPS4UZRIH4BIrNvbJhqdFctPR80fXQ8Ma6
         7SAbNL/Xuhqf/qhPu11eD9USle9U7StUR3J1PIzOw1/jd6mYdDgvCWR6PHnQYw0mTs8Y
         uSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849531;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7SkdlXoEaWhStocARTpgdbab7cejcOgFmxzTVFGnrs=;
        b=g1mU+1XhwbXf0mdflv+Ali+go/jqBfv6FmQuUi/UNQCareXu+Bq0aebI3Z9fhLE2Zg
         sQGAAruLkjPNJWM+wpnX8+Hju0qxt9apKWi4iTYC0wd/nA698byB7FbOLQdoqYlQ86N8
         p5ShgBscUKgnIaYtl/NnMsW8wFtZ5QlG8I2S59+VmJvzN7amZ3/qWvPcsppiedR8se/K
         DTVXHtHHTpgML25ZJi8pO2/J799H1dZLtl4RD01at84DTxp3ba7NQ3T0pqQnhhcCoiHC
         NL/TPJw/gf/BrjYfeieIdm2B4D72ccSZkrFWcNeKiqvL8kaZioXsMO6n+RyrD5ONUP93
         l0Ww==
X-Gm-Message-State: AO0yUKWM+g5gnyjduouSzhNPC1ZmT21mp7Tmls4qviyBUT2m4EnVwyf0
	CcVS8La1vrOrAMvQNWwgey1JEg==
X-Google-Smtp-Source: AK7set/LWO7bSRcbqzHLXpJ39gzf25G0Nz1mn+fYaEHT27G9psc0wa3GwCdvpFZwdrwZQMOaakTGEQ==
X-Received: by 2002:a17:90a:f3ca:b0:23d:3a3f:950b with SMTP id ha10-20020a17090af3ca00b0023d3a3f950bmr3857400pjb.22.1678849531021;
        Tue, 14 Mar 2023 20:05:31 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0050927cb606asm2185261pgg.13.2023.03.14.20.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:30 -0700 (PDT)
Subject: [PATCH v2 5/6] arm: fault: Convert to VM_FAULT_ARCH_* codes
Date: Tue, 14 Mar 2023 20:03:58 -0700
Message-Id: <20230315030359.14162-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315030359.14162-1-palmer@rivosinc.com>
References: <20230315030359.14162-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200534_049996_2A94F7AE 
X-CRM114-Status: UNSURE (   9.81  )
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
 arch/arm/mm/fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2418f1efabd8..c57ea332ca97 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -216,8 +216,8 @@ void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_0
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_1
 
 static inline bool is_permission_fault(unsigned int fsr)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
