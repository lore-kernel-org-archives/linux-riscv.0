Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7D6C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5b6ARzIkfGivCnwIe+zvuQLCw+xTlS0MDhgZUF/YHt4=; b=KGau9mwbBadfy8
	MJOc004DnIpX2NAELpRocMTXTn/gu6CMTzzZqy4/qvNrHhIeVdt1X6LALs6lUfC8cD5z5oGGsRXfX
	58BS8M55kk/hSh6nJCQD2ID6wGfD1VTsK6cKVf7x1O8FUpsdUoSumduHn29YcPZOg9QMxjDPl/yOZ
	Cty8Kpm/MDr7iDYb9fLi7xyg+NvMFkLVTfcJdsYGzBeifVNaZLF1BIhp4pGqKJ7dtkMrzUkvZCPKe
	qh44YXb2bzl47pU39THw9htiaNi81wXZWcat7rZYRD2d0Do/Pyy+L9jO9G6oX5iJKbJCy7fkns6AP
	eW3KU4VimXsSy50l5WIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gK-00CUXI-Te; Wed, 21 Sep 2022 19:46:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gG-00CUT5-O9
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d82so6986902pfd.10
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d2FRAtCKVgQ9Y5TpjSPH0GfFjJSalodszbXO/KC34yw=;
        b=mYytzvYOqqMIhc40/kmZ/FQifzO81gDcW+SUIyY6wL2lkECFF1ytiI7/zao0xQtPrH
         bGc7+1roTV8QAUwHf+ORZLlNe01A72BUnhc+/TsViHcZI5wbBpzdlMQMQ4+56ruwjoj/
         t03DYpg+8WEi10wde3GqfIm85fqVBXjYqK3zVl4VSNOGHWAxOx8h3gxhfhhZDs1FpQ6m
         wmkB3S34llHedEwmNglLWcoBOmOYMGO+/YnAFeoYzzbX1/0P9Gu8gCEeixW/phoGJdn7
         r2HxR+EprUlhbOJg/ooUVHMRyrPNWSCIZkdSdrbIo82TV63dhDVrqckOVHjSKAFYSqz6
         8jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d2FRAtCKVgQ9Y5TpjSPH0GfFjJSalodszbXO/KC34yw=;
        b=4TXOSgl3um/qeKhYCApHmfPVr+FqnTJk7E5QB9S/Db1YDL8WhS/yrLJPugXhPTA56X
         Fcc0mPfBpVDl35I1cqEWIEKBAuuXWbaa1mbuFf4mA1fvx4DbG7LJknDUA9sEkmpGYaU7
         39UTRrFXJhGd93pWIIfKbcaNUsqkvpgGlc1mGIgLKoyTl3TIAPA29OfG5d9KcyWjbA6V
         0ZpVKGJm7lAWVUIWCw3Vtw8rm+djHDt2kDBYGEv91vT909jRlsmTCDRFiicSdE9/EDMP
         KJ9fhiGyr6AWlbvikLNHNVAiG1D+DYtAy8cPWOQyIBrhrBDn1FR/+e0A7XlLBvlG2fet
         Rf9w==
X-Gm-Message-State: ACrzQf2NTm67R68J1boEGXHpu9SGYA0kQ7+b9EqRbeEfyYx9t4MuCgtG
	Ge1VCfjWknsXwLV2qWxh6Sz/UwNdo7TE2w==
X-Google-Smtp-Source: AMsMyM6xT/zV9sFVpdeznK/y1ryGWDY4+FLeGszcR3u3cdHDdr/wIosUy53Ez9KCVOTHKMDyp1c6wQ==
X-Received: by 2002:a05:6a00:2192:b0:54e:6aed:c6fb with SMTP id h18-20020a056a00219200b0054e6aedc6fbmr18098394pfi.10.1663789605800;
        Wed, 21 Sep 2022 12:46:45 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:45 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 03/17] riscv: Add new csr defines related to vector extension
Date: Wed, 21 Sep 2022 12:46:15 -0700
Message-Id: <20220921194629.1480202-4-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124649_050352_0B6A6E5B 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..78a68f29c3ba 100644
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
 
 #ifdef CONFIG_64BIT
@@ -297,6 +303,12 @@
 #define CSR_MIMPID		0xf13
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
