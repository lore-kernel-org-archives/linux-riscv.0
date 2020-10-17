Return-Path: <SRS0=ZqiR=DY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71302C433E7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 18:29:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8CB2073A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 18:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmJY1gug";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osrLlI5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8CB2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T3Vhj4HX0twGvdBEEkhPHu7VlHsL/gBDzZBYLtbIiMc=; b=mmJY1gugxMG1iuVzMp3uPxdgdV
	+LIFaJepcrhFwin1jx3yxSOHKLcA3vvlKdq3jAFUW/EcfG41dUWb1y9qcOJxtkRc7d8vV3/FuCilJ
	ndbvVEBdkhm+RrDPDz6i3IV9vZxuEXWeRfP2eRJ2BHlEVt8uSp6YkqkKmNY1NTo87WO6ma9Bvip5U
	DFKWZcdN3RUYShQYoKvO+E3MPiUIAstodzYwVqWaMisnwTDjdgcuxuykF7tyxeToIjcShsBo/JpDV
	Ch3NRcEebBqpt/hXmjojX9gwHjG0NDltx5/P4mWJvFiVDZ6AjyezQqiR61kA5y/P40VcmA4K0Q5sP
	e6GmqPxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTqx4-0003Q4-1o; Sat, 17 Oct 2020 18:29:10 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTqx1-0003PB-2e
 for linux-riscv@lists.infradead.org; Sat, 17 Oct 2020 18:29:07 +0000
Received: by mail-io1-xd41.google.com with SMTP id d20so8017062iop.10
 for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2020 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPK73qqTZ8bhrzLLptM5yHUD7zjEZlg71+uh4SKHXVs=;
 b=osrLlI5rxR8LLCheVZPP1PMgmnrNxxBrXmdipqLVOOUz75AC6OhJrW8s9c6YmsvQxB
 CAWv6DVK4ENHFZXg/l8OS4A4aSAf1ftllQZmv0VS6zn4EVlXgxWPFR1N+1qgIxGG5cOg
 4GE9eYkRq3Z0D9/2N5jj/m/DSzfsiAPOmi4Mo8lswKqhGQeyreLAHuWRwlpQK6PCpOEs
 CX/CGp1rEfFG4DE0wy0GatQaT8ziMZfoCz8yhbzQ+RHcDejN8QOWsnuSgzXSLYUmtZYn
 7tkfQ9nEu1E/9rbMcnHBJUilJZql+k0WzZwFRw3KBCWOkD959GlLj9ONn+pR4fAIO/OT
 5oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPK73qqTZ8bhrzLLptM5yHUD7zjEZlg71+uh4SKHXVs=;
 b=hcn0ELAE1Osg7Rb6rwuoQ0GkJ/52ZNDb0+9PVngIkY/L8tKYOA3MIc3cUum57VuMRB
 AlDhyYNKHkjeSPgnta2tu6wv6T0KRMGIoSX50IvT7CEXyeT5kO049Mdy86bZ9AkqAsEu
 uuU/nhXzPZruvrWi3EKTJmYLDQBsoF+RwGcIRFqirGl+RlNkReX+U+OYRe9wwMSpwEcS
 W0nOMlXZoSctMO22J1YKAs2MBwgTGsdVZne/1hYEQUb4WtNNdHsaQ12p2ucTBXOVZK+W
 L4BqAI2sE2aQ1klgdcBUJEe2dOY7fprypZO5/puxuBWaxBRAGW6KSoFTxQ4QdOE6tLd5
 kWFA==
X-Gm-Message-State: AOAM533kOaL/fsxjbK6sLJnslJyPC8SPN/0+ZVcoA7RzkdxZTU0puPwY
 G/Rs9QR0Aye5bLtFlShgcJaN17ZaujWKalaO
X-Google-Smtp-Source: ABdhPJyVsxzw8vH+NK9fUl0FRNYuVwDIIXaY+4PqtXtkVJn32PiFp5G+U8+LdpC9xPqUd4D3SFaCrA==
X-Received: by 2002:a05:6602:2c41:: with SMTP id
 x1mr6251233iov.58.1602959343574; 
 Sat, 17 Oct 2020 11:29:03 -0700 (PDT)
Received: from godwin.fios-router.home
 (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
 by smtp.gmail.com with ESMTPSA id e204sm5374395iof.16.2020.10.17.11.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 11:29:03 -0700 (PDT)
From: Sean Anderson <seanga2@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Set text_offset correctly for M-Mode
Date: Sat, 17 Oct 2020 14:28:48 -0400
Message-Id: <20201017182848.125139-1-seanga2@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_142907_217053_8AA075F7 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
should be calculated based on PAGE_OFFSET somehow? Even better would be to
deprecate text_offset and instead introduce something absolute.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
---

 arch/riscv/kernel/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0a4e81b8dc79..74679f338c65 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -27,12 +27,17 @@ ENTRY(_start)
 	/* reserved */
 	.word 0
 	.balign 8
+#ifdef CONFIG_RISCV_S_MODE
 #if __riscv_xlen == 64
 	/* Image load offset(2MB) from start of RAM */
 	.dword 0x200000
 #else
 	/* Image load offset(4MB) from start of RAM */
 	.dword 0x400000
+#endif
+#else
+	/* Image load offset (0MB) from start of RAM for M-mode */
+	.dword 0
 #endif
 	/* Effective size of kernel image */
 	.dword _end - _start
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
