Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD50C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 03:39:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE60223B21
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 03:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE60223B21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3/lDgNau0n49D+tc7LvyMJ2EksbQpr+bHDMVKYZucU=; b=exiLbsl3Yd8x7m3vE5/mqFehML
	tJMw6WVNl5YvD2It7vCCsdjxGDEQ6CSJIxe4+Np+m+1NLtrd031KhcX0Y4vJUYmfwtlwzaPlZVr9C
	siCvGYK6arwSm8g/vZfGnr4kXsDLcGp8bJJKXTwU+cxZt/LUVLnFyza2h9DQsPqI9gzpkvT5TWEth
	iX66u0+jqfrJhI+dE3UD/THBWNB0R27mnS7WkteH6HRnCDPKY++Dj51HgEtqSVoCaf8fba23Qwrsk
	sqwpro2XR6mjedqx4q97rG69yAef5xzzORl1arsz+qh4wh78gpJmx0Tvgx/IkCtEC8RUY3QZ7DwCb
	qj3DqJzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l39l6-0002JR-84; Sat, 23 Jan 2021 03:38:44 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l39l2-0002J7-3U
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 03:38:41 +0000
Received: by mail-pg1-x536.google.com with SMTP id i5so5174450pgo.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 19:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=rgE+B9Mrz90Zoy2CynzPCLRveYysdlsrC4gZsCIAkuM=;
 b=1tPPgjLYT4ZzQn5b/I2jMEKDvzLt8mGpKGecfT7x9A2WpilOduevn+l3oBiBquY/1L
 ihcAacWIxk5kPJXqiu0MvHCm34IbE2JQzUZbSfEBU/TpWu9g3L1tZEWpxMPzlSdi+/wL
 JkvV5KsdmaocZSKZl931LEzkMjuIDVn40aS21M1XH9ZQ7FbC5JWcFKMuOdK9znG6xgoU
 /Uzdx+DVsqpmarHy7Edg5Bagd9t8m1AsbNNoDULQ3fHbMyV3+QiyJy/Y4m0YeMIEcOfT
 s5YPFSCj3jxG/pzsc/J3YPtiHcAczsJyShEdmiJfcJHIIFA7JSS45TNfjR5+6eWqIFNc
 4DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=rgE+B9Mrz90Zoy2CynzPCLRveYysdlsrC4gZsCIAkuM=;
 b=ZgzcnWPskg8sZir+aevYEkTic08ahA8krabynd0ir+hhPRDOaGqypr/FBO/YtSMD6a
 nnKf+Bp2XHO81XDvv6UPqea0WF0U/n/Xv3N1xpuv53xTSn8An2iTcvO2jnzpgsbVMGsE
 8HiwGoQp+wmvLjRPKVclyTEGAFozzr3sGVyG8n+JWv4ITnsDkB8qSVL0nO0fcqOIjLhE
 S7VNfGSOVHWTkoeYQ9IjyZu42GFttH3M/AZK9Fuh+xLx4aldOlSqxJzUdcPGIDQKjO2F
 w04NMxBksVtRbwIkH3631+f2Prfqh/dGj2OolsYxwFUusfqjH7Yp0w+jLRNZfMoxxhxo
 1ZFw==
X-Gm-Message-State: AOAM530rFyYX7Z/akEVC2lsHcPc1QycrzbtrUsxBh992pnTWaM/8zDRo
 eM9f2DtxoDVQkSXzirFjU5IYqw==
X-Google-Smtp-Source: ABdhPJwdsmSCYteHe2T3KocLJ0IwQOD8NOx/8uEh3HWRw4w4ash8wQScLA8ymNyhTaMaP8FamxMMtw==
X-Received: by 2002:a65:6484:: with SMTP id e4mr7846939pgv.401.1611373116212; 
 Fri, 22 Jan 2021 19:38:36 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 68sm10045654pfe.33.2021.01.22.19.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 19:38:35 -0800 (PST)
Subject: [PATCH] RISC-V: probes: Treat the instruction stream as host-endian
Date: Fri, 22 Jan 2021 19:34:29 -0800
Message-Id: <20210123033429.2072716-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_223840_273045_4C2AA184 
X-CRM114-Status: GOOD (  13.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, aou@eecs.berkeley.edu, kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 penberg@kernel.org, guoren@linux.alibaba.com,
 Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com, mingo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

Neither of these are actually correct: the instruction stream is defined
(for versions of the ISA manual newer than 2.2) as a stream of 16-bit
little-endian parcels, which is different than just being little-endian.
In theory we should represent this as a type, but we don't have any
concrete plans for the big endian stuff so it doesn't seem worth the
time -- we've got variants of this all over the place.

Instead I'm just dropping the unnecessary type conversion, which is a
NOP on LE systems but causes an sparse error as the types are all mixed
up.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/probes/decode-insn.c | 2 +-
 arch/riscv/kernel/probes/kprobes.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 0876c304ca77..0ed043acc882 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -16,7 +16,7 @@
 enum probe_insn __kprobes
 riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 {
-	probe_opcode_t insn = le32_to_cpu(*addr);
+	probe_opcode_t insn = *addr;
 
 	/*
 	 * Reject instructions list:
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e60893bd87db..a2ec18662fee 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -57,7 +57,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	/* copy instruction */
-	p->opcode = le32_to_cpu(*p->addr);
+	p->opcode = *p->addr;
 
 	/* decode instruction */
 	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
