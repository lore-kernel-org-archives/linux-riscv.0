Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C838CC36002
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gUSezpNG+tv1bxmlSB8jSWXI6cM5+ITA0N549WY/jM=; b=Q8ROsgKxOsVglB
	tITCCy8Ra7bDY4OAS+t+jNpagrfgNAPRSBZPWPuTrl189Td0T/XSr3JhAI6fIj+jxxq1rQ45OK1kP
	REanc4gzziVJ2pJvihZQ6T/a3obB7AYjfw4sfZ9xQ3KE0U+y0xakZfUlDMuQ+RLtJbjWG2m1POOY5
	u9io812xWYDNzk3KM6f5c4ilWlusWCgZzmc1wLdw4j9mYu6IJGOADBgsymi/Cc/nYP+gOZBqKWbsF
	aWZfjWo6Dx0Or6fWZ5N5GGhw4eEXdtyh7DMb6NGGW8qVpyD8D5hK/XJ4Xtz3sNAIBQO/MLaecYHDQ
	RJxt279aRtOA4G47cvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPda-0000000DUa6-2m3z;
	Thu, 20 Mar 2025 23:49:22 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOco-0000000DPGk-3kXo
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:32 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7273f35b201so806331a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510670; x=1743115470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=attosZ56Vexqq1I/ZpOSUCQeLwJDvNv/9dqJ8lvxe77f1iXJqCS6wRE5WRvdUQ8qZP
         wXdrTdcG2k6gmtDXTTYjRdpGc6kx6CbwuMBNJwhk6w23lz7DYvis9vlWu43N96HqVF+Y
         dBVjGluppvOB/RJVuO4NLks9GtYvdkVzQpz1raJDJq++boFqJGoIW7V7hb0BT0KVUcaD
         fQvdkhPM2X1K/vD864xh8vHnn7g+jElYn4Ojkubgn++s4hnjZHaV4no9gQ/j5Nny7XEO
         m5ct9TMEFFanMz+OQe47YqJWt55dwIdkbfligvDeikpu/MWPl16EXdTYG4Oi3m82eOTy
         BtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510670; x=1743115470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=ZtapUZIvOASYYOGQpQnPTYZpXy04ZLkTmZxytft8mUuEvyps/RrZuKWU6+SpSp3wd8
         Y+Wv/Ao9ojqFsOCkezDVxXevjfJBEEZBp+xakdIzYCmGIE6Rsh0mszJ1F0mQPr/H/Llp
         NqFBY9/SFebZFrR3PSBn+hZia9cNg2oSwN2a29TrVS6YWXelj2F5Va/JYc/7rRGRB/Fe
         xbgG63+OiClnZ/rE3khC7bshXrZt/sNUssRVo0cnvsY4YQ0OWiIx7b6dE6caJ2SwWOh1
         Wcg6Sd4+9g1zCy2KEGWXwoNIDwjy87aX/AYzo8NuNUaf0Yi8Vnv0FE+20nowJFl37mTu
         +bwA==
X-Gm-Message-State: AOJu0Yw7qkci58brkJbfJr3LEtya/s3eubfu/+/zGpEjW+HH4of+xb6g
	7YXiBeHZK5LNNSWPeM7uNw+mfpHpRpSIkmPYqnvic4laLIGqGNzppJFax5ufvA==
X-Gm-Gg: ASbGnct8DQ5LiPkSC0awakfLouZ5nAmVHnU3M+Xshg1j7RqqQVlmH9fKnDbLK4tyN3Y
	9BAMzuxZ6RLH+0y5FmEwZ/u2OAa1l3aYZvTKqlGoxSPXd9eXfwuBO1Nf5JFJ2C+E20eEgeuSLo3
	Un+sASXcVyyEH2VCSEUTzL4UwP6I5rIemUfV3kpmusHY8fCNkLuI7MzvoWS6S1n3SKRkKt+0WdK
	BTqFi152IwS3LGpVYTdQQTOmiPD7AZlqFOWCQoKBd3XbzJRPH6q86CDXbU/cz5bdaC/015x2tgD
	hatCkbXvUPthIiLWIRhG0DwII+4SyJXHwF616uLlfufhQOvHqcQQYSWpM/sHTkJYBm8RwHx4UA=
	=
X-Google-Smtp-Source: AGHT+IFPgB4lmDSuUaCrMpZ/2qFcRUoJ3Y+avxEgpvQKbDo7r4YIRe2aaoiARhfstm7Tp4du8Zb0Lg==
X-Received: by 2002:a05:6808:1a12:b0:3fb:7ac1:512c with SMTP id 5614622812f47-3febf7481femr654995b6e.17.1742510669653;
        Thu, 20 Mar 2025 15:44:29 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:28 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v5 3/5] riscv: uaccess: use input constraints for ptr of __put_user()
Date: Thu, 20 Mar 2025 22:44:21 +0000
Message-Id: <20250320224423.1838493-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154430_934279_AD9ACA13 
X-CRM114-Status: GOOD (  10.13  )
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
index c9a461467bf4..da36057847f0 100644
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
