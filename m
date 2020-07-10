Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194FFC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD9320663
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVksKX/u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YZxC21B9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD9320663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tf8+hb31p4NeM3JThD3awy7FmDBVtYnralZEKjxoC4Y=; b=pVksKX/uIMAYEwSWzbQFlz/CkZ
	XG+8t3MmkGltbvyH1sa2KfbBGoRTmb3iaALXOuEIdy87soWG+poxojEg/sIVX6AnAJ4fEXmKccXh/
	x+bZq68lDqQuqgAnR8gISi08qsJIU1LH/6M/+aigIiIfdSsC6EM5VeAuhkA6noEhUpLMVyvdD+VZh
	1xOmAuRED14wh7BbAt+ZzCQ9uPT4+6ODA3Bxx0N8LR2QOIqWjwa7Qx+MwLEpI1dOkdKSM0wO86iBe
	Rt9MnQBhhz1dlslQ+jaajCDC5Xtb6A9GUgEdr64ysInYudi0uSt7MeSNdmLfrm+QOGwL3/SDODQQR
	6e53qn0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtiyK-0005fu-B5; Fri, 10 Jul 2020 02:41:08 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtiyG-0005fR-8t
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 02:41:05 +0000
Received: by mail-pj1-x1043.google.com with SMTP id cm21so1973884pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 19:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=qxclHzryyhzab07bf9y9TNMBqyaZqoe7QxIh1mNSE7w=;
 b=YZxC21B9Jd4MSKdlaJZ/MqGzlSvOAenwS3aGWi482IIBGhsfzde/keV2UTUNFyDZ5x
 WPuIRQ5P6zIxu9/K1pt49XXoEMYbYo6pkDVRZuGFgw10rm2+4VQAY4jlFbSwm7OqJ6nR
 cmfvk2/aaUckCypdFhvpetscXW92cQjB4+K/e25an3KM5rY3Bh1rghPE6gr4WS1hi0Xu
 OKa6wr/DU5dd8pCZOIbzELadqQL7pVbFDUSy32EEpY7PTHUE6y+PmMYGExjBRqXPp8G9
 /A/1kleF6axuW5klv68UDKKHHxk9YUJcsjC56zL6MlT9yz80Bo4WkX171SYqAg29fsb1
 isvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qxclHzryyhzab07bf9y9TNMBqyaZqoe7QxIh1mNSE7w=;
 b=QYeAP7qF3R1zARsmEPw9uNAArKx1v/MlT9Xnw0fo4WOPKj7y35XL27Pgq7mX7Zu3Cw
 4j1nu3F38659K+KJQWgUXYuqJzX/wHq4qNMzzVlC/I2oi4wjnNdtGcJwZV7ZDERas0ke
 sw8PQX6jT4jaiSfbQwg+4D+BdNflcy4t1rL7cMCZlGWGBpReLDd4T6Kr1rTDTyx5SS8o
 9PbeXTa8VGAISkyVI/h0U+cYXoOjoluuL1REwUzfVDCi2W42BADuv6jCq9DZtfpXYMlp
 rpG7FT2DDbAu7xu4TO43PXgD9Y2vw16RcA7S+t3e3bkG1q1oR4XbFhnAvkW6Fg64fb1Q
 YWOg==
X-Gm-Message-State: AOAM5307VQVdLMRWroDRcxEuJLov1e97CIenaDqZUdmMbPDLZYDwO/Ot
 8ec7XI6qK9hdXwn8ueM+S5xZBQ==
X-Google-Smtp-Source: ABdhPJxi32dnAHb9G3qY2EnvWxNfWi1luH2TYWK4nkRgEurA8UhWCuQQEocCRFkUHvQ18LkZ/HtemQ==
X-Received: by 2002:a17:90a:c985:: with SMTP id
 w5mr3395909pjt.154.1594348860106; 
 Thu, 09 Jul 2020 19:41:00 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id g12sm4031871pfb.190.2020.07.09.19.40.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 19:40:59 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com
Subject: [PATCH] riscv: kasan: use local_tlb_flush_all() to avoid
 uninitialized __sbi_rfence
Date: Fri, 10 Jul 2020 10:40:54 +0800
Message-Id: <1594348854-25588-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_224104_594161_638BBE7F 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org,
 nickhu@andestech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It fails to boot the v5.8-rc4 kernel with CONFIG_KASAN because kasan_init
and kasan_early_init use uninitialized __sbi_rfence as executing the
tlb_flush_all(). Actually, at this moment, only the CPU which is
responsible for the system initialization enables the MMU. Other CPUs are
parking at the .Lsecondary_start. Hence the tlb_flush_all() is able to be
replaced by local_tlb_flush_all() to avoid using uninitialized
__sbi_rfence.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/mm/kasan_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 4a8b61806633..87b4ab3d3c77 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -44,7 +44,7 @@ asmlinkage void __init kasan_early_init(void)
 				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
 				__pgprot(_PAGE_TABLE)));
 
-	flush_tlb_all();
+	local_flush_tlb_all();
 }
 
 static void __init populate(void *start, void *end)
@@ -79,7 +79,7 @@ static void __init populate(void *start, void *end)
 			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
 				__pgprot(_PAGE_TABLE)));
 
-	flush_tlb_all();
+	local_flush_tlb_all();
 	memset(start, 0, end - start);
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
