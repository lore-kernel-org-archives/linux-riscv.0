Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79634C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryXD7mVBKIfcqytTfQfk9G/spvNCutjKxZkf2NwBGlY=; b=hsw11x4ZZrYHYg
	93pojwxJjT0jg8OY6tQQMpZToA/LYDXSmVce5j8TMkLXGOlGuJXGQisJyFFd0pB2mssFHbNYLzmWh
	t5lh4ntWTPGkyexBhS4N31mk0j5fCYBdUI+5DZZ07eJeSrMH49xQlmRAN7pRB7Sm9ih+9JoEIZCNm
	s50kR4sPBFdaRfOquNDZ+uPNXL0CNs40wqjHIXvs2aDYvA5a5qR92MuX1QYjEVRmD+dzs4wvHEieA
	2O2Thu/I7fIBuILo9elK8BNRl4chsUPTGzsb8SRdVd/xdSCyv67+iSQ0Fxy5cau2ATSGLl0PtEIgE
	obJuN4pM6wlkci8HJtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcQ-00F74M-2C;
	Thu, 04 Jan 2024 19:43:06 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcL-00F71S-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:43:03 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3606dd96868so407575ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704397377; x=1705002177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+J/P1s8879Vp+fzlyGqr2WWOHGZX3A10V1/imIkjd0=;
        b=H9sxYc7lteH03syRAEH8l3IM5rTRitTbt+vQeynshXMDl/8nos+0uxHPWow/BVz0nv
         rLIKWfFA3hWt/8L81Yev3K/kCbt8S53X7S0p68/HWEwkkXHpvOEdN9Xnxwx+ag/Tcbg+
         F8Pqp2WHGlmzonaFOUvebmui2B20Ztm5VTnXpNPJv6/JSr+CLy3p3PAX8jBCsIfEw+NO
         SzI/7he2UloTXfyA9eX3Ey3tZmvm89VkHJ0aRXvnmuVEi9Qsa3JVTEjq6qw31fZ4HjCg
         2Re8p7/8+ziPUA+Ks3KZU7tT9AX4MWl3gp69D0wcyLCEMkVP0HiM6xcdXbrNpPlbv3tz
         Ds/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704397377; x=1705002177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+J/P1s8879Vp+fzlyGqr2WWOHGZX3A10V1/imIkjd0=;
        b=p4Ef4g90Q2YYI1PpB/UGRkzwaXM8oRI3DHDJ88MznHWCjCRfdS8Ox2oquroeZ3ce+M
         guZGFtP+F32j21SYSlO6f1Sw326IT+Jzi2qktMfW4OY6fDks24iN3Ib3G2FQ8mn6XoDq
         ZQYIzcwH0lszNVPbk00ixY2rwZBFBBUJsDxMu/StgQzVAJljRtro+jdX4+Bvc3di0CTT
         qylGcA8ZlpUUv4jJPTcFJvV91GVwP5EAP7ba7OovCuiqDyD7/e8LfYY2v46tWsA1FyFg
         /l8uELqO/zH+sVQqIegmY7k2ffjOVFflRe4b5v50d+48IgeAzqKKRoj7xmQKajC9lOj0
         p5rw==
X-Gm-Message-State: AOJu0Yzo7u8awnXLHGIGygtOORD+jpmCXQLS4ZrWs5C7DEvi5sGvtsAx
	W8hIBJCRm9hdgFt9vYgIRWaONY5u4B6M2g==
X-Google-Smtp-Source: AGHT+IEcFdfob1Y4RZK+bTpddY/Z8yB4IPD/mUSajVsTBWGnio5958AQpFeVqy17OUHTBH8h9sJFng==
X-Received: by 2002:a05:6e02:b47:b0:35f:7d16:c92d with SMTP id f7-20020a056e020b4700b0035f7d16c92dmr934521ilu.44.1704397377439;
        Thu, 04 Jan 2024 11:42:57 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o10-20020a92daca000000b0035d0da89a0asm19606ilq.6.2024.01.04.11.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:42:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 04 Jan 2024 11:42:48 -0800
Subject: [PATCH v3 2/3] riscv: Correctly free relocation hashtable on error
MIME-Version: 1.0
Message-Id: <20240104-module_loading_fix-v3-2-a71f8de6ce0f@rivosinc.com>
References: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
In-Reply-To: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704397374; l=2207;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=9/Y3gMnmhvp1aRf3YmkeyxHlGtG/ubuu7urxufGjwTE=;
 b=TmjQ+RDNWS877CIosFdTqru/YPzJhO1qbK90hdnM1iOCj2EuiBYwgA4iemJAzXyFiwoJGXHyh
 u7ieRn45cHtBbE8/eoFg2iQZWB5Lxtlqnoa83kDXjLsS1OHcL+boFcN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_114301_224784_CCB04D4A 
X-CRM114-Status: GOOD (  12.19  )
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

When there is not enough allocatable memory for the relocation
hashtable, module loading should exit gracefully. Previously, this was
attempted to be accomplished by checking if an unsigned number is less
than zero which does not work. Instead have the caller check if the
hashtable was correctly allocated and add a comment explaining that
hashtable_bits that is 0 is valid.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 21c7a773a8ef..32743180e8ef 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -747,6 +747,10 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
+	/*
+	 * When hashtable_size == 1, hashtable_bits == 0.
+	 * This is valid because the hashing algorithm returns 0 in this case.
+	 */
 	unsigned int hashtable_bits = ilog2(hashtable_size);
 
 	/*
@@ -763,7 +767,7 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 					      sizeof(*relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
-		return -ENOMEM;
+		return 0;
 
 	__hash_init(*relocation_hashtable, hashtable_size);
 
@@ -789,8 +793,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	hashtable_bits = initialize_relocation_hashtable(num_relocations,
 							 &relocation_hashtable);
 
-	if (hashtable_bits < 0)
-		return hashtable_bits;
+	if (!relocation_hashtable)
+		return -ENOMEM;
 
 	INIT_LIST_HEAD(&used_buckets_list);
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
