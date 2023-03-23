Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3349CC76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr6x26OTrEap8vNG0D8sKWUDN83KecXm+X4b5z/5kfM=; b=Y6piRx0lDD0Kvl
	Y59IRGJP4JYi2JZNC53ha4IVzVlt6/OkB9I/vZCx0XzHdH0Jsmc60nfzWZtoB/Tifm9fpudWuHeug
	DfPJRKWnQngB4jnTpXWoqD1qnX++fnYJHf2mcH8v/itxjU2QXvy0GSfOIW2M6MFKQLfG/0HcVkO4v
	Gd1XWTiLbOF7+6i5Y55XsaowbeXvBvSZTsLRCK8gOdZ2Dug9YMQtaEObPXeTHyMgcwRm5C1ndlHBW
	xn7BLaZ0UbNNrwKycJEMtTKbTKrLmoUm/HVu+jSzezM6zo1kanoMHSSPVK+5UhSwb0+ZDKjW0HCsc
	cKLQ4QgysQy5cDXre0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQK-002Gur-13;
	Thu, 23 Mar 2023 15:00:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQB-002GjD-0X
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:00:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so2340795pjz.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583606;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=Rz41bOqdKfl5FfAf65R7fUQGQX1CzCAON8GMDbEPTjJc+Ea0PVKsuf2+GpTQEJL9Bp
         bY+tkHzGfmFJVhiAzf3bM6MPdE01bkF6uNUUoFKy2sUODXQTlA2Iz05JtvpTfQ5kIln3
         TFoxrqWFkMJU1glN8/fRwTK7D09J7kW7WszfdkGuH2HdjYSEUXQcrrO7johdGVfbIaCn
         PWU/T75XvVvO+g71UJilt/RdOYV8w4mVxWkFhB0kbQSf2gtD5qigJT0VniGcFhXRv5zC
         Aoo7PpJIfkhnbD4MLff+iLmSP16tTABjSff+vkRsm2LFEdEs+KL8ovv2NJoA5VYjta6M
         yExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583606;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=yYQ4AMYRB/soz6NBKR8hUblAczzYnTiTAX2tW3+0myAlZK2Z82el2pv5kqSTTZfOqS
         FpjWSoSCHtcWEmx/oE38H6A2wOg0G15GCoVJJHbK7jfa2k27Kn0tEe4rzq2eQ/T2eE6n
         K806JGU6zQLA5a6twmmIwLt9v6RROSl4uiiNRmIkHhYTWrRXl3w8sxZ72ULcWmjsT35m
         ZjmjHgxnSSXH5U/3IlEopLBLz4vfyONOuSLzVzWhkLFV4jGLbBnsaOdYBQQft7Li9aXX
         +deuA8JdA3DowK1u3cC2515blZEZ16kaz+HNQASRJPH3zjF03U3H68gliEWzJaktJIKj
         ctFw==
X-Gm-Message-State: AO0yUKVOKMQHCg9f1Un1e+ekSVcQWQhxMt01kEG3CQQz7tBg4mdmO66t
	417ljTrp5mkQ91PN8UwTLidvgc2z8Xp8UVvPfCeoOlG/cjEjInJz89H/WBFP1/lqQ9TlNVk2cOY
	2HZz4CvxXOl3uqmlaCMNd1z+nok0ACVq8X6+bTsGegCEZUQAmy9bIoorw2RJTFJeyNVUX4vphJY
	qZMc8JWzSZuoB3
X-Google-Smtp-Source: AK7set+uoxNy2JVwtQ/ySsF5piETGWumQRej0C/cqwQforKo3fh/cYPJk1holgP2j/v4Dycx8bWqOw==
X-Received: by 2002:a17:90b:4a43:b0:22c:6d7c:c521 with SMTP id lb3-20020a17090b4a4300b0022c6d7cc521mr7293331pjb.45.1679583605730;
        Thu, 23 Mar 2023 08:00:05 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:00:05 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v16 06/20] riscv: Introduce Vector enable/disable helpers
Date: Thu, 23 Mar 2023 14:59:10 +0000
Message-Id: <20230323145924.4194-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080007_230072_68718BB5 
X-CRM114-Status: UNSURE (   6.31  )
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
