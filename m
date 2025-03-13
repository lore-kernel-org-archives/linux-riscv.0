Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E361C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3vGLW2FV+tqYL/RIEVZByqIZRTiAUKfo1PwqvEURzw=; b=Y1YuXzcG172z4N
	gANuZaJ/HkUWgRx7cDjbUW2TPixYY816lkOPhls4tzi4VMniUkWEsB1vRECM4fZdMc95Xjt6g3NOL
	mtvaa3gmBxYtPEu0LzzciI3xvLp0wHsuatcZuH/Iuv8+MNENwEbKpYg9IojsJm1OJ2XvarOSS1Gn+
	iZa4yX5OoofIrkhhnM1sdPXlI7It9NIce5epexA1yD4lLgxVx0qxxSyotDtkcgJpLb5aGFDWvOivd
	VI99fg4pzzHrVaWsUuThXC4bwPMz7fY7PM8cpvXT2sXUmJx/7tK3Gy5yEMtL3XVHptevN2BQyqziE
	Nds5P6QzmXsi9unGEjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB9-00000009uwd-1nDg;
	Thu, 13 Mar 2025 02:20:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB6-00000009uut-3WaH
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 02:20:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22423adf751so6770475ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741832408; x=1742437208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhrJ8HGtR8k3dxAA+AgdZEOnZohoN1a96l9KBcI/XnA=;
        b=V8SJD6qDBxGF+QqmebMAs7mMpAbboMwqbvCx2zhF35cL6o6YjVhptj4gOBtG2PZKlG
         Cy7zgQghOokUYQvM2qSufoVtU8jW4RK6slQ0LFOVK06nhbe1JMSdBy3iVO+HuL5EKuXp
         K/sjdZ1VOWwng82hf/YyXxeTiQjLCDuevIenzbE6cSeAiyyeuBZEkKhItS3s9kuq+uwh
         XvzQgWTcq1PLK6udg7YCFTvpq2QY/1XCrTwCLc9iCVL2NT+UpbpP7byEE3kaT+cr/jGz
         YxVhlJLieJyua3/aB6uG+WWJ3ydvbInsHfGJ2uCEnOO18bowGwMm2nLqa2Brbmfzitjh
         3fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741832408; x=1742437208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhrJ8HGtR8k3dxAA+AgdZEOnZohoN1a96l9KBcI/XnA=;
        b=RaRyX01DlzaziJuQYVCt2fCNpaLktnFdSzr3YA+RFRVPViqFk1MTaWGNjbAnU8VDiN
         Rkcn/yh0MnTqc8BZV3ZLeSmtXl0+dmqNNBerIrijJgOSiB4sx5bgVkfQzoDTBW5mBxQv
         hCISgmIWklpqA0w5ghk+/z3MhpOecX8QO7YEdOr78QCEAMjoOb0sEFS/ch5+Vg4X1EAL
         NNPlhfs3zsNRdOaXK0RGKDGHIcuM2aH24M8qGMjHdo0UE0sCzCo39ujfxdVdhNAPo7KG
         EuA7SnH8rAEmkdqEZ5CsfcdlecOxlGcDH/ii/3bmmanYW4wcw4h/qrQWRUvmGWesB9Q6
         PkLA==
X-Forwarded-Encrypted: i=1; AJvYcCXvbSya/XWzsTMTYyqRe6Nusmb3mlFCu6jbLPIeFJcdAippk0Ck9NQcq+hznwyvSYTrmD6xh8MndLFqEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9gNVqdwjhpmIQzs7tjt8yhqP/gs8pu1w2atgmDHO0sw0XNlQ4
	7rvC7StD/EFaJcUir5TvWwVaU8/wonBAKT8PnIy2hvdMwbaLhJDw
X-Gm-Gg: ASbGncsh8FRv5uOXHbN0ALdfhJGzVdkw+JWfl7eaYRgHGxO2Aww50AUotW/Ok03pQkR
	EIbJVrpULUr7YrU/Se97IMdVA/a84PY1cb6C4ZEuQWrFMZ+CyLvrQFS80G7I1Rj0yKdO82jQcGn
	muh33m0RfbMxbpuS2hmJ4+hujllV3RrNPKy+0EHmGwSxCEkcgwZCSy6Dj9YJESm9Eh95k0yt1pC
	uN8z+0DvEIHA+MGw/PPjUqExdRg5NPIGo7kfFperb7QEkJMUlhArBLLbcUL1TYwVSDPVNiePT2V
	vaLojdnCs6LLzy2vVPySBe0EUX+lX+B4IOhNELiwfoz0
X-Google-Smtp-Source: AGHT+IFcQfoNRBmW4J0WVDBuE/gGCx1w5h+8C1HXlvpyeZVWWTFjP7qL4lXzgdHuMvZqdEU+k1TZgA==
X-Received: by 2002:a05:6a00:a09:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-736eb65d07amr13574673b3a.0.1741832408295;
        Wed, 12 Mar 2025 19:20:08 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155934asm232634b3a.56.2025.03.12.19.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 19:20:07 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH 4/4] cpumask: drop cpumask_assign_cpu()
Date: Wed, 12 Mar 2025 22:19:52 -0400
Message-ID: <20250313021953.86035-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313021953.86035-1-yury.norov@gmail.com>
References: <20250313021953.86035-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_192009_122289_321709E8 
X-CRM114-Status: UNSURE (   8.40  )
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

Commit decde1fa209323c7 ("cpumask: Add assign cpu") was merged bypassing
cpumasks reviewers. It adds atomic and non-atomic cpumask_assign_cpu()
helpers.

In the same merge window, commit 5c563ee90a22d3 ("cpumask: introduce
assign_cpu() macro") added the same functionality. So now we have it
duplicated.

__cpumask_assign_cpu() has never been used since introducing, and because
this series reworks the only user of cpumask_assign_cpu(), both functions
become a dead code.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index f8caa025c6bb..ddeefb2744b1 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -558,22 +558,6 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
 }
 
-/**
- * cpumask_assign_cpu - assign a cpu in a cpumask
- * @cpu: cpu number (< nr_cpu_ids)
- * @dstp: the cpumask pointer
- * @bool: the value to assign
- */
-static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
-{
-	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
-}
-
-static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
-{
-	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
-}
-
 /**
  * cpumask_test_cpu - test for a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
