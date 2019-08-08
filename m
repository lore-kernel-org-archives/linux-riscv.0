Return-Path: <SRS0=gQVT=WE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF79C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 16:25:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C3DB2184E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 16:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DLsqXZ4q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="htp++ycS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C3DB2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rkYBAayGEsEPx5OWEKME7YkXJGXIId7TMEGI2zSH1EE=; b=DLsqXZ4qcxWPyE
	cgFuZwEUuBZB/dvxZopCkEAKBQeEd4Uj30OuLUqMUJy1Q9TdFcm4jt7xo8uAm8+dHYKYkQ31Qd15d
	DehiJV/FKZAW6Qwhx8T3LSnzdfuBriHAYixLXjo3B3jrf/lcf8JxBTm/PGuIiwp0cQFqOI9IOxWF9
	1N6+zTqUpnsKCQF4o+nwDcQopdHEufXL+C8iIRBJWs56V4G4DQuKUAl9rO8L+bsb0Il2kEuTOhhKz
	tfGFXrTfPM3rvmaglNiOPFRlYgfpCupBFsUFdO24TXHm2ILi0ZbleHesRLTd9bquTHORQPaj5T3dm
	NYkYvJo6dEW8xbF0Jevw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvlEJ-0002qX-EF; Thu, 08 Aug 2019 16:25:31 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvlEG-0002pG-Iz
 for linux-riscv@lists.infradead.org; Thu, 08 Aug 2019 16:25:29 +0000
Received: by mail-ot1-x344.google.com with SMTP id s20so55427527otp.4
 for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2019 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=Sh9FQDMasmY5vtQdSiQoK5tO+xz0p3eGu1ZERt15qJc=;
 b=htp++ycSv4CkfO5k4hhbR1c5pz+jcLYDMM9onORrmnPqr2zXHtSMUdHfSpaejVGxm6
 1iUtb8fy+qUbYNbYlj4vc4ysrm12p8atovPDzumyNBfwmL6LWMFILpb55bYTZd4nUAvM
 kk7mR+F2CxE1MNxH6mciDwgla8tKM1V4azlME9VN88ToYJjE74MGZ60BAsb20aoL5zQM
 WDpNA4qBvSgWOn6/X1Y0n+vuEzqbDFi+onk59s1lf0DSiH2R1Qqerulz2Qi89a8ZFzYG
 Uw+qEJNsTPTaL9AXDJ+2PAwpnN2Lh89SLPog8RVL1ilqI9Ax2mmK1C3YSNRdtozOp+39
 A+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=Sh9FQDMasmY5vtQdSiQoK5tO+xz0p3eGu1ZERt15qJc=;
 b=rx1OSTzM1cGHeX+gUTzqTNnRaytcTQC89UixqkJv4FAq6c1jEQENxLqXC5Oy3F0Wvb
 giXmBWkheTLkH8SuH060+NTNC+UzZyYoG2V8jQtJ24NAid0mNrlmL9hS0x/IGXoWjpkQ
 LtvFt+xT6cNg5NNundM8pFypN7JY3sMVk+fuIp2hlpXA192D6x5TeYFpDLGf4H6WdRGT
 dPUtgSvbqIcvz6W3OiE2Js5bHWnCoyq2PTgQzD9iz0G6wuVG/RBbZ2ShsaF0ZbhaLg11
 m5WHHMuZLg55zCatUnGt8PyBuOlIHBgA2WuyLVaawlEraoR/Bk28I3shV1GX+5okSqyl
 fD+Q==
X-Gm-Message-State: APjAAAVwI1wtNXQRjAWlUAx5BFVjEqQGZVPmWOnacG9gETw6BPE8Cbjm
 h3deGMTFiwiA0RBA9XdNFT9w8MYfvrQ=
X-Google-Smtp-Source: APXvYqytWnigO89QXdNbJ/WyY0oBdo7zxtKLAlx2YBEnBuVEX31JdfD5sKmrXhp2sBu9PWy+U0ezPg==
X-Received: by 2002:a5d:9690:: with SMTP id m16mr15546380ion.180.1565281527716; 
 Thu, 08 Aug 2019 09:25:27 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 x1sm2315281ioa.85.2019.08.08.09.25.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 09:25:27 -0700 (PDT)
Date: Thu, 8 Aug 2019 09:25:26 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: fix flush_tlb_range() end address for flush_tlb_page()
Message-ID: <alpine.DEB.2.21.9999.1908080923320.31070@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_092528_647261_C91783BA 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: schwab@suse.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


The RISC-V kernel implementation of flush_tlb_page() when CONFIG_SMP
is set is wrong.  It passes zero to flush_tlb_range() as the final
address to flush, but it should be at least 'addr'.

Some other Linux architecture ports use the beginning address to
flush, plus PAGE_SIZE, as the final address to flush.  This might
flush slightly more than what's needed, but it seems unlikely that
being more clever would improve anything.  So let's just take that
implementation for now.

While here, convert the macro into a static inline function, primarily
to avoid unintentional multiple evaluations of 'addr'.

Reported-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/include/asm/tlbflush.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 687dd19735a7..b5e64dc19b9e 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -53,10 +53,16 @@ static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
 }
 
 #define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
-#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
+
 #define flush_tlb_range(vma, start, end) \
 	remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
-#define flush_tlb_mm(mm) \
+
+static inline void flush_tlb_page(struct vm_area_struct *vma,
+				  unsigned long addr) {
+	flush_tlb_range(vma, addr, addr + PAGE_SIZE);
+}
+
+#define flush_tlb_mm(mm)				\
 	remote_sfence_vma(mm_cpumask(mm), 0, -1)
 
 #endif /* CONFIG_SMP */
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
