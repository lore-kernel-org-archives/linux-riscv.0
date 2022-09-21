Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7881ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5EL3GWxiTTtyfd4+F5rZsSNYk3IIDcXT0xMHcLi3B3k=; b=AbeKjaXVJT9oiu
	l//MCktMc5VPcOfWRoohMAWJtwUeOUVDMy63FMn76d7mK/1KO+1hvvMzfZQO/n0j9/9t8jHsyRU8N
	7+5g9WDP1bqGwOVqk0KmDGOYmVw3N3+ma6CBnWVKoVTTmBXUv/FnkQqsCtKK8YOIrE3J5NOmIO/L5
	SKquub4cYnUJuSm0iGxT1OdrDwoa3yM5QufZPKOhGqw6UU5MpQB90TgjQQyg5V31nI9BrbEdeXxLT
	0jACS1TTSz9NhD3u9+bhUQPpSV0W2qznzD5ajSoLQPuF8Zgsn1VLpzlFDYEMNFAyn2sRpupDnz83q
	bq8dY77IlSbg7lBPVvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2sj-00C2TV-Hz; Wed, 21 Sep 2022 16:47:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2sg-00C2QX-UI
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:47:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id y5so10910346wrh.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=SfPOL29gvKfJCXS2UHaX/u5ZZWYH7zgP7jlLqWnd/Ds=;
        b=Ys43HplyPAH2OimY3/+SAvtATb42EFFeFFwUaIv53YGZtCWV02x8QeS/rcczF/2d2M
         62JkJlpxzuBcKkDULSkDSC2sEgPcd0VLseRi+E4IxnNg/R8GvcLpLSTtS0wTfhHdzMvi
         CdzZU1NB/iX3/oLDupobdE1j4w1UsolFFma6ffsbFpqE3PCydR7iXwdxn4/xP8qDnjO9
         rInjANPy7rx627Kgce6PxLOsSslEk0eFxjhdAVmSE/XSYC1Zn3eNBgn5B/HbOnBfaI4V
         4wrAMoJbyWqPrdFwUarCEH6xx2p2jha40nzhyzfGDUPrdwLsiEYIADa60ZSw3S3PM2wc
         Peew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=SfPOL29gvKfJCXS2UHaX/u5ZZWYH7zgP7jlLqWnd/Ds=;
        b=njhQ1JfSQJPYficMDGdvcQTadPgomv22SApgyCEXzapAr81ybFoTmSDjG40NIRFgyA
         XvD4j7HVYNkDt+1y15VyeMfxVq5rUezJMGibbic6EdHG6Z18FW1OczCmFoe9HALi6Dt2
         qqvYhjhdiMRjXK3muOc8eUdTKCshWEpQa/CnlwaEp2SP8T475OXkf8NVn4ipLO7gEp7Q
         M9LOex2GlOEyq+9pN/7xUngUV59QWDAir0Tmc++iKK1GnkSAainNINA4PA0rpG0qflpb
         3gos0b0HozzZwFLPAzGdMJbkpuylFH88mHVS/CMzUimoZUYBebcKkuTaSk9H1wXDj7+W
         C6ag==
X-Gm-Message-State: ACrzQf2hcFIgWPe3Y1nZ7pAGeBIyOApnIgYo/jrQUTfsC+jSeMQf6+VA
	gtIIn5/MqbuDO3onqDlhyB96LPYe3OHdUHGpUj4pzvSHrQ85sQ==
X-Google-Smtp-Source: AMsMyM7NQZoEgDMWXgGtxSKkvcPa/gwF02Vef1WSEnyMddUo+J6Q/uArjxyi//tn6IM8O/DcvdfysDY/ONADduJ5rcs=
X-Received: by 2002:adf:dcc8:0:b0:22a:b9e3:bab8 with SMTP id
 x8-20020adfdcc8000000b0022ab9e3bab8mr17948321wrm.341.1663778843031; Wed, 21
 Sep 2022 09:47:23 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:46:47 -0700
Message-ID: <CAM2SziXS6hBELhGAO53UpZ_=K=pwZMCWQUzNS6OOtWLVmBQwjg@mail.gmail.com>
Subject: [PATCH 03/17] riscv: Add new csr defines related to vector extension
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094726_999812_75922B25 
X-CRM114-Status: UNSURE (   8.06  )
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
 #define SR_FS_CLEAN    _AC(0x00004000, UL)
 #define SR_FS_DIRTY    _AC(0x00006000, UL)

+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
+
 #define SR_XS          _AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF      _AC(0x00000000, UL)
 #define SR_XS_INITIAL  _AC(0x00008000, UL)
@@ -31,9 +37,9 @@
 #define SR_XS_DIRTY    _AC(0x00018000, UL)

 #ifndef CONFIG_64BIT
-#define SR_SD          _AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD          _AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD          _AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD          _AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif

 #ifdef CONFIG_64BIT
@@ -297,6 +303,12 @@
 #define CSR_MIMPID             0xf13
 #define CSR_MHARTID            0xf14

+#define CSR_VSTART             0x8
+#define CSR_VCSR               0xf
+#define CSR_VL                 0xc20
+#define CSR_VTYPE              0xc21
+#define CSR_VLENB              0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS    CSR_MSTATUS
 # define CSR_IE                CSR_MIE
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
