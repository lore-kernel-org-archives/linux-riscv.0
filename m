Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FDC49EA1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJQ4Ns9KIsLNeu1+QxKaGD+Cu1ujosMsvtMsTWF8fGE=; b=MeEPwvDZevmNDK
	lnx9dSkXtkQc/9dXcfYHn8czfy0M1NIhSPRzo+HX0Pi777XMV0UrMCDxQZ4Mio+6Sb4j8fYyFl3i6
	FWQ7I+HNZe+CGkX1kmXh/GmfLiBV900OBnR7W74Xxo6AQxc6K+cod3OpBCiqgaD1KEhv7LAsfRe5A
	8Z4jcWj8wQrOsYH++FdqLb6UA5u41yUDqa1208YeLz6J0lewrOAIohWLt1uurwq+ZX/GRsbY79T40
	4fZ4yYHaK2GdxXTJsZ6ijbSP1CuW2GKtmcENPF0/X+I8zQJWR9W59bPYJQ9QLb6dmOyHzlOST3Pqx
	PI82B7Ia/2DUVjXoEDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUb0-00000003Qyd-0t3q;
	Wed, 07 Aug 2024 00:32:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUaw-00000003QuE-15qi
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:32:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7bcf8077742so1044522a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990721; x=1723595521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddYLMqUvR1v7jAyy15+CCV5KH3Z2YWZvIvlhQOaZJPA=;
        b=kvo+B9Pf/1DVLdLMwQAlyzyTXQlLgsJijtjScuORHOJzUCRXt1RiQ+QLuogeEpgShy
         rxYjftQE1l6452K5P/bXCF8QcU2Bq/445pRgFroX7uLKrmbK34JwLzTsWV8HaKn1fXhk
         LxBOf49Q862kMbkzT6usJugjyCfaCyjLejrTfstoducTGgWEhbn0fjTVGrMtlbnQXpTV
         mMWWY3fnkrQ9WQGLfKz355FipnQ2Xtc9L6cNct6FTPkd2kPx5jyzNzzzrs6hZcQ+kib3
         sne+YRNLYysIGVrtLffekxBV5RPSmyiUUilZhMZ5RK4GKn7TzYRPJP0G/yoSdEvFskys
         DTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990721; x=1723595521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddYLMqUvR1v7jAyy15+CCV5KH3Z2YWZvIvlhQOaZJPA=;
        b=mYBzEgcamO96WYnmy+hqPKK7H4dOacv986T+jeFLrZqG0SedrOMyODD0hUV5K27YGJ
         TIo0baEfFyh8tQmOHbhnM9dTTqioWLv4lYhq3M9s1YK3xVMDoIfdHI+lAk+F3KuP/dEk
         MSGr1owkBvEpCbj+O1hA1Qo+c+JQ+07qrfOKoipaxUvmsxbAvGXIo3kDmIwJdqMhO4nK
         Xp7jSutvMtlLruSFaL43dYL8vZtLsHNhE1WNQKQq9hkW5IKN5P3/qp8ejgkEe3uIkIqP
         sIuC+MbTwjK6ol5wRglh2eBq01C47zDcbd+nP8y90tLzg6RFOHNITXAOq4fJPQvG14w7
         RUWg==
X-Gm-Message-State: AOJu0YyILuECQmU7CqH1ePQjFTo975ey1vqpycTRg5U2xeEts7tENwZR
	F6Slx1K6HevWA5+q8t7B7qtVZZPrnzklBCFxQQoIAXeHNs5mZlCBo4oA0w3QVOA=
X-Google-Smtp-Source: AGHT+IFcZ/6e+JexEqLaDsXx8so7S9Gq3vPBi+pWGMkHMKIdQzh7eZkY9cBc0KFS263x4pFP+0JyhQ==
X-Received: by 2002:a05:6a21:9cca:b0:1c0:f288:4903 with SMTP id adf61e73a8af0-1c69958057emr19115871637.17.1722990721152;
        Tue, 06 Aug 2024 17:32:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:32:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:44 -0700
Subject: [PATCH v9 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-8-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oaYXOwBBOZMhEw+FYJXqumRUoO04QgRL8xTyrFp+Tyo=;
 b=1zjZaYW5gRAYdgIYTbluAaWw/nIsdeZkRYKsa2xL1/d4MWG4VnUpHTBDn3uqN26brA/68QRiE
 220j5ajGW9CC+By3FOSeiRuINJN8/W35MrJyWQjh5LzY6J9hzj8fm0W
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173202_387170_EE17BF7E 
X-CRM114-Status: GOOD (  10.45  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
