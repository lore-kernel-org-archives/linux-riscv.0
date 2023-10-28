Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DECC3DA79
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4FUUJWMeQ50MhgT9WfVWFZlC3MyJ9tf2sNwhOkJThc=; b=OS8X/sC3ZAqCuu
	XSn6ZWXWFxr7Rl2BmL5fcBikoaGx7XnW5KeHKqV/ABCvxk0my6fBSRmkFLF9A4RLFy0SbmHRcaxud
	PCXAdsHPqdUDHwRz//+I5JnL5FOokaDpU6Q1ljDA3b0cU8xZMcjo4s9A8jsBkeX+Y8o9bQoEA4hZA
	eSYKaRDQ6C9c3j1jyT2CaAVxZfyYzH87GfQwRWJjPlyRFNHioC91TAXFhrFKwmyDD0nD0azJKwpoD
	fsk73VhTgX/UT73cvA9uKHMZovSqAiNg/wOAorwhdVylYqhn+IHLq2TYNDKmEnFJIkjj8vIyF6Kr/
	yvpoVOG6QWIJWx5Pb29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVF-000vbk-28;
	Sat, 28 Oct 2023 23:14:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV9-000vXC-0d
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c9b95943beso29440595ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534834; x=1699139634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=LWxVbkUIg8y4LRIwzqeIoUAxIoQIi5kPTMQAOYQzNNtkWDLItXKlPehjOpgBlBdahr
         Hm6cojJOjG51A5iuTqR74G9REIiNlHP8RMap47QcMVIp3f2bs2IH/OnePnlxLoKu74OM
         EzCD41UCfSh3hLxnREghTJ9XrUB+OqIhskf+xIvwU0ngRXq5ioDw+n1DCyJjL2L3aZis
         JOO5uX9MWfoejvppKnSq40O1TiX9xdp/WL9pF2dSrpwfn4RMHwf5tjsImWhvli657Tdz
         yXPDWff0y2dnREzZ3keVJXbR0YbQbs6JrM1sSrjZ2Jbzxmc+4LnliJCjTglakIC9rsoa
         s6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534834; x=1699139634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=D4GvIFwRDUE1qzk7JN2o6cFV2qYoH3TxSa6bBfFPe1dCNSKTKrqZNVKVOlj8sItpy1
         xdgeM8yBpCvegPOho3bwOA0FHFZ1CRoYQbk1hxiIW98CjMM/q6+VCpIK2KQ2Z2lvl9/V
         STBiAJvuH9aXTiH072ibmU7BVweaHyoTyLYbK3g2Lo0n0PzDqV4k5z9cOr4zQdkF1pw2
         wi7zhWMDAQBan5DA/iM4HKlbhZORa4yiMCER5Yi1rwuqL7aj7vC8qBHn65r1u3T9kGHR
         rYvDm88gggwwPW0uQ34PE+frzNH/ZPj2j7xJYJGDQXyDOGnp0skdYGlMmBRDLnXtXH8L
         pM4w==
X-Gm-Message-State: AOJu0YzSCS9FUCZQSTjSjstj4YoHaVYmXl9a+aqDxkv8rHcWRTNHpMhV
	B8fOB8Wb/nb4c2vL5iCUqo54nxdnBgafGp4qJj0=
X-Google-Smtp-Source: AGHT+IEXxDKHTizsqyBXjr5oqt/mWPSp5qFgTjueov73uPEcJh4MjB79gaQaqVj5Le1ZHH1qO9h3pA==
X-Received: by 2002:a17:902:c751:b0:1cc:29ef:df7d with SMTP id q17-20020a170902c75100b001cc29efdf7dmr3951181plq.65.1698534834011;
        Sat, 28 Oct 2023 16:13:54 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:53 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 09/11] riscv: mm: Make asid_bits a local variable
Date: Sat, 28 Oct 2023 16:12:07 -0700
Message-ID: <20231028231339.3116618-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161355_233208_B72BCAC1 
X-CRM114-Status: UNSURE (   8.62  )
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

This variable is only used inside asids_init().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index b5170ac1b742..43a8bc2d5af4 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,7 +20,6 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
@@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	unsigned long asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
