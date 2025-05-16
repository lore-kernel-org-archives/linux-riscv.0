Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D33CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8BsplDz9e0ipHomn7Yl902GWPb9snD1SEURXfjuekQ=; b=qXtPPjPgIQ8QNJ
	JLc6PHtruPA1Xc9wEBqXT5Y2yhd+S+komjgbnndZtx1N2EfLyzHKf1uiggP4WkmllR6S+NB5mB/8o
	W00htIvbp12qT5gkSbNZu/IlT2Y2QO0xo2a9gjRJWvXDU8EJUavOCuwzSn4evzjuggdmsOH40cYvp
	zwayVY4W8i0UAPwz+tf0oYqGJthOI+cbR9OI6yPUQ6B972kqyP7DsygHI9oazGfimpK9PhZZf3naJ
	BbOfTqnYwV5VuxEd2gdNNrInEN/I8njAYaTWX+Dixpp3a7tqJrZVJXrhXgryPdbTplTzd/8PY8d4o
	OnTOfwvwNX+oGANNq9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOX-00000002K2e-3y4M;
	Fri, 16 May 2025 03:05:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOV-00000002K0X-0aY0
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22fac0694aaso12696985ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364754; x=1747969554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=YHcZ/bKq9ivwtaPbEfvCZ2MaLarsv+kYNBweJTiEJT6OYdSGSGXyVWcKoSwZvDr4tG
         vlAhp7mQ1CWvPLI2rW5iwvPPCf8cnnMjF5FgBUXYUWcrloeynNSe0mbMgf4SYOKhv8Qn
         WDMVXDgBQouRyZPhjsV4oFO5nL2NdyVifx0e2nDBmYE6jO8ljSZ9F00s08d0jCnXj64h
         6EY5EU/NM2GaYBKvHlyHdoS5V34Nc4BVxS2LNuf3d8XcYrf+26cbUURVuoofSCZK0Ltc
         q10gN4DM0jNaeG8CD+UiHABckf+RG4+R9TgJ4LwWHHbzcKO5/QldXsbWyGk96TOPLoDA
         xZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364754; x=1747969554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=kB8bzv27mnudu9rFv2w8dV7dIZlM4gPzQHX3nhEcVANR4WY1OPsMmBNB1lPm+BGzCK
         hQCR7Huqi4OqApFBEyXQe6FQkNIQtn1FC8mK+q274ne2g2SFND7hL3fmIcf8U0C5xZ7t
         2mKMzSJzxKfKMOrGioqpxIw1MH8aid6/kgCshj71wf6RGm6GMFXahjunVIETLKCaMhmn
         EzyA3lMDPjtVA01NpKD1iLcTncp4OQWjsT74PP19Vp03r8r9ilgpqKMgez4avmqEcjNv
         IGsCGjXggixqHrJHOrhoKtUqTBOMS4mOmeOQl6rt6lIQyPi1S1V9GttwVqzx6a7fgmc+
         tWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWFmsIa3Ie2wn2XnX5/Swm2XurFQjN+HKNI58WHxA6FPjU9lTxzTMmgmWd9+yC1t2eDB4n7PuXYYlW5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHF6OSeTjagvBliCXUz7POvRssgF/fB0xatVB5SuHtUdMVi1gM
	uxh0Ur9nJtP5oR1/SdMV/mPW02yo3XMsLfOFvmyud2bGZKPnMXoITA2h3f+jqGjw2Og=
X-Gm-Gg: ASbGncvRJhbYcykrmQIphcX8dDTFEP/J1FgHffn3TsI1cB4vtoaDdgNa+gAG39NX7dA
	yOldAzxbv0r96KKspdsP+GjeNx3R9KobO67DgXdzbsKdb5/7vbBhoUYyJJZzFnkqOYOaCNg0d+9
	aBmlRHxxnhQOqL6ZSrS0mPaL5jBniwSFucRExV2jzO7kRCqCAfwyVk4StsqtGe712BxPmYU116Z
	R1bkCXa1TgfYNvkXEMuFQ1zhSa4Yl3dgRIvhRQix2OG62WyYIYINvhtKfssmekKiReUkMKJlF2W
	5N4fzRUKVJ+rnknsINn3EslBUu7vFDMbBbXw0tESJ+pLvhCsJr1HFbqYIJsS093Cy+NL0T6xaTa
	J6iLBWomhAqg=
X-Google-Smtp-Source: AGHT+IEZ2ronJfVBYw0CNofcDTNPNdTruhtwvA5nHbntYV+GYPIfnd+sdXjNknRMWd6vX6/qWCPU7A==
X-Received: by 2002:a17:902:e786:b0:231:d143:746c with SMTP id d9443c01a7336-231de3ada00mr9814335ad.39.1747364754532;
        Thu, 15 May 2025 20:05:54 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:53 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:04 +0800
Message-Id: <20250516030310.16950-7-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200555_178530_42EBE93D 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add SiFive vendor extension "xsfvfnrclipxfqf" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 608004250e2e..2d05e3e73170 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -8,6 +8,7 @@
 
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+#define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 6042cc3021de..9376e1ce133a 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -9,6 +9,7 @@
 
 /* All SiFive vendor extensions supported in Linux */
 static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
