Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E444C2BB84
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD95620731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zdN2Fj6d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DaWHts7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD95620731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7vaB0PyVxanuH2nTqtwazqKT1+1MnZQAI6KMQ2qc64=; b=zdN2Fj6dkgBshHAGBReR0+n/Xg
	D6ziX01xhyFHbevuSuAU8nPNas2NItY0O8L++LA78tEQIc9JPtnH8T0sFKq8GNzZWXdNJpLD6eroo
	S1O54Mqu+v5KWjdOrRAXKJeiSvLwfQQSRgxxIJWKcjfhlgIxot5z6/lzBsFGtz73oaOHv2/gygfrj
	wPSvdKAjU4Jadggt82VFin5LUQwMGy+KT5V/ge8feF5xy74c6+8kJhNGZU/Xrl/J1FcQEm0XVJAv3
	z9IoqnXh/Vxhh1r+viijZDpxw/tdOjYts5TSYus7JfBxUUCoWBOmu4hceauvyqhoGJBqG5DdkQRRo
	tPJBhSig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhu-0000C0-Oy; Thu, 10 Sep 2020 08:13:26 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhd-0008R2-Jn
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:10 +0000
Received: by mail-pj1-x1042.google.com with SMTP id a9so2652599pjg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=d6gpDdMtT2tdp8xTHPaHC5JAlYMUQ3HEqBOe763/EsE=;
 b=DaWHts7ul2rTOkzR0fXiKsZlAxJcEryhI52h1vKi4+m0kudoCx3/Q/QNH5H71lJ/c+
 QpYqw9v9/g1q4MtgtVEYPtR1x213rMw/En9kNxknzYnUquuYfsrSQAaAeUx4JuQDWGi0
 Z4a+O/or/BOQwf4zD8fC8FNX0MFFTsNjMSL5ukXvCw3GNGSq4bn3jpNbKbL1TogeNIrK
 S4U1wMBttaOIwMQkQ+91X08YczsrQ+jJdojoMKu2bnSVc8ZSg2eDDGZ6/uxAhMC94oDp
 3sFzh/HL8mlVXPl9CmjOhir3+8Q3sTyntfV9EHVGgLlWgqokpCUbYxgsN+EVJ+FLGm8A
 MpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6gpDdMtT2tdp8xTHPaHC5JAlYMUQ3HEqBOe763/EsE=;
 b=HqmLLQZQnTm8D4Jgj4TZXs2zaCHEOHErs1hDwGFvTrFyd/hsoMBZ4RP22nIj1L5OUz
 N78vNMznfy5I4E4oN9zvLwg/acczGxYpFOENWbJ5iVYMERKqtlzulSMAZz172unv3Mkc
 UbV+djt+zKF8ZarM2x7EoqZ7jPvDelpj8GhJj0dPJoJ/CA4sB8hkrZNVSvlc5sXMccN9
 YiOOor614BspNGl+Mrn2bg02PEfhrYLRdFLT/xppL72+rVxB3lKKHs3tnlRkSG3fhxKG
 RbDhVmzi4GA+ywlEDgxjxvFYkmXS9KXpm/+OPGn3pj+izdgxyKya/m3cfecX4ySUGHbL
 nBmA==
X-Gm-Message-State: AOAM533y4Gg/LcnAfj37anxhe6vftUpuJz3FNpKq93H/UFzkVFzLdBdU
 I8nW4y//SydyuJO3icfNF7Um6Q==
X-Google-Smtp-Source: ABdhPJzLRumIn2jSR9F6g6Ma/7kIPbBNBxbQ/SHx0//ffvTub9IiJiyJ/rOfRzcYF0iYwTW/qPLq6Q==
X-Received: by 2002:a17:90a:5283:: with SMTP id
 w3mr4332541pjh.201.1599725587386; 
 Thu, 10 Sep 2020 01:13:07 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:06 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 15/21] riscv: Use CSR_STATUS to replace sstatus in
 vector.S
Date: Thu, 10 Sep 2020 16:12:10 +0800
Message-Id: <7a98a3a727b6fee760a6fe0beb4eb2f5f5e6f920.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041309_725400_69C93C61 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It should use the same logic here in both m-mode and s-mode.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/vector.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index 4c880b1c32aa..4f0c5a166e4e 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -32,7 +32,7 @@
 
 ENTRY(__vstate_save)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	csrr    x_vstart, CSR_VSTART
 	csrr    x_vtype, CSR_VTYPE
@@ -53,13 +53,13 @@ ENTRY(__vstate_save)
 	REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
 	REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_save)
 
 ENTRY(__vstate_restore)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	li      m_one, -1
 	vsetvli incr, m_one, e8, m8
@@ -79,6 +79,6 @@ ENTRY(__vstate_restore)
 	csrw    CSR_VSTART, x_vstart
 	csrw    CSR_VCSR, x_vcsr
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_restore)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
