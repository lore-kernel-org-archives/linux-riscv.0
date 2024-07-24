Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F4C3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC8SNeEQKm4fyl6DPhD9yxO4sYAc/5eHpADjOTa6ug4=; b=BvBTLFHfOLXi+n
	qJdoOgKMp4KyBWtu61WVK5AGMGf2dK/tOqgxEfnjba7sX32BjL4kplD9P0tiLKXqQOZ2nlopCApQ9
	zfoLuC/MsLqq0XAQfKmke+PTzpEj4Qdbu9vtBzEtT+Dfn/J9/hKa0wZkaH2heUu9RmdBZHZCKOm+L
	gmB6hx+cFLXGjpDODDCq9byU2arR0OeZUhppMW3iUHgW9DWVQ1DXEscOzG4ufD08oUE1RXeXuykN6
	8X+9nCnRp2rUZYSc6/JrJyJxWh2bLpMogHKoux7xfXvBfXoy9Gf6ZrtTvnMdvlLVsQoFkXVCFfOYw
	PFtIzcT/dhI6v9jMLvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRS-0000000GIo7-3CVN;
	Wed, 24 Jul 2024 19:14:26 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRL-0000000GIha-28E2
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 19:14:20 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso105554a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848458; x=1722453258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=zooxUuR9xtRn1YdNEUWc21wJrp9FTcIFRQroPfHmihAvfuAhXGtL1PWq0OJXLqK8DA
         0AxU0vhgLsS1KJ44XQ77FXMfKgLL8vuXOu2JHjSh8Gmh7aI7GEXwAgATnxwbfjnLW6ye
         9GUBpJ/HpJ7LSzxRl4VyjOj/tv3XaIoDstNtWo0DW8r/JEf3yBbmLfI4+ji4FS+bxjoA
         6paMsyY/coOWPWczIlif0skV+ZQdLN542fnyD/hIJW6HfFeQF88x3roiOMclW4e/0RP6
         7sotuNuxqs/HBu1OqcF4DEcEFQrYUeBxffl7AYvXgkVtlQOl9yGBCJ7Nyxt8R5K2GKmp
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848458; x=1722453258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=LlHaUSNXKMxFrTxiFkJTBwIW75tTb7+gg8BhlPBsjlXa/eNmNTBk0F0b+hyWF2PCwl
         rd6km3RsyAiJL9Z8JYHks5m7cGsJ6wTZvYmm3Fg/HO1iddModhb6nH6s/JC60GEvslgD
         FPOd9/Ya/MMepH1uB3Yuyr6IO6WNwazKr3+0BiSqaN01iuIHVMFOVxpsh+B31lTErTVE
         QJQjzecmginyFs8N9qi61yEHt4iAEvpjJ0YMqThihPcaMhgPDcdZ/DDEMf9uM0gqUQdn
         u4eCaUXgZz019bLbLbnUeKka3GIe2BujQviZdXz1Br0hSgzBr/mFEmF/yfwM/aiJOlOp
         rWTg==
X-Gm-Message-State: AOJu0Yz0M0V9YBbGII/PpqNfyrsqvkBxBslLySn6kHYj1TIrDJUgCH5A
	FrS8+mWj0ZT+NvmIRKXp2twsFE/hWeez4aWLtYGR0Q9VhHUwBn+J7dICWAR6jCk=
X-Google-Smtp-Source: AGHT+IHLgTiDpT0TMNqD3LFvvYBX3c1KdokyNuKeNMfxvuG27WJVcwSBAHwFUVZPvOemuokht7oTaQ==
X-Received: by 2002:a17:90a:e7d1:b0:2cb:4f14:2a70 with SMTP id 98e67ed59e1d1-2cf238ccd81mr501393a91.30.1721848458166;
        Wed, 24 Jul 2024 12:14:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:59 -0700
Subject: [PATCH v7 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v7-8-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=3LgSk8+xNOEkZSklUaLgaL0zXyg2NuVF6QG/VGVzyxO0+a7OwCZfLqM9BaJCg9XbiSiB+JCPx
 JnjuUUBisCLD2JPnzki/otPZkOgTMX9XCCpSt9dVrgF2YyvXZb/x1MR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_121419_561131_124BE270 
X-CRM114-Status: GOOD (  10.56  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
