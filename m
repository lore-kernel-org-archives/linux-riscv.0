Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE89C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 01:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHxv48fqtrjTO1oVz9TUHzOvASQhYWhlxKLsUmJweS0=; b=IZhAwGATbUqP4/
	UAnEaPDlsMRGlTe0McGAavDLCH7Mk6bfkXY6JeLFyj+LlXi4bV6JItmS6HMJzsNDKmdJP8i7dIccR
	xqWqndt9rJHe+uxleW/g9xKNmDESbYLxHnA85p1dUYoOlqQTfXAQIjVsJAnX7RNZfxykteiB8AjCV
	npQ4G0n0v8KsgRjJm0TnoeE3uim2dpxf8HarKgfWiDX62/DA2R9kcEBHrATphOtVUerJd3hTCKSIO
	16Kjk978SrGjX8LANeFSZg9g1fQk+K8/j91LVuB4PCIXK+1sPns0YDGwNSIq76wkTzjhtEWiD7t7s
	npDBJjQt/n77IXprlN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouklf-006YaR-Oo; Tue, 15 Nov 2022 01:29:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oukld-006YZ2-DP
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 01:29:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d20so11740360plr.10
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9j9azrr5inQKGRnsCPduX09/ehA5bMl/3GVVoPZxxc=;
        b=MuozMWB88+EewPEyNda8KjeV+i3ykswg0ciKOoKOZKVds7D6FKlZ1PWiILdbrIfKH7
         m2WJm9MpxqEJAoLH8TJtxSh7qhUbiuV93o76f4Fki6iYkPp3X3etEV6UWInE5Tynd6y3
         QpgbLkWVJ198yRocUG9mJYy10E7Tr89DYG43pHnwJv7sROQN2iwaaePwLu4A1/F1Dpq+
         Q6XcYpwyXVsGFiqv34i6wc3WeuQoOQeTk3RkHGocK+500+xfgBlI5GD9JtUC+lOnBbas
         w/GLYCUq0XzCQwtag0i8nbBmPYyWTYakKYR3Lyu46Pawqv45zbFfnejsAiGEHecCiKLh
         mEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9j9azrr5inQKGRnsCPduX09/ehA5bMl/3GVVoPZxxc=;
        b=tcsCzyPKn5X0fRG6lVWsXfE/EdOMf+SjuzsydxrmBak7ft/IzA1R5smaynpRaYP88y
         6LvIbilIANz3wBCpQyzpudNLaEMVfc/99WuHGSLxR9m+ADvU20l2S/fC2xGocYdwd5SS
         NCQAtg9fajw1erWxabMLSgVaoNqCyU1alNxxk58CJS1gPYk7Ucog+g0m7e/uJ5aJaIBo
         XkE8ry2qkdXIR/EDdQ02AdsbQocCe2N8CsPebWu6zdm/DJ/4naJ91UayDO1+cx9eIRmx
         ELlKGHAdj5LgbVuhHmPW+0B6e3gfihipYNCR4L9axrpoZdcF5yG2+vkN5P2MVyXYLOqP
         MS1Q==
X-Gm-Message-State: ANoB5plzeuKnaYy09fEqR0E5Q+aBIxkfhq1IckNZ+yyxWkgdvigSAdTb
	x9Ddd47W0/ZIamYD46mofwfIzrUzPn77bQ==
X-Google-Smtp-Source: AA0mqf4pZXY8/SPXCsrlGjQCb/4iYLUpAyb1vYtv/I+ZXIRBp6wRswqnXyiHp/HCceOIdg1ojiCc2A==
X-Received: by 2002:a17:902:7283:b0:17f:def6:a483 with SMTP id d3-20020a170902728300b0017fdef6a483mr1805442pll.66.1668475771239;
        Mon, 14 Nov 2022 17:29:31 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e127-20020a621e85000000b0056bb06ce1cfsm7587231pfe.97.2022.11.14.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 17:29:30 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: debug@rivosinc.com
Cc: aou@eecs.berkeley.edu,
	jan.kiszka@siemens.com,
	kbingham@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH v2] scripts/gdb: add lx_current support for riscv
Date: Mon, 14 Nov 2022 17:29:17 -0800
Message-Id: <20221115012917.1781185-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111195938.1499148-2-debug@rivosinc.com>
References: <20221111195938.1499148-2-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_172937_478244_F36841A6 
X-CRM114-Status: GOOD (  13.89  )
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

csr_sscratch CSR holds current task_struct address when hart is in user space.
trap handler on entry spills csr_sscratch into "tp" (x2) register and zeroes out
csr_sscratch CSR. trap handler on exit reloads "tp" with expected user mode value
and place current task_struct address again in csr_scratch CSR.

This patch assumes "tp" is pointing to task_struct. If value in csr_scratch is numerically
greater than "tp" then it assumes csr_scratch is correct address of current task_struct.
This logic holds when
   - hart is in user space, "tp" will be less than csr_scratch.
   - hart is in kernel space but not in trap handler, "tp" will be more than csr_scratch.
   - hart is executing trap handler
           - "tp" is still pointing to user mode but csr_scratch contains ptr to task_struct.
             numerically higher.
           - "tp" is now pointing to task_struct but csr_scratch now contains either 0 or numerically
              smaller value.

Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
 scripts/gdb/linux/utils.py |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 15fc4626d236..fd818d7896ce 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -173,6 +173,21 @@ def get_current_task(cpu):
          else:
              raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                 "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+         current_tp = gdb.parse_and_eval("$tp")
+         scratch_reg = gdb.parse_and_eval("$sscratch")
+
+         # by default tp points to current task
+         current_task = current_tp.cast(task_ptr_type)
+         
+         # scratch register is set 0 in trap handler after entering kernel.
+         # When hart is in user mode, scratch register is pointing to task_struct.
+         # So when scratch register holds higher value (negative address as ulong is bigger value) than tp,
+         # then use scratch register
+         if (scratch_reg.cast(utils.get_ulong_type()) >  current_tp.cast(utils.get_ulong_type())):
+             current_task = scratch_reg.cast(task_ptr_type)
+             
+         return current_task.dereference()
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index 1553f68716cc..ddaf3089170d 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -35,12 +35,17 @@ class CachedType:
 
 
 long_type = CachedType("long")
+ulong_type = CachedType("ulong")
 atomic_long_type = CachedType("atomic_long_t")
 
 def get_long_type():
     global long_type
     return long_type.get_type()
 
+def get_ulong_type():
+    global ulong_type
+    return ulong_type.get_type()
+
 def offset_of(typeobj, field):
     element = gdb.Value(0).cast(typeobj)
     return int(str(element[field].address).split()[0], 16)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
