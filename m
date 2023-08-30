Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8736C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WdRqq+GQFwztOReBniOpgNjW9ONnuuhHx3nPnSHFF+U=; b=vnYwgeJNJat8m2
	1rsr9W9+NrTq/nzIz13O488awYuKXKK5eY2gmNyhUgkeoYT+uT33syhaLJTfQ/DVZnoKCC+7pjmjh
	WeuTGc9iqb6fbuwGEO0X7z6kIcRDsTuULR2VF98FJ6pMGIpmHWDRnfyFfCvaqwA6rqOS5VA/RuhSS
	Qv7WzDkS2TdWIR1mDqla1mtyafun7e2f3lQ6WMZyALbzlsdBLwkZwOgpbhm4EfBrmQiy6zX9H2rO9
	2YmTJT/K2x0+ZEz455wMtTQKvm0KS4i3E4M93SrXStYDlOzEsRCJaHChYp3HMx1uiz2XPdp/smLja
	SIs6kFriqqxB/7gn3P4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbS1J-00E9TJ-11;
	Wed, 30 Aug 2023 20:42:33 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbS1G-00E9Ss-1d
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:42:32 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-56963f2e48eso173407a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693428148; x=1694032948; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=JfSigGMAk3UQvSJJOmQmkNX7Fie0Ucly6xqOZTNVP1g=;
        b=VcdVlNfo+CNNuma6mgX5J2w39xA+XeFBSA8KNZinxNiHFwpqeDChiatHGim9oahyHe
         yLRRK0t1BJXhNRFy3jNQOdb1ZW0N8kcGFgUCALdgyeFnF/8L+z63UEvy8xha1YE7EoJi
         XQJp/kLi6WsCrxEOcDFm0e2PGG3+o3wlSqbdxZEAAOZxcs9mvv8Q8tOFAY//aMECJfKK
         qfReY2RX+I5am7PGfFHUW33FXnB3cXP5FrFUA8j+ty4qYIMZjaKl5AkeUTy2Prl6n0xg
         aWcsTcpCDCsz4MhzwTR7pLCcBvLdFRvGtavt5/nqUEWVWdi3i0HxF9fc4WuBbc336Kh1
         t03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693428148; x=1694032948;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfSigGMAk3UQvSJJOmQmkNX7Fie0Ucly6xqOZTNVP1g=;
        b=gwTOg8H1kbtNAhB4u4Zu4QwPJw1ykM3QuzNnrtj6QBM1sNDMY1SIhH4mqAomueMcz3
         a5GSVL3vhQzTbBLxUlXAHOzT9rlehZ2Fiw0zBFJZbrBhyijzfT2YlGj4QdgwQ0Ixj1ir
         S8h/3S4kE830j9uvdkrLEW3fhCqjOa/G8XJt2VJQLdUUhr5EvGmt0uRuG6vXbDmMD8mz
         +XIYl52EtsHQe3XPzREgSrInFrlkIJegQAUAfn3Lus7C80PjZaQcs8+15DQnPWor8bcb
         XoKX47facGlLCf+2csmlBaTcr02YpgHWee1zagfLEMAOqpR6+9U7V1kJwgCxAivZfaZo
         Z4dA==
X-Gm-Message-State: AOJu0YwkXb58vnl9TjTl+zxuzxxv6uTI78OinaPlxZt/ETwth4mOCqXy
	8ISujoTHyjntojKvUW/QzRL3USJmeGwXhTASngA=
X-Google-Smtp-Source: AGHT+IGVfy9lhX87/iMR3uD77EJhONieoeBWacyo7sxC+zk/7wNG6l+3KNgDFuqZu8JRRStdu0iOBQ==
X-Received: by 2002:a05:6a20:cf:b0:12f:bb22:ad3b with SMTP id 15-20020a056a2000cf00b0012fbb22ad3bmr2915142pzh.62.1693428147796;
        Wed, 30 Aug 2023 13:42:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b00686e00313easm10413723pfe.157.2023.08.30.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:42:27 -0700 (PDT)
Subject: [PATCH] RISC-V: Remove unused "size" in ptrace
Date: Wed, 30 Aug 2023 13:37:54 -0700
Message-ID: <20230830203754.24940-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
  kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_134230_785553_E5B83121 
X-CRM114-Status: GOOD (  11.32  )
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

Looks like this just got lost somewhere in the respins.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/
Fixes: dbe46b094026 ("RISC-V: Add ptrace support for vectors")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9a87e5d490b5..2afe460de16a 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -120,7 +120,7 @@ static int riscv_vr_set(struct task_struct *target,
 			unsigned int pos, unsigned int count,
 			const void *kbuf, const void __user *ubuf)
 {
-	int ret, size;
+	int ret;
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
