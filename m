Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F7DC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzex8MTeNej+Xf932wHKboV2iqZ77NKVondmPbaR3M=; b=VkgzuV+TeJivcW
	aRXZtvdoih1y+MHAk8P7uJQRBdMBXKqNj8CBxIIJJhm0fOtJdyNgQKlPxW9lppGnBg41Elr3Os4wO
	MY+j/ViaPgbsPZWvfAEwARjNfcb8pDziKZSTH+YjTZVfl0EdqhD8kpTDjzOLIW9AyGbcWVW+V41SP
	jv5HBfisqUP24IMFdT+NwuuGx+Z3HSIBysu/9hXBqgWw8t384AdQidGfTDUEgVUlwasbDq2rz4Hzr
	ad6oK4vOwyavXFSSCykdeg6rqxRyr4t8QftYnXUtHAk6GAN7mIbqMI0OxAPcl6GoiW5Zc+hEkAsUs
	fHV/ulWd7QxDQrIet+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaCT-0000000Alcr-0dqD;
	Tue, 16 Apr 2024 04:13:41 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBB-0000000AkWl-3pdU
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:25 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6eb848b5a2eso782754a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240739; x=1713845539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=YRx+C0Plec5J1AcCkjxs/GYLiypdWbFHbaS9/WoHHTXzs55VYVIyFHBblmGMsAXlJ7
         r2rkXiuiDbpAxHbI7WAyi8t+SsMGAavUj0cydZttXzNWqXY74mPamMB1kJ3X8fPB+02u
         2P12p9HcXX9w6LIGhzjd2aYIqxGmyOgNJh0jYjCLFsBuNZ+6bZKlvKK9oXCX9rHzsTL3
         xPlzAR4mjMHblm0O1Q7VgR9H4v2ophvjrNV1Q3Ay7+Zu/VyHoC8Nv9CYWevuYhAL4q98
         CjRmAgQDy5pXcjkaADXFVfJkBMQXTP+X2trdEUkCqsRmtDHkQUjUF5lN5Bap+CggH/9s
         PHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240739; x=1713845539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=QBG1lIY9EAhvBFNI9lKJItDUW/58ZeC6E5OGMg7I/jH4E1kYdZoxxQi3DPe49yeN7+
         fn72ZFgCiVVXugzesHzeaJ1DaYam6libID7r3t6ouquKldakdttlnmYeALa6m7e6Oufg
         FKGXaFpGdT7fngWrDeYG0ynqoCsbKtTL5Hof0QC63h8mz4IwP6buKis19KARSFlQLtiH
         B+M47rR5YZK2v0C0i4rgcbY1DbevknZBePDbI9MDU/EVREvLgz1dPa3eE9gcu5MjNobg
         53pX8H8voVlcTcESa88wGJBrHdyR11Iivtz6LnB7t8JNprExBVn+etPo9U/avODTXptf
         Uctg==
X-Gm-Message-State: AOJu0YyhObSuCCF7OU80lnRv03VLbAAeW4UUFCd3jwehgeSsjfcVD9gh
	p/alQ0lB/Krskkq7eZhHVNuD1Yfpcr5eQ1kTz447KKFstx0OCKLHRWNEqgds3YKvKvGsNbvV8bl
	9
X-Google-Smtp-Source: AGHT+IFNWU9CebDAHIM2aIAM6rLVSvNJ/hrQCBnmGjLqT75ItU9fq2F3GA/ekORi1awzAiDhiP22NQ==
X-Received: by 2002:a05:6871:1c8:b0:22e:c2f7:1116 with SMTP id q8-20020a05687101c800b0022ec2f71116mr13338643oad.13.1713240739236;
        Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:08 -0700
Subject: [PATCH v2 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-11-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=3n67e3FD9DqnFP7FKjCt1L6NZMd+vBdPmua297IaBixuIX0cg2gLuR2SpqAcKm34Fv/rCrkUV
 RSpsPRdvYKgDA6f5D8F2uvwawZAD4aRtLFgcjUvk86YSBvc93fYMyCZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211222_160506_4CE94280 
X-CRM114-Status: UNSURE (   8.63  )
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
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
