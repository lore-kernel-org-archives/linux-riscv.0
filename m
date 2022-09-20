Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF6DC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 20:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+g9ttl6toWdrLiWhDTwMh21+ftM6P3RrHzf/ZMbOcw=; b=n/ZPPKtWgczsyS
	iMeZaGfMjYSAUgqsrvxxmriwV0GCnAaV8kgCw6Qgx8+b7sVQ8cRyItlKROXDiylTtrT1aGWiV8fyx
	y+RwQX5ZwMjSO6Yv7S0TRToc81ZxyhuDXmo1+Sul4Lh8Rl21gYMyGe2O3uCpfv5eMQd2tbpbANHvn
	Obkodpn5j2P/EWZ+9+ADuXCZcOwNRv0rQEM6Fq7sgrv9iYvlWTemVRnbkv0qIEXY+NHYY73/TEsZC
	RFQAy68c0POfBE6al9N6fwLKEBmWLuWQ0ALK0MNBkHgNpDfOl+picHEZtNXphISZxSHC6F3VbB08s
	NU8M5yzipmpQCbHn5HrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakAP-006RmH-6H; Tue, 20 Sep 2022 20:48:29 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakAL-006Rk6-UL
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 20:48:27 +0000
Received: by mail-pg1-x535.google.com with SMTP id v4so3873432pgi.10
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=10C+GPUr4aRjcYgainqZTqQoBXJq2YFRdAzh1F6y0Ag=;
        b=1APjBGmlnBGcjJT5ovPYb4CzaYvtd+8ufkUz3NxE1lpH4rZ3hI0wIem4igBOXN041d
         40B9JZG9xJOe7KLgcICG6T4SNospPGf6RM6Rp7Snvmx5tqHQOlHFB4Stt9HKbdJvZgyW
         hAwZohRoeN6efsvTBl/iPtJxUIYyUU1jnQmfRgpBHyqjCEx307j4O0+gQ6KungDd8Q2K
         sfJk9GGAYLveRPAzffoNBU4egm8Kxo4rBJFGQQy5zJL770mNF4xNxpDTyB82dviR4Xp9
         YVuSnrtBZkLeEkZvRDVym4tj7vkhiXmR0jglo9kanjVJ1q2+Q7iHPaRRlUhf80dOodEQ
         G21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=10C+GPUr4aRjcYgainqZTqQoBXJq2YFRdAzh1F6y0Ag=;
        b=QNmPVHMzArVSTDYulf3HeGwKAnh2B5dYVuATkJ9oxf0gicmnIJ4hFrK7MIemci2mMo
         BvTcc6zrmZkQjhraBwYu1TqVIsZo1KwzfKcTusaj0fBuwuVDIexBNiE2lZEhnoJ8UYF2
         eYw+e0Sjhyq+9KwnYKXVJHZGRWRuxQBy3UcjPwyvbdgzmhTDNpLZHjs510WZJ7Ed1AlX
         EN3Vb5tS4OVEVYZLvXeWS9ZXXHCQL+xhk+Ekzupe5IqjYzyc9kXgc3Mi10YWSeBBYQ/U
         QP2uNUE34z2KZGBX/AiFXanqPpQD6hQlXFcczeR/9pty8iILZL5uCQ/IbqCRye0+/7mp
         34KA==
X-Gm-Message-State: ACrzQf2QJLEoGV7+Vi6mQAcSsx8AMVyQnPtDg3Tlqhd/QFSurw0FGjGh
	Zo5OgtX/MKdDXqXfmmTGAlXz9dvM61Eb7SWmfS0=
X-Google-Smtp-Source: AMsMyM7f/BvydbXfQ9xm0oroLN5FdaKCFvDHnxvr6Fqss7i5U/yFqUepi29wpXhbOBVA7B0b1w4bog==
X-Received: by 2002:a63:4626:0:b0:43b:383d:d1e with SMTP id t38-20020a634626000000b0043b383d0d1emr5106465pga.619.1663706904757;
        Tue, 20 Sep 2022 13:48:24 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id u18-20020a170903125200b001754064ac31sm300128plh.280.2022.09.20.13.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 13:48:23 -0700 (PDT)
Subject: [PATCH] RISC-V: Print SSTC in canonical order
Date: Tue, 20 Sep 2022 13:45:18 -0700
Message-Id: <20220920204518.10988-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_134826_012457_2DE813F7 
X-CRM114-Status: GOOD (  11.41  )
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

This got out of order during a merge conflict, fix it by putting the
entries in the correct order.

Fixes: 7ab52f75a9cf ("RISC-V: Add Sstc extension support")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0be8a2403212..87455d12970f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -92,10 +92,10 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
-	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
