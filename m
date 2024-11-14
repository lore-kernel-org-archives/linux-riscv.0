Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF29D637D7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88dlAk2nuWc9gPtvJ2LTZu1PVGxjuxnA5ECknZOSg9I=; b=uv+O7nqGydy1ts
	zrDsrnK29f7oYd59WPSAYNpaI7hLLpUNokWkJRiL7uWcz0DeSN/7J9InbJxXPlBfWm3tAX5oNA/2/
	WX2b2aDVrTA7bNGd9PmCTBx1JQSBMQdsgFJKSGQufnxHPkLMAsn1LZlvsrs3do+btweaRrHu+AsPL
	6PmS4pj4G5QKX3hYeFXHcFiq7taG59PwM1ZyuqnhsC0az8sM+7uSSdwyAmFhUVD1ZkR/jcRM9BFCA
	/dorO7oR1dZJJWzE891RnNnhJusKHvRdcgblaS7jUXQ42i7bBzA9WyUKQegMcNLC8kZ3yGHhX3kXZ
	mPiAcYPa+52w9u+5YOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUc-00000008Wmz-3imT;
	Thu, 14 Nov 2024 02:21:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUR-00000008Wc9-1X68
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:21:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20caccadbeeso780215ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550906; x=1732155706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+K6XdyYjajCmDAUcFCASwGFCPNniRmkd4LLh+AllFU=;
        b=nfgHh87ALKCP5R4LXfF02hRDyqx5EUGA9lGfpvqNm64yzlWM0oExEMfqkPbvrSQ+ly
         J/uu17lKl0ZDx7jFjHxaJRyG5b7bWsQaaBidfM0y+XfPH3w3i51FA1iuyAe2sI2OVb40
         hMgvGR2GiBgW0iUNqCQnsEX1cYH0bHGDx1lZ3ujkAK+lG0yFVwKuMCpM5w30yvdBNXq2
         vna17ArbI902ajW3fAM27JiiSyjS1WKErDrv5thEGugF9yQV3zvw/FbsRh66i5A3WIx0
         oSxwFfOpGs9qz3FeJbc+TXPCcVB8AnG7QXIzaOsENKSDMxjeJ0/3eu4CkT89ojrF794x
         sZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550906; x=1732155706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+K6XdyYjajCmDAUcFCASwGFCPNniRmkd4LLh+AllFU=;
        b=rdlPL2cQ4hp9JFIVlHrZBav0TmjtvJAv5RFNprHAJFyLt065WWHkaLZ4wZDrUkpJp5
         e29ViWj88+5+a08VeDB4jFQtcr+5RLRdktBtVolMHKlPLmLEMxTHLE+yS2rnHi1xKyOX
         s20ptZaJ2epq0azGTF7mf4RjRd7HD7xsaP+E3d8dtFoz4sjteEDoZ1C5kyQ9Vg9/BVl/
         gxl7+xDD1Z2GtooZOe0zjgSDW8fq0VwrurGLyxdwl8P3WgaAOnrjA2wuwRQo+5tBeMWx
         eYgyb+1gLgu8dfk7zNaBE478wQ8yKzDZJc8J9X/dTF14o+kInOOhDdD7a7LvgviN5NS6
         cclA==
X-Gm-Message-State: AOJu0Yyv25AKBkJTlBbkZS22eb1mYQT36K49tV/Conl8DajAnE9Dwu9C
	TFfYnYvwnu1W9slbhlHaG4/051j25w6rCqH6iYSwFxZgdPtT/7h7kUMqyQ2J/ak=
X-Google-Smtp-Source: AGHT+IHgCex1jt4eHPktJ/CxZel/utQf55hi+AUTxlL+spOp3rXICsTxS/dPYfvZl50LJzJdECcBYw==
X-Received: by 2002:a17:902:ec82:b0:20c:d469:ba95 with SMTP id d9443c01a7336-211b6609df6mr56594655ad.16.1731550906137;
        Wed, 13 Nov 2024 18:21:46 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:45 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:14 -0800
Subject: [PATCH v11 08/14] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-8-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=axygyvRofY8jgvMUc19UONS8a43nS9JJ/ADtP/AgulM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3EKvUM9rnuZcTBunlay5um9JXGV1wDrtF3wMv9h0f
 8gs3Xaoo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIm8zWD4p5M7N0/jIev79v7a
 59IrrHk2bUw3jEjeGtuVnT5jz5M+dYb/Fbt91e33Xdwm9WLxj8et21U+vGzjjmZS1m7iv1n3RqC
 cEQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182147_741984_CC771891 
X-CRM114-Status: GOOD (  10.17  )
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

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 93fcbf46c87e..e85c75b3b340 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -19,4 +19,29 @@ void disable_xtheadvector(void);
 static inline void disable_xtheadvector(void) { }
 #endif
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
