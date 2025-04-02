Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C51C36014
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBZylPTp9DMAWtvbGIrW7VEJGYVX0Zesn1pKFcvquXg=; b=yQDcJMI5OpaV35
	NKm7HAiExfJz5ZUf/imqXSoYtWDEtmcYs+xz0TKoIRdKmDO2hHDef09L+jsp9TdF/XfU3iiAoUNgZ
	j5nMO9AmqCdFztPoi8lzg4tivyh7PH3O/EYhT1Odiumk4DL/oF3SG99rBV0MCSlVIaDFBwq1lyGBS
	wcP9B986/9N0jB3eiV1p4YsSvRxK53vt8kEMLD2kYkipTxOxktZ+79XopwDWrynScBhLE3yRM5FLG
	dF6X4OHuPzcA4ScFs3KBBhtV/e1u1nEnXix3ZlpG6Cu51iXfglOQO9OuS26mpTVwiQcV4Bsig0tzu
	v9G3tb48IU6WHsC4/A2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzqpe-00000005BHD-2bRa;
	Wed, 02 Apr 2025 05:40:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzqpb-00000005BGK-25gh
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 05:40:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2264aefc45dso3004535ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 22:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743572406; x=1744177206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjIjctB/QPRLEP77fXTzu/z4MrK21ruwAaJUXHFpcxc=;
        b=A+3qwTHqUqfGMGng9jnb3+Xk1Pbf7rN9OC3+iseD4ijdseIHCZP0uaTa/2y0lG2c+y
         jRn3USHFTxfj6eopPw14yAvYMsaJMEc7gMXWyY1OiN3QkRAz5xPWrZTtxuY6hVP1LJxl
         OvXa9FsxEOKGUBfEGiiFd/zhE4P6scPzeqI04nwILS+FjSZpsGHdCWe/GBF3T0WbqsSl
         WyfJPM4eGSKAQ25fgPQeXS3fTgX9G1665gFXb4IvN3OuwB7Dpijo0NDZvMa07kqlpC9y
         7QLIOynBFok0akoj1tNh/C/BajGftvO+jH5uXUdv+68TT0JaxF8QH44ESUZ7vVkfDr9H
         N26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743572406; x=1744177206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjIjctB/QPRLEP77fXTzu/z4MrK21ruwAaJUXHFpcxc=;
        b=XlCa2U+AyfJ8l0FCeyo/ZOu05N+m6mlF8XZUlyuS6k1wDspdquOVLc5v89Lf2dDovx
         kUWzFR81LD5MYNgczl9p032PxL+ORQik33toRB5UO2WHwXEQ3os4NavVo/35gnJ7rf02
         SkHZPa4AJacWnLUduLXQ4j0LsIyCUOcRc7p1Mn+YRqPXyZU9LplIgbfPhhB1dnnO1Kyh
         AhE8QsvX8KmvvpMT/FeqbfKCtpQT0u3wygyIIC1MOgoZTl5wt7vtPVtxpFeE88176mMH
         wiK3RiXxnVM+zWtvdmJ77E+TUE0G+HLiPhtSZP7uayRkk4iOj5CkILtCuLMPJ6K+hW8p
         6nbg==
X-Forwarded-Encrypted: i=1; AJvYcCUfbamEASVORG5C1H3zu9acoXkNmiaULWY9Yuboa9mF0nSisRCAjlf2cZZq80TG+40vRRT7aak7v01xyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy7jCO170edrOoQL+VrCZHmHiDHNCweERZX1R3jpp+4giieHod
	a/i4IWU/dCOXuZBixb+1LQLIzq+Ebl5DwYatFvZqdrw0yZaJLDyE
X-Gm-Gg: ASbGnctcfgU3cvxXPvYQntwwaZIV8rlkjsdaZDpXnKcAOb+mg+BEcIHy0KICSwP6mI4
	IB7/jO6z3e1FUYGHLr1Ec4wS9k2RYQ7JUR0QUolKxMWy8Eg5rPw+ZQzXTnqj7TlM+jPJYC+VcFq
	QEACXcEaWatgcCSLD3TFSX3vuIXL+9gb6+8rpj/CKJgg8QPF91fJkX0NIg+vCFbLxPNP2GVk3ES
	Gco0Bmu025BSAndueRYVFPdVQkaZQTMNxXcg0bGAdJ+FNTBvohFyqvv+LfJbjqjb5i1Qt8t0IBU
	Di7MNRooHxjk2ts8EoTTEEopEkbylG7Z7vkCGhmi+O0y3RXbbuBhl3U03F4=
X-Google-Smtp-Source: AGHT+IF733ON4a+1X5hN83MMBr+Z4NWm57ynS5+gyLX9JLj4Qs4kOy/p35AO1RfVjiLQ9PSoaLvsOw==
X-Received: by 2002:a17:902:e74e:b0:220:f59b:6e6 with SMTP id d9443c01a7336-2292f9494e1mr178545025ad.8.1743572406202;
        Tue, 01 Apr 2025 22:40:06 -0700 (PDT)
Received: from localhost.localdomain ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1b3fsm99060125ad.74.2025.04.01.22.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:40:05 -0700 (PDT)
From: wgpierce17@gmail.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	Will Pierce <wgpierce17@gmail.com>
Subject: [PATCH] riscv: Use kvmalloc_array on relocation_hashtable
Date: Tue,  1 Apr 2025 22:34:08 -0700
Message-ID: <20250402053408.14052-1-wgpierce17@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <d9714824-810c-4dd8-aff4-d1431235702b@gmail.com>
References: <d9714824-810c-4dd8-aff4-d1431235702b@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_224007_556491_0074D8F8 
X-CRM114-Status: GOOD (  10.85  )
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

From: Will Pierce <wgpierce17@gmail.com>

The number of relocations may be a huge value that is unallocatable
by kmalloc. Use kvmalloc instead so that it does not fail.

Signed-off-by: Will Pierce <wgpierce17@gmail.com>
---
 arch/riscv/kernel/module.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 47d0ebeec93c..bae3db50647c 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -648,7 +648,7 @@ process_accumulated_relocations(struct module *me,
 		kfree(bucket_iter);
 	}
 
-	kfree(*relocation_hashtable);
+	kvfree(*relocation_hashtable);
 }
 
 static int add_relocation_to_accumulate(struct module *me, int type,
@@ -752,7 +752,8 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 
 	hashtable_size <<= should_double_size;
 
-	*relocation_hashtable = kmalloc_array(hashtable_size,
+	/* Number of relocations may be large, so kvmalloc it */
+	*relocation_hashtable = kvmalloc_array(hashtable_size,
 					      sizeof(**relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
