Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6050DC001DE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 01:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1tfDRDOahD5Uh6r69a/RrD3ui26RHahKM/d2a/c8rbI=; b=i1nb1kh4lhqQDr
	ks7HXN1yhHUfqOSxlrz98hqtBp+zJY2tnm4upME0gVNQKuZyHpS5VI1hmlzuO8YrEs4yXnhPigYXr
	FkLgduMjnGv0LcbwoRZKxP4olie0tA/WkE0srcTe01WQKjPf03C33DWm5JM+Zy2XYlgKn4f9GR9xx
	TzTqoLIZKIi2QkFXRiMhWe1fMQgZAywt5LEw9N6ZGu+SceyM9uSke2ToxDjapDm73MrphNBdMRxdf
	TLLS5BWQqUj7V/6EwKAyXJvfxoqcrZxsCFYGMhyZ7AaacA1FEooLigCxRQvB8yKwMdq4hRd/7dla5
	wnhgnjEK0ai57l91DiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN6U-006MUD-0Z;
	Thu, 03 Aug 2023 01:26:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN6R-006MSs-0w
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 01:26:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686ea67195dso309144b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 18:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691025970; x=1691630770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KnkEmzZYZtLV9bJcf/lKsKflsIaYK5O+EUs/jmBBVS8=;
        b=mW1d1iN57SrWe3nCbYedyyIjo5aVpEAFsdcvOI56OLPAO1wdvj8v71+OP/wjZcuJ+n
         nFtZYyqycgEH5gdLo7BKz2kb6v6/rM6bcQsLEo5JBupZ1kPGvS0pdKc5hN1p4IQSn0yb
         KPJc+3bTAi2pirNR+tZbOmjmq6abdFIWz7VmZpSAfQ45iS2LbsiDWAYM3OH4QeUFXYDi
         RqnAsx3J9XGQNOGuDzWCv7O8JK84QXDyoKdrcfUKDUiBdEzO0KKaefi7e41+DNe0Jd22
         SGpoWATjtNQru/ZttY9eJjGiluLbHvQz/kPR0hJcS/zvGs8r+8i5hzLMDVYDz2+AryGj
         BxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691025970; x=1691630770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnkEmzZYZtLV9bJcf/lKsKflsIaYK5O+EUs/jmBBVS8=;
        b=SwNmLrQwsl/10RRypIFtXB57Jr+B+OiHNYDTkWC6paiOAb/4fTeYZfHx2IncCEpmAP
         bpzHN2h1uVHTaqvjKisVRwg6I2DYj4ZKP/yWatkdjgMcu+Mm1LkSPpIbQCyYBKBZoLda
         hoDgSlDJh3yhFS9/zspHOcVuGhmsbEaP9+Nh4UYp3MydKInuty7YQHxal1k3K4+9w0TT
         YBbWZ6v3Vrdj2FxIz9XY5ISOJ20ukVKlXzR65nDNQH6sbXuaei5ZDo362V8kmjmsTfyR
         6jE/mxLz45kmb/Vj34gKEAHz2ENOk10AkTJX1tjuTL9tUKdEK/tEc1EL1vvenw1kpLsz
         YXZg==
X-Gm-Message-State: ABy/qLZj64QZpJqU9IOqF7M7np28Qdmt4L2sNAE+ELNWWU2WcLbg5wA1
	oIogBIMuEVK3ssVP4lUvTcq3jw==
X-Google-Smtp-Source: APBJJlEVv6aXJeOnSSSQQWns6Sl8BpWl9aS5x67fhg3fIVNKMvhNnd0rpPfLUYh52tUPu5B+lSL06A==
X-Received: by 2002:a05:6a20:4cf:b0:134:a478:6061 with SMTP id 15-20020a056a2004cf00b00134a4786061mr16915077pzd.26.1691025970144;
        Wed, 02 Aug 2023 18:26:10 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id z1-20020a170903018100b001b6a27dff99sm13025734plg.159.2023.08.02.18.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 18:26:09 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix CPU feature detection with SMP disabled
Date: Wed,  2 Aug 2023 18:26:06 -0700
Message-ID: <20230803012608.3540081-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_182611_381648_91380527 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

commit 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA
string parser") changed riscv_fill_hwcap() from iterating over CPU DT
nodes to iterating over logical CPU IDs. Since this function runs long
before cpu_dev_init() creates CPU devices, it hits the fallback path in
of_cpu_device_node_get(), which itself iterates over the DT nodes,
searching for a node with the requested CPU ID. (Incidentally, this
makes riscv_fill_hwcap() now take quadratic time.)

riscv_fill_hwcap() passes a logical CPU ID to of_cpu_device_node_get(),
which uses the arch_match_cpu_phys_id() hook to translate the logical ID
to a physical ID as found in the DT.

arch_match_cpu_phys_id() has a generic weak definition, and RISC-V
provides a strong definition using cpuid_to_hartid_map(). However, the
RISC-V specific implementation is located in arch/riscv/kernel/smp.c,
and that file is only compiled when SMP is enabled.

As a result, when SMP is disabled, the generic definition is used, and
riscv_isa gets initialized based on the ISA string of hart 0, not the
boot hart. On FU740, this means has_fpu() returns false, and userspace
crashes when trying to use floating-point instructions.

Fix this by moving arch_match_cpu_phys_id() to a file which is always
compiled.

Fixes: 70114560b285 ("RISC-V: Add RISC-V specific arch_match_cpu_phys_id")
Fixes: 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA string parser")
Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/cpu.c | 5 +++++
 arch/riscv/kernel/smp.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..35b854cf078e 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -17,6 +17,11 @@
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
+bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+	return phys_id == cpuid_to_hartid_map(cpu);
+}
+
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
  * isn't an enabled and valid RISC-V hart node.
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 85bbce0f758c..40420afbb1a0 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -61,11 +61,6 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
-bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
-{
-	return phys_id == cpuid_to_hartid_map(cpu);
-}
-
 static void ipi_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
