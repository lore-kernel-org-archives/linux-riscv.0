Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16FEC25B67
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 04:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4hMns2xOAsQyLdpS8RnQl5kU6bKWe0iCGgVv6vlFrI=; b=jB2SpEmWcdnAEg
	xVZ1eg9GnuZoxTBccOeLJGvzYlDyqCGpOoNGwDCCBADMYWKSonrI9D7nQw6mF5AzUvJX6jR4OURJg
	vydp1Yw7O4J5+wi08LHtr+nuP/jPRjZUMpTqEAtXWpZrNs0gA1Pg8PmSuzKg3tiulT6Bx1xOCZDtb
	rFYdGakrsk8RdJe/BAWmotOmyOtANMEznINrAcTGs8ZRROPaqqp0tLXDSC9eAvuGwOwQkXrk5ByT/
	GG0i4j58dEuqNeBMfiz26b2LW68ut9Cqv0GfluJkeYspZES6e/gpfV7bALWrR4caGa2R7RumjeSXr
	+OZy36QaUWjwExITvc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwbP8-0000m7-24;
	Sat, 28 Oct 2023 04:58:34 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwbP5-0000ln-1L
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 04:58:33 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5845a94dae1so1338868eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 21:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698469110; x=1699073910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q790Td8gv55CpXw6jh1r5+WUtiBYMYeRT8D2CcfTbo=;
        b=wdEwzB9TUFm+B4DH5KRAsF4NmFYJrmnB94DF2rkZZ8a7uSqPJCreEs7wUWZ+04JykK
         p6lHWH6GzfzlyY7hSUV0qBF7kL+9xKcueBLWwVZicgKdUcxndfhwC679hVaUBMo8lnI4
         /ETGcc5xZIT9x2HYMYNn/6DFr9ewX3Zf3uASywWoyRgB2L5f/Md7RC9sSaoJIexy9egr
         waxc43RNVD5O1GYxIGgNn/iDTan2KQK2NxA6jtr6Nzz7H3YxwRtdvt6mJi9f1iACt0zw
         mxCDuwh/X5V2YgewCU0BtUalZPMKNhMp0ff8WjaHpZ1IVBRhOzAeqNBdh/NpA1UpomrL
         qZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698469110; x=1699073910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8q790Td8gv55CpXw6jh1r5+WUtiBYMYeRT8D2CcfTbo=;
        b=gpDaAkbxAuoVO7xbufslJ9GZrHdOqSMrpK5c6Xr12vmn8Ae0vEltnkMuh+CQkxz9kO
         bLG2uyp6gDOiwZ3nr70jcqIoTg6NP1MR4m74bZz9fDdGewehJwXw+xP/t0ItygH5qZJ2
         l+YIJ5c4n/Z3AXTgTdROLbSHOuDvGcZwgFUFiIZ2jBodHX1AdH51+tDKhlJhaLWZlEQZ
         wHxAccVEq1btoI9NTEh17HTn2Mal0wRx4Yc02s6UglEkDBz9qfmxfDPZ9dptSk6qlngf
         ujEQE6EaP4sjO8Ta/ik8fJ4iaHlndZXuEapkywB+LLwxXl+nQeW7TwnfmL4BXaNSxUCD
         Q3hw==
X-Gm-Message-State: AOJu0YwYGTR4PQ5ZkqzKjQpq2HXDmBZQFMjwPKB3fsQ7kIo214355YRN
	cTKFVeMFY0FVHy3WlVhYx4lxWw==
X-Google-Smtp-Source: AGHT+IGGDClxKSdOLWZbDJlUZVr8MpnEslR+RWKEakq84qXtJFW68KEQ5ZSFt7C+jjhQC2mgYYoflQ==
X-Received: by 2002:a05:6808:6d5:b0:3a7:5d6e:dcfb with SMTP id m21-20020a05680806d500b003a75d6edcfbmr2757787oih.8.1698469109750;
        Fri, 27 Oct 2023 21:58:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k16-20020a544710000000b003a8560a9d34sm567488oik.25.2023.10.27.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 21:58:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Hsieh-Tseng Shen <woodrow.shen@sifive.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Glenn Washburn <development@efficientek.com>,
	Jeff Xie <xiehuan09@gmail.com>
Subject: [PATCH v6] scripts/gdb: add lx_current support for riscv
Date: Fri, 27 Oct 2023 21:58:00 -0700
Message-ID: <20231028045813.685389-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_215831_675573_74743BA8 
X-CRM114-Status: GOOD (  16.53  )
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

csr_sscratch CSR holds current task_struct address when hart is in
user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
"tp" with expected user mode value and place current task_struct address
again in csr_sscratch CSR.

This patch assumes "tp" is pointing to task_struct. If value in
csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
is correct address of current task_struct. This logic holds when
   - hart is in user space, "tp" will be less than csr_sscratch.
   - hart is in kernel space but not in trap handler, "tp" will be more
     than csr_sscratch (csr_sscratch being equal to 0).
   - hart is executing trap handler
       - "tp" is still pointing to user mode but csr_sscratch contains
          ptr to task_struct. Thus numerically higher.
       - "tp" is  pointing to task_struct but csr_sscratch now contains
          either 0 or numerically smaller value (transiently holds
          user mode tp)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Tested-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>

---
Since patch has changed a little bit from v1 and I didn't include
changelog earlier, here it is.

v1 --> v2:
 - added logic to locate task_struct irrespective of priv
 - made locating task_struct agnostic to bitness(32 vs 64).
 - added caching of ulong type in scripts/gdb/linux/utils.py
 - added more descriptive commit message

v2 --> v3:
 - amended commit message and source line to fit column width

v3 --> v4:
 - amended commit message and remove whitespace in source
 - added Reviewed-by for reviewers

v4 --> v5:
 - changing the order of changelog and sign off/review tags in commit

v5 --> v6:
 - rebased on 6.6-rc5. dropped changes in utils.py as they're upstream
---
 scripts/gdb/linux/cpus.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 255dc18cb9da..cba589e5b57d 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -179,6 +179,21 @@ def get_current_task(cpu):
         else:
             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+        current_tp = gdb.parse_and_eval("$tp")
+        scratch_reg = gdb.parse_and_eval("$sscratch")
+
+        # by default tp points to current task
+        current_task = current_tp.cast(task_ptr_type)
+
+        # scratch register is set 0 in trap handler after entering kernel.
+        # When hart is in user mode, scratch register is pointing to task_struct.
+        # and tp is used by user mode. So when scratch register holds larger value
+        # (negative address as ulong is larger value) than tp, then use scratch register.
+        if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
+            current_task = scratch_reg.cast(task_ptr_type)
+
+        return current_task.dereference()
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
