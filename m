Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC06C47079
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tAnqhBfPJNmBRDoDZIY+DgvfNwZ6Vl7zx7ynf02b9a4=; b=dGQrRFybFexo4V
	L+XpqQkunX2n5WAYREIInLDHXaUFTqlS+3yrIWBrDK2AK67Q/8bC1nXhV010qKsRDKXmnVNUrQMlz
	cye/77Jg79YB2V8815iavW1Ytqt6vHwoVwGC+MzDkP7g6i5EJWUYfcgEtinHu8dzC7fiI+j01aoXw
	kwN6lnrMf8m1KyTEW8YKsNCAmbwtujqFzcRZ8pWzwMu72EzLa9z1evDYHUaMSqhjLVniaBcj0kj5D
	DXM9tJFJDFuqxdmgyy0ywrapXHhhmpr6VZBVq598V0ZxKmwoEZDAA2+EMr+RMqWjOeYE/Elm3SXBM
	TApf+az8s9XJvY3Ofpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7km-00C1eK-18;
	Wed, 03 Jan 2024 20:22:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kc-00C1aj-24
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:22:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d4a2526a7eso21963255ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313323; x=1704918123; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTexI7tnAdoFFXRXkFNPAWJZ+GVqwcinKJy6ELjkn58=;
        b=bvcMpBmtHL8ACsZZM+0afrkjHbTFNbmRhNbKQMcF7UCHp3XBF9OZJ0qTLXS5ZSddEg
         55dlYP4EoJ2YUUfB1Mc7nBw7F86hFGXV7wul8eIY+q32krjeLVQ3cpWAS3SK/KkZrlSg
         cJoZs6xAITNFV8xBZc4WXs5fgWwsR981JsH6mc4cz8R6lXJHYPlWNJa46tXNMLKCx1oe
         j49bbBfbf6c1FHdMNAX3UGj2MljA00UPLr3vA+pIqIKwGQ/HcuMHt/zNe61Tv6F+NQy8
         ybz3flARrvE6W0JG9sFIxRgwAJE/fICpEYKaHl7VHGkwKHg30uBWUgxvUo9kv59k41LG
         DSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313323; x=1704918123;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTexI7tnAdoFFXRXkFNPAWJZ+GVqwcinKJy6ELjkn58=;
        b=uMTlq2IujGKHoNb2UkBcQLr1acBj0oSt5YQFm9rHFsAXYQiPxuBoriVVOWE32tlLEQ
         UmCgJoCR7eO/c2qM7ZQ9fuSI4DYK3MJ5kwXf1drs4bHfe5/bipmOpPuJ6USXXl0lzRwY
         WmZRM3N366f3lZLKAINAMwIDd9Yaop+QfeIkWhIN3ZBqf4YhGU7mVOZqV50nSE1Sz6cO
         B4hO7lsI34gY0+MyDaOoppFZp+HRqPAK3fkfME9y0OtmIPUteIJYBNSNVvJkH6aAXI/9
         HAfEACew172aJZsqPV/QF35UQf3XbL2hst8fnAHm0vHDRfybMKVOOlVBAWprwEuxW4+a
         Ihdg==
X-Gm-Message-State: AOJu0YzEeb6oiw1kj6P/43JHUEouYGW8s1W9ypmKxlMZWzkEztqbPEo5
	jrTI8j3WIPiirnYi6lV41fnxkuuD+d0K4g==
X-Google-Smtp-Source: AGHT+IHvVQb7kgSchdLziFcMtH5i/arCS5/o8D3svG2o4+X6JKJgSmfGvIHFxmPZdBP03J9lNRtvDA==
X-Received: by 2002:a17:903:60e:b0:1d0:6b95:9c06 with SMTP id kg14-20020a170903060e00b001d06b959c06mr6626370plb.16.1704313323274;
        Wed, 03 Jan 2024 12:22:03 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm24278739plh.12.2024.01.03.12.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:22:02 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/4] riscv: modules: Fix module loading error handling
Date: Wed, 03 Jan 2024 12:21:59 -0800
Message-Id: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOfBlWUC/32NWw7CIBBFt9LMtxgBX/TLfZimGWFsJ2nBgBJNw
 97FLsDPc5J77gKJIlOCtlkgUubEwVdQmwbsiH4gwa4yqJ3SUkkt5uBeE/VTQMd+6O/8Fhrt0e0
 Jz1IZqMNHpKrX6LWrPHJ6hvhZP7L82b+5LIUUDs3tZI1CR4dL5BwSe7u1YYaulPIF9AEPB7cAA
 AA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704313322; l=964;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=iejeji0PdwBP2+MrHzl9oqmctk2biWWiQKeoNT5CSgU=;
 b=TcZUkCn0ll7uTspedyQj8DLjja65+zSMipWNDJaXGKS2IENK0pUgIqga+UJONlE75uI9wo2jk
 L9swYz/1P/GBowbm5HPUKPtpZIJF4XWgVR4VscJWf27ccFdOCmISlGl
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122206_928091_6558CAF8 
X-CRM114-Status: UNSURE (   6.18  )
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

When modules are loaded while there is not ample allocatable memory,
there was previously not proper error handling. This series fixes a
use-after-free error and a different issue that caused a non graceful
exit after memory was not properly allocated.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Split changes across multiple patches
- Link to v1: https://lore.kernel.org/r/20231213-module_loading_fix-v1-1-da9b7c92ade5@rivosinc.com

---
Charlie Jenkins (4):
      riscv: Fix module loading free order
      riscv: Correctly free relocation hashtable on error
      riscv: Fix relocation_hashtable size
      riscv: Convert relocation iterator to do-while

 arch/riscv/kernel/module.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)
---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20231213-module_loading_fix-3ac6d4ea8129
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
