Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547FCC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k3nCaEbxEK6Q97cKvkDXNBXRksU/riV0XuPNkPtg/Q=; b=XaUH6Ate0dDr0G
	XF9wFIIuY4t/KcqNcjUZ4PS/mElreHc05P0TwEGmI0n2RhI1D+CE7ZMnOQ+5OKPKWLUZqmUr2sndQ
	7Az27JwdzEiiN6Ik5Yd1aXGfCmoDo+aLF9GhEp7NkU186UoI12mH1FsoxuN38HLCw0PIBp7YJ493h
	3QhSvsE11zaKqMIXjTOVu022Ri81D7geWfI49rkUp+z8x1b7ma4zBD2gYJdNvPrA87dKrNDbPSeo3
	kjq79DO58HXquZYlKhvjT6kjEmacGCdqBjN1skKLGFAAm2ztbVx8LBe5/zfLaea/0FEnUdLq/xBcL
	Y8L/l3B2h40q39aN2ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgN4-00DR9f-14;
	Thu, 18 May 2023 16:20:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgN2-00DR7P-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1023915b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426849; x=1687018849;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvrLPd1cTqQ0pEVjiT8YUKSvx/1xPgu8clZhUQSofCQ=;
        b=FtLX8JHMQVKFgHWdhhjDwu5jM+3buCm2ENvMKVrAVq3ECMS1bVPyUMeq2sWQDArIBS
         weDpuuKtqbRkamnCmrUT2qEzUeeJUuFLpxRfpG+7cRZ+TBvXVMhFeTMlvz62Szg5I53a
         2w9TC3AuvI6dJyYFj6+rtYIp2YS+SK4mhZqne9iu1i/N+c1OofX9baV5rP7q+pT1k9XC
         e2HV/TAzc8dM18AE/dYTLU4qH91Z1fROP1jdnrYvxyJtKJ6MOJou2kOJXVOqlS6psFHq
         dOQYanISqH6CNTuS8uHjbkKImoTX0yDVWEWXOk7LhLR+PMPEZ1WzsBnw3geXeADcfiZZ
         MKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426849; x=1687018849;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvrLPd1cTqQ0pEVjiT8YUKSvx/1xPgu8clZhUQSofCQ=;
        b=C1AtFoFeEW4KGgUTi7SORPDOWpZuG/VIFEyUaubIG+C1fw5YFm1ZMyrSrKthfqsyNW
         dZ4bGtwZ3rEbqWtQ9sjaYKPjh7JFIFVfbbxpcfc6n7uZGkBg66zG0PORg1eA11J7YB7M
         0OyC81wQlksXtDx1wWe/GsGq8cZqI87EaW/6bGFDkherjwWauxIGlybXv88fvvX9tyXi
         kcXFZQZi2AEEN5aHH60l3Q6I+DiMUaNXqceLSz9aDhiXSm8PF7Mjm80xzWNl9E1dJmvV
         HL6wjoYBfCqELHD3rD8uNWqERjIw3SF1RkaQuMyjPuqFju7iZhNpfVA9WVS8PGPMZXU0
         WJYg==
X-Gm-Message-State: AC+VfDyJvpsdD88Ln+9caqyPCtrBDORDyF7uq5YO9kO8l6nBHgMnCte6
	EBfcoSIPO7zlkLoYstJDQotCD+F5K66EQLYYnxj9sTv8blNrkvw8vjoF3JqJevzZ8YGzYf37quu
	X3hngOQSIVV1gz0BVd/lZFDeh3waCi3FHEWjqy4fERZJPobWzgi8vm4DvajV55o/Zxkou0d2T31
	hLQ1+SmhzOBGjuav8=
X-Google-Smtp-Source: ACHHUZ5F3YhKPesHs63kyS2hI87hWRcOXYkoisFdhsrt59NTCICskzaqIsvfB/OKK4tRgfNkxyJKRg==
X-Received: by 2002:a05:6a00:2ea4:b0:64a:9090:5147 with SMTP id fd36-20020a056a002ea400b0064a90905147mr5497396pfb.10.1684426848755;
        Thu, 18 May 2023 09:20:48 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:48 -0700 (PDT)
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
Subject: [PATCH -next v20 07/26] riscv: Introduce Vector enable/disable helpers
Date: Thu, 18 May 2023 16:19:30 +0000
Message-Id: <20230518161949.11203-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092052_522383_5173244F 
X-CRM114-Status: UNSURE (   6.74  )
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
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index bdbb05b70151..51bb37232943 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
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
