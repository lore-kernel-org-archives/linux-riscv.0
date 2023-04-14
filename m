Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D2C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr6x26OTrEap8vNG0D8sKWUDN83KecXm+X4b5z/5kfM=; b=LH2C+dCpx2GX/A
	/BJCdSRzHkAJzlJbInYygDwxrtosMfsl/O4K6DIOY0PfkEQoWLsR9eNoyg+n/jSryjvfu4IGf6+NY
	7dySD6kcdav6EJoUbx6v0pwdyblHnW3/17v22nuorLXveVQYZhW4FXh5HhhXkNrKuKs4Bn2LA0i5n
	otMbR6FDFzm3Bfsu/qQQTdjWjQ8IBtIJAdJMWBb5iJpTZko/V/ZzoAzLu+CtHXkASYTujkVtI0GOm
	mmcoybjVwU/tqXXdoTlycw3ZX0fxiuwCb3ue8JUolTaA4QNOoZ2ZzyP+z/IeqKPzLBJt3zJ6QDzox
	rN/D8I+AXiROqGx5zm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnP-00ABLP-2k;
	Fri, 14 Apr 2023 17:01:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpg-00A1dv-23
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id lh8so5739139plb.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487966; x=1684079966;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=mM2vdqpkz2PBDDMrZvLiutf/ppjF1tCkaGP/crzjPrGQC7zlwYPJBix5iA6jmNH8fR
         LYABnDcmXEMK5KGZbECXDl4ndHVN2C0fLoIlOLGPm7BDAxe7VsWXcTPlVE3ojjKfwS/+
         dp7odakVnTOC3JBLRQ1xgAhaDy8CeITNr4D+Hs3XGChG32aocBrilAGAw+HV+is8Kf5G
         gZTZehgkU4QgO+G8kPL0RzpDo6rLzM7MbfDySeGYYAbt/ory/u5oC+bMs+WdMbPAQBZ0
         va77J9q6zwz0bzp9Wb1xVOGjsWQfClGhNn0HMmGLhFJJC5DNWPeu7sFGIyuUs/omzpyB
         cY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487966; x=1684079966;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=HspapT6C/dSn4XalplzYUkm+uAhqXJAyctPzfZswExiZm5Lw185227IGC+ksa7tXVJ
         FmAing2Jp6S+wZCmh7JNSHGm7ut24Tkmej22tAQwnSkdh6hvjWHNTq9ZV8HWOQMjoDO/
         vhJ1rm47WfineTIoZzplOVt8Im2aYdPhBJPT5Gyvqd5+9S4WRnfMiMvq1Z0VIOJ2+IFj
         Tou44T/HAIDxWFStsqeaFM6wv1HSjVU1Q9i1O5GHfMR4OJa7vEgd8el+71B0pYZ94RyO
         A753UoH/EL6KX6KMkiw1OqweLN5zzcGqp7bI2pqaAlDRbI1B5BL9OrRa0zboUDOVauk6
         W7zw==
X-Gm-Message-State: AAQBX9fYuN15YZkr1gmUTqoQL9ycrZWClOKUHn9x59NGaHLcSpecyNgA
	e+Nm9jgi5zzPAyaCRzYWuyHftfEX6mPCm6Lmi2McRku0EttyxpWPPr4zJS87I2SYeNyu/pDpGs4
	wR5Ym+hxxV4xc5o1nNNtWjEYHfCxQV7qh1qi5jKq6+1GUiEiw1Q7QLGsKnmNyBZrh/WmQ7hIkTL
	TeCmlbqHFEQWsC
X-Google-Smtp-Source: AKy350bcQ+ZmyMAff8Obq6yV3BPKqrDn2XpjHAqeL+rg6LKB5pICPuePzioMZgZyYVR/Af5fsEAdrg==
X-Received: by 2002:a17:902:e54a:b0:1a2:3b6:8319 with SMTP id n10-20020a170902e54a00b001a203b68319mr3730449plf.54.1681487966260;
        Fri, 14 Apr 2023 08:59:26 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:25 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v18 06/20] riscv: Introduce Vector enable/disable helpers
Date: Fri, 14 Apr 2023 15:58:29 +0000
Message-Id: <20230414155843.12963-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085928_676446_F049615E 
X-CRM114-Status: UNSURE (   6.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 427a3b51df72..dfe5a321b2b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
