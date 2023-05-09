Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA7C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3RAm3jcMJvXdOWhlbVKnwOwtohfJ41042ZFRKv/cgs=; b=f3c5mKG+npqaLS
	3jPawRSxyp7Zcw80LJ5TRXztUKOYI3618bB1SPYHoDTbrTLGdHqdhk5I2xD0YdXVr9cMc6ohlOJyg
	6+nOE8kJq2C7qNf5/7PWua0kzLvg1eAasM+eJrCrY6efm1wi82Md+0Y2HBPtsbMe+NGeb3pEyjmbq
	6HxEJRj4B0BCHTnn2tFZXoa/nZmDZmXo/eM408UcYPdJZdFexpjH2l8ibgHEohtFuSq3+33AbeSmb
	f/I4FI4QC1M8lzVO/G/fAIv+MaDdct3HjrjJ8uuKQm3N0Nh5zlqwanUYZmHL8V4wcFLYP4n+VLDDO
	wb9g2bZ1ssfoH1v3wXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdQ-002t8I-1f;
	Tue, 09 May 2023 10:31:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdN-002t2E-2V
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ab032d9266so53526205ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628309; x=1686220309;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdT8PJ8oH1xp8pRaW3V56IfqtFcYTK0lyTpuGxj9OGI=;
        b=dEyjenlH8KNtGGE0LzwpQCnXQrGwiZonY0VzG1DZI3BoDMmCE1APNK7EpqOvJnSM9U
         SHiB3BDqnX44K0xYiiKVKDsc2bxbtQmLgy/XcMc3HjYVKtLPy6HNJXR7xM0qsrfUn56P
         ez3vP11D5ZC/goMxSu0BNgkFU4ljoa1wUnglHvZxzy7ec2BqYzogPRD/CXs+HgCgZTLy
         cc6vy7SSoIO+Gl2MAEtui2mWFGoERTgdZLrhfGMKIUcbHQPBM197+2ABmRrIUw/vTvRP
         I+h0y6pMhH7e/5zqnvNe9GOPuQVe3Zmq+QXl1p1q9FhXMUG3WiD3sP3G2+cQH8bmqZDh
         xrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628309; x=1686220309;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdT8PJ8oH1xp8pRaW3V56IfqtFcYTK0lyTpuGxj9OGI=;
        b=VFo6wTaP7pySLXScOQTEY0Z4dVQvv6KV3Ozpm8zaEcTUZqtMRDkR45o37WK3ZPteog
         Tfy7VAcEk/0y1ccC1bfPVSmFKQE41yCgqfDcuERVDGGuXILGh8X4bLvj36fTekpJiAdz
         PBW55jmDuAB/RBxO/Sc2lyTlxcskSCRYg9zC35w8JA1RYI2f2AlTljhFnOodONKWKo8q
         WIFgEJU6r+eWMhNxerCqYWi7kxUkRKdSTnKdJU1Ods9lFSxa7VUHOXhYJUJQ1OHDpOX3
         FUifqC6fqXp4etrbaOmrrvpEp8Xuv1l7RxY1OIgopwC23IBJ/8N5TGdFjdp1U/x9F674
         pdEg==
X-Gm-Message-State: AC+VfDzuNbJI7whTDWfIisXylM2zQbeBEVONvPwgtFcor0w6byaK52u5
	xQfcdeJqCNDcsGIfXC5c9sVXEcswPcUk/mhdMMF1OfJ+z/gELiP2Gu03tUw1jC1EYPwAWz+1fNY
	sSaBI9K5uosMZGDYovNLWHl3HwI74kL/et8mbhBaNlrIGpa3yS2YCs5yk8Hm28upk81Z3+HpGmL
	HJ8UDj3ZrOirhR
X-Google-Smtp-Source: ACHHUZ53xZYSNwoONmUG4WIDAbzuioKTIVZMq4k8YL6PVVqG3QazEaniinqBNr8eY8d+la89wqpTbw==
X-Received: by 2002:a17:902:9897:b0:1ab:253e:6906 with SMTP id s23-20020a170902989700b001ab253e6906mr12331938plp.67.1683628309309;
        Tue, 09 May 2023 03:31:49 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:48 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v19 07/24] riscv: Introduce Vector enable/disable helpers
Date: Tue,  9 May 2023 10:30:16 +0000
Message-Id: <20230509103033.11285-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033153_838543_5A588AD7 
X-CRM114-Status: UNSURE (   7.16  )
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
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
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
