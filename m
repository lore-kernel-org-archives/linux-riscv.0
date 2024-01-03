Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08959C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+fCSTlWE4PkNgfM/tJQNeERcgnd3UxH+TOOYgW2OuI=; b=WEUgdTtSyehUZc
	P7uvD4kYC5R9dQrih+uOussvACNwjGJL+JjH5Tmn0HsD4gbWNW5EX/vt6b49mCHp8Qg4AEIbIOxae
	nFUQ4E4FRs2OywQqN1duWItHerjfcbuK0wo/9VYVvvyAcVB1acb6jHqewfPSVQ6avfvtyw8w/+Spe
	lDQ/y+ZHsziXufX+5uOvAe0Xz+Op0LqwYWDhAsapKMBDJBodL5FLKVwWwRMgAGKgHXZM5INxRax1T
	tVkrwBpYP/6QM+RPLav4+JX0FlrYf+PUpVlJDS7InCoIXaeUpyk1xYIJn5mDpSNTP+qtYej2FScdM
	lDPTBLBPc54nSUDP9WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kp-00C1fp-1w;
	Wed, 03 Jan 2024 20:22:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7kh-00C1bZ-1J
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 20:22:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d427518d52so6148785ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 12:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313326; x=1704918126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwpW8R3xYRcFeijiUFHaM884VPc1V+tX+SXLWnbPyzE=;
        b=WVBP01mxmr5pmDOiVUrOB8g5isZWxooiPaLlAP3C9Zjs2GGqeU0McSB7vhqD7e52Rm
         qMUln8lOXoCT7fXVhnRwVrDCnJi03EKR6+aFu20eDCJRkDTuXxiS/OFcoNM1OhjbTv/e
         LsNs9lj+YDxw6NOlPl7kzFatbdwNf7tKHWqm+c2Pi9BoTmLUzKTvs2FuHpJ28JHFKlPg
         qBfmKQLyHOlQzsLcRJb+jJvZRPto+X15kEaHjyDFAcVDAR0SlxdPvz04nwV3jpQGIs7G
         Zgc9VC447rDaNZhzPPV4eMJGwyhVFlGWPihGxhUFwcGtjs2+fv8ilPBT0jfqARrXbHuj
         h4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313326; x=1704918126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwpW8R3xYRcFeijiUFHaM884VPc1V+tX+SXLWnbPyzE=;
        b=u65rtUEPww0BdhibZLpFbVAKtBo1HGY4kKKSxEmTJswJH08xISiLeoFj7+NlZhheEb
         pjx3n7+nuyFih8yho0hTcgLCDJp+6VkSc/VZ7dTFmJXR3r+G8VvlwGAlTEK/sp9NTQAV
         56VOc6yQZZ7fkfV9nK7eXUonsC/1iu/DW9/8IiVVMEa2t2qSpon351u9fQbD3Y5OUCZb
         JaWdzb1lL2T5t2TzaXM41oF0YcxtCflcYey3prDiLZG2R8+k7kZzrEHsfnIi/xjI7t7R
         g40ztknR4P2uiZnj5ycx8D6O0euN3Sh44fTDnXLIlQZChf5tah9QiHRENW13/ghEofov
         5EUg==
X-Gm-Message-State: AOJu0YwRPyqjS7830E4WEd7lGFvLT83uWYdqSnHu1GAvvRXJdAmiix0R
	EW+mVVmLi8rNiEJfufxGQwfdgJSYTfQg+QH7W/UHXWs/lns=
X-Google-Smtp-Source: AGHT+IEGKKEZm+PrXKULnqsmwhajVZq7IxX/xIJuHJ6YD4deMqXOED2G1ZGcg6ONgzGmqEbcfIT/jg==
X-Received: by 2002:a17:902:748c:b0:1d3:edd9:1f13 with SMTP id h12-20020a170902748c00b001d3edd91f13mr1728858pll.67.1704313326148;
        Wed, 03 Jan 2024 12:22:06 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm24278739plh.12.2024.01.03.12.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:22:05 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 03 Jan 2024 12:22:02 -0800
Subject: [PATCH v2 3/4] riscv: Fix relocation_hashtable size
MIME-Version: 1.0
Message-Id: <20240103-module_loading_fix-v2-3-292b160552c9@rivosinc.com>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
In-Reply-To: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704313322; l=1020;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=js9HmT4o7o8yl7lcSP3vcOE6sOgYhIQV9xZrhoMilzw=;
 b=SCb2uRI3tDQm0ffD82YNnM5V07YHtzrz/w1KT4oUaF3KND9VKC87pPJdypEGMgzkkPQF9fFHn
 3U5g8/i3hp1DCZbGzDsWDLQbXyWpmz3T+J+fT5KLQK7xulsUwWWSBLe
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_122211_440452_82C238C5 
X-CRM114-Status: GOOD (  10.36  )
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

A second dereference is needed to get the accurate size of the
relocation_hashtable.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 32743180e8ef..ceb0adb38715 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -764,7 +764,7 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 	hashtable_size <<= should_double_size;
 
 	*relocation_hashtable = kmalloc_array(hashtable_size,
-					      sizeof(*relocation_hashtable),
+					      sizeof(**relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
 		return 0;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
