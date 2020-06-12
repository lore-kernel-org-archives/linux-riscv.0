Return-Path: <SRS0=roKM=7Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0429C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2020 07:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F37F2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2020 07:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6/hLphM";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BdOZaJOG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F37F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hbkAgC+PquBUrK8WyR9UJ24ePGDUqr+apyFl5WJvPs=; b=I6/hLphM+ihzaX
	/mY/MGc05F17vUD4iGpUgD8aX1sNSW/TVDiBx/12pZLJWBIX6IGuWyc6Mv4+gyI7t+PZsxA8GZihM
	5xuL63xvA3sUHzNiEV98KHORaJ3ZHOQ6p0JuRJELT2bxMVy5C+Zl9y8BuUhtRnoHra9NwFrMHH9qt
	2cb6Zy/Mqvd3y0/LLP1t5uQZPs1imWLoyOiU3aAHNXr1Px3t2P7q9pVm0nWTwmBSbk/ZtoVe4m0z5
	2svyvtJTzJM0ePtq7g4Q23eK9F6ojdpctZnoe5O55wkdsHZ1Iv7jbuoEXv8DTesrACgD0Zn93FDvN
	g4zCdWVF5OWx69kzoTCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjdph-0005Lt-GQ; Fri, 12 Jun 2020 07:10:33 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjdpW-00059M-JK
 for linux-riscv@lists.infradead.org; Fri, 12 Jun 2020 07:10:25 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ne5so3283029pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 12 Jun 2020 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9hbkAgC+PquBUrK8WyR9UJ24ePGDUqr+apyFl5WJvPs=;
 b=BdOZaJOGUOxHwgLXTREzQQgP8IdkkhhphjMQdSk4LAZItT68fp4I7T5uLiQmW5eB83
 Y0/HdgMcCcyAXQSt9i1JrgNLyRbXymJB+E+El2K57HK08ChYQreNSfO3lm7AHEx4yx51
 6RYoVnY2m1QhDzqT5X+mKTGBYfPn7negLN43JapDLw2h9AHt+YB50s/W2d5+CujebY7T
 jSqFMNWEg+nJZkPVyMSL7prSubRAa6GzZ0o0OQgu2aj/VNCQmRJPHxeqlx9Xbhq8+jut
 E5O2Z+TELL7sIdOWkJw8rgl8cRDatcdBo96GiF+6hdkEzqvAc80AGxXLHZtr3b1jZNay
 QVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9hbkAgC+PquBUrK8WyR9UJ24ePGDUqr+apyFl5WJvPs=;
 b=Q+4EfPVy77X/QAqYYV2CQ4SFaAtkpeAG01xtmItI2kVRTj6PWKerb1gFoAPprrIlcr
 pt4vhxOzJFNeQ5SeIX6A4ZEan2ZhSzzNiM0ILSxIhThcivYuvZrqnan3Lxyjjev32TeR
 ikFKVWgC12cW2YdeYREnxHC3i/mIWNgL9rmPL5eEhis3TfJifL2XUjzum8QYKhA2wIGj
 9lFX72BbAZXVGkiT1BmmOSdhdUBAsq8UqrxPS2uP4PJjpcwkDgh+bXduWhzLW9SXJM4N
 6JJhpaVneFKg5UtcXoZ69eOkH6DVAFkbmNj7SSPpJ1vAluGzCmUnm8HUcPX+Cq5VB/Lm
 hnxQ==
X-Gm-Message-State: AOAM533w643CkhjgFY7q50+t/Oo/RYBUzl3qFIzrr2mISEe1GH+neBl/
 K/0a8yvCtq1wgk7WkgRCsi2DAQ==
X-Google-Smtp-Source: ABdhPJx1ZHDZwPoaF4NxRGDU4vmr387qwe9VI25z+habDuxWepIlSNSsC2mvx4ylZT2lUrL0Vd9VPw==
X-Received: by 2002:a17:90a:e983:: with SMTP id
 v3mr11563272pjy.71.1591945821531; 
 Fri, 12 Jun 2020 00:10:21 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d2sm4336919pgp.56.2020.06.12.00.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 00:10:20 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, oleg@redhat.com, guoren@linux.alibaba.com,
 vincent.chen@sifive.com, paul.walmsley@sifive.com,
 palmerdabbelt@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] riscv: Add new csr defines related to vector extension
Date: Fri, 12 Jun 2020 15:09:54 +0800
Message-Id: <cdab13bac12143f171bc7cc98b1b511f3a536ccb.1591344965.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1591344965.git.greentime.hu@sifive.com>
References: <cover.1591344965.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_001022_736472_1487022E 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: Guo Ren <guoren@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 8e18d2c64399..cc13626c4bbe 100644
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
@@ -114,6 +120,12 @@
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
2.27.0


