Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA909ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5b6ARzIkfGivCnwIe+zvuQLCw+xTlS0MDhgZUF/YHt4=; b=doNrG2gdSigH+F
	GjAqPxeL9bBNpLZsg7mxed+xyakD4g66vNhXNugQ1QpdsL0I+FFdow4EGvG5aDircRRpRERRiPMlp
	Lpj1FiDH0k+fX3JO+mDb8oEHxscmeVTf7z2eg/tGc6UQoxJ849I7caRkwxLx/uyT1z5pmqBmT3Fko
	IL6R/7M0zFG1hPNyfWafJMEQuzYYsR3elML55bAzO73fSRaIaQI6xwc3YY+4ooehqBDtZrzuVz1zX
	JMxKOJIsX5bu6t5TOPose3JrDLGdRl1FHIO0w8C5ZaegdD5AOhXU8zfvqHGlQM1No1Dc/L0L1P/5n
	L5XHQwaGfGzMMoTymIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7YD-00CkmW-C8; Wed, 21 Sep 2022 21:46:37 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7YB-00CkkV-0l
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:46:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id l65so7301853pfl.8
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d2FRAtCKVgQ9Y5TpjSPH0GfFjJSalodszbXO/KC34yw=;
        b=SqB//mwo/47ysApdTgzQ+IrvUnDTUj6re2dbVZCaupyv86WbxYsQTfHGpKAf0ygC/3
         eQyXlZ7swsfhtoATSV/TiAXCCV7uE7KJk62yVyyOIjWHOQRhaY1NKVNoc8IpuVPd33y2
         gpSwomTb3kJy8rvXDssyaHfMLON0VK5Fl6B+YmCc2DCMUCZSTO1ycs2ucIoKgmoWOsCh
         5ieOGz0sQ0k28Su5Yk11GG2UI8jPiw8LNgTYvI8nYQHj3ofOJQJNctGLgj/lRkkXOrSv
         5UY9eEcvOKR0VR24IBZuBHBatGXcU37zKM+tZvFnmYcSS7uzUJVBwdnYAMGuhx1aAWCv
         DHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d2FRAtCKVgQ9Y5TpjSPH0GfFjJSalodszbXO/KC34yw=;
        b=qVhOkYxxTC/4lVVVElV7aF/diE93thHcg0oOaipq3GTfzAffFYD7RdNgva9BQ9sR0V
         mMbXgpSCzFT5FVZzMUZUlLKqdP11EE2oACREU01fn8SrIC6qj6JiWZCu5Uy+AkaJKlkF
         YMC/07NmvYKsjQCR93Zl+UUa6jJayTXW8kmudpdNUv6cIcXYeT77uaTbe4j+Ct1CxdKz
         eOIFc5abNQYQH6zMLDcGFF+QtLUrC6HrAN6jUVUzHRz2Gz4JumoW2YdyIBfqwv12Occ5
         B5jlxtaIWZYbVEexiKCLmy1YOj8OSmj9bO5gOFQnqbJNrJpyOd35hrQzAZXdkcJna2ZD
         5Usw==
X-Gm-Message-State: ACrzQf3m9Tf6nXmDr6uhxJqpb2Pc3hIx5DJjJKXjq/MhdHM3xYpHdW5c
	iNHu2MxKI16qlcmUrTnvS6Mt+Q==
X-Google-Smtp-Source: AMsMyM5Qt8Pvo37QN7eXSDoRzNuC77tgBB1y5EtyGSgOU6Vhj8bk55Sf8HK9POA+9Umi2py1cO7Q4w==
X-Received: by 2002:a63:5a05:0:b0:434:23a5:a5ca with SMTP id o5-20020a635a05000000b0043423a5a5camr190906pgb.515.1663796792969;
        Wed, 21 Sep 2022 14:46:32 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:46:32 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Changbin Du <changbin.du@intel.com>,
	hasheddan <georgedanielmangum@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Colin Cross <ccross@google.com>,
	Peter Collingbourne <pcc@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 03/17] riscv: Add new csr defines related to vector extension
Date: Wed, 21 Sep 2022 14:43:45 -0700
Message-Id: <20220921214439.1491510-3-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_144635_067994_10544EE5 
X-CRM114-Status: GOOD (  11.47  )
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
