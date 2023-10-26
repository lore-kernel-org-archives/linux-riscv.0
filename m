Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C0C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 23:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4hMns2xOAsQyLdpS8RnQl5kU6bKWe0iCGgVv6vlFrI=; b=lz1y5Fm0k3A4hO
	ySYFTN5GF8IGHwGrTMDbj2aCNQBKH5E54qTWCBc1RLZSysz9TcBnB10Jx+YRg7UN+n81ZHS4we7t/
	M7quQL6S71om9MwxqehSuZsoAbUCJDz8nE+W2Iya0a8Ojqb1VTtysAkD4gOLJJ1C8+01iIa9DbeMH
	eFH+Vjdtp3SoNWDVFqDpK+z93hawrR1XKnYn0jCiVf1TS4lL0xlLK8HVneiIGgRjhdKiwQ8dkgnGc
	S5SmBq5I9w/WpP/P3vmps4o/C14s4t7z+1umm4zLKmXrEPy+cfBBQVSfC/BbQbAy7kj1vYEaOw56O
	BFAPbiMU33z9TUT+yGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9wo-00FKCw-0D;
	Thu, 26 Oct 2023 23:39:30 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9wj-00FKCB-2V
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 23:39:28 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b2ea7cca04so900020b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698363556; x=1698968356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q790Td8gv55CpXw6jh1r5+WUtiBYMYeRT8D2CcfTbo=;
        b=K3rWIVIjlq71Ft/u96ij3XxfgPaH+vP+y78VnXyQZKVzBpDTa34quAFH90RP+/Yt45
         /w3ZrRhYtfD+2pGEr2fOk9w6XFwN+3JFss0wUsi4g2oLRsbd7bnZxrkhKX0KtbxF2m2n
         WN1AqKfWkcjPgPzU+mFVi6D0yeHW0CSLfsIZBwN6HA7FanKNPfOjlLkZ7rwNBZbDCU3N
         hcGBHnlqnOaXRKFUZ1BredXuge7o8P2eIB3UCSO/pMcEYL2DqXJAD+AqWTZOYru70jh7
         R/fMOdUxwcVtBOn00y9+SGNUnNdt2DxINOtFWuQgcgED4Z6fch58jr2wHlDkm5CfiwcR
         xNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698363556; x=1698968356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8q790Td8gv55CpXw6jh1r5+WUtiBYMYeRT8D2CcfTbo=;
        b=d/7ANZW/Ijr8Wqoaqd952m/XdADJ1kbAKDtUyPKmW954yieAidW2ReVmL5yNJe8RJZ
         qjlrJ2lG3pt0CzV6AdCvA+RIYqp3ENnn/9aL9OVeW5eLOjj5eCYifo6af9eaB6G6ZxPQ
         ZQutlQqR5+D/a6k97Dnsn5RUawoW7sOkONUri1nWYEitWlH2eR2cW/7Lv9E2H6+tz40c
         t1zXWDvGl1gLTza2zS7OuJXQiHvct30In/5pruHo5NI+J2LJooTPrLeA93i6/uJr58Kv
         eObJZj9MlJ3F1K6+3HmRoOAysRW2U4Pu+OPreWMQDHHxtrsjkeS60lz2IGrOl91aR6uw
         AEaw==
X-Gm-Message-State: AOJu0YyKhzgnAQ7GHhiF+RGGBtI6hpzb5KvCQAQbEGuuwXTdWH4MB7K7
	7j3Y3iaROfILIn92HIVoK3x0mw==
X-Google-Smtp-Source: AGHT+IGspa/NwBVlm7egg/NUIf9wRnx9xFti1J1wWM2v39V48oPOgG67Ph4EfplexaEg3gbCWIy78A==
X-Received: by 2002:a05:6808:1594:b0:3a7:5557:16ba with SMTP id t20-20020a056808159400b003a7555716bamr935245oiw.27.1698363555922;
        Thu, 26 Oct 2023 16:39:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n9-20020a05680803a900b003ae51628725sm76809oie.13.2023.10.26.16.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 16:39:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: 
Cc: woodrow.shen@sifive.com,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Glenn Washburn <development@efficientek.com>,
	Jeff Xie <xiehuan09@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6] scripts/gdb: add lx_current support for riscv
Date: Thu, 26 Oct 2023 16:38:23 -0700
Message-ID: <20231026233837.612405-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_163926_033396_27A80C0A 
X-CRM114-Status: GOOD (  17.02  )
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
