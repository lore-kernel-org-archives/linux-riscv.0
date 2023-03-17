Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721C7C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr6x26OTrEap8vNG0D8sKWUDN83KecXm+X4b5z/5kfM=; b=vuhQDpX+B0GgMJ
	c9CxkQC0ZY+EPLnrWx8+zjCCt4VlPBm2XAkmMQ4QIo3La0ET9OMjXIu3Z5+EsFeDVVw5O4gQuthyl
	8/K+Fw2w8J6NodiUkMqf2azaNaSSvB3TfOjDGrjgZ32ENp/O8Ug8Ah10SQ6SdoAOsESkaPY8aah7J
	oocUDtZmQUPLgT0jgpkRmug4l5oaQoXP8Sz3MhcHbd2qszF2mJ6gJ3/61G7nXCJjOc1vpeyPg2+Dl
	pIG+w5wV1+CfqsJ3FLwz0vWP0OByGEj0EbjaByLUQ27vPAPBeS5mCZ8MpSVFxMhSVtivLEDbGwE4w
	rWuKOtDglaNEk+Gtbj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OJ-00259J-2E;
	Fri, 17 Mar 2023 11:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OJ-00258Q-1A
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Mar 2023 11:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=; b=WPhCkmS6Lqtwo9Hv+WLbBJMFqc
	3JHbYmFzbVw+i+Z2dxeaRwg2Fvy7fUVUgkqU0Z0K1vmcepBTQ4ZkrX9YKUun9r8e5txod6/kaAM3X
	PpkcX5rJYH+UcluV4Si9Ze4rSCASru77jSIje3gkmZEefWn8NlS17qX2MQiDZlU82mec2ZJxifGkG
	X1dKlZFGFQjZs3eX98WLahMvkkvpsn6xl/kOap7RLjmsJKNPo6PWiKov/5n2kmOxdc6O6rU+IOqlH
	nbQ+/ZEyH6ZGjPzMn26dX9HJ3spqLfUPPwJVWog+PJzqh1EXkjLQicFt4doKQhgokK2SUXUgvQuKz
	G7ow/7Iw==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OD-002lnJ-39
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so4869663pjt.5
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053010;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=S6uqy4a2UaKCJDQlWCmNiV806NKcOgDvAFNjC0J6sGpJvb5eMR0lQWFc5Sxk61vlfF
         Q8K9RbAQxn1VCIJZx/2D5k1YxGs50wH37bG9Q5n3StxAFUMXByfJEy8t43QnrYx5uHZm
         qZeeAPqAoBlve7pYNRFHbuDeEzuXdow2og1FsODANncOGGxDuRZJU65nMLfKDVO8kdRN
         KgJPrbms9IgosCP7KAWsCkNPyb3AKjGw3xLYHJwvdr8uGqqHt/hHkY2+GmewEqhgLIws
         nmrUGwdLdgpFpPQt2gYg1P1rN246gOb9TdSSBvoSTN7DlL71mUpEWiHfCt824cO+yspZ
         Nl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053010;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=La37wMS0jYtNQTSjAVY2XUzBb9thXff9OuALdjzsm61GUcCG0hqoRtMopDnI29cE00
         /iZfzuRohI4fwplDo+SpxkrVQJ8ooYdVmOWYxBVUQmfqphM0S2ddOFma6eLb6qt3s+iD
         RF+m0BR3HnEl7nXPSsg19SKlVCBMeeV4pYSPQI3heYAv0ysTGW2smyGTxVXxMeNhL364
         qBvi8pbtH7LVMljs09PSWz4A6N2qZibVn+to2eN1Uims5anR58Xrgv73zksSjBUI/VRr
         3wEC0Nw4jet+kll6KbCNDmcgs8I3v1c/bC5y5OKX6YNXXZ0RPZdlQq496OG+uAW1HRRI
         Wh1g==
X-Gm-Message-State: AO0yUKXxBGeaI1pecRRMCR/BNVnuMrntNb/Su1fiAyw+FrVtf4ktcSGj
	t+vFVl0cVqsgXafqm30xk3rNynUrSTTn/7x8v5sKj7ziQgfEvbEBpUa28JwBubn8oLZEZNye0uk
	3SQc+pywVAbqCvitHd52H9zBcg2htmlfy2mG4b7mDAYgmji+Dmjg8DZtBZ5mh8SSr+Qj/dNJjRA
	yUfawrdPs5ZALn
X-Google-Smtp-Source: AK7set/TlyooaQ9QmuPWasTPsj+TdRra8vnKawS/cA+NsLt85idE6Cz7j+TByTfh+4Zdo20H9baV8Q==
X-Received: by 2002:a17:90b:1e4e:b0:23d:1fc0:dd20 with SMTP id pi14-20020a17090b1e4e00b0023d1fc0dd20mr7679811pjb.17.1679053010062;
        Fri, 17 Mar 2023 04:36:50 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:49 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v15 06/19] riscv: Introduce Vector enable/disable helpers
Date: Fri, 17 Mar 2023 11:35:25 +0000
Message-Id: <20230317113538.10878-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_113654_316182_96229A9C 
X-CRM114-Status: UNSURE (   5.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 427a3b51df72..dfe5a321b2b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
