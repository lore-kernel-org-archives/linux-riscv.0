Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EFCC4707B
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFpW4PHq+CvwQcL8l8m/x529BYHyEBdfn/NHHxDjswA=; b=KC1jlJEw3JrYzE
	gdaO89qG1LKDpvi3IKKNgvso+lD7KxEPqcERywaRYS5M2lG4hEcUYatb65L8Pf9y5FcHX75VfsFGG
	mOjQT183LLod+P+JvZZWszvXTMqIoFgpXmepVkp5WtFsDFmJG9BpsClA2UjLAfjQuzsRr4XDAOpwH
	oMKMeX2s//MJhkYMfwoBL3AJCDMs9mF6I91xEuBWaUTL5FSQW04AxfhEsVrtwhnbL7AANYhOfFJNY
	UC77juvORxsfMmNgR29W+1OhAx4KX55NR1GRFRVvFz/0H1R26r3O5B/w8ngir0iPVAakxTneiblAb
	a/YiL8mdnSdQyzEo70oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kk-00C1e1-2P;
	Wed, 03 Jan 2024 20:22:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kc-00C1aq-1m
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:22:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3e05abcaeso52770335ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313324; x=1704918124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLVjvsKzWbuu1Tn6vfa7DAnWzdMErwoBxrG3TwM6ilc=;
        b=eSHghiIoXf6p6nrw/kmoq6ruizHZDIRpUtBrKcEP4p32gqlKU5bM8FBtdTCHEUTEJX
         kUk7TIO1S1+HpsFf3o4kihQjToOrh7NNKuLemuPbPYaEw1kNk2Tv9x6peDaoaVr2tzdV
         xkE5eu1m9ovAXT51dWPO9IK6T4FW7II7U/xdtZ/U6PMT5dTwEIFxWEF7aKi2Q2sql0/b
         RrcDR5zXrO+orDobQKrn9C5rwxasiWVMOtg/7lVCWrYlp1neVMSq+D/o0Q2s+9Co41BP
         XnCaUdvl4PqoNAwq6yRkiECqKhGsAsjlBi435p/FFy/uD6VPt23tyPXegTHWLWw/aTZ5
         65tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313324; x=1704918124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLVjvsKzWbuu1Tn6vfa7DAnWzdMErwoBxrG3TwM6ilc=;
        b=ut77ZOJKmSJgRn5dFndOCifyDkjAqQKosDyye3NSwWmY8xzhYh8InSvD1k/XN8REPL
         Z1MkBiongX16JO9UDBaxmXjd/zefHfaGGpptq63BUfZMOi53+Y1vG6pBKcpvrP1CjqLp
         jH+wC1RpwtGHxh4mTn5b/FkL06wXek4DBDczZLN1VekoscH9B3XQN4Vj0h0nd6cVZ2Vf
         7CEA3XM4nUAUTJmVzyma2ainKfVl7cwWhRMcCQM2iV5SIUakxFqfrMf9fFU5y74tSHWD
         ZdF/kh/Qzlpd5wO4jj3T+PNZ0Xff3UkhQZ8zZA19BZHfT4O4BjAYA8yjZMkaMETVh7Tl
         Xv2g==
X-Gm-Message-State: AOJu0YyC2ndxgrJcwjw4+IDR/icyQrQU6vOhyWZVnEUOsQ2saEJZ++J2
	aomGWGWTmBbeBIfMTmufXFqzk1NyMcnCksQMqhtM9tnYn+I=
X-Google-Smtp-Source: AGHT+IHTSHatXOKK2rJLaTQuI7ebBUzqUQe4BzYMpC03oBwA/JUbZVZY+uhrsIRUZgibxJ4Y3J1btw==
X-Received: by 2002:a17:902:e544:b0:1d2:fa24:2266 with SMTP id n4-20020a170902e54400b001d2fa242266mr10957069plf.6.1704313324207;
        Wed, 03 Jan 2024 12:22:04 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm24278739plh.12.2024.01.03.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:22:03 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 03 Jan 2024 12:22:00 -0800
Subject: [PATCH v2 1/4] riscv: Fix module loading free order
MIME-Version: 1.0
Message-Id: <20240103-module_loading_fix-v2-1-292b160552c9@rivosinc.com>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
In-Reply-To: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704313322; l=1064;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ChQMN8HXWHXJl0z5+9ukmO+5sTC3VuwHdA0xAgdz31A=;
 b=eGXoLh3RaVKJ+iWJ01D8+xrpOG2nvatttc/x3QBl+mQVjpXaGPIZMjUPquFofeleKnCdAjlgc
 stOmeal7/ylCU+9I0MA0q1qU3cXe7vaOsm6yfJVVzZ1gEdWsFVIIwEn
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122206_927637_230A6DC1 
X-CRM114-Status: GOOD (  10.00  )
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

Reverse order of kfree calls to resolve use-after-free error.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index aac019ed63b1..21c7a773a8ef 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -723,8 +723,8 @@ static int add_relocation_to_accumulate(struct module *me, int type,
 
 			if (!bucket) {
 				kfree(entry);
-				kfree(rel_head);
 				kfree(rel_head->rel_entry);
+				kfree(rel_head);
 				return -ENOMEM;
 			}
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
