Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F70C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 06:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JKmtRWppVnwV9KPQcfdrK1TN1s1R8DyHGgegYwVAv2U=; b=lchuRHmNabC5hs
	/j5W3Ebv5FP1Vh9s459lx55bfqGRfiNFGdYK8qyyVe7Xm2VMpMT2EN63F6X7HUsGfmtyvEAa2AaC8
	9vCJdMMHI2YTOJ4gnAAogchSmMXOI4dF/VGoRI46tqMBUnsQ++jWUizKwpFOE+6kgZur/rcP4DcbR
	XouiB7g/r0dhGreHk/4vUZ2Sj5jcSIUjh9R2lhkblCCuzhJkPfXhJAOJtLdFjCHIWdvZloaI+VThT
	kUNkv/9iMKwkQGLQkP3ge5kdaWeVlPen3b0OcELRwezvjTDUQAC6oUl4JImXM1Z84JfsP7TJVvqDC
	r7smRWVt8iXOkMifwMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1perop-00ErLG-2B;
	Wed, 22 Mar 2023 06:19:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1perom-00ErKE-2j
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 06:19:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so13683011pjl.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 23:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679465967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jc51COu0/vb2WtPcXns+ijC7xX+URRIqs+FR67VjlYA=;
        b=qZtyFC84Al62Sso4KsjHcPRvpZkBY6BavXqrs+ZH4zNQ2woVOYXp2bMeKRP8mADppq
         lGoZECsOFIfmiDIScrAeY1PXzkOqQLjOWOklE4tyYZ/MH1hQXP5BFj2SDCFPsK21XkIE
         yaYI7ZYmrTBzrBuPr2Myy6bjpvoNN8Vl6/TdJ443fYwd+s+ObXMDKWFGZuVFwRLip+fU
         mCaqMLReN07NXdDGuR5DY95n9hrcZfZCB3rGZkViKwgtbJrGPsk+ILA4MAdR5NSbIVfa
         DcihQfMxzVCW3zTkVtXmPWbCvLpvHNAWzyBL89Hloas1Rav96hDLYGw9W0IZJ/Dpi5dm
         XXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679465967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc51COu0/vb2WtPcXns+ijC7xX+URRIqs+FR67VjlYA=;
        b=oLFYc7tW7y0D78YC/VCCyiU6Bt8Zj/1rpba0xki19QQ3n0yKUPyPGmNyF8M7IoiNzJ
         vHnwAQPXzwySt/LSG5cWV7UrMJTRPw6walBd24W3VivMOv3RJR4LIzCshAfwUaKvlTww
         RxtQFKEGA6NyN8UcMTbjxsSG4hUAvirrGmmFnmU7gupX/dJaKXvagFa8AJsIjoOvSyw+
         Tqxd7v54GeGJmfeAOkLJlKER6BU3Z+kinyvppNKFWDsR1f1PsOEJ/lOL31bNKfbl866E
         7eWeK8LDNcuCFLH9S6m1j1HlHRP0xBYDQFYHfmvLM2cqHyHGblQaV3h+Mm9q5M5G0zcN
         JROQ==
X-Gm-Message-State: AO0yUKWOakqQ2D1xfZwdt9N/8hfd+EN0U9zoL5yov3/NvPHofJl6sXk3
	J24GCsczLJv7xNpBthJM7vw=
X-Google-Smtp-Source: AK7set9aeuGYwThhMZ+VFuX1iBJaOqFLd8r6mEH8v8V8V1hkznxp2niK+mrhEwJycH4r/ihwVIrNZg==
X-Received: by 2002:a05:6a20:cc5f:b0:db:9a60:a52d with SMTP id hq31-20020a056a20cc5f00b000db9a60a52dmr29000pzb.41.1679465966916;
        Tue, 21 Mar 2023 23:19:26 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id j24-20020a62e918000000b006258dd63a3fsm9232369pfh.56.2023.03.21.23.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:19:26 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [RFC PATCH] riscv: export cpu/freq invariant to scheduler
Date: Wed, 22 Mar 2023 14:18:56 +0800
Message-Id: <20230322061856.2774840-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_231928_904146_6429E8A2 
X-CRM114-Status: GOOD (  10.00  )
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

RISC-V now manages CPU topology using arch_topology which provides
CPU capacity and frequency related interfaces to access the cpu/freq
invariant in possible heterogeneous or DVFS-enabled platforms.

Here adds topology.h file to export the arch_topology interfaces for
replacing the scheduler's constant-based cpu/freq invariant accounting.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/include/asm/topology.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 arch/riscv/include/asm/topology.h

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 000000000000..14bbd2472af6
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_RISCV_TOPOLOGY_H
+#define __ASM_RISCV_TOPOLOGY_H
+
+#include <linux/arch_topology.h>
+
+/* Replace task scheduler's default frequency-invariant accounting */
+#define arch_scale_freq_tick topology_scale_freq_tick
+#define arch_set_freq_scale topology_set_freq_scale
+#define arch_scale_freq_capacity topology_get_freq_scale
+#define arch_scale_freq_invariant topology_scale_freq_invariant
+
+/* Replace task scheduler's default cpu-invariant accounting */
+#define arch_scale_cpu_capacity topology_get_cpu_scale
+#define arch_update_cpu_topology topology_update_cpu_topology
+
+
+#include <asm-generic/topology.h>
+#endif /* __ASM_RISCV_TOPOLOGY_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
