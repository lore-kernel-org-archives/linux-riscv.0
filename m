Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB63C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wKwrLcFwyUZ+gRtqqvPnkMBCIGBPb4zRTfFMAiAy2I=; b=APPmS6Z7QLrvpc
	cr70ZUWuBHSkbtX80G4KPyoLVO1JyzjH4OGQiy3TX5ecc5c7+7t+xobITCl+3O4n3AJJbrMnQWpsk
	FbUhQhd/em4zeEIrthU/MmjJ1Tsbuq6iap4k/Wp0dttV4wjaMFSdJTZH+clCwrrskadvOqOrL+CJL
	++kkB166lqC+agST3brvQs5cJacmqrV+q+y/FQYmzGjvxnAcxPXwx2Lwkqu7+u9cFLFlUR9jy/FuE
	GaFq4F38BTMwNS0unowSI32pwHSQJqZ7/RgFcx0ICn51VhKHCrYxUAlwwmKLKY+WB/NWY6I2i1oUz
	PY6AYXvdBM0Exxcj3mpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TFp-0000000E60r-3H4L;
	Fri, 26 Apr 2024 21:37:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TFm-0000000E5zM-332d
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:37:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e50a04c317so15367525ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167429; x=1714772229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=CBxcECFW+ES635FU2VqQnLLraBmN/lNEBF2fiarvL3JZpCGgPz9cVgfTOhbEpsBsOu
         7zyHiHNazZZTZt2M8lhGZj8pIP0UF7iJyyduVHbtocTBvMLE97nApWtsdwCxahEX+ckw
         Qi4I0OC6zwGWdwY4uM8rwpC5HgexTFKHjYk/u2vCurdAMLfE8qz4GAsfRnUrlhBnybbA
         MCylxtCWiLcYk9r7RAhxRvzFJrWjmW0PN1avre9Rgqe7xLRGMRoxOTmBlN5BP7epBjiB
         gaKHbIuJ2sUooO87azXpj+tu8cT6DjsQTfJi61+2ezDXZyY30sDRn7xKhfvVUkBKo1r1
         3gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167429; x=1714772229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=S3TYD00R3h0Xkw2Ha498fB8nI4i36NdJBueefCXWgBbxqt6n3JiGGqQgRaIg8LqXpa
         3g7Z54dfO5Jaj/0DCZxHiGWsUYGvmcsyYDaSAsGgPRk3BOSOU+RDGevA0ZByMN3YyzMq
         pYcmH/guRp9t5zrI02AdlT+zO//aoCeXqG5QCWvo6t/qBbGYQDCKUniXSTVzlzwOmQgv
         Elcv3nwqURZftiduijlsjC+GoBr8JPtaoeO1/ZiJ4F+L4uPuJAIaYYmR/b8oj7yihguM
         aR3DhtVpUDK4KEaFDzVGMqBHSdEYYjhP3yVxMGJlh7Crk88nZWZkcBJhDh7ylwCFpcfH
         uplQ==
X-Gm-Message-State: AOJu0YzWJnEasfH8fL0TFD10KBOtZAmK1HLhCMmtnxoEd9zHUZ0hXRU6
	mPF/h3kTgfAPCs0We2Jg5iH+MQQdMr6hsz6FYQjUWYdyNfF8qrcrKt33jQE02eUdCK83HHD0Ew2
	U
X-Google-Smtp-Source: AGHT+IHl0deFI+kKqJJSXtEo4lw1f4JLDe4eTcjXBFfcgornPJnmm+jN4W99Vb/Ph2g2fe8Xsa+lCQ==
X-Received: by 2002:a17:902:f684:b0:1eb:51a4:3685 with SMTP id l4-20020a170902f68400b001eb51a43685mr382124plg.52.1714167428813;
        Fri, 26 Apr 2024 14:37:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:04 -0700
Subject: [PATCH v4 09/16] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-9-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=+Ym/PXnw1qoA/TfJUg74ll2FQ3kDna0sfz28N0zMDelkAV0Bsm9v3B7NR0DImwTgQCifbv+07
 7SqQy9BhbS9DwC8AiBlZXnX+89Wsr6daBED+F73ctZ18G6TF8mNQWu/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_143710_771300_5113A5DD 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
