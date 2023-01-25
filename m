Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8493C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2EroV5vpjQLcxhuZx1j9axDrKX9nNP7fV5qt5pYKMQ=; b=GTAkdAVUIUjxXO
	1105DE3qFtWlzlR4P/nvtRSEHJ4mFUL7oRVNEchoAGdYy5Uzs4bQBG3u8p6fjxQg7jNcLpY0IA6HC
	TBqzYCoiDMWJi6KXsI0AMnxXvkz+IKulWbxyZlxQEnzP8xeDckevXexjhxfoUcrlxu/zN1qo0VeSt
	mXcElTKVRblB3kJr0tplLFuqAyHRaTpfMY/4ZXpBqt8fxsm4TmgUN8tDWtnudmUESo4padwibMvX0
	3/IkD8+99S0TX0KJvZpR+BAuGqMI4GTLYw+xJZlRHwgBJtTzfQLZ8q8zd1XCLkNR5s6oI1aVyySsP
	VohaP9Bd9O8JYuAMl6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgee-007VKb-DJ; Wed, 25 Jan 2023 14:21:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgea-007VBJ-Qg
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so2226205pjq.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7HecywGlJlNGqgW5DTmk825ntRt7eobb4WEX9z99xY=;
        b=gisRvU9kgDZ2QpFge4hNwXnXAzJien4RgFybF/izeNP7kzDdNeYRBdbPgB0Ia8cW0W
         JIjsAaAsN9h59Z1yJpqmr4osLvwDqsLgUjm/2/5UjBkiXClDfh9OJNazsBZwgaKhrlM3
         3+zZ7HGxIMgnp7GDXUVzew9WM2ko9wYlVpAzIhiLRvBQf9thP5j9pAzoutA0+4piHpFY
         iuiU5fW8ugwwoiDuXXr1Ygj9f6r5iSm0kbtIr84/H4LdG8D2NllYi9SCr+IHvvdCkRPA
         ZkdTixLN6NfD08aaBTe2jaYCMyirNr/acT3nHx4OyXhvttSKGmSb1vabupdjs6y98/1V
         rctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7HecywGlJlNGqgW5DTmk825ntRt7eobb4WEX9z99xY=;
        b=hPpOiUWfs6MeaR4QSMZYwLNSjBJy/JH2AwUqwdQ+Gtn1MuVYuO4UcUpxy6pohleHKd
         cIBidHfpmQVURj/Kv1CP6VeCGJfUccYOOKMww+XxA4zlKHXBmdsT4TktxaSy28jMHun4
         KQHz0oWG5sBNuyKSZn2nWexdWvSIx7CkZS/DISQm1+88UWGiWSrdPwgO7e4djbnfp0Nc
         rdYcJWFM6VoLCpdLdy5vG7bd4mPegdXQW/qVfmPujcVQk/GCL5ZXWkSPyG4nuYdkvfAT
         nctxCkBcwthuLfu5Isngi09JHM6VrhLYfHKokiAKd9t/CCAZFZuIgYwRp4YF1jAp0csE
         PTTg==
X-Gm-Message-State: AO0yUKVjSEYX5BL0KZ/S/Vt7gUpxgXFw0t5rfA3I7JTFJ8dhM+wHHpM6
	embIy1heDqrXwdvEuqI6350uDIopltyEEL/x/4C4eg1DMRWGBiBD22LCJT5jrTdB0MU84HTCJfQ
	AX4HXXlS43E8V4UgQf7l3Es1Vqq5K7avE8bA79egG5Eqpa5ZiZNJczca8VUIsq2TeGg/UAEqaw4
	so0ShZcLdOyA==
X-Google-Smtp-Source: AK7set+taHzTHqbs/8HQ6ZBO3PAr7J4C/hcNzYvOlh4K21lnF2smtxgLFEFzTtxVG1DC83tsP1APig==
X-Received: by 2002:a17:902:da81:b0:196:e77:f07b with SMTP id j1-20020a170902da8100b001960e77f07bmr10029018plx.39.1674656492301;
        Wed, 25 Jan 2023 06:21:32 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:31 -0800 (PST)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v13 06/19] riscv: Introduce Vector enable/disable helpers
Date: Wed, 25 Jan 2023 14:20:43 +0000
Message-Id: <20230125142056.18356-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062132_888495_E53D3077 
X-CRM114-Status: UNSURE (   6.39  )
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

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: create new patch from meshup, introduced asm variant]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andy.chiu: remove calls from asm thus remove asm vaiant]
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 917c8867e702..0fda0faf5277 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
 }
 
+static __always_inline void rvv_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void rvv_disable(void)
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
