Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42FEC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bURZWHCKQiCNIKlZEyVy9RmQMXC2Tr/0gHbOHhB6sE=; b=ezZYhQ9kQl6CHd
	YM3gOzeNZ3Bf4b+15KbQMAdfZFbF/ftxwXsqYA6Rgjpk1T0FXyTafpJmbDATkTVUM/mgiWzlo+WvU
	5YGYCLeKAtF8+pWesLH408DgPB+HZnybKB5/8qOqWGRbHP1PbCtO1HoUSfPcZko7hVwQKGt7rkcH+
	NeTUK69YcdaXBBqq3dSr5M2HWCp+eLu42Thac1Yb2Al+vtkjHWpTz6eML+0DNjIx2ToqXevE36v4k
	4EMQSUMrhrJY84ub60KsRCTm2j1ayowVd1NWtCJ626STx2plix/zaxCFOpHKy3USHU3SFP2bi+t2x
	yJLj3ByzB+gsldi3kGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kq-00C1g8-0Y;
	Wed, 03 Jan 2024 20:22:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kg-00C1c3-1W
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:22:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3ed1ca402so83165055ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313327; x=1704918127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcPZp/8DlGxkljJ2IULxF796JgdWAzcJATDANUPFHbg=;
        b=fsOgKYeQ93BZsrlhAvFshdo2PGT5+9n1NB94bjNp47LmzzwV/khi3SdHDz0XSukvEj
         nsO9SKCHsStuJaL6ZNmyiubOb0zUDFUg5iqcGGpWLCbuJ7/VdS2RnPbKAfpr7NH+7wfD
         uXulTnRHif11PCia2PkMybky1KMpPC9EfduVhjnLlMGk+o0IEccTH80X2lnkcdzraudm
         6J8WIrUHvA4LFFS4LcracJR5YcHe/II/O4t2CzZHM2Jk9/ayOBf0dgbVBUCChj9K4iRj
         Z4CQUVrOPxop+ZJgG0b8tpUXmRj0q8Sb7yvIQ8qhvuZNZlI5d8IZYqjsUwXYbJ8r6yTs
         mHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313327; x=1704918127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcPZp/8DlGxkljJ2IULxF796JgdWAzcJATDANUPFHbg=;
        b=RqrdiMJtMjhTF8YZ99ozaw8XUFSr4Q9xNF+4e3ht+LKsND3fxCJfArfhagAjqVkGYL
         PAMKpLYT2E+06zuA7AZ3Cot3eVSBb1x+n2y9NjjCjG9S/h5yRTeugOI/SQsZBVF0QKiU
         DXBqlduSzeSQ1Wsm/JIxwaBZBVmzKVhOY9PL85uu2/rsbdKTZmILTXlj2pdodFblpUL4
         FBQXgsjcX4X5WwNRL3ks3a3BiSQwt252PKD55J7wG/ODsDF3KRREoyC70xL8aOElpN0G
         H7bFWqGaMlCX0QO+SyhS3T1lcaClddx96q2oSMHJ3N04qJQTnaFPXjjXq3jJqOIkMNKy
         Yeaw==
X-Gm-Message-State: AOJu0Yxm1pg2707JPAuo2vwNEbzs+kpNVHlfOZcHYayZDpAPcz025d6F
	OsbdPHnonGvnhqsDsVgfXRAGh6sgRls1qA==
X-Google-Smtp-Source: AGHT+IHcWutJo6xSTujomFEKk6dSK8nUjnWN4ho0sIQ5KDgWpHxK2VZNM4O1sbbudAJfyt88IVHcOA==
X-Received: by 2002:a17:903:98b:b0:1d4:d0e8:f9d2 with SMTP id mb11-20020a170903098b00b001d4d0e8f9d2mr1463670plb.93.1704313327127;
        Wed, 03 Jan 2024 12:22:07 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm24278739plh.12.2024.01.03.12.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:22:06 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 03 Jan 2024 12:22:03 -0800
Subject: [PATCH v2 4/4] riscv: Convert relocation iterator to do-while
MIME-Version: 1.0
Message-Id: <20240103-module_loading_fix-v2-4-292b160552c9@rivosinc.com>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
In-Reply-To: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704313322; l=2036;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/ulcCnMFIkQarQGjz3X7NHIbZYgPXF/TzHke91JiC70=;
 b=2fwTTwWMrRHS1yLamkUKZvd9RFwXcDTwRTA8f+jCiAzGbZeyRz8gSU1eE+TKXv6+1XNA9u1WE
 i2oJi82DcH9AhH3z6euJBaUPy3PMy9P/+ZV8YT9MxUbCORDtooywt6E
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122210_506980_A233F876 
X-CRM114-Status: GOOD (  11.07  )
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

Use a do-while loop to iterate through relocation entries to prevent
curr_type from being marked as uninitialized.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index ceb0adb38715..581e425686ab 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -633,15 +633,31 @@ process_accumulated_relocations(struct module *me,
 					  bucket_iter->bucket, node) {
 			buffer = 0;
 			location = rel_head_iter->location;
-			list_for_each_entry_safe(rel_entry_iter,
-						 rel_entry_iter_tmp,
-						 rel_head_iter->rel_entry,
-						 head) {
+			rel_entry_iter =
+				list_first_entry(rel_head_iter->rel_entry,
+						 typeof(*rel_entry_iter), head);
+			rel_entry_iter_tmp =
+				list_next_entry(rel_entry_iter, head);
+
+			/*
+			 * Iterate through all relocation entries that share
+			 * this location. This uses a do-while loop instead of
+			 * list_for_each_entry_safe since it is known that there
+			 * is at least one entry and curr_type needs to be the
+			 * value of the last entry when the loop exits.
+			 */
+			do {
 				curr_type = rel_entry_iter->type;
 				reloc_handlers[curr_type].reloc_handler(
 					me, &buffer, rel_entry_iter->value);
 				kfree(rel_entry_iter);
-			}
+
+				rel_entry_iter = rel_entry_iter_tmp;
+				rel_entry_iter_tmp = list_next_entry(rel_entry_iter_tmp, head);
+			} while (!list_entry_is_head(rel_entry_iter,
+						     rel_head_iter->rel_entry,
+						     head));
+
 			reloc_handlers[curr_type].accumulate_handler(
 				me, location, buffer);
 			kfree(rel_head_iter);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
