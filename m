Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F14C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Htl1kMJzZkM1yN8GBP+oz5TM9ydvCdAdR4LW95shH88=; b=qO54ko+3Lfl8SF
	YOkZnRXBsEWNMgiHg/V0eo4vRHWu7e42ZNuVMhJ/54W1T/h7E0JvaCXeTDlY88X6h3iwtq/TW+7tu
	Yw4KxINb2KhzskOwYgEwxxOX0olUUhT+gUVPWmMuHj3OJbCIrvCztxYZeF8OEiepxfp7NkbPKkjWO
	heqtuoECoETBO5FRDwd4Jq5dxvmGZjviSpHrYOyU+mgIFMbysKplD4s466EX71ZseJ9vaeuwmtazI
	mtWTGewaM3L95+ZpuZiHb4qEk+vTvO+F+OspP9ziXk3n9oxAyon9noKR/2x4E78uw17r97n1BHfOE
	5lQ/4jQWVFxniMl1O0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUm80-00BoEO-8z; Wed, 22 Feb 2023 10:13:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlRE-00BRXS-50
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:29:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id u10so8143851pjc.5
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFgk/M229EQhqqhZZFLKtBybO/8gTLURLdA1DMiN/Z4=;
        b=SKL0epEoRnNDpRxCuPp05LozjCazXtjQDMYJEDXu4wLP3uxCrXoGFjIqisjU22SYe7
         Q37rNJX/dP0bMhglb10pCszg4dDzqlYGcdIiLlG1fa0mZ1EAnB7OEaDRI8zl6KzvnEI5
         U1c/h9SoWEaePzNd+2p7taVz7VyDo1gKTPH1DPX/LDr+jgIuHzfJphu8lOY1jONMpene
         YCwtC6LqlerjDStuvGfY2jE3oAeimNKGl0YNNVRUJhPYNkwOPyV9ivfF10aDqbH87LAB
         mPC8tnsSbWHrDP7wC4FZLFgbti5gKetmFHuAKl7iNbAIvF0tYsm9tTvjghwdusHcPMnp
         NxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFgk/M229EQhqqhZZFLKtBybO/8gTLURLdA1DMiN/Z4=;
        b=Zxb/shO8lwfiZEK8ib/9FcPY0SIlvNnPbHMweRL1ubZ1XUdY6YgKKzoj1nbPHRN7AG
         gOtdFwnqjS640hHIpFl0IJZynVBrVFlxNO83FC9p+x8lv1fSiklJXPFlvV4KL6f9+Hc7
         fCij6Ha7BJBOjhmhVdLlPkR7Szojrpj/7+jNkKCSQTJEaZMHYxvkhWVLjU/NjSJ/5F1S
         1aQGW8xsiNB9swEU1eGRg6F7UBVz79QIwzDOw2GH2Aoe7gIq2jNXgUyWSR5sMihJy1PL
         OY7B14atSeB9GIb9IfXgGcgolvWDcx5kQILPHzMva2q3wih0TwyzblhTTofcEqwt7Ng0
         nf9w==
X-Gm-Message-State: AO0yUKX8Td2KhLP/PeNbeLO8afJs1uIUhIisbFz2UG+x7OF18U+Sy/Oc
	aSI8BlOg4PqS8tTSafGiXgM=
X-Google-Smtp-Source: AK7set+Zq9/rQ6pC3pgMRwgmOPnKp79DZJlyKSs0by9U3Xt5GgWFVInczrMk430lwA6Ils4yWD1VrA==
X-Received: by 2002:a17:902:cf4d:b0:19a:b302:5156 with SMTP id e13-20020a170902cf4d00b0019ab3025156mr5761702plg.24.1677058158472;
        Wed, 22 Feb 2023 01:29:18 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c1c400b0019a88c1cf63sm2735670plc.180.2023.02.22.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 01:29:18 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: jan.kiszka@siemens.com,
	kbingham@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] scripts/gdb: add lx_current support for riscv
Date: Wed, 22 Feb 2023 17:28:06 +0800
Message-Id: <20230222092806.1824615-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012924_242696_1E6C179F 
X-CRM114-Status: UNSURE (   9.48  )
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

RISC-V uses the tp register to save the current task_struct address
as its current() defines. So lx_current() of riscv just returns the
dereference of the address cast via task_ptr_type.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 scripts/gdb/linux/cpus.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 15fc4626d236..b382016552e5 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -173,6 +173,9 @@ def get_current_task(cpu):
          else:
              raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                 "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+         current_task_addr = gdb.parse_and_eval("$tp")
+         return current_task_addr.cast(task_ptr_type).dereference();
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
