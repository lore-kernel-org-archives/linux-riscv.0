Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C9D1AD2D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSA3HsQC05pZc7K7whMbDLOBbhplD4CvVcEzLEQs5jo=; b=TkSTLzj+WpND3O
	7W9srGi0fv4ILQWM3c0FSvI4BpA+WWrY2lXpQTWCO5T/uEz5v2pSAWYD7ZYOs9FHGZL8kKKb+FrWi
	elJmMUBR0SuM7SFncSnZWU2xg6Rr5ZVGEKozFSfvA1ensmSlx9DwW4bw+3COPVu4aZqCipgzOGCZ7
	azXC+3qTKEXeKFsCQpqlR9zpoJhUMBlt52WrkkHpr1Rz+IldXp5tae30MNhoH808sjnQ8/gpvoE3K
	sIqBcrcXtm18is4lgK6/yOIf/jbALRUh7GiyJjtmaJVxO8KKdfSkibvDkzTd0KbVEihwvOmkmQ8aV
	fhUjAKwaUp3OFOAp1jZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zex-0000000B5Ll-3Eth;
	Wed, 16 Oct 2024 08:45:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zX8-0000000B3pO-48z1
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 08:37:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4314735bca2so12330415e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729067849; x=1729672649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jJdJXmZIFUypkGDe9/4mfd3DKdJwjPw93ZM7h9RdKg=;
        b=z+ulHPW7OmGKwgJWSkQp14uaeEJZih/jDlyDmEE6E3/7AqJN8obQCOn4b4SnO4Ox+y
         ExN/dEsPOiNlnsOifY/cvtjd4gqNrrhhAFr8D26owbSHXVIXRsD8UmxKcmEu8OP3yKZL
         cVUIeMwHBCG7F4+Vcv9mwzVRfE+cmIgrBdVXejMJBxvsp07LLTBkPTUlreL/WXxGMIrL
         X/oB1kEp3BOtISSTXddcDX+pjnaa2VvQ/H6zLBmXQH3qfbK1eAW1KW0T79o+EnVE/xct
         kcIcX21pKuSvWonaJCOG/UjOtzZv4HlITb/H7ewtuDsAG6M3ohFeOtBjW1tzummLm/aC
         Xshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067849; x=1729672649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jJdJXmZIFUypkGDe9/4mfd3DKdJwjPw93ZM7h9RdKg=;
        b=vcDioXoxtRyx52LP151BY2FVcbjobwEz+hG6lg4Hw5LpYUmOzVkNcNFThDzivBxN7T
         LYla8fSOFl3n8uzS0FBq8+SgXwVlSzjNaZN+tbnKDOgI3uYJgBkzccwKAoabdpG8s2UD
         Xsyx9qHBRNFkG+3vsDs+eDscxb49XYnghxqs+A7YtN5iaolmJRzFhbhaMKAu2Hnsn8O9
         6wMEIVjHIsBidVUPts7vW96njPE9hGlG7Wi+AHRnOnncsa6+Pac8KTPv7N1eMoZKPXnR
         pgA9N/SW76lsRjbaZoNwy/QGjc9nTCN04fcqXFjxfNzF4K+3CcSWbIrS0RJoEg+i2TNR
         Lxog==
X-Forwarded-Encrypted: i=1; AJvYcCVXJAIzRUGAo1uFBrOXvfL6zKkXm9u8N1eeIqu00p9nTJK0AQm+7wlmwo+lH86UN2OMXhD4V5YV+pjyrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq68lpSRe4+0z73skYsBwFUU95nB2UqgSbvrNgUT9vQ6tnwSgq
	ueBZfHaqFztlfTU548vlwupdm67mrA2ISSRhyXgSDgPG0SJhsAw73rb0T/VK9eY=
X-Google-Smtp-Source: AGHT+IFp3TkzbiKrwAorGoZodCtXXr7F5FcNaRIdRFI7+3ysQVBFKjSKd4I+hM6P7+iGyX8KPTwG+g==
X-Received: by 2002:a05:600c:1c98:b0:431:150e:4e8d with SMTP id 5b1f17b1804b1-4314a31da99mr27011475e9.21.1729067848919;
        Wed, 16 Oct 2024 01:37:28 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6b1e9esm42168205e9.37.2024.10.16.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:37:28 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] riscv: vdso: Prevent the compiler from inserting calls to memset()
Date: Wed, 16 Oct 2024 10:36:24 +0200
Message-Id: <20241016083625.136311-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016083625.136311-1-alexghiti@rivosinc.com>
References: <20241016083625.136311-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_013731_047971_7014D6CA 
X-CRM114-Status: UNSURE (   8.27  )
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

The compiler is smart enough to insert a call to memset() in
riscv_vdso_get_cpus(), which generates a dynamic relocation.

So prevent this by using -fno-builtin option.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 960feb1526ca..3f1c4b2d0b06 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -18,6 +18,7 @@ obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -fno-builtin
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
