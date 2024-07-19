Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA19BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvfiyZmK03K841JEn54kVYf2nXjvG7mWZMBAHqspVQ=; b=s0XKsHjxRSwHOW
	4wddI+l7RklHQRwRD2ayM89hTOpntdncWUiHT02Zx7PqfWGkaWyOys28490LBBZx9jGeZrRpoTmsY
	SxWvlim/T/GtQ+ruE48MVT121NYHukKEK7DXQhDD+qSA2KQatzVDbVi4dTZhVDUvZj+vjy+YlcC5R
	/ICQ3gJjmamsatdYN3JMmhTTw0TSVAcJ8O/xbm+XDSzN12g0jO/0oi18oZaujEKXDqQTia8BqYcmp
	Wh96oWeytqMNGY3+1e9AcwU58qZ+CMKMLFzL0Q15JJVR/lZEyt0HdDEkL5d/P5e5erz1yFvp94whs
	PUV+S+6LZeVcIoTcMI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKM-00000003EkF-2vyG;
	Fri, 19 Jul 2024 16:19:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKD-00000003Ec8-3CSd
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc66fc35f2so13245855ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405957; x=1722010757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=kGDgL0mfLxJ0ZyKj/hQyleQVWgEt8lJZqYtK1UkJ8rVX+TQz26bW1S/i8nWdy4FcfW
         z+6888nY6EH5iXFz6sAAfjowLCbxvYRZbqLtU8tF40bm+f0ZO4YbQ3Uoo6l9s5PsTVjP
         tdkoOmBdfFfVf1WFKbKLkB41AwGjWmA6jB4HJM32yC/0Q4zVPHFawZaVbuTjsftS+v5/
         Aaa76tVl0qE64VNHGzMwTY3ksBdZkDeM74lC+O4k3unuf3XOP38xZMwy9w8VzZwirDWO
         3HNgPJIqPu7BciyePVN46Ev6vGdnQtIaJDLd2CjHpWhV5knAUcXBlMEDLpFVmI/fTgqs
         PS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405957; x=1722010757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=U2902h5MFvpBQwaSaRzwBEFTOX8/+CeX4UW62txPQufvILfZa/BlhOyFGZMJkxBBRb
         IzcMhOGaz0LPc1JQlSVjM7Z3CZO7R4mhuW7GJFX/mkiZWZnnz4gcJZ8+JAcMsUfE8ddN
         F2cj3Yla/Qa0XEuXoAAg4po9DoRMYnEtof1Fogm6rsQ33AehlCAk6fOVEUUfYjxE8Bhw
         pG2LLxq0GaPqcpqZddfU40s4b4tqW/vSG7SaviSqFS+zZj4jrzg53ny6VhQttceTof/d
         IcA8ivftGdegm9pJyg/6doxERRn1gnQD30egTRjerWXfHvKKeI/9YgvE2yTS+BxoCbkl
         Ns2Q==
X-Gm-Message-State: AOJu0YyuIc2L7pxzZnyJL+Z3jOv9xrr7N5UQa+Suenp/4bKXKg0ltbbU
	aocPb4pezTSY+3/yiNsPnrwl1XTZMeJJNyFIQXlfCkRc7NUqJ/UDw7syFqPfCFE=
X-Google-Smtp-Source: AGHT+IFPhJygvM7cOI2sFvOpJgwcTC6OzMCPu80xmtOCEp8XNQ6D5wygI1YJpk89nnaU6ND8ioVjQQ==
X-Received: by 2002:a17:902:e54e:b0:1fb:6e83:7cc5 with SMTP id d9443c01a7336-1fc5b58436dmr96085525ad.2.1721405956704;
        Fri, 19 Jul 2024 09:19:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:02 -0700
Subject: [PATCH v5 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-7-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=V/PMHUAjK0OP/Y/zQ4VqwTikKOoyDyb7MFDrNBGQKWmByMekzQweSn5mpBoX7qu1LxbxT4AQ9
 wY71YtPGHNrA18pqy6FN6yA9i9xO/a7HH4WJHKJw5sFUp5DfL89Zut4
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091918_069181_352DE42E 
X-CRM114-Status: UNSURE (   9.02  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
