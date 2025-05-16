Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2B8C2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zt8gBpl0vHpIXGdIWIGOOXusKk92Vx9PMyWKirOZxxA=; b=STp1UDu0M6QeXr
	F9B5OSJ2Z0Ap31kIFYgvnbpBFt90KbJqdEixN/9+0mVAmBzglzfhQndFXN2Y/Aumj3knIYG/QtDiX
	Mg7K1crZz1oU8NEQkDEFEgQ5o6nKfYEK8MUEiEMAW9noixST3uWOl36UsRkeorWJAYmGY/RNAMExQ
	781HDaiN8Zfc+uqpbXQkaK3FB3amkb1dSuTTCTasmD1naom/tigtcaINqmJ8KhxoCZ6kqTt0Wg3jY
	qpgCpr3OOg3GPzYDwvh4meXzYBwn4XOAKHliEPtkOcWTG3DcvMZOAdm2zLn6kryvr2XO5vFZOnB3H
	HSaJ1ja+H+otFXguYaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOm-00000002KEU-2Z6Q;
	Fri, 16 May 2025 03:06:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOh-00000002KBF-1ZVn
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:10 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so1229182a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364766; x=1747969566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/NgZaKsdQuvj1mcoi5mr3qKx+o3KroysYayBW2Uc6Y=;
        b=aCys1hHv0GWBUYIsXshJuY8ZZlgN+39fUiocx8IsljBqCaeWLCb31vIsMqt/nB+3MR
         /KWT6Us5LYT8z8GmBbtm6ms36CdQW6RkDqX64VOAWhoE+WR2CnqfC49zoTtLtNx8PmWB
         bbv0zFJCLpQLb/xX/rEeX87FQ0H9fb0P5ZnQ5NoLnZBIMsTyenaD+42o5pUq+2245CN2
         vFWR9HHcXkAPQU5qtwbkIrU39M375ZNOordg+61k75rc2mxiojbsirNh6hbqAkNXdwQ+
         C1SJ9GyPkyGPy3wquPCIeXIgpGsMbE5BBwCM0FyIwbf1hzHFdS0UaRq2aNjgW71rwDsi
         GjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364766; x=1747969566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/NgZaKsdQuvj1mcoi5mr3qKx+o3KroysYayBW2Uc6Y=;
        b=KjBTgbWQHzFCMd97+giBRbmq8pU3OAKui1ENcV981pkYFb8Jr9PKa0QMq6DJo3xxR8
         DHjQVWpV5c6nRdBn77HilRps7rW+zZJYAbxupNpnN2fTCvfL5WwE0VHOL74CQ/bdo+Qi
         k4HzqEM7t60VcECeubx16AQfcf1QWHqX+R9o/SiI1GwMo1aVH1eIocgDV8qM3NOJhgM5
         ym9cSa/Xqbbcf8/4zVhoYV32eDeWMyajzeQUA74Hvm4oYq4hUahtgnceHjI6b7zzw5nN
         TiJ1DAaYROLjQ908pnleoPhNxZN2dsy49kDrsAhK6ugUJt7uUjNIjyjiI9JenZd4pfce
         T5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2GZVA5SN/kXUKDwA+MI791z37wOCfonTbeDul6ftADAADcCREMhkztcn3111OIv1sxkA8bOv+CnGkLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPnbcWue374XmtbLm859phVzPwwF78y3OtYyTL7zvs07ySSiY
	G1OQoWRS85HEBldqerZIVCftAbBeZTW0s/2ydI5QNnBzQNU07MnbXWlKh9MhZeENTgc=
X-Gm-Gg: ASbGnctZaVWfCaZyp+Eul2MAySitLc7+OHr1Z4Y8uPYpzUo+qMS+gOql1fFtlFDfYnT
	iDyUOgUixfFbp4f+u8JsTf/n+r7Jxmv56VjrWWYb3wDbQSJ/90l1bkrgCBYwXuo0rs5BjPyN4yT
	yY5+9KiIrlMNhh6ZoTCN+rSPLrXBbInxLHAlyjhSL95zgBiMEssDStv1o2Qh5p8yKQo1DIAXPV8
	9Nh2RgiOGzQiSwldD+q2LZmnnn2Kt0z4n4HELCQ6Ekd3ulfZABCv5N3gCw4N9mNJU7RkT58y0jg
	4/dAROrs7frKoQthmon5+Z/4BldvTwIDpucj6a4dpnAzOVNs50Ri0zfogP9QmSwgclW3bDbDOVC
	OIF5zBHfmoJw=
X-Google-Smtp-Source: AGHT+IHH5HPc3MjrYHiSAPEcwxaJbyqQMeelJYaRlBb5wMzwTBd2eEb1udXse8ywqizLvRN1iMTE/Q==
X-Received: by 2002:a17:903:1b6d:b0:227:e74a:a05a with SMTP id d9443c01a7336-231d454dcf6mr24403685ad.44.1747364766552;
        Thu, 15 May 2025 20:06:06 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:06 -0700 (PDT)
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
Subject: [PATCH v2 10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:08 +0800
Message-Id: <20250516030310.16950-11-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200609_774980_F362815D 
X-CRM114-Status: UNSURE (   8.56  )
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

Add SiFive vendor extension "xsfvfwmaccqqq" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 2d05e3e73170..ac00e500361c 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -9,6 +9,7 @@
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
 #define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
+#define RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ		3
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 9376e1ce133a..8fcf67e8c07f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -10,6 +10,7 @@
 /* All SiFive vendor extensions supported in Linux */
 static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
+	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
