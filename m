Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC4DEEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jJDKYWa+m3qnXZ97ezoI0ieR0z2tUAEtAz9yMc6qPo=; b=ZGRR0Sb5K2CAh7
	8/EsLDkPqA7Nf97NeUAKeH75nnf5EcY0XiFaGlUXWkub3Us3VHEEqktKZ33Feln/WYpwuK7bmq3mF
	BjR9OIyKHxS2ph/4vfEmwesiukRUdRc73L32HPDzuWRsGf4yLv/jPOSzJa0ouM+urpBbVROh+1erm
	RCNiDxCP1ECgjceG404RDPMa8h7sUJQ+IUVirPSuBpdCxyv4k0gwdbhcb3BPlzQUj78IsqVOTOgnl
	DxOdtpqPWXWBOCGh2BWNc7wC57o3GWYolIJfV3qVdUmfztKHeh0CLC38F4IpspAlHxF7gJkJ1tvBX
	Muefvt5UVfj/1+JZR3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot66-0000000ESyn-2daK;
	Thu, 12 Sep 2024 23:19:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5w-0000000ESoX-0z5P
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CbpKVNKRMfAtkqYXzA8w+8eVro8K48y9vmHyffj7Qao=; b=k7p2toRYhyO+ToIwHo0n1ha/Yl
	znhstVJnKTOQQSnAsHR9ma//ZniFU3qvImgyJvlhLAJchd0qHAf5VxwfI0fxlVfQi3GI1vDdxs89m
	NssYkyA2DTNR7nvKrYVBOqNfcECHUQ74suXH4BuhoTjWAvlzwyi5UX5r+oWi+SkoIQbEa4DQvpjnO
	shwrtwl4rLhCZ1krkLiAZRn0Y+2ITbm0hfpABKEFVYgOUQoOMDZuX0QdbkW16cIY+W1Bc7aNcMtV9
	bIeTSzrRdAu71JUGtnq6Y8+8hUld0KbaUroY4yA+LmlpuK87OLbS0VW3m7guDrJu/kJzCbHzNIumQ
	j2FxSGmQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5d-00000000YLB-3aC4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:19:21 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso1108839a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183144; x=1726787944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbpKVNKRMfAtkqYXzA8w+8eVro8K48y9vmHyffj7Qao=;
        b=P/8M1jp4UzPuYBK3fkjK3r+eSqbjDzwsxC/fOrJ5hgFXYjE8BTjqR2TD8VJPrg+Q+f
         yP2IfhUdUVl/t/KkRlns75dpl7EH653I/EO4Y9Pc8f6M3hBLTlT4hNAZnO8N1mnDAqzi
         XmB7m1sEkkOLf1bJfM32lqWLfclJjIwQAIEt/JW49cqnfU6ABv8EJMFOQ2iYgGIaCG+R
         dDFCvTTAlLy6tXWIbSgMivar9Rc/m/sJscO+fad5nZbLO+BnrrwD5Pv/9qmUI0SFxql8
         CQ/RuFscn/AHrbrD8ySfZ7x5follSSnHm6XohyDX8y1vapImtBgGVsoYmaoa1d0/SfWB
         jSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183144; x=1726787944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbpKVNKRMfAtkqYXzA8w+8eVro8K48y9vmHyffj7Qao=;
        b=uuFRbMx6vhkB9Ll0al/O6EOW3Fjg/g9aT2nSZn0pe87bo931h21DWSSUnFZTRAJQqO
         obasfvPpXqy4cg/JA8kFH7juimV157BJONmcsVDdBVP2Z76MqWGldhdXWZdruyBWi62J
         /n1puOEeJLB3yRaQ6BrLRerQE6maXLdxGxOembDPtUyYR0x6+wMLjkp18WQURxEcQVG3
         LUkB2j2VRFyCjEgKBq7yZj/lV4e9V3f2431FoLnG3AuwxPpbbgo+024mM3Hcqg9/7kjg
         3VEMqFi2IrBgomLavfXmyx5GMq4jSM6UgUM0aS5Nxqg7UKhul6CRQWrYyPzVw7Dzj2LD
         Mfsg==
X-Forwarded-Encrypted: i=1; AJvYcCVsCkmmXogx1w4tyS9ReAvL6b6iaUgRSBvR3oT1VShiiPQV6fqsj8mLZ0nns/m7FICDX+V1CZLszlfmSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAE5ly36u/Ik+abhAmvj0AHHfXCfPsmeGbcVSciRqlMAZqkR1f
	NHKzBrKeBT1so/kQk0sqL22MAaJoRjqThjlMBW84lzugNr4Dja7ZMxlXAWOEDIM=
X-Google-Smtp-Source: AGHT+IERJQSRxOQYUrcoeWqKKFDuWvirFZC93eScxDPtDLfWGyU08Qp8o+SGLVlkTYVlfOG74jZpnw==
X-Received: by 2002:a17:90b:1043:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2db9ff79ba2mr4907026a91.4.1726183144244;
        Thu, 12 Sep 2024 16:19:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:19:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 27/30] riscv: create a config for shadow stack and landing pad instr support
Date: Thu, 12 Sep 2024 16:16:46 -0700
Message-ID: <20240912231650.3740732-28-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001915_103977_74ECD3AC 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`
and `ARCH_HAS_USER_SHADOW_STACK` for riscv.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d1d629a3eb91..24bf08c905d2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -231,6 +231,25 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
