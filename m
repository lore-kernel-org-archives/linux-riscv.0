Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269CCC48BF6
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 00:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMtk5sve19558JMPjxP8LcJBblEF3+WBFbTeEH7O2w8=; b=whCBRGIOvP65Ac
	/EfLrvbr3f44Gdy28nYts+GyyraQJqcu+dVIKA67N0bLlbSSUsVcbLSDV8dWJiwMsou3PDZXWzhuu
	5jd1MPFajrcCjN8UVG6ncDcJ93oATJtgyyxctHBh2nlyh9RvrY+vQW9g+ffPsjTe5P1xTSWMc1VQQ
	xrFtHEkDPA0Q98xhySq+q+GOdSiNHxhoOmb+uVFwhLlOfVG+b7gtY0I2g/O2C1xUrvrzHX2ZB7ylI
	DQCX020dqDjK/bkULmaQLtVNF62sNw3WI1KLS9RE34nzUfC1K30C6gi3f4jBCFo2RvU+uSOb7CyjO
	pnQRBd/KQ4J+Df/030ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSZ-000000036yz-0Y4s;
	Tue, 27 Feb 2024 00:36:39 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSV-000000036x5-2JhE
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 00:36:36 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e49518f375so1040327a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708994194; x=1709598994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lRQpFKqbWbNQreMqz6Xcr3vDFL47RlEenB0ubeR/xU=;
        b=J54WuJWOOGvE4z7qNFmYbGKe0VRuQYes9pvY+KoQhF1pmJCbI74XjrB5ilr70Ctqcp
         nzuRAuMSNeA0epsDukpihYXyw94conFQzN4lpHirujxwq1EHwqqpx7u6dp6n5ZlY8bDf
         YuYECBw5u1ki4aNMuCkyxJUoEYX8yLhTwJLe471ucdbW4G/vlJ9QxEkHP0fLW+AZCBBG
         IkgDNIa1bOEzkxDryHMovydBhkiTxhxt+580BQgelbZCTs0iZkJTDV8Xv351vz9MuCK+
         mmrdigFtREzzbLiKRYMmit6dv/MesH9UBmyF21cYXr7vbYuYVqSbxISWBvD84Y/6Mkom
         wbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994194; x=1709598994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lRQpFKqbWbNQreMqz6Xcr3vDFL47RlEenB0ubeR/xU=;
        b=X+n20SdGtmXdyq9HHHrwGLWSkRC6aXVRboso4q9lmt7/IZG/X3MRFVLXKcpqvEECs7
         Np/YcKdGzrM+MgZmPvjFNxh6BsZzsCQJhK9zpikY7AGmH9jQHFLyyrD0Bza7RQX23y+7
         0nNQEclbqKdur55hF9dEJGSbI1V7s3YZYDOCLpgznPLpQ0xaVn1Ea2s6wFem7Cm6GiN3
         6BvtxKpyoh5UUDIzGyXLvKLvDSWuvOXwOpZ76++C6+qC4CBWT6kndbBGngd8pVcelv3q
         uw2FJkWpH+sJLVOXlXF6k5HrLUpNypO00Y2BlT8zN3gU6SMMM9rmBgOQcBluJo6XQpJc
         UkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmaK0+dO2mbvmHUFOhkHjUTYEarJG6dMfEerB3gMHfvr0qKQKxyPhjrzVnRGgr9avdVuiJD7g1Z2DUW9cgXcQKZJ0NG9p3uV9Y8ClpaMyW
X-Gm-Message-State: AOJu0Yy0wtNk+QqV4gpEK47+63uIRweGd+JNj/9kKyuGIfX7s9eztVVu
	h0T32qvHusBdljwT/vrI7AAGimHbuc2A/GX0+iYPJLDFOKOjCDTatHwFVDMu3no=
X-Google-Smtp-Source: AGHT+IETqa/FMi7iqDX9bT4O6ZZw50Wgo3XrJ3ohDt+qe+AARTjahlEi4fDnuqyU8dRL02wMEtDtwA==
X-Received: by 2002:a9d:7845:0:b0:6e4:85d3:3e65 with SMTP id c5-20020a9d7845000000b006e485d33e65mr9808993otm.8.1708994194200;
        Mon, 26 Feb 2024 16:36:34 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020a631919000000b005dc85821c80sm4504117pgl.12.2024.02.26.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:36:33 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/4] riscv: Fix TASK_SIZE on 64-bit NOMMU
Date: Mon, 26 Feb 2024 16:34:46 -0800
Message-ID: <20240227003630.3634533-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_163635_680380_F974D99E 
X-CRM114-Status: GOOD (  11.28  )
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

On NOMMU, userspace memory can come from anywhere in physical RAM. The
current definition of TASK_SIZE is wrong if any RAM exists above 4G,
causing spurious failures in the userspace access routines.

Fixes: 6bd33e1ece52 ("riscv: add nommu support")
Fixes: c3f896dcf1e4 ("mm: switch the test_vmalloc module to use __vmalloc_node")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..a564a39e5676 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -882,7 +882,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #define PAGE_SHARED		__pgprot(0)
 #define PAGE_KERNEL		__pgprot(0)
 #define swapper_pg_dir		NULL
-#define TASK_SIZE		0xffffffffUL
+#define TASK_SIZE		_AC(-1, UL)
 #define VMALLOC_START		_AC(0, UL)
 #define VMALLOC_END		TASK_SIZE
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
