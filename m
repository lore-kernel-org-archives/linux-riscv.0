Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FCCC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWE0WNTDcIJGT/EIxnpE8HahZhonS2BjUM7ROH4ynOU=; b=GPOLeuClbYwNVZ
	XdcBI8Z4RtBGFkzbKdI4qjgUW3ZRzye84zunzAHusnAgMKIfSz1DNhEiYrQNdDB4YtBRqRK+oTeEh
	R3VzGs5jlAv8NuBBnX2ZSmZT7a7c0k0E4Z2vzGvyEHg8aA3mZEdjYt0C46MdtNFDxCEyT++jfcfrU
	sf/v8tcN6Im/WtXLCY9x/MYghEo/NETGgbeaQfnPSSrhVnTefesthylGT4ANyEEmfztLnBcQoML9q
	tr64iKTsBVOATGrm2k95DvBRbkppZ6dgFDRtnwELFFd3U4Zt1PJcfU2zU2wQpKM6LVmg0Z8KbUxl5
	1mvy/jA73EvpkQvRFJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdB-002sud-0M;
	Tue, 09 May 2023 10:31:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKd7-002spN-2N
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ab01bf474aso43123545ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628294; x=1686220294;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=h5dBiJ8UgfnD5JORoVfPqn6nTI4sms8Kr2jL1vgMN3Q9h3oPFPPmL2ab9qZATEL1Si
         0Ay/aPr9YKsXB9WRz0LeqDqQbfCc6Q8ToZENURfwIMqercpcHeJ6aq4QVIVjEc89B3ns
         9aHcEYW3QGl4sHJrf3XZlSIkRq8mB6/AiYldXdL4Bd1fatPmM8M3y/GoqFhGPhgpWNOb
         j5d42CFUr2e0AenKtIz0rdXpA9uGJ/8U9xgbGSzZdNcQWuyaQDZGBx6Xw3i4+dF9bE7T
         Qy1+pcDmMIQ4lIdLrOFCA/xZOvLvpCPvTl1b8Ijv/hU+kbmAgi23RJbkL49I+TlYGWE8
         3AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628294; x=1686220294;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=dZsg9LiVrFT16ehvJwa7/89QWPIUUplI4bto/4YE2bNt12S+U3mC3RnufGfCAvF80d
         EwFB0p3oM79IPDY3Pa0CzSLB5mmSJAogfjyHLh/5kzIA8V0qoRt/QvSAotDYQCQEupDc
         FGwn4YoVohtduV29qwfqiAv/Tvd5jSLIixmXqT6a54FyaEUhKb5DyPiS3wQsVv+JmZUO
         aMOUEK+w8eMKGpBFJOUp+WNu4JpLUbaNDWvc2Edl5b3dZZzZsT2CV9eTEtKQGjUeMtX+
         U8AOBozSvm0weNo1Ho3+WeZ13XYSdWwsLGv3KULCSb6YR9jr5fMRBLoex7Qn51N3NT7a
         z4pw==
X-Gm-Message-State: AC+VfDzK7OKHYdWlj9+ioOG1nnjn7MBd6/U0pL7GfwDMhjdcX/mU7MTD
	Ihhky7wtojmRg5AUjjhZu5RqVV9/lbA/U1xzmqiSwPMH59nv9wlbHEFP0OO+7kZDHC8iAvwLwNP
	8SJxsIfQfrb1dfm4aNl+lXYMj1hCBPjTWxXjq+LVwPIv3SZUeRHLwoI3s14AJYxZqzZ+i2Ao3Xa
	mz+3aPRHGBj3kO
X-Google-Smtp-Source: ACHHUZ4qMeeZ2GYD3WyxVZJAhNSVOzTJFNxDda0VTV7c0dzyVvQQU0d7TOmaiGsDSfh2vGTJ6Aga6Q==
X-Received: by 2002:a17:902:ce8d:b0:1ac:2c8b:a0da with SMTP id f13-20020a170902ce8d00b001ac2c8ba0damr16876004plg.51.1683628294269;
        Tue, 09 May 2023 03:31:34 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:33 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v19 04/24] riscv: Add new csr defines related to vector extension
Date: Tue,  9 May 2023 10:30:13 +0000
Message-Id: <20230509103033.11285-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033137_776014_1D9596D1 
X-CRM114-Status: UNSURE (   8.88  )
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

Follow the riscv vector spec to add new csr numbers.

Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b6acb7ed115f..b98b3b6c9da2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,16 +24,24 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS		_AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF	_AC(0x00000000, UL)
+#define SR_VS_INITIAL	_AC(0x00000200, UL)
+#define SR_VS_CLEAN	_AC(0x00000400, UL)
+#define SR_VS_DIRTY	_AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
 #define SR_XS_CLEAN	_AC(0x00010000, UL)
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
+#define SR_FS_VS	(SR_FS | SR_VS) /* Vector and Floating-Point Unit */
+
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 #ifdef CONFIG_64BIT
@@ -375,6 +383,12 @@
 #define CSR_MVIPH		0x319
 #define CSR_MIPH		0x354
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
