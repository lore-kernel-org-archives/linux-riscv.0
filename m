Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36726C07C79
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBQEXoc4ajh40sfJsJ/iyzbXkQbqZDySM1u/CKUuQuw=; b=LB+F/ixTMU3Vnj
	sQk/Z7ZghV4OGHNhRZcUkKHMa7ZZCfckaApAIQRHa6RqyYo45u5Qokud0zRG7wVul65TfLOmVidyY
	D/MQFs6sfVxetj2l+ewxEhsfg4FMIZfef3OD6IxNGd0zXDQ9vbApr9HVmKeqrefgJZKvOQg32A0bh
	kmlScjHVMt6TcaqZQO/Pm86j296+NIvNTN0ElZKPvyQVmwi2+NA70vJR5Iw747o7ED5sNw/7JqZpZ
	3IPADJe9MwDBjbH3yDR+5KxqQ9GPM/E9Ea+xCCrBCZQ/G8sECwlGW300fpMmPHpaGExtGzbER87XY
	GMBv+OBCbQ6XD43E6RjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLeN-00000009WSB-1RR5;
	Sun, 21 Apr 2024 01:05:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLda-00000009VpD-0k1p
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:04:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ee0642f718so3065899b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661497; x=1714266297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=pzunKNeaxCVelgKTrGv+UZZeEHR7AsQdqUdIOXDrCtJEXUEQIgufqX9W4ZuMe9oVq1
         b07h3TsdZaOiqMq4qsY6hLLyU7WPh0rWo3/VoxyibxSqNft+JYSMssJjM5EfA0xXFIaT
         SmCd6eC84WC7/twpuQLC0lhZ51h5OrTKvpoBR0FbV4ggB+bYYO6QUw/MWblMvy/zhADN
         oFNg4awg0+4BghoKOTiODtJW5l9g7rkyrcw0eIkbZNDHcbht3cF/v7jICVF6FApGB8U0
         faojhQleKWYL+0+gWnuCOPh/COcIzHMwmdfctRlwJ8aza3xK19oOMxR0J6P7pOjnRTzl
         Rs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661497; x=1714266297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=ccY/Lc5I1FUpWYX6SROWHzN0W/pjYeYoGpeQprYfLitpjhFg0oMn/pgfchOds5KxMV
         kfbmR5fEVzjYz/1FPwGiYktSHHxZ7mnvOrxZLnaBkE+t+q5UVFJsLUPlvvXpc1E4Upmh
         nS2tfrFITT6bwS/YvQlHf8dOOPup+cxiljNeO8b/GuKOPYCfYQNE/iNRwhU5VnrOg1iX
         KQmYGzLfYrlfrgMpRmoYxbX9G4u0JtP0CBhxJSjkbXdPALnR5AoOGS71GfThEMNmMANc
         +JC+u95BlgZXayBMRZ+1TAw60g2+1HMV1g5CNF9hJWTlD/S3yx4fl6ggVOA7NDfZNUcc
         Dd+g==
X-Gm-Message-State: AOJu0YyaZTu+5KlazpfOe6zslqCUkgeypJemqe3v1ab6Q1jAwC8ZXfaI
	NQaU86/+rhdrHoP7GIwGmypq3N/++w3UwOA/5ODlD9T2MEKu0imxEWtisAXqh0zTQYXEgqqnGem
	p
X-Google-Smtp-Source: AGHT+IFWaA66MVhFHzVqeH6ER04Jg35UlWbtwP1v2a6tYCwe6/lLPPzjlT26aXgRHK+BXdqOBFuWwQ==
X-Received: by 2002:a05:6a21:7884:b0:1ac:efd3:4d87 with SMTP id bf4-20020a056a21788400b001acefd34d87mr3420884pzc.19.1713661497028;
        Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:38 -0700
Subject: [PATCH v3 06/17] riscv: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1065;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QiQI1i7vjXBhs46HZcfDGYtUbq5szs9hkhXvkNVDIxw=;
 b=+3zc6q0i2BsAtbDQT7K3i0HV2YRODdQ7IkaZd+LvMW/ig/YqGy1avCBI4l0spwFxEKlLUSKKu
 xWM1me9URmJCN4CloLYVBR+5P4yAUklVAjXSfYEk8uxaiWkJDMFr8fd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180458_364594_A11A6FDB 
X-CRM114-Status: GOOD (  11.95  )
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

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 48874aac4871..b537731cadef 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
