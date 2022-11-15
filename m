Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtRiiQAq6jzvU8Dnz7XOrgt7a44Lp0LkfP4Vh/Z05To=; b=g9agbfwHYr/Xmi
	3mTxO+a1B1mAb04zo8e4Uyldlk/VECvA9V2qkG4rB9wqyrDfkle+LrHu51GT8UfDASWN3GYfQdmoR
	zzUEIlfMJjNEU5N5Ivv5wIyeWtEZqsr4V5LB7J0WRlLimS+oDJq7TKDCLsxCLmbPreA1bjeDr1fke
	teW/4JuG2DuLbVL/VEg6Qxqryiaf3UDAz7WqA26Ra6yO9B7pJ1nh0KxF6+ZRTC9/A0JvXRGEgDsGs
	zgAFS08eVvPVgmTFhdHCjWGaN6JAfffMxka+A2JQf7/7pnzaL5H7xaupV98YRnSzAIQVAaO2cJVi4
	NkA5TP11TvY0EauPPE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2jU-00EeO4-Hy; Tue, 15 Nov 2022 20:40:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2jJ-00EeBH-74
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:40:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso15005545pjc.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmLprh1sbZt2eCw30nE1Tak+7KqUeEPNgaa2olliB1I=;
        b=ReFv9H8JORI6bQggp7WipRxKojLCqrHn3A54Qkd2vXlzxEQHkGai71M1d9foIK3No8
         XvqDO4x1RgEt6qf5dd0xTKF1myzr6kqJfOKwfhw7DfHwl5GcLAhdes1yjV4QqoACv75f
         kJvrTRBwO5rLl6YS9vMpSlrjsEjk4fj3ClPEurbda2t0E9ZbAO1gCqHNMym+ApWKrrdP
         tTsejKyUG7B8adIYmCoUafwGUyr+Fj5qWC0UdgMHAdXsYFwhAPIprMciZu+NCFV2KwMU
         yfdpuF1yrF7MmNzI+KWiJGf3BWvRNZDHC2ghIcn5TMgPFdqEhEgOLcWBZbii0M875+3l
         F+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmLprh1sbZt2eCw30nE1Tak+7KqUeEPNgaa2olliB1I=;
        b=SIaKbtyTfNbeQfmPqqhebDgppEO6B2dKIFx7tqxNG+w2HBPfp1bNWrV9+oNkCvvN8x
         L11xv2ak8hajDsHfC+Cgmq85f2gsHLmGd6EoMnDSs04XniVTiWNctBzvWr4svs04NZ6x
         3QZ7G3jTB60ks7Ivh8SgdDjoZij3RL/eJvKNXvhIfVUg4AjHHeh2P/YZShdfIv5FptLz
         xmAOtWlSh+CNl4F8Mz6OyujkFjJqbWGNSXubfdtVGvqVAgGw/KsEJoYBfaRSIf8PVt1R
         WliK0f1/BLtL7G/3fpoQBlyqWKVVGUMJd22F9IMqDbuQM46M5/l9+Oo0nDFMLlE7sAJv
         UhQQ==
X-Gm-Message-State: ANoB5plojZylfgxePKwpcBg3LhhpjLTkWL3AYq+gydSVQYxBOxKNVAMr
	DWB9H8pT7HW+en2mGLJ7IJTSjg==
X-Google-Smtp-Source: AA0mqf46oscVlcpTunUVAvwzl+Wo5Dd2xMneGR/63DGXgiOcxbUbTw7knJPzQcsl8Fg35Wb44IFH5g==
X-Received: by 2002:a17:90a:4e4a:b0:211:55d8:4cdd with SMTP id t10-20020a17090a4e4a00b0021155d84cddmr132065pjl.133.1668544823609;
        Tue, 15 Nov 2022 12:40:23 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b005672daedc8fsm9199721pfq.81.2022.11.15.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:40:23 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: conor.dooley@microchip.com
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	jan.kiszka@siemens.com,
	kbingham@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH v4] scripts/gdb: add lx_current support for riscv
Date: Tue, 15 Nov 2022 12:40:03 -0800
Message-Id: <20221115204003.1866421-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y3OkY6myfea00BaK@wendy>
References: <Y3OkY6myfea00BaK@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_124025_494323_006E8F32 
X-CRM114-Status: GOOD (  16.57  )
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

Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py

Since patch has changed a little bit from v1 and I didn't include
changelog earlier, here it is.

---
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
---

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
 scripts/gdb/linux/utils.py |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 15fc4626d236..14c22f82449b 100644
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
+         # and tp is used by user mode. So when scratch register holds larger value
+         # (negative address as ulong is larger value) than tp, then use scratch register.
+         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
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
