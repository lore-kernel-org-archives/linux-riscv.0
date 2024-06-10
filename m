Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6E8C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKX++k3CNNHfyTaX+6HSD9mkaV0h9Exw629pNhydcrs=; b=awonpd3aIBajA2
	NCaLR2I2U9VeFIulppDIrDDNVlLqVg8o2tW0C+YCcl8NCnq7F2N4Q0pH0rJY8uSv+6Mx/pikWqaqg
	aMk+NdLkRKtHHnFTv+thJpWLkCasnhg2rlPSeOOKgSQ55lUy2FNO+NKlIcgZIxqK6tnaO7Ygr5dNR
	xvFeSQ9qMDBru4o2769m83wPPhKBvZhb1fXedEsFLLtt+HPhUdKNRnCeAv17+CBKuGJk7sq1FQ2HT
	BT5ukzACyGkFPlH4Nqv50XNwxPnNooi6RUraK+20Nrg5StLg2+dc30qyUVh2PGuEin7bSLrMW8YZf
	GHG39sJbmPuPT0TvOWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuz-00000003miS-15WW;
	Mon, 10 Jun 2024 04:46:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWun-00000003mX4-2hUc
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f480624d0fso32513935ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994752; x=1718599552; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=aY7464ltTUDANe0v5CEJ8LD0i0KHhb0o6iJL5gOzUTpeL0kVUx2+ldjaJr5aZIg3YF
         Fs+oup+lahqRX00VmNN+nN8ztWnSA0OXydFk4LmUd5YOx4vsI/TPw5S844b2jEMf3A13
         oXs0J4DecKzD6ZOMAx3RCAUvVQxv3ixgCRtpwr+5215M5+1GtUVUpEg0TaV/uZHsZuum
         3EKHcX+VVJkz/CljTUlI8kSp+BYNu6RxWz9Fbwh6uk6/2FTVjzQ6EP2JGlGeQCJFyuIw
         Hz6VkC1lo7KChkWnnVx0EZxsPhBK7bLf4Eu0FbKcQB78QLu5MUme+sGnVQFFv+5gla67
         zc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994752; x=1718599552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=Y0RllFQqdvxYuaVtvHTHe3s3AJ9qxJ2fyR9BvMvPUy7QZC2PiK+RY8g8K4XmxLCFqN
         Xm353AhsSmNc7n89bkYAhePOHyrnREH2L7isXUhbg9QHPKENYbkNMXucbgKDX6kpau/m
         qM7x5yWewBM5loFRMUgiSGd+er24+tiXvJ/T/RZYLyuTROT5rpvD00Kyq9NAkn97q/41
         sM/KD8aL/Tewu90uZ7xNXqK+kQc7r0SkQNtz66ow6grxtu3Y1au/L8EpzEnpN3p+7v+8
         omo9Y+m3+ZyCB0QMMLg/gy+5wTKDDmwBfP0qt1fnvPF5bddUPoG3mnDmOfz9/JnPKz8j
         SPOw==
X-Gm-Message-State: AOJu0YxbOzqWPK5tOlBidNLjMriQmVMwGiUyTK3Xmt0/ulh50Krxn0lW
	0qKfQbcfknJuOW06XZ48il38nUDugnvisclU29+711gs/mlyZwmNPyxMbHUquy8=
X-Google-Smtp-Source: AGHT+IGhzNw67XowR+pxZXHezAitcTACLUYAiHb9cEpJzp2JsugT0jDK2XmWOKiIDx7qVYVsfrIJPA==
X-Received: by 2002:a17:902:ccce:b0:1f4:9ce1:6e78 with SMTP id d9443c01a7336-1f6d02dda70mr108577415ad.19.1717994752097;
        Sun, 09 Jun 2024 21:45:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:13 -0700
Subject: [PATCH 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-8-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=M+PUFY/NkfsExTsLVk8k8J14gBVKv6BFH2DHRNNQUnGVcMQ3tAUdofnki8To6aiLBdBSyd3l8
 CwcONHmOkfXAJxo09mBCTw8CQBL707I5DEdUsNXqUeM68eA2H8/JeMP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214554_130573_46798DB1 
X-CRM114-Status: GOOD (  10.35  )
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
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
