Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCC6C388F9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 20:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0065C24248
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 20:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KXGad4I7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4LZvuy9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0065C24248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5ZA8p8wHHbFnec9LY5JrREJwXcOXgzLL9XLcsdDSYs=; b=KXGad4I7xeK9SF3YWvhhedFm2d
	jML+n8AI1Cs/qX+eyXu+VEC7E+XeO5eFJZGuS28YhpkpRGQwkFO+6JLYmLPeGZDgDAjpAciTzDzrb
	1YEdzbWCTm42oqiSgPP7fBYomIM+/mwyc/+LQbPk/rDTyhn1rE/NBPmj4cHvd8ik9ofMkWMcEp+yb
	hW8jeSjU0oAzYcGCiUuq++jccBZnDKDZSrmjPN4evbLMcagrgjw9hXsdVBvwm7EKrgjshE+z6khWR
	OoGu9AxWyR8OL510hPPR6e1e7Ajs4i8trHRAHyRpWY3sGIuKRCc7vGAdbH6O3JvfQ9dzGVJ3HYOfB
	gfe8Ff3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVhEE-00043x-Nx; Thu, 22 Oct 2020 20:30:30 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVhEB-00040I-16
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 20:30:27 +0000
Received: by mail-qt1-x841.google.com with SMTP id c5so2337644qtw.3
 for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2020 13:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ay0uQrgM5ZKbL8wnb2Dgp5Y6j7Q/UMxEoo1Nuc2C2vg=;
 b=Z4LZvuy9KZk1rool5w2U21MGRTjN1l41lEIQT3427QxRo2H8Ga6Wg+0VkkqNE87jEm
 dF7Gb+Kys9V/2sVpW8dOSk1xFYagE/nfYQcnuVv8jbdkW3pGArdt6v2dS/lTgaDFN198
 lrTI66MQibGAWx/hukAVnVxBLUz9iWdyeCM7V6l/E3zXdWl0ilO3DCSnLSk93F5actVF
 VIHGSRjGQrs0eBrJaq+0B0PvKMTU5+AC7cxlQHiW6Gk0jyQEr5oPX2HWiXr6aK6sBE+r
 8XG78oLFMKgzhOgk4Nud0dFflslyjIKVJEGfomsANReLGkwjrrkYR2brQDLd49VTChF+
 Wd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ay0uQrgM5ZKbL8wnb2Dgp5Y6j7Q/UMxEoo1Nuc2C2vg=;
 b=QhbaF0AveBZFX5Z2iN9XMvrmExct8JrflLdSb5etYKHIsEWFSkhtuDYGPEh/00w4Wd
 sgbSUb1YdH/jlMDGpo86ygy1WlO2R4VvJQwH0Ieb/RKDZGu5lHM+2GDNnsj3/cTa1Rr6
 zaRw0/ko+yB8tV7xEDJEnTLRG3aNaHuUwtHudzM2LoTNNppGa+RXg+zu2kRurKLt8CnZ
 x9rSS0OneWVFi2IwiEuWE+xXkbIb4mPRKbA1sH+r27T2Y+49NXYs2dbeUhVeT3QkhSrH
 8EtbHDBfREj5pdLrQ3ehFkQuJH7onLA7yrjZlpT33rve49Hz+GTGNz80v2yzpyOTv5OS
 UjQw==
X-Gm-Message-State: AOAM531EP8rE6Gk6o9D7ZeZggkfa8iocdKAVyRhz8eq9fnAJol6iQuQu
 pYJRRElMLB1np2bItins7n7APE3B1ek94w==
X-Google-Smtp-Source: ABdhPJxkyZRXNSYbAMRxQacJsD6PAlLl3QF7Q54O2w7LWYMsq1cnUCV7RMRMFHRsJkYmUuP/D9xDeA==
X-Received: by 2002:ac8:6f0b:: with SMTP id g11mr3756393qtv.175.1603398623750; 
 Thu, 22 Oct 2020 13:30:23 -0700 (PDT)
Received: from godwin.fios-router.home
 (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
 by smtp.gmail.com with ESMTPSA id n205sm1811310qke.43.2020.10.22.13.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 13:30:23 -0700 (PDT)
From: Sean Anderson <seanga2@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: Set text_offset correctly for M-Mode
Date: Thu, 22 Oct 2020 16:30:12 -0400
Message-Id: <20201022203012.428607-1-seanga2@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_163027_104584_F00DA761 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
should be calculated based on PAGE_OFFSET somehow? Even better would be to
deprecate text_offset and instead introduce something absolute.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
---

Changes in v2:
- RISCV_S_MODE does not exist; use RISCV_M_MODE instead

 arch/riscv/kernel/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0a4e81b8dc79..5a0ae2eaf5e2 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -27,12 +27,17 @@ ENTRY(_start)
 	/* reserved */
 	.word 0
 	.balign 8
+#ifdef CONFIG_RISCV_M_MODE
+	/* Image load offset (0MB) from start of RAM for M-mode */
+	.dword 0
+#else
 #if __riscv_xlen == 64
 	/* Image load offset(2MB) from start of RAM */
 	.dword 0x200000
 #else
 	/* Image load offset(4MB) from start of RAM */
 	.dword 0x400000
 #endif
+#endif
 	/* Effective size of kernel image */
 	.dword _end - _start
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
