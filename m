Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC99C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyayrQTXSjla9PiETTfaKdMNI/+jSvND25nHsU22Lg0=; b=YOvdJVq8QhSLx6
	jMEV+IPpUJrETeN3jakFoq0A3U6Q/KvVPyKAi+UdjvRZj4BXuHEhFTJirSWBk2excpMzqVQwuzo+M
	fpYBM6DBmCgHAKo+Fn/4Ov/TrfFIiDVBwNb3cYPSIWIZ9D6pr3PA+pogDBX0GFyZcacxNJ36600nL
	nLGNDARHM0Hb8hrHJB5Lt8S4ZRKUcPyf4Wxt+6eOYhTsH6aLfpWDGkKPs6hIheYDIKgXtEkoLUnaV
	WApeyihJcnZ8r6sfLU5yZ7B9+55IrTVnlo/v974TZl/MVKEJz4CiXvI/KnevDkRZShn7VCdHPnyWo
	MtY8o38sK5udHX6u4fGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFB-006lHJ-2V;
	Thu, 25 Jan 2024 06:29:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStF6-006lD3-2I
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6dd84fe7aebso1958121b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164180; x=1706768980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U4/v4w/mrwXRuPEpy9c03cIo3F2WWlXK10aLJp76Yo=;
        b=J114D3Yb2qF9h0uLdY3Yr1ta0Ot+1ayXt2QwCuWTHNcO8B1/weU6dfZEH4dmI1yhSp
         NQuy6aRi5d9RrVYSdclDMx2dIt5YsZZgHh6WOsVeAn6PrLCOPl9A+8rYWbaGMRyprEEv
         6qAikTO3ndeMPHlNW8PnbGKNExBG44KZ5V+oYp36XhDEf+dgAP0T8K8zlcnS4d4B64Fh
         z9UFWX284VM4JYiBMxTGGRhzmkZm4vOEKOVvBmhCdB/vL7XUx+A7yIXXZ8aZe3w1p7s6
         yyDeULET4jQRrKUCo7iXXAAeeuErquQxbYQ1RxOyrJriUMr5hVrO7APEq+TD0nBUKXfk
         g/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164180; x=1706768980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U4/v4w/mrwXRuPEpy9c03cIo3F2WWlXK10aLJp76Yo=;
        b=w+Mow/Icy8h+w+2tPv+wB2oTa7kSPEwd4hTtnWNgYYG9JolzyRbqb1KjdGAo3pP4aB
         LYU+ZPOo1/jxUQTau8DzZN9DuDJLVLTqSxRTUocasRZXwM1SUt09ObHeXiE/IPZruFVJ
         DoVJNRZGarnRCqNRmTUNR2CekGuwZs1GZ90i5t2oUxKXYDV2ko9VaH2bbeR0Zzdsh4yH
         ZDGjATmLL/DttwlAdJq753dsizNYfxvs7jn0qYjLQtv/BCUPR6iRJiYzR4qWyo81f8GH
         hS0WF3Za1KGgeF1W1RalL4IKkpZeBhY9q8gGrlcXxlYToTC18pS5xPe2Kd7tsOKmTI81
         X2/w==
X-Gm-Message-State: AOJu0Yx611FDwajbpGwdbDItKo9TMoZx1O+fmggLg4l3ZC5AiWzfCmLm
	5/+f2hTzxTVfXcqL3dZx42+IY0YqxsP5BxII6hDswXXqGkgbpx0zwuzE5tibfh0=
X-Google-Smtp-Source: AGHT+IFE6DJFyN+P/UFNG3VqxG06rTZRsSyHKHiD9aR2/YyBQCkrTLXVopsPYOyeiHivgMNZUq582Q==
X-Received: by 2002:a05:6a00:4006:b0:6dd:a072:867 with SMTP id by6-20020a056a00400600b006dda0720867mr290270pfb.15.1706164179881;
        Wed, 24 Jan 2024 22:29:39 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:39 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 12/28] riscv mm: manufacture shadow stack pte
Date: Wed, 24 Jan 2024 22:21:37 -0800
Message-ID: <20240125062739.1339782-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222940_750943_7858FBC5 
X-CRM114-Status: UNSURE (   7.51  )
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

From: Deepak Gupta <debug@rivosinc.com>

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 54a8dde29504..7ed00b4cc73d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -408,6 +408,12 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -705,6 +711,12 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
