Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C5CC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB84D20731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y5qd7EYT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QMmGQYeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB84D20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C/tkEYYGJGfPF6o7+qMZB3XURQgbNRfLZxJnH9qQg1g=; b=Y5qd7EYT1KaxGtEQPYLmRS4HU
	MmJ2ysfXKvGQwml8XNpmZ459FOnMrRZduGqbzozjFdzJKNI53SwidTFNLp5iVQxWCHVPMAOByoCbb
	L7jBIAcsGe5+HfUIaLNJgvmsTDj/0hywyUVRauuTZM+vNqzr/PJI6IQZyIYr64pcz2MZPLEjmBvgO
	lQosf3rUVaRDP9W5IPBcjPOF68vZFyZTdPNVG50CuUbMGyB7Y0IOaiZHpU7Bce5uVpy8SCwXgVhpB
	+FaYRjKm0WitK5Le0CKi5T8ufNFPPa6GKjaggN9V7IMLcD1lZ/LnPVxUXXTjOaf/UaE0JFHmiVpxN
	9lFcF2onw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhJ-0008DO-6u; Thu, 10 Sep 2020 08:12:49 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhH-0008C6-Cb
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id a8so542074plm.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBZg38YV3F0UBIikGh/iifz81s+4k+D3Kp7Tc68TLZI=;
 b=QMmGQYeC6WHteUVor0MkG/umERsoUyehK2V8+a5Xgv0HC+1W/5a/3SgTR1co9SZdzr
 b0TxGgynak/YrX59cQrA2aDjs+g1TnA4h28P1AoV4tqxL63aD4nfD9B3TmCMskjuaaL0
 ED7eIL2mKHpTHcOvzwn2ud/ORFKZDbShWyGUO1y4bKo2Ez1uY0bFyEpRziFilumZSLv/
 7ZuzbGVSFp6BPE8UmMIgcRfIUlyxsSeeN4XCD2hILXiWjD/pn+uUb/um1ehh4K1BPWcT
 mwT/t1FlGLgKRToL3dEkcJDNNNOGUvmkvROg7n5fOJK1NEEf+Ar/OI9LbaMmXQut80ou
 b+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBZg38YV3F0UBIikGh/iifz81s+4k+D3Kp7Tc68TLZI=;
 b=uNr+hSAGFlZxtQ8wPBOiROQO0HsCQ7jP7waSirfTKvsC4onXw8tcOMSgYxhAF1mLWe
 uKvaze5sQf6ysvdKrpUUx2JjPoFQBM6/oP8YEqc0VbFPvHc1tQ6A4pi6KuTTgf7UsVG1
 ZdeQJqboT4FNNR8805+NEFnP6Iw0ac0Ge8/i2W0iBvmdgO2mXzT5JxSG+W6QSfSGnliU
 48fb+f/AZPZzK/+4z+RVO061E+W4+cR8SY3sLAZbDddPbsw6VyYFaRy+/dcQaUHcrp8V
 QrOkLLp1aRtMbpVxV5a+crC/HCshAClD22LhclMnJ03HiRURmZmoOnYfPjKWdfXxivsX
 vb6g==
X-Gm-Message-State: AOAM533B+vKwBHU4qYrz8OJIq7UCxpLDgS79uzm7Ik6PeVUDqqY1oAXV
 yx8o9IZ0IGmU+3TSVAo0domD1w==
X-Google-Smtp-Source: ABdhPJx5AqEGmcn4ZmggG6tMGtXj1OMr4k67KXCra2/D96tG0n9Nv2iG9jor2KACZRPMEfu9BZEzBQ==
X-Received: by 2002:a17:90b:815:: with SMTP id
 bk21mr1154992pjb.57.1599725565272; 
 Thu, 10 Sep 2020 01:12:45 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:44 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 04/21] riscv: Add new csr defines related to vector
 extension
Date: Thu, 10 Sep 2020 16:11:59 +0800
Message-Id: <c75e35c53ad8eb24a3f21f17f383d1f0177138a8.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041247_454457_4531471D 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index cec462e198ce..0d4c89fb97b5 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,6 +24,12 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
@@ -31,9 +37,9 @@
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 /* SATP flags */
@@ -111,6 +117,12 @@
 #define CSR_PMPADDR0		0x3b0
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
