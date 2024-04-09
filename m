Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDED1C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOolnAj9oNvsAF8iNdKeuFiM51lxdlbZlh2fgiUbK+M=; b=wH11mwqufyfUL4
	5sBBnPtebWq8XqnqhvrqiIasdZseD4VjGI8loXNL28B5CamLc2F6D9+Pac9N21HzoUno9QQjuTz5g
	/n/L++6xkdJFYwZAKJ0yQptV394PKKlDFdtT4zUJNKC5KqC8vUPo6N7/wKobpJVY2aGmXHx9+RH2s
	J2dr34jNyz8Wqn6eNEbNOTkchzTP2wsRWFawq7i0wHxWr9qHqmeJOsjBW4ZorSUuBjoE201nQaUKj
	yUiy14N8aCEgqfTyj5avnqCBadiOFmf9ujbhZ19656lXfkmrZABnZ/ujP+lsr0nH0/aTzldBG0N9j
	+o/k0m8VlYp3bWR8w0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iP-00000000VuI-34VK;
	Tue, 09 Apr 2024 06:12:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iJ-00000000VnU-3278
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e244c7cbf8so43834675ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643127; x=1713247927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjtTgkYtpD1hbyyXFcP/z2jvjrG+SfaQnLJvf/Uiuoc=;
        b=MwIVXecIzax4LaCj/tpeq/cVsD8EuM7V+HH0X7ribFhB1Rg2hDRv79lNiLAYmRrobk
         S4IKiCurHCShWAYtCJeRrVu6RwyyU2m5lLxJb3ZwQ5+pWLphFrC6uVe0O3hbbKZn419N
         +KbVqiTLQwIrIcbD/Z+6E4ays2RWOEQ8o5SQ7NjVMv5ypFUSWnVRqKShpkLyAGCCdfa0
         Xuw7C5wNv1gTPHYOxL9bw38H/5THCoReu/lpmub14FaevIFI+3/uxW9iBwRDYE04X2qk
         Xll3JBsE2X5jwUKL5VIgr8Lr+DsIPrNFn22ca6JqlwR8GNKMchnqmLC8qVLuvW20zQ5J
         dUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643127; x=1713247927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjtTgkYtpD1hbyyXFcP/z2jvjrG+SfaQnLJvf/Uiuoc=;
        b=rDv5SwdQL3hWYHfGsmmb8FLSMWGtw/vAiKq3cFhDVeB8p225OuQeAboCY7dRo/rbZA
         P+As46X5ICTEUsqFVLvB0elTMYJ5+BRVbykMKNlmQgtrt0V5S+IAb+hVlQ+OH/ScVmtB
         PmarPpJmUWTHDzQX3mpQvFwfcBc40I5oi3gkUJ5ndN/Id52An9XYyXPtn49R6TvSSAOg
         bapzlghsIUikIWeuoAMliNfQdKWQoLoXGjIoYrAHPnyn1bY334x/O75c+3Z+DUZjzbnZ
         3/PUMDCxfkMdV9+S8ilgBuYM0Lle9Qd3Bhi7K6OljYRK1GvpuHXhUBPJtryzd2VNtL5a
         PCEg==
X-Gm-Message-State: AOJu0YxL+mpfcGsuVDp2m6gIZAR5evkeDDHvk4leslQOt8DzZm0pb6Wm
	kCfr7Xxhl2w00UpBk/re8vQz+KuZWoFhuQB/YUbC2nx7As/U90RdY/gbUBTlvLgMKpAyCF5Ho79
	6
X-Google-Smtp-Source: AGHT+IE/zrYmmP+jRMmProhU7OrEkAtvl+lojCdG3T5dMALi5Qk/NiBMoaQSS094JtfcnVR7MBKxhA==
X-Received: by 2002:a17:902:e945:b0:1e4:363b:1d42 with SMTP id b5-20020a170902e94500b001e4363b1d42mr4916637pll.3.1712643127547;
        Mon, 08 Apr 2024 23:12:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 05/12] riscv: fix certain indirect jumps for kernel cfi
Date: Mon,  8 Apr 2024 23:10:36 -0700
Message-Id: <20240409061043.3269676-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231211_785505_C8737999 
X-CRM114-Status: UNSURE (   9.66  )
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

Handwritten `__memset` asm routine performs certain static jumps within
function and uses `a5` to do that. This would require a landing pad
instruction at the target. Since its static jump and no memory load is
involved, use `t2` instead which is exempt from requiring a landing pad.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/lib/memset.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..e129ebf66986 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la t2, 3f
 #ifdef CONFIG_64BIT
 	srli a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add t2, t2, a4
+	jr t2
 3:
 	REG_S a1,        0(t0)
 	REG_S a1,    SZREG(t0)
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
