Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972BCC021B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 00:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8BBnsoc/kk0dSozfADzEC4gWWUWspuRXhpkI23qWaI=; b=16eDI6qmW788Rl
	6msu/TygWcMmcsCnQhsEgnTy1Xh7y/UT8GXYZeySgxW/krMI/8UqpvdctWBy8/RB+ly+kwY7VUUEy
	A5Yd8v1Wm1oSWfphnOSW4KnMp7ghhF8FhmtGXgajNvSIQPMgVd7p8lt/oIlvpq2cqmK3x507X6DzU
	uAt1gePkJDKsz4bMaHUbvONm5xgn3+hpTmwwvSEPZTiOeAIOr5bBxkrVSRY347/McosK0pOuHhbOl
	K9V8EHA9VFNi29PyiCs5HR71PbQ7hF9j07PfkNUqMNIrlLBqXwQSB2+onr9JJUTrv/Vha3Ocmd3Ar
	IwpALiF4IzoC++AbkTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbq-00000003SNd-0Gsq;
	Fri, 21 Feb 2025 00:09:38 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbi-00000003SEP-0kD8
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 00:09:34 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3f3f4890596so848227b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 16:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1740096569; x=1740701369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVS2gJ1tGF7KfC44fJzPB6s+5bKduKUUF483rWDGJdM=;
        b=Uc/8Mf4Q06IbxHlo+cGHpvJB1AIBnLe3mcYN2zFlAQOWk4xgDNM6O8K+6Vstea6kL2
         G9uPxCVdAk8o7yskNORi1u+gOxgpOK2r2ALpDwvGKnQrxtL4YjC2Hi4d3qucGshmLKR5
         Dmv74IkGxZDJMUp6WsJDVSUS334kIpURZYjnAqdD3cLsNtpVWvlquRTSAPYHFfGEGLZu
         SRk1M6r1ZW5484Zrfvdr4ujyCl8b3GOiLSqD5x6sRK0nSewFunpo4V765bfIZBFt4FfB
         FFgRSXNc5oIqE+XJyVay3mR2H9z592GcoIDnbKOTquDtvaY+wsE4oRTdtZCC8LiR06xI
         6HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096569; x=1740701369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVS2gJ1tGF7KfC44fJzPB6s+5bKduKUUF483rWDGJdM=;
        b=jOSrq48KFZCgbSw3olknNiZKi9BmMt53RkmZku303xDoEZV8eMdUiVZ0zkmOZDelhI
         gfStGiFH1qYOLdNOcHoTCriP3qpg+C86W4gZtsRMYssFR1MJgfFtIuKDs5vfdImD3CJU
         DtntCWSAUeI+Wcv/67U3sSMwKzWAy0Bee+OfEtI9K+tweTfPbq2mGSjFbFQDYTQBJ+wE
         ICsDFveZ0SHybaTB/heV9iK5ORDfpG6KNtNKpW79KeQa/N1PV8gNX+Gh1rtVLbN8J/0/
         Rve4/BiRcIUd9zN/iTCUx8D61rDs4DJpKEz1c2/aSEyJvGEHm/Y5HyX8XPx6ZyPaqYhO
         TvEQ==
X-Gm-Message-State: AOJu0YxSv3GBjT0cU0ralzZehQD7Rqh5psHBZbEvWCFHduKEq+IBahQZ
	wbJjJm5VaOCWMxbwPsGmd6aKW+ANiBzeyMHYiXCA/XCYGtnP9qcyeFvuAjvIzg==
X-Gm-Gg: ASbGncuuhdzf299so3poPaiJFOmIrY9Gp847Lp9nvlWjslrFYMrIMkpsmuUk/n20+vE
	GJvwXe4T3hkUZxNO1uGdouYvdT2DYOkCtLgBbdJdeuOfIr7P7qzuwOewMeuv0Pz6UKyILYkLDbb
	I1/97YNLQO6j52x5Ty1q6nl5VJyoXp8UJQqrXEfAt31MtD4vXtAkTZoc3H8Xns2twOUSIhdNA5w
	qrtS5FlUVPAa8OiJNgECeyfPg0PaexnxRPtnaryRQgvTqY4mBigHiTLhg5wsP3ExMyvr2GdJgQw
	9eClE1YbrM4DhYGXeoVBKgX/XIo0/uKXMQ==
X-Google-Smtp-Source: AGHT+IFKRfnHqdiP+z9IB6oatR7TvVXNmSxjSJMg1TAS9ThRlHl4CaTM35ogp20h33uxLtf3x9nOIw==
X-Received: by 2002:a05:6808:1490:b0:3f3:db88:841c with SMTP id 5614622812f47-3f425a75607mr599965b6e.9.1740096568994;
        Thu, 20 Feb 2025 16:09:28 -0800 (PST)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f40b027906sm1573401b6e.42.2025.02.20.16.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:09:28 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v3 2/4] riscv: uaccess: use input constraints for ptr of __put_user()
Date: Fri, 21 Feb 2025 00:09:22 +0000
Message-Id: <20250221000924.734006-3-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_160930_233646_E781D214 
X-CRM114-Status: GOOD (  10.52  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Putting ptr in the inputs as opposed to output may seem incorrect but
this is done for a few reasons:
- Not having it in the output permits the use of asm goto in a
  subsequent patch. There are bugs in gcc [1] which would otherwise
  prevent it.
- Since the output memory is userspace there isn't any real benefit from
  telling the compiler about the memory clobber.
- x86, arm and powerpc all use this technique.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 43db1d9c2f99..fb3961ecf38b 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -219,11 +219,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)					\
+		: "rJ" (__x), "m"(*(ptr)));			\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -236,16 +236,16 @@ do {								\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	sw %z3, %1\n"				\
+		"	sw %z1, %3\n"				\
 		"2:\n"						\
-		"	sw %z4, %2\n"				\
+		"	sw %z2, %4\n"				\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err),					\
-			"=m" (__ptr[__LSW]),			\
-			"=m" (__ptr[__MSW])			\
-		: "rJ" (__x), "rJ" (__x >> 32));		\
+		: "+r" (err)					\
+		: "rJ" (__x), "rJ" (__x >> 32),			\
+			"m" (__ptr[__LSW]),			\
+			"m" (__ptr[__MSW]));			\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
